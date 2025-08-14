---
title: "Set up the Power BI dashboard | MicrosoftDocs"
description: "The Microsoft Power BI dashboard provides a holistic view with visualizations and insights into resources in your tenant. Learn how to configure and set up your dashboard for your tenant."
author: manuelap-msft

ms.component: pa-admin
ms.topic: how-to
ms.date: 09/26/2024
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
---

# Set up the Power BI dashboard

The Microsoft Power BI dashboard provides a holistic overview with visualizations and insights into the resources of your tenant: environments, apps, Power Automate flows, connectors, connection references, makers, and audit logs. Telemetry from the audit log is stored when you set up the Center of Excellence (CoE) Starter Kit, so you can identify trends over time.

:::image type="content" source="media/pb-1.png" alt-text="Screenshot of the CoE Starter Kit Power BI dashboard." lightbox="media/pb-1.png":::

[Watch a walk-through (video)](https://www.youtube.com/watch?v=Lsooi7xp6eA&list=PLi9EhCY4z99W5kzaPK1np6sv6AzMQDsXG&index=1&t=1942s) on how to set up the Power BI dashboard.

## Which dashboard should I use?

You can get the CoE Power BI dashboard by downloading the CoE Starter Kit compressed file ([aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload)).

This file contains some Power BI template files:

- **Production_CoEDashboard_MMMYY.pbit** - Use this file if your Power Platform inventory data source is from [cloud flows](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory).
- **BYODL_CoEDashboard_MMMYY.pbit** - Use this file if your Power Platform inventory data source is from [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory).
- **PowerPlatformGovernance_CoEDashboard_MMMYY.pbit** - Use this file in addition to the above dashboards to gain further actionable governance and compliance insights into your adoption.

## Prerequisites

- Install the [CoE core components solution](setup-core-components.md).
- Set up the solution with the **CoE Setup and Upgrade Wizard**.
- Allow the [core components solution sync flows](core-components.md#flows) to complete their runs.
- Configure the [Audit Log solution area](setup-auditlog-http.md) to see data about app usage, for example *last launched*.

## Get the environment URL

You need the URL of the Power Platform environment where the CoE Starter Kit is installed. Power BI connects to Dataverse tables in that environment.

1. Go to the [Power Platform admin center](https://aka.ms/ppac).
1. Select **Environments**, then choose your environment where your CoE solution is installed.
1. Copy the organization URL in the details window, including the `https://` prefix and the ending slash `/`.

   :::image type="content" source="media/coe19.png" alt-text="Screenshot of the Power Platform admin center with the environment URL highlighted." lightbox="media/coe19.png":::

   If the URL is truncated, you can see the full URL by selecting **See all** > **Environment URL**.
  
   :::image type="content" source="media/coe20.png" alt-text="Screenshot showing the Environment settings available in the Power Platform admin center." lightbox="media/coe20.png":::

## Configure the Production and Governance Power BI dashboard

You can configure and modify the Power BI dashboard by working directly with the Power BI pbit file and Power BI Desktop. The Power BI Desktop allows you to customize your dashboard to your own branding and select only the pages or visuals you want to see.

1. Download and install [Microsoft Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

1. In Power BI Desktop, open the pbit file found in the CoE Starter Kit you downloaded from [aka.ms/CoeStarterKitDownload](https://aka.ms/CoEStarterKitDownload).

1. Enter the URL of your environment instance. Include the `https://` prefix for **OrgUrl**. The **Production_CoEDashboard_MMMYY.pbit** has a **Tenant Type** parameter. If you're a regular commercial tenant, leave the dropdown as the default *Commercial*, otherwise pick your sovereign cloud.

1. If prompted, sign in to Power BI Desktop with your organization account, containing the CoE Starter Kit environment.

   :::image type="content" source="media/pbit.png" alt-text="Screenshot that shows where you enter your OrgUrl to configure Power BI dashboard." lightbox="media/pbit.png":::

1. Save the dashboard locally or select **Publish**, and choose the workspace where you want to publish your report.

   > [!TIP]
   > If you're publishing and wish to retain the URL after each upgrade, select a name to copy over each month. For example, use Contoso CoE Governance.

1. [Configure scheduled refresh](/power-bi/connect-data/refresh-data#configure-scheduled-refresh) for your Power BI Dataset to update the report daily.

   You can find the report later by going to [app.powerbi.com](https://app.powerbi.com/).

## Configure the BYODL Power BI dashboard

### Copy Azure Storage account URL

1. Navigate to the [Azure portal](https://portal.azure.com).
1. Search for or select the storage account configured to receive [Data Export data](/power-platform/admin/self-service-analytics#set-up-the-data-export-process-for-your-tenant).
1. Select **Endpoints**.
1. Copy the Data Lake Storage URL.
1. Append `/powerplatform` to the URL.

### Import Power BI dataflows

Power BI dataflows can transform data from the Azure Storage account into tables that get used by the dashboard. But first, you must configure the Power BI dataflows.

1. Navigate to [app.powerbi.com](https://app.powerbi.com).
1. Select **Workspaces** > **Create a workspace**.
1. Provide a name and description, select **Advanced**, and choose **Premium per user** or **Premium per capacity** depending on what’s available in your tenant.
1. Select **Large dataset storage format**. You can also use an existing premium workspace, if available.

   :::image type="content" source="media/byodlbi-1.png" alt-text="Screenshot that shows the Create a workspace pane you see when creating a new premium workspace." lightbox="media/byodlbi-1.png":::

   > [!NOTE]
   > A Power BI Premium trial is sufficient if you are only testing the integration of the [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory) feature with the CoE Starter Kit.

1. Select **+ New** > **Dataflow**. If prompted, select **No, create dataflow** instead of a datamart.
   :::image type="content" source="media/byodlbi-2.png" alt-text="Screenshot that shows how to create a new dataflow workspace." lightbox="media/byodlbi-2.png":::
1. Select **Import Model** and upload the **PowerPlatformAdminAnalytics-DF.json** file, which can be found in the [CoE Starter Kit you downloaded](https://aka.ms/CoEStarterKitDownload).
   :::image type="content" source="media/byodlbi-3.png" alt-text="Screenshot that shows the Import model option highlighted." lightbox="media/byodlbi-3.png":::
1. From the workspace, select **Datasets + Dataflows** to see your imported dataflow.
1. Edit the dataflow.
   :::image type="content" source="media/byodlbi-4.png" alt-text="Screenshot that shows where the Edit menu option is located for your dataset." lightbox="media/byodlbi-4.png":::
1. Select **Edit tables**.
   :::image type="content" source="media/byodlbi-5.png" alt-text="Screenshot that shows where the Edit tables option is located from the menu bar. This option allows you to edit the tables of the imported dataflow." lightbox="media/byodlbi-5.png":::
1. Select the Datalake URL parameter.
   :::image type="content" source="media/byodlbi-6.png" alt-text="Screenshot that shows where you can update the Datalake URL parameter to point to your Azure Storage account URL." lightbox="media/byodlbi-6.png":::
1. Paste the Azure Storage account URL and make sure it ends with `/powerplatform` (no trailing slash `/`).
1. From the **Queries** view, select one table after the other to configure connections and sign in with your account. If creating the connection fails, try selecting **Source** under **Applied steps** to retry configuring the connection.
   :::image type="content" source="media/byodlbi-7.png" alt-text="Screenshot that shows how to configure a connection." lightbox="media/byodlbi-7.png":::
1. Select **Continue** when you see a notification about connecting data from multiple sources.
1. Select **Save and Close** and wait for the validation to finish.
1. Select **Close** to close the **Edit tables** view.
1. Select the overflow menu **…** > **Settings** on the dataflow.
1. Configure a daily schedule refresh. A good time to refresh your dataflow is just after files write to your storage account by the Data Export feature. Therefore, your dataflow runs after data is exported to your storage account.
   :::image type="content" source="media/byodlbi-8.png" alt-text="Screenshot that shows where to schedule a refresh for your dataflow." lightbox="media/byodlbi-8.png":::
1. Refresh the dataflow manually. The initial refresh might take one to two hours to run, depending on the size of your inventory. Check the **Refresh history** to see when the refresh completes.
1. Copy the Power BI workspace and dataflow ID contained in the URL. Parts of the ID are removed for security purposes in the example images, but you should see a full ID number in your URL.
   1. Select the dataflow and copy the Workspace ID by looking at the URL and copying the GUID after `/groups/`.
      :::image type="content" source="media/byodlbi-9.png" alt-text="Screenshot that shows where you copy the workspace ID in the URL." lightbox="media/byodlbi-9.png":::
   1. Select the dataflow and copy the Dataflow ID by looking at the URL and copying the GUID after `/dataflows/`.
      :::image type="content" source="media/byodlbi-10.png" alt-text="Screenshot that shows where you copy the dataflow ID in the URL." lightbox="media/byodlbi-10.png":::

### Configure the Power BI dashboard

1. In Power BI Desktop, open the **BYODL_CoEDashboard_MMMYY.pbit** file found in the [CoE Starter Kit you downloaded](https://aka.ms/CoEStarterKitDownload).

1. Enter your URL and ID.

   1. Enter the URL of your environment instance, including the `https://` prefix for **OrgUrl**.
   1. Enter the ID to your Power BI Workspace for **Power BI Workspace ID**.
   1. Enter the ID to your Power BI Dataflow for **Power BI Dataflow ID**.
   1. If you're a regular commercial tenant, leave the **Tenant Type** dropdown to default, otherwise pick your sovereign cloud.

1. If prompted, sign in to Power BI Desktop with your organization account that has access to your CoE Starter Kit environment.

1. Save the dashboard locally or select **Publish** and choose the workspace where you want to publish your report.

1. [Configure scheduled refresh](/power-bi/connect-data/refresh-data#configure-scheduled-refresh) for your Power BI Dataset to update the report daily.

You can find the report later by going to [app.powerbi.com](https://app.powerbi.com/).

## Configure embedded apps in the CoE dashboard

The **Production_CoEDashboard_MMMYY.pbit** and **BYODL_CoEDashboard_MMMYY.pbit** dashboards can be configured to use embedded apps to enable you to drive action based on insights you find. With the embedded apps, you can grant yourself access to resources, delete apps and flows, and reach out to the maker through email. You must configure the Power Apps visuals in the Power BI dashboard before you can use them.

### Prerequisites to configure embedded apps

- You must be an owner or co-owner of the **Admin – Access this app** and **Admin – Access this flow** apps to be able to embed them.
- Because this app uses Microsoft Dataverse, end-users must have a **Power Apps Per User** license, the app must be assigned a **Power Apps Per App** license, or the environment must be covered by pay-as-you-go.
- The user must be assigned the Power Platform Service Admin role or have admin permissions, since the app is for admins only.

### Embed the apps

1. Open the CoE Power BI dashboard in **Power BI Desktop**.
1. Go to the **Manage App Access** page.
1. Select the existing Power Apps visual, then choose **Format visual** and select **Reset to default**.
1. Close the sharing notification.
   :::image type="content" source="media/coebireset2.png" alt-text="Screenshot that shows how to close the sharing notification." lightbox="media/coebireset2.png":::

1. Select **Choose app**.

1. Select the environment of your CoE, where you imported the apps.
   :::image type="content" source="media/coe88.png" alt-text="Screenshot that shows where to select Choose app." lightbox="media/coe88.png":::

1. Search for and select **Admin – Access this App [works embedded in Power BI only]**.
   :::image type="content" source="media/coe89.png" alt-text="Screenshot that shows where to add the app access." lightbox="media/coe89.png":::

   > [!TIP]
   > The app doesn't work when browsing directly to the page, but only works when an app is sent in via a drill through.

1. Go to the **Manage Flow Access** tab and repeat the previous steps, but selecting the **Admin - Access this Flow [works embedded in Power BI only]** app this time.

Republish the dashboard, and view it under [app.powerbi.com](https://app.powerbi.com/).

## Troubleshooting

### Unable to connect (provider Named Pipes Provider, error: 40 – Couldn't open a connection to SQL Server)

This error message means the connector failed to connect to the tabular data stream (TDS) endpoint. This error can occur when the URL used with the connector includes `https://` and/or the ending slash `/`. Remove the `https://` and ending slash `/` so the URL is in the form `orgname.crm.dynamics.com`.

:::image type="content" source="media/pbi_error.png" alt-text="Screenshot that shows the error message: Unable to connect." lightbox="media/pbi_error.png":::

### A connection was successfully established with the server, but an error occurred during the handshake before you sign in

This error message means the connector failed to connect to the TDS endpoint. This error can occur if the ports, the TDS endpoint uses, are blocked. For more information, see [Ports required for using SQL to query data](/powerapps/developer/data-platform/dataverse-sql-query#blocked-ports).

:::image type="content" source="media/pbi_error2.png" alt-text="Screenshot that shows the second type of error message that happens after you connect." lightbox="media/pbi_error2.png":::

### Unable to open document: The queries were authored with a newer version of Power BI Desktop and might not work with your version

This error message means you're on the current version of Power BI Desktop, select **Close** to continue, and [set up the latest version](https://www.microsoft.com/download/details.aspx?id=58494).

:::image type="content" source="media/pbi_error3.png" alt-text="Screenshot that shows the Unable to open document error message." lightbox="media/pbi_error3.png":::

### Sign-in issues

When you see sign-in issues, your data source settings might be cached to the wrong user or tenant. Here are a few examples of what that might look like:

:::image type="content" source="media/pbi-signin-failure1.png" alt-text="Screenshot that shows the remote name not resolved error." lightbox="media/pbi-signin-failure1.png":::
:::image type="content" source="media/pbi-signin-failure2.png" alt-text="Screenshot that shows the authorization not specified error." lightbox="media/pbi-signin-failure2.png":::

The solution in this case is to clear the permissions:

1. Open Power BI Desktop.
1. Select **File** > **Options and settings** > **Data source settings**.
1. Select the data source for the connection, for example `https://mycoe.crm.dynamics.com`, then select **Clear Permissions**.
1. Try to open the Power BI template file again.

### Not prompted for parameters

If you're not prompted for the input parameters like **OrgURL** when you open the pbit files, clear the cache:

1. Open the pbit file and select discard changes.
   :::image type="content" source="media/pbi_error4.png" alt-text="Screenshot that shows where to select Discard changes." lightbox="media/pbi_error4.png":::
1. Reopen the pbit file.

   You're prompted for the input parameters.

### Data source error: Information is needed in order to combine data

This error message might appear when you're using the BYODL Dashboard. The [privacy settings](/power-bi/enterprise/desktop-privacy-levels) likely aren't configured correctly. As a result, Power BI can't combine data from the Azure Storage account and Dataverse.

Change the privacy level and update the credentials to resolve the issue:

1. Open Power BI Desktop.
1. Select **File** > **Options and settings** > **Options**.
1. Select **Global** > **Privacy** and set the privacy level to **Always combine data according to your Privacy Level settings for each source**.
   :::image type="content" source="media/coepbi-byodl.png" alt-text="Screenshot that shows where to set the privacy level in Options." lightbox="media/coepbi-byodl.png":::

1. Select **OK**, and then select **File** > **Options and settings** > **Options** again.
1. Select **Current File** > **Privacy** and set the privacy level to **Combine data according to your Privacy Level settings for each source**.
   :::image type="content" source="media/coepbi-byodl2.png" alt-text="Screenshot that shows where to set the privacy level in Options for the current file." lightbox="media/coepbi-byodl2.png":::

1. Select **OK**.
1. Select **File** > **Options and settings** > **Data source settings**.
1. Select **Edit Permissions** and set the privacy level to **Organizational** for both data sources.
   :::image type="content" source="media/coepbi-byodl3.png" alt-text="Screenshot that shows where to set the privacy level in Edit permissions section of your Data source settings." lightbox="media/coepbi-byodl3.png":::

1. Save and refresh the report in Power BI Desktop.
1. Select **Publish**.
1. Navigate to [app.powerbi.com](https://app.powerbi.com/) and select your workspace.
1. Select **Datasets + dataflows**.
1. Select **Settings** on the dataset.
   :::image type="content" source="media/coepbi-byodl5.png" alt-text="Screenshot that shows where to find Settings in the overflow menu." lightbox="media/coepbi-byodl5.png":::
1. Select **Data Source Credentials**.
1. Select **Edit credentials**, set the privacy level to **Organizational** for both data sources, and select **Sign in** for each data source.
   :::image type="content" source="media/coepbi-byodl4.png" alt-text="Screenshot that shows where to configure privacy settings." lightbox="media/coepbi-byodl4.png":::

## I found a bug with the CoE Starter Kit. Where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
