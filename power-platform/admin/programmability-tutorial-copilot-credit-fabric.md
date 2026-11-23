---
title: "Tutorial: Land Copilot Credit Usage Reports in a Microsoft Fabric Lakehouse (preview)"
description: Land Copilot Credit usage reports in a Fabric lakehouse every day with Power Automate and a notebook. Build long-term history beyond 30 days. Start the tutorial.
ms.date: 11/23/2026
ms.topic: tutorial
ms.reviewer: ellenwehrle
ms.contributors: joshuapa
ms.component: pa-admin
author: gmosleymsft
ms.author: gmosley
ms.subservice: admin
ai-usage: ai-assisted
search.audienceType:
  - admin
---

# Tutorial: Land Copilot Credit usage reports in a Microsoft Fabric lakehouse (preview)

[!INCLUDE [cc-preview-features-top-note](../includes/cc-preview-features-top-note.md)]

[!INCLUDE [cc-preview-features-standard-important-note](../includes/cc-preview-features-standard-important-note.md)]

Learn how to collect Copilot Credit usage reports every day with a Power Automate cloud flow, write each report to a Microsoft Fabric lakehouse, and publish the results to Delta tables with a Fabric notebook.

The Copilot Credit usage reports API gives you the same Copilot Credit entitlement and consumption data that's available in the Power Platform admin center, but the reports cover only a rolling 30-day window. When you land each day's report in a lakehouse, you build a long-term history that you can query with SQL, join to other data, and report on in Power BI.

In this tutorial, you learn how to:

- Create a scheduled cloud flow that requests, polls, and downloads both Copilot Credit usage reports.
- Write each report and a small manifest file to OneLake.
- Send an email alert when a report doesn't land.
- Validate the files and publish them to Delta tables with a Fabric notebook.
- Schedule the flow and the notebook so the pipeline runs unattended.

> [!IMPORTANT]
>
> The usage reports API is in public preview. Sovereign clouds aren't currently supported.

## How the solution works

The usage reports API accepts only delegated (user) authentication; it doesn't support application-only (service principal) tokens. A Fabric notebook or pipeline that runs unattended can't call the API by itself, but a Power Automate flow that runs on a user connection can. So the flow collects the reports, and Fabric stores and transforms them.

| Stage | Component | What it does |
| --- | --- | --- |
| Schedule | Recurrence trigger | Runs the flow daily at 06:00 UTC. |
| Date window | Two **Compose** actions | Selects the previous 30 complete UTC days, ending yesterday. |
| Request | **Generate Licensing Report** | Submits both reports in parallel branches. |
| Wait | **Do until** loop | Polls the operation every five minutes until it's no longer `Running`. |
| Download | **Download Licensing Report File** | Retrieves the report as CSV. |
| Land | **HTTP with Microsoft Entra ID (preauthorized)** | Creates a `.csv` file and a `.manifest.json` file in OneLake. |
| Alert | **Condition** and **Send an email (V2)** | Emails the flow owner if either report didn't land. |
| Transform | Fabric notebook | Validates, deduplicates, and publishes the data to Delta tables. |
| Schedule | Notebook schedule | Runs daily at 09:00 UTC, three hours after the flow. |

The tutorial collects both reports at **Daily** granularity:

| Report | Grain | Date column | Delta table |
| --- | --- | --- | --- |
| `BillingDetailsPerEnvironment` | Environment, entitlement, and billing policy per day, including prepaid and pay-as-you-go consumption | `BilledDate` | `studio_environment_daily` |
| `FeatureDetailsPerResource` | Agent or resource, product, feature, channel, model, and related dimensions per day | `ConsumptionDate` | `studio_feature_daily` |

Totals for recent days can change as late data arrives. That's why each run requests the full 30-day window again, and the notebook replaces those dates instead of appending them. The raw files you keep in the lakehouse become your long-term history.

## Prerequisites

| Requirement | Details |
| --- | --- |
| Admin role | The account that signs in to the **Power Platform for Admins V2** connection needs one of these roles: Global Administrator, Power Platform Administrator, or Dynamics 365 Administrator. Otherwise, every report action returns 403. |
| User connection | Create the **Power Platform for Admins V2** connection with the **OAuth Connection** authentication type. The connector supports service principals for many actions, but this API rejects application-only tokens. |
| Power Automate license | A Premium license for the flow owner, because **HTTP with Microsoft Entra ID (preauthorized)** is a premium connector. |
| Data policy | The environment's data loss prevention (DLP) policy must allow **Power Platform for Admins V2** and **HTTP with Microsoft Entra ID (preauthorized)** in the same group. |
| Fabric workspace | A workspace on Fabric capacity (F SKU or trial) with a lakehouse. The account behind the OneLake connection needs the **Contributor** role or higher on the workspace. |
| OneLake external access | The Fabric tenant setting **Users can access data stored in OneLake with apps external to Fabric** must be turned on. |
| Usage | Copilot Credit consumption in your tenant during the selected time range. |

## Step 1: Prepare the lakehouse

1. In Fabric, open your workspace and create a lakehouse, or open an existing one. This tutorial uses a lakehouse named `lh_ai_finops`.
1. Under **Files**, create this folder structure:

   ```
   Files/raw/copilot_studio/environment/daily
   Files/raw/copilot_studio/feature/daily
   ```

   The notebook creates the `processed` folders when it archives files. If you have report files that you downloaded earlier directly from the API, put them in `environment/backfill` and `feature/backfill` folders.
1. Note the workspace ID and lakehouse ID. Both GUIDs appear in the browser address when the lakehouse is open: `https://app.fabric.microsoft.com/groups/<workspace-id>/lakehouses/<lakehouse-id>`.

   The flow writes files to the OneLake DFS endpoint, not the browser address:

   `https://onelake.dfs.fabric.microsoft.com/<workspace-id>/<lakehouse-id>/Files/raw/copilot_studio`

File names follow this pattern: report name, start date, end date, and a 32-character hexadecimal identifier. For example, `BillingDetailsPerEnvironment_2026-10-19_2026-11-17_abcdef0123456789abcdef0123456789.csv`. The notebook reads the date window from the file name, so keep this pattern.

> [!TIP]
>
> When you copy the path, check that no backslash appears before the underscore in `copilot_studio`. Some copy and paste paths add one, and the flow then returns 404.

## Step 2: Create the flow and the date window

1. Sign in to [Power Automate](https://make.powerautomate.com) and select **Create** > **Scheduled cloud flow**.
1. Name the flow **Copilot Credit reports to Fabric**, set it to repeat every **1 Day**, set the start time to 06:00 UTC, and then select **Create**.
1. Add two **Compose** actions and enter each value as an expression:

   | Action name | Expression |
   | --- | --- |
   | startDate | `formatDateTime(addDays(utcNow(),-30),'yyyy-MM-dd')` |
   | endDate | `formatDateTime(addDays(utcNow(),-1),'yyyy-MM-dd')` |

1. Under **endDate**, add a parallel branch. The billing branch runs on the left, and the feature branch runs on the right.

> [!IMPORTANT]
>
> Expressions refer to actions by name, with spaces replaced by underscores. Rename each action as you add it, before any expression refers to it.
>
> Enter every expression in the expression editor (**fx**) so that it appears as an expression token. Text that you type or paste directly into a field is sent as a literal string. This text was the most common cause of failures while this solution was built. Header values work the same way: enter `'application/octet-stream'` or `'application/json'` as an expression, not from the suggestion list, and confirm them in code view.

## Step 3: Request the report

In the billing branch, add the **Power Platform for Admins V2** > **Generate Licensing Report** action and rename it **Billing Report Request**. When prompted, create the connection by using the **OAuth Connection** authentication type and sign in with an account that has one of the required roles.

| Parameter | Value |
| --- | --- |
| Api-version | `2024-10-01` |
| Report Name | `BillingDetailsPerEnvironment` |
| startDate | **Outputs** of **startDate** |
| endDate | **Outputs** of **endDate** |
| granularity | `Daily` |

Hover over each **Outputs** token to confirm that the start and end dates aren't swapped. A swap returns 400.

### Handle a report that already exists

When you request a date range that was already generated, the `Location` header can point directly to the finished file (`/files/...`) instead of an operation (`/operations/...`). Add these three actions so the flow detects that case and skips polling:

| Action name | Type | Setting |
| --- | --- | --- |
| Billing Location | **Compose** | `outputs('Billing_Report_Request')?['headers']?['Location']` |
| Billing Is File | **Compose** | `contains(outputs('Billing_Location'), '/files/')` |
| Billing Needs Polling | **Condition** | **outputs('Billing_Is_File')** is equal to the expression `false` |

## Step 4: Poll until the report is ready

1. In the **True** branch of **Billing Needs Polling**, add **Control** > **Do until** and rename it **Billing Wait For Report**. Leave the **False** branch empty.
1. In advanced mode, set the loop condition and limits:

   | Setting | Value |
   | --- | --- |
   | Loop until | `@not(equals(body('Billing_Poll_Status')?['status'], 'Running'))` |
   | Count | `30` |
   | Timeout | `PT3H` |

1. Inside the loop, add these actions in order:

   | Action name | Type | Setting |
   | --- | --- | --- |
   | Billing Poll Status | **Get Licensing Report Operation Status** | **Report Name**: `BillingDetailsPerEnvironment`. **Operation Id**: `last(split(first(split(outputs('Billing_Location'), '?')), '/'))` |
   | Billing Wait If Running | **Switch** | **On**: `body('Billing_Poll_Status')?['status']` |
   | Case Running | **Switch case** | Equals `Running` (case-sensitive) |
   | Delay | **Schedule** > **Delay** | Inside the **Running** case. **Count**: `5`. **Unit**: **Minute** |

The loop runs its body before it checks the condition, so the first poll happens immediately. The delay applies only while the report is still running. Use **Delay**, not **Delay until**, which waits for a timestamp.

> [!NOTE]
>
> The status endpoint returns 200 OK even while the report is generating. The loop checks the `status` value in the response body, not the HTTP status code.

### Check that the report is ready

Below **Billing Needs Polling**, add **Control** > **Condition** outside the condition, and rename it **Billing Report Ready**.

| Setting | Value |
| --- | --- |
| Group operator | **Or** |
| Row 1 | Expression `body('Billing_Poll_Status')?['status']` is equal to `Succeeded` (plain text) |
| Row 2 | Expression `outputs('Billing_Is_File')` is equal to the expression `true` |
| Run after (**Settings**) | **Billing Needs Polling**: **is successful**, **has failed**, **is skipped**, **has timed out** |

Delete any empty rows. Enter `true` in row 2 as an expression; typed text is compared as a string and never matches. Leave the **False** branch empty. The alert in [Step 8](#step-8-alert-when-a-report-doesnt-land) handles failures in both branches.

## Step 5: Download the report and write it to OneLake

In the **True** branch of **Billing Report Ready**, add these four actions in order.

1. **Billing Download File**: **Power Platform for Admins V2** > **Download Licensing Report File**.

   | Parameter | Value |
   | --- | --- |
   | Api-version | `2024-10-01` |
   | Report Name | `BillingDetailsPerEnvironment` |
   | File Name | `if(outputs('Billing_Is_File'), last(split(first(split(outputs('Billing_Location'), '?')), '/')), body('Billing_Poll_Status')?['fileName'])` |

   The API serves gzip-compressed CSV, but this connector action returns the content already decompressed. Depending on the run, it returns either an object with base64 `$content` or a plain string. The upload step in this procedure handles both.
1. **Billing File Path**: **Compose**, with this expression:

   ```
   concat('https://onelake.dfs.fabric.microsoft.com/<workspace-id>/<lakehouse-id>/Files/raw/copilot_studio/environment/daily/BillingDetailsPerEnvironment_', outputs('startDate'), '_', outputs('endDate'), '_', replace(guid(), '-', ''), '.csv')
   ```

   The identifier comes from `guid()`, so the name is valid whether or not the report was polled. The name ends in `.csv` because the connector returns decompressed CSV.
1. **Billing Create File**: **HTTP with Microsoft Entra ID (preauthorized)** > **Invoke an HTTP request**.

   | Field | Value |
   | --- | --- |
   | Method | `PUT` |
   | Url of the request | `concat(outputs('Billing_File_Path'), '?resource=file')` |
   | Body | Leave empty. |

   The first time you add this action, create the connection:

   | Connection field | Value |
   | --- | --- |
   | Base Resource URL | `https://onelake.dfs.fabric.microsoft.com` |
   | Microsoft Entra ID Resource URI | `https://storage.azure.com` |
   | Sign in | An account with **Contributor** or higher on the workspace |

   Use this connection for every OneLake action in the flow. Don't reuse an HTTP connection that's configured for a different resource; it returns BadRequest.
1. **Billing Upload Content**: same connector and connection.

   | Field | Value |
   | --- | --- |
   | Method | `PATCH` |
   | Url of the request | `concat(outputs('Billing_File_Path'), '?action=append&position=0&flush=true')` |
   | Header | `Content-Type`: the expression `'application/octet-stream'` |
   | Body | The expression that follows this table |

   ```
   if(startsWith(string(body('Billing_Download_File')),'{'), base64ToBinary(json(string(body('Billing_Download_File')))?['$content']), if(startsWith(string(body('Billing_Download_File')),'H4sI'), base64ToBinary(body('Billing_Download_File')), body('Billing_Download_File')))
   ```

   The expression handles an object with base64 `$content`, a gzip-compressed base64 string (which starts with `H4sI`), and plain text.

## Step 6: Write a manifest file

A manifest records where each data file came from, which helps when you troubleshoot or audit a load. After **Billing Upload Content**, add four more actions.

1. **Billing Manifest**: **Compose**. Type the JSON, and insert each `@{...}` value with the expression editor:

   ```
   {
     "report_name": "BillingDetailsPerEnvironment",
     "tenant_id": "<your-tenant-id>",
     "start_date": "@{outputs('startDate')}",
     "end_date": "@{outputs('endDate')}",
     "granularity": "daily",
     "api_file_name": "@{<the File Name expression from Billing Download File>}",
     "lakehouse_path": "@{outputs('Billing_File_Path')}",
     "report_source": "@{if(outputs('Billing_Is_File'), 'existing', 'generated')}",
     "flow_run_id": "@{workflow()?['run']?['name']}",
     "written_at_utc": "@{utcNow()}"
   }
   ```
1. **Billing Manifest Path**: **Compose**, with the expression `replace(outputs('Billing_File_Path'), '.csv', '.manifest.json')`.
1. **Billing Manifest Create File**: same as **Billing Create File**, with the URL `concat(outputs('Billing_Manifest_Path'), '?resource=file')`.
1. **Billing Manifest Upload**: same as **Billing Upload Content**, with these changes:

   - URL: `concat(outputs('Billing_Manifest_Path'), '?action=append&position=0&flush=true')`
   - `Content-Type`: the expression `'application/json'`
   - Body: `string(outputs('Billing_Manifest'))`

> [!WARNING]
>
> In code view, check that the manifest path ends in `.manifest.json`. The `replace` target must match the end of the file path exactly. If it doesn't, nothing is replaced, the manifest path equals the data file path, and the manifest overwrites the CSV file. Also check that no stray character, such as `]`, follows an expression token in the **Compose** action.

## Step 7: Build the feature branch

Repeat steps 3 through 6 in the parallel branch with these substitutions:

| Item | Feature value |
| --- | --- |
| Action name prefix | `Feature` (for example, **Feature Report Request** and **Feature Poll Status**) |
| Report Name (all three report actions) | `FeatureDetailsPerResource` |
| Expressions | Replace every `Billing_` reference with `Feature_`. |
| Lakehouse folder | `Files/raw/copilot_studio/feature/daily` |
| File name prefix | `FeatureDetailsPerResource_` |

The **Feature File Path** expression:

```
concat('https://onelake.dfs.fabric.microsoft.com/<workspace-id>/<lakehouse-id>/Files/raw/copilot_studio/feature/daily/FeatureDetailsPerResource_', outputs('startDate'), '_', outputs('endDate'), '_', replace(guid(), '-', ''), '.csv')
```

## Step 8: Alert when a report doesn't land

1. Below the two parallel branches, add **Control** > **Condition** and rename it **Both Files Landed**.
1. In **Settings**, under **Run after**, select **Billing Report Ready** and **Feature Report Ready**. For each one, select **is successful**, **has failed**, **is skipped**, and **has timed out**, so the check runs even when a branch fails.
1. Add two rows joined with **And**:
   - Expression `actions('Billing_Upload_Content')?['status']` is equal to `Succeeded`
   - Expression `actions('Feature_Upload_Content')?['status']` is equal to `Succeeded`
1. Leave the **True** branch empty. In the **False** branch, add:
   1. **Office 365 Outlook** > **Send an email (V2)**, addressed to the flow owner, with the run details.
   1. **Control** > **Terminate**, with **Status** set to **Failed**, so the run appears as failed in the run history.

## Step 9: Test the flow

Save the flow, and then select **Test** > **Manually**. A run normally takes 5 to 20 minutes.

| Action | Expected result |
| --- | --- |
| Report Request | 202 |
| Wait For Report | Ends with status `Succeeded`, or is skipped when the file already exists |
| Download File | 200 |
| Create File | 201 |
| Upload Content | 200 or 202 |
| Lakehouse | A `.csv` file and a matching `.manifest.json` file in each `daily` folder |

Open each `.csv` file in the lakehouse. The first line should be a header row: `BilledDate,BillingPlatform,...` for the environment report and `ConsumptionDate,BillingPlatform,...` for the feature report. If a file starts with `{`, the manifest overwrote it. Check the manifest path from [Step 6](#step-6-write-a-manifest-file).

## Step 10: Create the ingestion notebook

In your workspace, create a notebook named `nb_copilot_studio_ingest` and add your lakehouse as its default lakehouse. Add the following cells in order.

| Cell | Purpose |
| --- | --- |
| Parameters | `SOURCE` (`daily` or `backfill`) and `ARCHIVE_PROCESSED` |
| 1 | Imports and settings |
| 2 | Find, read, and standardize the report files |
| 3 | Check date coverage and keep the newest file per date |
| 4 | Validate the tenant and numeric columns |
| 5 | Check for duplicate groups |
| 6 | Review daily totals |
| 7 | Publish to Delta tables |
| 8 | Archive processed daily files |
| 9 | Check the published tables |

### Parameter cell

Add this cell, and then select **...** > **Toggle parameter cell** so a pipeline or schedule can override the values.

```
SOURCE = "daily"           # "daily" for scheduled runs, "backfill" for a one-time historical load
ARCHIVE_PROCESSED = True   # move files to /processed/ after a successful publish
```

### Cell 1: Settings and imports

Replace `<your-tenant-id>` with your tenant ID in lowercase.

```
import re
import uuid
from datetime import date
from pyspark.sql import functions as F, Window

# ---- Run settings ----
TENANT_ID = "<your-tenant-id>"  # lowercase GUID
BASE_PATH = "Files/raw/copilot_studio"

ENV_TABLE = "studio_environment_daily"
FEATURE_TABLE = "studio_feature_daily"

spark.conf.set("spark.sql.session.timeZone", "UTC")
print(f"Source: {SOURCE} | Archive after publish: {ARCHIVE_PROCESSED}")
```

### Cell 2: Find, read, and standardize the report files

The files that the connector returns use different column names than files you download directly from the API. This cell maps both formats to one schema. It also stops the run if a file name doesn't match the expected pattern, a `.gz` file isn't gzip-compressed, or a `.csv` file holds JSON (a sign that the manifest overwrote it).

```
# Find, read, and standardize the report files
FILE_RE = re.compile(r"_(\d{4}-\d{2}-\d{2})_(\d{4}-\d{2}-\d{2})_[0-9a-fA-F]+\.csv(\.gz)?$")

# The connector's daily files use different headers from the backfill files.
# Map both to one set of names (the environment report keeps the existing table's names).
ENV_RENAMES = {
    "TenantID": "TenantId",
    "EnvironmentID": "EnvironmentId",
    "EntitlementID": "EntitlementId",
    "AllocatedCapacityPackCredits": "EntitledQuantity",
    "CapacityPackCreditsConsumed": "PrepaidConsumedQuantity",
}
ENV_EXTRA = ["BillingPlatform", "EnvironmentType"]

FEATURE_RENAMES = {
    # backfill headers
    "Agent Name": "agent_name", "Agent Id": "agent_id", "Product": "product",
    "AI Feature/Billable Feature": "ai_feature", "Billed credit": "billed_credit",
    "Non-billed credit": "non_billed_credit", "Channel": "channel",
    "Knowledge Sources": "knowledge_sources", "Tool Used": "tool_used",
    "LLM Model": "llm_model", "Scenario Name": "scenario_name",
    "Environment Id": "environment_id", "Environment Name": "environment_name",
    "Consumption Date": "consumption_date",
    # daily (connector) headers
    "ResourceName": "agent_name", "ResourceID": "agent_id", "Feature": "ai_feature",
    "BilledCredits": "billed_credit", "NonBilledCredits": "non_billed_credit",
    "KnowledgeSources": "knowledge_sources", "ToolUsed": "tool_used",
    "LLMModel": "llm_model", "ScenarioName": "scenario_name",
    "EnvironmentID": "environment_id", "EnvironmentName": "environment_name",
    "ConsumptionDate": "consumption_date", "BillingPlatform": "billing_platform",
    "EnvironmentType": "environment_type", "ResourceType": "resource_type",
    "HarnessType": "harness_type",
}
FEATURE_EXTRA = ["billing_platform", "environment_type", "resource_type", "harness_type"]


def find_report_files(folder):
    paths = []
    for item in notebookutils.fs.ls(folder):
        if item.isDir:
            paths.extend(find_report_files(item.path))
            continue
        name = item.name.lower()
        if not (name.endswith(".csv") or name.endswith(".csv.gz")):
            continue                      # skips .manifest.json and anything else
        if item.size == 0:
            raise ValueError(f"Empty report file: {item.path}")
        if not FILE_RE.search(item.name):
            raise ValueError(f"Unexpected file name (check the flow's File Path): {item.path}")
        # Guard: a data file that holds JSON means the manifest overwrote it
        if not name.endswith(".gz"):
            head = notebookutils.fs.head(item.path, 200).lstrip()
            if head.startswith("{"):
                raise ValueError(
                    f"Data file contains JSON, not CSV (manifest overwrite?). "
                    f"Quarantine it and check the flow's Manifest Path: {item.path}"
                )
        if name.endswith(".gz"):
            local = "/lakehouse/default/Files/" + item.path.split("/Files/", 1)[1]
            with open(local, "rb") as f:
                if f.read(2) != b"\x1f\x8b":
                    raise ValueError(f"Named .gz but not gzip (rename it to .csv): {item.path}")
        paths.append(item.path)
    return sorted(paths)


def file_window(paths):
    spans = [FILE_RE.search(p).groups()[:2] for p in paths]
    return min(s for s, _ in spans), max(e for _, e in spans)


def standardize(df, renames, extras):
    for old, new in renames.items():
        if old in df.columns and old != new:
            df = df.withColumnRenamed(old, new)
    for c in extras:
        if c not in df.columns:
            df = df.withColumn(c, F.lit(None).cast("string"))
    return df


def read_report(folder, renames, extras):
    paths = find_report_files(folder)
    if not paths:
        raise ValueError(f"No report files found in {folder}. Check that the flow ran.")

    print(f"Reading {len(paths)} file(s) from {folder}:")
    for p in paths:
        print("  ", p)

    df = (
        spark.read
        .option("header", "true")
        .option("inferSchema", "false")
        .option("multiLine", "true")
        .option("mode", "FAILFAST")
        .csv(paths)
    )
    df = standardize(df, renames, extras)
    df = (
        df.withColumn("_source_file", F.input_file_name())
        .withColumn(
            "_file_end",
            F.to_date(F.regexp_extract(
                "_source_file",
                r"_\d{4}-\d{2}-\d{2}_(\d{4}-\d{2}-\d{2})_[0-9a-fA-F]+\.csv(\.gz)?$",
                1,
            )),
        )
    )
    return df, paths, file_window(paths)


environment, environment_paths, env_window = read_report(
    f"{BASE_PATH}/environment/{SOURCE}", ENV_RENAMES, ENV_EXTRA
)
feature, feature_paths, feat_window = read_report(
    f"{BASE_PATH}/feature/{SOURCE}", FEATURE_RENAMES, FEATURE_EXTRA
)

expected_windows = {"environment": env_window, "feature": feat_window}

print("Environment columns:", environment.columns)
print("Feature columns:", feature.columns)
print("Environment records:", environment.count(), "| window:", env_window)
print("Feature records:", feature.count(), "| window:", feat_window)
```

The column mapping:

| Report | Connector header | Direct API header | Published column |
| --- | --- | --- | --- |
| Environment | `TenantID`, `EnvironmentID`, `EntitlementID` | `TenantId`, `EnvironmentId`, `EntitlementId` | `TenantId`, `EnvironmentId`, `EntitlementId` |
| Environment | `AllocatedCapacityPackCredits` | `EntitledQuantity` | `EntitledQuantity` |
| Environment | `CapacityPackCreditsConsumed` | `PrepaidConsumedQuantity` | `PrepaidConsumedQuantity` |
| Environment | `BillingPlatform`, `EnvironmentType` | Not present (left empty) | `BillingPlatform`, `EnvironmentType` |
| Feature | `ResourceName`, `ResourceID` | `Agent Name`, `Agent Id` | `agent_name`, `agent_id` |
| Feature | `Feature` | `AI Feature/Billable Feature` | `ai_feature` |
| Feature | `BilledCredits`, `NonBilledCredits` | `Billed credit`, `Non-billed credit` | `billed_credit`, `non_billed_credit` |
| Feature | `ConsumptionDate` | `Consumption Date` | `consumption_date` |
| Feature | `BillingPlatform`, `EnvironmentType`, `ResourceType`, `HarnessType` | Not present (left empty) | `billing_platform`, `environment_type`, `resource_type`, `harness_type` |

The feature report uses snake_case column names because Delta tables don't accept spaces or slashes in column names.

### Cell 3: Date coverage and newest file per date

Each daily file repeats the previous 30 days, so this cell keeps only the rows from the newest file for each date.

```
# Date coverage and newest file per date (accepts yyyy-MM-dd and M/d/yyyy dates)
def parse_date_expr(column):
    q = column.replace("`", "``")
    return F.expr(
        f"coalesce(try_cast(`{q}` AS DATE), "
        f"cast(try_to_timestamp(`{q}`, 'M/d/yyyy') AS DATE))"
    )


def check_date_coverage(df, date_column, start_date, end_date):
    first_day = date.fromisoformat(start_date)
    last_day = date.fromisoformat(end_date)
    if first_day > last_day:
        raise ValueError("Start date must not be after end date.")

    checked = df.withColumn("report_date", parse_date_expr(date_column))

    invalid_dates = checked.filter(F.col("report_date").isNull()).count()
    if invalid_dates:
        display(checked.filter(F.col("report_date").isNull()).select(date_column).distinct().limit(10))
        raise ValueError(f"{date_column}: {invalid_dates} records have missing or unrecognized dates.")

    outside_window = checked.filter(
        ~F.col("report_date").between(F.lit(first_day), F.lit(last_day))
    ).count()
    if outside_window:
        raise ValueError(f"{outside_window} records fall outside {start_date} through {end_date}.")

    if checked.limit(1).count() == 0:
        raise ValueError("Report contains no records. Do not publish it as zero consumption.")

    print(f"Actual coverage for {date_column}:")
    display(
        checked.agg(
            F.min("report_date").alias("first_returned_date"),
            F.max("report_date").alias("last_returned_date"),
            F.count("*").alias("records"),
            F.countDistinct("report_date").alias("dates_with_records"),
        )
    )

    requested_dates = spark.range(1).select(
        F.explode(F.sequence(F.lit(first_day), F.lit(last_day), F.expr("INTERVAL 1 DAY"))).alias("report_date")
    )
    print("Requested dates with no returned records:")
    display(
        requested_dates.join(checked.select("report_date").distinct(), "report_date", "left_anti")
        .orderBy("report_date")
    )
    return checked


def keep_latest_file_per_date(df):
    w = Window.partitionBy("report_date").orderBy(F.col("_file_end").desc(), F.col("_source_file").desc())
    return (
        df.withColumn("_file_rank", F.dense_rank().over(w))
        .filter(F.col("_file_rank") == 1)
        .drop("_file_rank")
    )


environment_checked = keep_latest_file_per_date(
    check_date_coverage(environment, "BilledDate", *expected_windows["environment"])
)
feature_checked = keep_latest_file_per_date(
    check_date_coverage(feature, "consumption_date", *expected_windows["feature"])
)
```

### Cell 4: Tenant and numeric validation

```
# Tenant and numeric validation
def require_columns(df, columns):
    missing = sorted(set(columns) - set(df.columns))
    if missing:
        raise ValueError(f"Missing required columns: {missing}")


def validate_credit_columns(df, columns, optional_columns=()):
    result = df
    optional_columns = set(optional_columns)
    for name in columns:
        q = name.replace("`", "``")
        parsed = F.expr(f"try_cast(`{q}` AS DECIMAL(28, 8))")
        is_blank = F.col(f"`{name}`").isNull() | (F.trim(F.col(f"`{name}`")) == "")
        invalid = (~is_blank) & parsed.isNull()
        if name not in optional_columns:
            invalid = invalid | is_blank
        bad = result.filter(invalid).count()
        if bad:
            raise ValueError(f"{name}: {bad} missing or invalid quantities.")
        result = result.withColumn(name, parsed)
    return result


# ---- Environment report ----
require_columns(environment_checked, [
    "TenantId", "EnvironmentId", "EnvironmentName", "EntitlementId", "BillingPolicyId",
    "EntitledQuantity", "PrepaidConsumedQuantity", "PayGoConsumedQuantity",
    "BilledDate", "_source_file",
])

wrong_tenant = environment_checked.filter(
    F.col("TenantId").isNull() | (F.lower(F.trim(F.col("TenantId"))) != F.lit(TENANT_ID))
).count()
if wrong_tenant:
    raise ValueError(f"{wrong_tenant} environment records have a missing or unexpected tenant.")

environment_ready = validate_credit_columns(
    environment_checked,
    ["EntitledQuantity", "PrepaidConsumedQuantity", "PayGoConsumedQuantity"],
    optional_columns=["EntitledQuantity"],
).withColumn("tenant_id", F.lit(TENANT_ID))


# ---- Feature report ----
feature_dimensions = [
    "agent_name", "agent_id", "product", "ai_feature", "channel",
    "knowledge_sources", "tool_used", "llm_model", "scenario_name",
    "environment_id", "environment_name",
] + FEATURE_EXTRA

require_columns(
    feature_checked,
    feature_dimensions + ["billed_credit", "non_billed_credit", "consumption_date", "_source_file"],
)

feature_ready = validate_credit_columns(
    feature_checked, ["billed_credit", "non_billed_credit"]
).withColumn("tenant_id", F.lit(TENANT_ID))

print("Tenant and numeric validation passed.")
```

### Cell 5: Duplicate-group check

```
# Duplicate-group check
def assert_unique_groups(df, keys, report_name):
    duplicates = df.groupBy(*[F.col(f"`{k}`") for k in keys]).count().filter(F.col("count") > 1)
    n = duplicates.count()
    if n:
        display(duplicates.limit(20))
        raise ValueError(f"{report_name}: {n} duplicate reporting groups.")


assert_unique_groups(
    environment_ready,
    ["tenant_id", "report_date", "EnvironmentId", "EntitlementId", "BillingPolicyId", "BillingPlatform"],
    "Environment report",
)
assert_unique_groups(
    feature_ready, ["tenant_id", "report_date"] + feature_dimensions, "Feature report"
)
print("Duplicate-group validation passed.")
```

### Cell 6: Daily totals

Use this output to compare per-day totals with the Power Platform admin center before you publish.

```
# Daily totals
print("Environment daily totals:")
display(
    environment_ready.groupBy("report_date")
    .agg(
        F.sum("PrepaidConsumedQuantity").alias("prepaid_credits"),
        F.sum("PayGoConsumedQuantity").alias("paygo_credits"),
    )
    .orderBy("report_date")
)

print("Feature daily totals:")
display(
    feature_ready.groupBy("report_date")
    .agg(
        F.sum("billed_credit").alias("billed_credits"),
        F.sum("non_billed_credit").alias("non_billed_credits"),
    )
    .orderBy("report_date")
)
```

### Cell 7: Publish to Delta tables

The first run creates each table, partitioned by `report_date`. Later runs use `replaceWhere` on the tenant and report dates, so a rerun replaces the affected dates instead of adding to them. `mergeSchema` lets the tables gain new columns.

```
# Publish to Delta tables
def publish_report(df, table_name):
    run_id = str(uuid.uuid4())
    dates = [r["report_date"] for r in df.select("report_date").distinct().orderBy("report_date").collect()]
    if not dates:
        raise ValueError(f"No validated dates to publish to {table_name}.")

    output = (
        df.withColumn("_ingestion_run_id", F.lit(run_id))
        .withColumn("_ingested_at_utc", F.current_timestamp())
    )

    if spark.catalog.tableExists(table_name):
        date_literals = ", ".join(f"DATE '{d.isoformat()}'" for d in dates)
        predicate = f"tenant_id = '{TENANT_ID}' AND report_date IN ({date_literals})"
        (
            output.write.format("delta")
            .mode("overwrite")
            .option("replaceWhere", predicate)
            .option("mergeSchema", "true")
            .saveAsTable(table_name)
        )
    else:
        output.write.format("delta").mode("errorifexists").partitionBy("report_date").saveAsTable(table_name)

    print(f"Published {table_name}: {len(dates)} date(s); ingestion run {run_id}")


publish_report(environment_ready.drop("_file_end"), ENV_TABLE)
publish_report(feature_ready.drop("_file_end"), FEATURE_TABLE)
```

### Cell 8: Archive processed daily files

Archiving moves each data file and its manifest to the `processed` folder. It runs only after both tables publish, so a failed run leaves its files in `daily` to be retried.

```
# Archive processed daily files
def archive(paths):
    moved = 0
    for p in paths:
        manifest = re.sub(r"\.csv(\.gz)?$", ".manifest.json", p)
        for src in (p, manifest):
            if src == manifest and not notebookutils.fs.exists(src):
                continue
            notebookutils.fs.mv(src, src.replace("/daily/", "/processed/", 1), create_path=True)
            moved += 1
    print(f"Archived {moved} file(s).")

if SOURCE == "daily" and ARCHIVE_PROCESSED:
    archive(environment_paths)
    archive(feature_paths)
else:
    print("Archive skipped (backfill run or ARCHIVE_PROCESSED = False).")
```

### Cell 9: Check the published tables

```
# Check the published tables
for table_name in [ENV_TABLE, FEATURE_TABLE]:
    print(table_name)
    display(
        spark.table(table_name)
        .groupBy("report_date")
        .count()
        .orderBy("report_date")
    )
```

## Step 11: Load history and run the first daily load

1. **Historical load (optional)**: if you have files in the `backfill` folders, set `SOURCE = "backfill"` and `ARCHIVE_PROCESSED = False`, and then select **Run all**. Cell 9 should list dates for both tables.
1. **First daily load**: set `SOURCE = "daily"` and `ARCHIVE_PROCESSED = False`. Run cells 1 through 6, and compare the totals from cell 6 with the Power Platform admin center, or with tables you loaded earlier. The most recent day can be higher in a newer file because it was still filling in when it was first loaded.
1. Run cells 7 through 9 to publish.
1. Set the production defaults: `SOURCE = "daily"` and `ARCHIVE_PROCESSED = True`.

## Step 12: Schedule the flow and the notebook

1. Confirm that the flow's **Recurrence** trigger runs daily at 06:00 UTC, and turn the flow on.
1. In the notebook, select **Run** > **Schedule**. Set it to run daily at 09:00 UTC, three hours after the flow, and then select **Apply**.

> [!NOTE]
>
> You might want the flow to start the notebook when it finishes. A call from the **HTTP with Microsoft Entra ID (preauthorized)** connector to the Fabric job scheduler API returns 401 Unauthorized, so this tutorial uses a fixed notebook schedule. To chain the two, run the notebook from a Fabric pipeline with a **Notebook** activity, or call the Fabric API with an app registration.

## Verify your results

After the first scheduled cycle:

- The flow's run history shows a successful run, and you didn't receive an alert email.
- The `daily` folders are empty, and the `processed` folders contain the new `.csv` and `.manifest.json` files.
- Cell 9 output, or this SQL query on the lakehouse SQL analytics endpoint, shows a row for each day:

  ```
  SELECT report_date, SUM(billed_credit) AS billed_credits, SUM(non_billed_credit) AS non_billed_credits
  FROM studio_feature_daily
  GROUP BY report_date
  ORDER BY report_date DESC;
  ```
- Totals match the Power Platform admin center (**Licensing** > **Copilot Studio**) for the same dates.

## Troubleshoot

| Symptom | Cause | Resolution |
| --- | --- | --- |
| 400 on the report request | The start and end dates are swapped, or a date isn't in `yyyy-MM-dd` format. | Check the **startDate** and **endDate** tokens. |
| 401 | The connection's token expired or has the wrong audience. | Reauthenticate the connection. |
| 403 on a report action | The connection account doesn't have a required role, or the connection uses a service principal. | Use a user connection with one of the required roles. |
| 404 on a report action | The API isn't available for the tenant, or the report name is wrong. | Check the report name and API availability. |
| The operation `..._daily.csv.gz` wasn't found | The report already existed, so `Location` pointed at the file, and the file name was passed as an operation ID. | Add the actions from [Handle a report that already exists](#handle-a-report-that-already-exists). |
| No HTTP resource matches the request URI, with expression text in the URL | An expression was typed as text, or an action name is misspelled. | Re-enter the value in the expression editor, and check the action name. |
| The loop doesn't exit, or runs out of iterations | The **Loop until** condition is empty, or the default limits (60 and `PT1H`) are too low. | Set the condition, **Count** `30`, **Timeout** `PT3H`, and a five-minute **Delay**. |
| 403 on Create File | No workspace access, or OneLake external access is turned off. | Grant **Contributor** on the workspace, and check the Fabric tenant setting. |
| 404 on Create File | The folder path is wrong or missing. | Check the path, including for a backslash in `copilot_studio`. |
| Property `$content` can't be selected on type String | The connector returned the file as plain text. | Use the upload body expression from [Step 5](#step-5-download-the-report-and-write-it-to-onelake). |
| The media type isn't supported | `Content-Type` was selected from the suggestion list, which stores literal text. | Enter the value as an expression, and check code view. |
| Notebook: Not a gzip file | The file is named `.csv.gz` but contains plain CSV. | End the file path in `.csv`. |
| Notebook: `BilledDate` can't be resolved, and the columns are JSON keys | The manifest overwrote the data file. | Fix the manifest path, and move the bad file to a `_quarantine` folder. |
| Notebook: the feature table isn't created | Delta rejected column names that contain spaces or a slash. | Use the column mapping in cell 2. |

## Clean up resources

If you created resources only to try this tutorial, delete them:

1. In Power Automate, turn off and delete the **Copilot Credit reports to Fabric** flow, and remove its connections.
1. In Fabric, delete the notebook schedule, the notebook, and the `studio_environment_daily` and `studio_feature_daily` tables, or the whole lakehouse.

## Related content

- [Tutorial: Download Copilot Credit usage reports programmatically (preview)](/power-platform/admin/programmability-tutorial-download-copilot-credit-usage-reports)
- [Manage Copilot Credits and capacity for Copilot Studio](/power-platform/admin/manage-copilot-studio-copilot-credits-capacity)
- [Power Platform for Admins V2 connector](/connectors/powerplatformadminv2/)
- [Connect to OneLake](/fabric/onelake/onelake-access-api)
- [Schedule a notebook in Microsoft Fabric](/fabric/data-engineering/how-to-use-notebook)
