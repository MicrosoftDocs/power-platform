---
title: Download Copilot Credit usage reports (preview)
description: Learn how to submit, poll, and download Copilot Credit usage reports with Power Automate, the Power Platform CLI, and PowerShell, and then act on the report rows.
ms.component: pa-admin
ms.topic: tutorial
ms.date: 11/18/2026
author: gmosleymsft
ms.author: gmosley
ms.reviewer: ellenwehrle
ms.contributors:
  - haterry
  - thomaszou
ms.subservice: admin
ai-usage: ai-assisted
search.audienceType:
  - admin
---

# Tutorial: Download Copilot Credit usage reports programmatically (preview)

[!INCLUDE [cc-preview-features-top-note](../includes/cc-preview-features-top-note.md)]

Learn how to submit, poll, and download Copilot Credit usage reports with Power Automate, the Power Platform CLI, and PowerShell, and then act on the report rows.

The Copilot Credit usage reports API lets you download the same Copilot Credit entitlement and consumption data available in the Power Platform admin center. Use this data to automate decisions, combine it with other data sources, or maintain a long-term history beyond the 30-day reporting window.

> [!IMPORTANT]
> The usage reports API is in public preview. Sovereign clouds aren't currently supported. Preview features aren't meant for production use and might have restricted functionality. Preview features are subject to a separate [supplemental terms of use](https://go.microsoft.com/fwlink/p/?LinkId=511446)

Report generation is asynchronous. Every client in this tutorial follows the same three steps:

1. **Submit** a report request. The service returns `202 Accepted` with a `Location` header (the operation-status URL) and a `Retry-After` header.
2. **Poll** the operation until its `status` is `Succeeded` or `Failed`. Follow the polling interval specified by `Retry-After`. The status API returns `200 OK` even while generation is in progress (`status: Running`), so check the response body rather than treating HTTP 200 as confirmation that the report is ready.
3. **Download** the generated file, and then iterate through the rows. The REST example follows the operation response's `Location` URL; the connector and CLI examples pass the returned `fileName` to their download action or command.

In this tutorial, learn how to:

- Download a usage report in Power Automate or Copilot Studio workflows by using the same Power Platform for Admins V2 connector actions and steps.
- Download a usage report from PowerShell by using the Power Platform CLI (`pac`).
- Download a usage report from PowerShell by calling the Power Platform API directly.

## Choose a report

By default, all examples in this tutorial use the `FeatureDetailsPerResource` report with `Summary` granularity and request the previous 14 complete UTC days, ending yesterday (UTC). Choose a different report or granularity as needed.

| Report | Use it to | Credit columns |
| --- | --- | --- |
| `FeatureDetailsPerResource` | View Copilot Credit consumption by agent or resource, environment, product, and feature. | `BilledCredits`, `NonBilledCredits` |
| `BillingDetailsPerEnvironment` | View entitlement and consumption by environment, entitlement, and billing policy, including prepaid and pay-as-you-go consumption. | `CapacityPackCreditsConsumed`, `PayGoConsumedQuantity` |

| Granularity | Rows returned |
| --- | --- |
| `Daily` | One row per day for each combination of report dimensions. Includes the date column. |
| `Summary` | Consumption summed across the requested dates for each combination of report dimensions. The date column is omitted. |

For the complete list of columns in each report, see [Download Licensing Report File: Report file schemas](/rest/api/power-platform/copilotstudio/licensing-reports/download-licensing-report-file#report-file-schemas).

> [!NOTE]
> Column names in both CSV and JSON output are case-sensitive. For example, read the agent ID as `ResourceID`, the agent name as `ResourceName`, and billed credits as `BilledCredits`. The threshold examples evaluate each report row independently; they don't aggregate all rows for an agent.

## Prerequisites

- A Microsoft Entra **user** account with one of these roles in your tenant: **Global Administrator**, **Power Platform Administrator**, or **Dynamics 365 Administrator**. The usage reports API supports delegated (user) authentication only; application-only (service principal) tokens aren't supported.
- Copilot Credit consumption in your tenant during the selected time range.
- The tools for the client you choose:

| Client | What you need |
| --- | --- |
| Power Automate | A Power Automate license that includes standard connectors, and permission to create a [Power Platform for Admins V2](/connectors/powerplatformadminv2/) connection with an **OAuth Connection** authentication type. |
| Copilot Studio workflows | Access to Copilot Studio with permission to create workflows, a [Power Platform for Admins V2](/connectors/powerplatformadminv2/) connection with an **OAuth Connection** authentication type, and sufficient Copilot Credits to run the workflow. |
| Power Platform CLI | [PowerShell 7](/powershell/scripting/install/installing-powershell) and the latest [Microsoft Power Platform CLI](/power-platform/developer/cli/introduction#install-microsoft-power-platform-cli). |
| PowerShell (REST) | [PowerShell 7](/powershell/scripting/install/installing-powershell) and the [Azure CLI](/cli/azure/install-azure-cli). |

### Handle service protection responses

Report submissions can return `429 Too Many Requests` when service protection is enforced. A rejected submission doesn't start a report.

To reduce unnecessary submissions:

- Schedule reports (for example, once a day or once a week) instead of generating them on demand in a tight loop.
- Reuse a downloaded file instead of submitting the same report again.
- If the service supplies `Retry-After` with a `429` response, wait at least that long before submitting another request.

For details, see [Generate Licensing Report: Tenant-wide service protection limits](/rest/api/power-platform/copilotstudio/licensing-reports/generate-licensing-report#tenant-wide-service-protection-limits).

## Download a usage report and act on the results

Use the tabs in the following section to choose a client. Each example submits a `FeatureDetailsPerResource` request, polls until the operation finishes, downloads the file, and then lists every row where `BilledCredits` plus `NonBilledCredits` is greater than 1,000. The threshold applies to individual rows, not cumulative consumption per agent. For example, two rows of 600 credits for the same agent aren't selected, even though their combined total is 1,200. Separate rows can represent different products, features, channels, knowledge sources, tools, models, scenarios, or environments.

### [Copilot Studio workflows and Power Automate cloud flows](#tab/power-automate)

> [!NOTE]
> A new action for the Power Platform for Admins V2 connector is scheduled to roll out in December 2026. It will combine report request submission, status polling, and report download in a single action for both Power Automate and Copilot Studio workflows, eliminating the need to manage polling in your workflow.

> [!NOTE]
> Support for requesting reports in JSON format through the connector is also scheduled to roll out in December 2026. The connector currently generates reports in CSV format by default. The JSON-based connector example below requires this upcoming support.

This example builds a scheduled cloud flow that runs every Monday, downloads a report for the previous 14 complete UTC days, and emails a table of agents whose report rows exceed the consumption threshold. It uses three actions from the [Power Platform for Admins V2](/connectors/powerplatformadminv2/) connector.

The steps in the following section apply to both **Copilot Studio workflows** and **Power Automate cloud flows**. The instructions for creating the flow use Power Automate's navigation. If you're using Copilot Studio, create a scheduled workflow there, and then follow the same steps to configure variables, connector actions, expressions, conditions, and report processing. **Generate Licensing Report** returns the initial submission response without automatically polling; the flow manages subsequent polling explicitly.

| Step | Connector action |
| --- | --- |
| Submit | **Generate Licensing Report** |
| Poll | **Get Licensing Report Operation Status** |
| Download | **Download Licensing Report File** |

The flow polls the same operation in a **Do until** loop. After each poll, a condition checks whether `status` is `Running`. Only the branch for that status reads the poll response's `Retry-After` header and waits before the next iteration. A status of `Succeeded` or `Failed` exits the loop without another delay. The loop checks the response body and doesn't require the status endpoint to return HTTP 202.

If you're new to Power Automate, see [Run flows on a schedule](/power-automate/run-scheduled-tasks).

### Step 1: Create the flow and variables

1. Sign in to [Power Automate](https://make.powerautomate.com), and then select **Create** > **Scheduled cloud flow**.
2. Name the flow **Weekly Copilot Credit report**, set it to repeat every **1 Week** on **Monday**, and then select **Create**.
3. Add three **Initialize variable** actions:

   | Name | Type | Value |
   | --- | --- | --- |
   | `StartDate` | String | `formatDateTime(addDays(utcNow(),-14),'yyyy-MM-dd')` |
   | `EndDate` | String | `formatDateTime(addDays(utcNow(),-1),'yyyy-MM-dd')` |
   | `CreditThreshold` | Float | `1000` |

   Enter the date values as expressions. Together they request the previous 14 complete UTC days.

### Step 2: Submit the report request and capture the operation

1. Add the **Power Platform for Admins V2** > **Generate Licensing Report** action. When prompted, create a connection with the **OAuth Connection** authentication type, and sign in with an account that has one of the [required roles](#prerequisites).
2. Set the parameters:

   | Parameter | Value |
   | --- | --- |
   | **Report Name** | `FeatureDetailsPerResource` |
   | **Api-version** | `2024-10-01` |
   | **startDate** | `StartDate` variable |
   | **endDate** | `EndDate` variable |
   | **granularity** | `Summary` |
   | **format** | `json` |
3. **Generate Licensing Report** submits the request and returns `202 Accepted` with the initial `Location` and `Retry-After` headers; it doesn't poll the operation.

   Confirm that the action's outputs contain the initial submission headers before continuing. If the action instead returns a later operation-status response without the operation URL, stop and check the connector version and response handling; the explicit polling steps require the initial `Location`.
4. After the submission action, add a **Compose** action named **Report operation URL**:

   ```text
   coalesce(outputs('Generate_Licensing_Report')?['headers']?['Location'],outputs('Generate_Licensing_Report')?['headers']?['location'])
   ```
5. Add a **Compose** action named **Report operation ID**:

   ```text
   last(split(uriPath(outputs('Report_operation_URL')),'/'))
   ```

   This extracts the operation ID from the returned URL for the connector's **Operation ID** parameter. Keep the original URL for troubleshooting or resuming the operation; don't construct a new URL or submit a new report on every poll.
6. Add a **Delay** action named **Initial report wait**. Set **Unit** to **Second** and **Count** to:

   ```text
   int(coalesce(outputs('Generate_Licensing_Report')?['headers']?['Retry-After'],outputs('Generate_Licensing_Report')?['headers']?['retry-after']))
   ```

   The initial `Retry-After` defaults to `300` seconds (five minutes). Use the value returned by the service; it specifies when to poll, not how long generation takes. The API supplies a numeric interval in seconds. If the header is missing or malformed, investigate the response rather than substituting a zero-second delay.

> [!TIP]
> If the run history shows a `429` status for **Generate Licensing Report**, don't resubmit immediately. If the response includes `Retry-After`, wait at least that many seconds before running the flow again.

### Step 3: Poll, check the status, and wait only while running

1. After **Initial report wait**, add a **Do until** control. Set its left value to:

   ```text
   body('Feature_Poll_Status')?['status']
   ```

   Choose **is not equal to**, and enter `Running` on the right. The API's exact in-progress value is `Running`, not `InProgress` or `In Progress`. A **Do until** runs its actions before evaluating this exit condition.
2. In the control's **Parameters** > **Advanced parameters** > **Show all**, set **Count** to `120` and **Timeout** to `PT2H`. These limits prevent indefinite polling; they don't guarantee that report generation finishes within those limits.
3. Inside **Do until**, add **Power Platform for Admins V2** > **Get Licensing Report Operation Status** and rename it **Feature Poll Status**:

   | Parameter | Value |
   | --- | --- |
   | **Report Name** | `FeatureDetailsPerResource` |
   | **Operation ID** | `outputs('Report_operation_ID')` |
   | **Api-version** | `2024-10-01` |
4. Immediately after **Feature Poll Status**, still inside the loop, add a **Condition** named **Feature Wait If Running**. Compare this expression with the text `Running` by using **is equal to**:

   ```text
   body('Feature_Poll_Status')?['status']
   ```
5. In the **True** branch, add a **Delay** named **Feature Poll Delay**. Set **Unit** to **Second** and **Count** to:

   ```text
   int(coalesce(outputs('Feature_Poll_Status')?['headers']?['Retry-After'],outputs('Feature_Poll_Status')?['headers']?['retry-after']))
   ```

   Read the header from the latest poll, not the initial submission: the recommended interval can change. If a `Running` response has no valid interval, stop and inspect the response rather than polling in a tight loop.
6. Leave the **False** branch empty. Once the condition finishes, **Do until** checks the latest status: `Running` repeats the poll after the delay; any other value exits to the terminal-status check.

The loop layout is **Feature Poll Status** > **Feature Wait If Running** > **True: Feature Poll Delay / False: no actions**, matching the same poll-check-wait logic used by the PowerShell REST example. HTTP 200 means the status request succeeded, not that the report is ready.

### Step 4: Check the completed report status

1. After **Do until**, add a **Condition** outside the loop. Set the left value to this expression, choose **is equal to**, and set the right value to the expression `true`:

   ```text
   and(equals(body('Feature_Poll_Status')?['status'],'Succeeded'),not(empty(body('Feature_Poll_Status')?['fileName'])))
   ```

   Check the returned report status even if the action itself shows **Succeeded**. Continue only when generation succeeded and a file name is present.
2. In the **False** branch, add a **Terminate** action with **Status** = **Failed**. Set **Message** to this expression:

   ```text
   if(empty(body('Feature_Poll_Status')?['error']),concat('Report generation did not return Succeeded with a file name. Status: ',string(body('Feature_Poll_Status')?['status'])),string(body('Feature_Poll_Status')?['error']))
   ```

   A `Failed` report operation can't be resumed. This check also fails if the status is missing or unexpected, or if the status is `Succeeded` but no file name is present. If a loop limit is reached while the report is still `Running`, don't download the report or immediately submit another request. If submission, polling, or a delay fails, or if the loop times out, subsequent actions that require success are skipped. Inspect the run history and retain the operation URL before retrying or resuming.

### Step 5: Download the report

In the **True** branch of the condition:

1. Add **Power Platform for Admins V2** > **Download Licensing Report File**:

   | Parameter | Value |
   | --- | --- |
   | **Report Name** | `FeatureDetailsPerResource` |
   | **File Name** | `body('Feature_Poll_Status')?['fileName']` |
   | **Api-version** | `2024-10-01` |
2. Add a **Parse JSON** action, rename it **Parse report JSON**, and for **Content**, use:

   ```text
   body('Download_Licensing_Report_File')
   ```

   Use the following schema, which covers all 18 exported properties in report order. `ConsumptionDate` is present for `Daily` reports and omitted for `Summary` reports, so it isn't required. The root can be an empty array, but every returned row must contain numeric values for `BilledCredits` and `NonBilledCredits`. Other string labels and IDs can be null or omitted.

   ```json
   {
     "type": "array",
     "items": {
       "type": "object",
       "required": [
         "BilledCredits",
         "NonBilledCredits"
       ],
       "properties": {
         "ConsumptionDate": { "type": ["string", "null"] },
         "BillingPlatform": { "type": ["string", "null"] },
         "EnvironmentID": { "type": ["string", "null"] },
         "EnvironmentName": { "type": ["string", "null"] },
         "EnvironmentType": { "type": ["string", "null"] },
         "ResourceID": { "type": ["string", "null"] },
         "ResourceName": { "type": ["string", "null"] },
         "ResourceType": { "type": ["string", "null"] },
         "Product": { "type": ["string", "null"] },
         "HarnessType": { "type": ["string", "null"] },
         "ScenarioName": { "type": ["string", "null"] },
         "Feature": { "type": ["string", "null"] },
         "Channel": { "type": ["string", "null"] },
         "KnowledgeSources": { "type": ["string", "null"] },
         "ToolUsed": { "type": ["string", "null"] },
         "LLMModel": { "type": ["string", "null"] },
         "BilledCredits": { "type": "number" },
         "NonBilledCredits": { "type": "number" }
       },
       "additionalProperties": true
     }
   }
   ```

   **Parse report JSON** exposes every named property as dynamic content. Test with a report that contains rows to confirm that all exported properties are available and populated as expected. An empty array confirms only the array structure; it doesn't verify that row properties are present. To inspect the fields together, add a temporary **Select** action, set **From** to `body('Parse_report_JSON')`, and map each named dynamic-content property. Remove the action after validation.

   In some connector runtimes, the downloaded body is a binary wrapper with `$content-type` and base64 `$content`. In that case, change **Content** to:

   ```text
   json(base64ToString(body('Download_Licensing_Report_File')?['$content']))
   ```

   The base64 value represents the HTTP payload after standard `Content-Encoding` handling; decoding it should produce plain JSON text. Base64 decoding doesn't decompress gzip data. If the decoded value is still gzip-compressed binary data or isn't valid JSON, stop the flow and inspect how the connector handles the response.

### Step 6: Find rows over 1,000 credits and send a notification

1. Add a **Select** action, rename it **Report rows**, and set **From** to this expression:

   ```text
   body('Parse_report_JSON')
   ```

   Enter each value through the expression editor, not as literal text. In the new designer, enter `/` in the value field and select **Insert expression**.

   | Key | Value |
   | --- | --- |
   | `Agent` | `if(empty(item()?['ResourceName']),coalesce(item()?['ResourceID'],''),item()?['ResourceName'])` |
   | `Agent ID` | `coalesce(item()?['ResourceID'], '')` |
   | `Environment` | `if(empty(item()?['EnvironmentName']),coalesce(item()?['EnvironmentID'],''),item()?['EnvironmentName'])` |
   | `Feature` | `coalesce(item()?['Feature'], '')` |
   | `Total credits` | `add(item()?['BilledCredits'], item()?['NonBilledCredits'])` |

   The `if(empty(...))` expressions use the ID when a display name is null or an empty string. The schema requires both credit fields to be numbers. If either value is missing, null, or text, **Parse report JSON** fails instead of silently treating the value as zero.

   As an alternative to entering each value separately, select **Switch to text mode** in **Report rows** and paste this JSON object:

   ```json
   {
     "Agent": "@if(empty(item()?['ResourceName']),coalesce(item()?['ResourceID'],''),item()?['ResourceName'])",
     "Agent ID": "@coalesce(item()?['ResourceID'],'')",
     "Environment": "@if(empty(item()?['EnvironmentName']),coalesce(item()?['EnvironmentID'],''),item()?['EnvironmentName'])",
     "Feature": "@coalesce(item()?['Feature'],'')",
     "Total credits": "@add(item()?['BilledCredits'],item()?['NonBilledCredits'])"
   }
   ```

   Enter each value as an `@expression`, not an `@{...}` interpolated string or literal text. After a test run, inspect the **Report rows** output and confirm that **Total credits** is an unquoted number rather than a quoted string.
2. Add a **Filter array** action, rename it **High usage rows**, and set **From** to the **Output** of **Report rows**. Select **Edit in advanced mode**, and enter:

   ```text
   @greater(item()?['Total credits'], variables('CreditThreshold'))
   ```
3. Add a **Condition** that checks whether `length(body('High_usage_rows'))` **is greater than** `0`. In the **True** branch, add **Create HTML table** (From = **Output** of **High usage rows**, labeled **Body** in some designers, or the expression `body('High_usage_rows')`), followed by **Office 365 Outlook** > **Send an email (V2)** with the HTML table in the body.
4. Select **Save**, and then select **Test** > **Manually** to run the flow now.

If **High usage rows** is empty, the actions that create the HTML table and send the email are skipped. To test the **True** branch, temporarily lower `CreditThreshold` (for example, to `0`) while using authorized test data, run the flow, and then restore the threshold to `1000`.

### Optional: Report billing details by environment

To use `BillingDetailsPerEnvironment`, keep the same flow and make these changes:

1. Set **Report Name** to `BillingDetailsPerEnvironment` in all three connector actions: **Generate Licensing Report**, **Get Licensing Report Operation Status** (named **Feature Poll Status**), and **Download Licensing Report File**. Keep the action names unchanged so the expressions still resolve.
2. Replace the **Parse report JSON** schema with the following full 11-property schema. `BilledDate` and `AllocatedCapacityPackCredits` are present for `Daily` reports and omitted for `Summary` reports. The two consumed-credit fields remain required numbers; string labels and IDs can be null or omitted.

   ```json
   {
     "type": "array",
     "items": {
       "type": "object",
       "required": [
         "CapacityPackCreditsConsumed",
         "PayGoConsumedQuantity"
       ],
       "properties": {
         "BilledDate": { "type": ["string", "null"] },
         "BillingPlatform": { "type": ["string", "null"] },
         "TenantID": { "type": ["string", "null"] },
         "EnvironmentID": { "type": ["string", "null"] },
         "EnvironmentName": { "type": ["string", "null"] },
         "EnvironmentType": { "type": ["string", "null"] },
         "EntitlementID": { "type": ["string", "null"] },
         "BillingPolicyId": { "type": ["string", "null"] },
         "AllocatedCapacityPackCredits": { "type": "number" },
         "CapacityPackCreditsConsumed": { "type": "number" },
         "PayGoConsumedQuantity": { "type": "number" }
       },
       "additionalProperties": true
     }
   }
   ```
3. In **Report rows**, keep **From** as `body('Parse_report_JSON')` and use this mapping:

   | Key | Value |
   | --- | --- |
   | `Environment ID` | `coalesce(item()?['EnvironmentID'], '')` |
   | `Environment` | `if(empty(item()?['EnvironmentName']),coalesce(item()?['EnvironmentID'],''),item()?['EnvironmentName'])` |
   | `Entitlement ID` | `coalesce(item()?['EntitlementID'], '')` |
   | `Billing policy ID` | `coalesce(item()?['BillingPolicyId'], '')` |
   | `Total credits` | `add(item()?['CapacityPackCreditsConsumed'], item()?['PayGoConsumedQuantity'])` |

Keep the existing **High usage rows** filter expression, condition, HTML table, and email actions. The total combines capacity-pack and pay-as-you-go consumption for each returned environment billing row. These funding categories differ from the feature report's billed and nonbilled credit classifications. The flow doesn't aggregate all rows for an environment.

You can replace the email action with other business logic, such as posting to a Teams channel, creating a Dataverse row, or saving the report to SharePoint to maintain a long-term history.

### [Power Platform CLI](#tab/pac-cli)

> [!NOTE]
> The native `pac copilot-studio` commands don't currently expose response headers. Support is scheduled to roll out in December 2026. Until then, use a fixed 60-second polling delay instead of reading `Retry-After`; the script below defaults `PollIntervalSeconds` to `60`. This is a client-side workaround, not an interval returned by the service. Use the direct REST example when you need to honor dynamic response headers. If the CLI reports `429`, don't automatically retry using this fixed interval.

This example runs the following `pac copilot-studio` commands from a PowerShell 7 script by using the [Microsoft Power Platform CLI](/power-platform/developer/cli/introduction):

| Step | Command |
| --- | --- |
| Submit | [`pac copilot-studio generate-licensing-report`](/power-platform/developer/cli/reference/copilot-studio#pac-copilot-studio-generate-licensing-report) |
| Poll | [`pac copilot-studio get-licensing-report-operation`](/power-platform/developer/cli/reference/copilot-studio#pac-copilot-studio-get-licensing-report-operation) |
| Download | [`pac copilot-studio download-licensing-report-file`](/power-platform/developer/cli/reference/copilot-studio#pac-copilot-studio-download-licensing-report-file) |

The CLI downloads the report as a CSV file.

### Step 1: Install the CLI and sign in

1. [Install the Power Platform CLI](/power-platform/developer/cli/introduction#install-microsoft-power-platform-cli). If you already have it, update to the latest version so the `copilot-studio` usage report commands are available. For example, if you installed it as a .NET tool:

   ```powershell
   dotnet tool update --global Microsoft.PowerApps.CLI.Tool
   ```
2. Create an authentication profile for your tenant and sign in interactively with an account that has one of the [required roles](#prerequisites). For more information, see [pac auth](/power-platform/developer/cli/reference/auth).

   ```powershell
   pac auth create --name LicensingReports --tenant "<directory (tenant) ID>"
   pac auth select --name LicensingReports
   ```

### Step 2: Run the script

Save the following script as `Get-CopilotCreditReport.ps1`, and then run it with `pwsh ./Get-CopilotCreditReport.ps1`. By default, the script requests a `Summary` `FeatureDetailsPerResource` report for the previous 14 complete UTC days and lists every row over 1,000 credits. Use the parameters to change the report, granularity, threshold, polling interval, timeout, or output folder. For example:

```powershell
pwsh ./Get-CopilotCreditReport.ps1 -ReportName BillingDetailsPerEnvironment -Granularity Daily -CreditThreshold 500
```

```powershell
#requires -Version 7.0
param(
    [ValidateSet("FeatureDetailsPerResource", "BillingDetailsPerEnvironment")]
    [string] $ReportName = "FeatureDetailsPerResource",
    [ValidateSet("Daily", "Summary")]
    [string] $Granularity = "Summary",
    [decimal] $CreditThreshold = 1000,
    [ValidateRange(1, 86400)]
    [int]    $PollIntervalSeconds = 60,
    [ValidateRange(1, 1440)]
    [int]    $TimeoutMinutes = 120,
    [string] $OutputDirectory = $PWD.Path
)
$ErrorActionPreference = "Stop"

function Invoke-Pac([string[]] $Arguments) {
    # Runs a pac command, fails on a non-zero exit code, and returns the console output as one string.
    $output = (& pac @Arguments 2>&1 | Out-String)
    if ($LASTEXITCODE -ne 0) { throw "pac $($Arguments -join ' ') failed:`n$output" }
    return $output
}

# Request the previous 14 complete UTC days.
$endDate   = [DateTime]::UtcNow.Date.AddDays(-1).ToString("yyyy-MM-dd")
$startDate = [DateTime]::UtcNow.Date.AddDays(-14).ToString("yyyy-MM-dd")

# 1. Submit the report request.
Write-Host "Submitting $ReportName ($Granularity) for $startDate through $endDate..."
$submitOutput = Invoke-Pac @("copilot-studio", "generate-licensing-report",
    "--report-name", $ReportName, "--start-date", $startDate, "--end-date", $endDate, "--granularity", $Granularity)

# The operation ID is the last segment of the operation-status URL (.../operations/{OperationId}).
if ($submitOutput -match "operations/(?<id>[^/?\s`"']+)") {
    $operationId = $Matches.id
}
elseif ($submitOutput -match "(?<id>[0-9a-fA-F]{8}-(?:[0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12})") {
    $operationId = $Matches.id
}
else {
    throw "Couldn't find an operation ID in the CLI output:`n$submitOutput"
}
Write-Host "Operation ID: $operationId"

# 2. Poll until the operation succeeds or fails.
$deadline = [DateTime]::UtcNow.AddMinutes($TimeoutMinutes)
do {
    if ([DateTime]::UtcNow -gt $deadline) { throw "Timed out waiting for operation $operationId." }
    Start-Sleep -Seconds $PollIntervalSeconds
    $statusOutput = Invoke-Pac @("copilot-studio", "get-licensing-report-operation",
        "--report-name", $ReportName, "--operation-id", $operationId)
    if ($statusOutput -notmatch "\b(?<status>Running|Succeeded|Failed)\b") {
        throw "Couldn't find an operation status in the CLI output:`n$statusOutput"
    }
    $status = $Matches.status
    Write-Host "$([DateTime]::Now.ToString('T'))  status = $status"
} while ($status -eq "Running")

if ($status -eq "Failed") { throw "Report generation failed. Submit a new request to try again.`n$statusOutput" }
if ($statusOutput -notmatch "(?<file>[A-Za-z0-9_.-]+\.(?:csv|json)\.gz)") {
    throw "Couldn't find the report file name in the CLI output:`n$statusOutput"
}
$fileName = $Matches.file

# 3. Download the report file.
$downloadPath = Join-Path $OutputDirectory $fileName
Invoke-Pac @("copilot-studio", "download-licensing-report-file",
    "--report-name", $ReportName, "--file-name", $fileName, "--out-file", $downloadPath) | Out-Null

# The download is gzip-compressed on the wire. Decompress it only if the saved file still starts
# with the gzip signature (0x1F 0x8B); otherwise it's already plain CSV.
$csvPath = $downloadPath -replace "\.gz$", ""
$bytes = [System.IO.File]::ReadAllBytes($downloadPath)
if ($bytes.Length -ge 2 -and $bytes[0] -eq 0x1F -and $bytes[1] -eq 0x8B) {
    $source = [System.IO.MemoryStream]::new($bytes)
    $gzip   = [System.IO.Compression.GZipStream]::new($source, [System.IO.Compression.CompressionMode]::Decompress)
    $target = [System.IO.File]::Create($csvPath)
    try { $gzip.CopyTo($target) } finally { $target.Dispose(); $gzip.Dispose(); $source.Dispose() }
}
elseif ($csvPath -ne $downloadPath) {
    Move-Item -LiteralPath $downloadPath -Destination $csvPath -Force
}
Write-Host "Saved report: $csvPath"

# 4. Iterate through the rows and apply business logic.
$rows = @(Import-Csv -LiteralPath $csvPath)
Write-Host "Report rows: $($rows.Count)"

if ($rows.Count -gt 0) {
    $availableColumns = @($rows[0].PSObject.Properties.Name)
}
else {
    $headerLine = Get-Content -LiteralPath $csvPath -TotalCount 1
    if ([string]::IsNullOrWhiteSpace($headerLine)) {
        throw "The downloaded report is empty and does not contain a CSV header."
    }

    $availableColumns = @($headerLine -split "," | ForEach-Object { $_.Trim().Trim('"').Trim([char]0xFEFF) })
}

switch ($ReportName) {
    "FeatureDetailsPerResource" {
        $requiredColumns = @(
            "EnvironmentName",
            "ResourceID",
            "ResourceName",
            "Feature",
            "BilledCredits",
            "NonBilledCredits"
        )
    }
    "BillingDetailsPerEnvironment" {
        $requiredColumns = @(
            "EnvironmentName",
            "EntitlementID",
            "BillingPolicyId",
            "CapacityPackCreditsConsumed",
            "PayGoConsumedQuantity"
        )
    }
}

$missingColumns = @($requiredColumns | Where-Object { $_ -notin $availableColumns })
if ($missingColumns.Count -gt 0) {
    throw "The $ReportName report is missing required column(s): $($missingColumns -join ', '). Available columns: $($availableColumns -join ', ')."
}

function ConvertTo-ReportDecimal([object] $Value, [string] $ColumnName, [int] $RowNumber) {
    $parsedValue = [decimal]0
    if (-not [decimal]::TryParse(
        [string]$Value,
        [Globalization.NumberStyles]::Number,
        [Globalization.CultureInfo]::InvariantCulture,
        [ref]$parsedValue)) {
        throw "Row $RowNumber has an invalid value for ${ColumnName}: '$Value'."
    }

    return $parsedValue
}

$highUsage = for ($index = 0; $index -lt $rows.Count; $index++) {
    $row = $rows[$index]
    $rowNumber = $index + 2

    if ($ReportName -eq "FeatureDetailsPerResource") {
        $total = (ConvertTo-ReportDecimal $row.BilledCredits "BilledCredits" $rowNumber) +
            (ConvertTo-ReportDecimal $row.NonBilledCredits "NonBilledCredits" $rowNumber)

        if ($total -gt $CreditThreshold) {
            [pscustomobject]@{
                Agent        = $row.ResourceName
                AgentId      = $row.ResourceID
                Environment  = $row.EnvironmentName
                Feature      = $row.Feature
                TotalCredits = [decimal]::Round($total, 2)
            }
        }
    }
    else {
        $total = (ConvertTo-ReportDecimal $row.CapacityPackCreditsConsumed "CapacityPackCreditsConsumed" $rowNumber) +
            (ConvertTo-ReportDecimal $row.PayGoConsumedQuantity "PayGoConsumedQuantity" $rowNumber)

        if ($total -gt $CreditThreshold) {
            [pscustomobject]@{
                Environment     = $row.EnvironmentName
                EntitlementId   = $row.EntitlementID
                BillingPolicyId = $row.BillingPolicyId
                TotalCredits    = [decimal]::Round($total, 2)
            }
        }
    }
}

if ($highUsage) {
    Write-Host "`nRows over $CreditThreshold Copilot Credits:" -ForegroundColor Yellow
    $highUsage | Sort-Object TotalCredits -Descending | Format-Table -AutoSize
}
else {
    Write-Host "`nNo rows exceeded $CreditThreshold Copilot Credits." -ForegroundColor Green
}
```

> [!NOTE]
> The script supports both reports:
>
> - For `FeatureDetailsPerResource`, it adds `BilledCredits` and `NonBilledCredits` for each row and reports the agent (`ResourceName`, `ResourceID`), `EnvironmentName`, and `Feature`.
> - For `BillingDetailsPerEnvironment`, it adds `CapacityPackCreditsConsumed` and `PayGoConsumedQuantity` for each row and reports `EnvironmentName`, `EntitlementID`, and `BillingPolicyId`.
>
> Before processing any rows, the script checks that the report contains the required columns. If a required column is missing, it stops and lists the available columns. The script parses credit values by using culture-independent formatting, so results don't vary with the computer's regional settings. If a credit value isn't numeric, the script stops and identifies the row. A report that contains only a header is valid and returns no rows.

### [PowerShell (REST)](#tab/powershell)

This example calls the Power Platform API directly with `Invoke-WebRequest`, which is useful when you can't install the Power Platform CLI or want JSON output. It obtains a delegated user token through the Azure CLI and follows the `Location` and `Retry-After` headers returned by the service, as described in the API reference:

| Step | API operation |
| --- | --- |
| Submit | [Generate Licensing Report](/rest/api/power-platform/copilotstudio/licensing-reports/generate-licensing-report) |
| Poll | [Get Licensing Report Operation](/rest/api/power-platform/copilotstudio/licensing-reports/get-licensing-report-operation) |
| Download | [Download Licensing Report File](/rest/api/power-platform/copilotstudio/licensing-reports/download-licensing-report-file) |

### Step 1: Sign in

Install the [Azure CLI](/cli/azure/install-azure-cli), and then sign in with an account that has one of the [required roles](#prerequisites):

```powershell
az login --tenant "<directory (tenant) ID>" --allow-no-subscriptions
```

### Step 2: Run the script

Save the following script as `Get-CopilotCreditReport-Rest.ps1`, and then run it with `pwsh ./Get-CopilotCreditReport-Rest.ps1 -TenantId "<directory (tenant) ID>"`.

```powershell
#requires -Version 7.0
param(
    [Parameter(Mandatory)] [string] $TenantId,
    [ValidateSet("FeatureDetailsPerResource", "BillingDetailsPerEnvironment")]
    [string] $ReportName = "FeatureDetailsPerResource",
    [ValidateSet("Daily", "Summary")]
    [string] $Granularity = "Summary",
    [decimal] $CreditThreshold = 1000,
    [ValidateRange(1, 1440)]
    [int] $TimeoutMinutes = 120,
    [string] $OutputDirectory = $PWD.Path,
    [string] $ResumeOperationUrl
)
$ErrorActionPreference = "Stop"
$apiBase    = "https://api.powerplatform.com/copilotstudio/licensing/reports"
$apiVersion = "2024-10-01"

function Get-HeaderValue($Response, [string] $Name) {
    $value = $Response.Headers[$Name]
    if ($null -eq $value) { return $null }
    return "$(@($value)[0])"
}

function Get-RequiredHeader($Response, [string] $Name, [string] $Context) {
    $value = Get-HeaderValue $Response $Name
    if ([string]::IsNullOrWhiteSpace($value)) {
        throw "$Context didn't return the required $Name header."
    }

    return $value
}

function Get-RequiredRetryAfter($Response, [string] $Context) {
    $value = Get-RequiredHeader $Response "Retry-After" $Context
    $seconds = 0
    if (-not [int]::TryParse($value, [ref]$seconds) -or $seconds -lt 1) {
        throw "$Context returned an invalid Retry-After header: '$value'."
    }

    return $seconds
}

function Assert-ApiResponse($Response, [int[]] $ExpectedStatusCodes, [string] $Context, [string] $ResumeUrl) {
    $statusCode = [int]$Response.StatusCode
    if ($statusCode -eq 401) {
        $resumeMessage = if ([string]::IsNullOrWhiteSpace($ResumeUrl)) {
            "Sign in again before submitting another request."
        }
        else {
            "Sign in again, then rerun this script with -ResumeOperationUrl '$ResumeUrl' so you resume the existing operation instead of consuming another submission."
        }

        throw "$Context failed with HTTP 401. The delegated token might have expired. $resumeMessage"
    }

    if ($statusCode -notin $ExpectedStatusCodes) {
        throw "$Context failed with HTTP ${statusCode}: $($Response.Content)"
    }
}

function ConvertTo-RequiredReportDecimal(
    [System.Text.Json.JsonElement] $Row,
    [string] $PropertyName,
    [int] $RowNumber
) {
    $property = [System.Text.Json.JsonElement]::new()
    if (-not $Row.TryGetProperty($PropertyName, [ref]$property)) {
        throw "Row $RowNumber is missing required property '$PropertyName'."
    }

    if ($property.ValueKind -eq [System.Text.Json.JsonValueKind]::Null) {
        throw "Row $RowNumber has null for required property '$PropertyName'."
    }
    if ($property.ValueKind -ne [System.Text.Json.JsonValueKind]::Number) {
        throw "Row $RowNumber property '$PropertyName' must be a JSON number."
    }

    try {
        # Report credit columns have a decimal(20,2) contract. GetDecimal reads the JSON
        # number directly without first converting it to binary floating point.
        return $property.GetDecimal()
    }
    catch [FormatException] {
        throw "Row $RowNumber property '$PropertyName' isn't a valid decimal JSON number."
    }
    catch [OverflowException] {
        throw "Row $RowNumber property '$PropertyName' is outside the supported decimal range."
    }
}

function Get-OptionalLabel(
    [System.Text.Json.JsonElement] $Row,
    [string[]] $PropertyNames,
    [string] $Fallback
) {
    foreach ($propertyName in $PropertyNames) {
        $property = [System.Text.Json.JsonElement]::new()
        if ($Row.TryGetProperty($propertyName, [ref]$property) -and
            $property.ValueKind -eq [System.Text.Json.JsonValueKind]::String -and
            -not [string]::IsNullOrWhiteSpace($property.GetString())) {
            return $property.GetString()
        }
    }

    return $Fallback
}

# Get a delegated user token for the Power Platform API.
$token = az account get-access-token --resource "https://api.powerplatform.com" --tenant $TenantId --query accessToken -o tsv
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($token)) {
    throw "Couldn't get a token. Run 'az login --tenant $TenantId --allow-no-subscriptions' and try again."
}
$headers = @{ Authorization = "Bearer $token" }

# Request the previous 14 complete UTC days.
$body = @{
    startDate   = [DateTime]::UtcNow.Date.AddDays(-14).ToString("yyyy-MM-dd")
    endDate     = [DateTime]::UtcNow.Date.AddDays(-1).ToString("yyyy-MM-dd")
    granularity = $Granularity
    format      = "json"
} | ConvertTo-Json

# 1. Submit the report request, or resume an existing operation without spending another submission.
if ([string]::IsNullOrWhiteSpace($ResumeOperationUrl)) {
    Write-Host "Submitting $ReportName ($Granularity)..."
    $submit = Invoke-WebRequest -Method Post -Uri "$apiBase/${ReportName}?api-version=$apiVersion" `
        -Headers $headers -ContentType "application/json" -Body $body -SkipHttpErrorCheck

    if ([int]$submit.StatusCode -eq 429) {
        $retryAfter = Get-HeaderValue $submit "Retry-After"
        $guidance = if ([string]::IsNullOrWhiteSpace($retryAfter)) {
            "The response didn't include a retry interval. Don't retry automatically."
        }
        else {
            "Wait at least $retryAfter seconds before submitting again."
        }

        throw "The service rejected the report submission with HTTP 429. $guidance"
    }

    Assert-ApiResponse $submit @(202) "Submit" $null
    $operationUrl = Get-RequiredHeader $submit "Location" "Submit"
    $waitSeconds  = Get-RequiredRetryAfter $submit "Submit"
    Write-Host "Operation URL: $operationUrl"
}
else {
    if (-not [Uri]::IsWellFormedUriString($ResumeOperationUrl, [UriKind]::Absolute)) {
        throw "ResumeOperationUrl must be the unchanged absolute operation URL returned by the service."
    }

    $operationUrl = $ResumeOperationUrl
    $waitSeconds = 0
    Write-Host "Resuming operation URL: $operationUrl"
}

# 2. Poll the operation URL (unchanged) until it succeeds or fails.
$deadline = [DateTime]::UtcNow.AddMinutes($TimeoutMinutes)
do {
    if ([DateTime]::UtcNow -gt $deadline) { throw "Timed out waiting for $operationUrl." }
    if ($waitSeconds -gt 0) {
        Write-Host "Waiting $waitSeconds seconds..."
        Start-Sleep -Seconds $waitSeconds
    }

    $poll = Invoke-WebRequest -Method Get -Uri $operationUrl -Headers $headers -SkipHttpErrorCheck
    Assert-ApiResponse $poll @(200) "Operation status" $operationUrl
    $operation = $poll.Content | ConvertFrom-Json -AsHashtable
    if ($operation -isnot [hashtable] -or -not $operation.ContainsKey("status")) {
        throw "Operation status returned an invalid response body."
    }

    Write-Host "$([DateTime]::Now.ToString('T'))  status = $($operation.status)"
    if ($operation.status -eq "Running") {
        $waitSeconds = Get-RequiredRetryAfter $poll "Running operation status"
    }
} while ($operation.status -eq "Running")

if ($operation.status -eq "Failed") {
    throw "Report generation failed: $($operation.error)"
}
if ($operation.status -ne "Succeeded") {
    throw "Operation returned unexpected status '$($operation.status)'."
}

# 3. Download the file from the Location URL (unchanged). PowerShell 7 decompresses the gzip
#    Content-Encoding response automatically. The service file name and URL can end in .gz,
#    while this script intentionally saves the decoded response with a .json extension.
$downloadUrl = Get-RequiredHeader $poll "Location" "Succeeded operation status"
if (-not $operation.ContainsKey("fileName") -or [string]::IsNullOrWhiteSpace([string]$operation.fileName)) {
    throw "Succeeded operation status didn't include fileName."
}

$jsonFileName = [IO.Path]::GetFileName(([string]$operation.fileName -replace "\.gz$", ""))
if (-not $jsonFileName.EndsWith(".json", [StringComparison]::OrdinalIgnoreCase)) {
    throw "The operation returned an unexpected JSON file name: '$($operation.fileName)'."
}

$jsonPath = Join-Path $OutputDirectory $jsonFileName
$download = Invoke-WebRequest -Method Get -Uri $downloadUrl -Headers $headers -SkipHttpErrorCheck
Assert-ApiResponse $download @(200) "Download" $operationUrl
[IO.File]::WriteAllText($jsonPath, $download.Content, [Text.UTF8Encoding]::new($false))
Write-Host "Saved report: $jsonPath"

# 4. Iterate through the rows and apply business logic.
$jsonText = Get-Content -LiteralPath $jsonPath -Raw
try {
    $jsonDocument = [System.Text.Json.JsonDocument]::Parse($jsonText)
}
catch [System.Text.Json.JsonException] {
    throw "The downloaded file isn't valid JSON: $($_.Exception.Message)"
}

try {
    $root = $jsonDocument.RootElement
    if ($root.ValueKind -ne [System.Text.Json.JsonValueKind]::Array) {
        throw "The downloaded JSON root must be an array."
    }

    $rowCount = $root.GetArrayLength()
    Write-Host "Report rows: $rowCount"

    $highUsage = for ($index = 0; $index -lt $rowCount; $index++) {
        $rowNumber = $index + 1
        $row = $root[$index]
        if ($row.ValueKind -ne [System.Text.Json.JsonValueKind]::Object) {
            throw "Row $rowNumber must be a JSON object."
        }

        if ($ReportName -eq "FeatureDetailsPerResource") {
            $total = (ConvertTo-RequiredReportDecimal $row "BilledCredits" $rowNumber) +
                (ConvertTo-RequiredReportDecimal $row "NonBilledCredits" $rowNumber)

            if ($total -gt $CreditThreshold) {
                $resourceId = Get-OptionalLabel $row @("ResourceID") ""
                [pscustomobject]@{
                    Agent        = Get-OptionalLabel $row @("ResourceName", "ResourceID") ""
                    AgentId      = $resourceId
                    Environment  = Get-OptionalLabel $row @("EnvironmentName", "EnvironmentID") ""
                    Feature      = Get-OptionalLabel $row @("Feature") ""
                    TotalCredits = [decimal]::Round($total, 2)
                }
            }
        }
        else {
            $total = (ConvertTo-RequiredReportDecimal $row "CapacityPackCreditsConsumed" $rowNumber) +
                (ConvertTo-RequiredReportDecimal $row "PayGoConsumedQuantity" $rowNumber)

            if ($total -gt $CreditThreshold) {
                [pscustomobject]@{
                    Environment     = Get-OptionalLabel $row @("EnvironmentName", "EnvironmentID") ""
                    EntitlementId   = Get-OptionalLabel $row @("EntitlementID") ""
                    BillingPolicyId = Get-OptionalLabel $row @("BillingPolicyId") ""
                    TotalCredits    = [decimal]::Round($total, 2)
                }
            }
        }
    }
}
finally {
    $jsonDocument.Dispose()
}

if ($highUsage) {
    Write-Host "`nRows over $CreditThreshold Copilot Credits:" -ForegroundColor Yellow
    $highUsage | Sort-Object TotalCredits -Descending | Format-Table -AutoSize
}
else {
    Write-Host "`nNo rows exceeded $CreditThreshold Copilot Credits." -ForegroundColor Green
}
```

> [!NOTE]
> Use the `Location` URLs exactly as returned by the service; don't construct operation or download URLs yourself. A URL or service file name can end in `.json.gz` because the response is gzip-compressed during transfer. PowerShell 7 normally honors `Content-Encoding: gzip`, so this script saves the decoded content as `.json` without manually decompressing it. The delegated token can expire during a long-running operation. After signing in again, pass the recorded operation URL to `-ResumeOperationUrl` instead of submitting another report.

***

## Verify your results

1. Confirm that the report file is a CSV with a header row or a JSON array. A header-only CSV or an empty JSON array (`[]`) is a valid result when no qualifying consumption exists for the requested dates.
2. Compare a few values from report rows with the corresponding dimensions under **Licensing** > **Copilot Studio** in the [Power Platform admin center](https://admin.powerplatform.microsoft.com). Small differences are expected for dates within the 30-day refresh window because late-arriving data and corrections can change the values.
3. `FeatureDetailsPerResource` classifies credits as billed and nonbilled. `BillingDetailsPerEnvironment` instead groups consumption by prepaid capacity and pay-as-you-go funding. These classifications don't necessarily map directly to one another. The reports can also use different date and processing bases, so their totals aren't guaranteed to reconcile. See [Credit classification and interpretation](/rest/api/power-platform/copilotstudio/licensing-reports/download-licensing-report-file#credit-classification-and-interpretation).

## Troubleshooting

| Problem | What to do |
| --- | --- |
| `400 Bad Request` with `InvalidRequestContent` | Check that `endDate` is on or after `startDate`, the dates use `yyyy-MM-dd`, and `startDate` is within the lookback (30 days by default). The error message names the earliest permitted date. |
| `401 Unauthorized` | Sign in again. For direct API calls, request a token for the `https://api.powerplatform.com` resource. If a submitted operation already exists, record and reuse its operation `Location` URL after renewing the token instead of submitting another report. |
| `403 Forbidden` | Sign in with a user account that has the Global Administrator, Power Platform Administrator, or Dynamics 365 Administrator role. Service principal connections aren't supported. |
| `404 Not Found` | Check the report name. For polling and downloads, use the `Location` URLs returned by the service unchanged. |
| `429 Too Many Requests` | If submission protection is enforced, wait for the interval specified by the service before submitting another report. REST and connector clients should honor `Retry-After`. The native CLI doesn't currently expose that header, so don't automatically retry using an assumed interval. Use the REST example when you need dynamic header handling. |
| Operation status is `Failed` | Stop polling that operation and submit a new request later. |
| Downloaded file looks like binary data | PowerShell 7 normally honors gzip `Content-Encoding`; don't manually decompress content that's already decoded. For a connector binary wrapper, base64-decode `$content` to text and parse the resulting JSON. If the decoded payload is still gzip-compressed data, stop and investigate how the client or connector handles the response rather than treating it as JSON. |
| In Power Automate or Copilot Studio, the initial `202` response headers aren't available after **Generate Licensing Report** | The submission action must return the initial `Location` and `Retry-After` without polling, with **Asynchronous Pattern On** (the default). Stop and check the connector version and response handling if these headers are absent. Don't extract an operation ID from a later status response, disable the setting, or switch designers. |
| **Feature Poll Status** returns HTTP 200 with `status: Running` | This is expected. **Feature Wait If Running** must read the latest `Retry-After`, delay for that many seconds, and let **Do until** poll again. Download only after the terminal check confirms `Succeeded` with a file name. |
| A `Running` response has a missing or invalid `Retry-After`, or the polling loop reaches a limit | Stop and inspect the run history. Don't substitute a zero-second delay, download an incomplete report, or submit another report in a tight loop. Retain the operation URL to resume polling the same operation after resolving the issue. |
| In Power Automate, **Parse report JSON** receives `$content-type` and `$content` | The connector returned a binary wrapper. Use `json(base64ToString(body('Download_Licensing_Report_File')?['$content']))` as the **Parse report JSON** content. This decodes the wrapper; it doesn't decompress gzip data. |
| In Power Automate, **Parse report JSON** fails | Confirm the request used `format=json`, the connector version exposes JSON, and the root is an array. The schema deliberately fails when either required credit field is missing, null, or nonnumeric. Update the schema and mappings if you intentionally switch report types. |
| A descriptive value is empty | Optional labels can be empty or null, so the examples use resource or environment IDs where available. Required credit fields must be present and numeric; the examples stop rather than treating missing credit data as zero. |

## Related information

- [Generate Licensing Report](/rest/api/power-platform/copilotstudio/licensing-reports/generate-licensing-report)
- [Get Licensing Report Operation](/rest/api/power-platform/copilotstudio/licensing-reports/get-licensing-report-operation)
- [Download Licensing Report File](/rest/api/power-platform/copilotstudio/licensing-reports/download-licensing-report-file)
- [Power Platform for Admins V2 connector reference](/connectors/powerplatformadminv2/)
- [Microsoft Power Platform CLI copilot-studio command group](/power-platform/developer/cli/reference/copilot-studio)
- [Install Microsoft Power Platform CLI](/power-platform/developer/cli/introduction#install-microsoft-power-platform-cli)
- [Tutorial: Manage Copilot Credits allocations programmatically](programmability-tutorial-manage-copilot-credit-allocations.md)
