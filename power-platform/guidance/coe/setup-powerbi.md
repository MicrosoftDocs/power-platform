---
title: "Set up the Power BI dashboard | MicrosoftDocs"
description: "The Power BI dashboard provides a holistic view with visualizations and insights into resources in your tenant - learn how to configure and set this up for your tenant."
author: manuelap-msft
manager: devkeydet

ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/10/2022
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Set up the Power BI dashboard

The Power BI dashboard provides a holistic view with visualizations and insights into resources in your tenant: environments, apps, Power Automate flows, connectors, connection references, makers, and audit logs. Telemetry from the audit log is stored from the moment you set up the Center of Excellence (CoE) Starter Kit, so you can look back and identify trends over time.

![CoE Starter Kit Power BI dashboard.](media/pb-1.PNG "CoE Starter Kit Power BI dashboard")

## Which dashboard to use?

You can get the CoE Power BI dashboard by downloading the CoE Starter Kit compressed file ([aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload)). **Extract the zip file** after downloading - it contains two Power BI template files:

- Use the **Production_CoEDashboard_MMMYY.pbit** file if you've installed the CoE Starter Kit in a Production environment.
- Use the **Teams_CoEDashboard_MMMYY.pbit** if you've installed the CoE Starter Kit in a Dataverse for Teams environment. This version connects to Microsoft Dataverse using the TDS endpoint, therefore the TDS Endpoint has to be enabled for the environment: [Manage feature settings](../../admin/settings-features.md).
- Use the **PowerPlatformGovernance_CoEDashboard_MMMYY.pbit** file in addition to the above dashboards to gain further actionable governance and compliance insights into your adoption. This report is only available if you've installed the CoE Starter Kit in a Production environment.

> [!NOTE]
>
> - Before setting up the Power BI dashboard, you must have installed the [CoE core components solution](setup-core-components.md).<br>
> - Before you see data in the dashboard, the [core components solution sync flows](core-components.md#flows) will need to have completed their runs.
> - Before you see data about app usage (ex last launched), you must have installed the [Audit Log solution](setup-auditlog.md)

## Get the environment URL

You need the environment URL of the Microsoft Power Platform environment the CoE Starter Kit is installed in. Power BI will connect to the Microsoft Dataverse tables in that environment.

- If you've installed the CoE Starter Kit in a Production environment:
    1. Go to the [Power Platform admin center](https://aka.ms/ppac).

    1. Select **Environments**, and select the environment where the CoE solution is installed.

    1. Copy the organization URL in the details window.

       ![Power Platform admin center, with the environment URL highlighted.](media/coe19.png "Power Platform admin center, with the environment URL highlighted")

       If the URL is truncated, you can see the full URL by selecting **See all** > **Environment URL**.

       ![Environment settings available in the Power Platform admin center.](media/coe20.png "Environment settings available in the Power Platform admin center")

- If you've installed the CoE Starter Kit in a Dataverse for Teams environment:
    1. Open the Power Apps app in Teams
    1. Select **Build** and select your CoE environment
        ![Select your CoE environment in the Power Apps app in Teams.](media/coe-dft-bi1.png "Select your CoE environment in the Power Apps app in Teams")
    1. Select **About** > **Session Details** and copy the Instance URL from there.
         ![Select the Instance URL of your environment.](media/coe-dft-bi2.png "Select the Instance URL of your environment")

## Configure the Power BI dashboard

You can configure and modify the Power BI dashboard by working directly with the Power BI (.pbit) file and Power BI Desktop. Using Power BI Desktop gives you flexibility to modify the dashboard to your own branding, and including (or excluding) pages or visuals you want to see (or not see) in the dashboard.

1. Download and install [Microsoft Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

1. In Power BI Desktop, open the .pbit file, which can be found in the CoE Starter Kit you downloaded from [aka.ms/CoeStarterKitDownload](https://aka.ms/CoEStarterKitDownload).

1. Enter the URL of your environment instance. If you're using the **Teams_CoEDashboard_MMMYY.pbit**, don't include the https:// prefix or / postfix for **OrgUrl**. If you're using the **Production_CoEDashboard_MMMYY.pbit** and **PowerPlatformGovernance_CoEDashboard_MMMYY.pbit**, include the https:// prefix for **OrgUrl**. If prompted, sign in to Power BI Desktop with your organization account that has access to the environment you installed the CoE Starter Kit in.

   ![Enter OrgUrl to configure Power BI dashboard.](media/pbit.png "Enter OrgUrl to configure Power BI dashboard")

1. Save the dashboard locally, or select **Publish** and choose the workspace you want to publish the report to.

1. [Configure scheduled refresh](/power-bi/connect-data/refresh-data#configure-scheduled-refresh) for your Power BI Dataset to update the report daily.

You can find the report later by going to [app.powerbi.com](https://app.powerbi.com/).

### Troubleshooting

The *Unable to connect (provider Named Pipes Provider, error: 40 – Couldn't open a connection to SQL Server)* error message means that the connector has failed to connect to the TDS endpoint. This error can occur when the URL used with the connector includes https:// and/or the ending /. Remove the https:// and ending forward slash so that the URL is in the form orgname.crm.dynamics.com.

![Error message: Unable to connect .](media/pbi_error.PNG "Error message: Unable to connect ")

The *A connection was successfully established with the server, but then an error occurred during the pre-login handshake* error message means that the connector has failed to connect to the TDS endpoint. This error can also occur if the ports the TDS endpoint uses are blocked. Learn more: [Ports required for using SQL to query data](/powerapps/developer/data-platform/dataverse-sql-query#blocked-ports)

![Error message: A connection was successfully established with the server, but then an error occurred .](media/pbi_error2.PNG "Error message:A connection was successfully established with the server, but then an error occurred ")

When you see *Unable to open document: The queries were authored with a newer version of Power BI Desktop and might not work with your version* as an error message and you are on the current version of Power BI Desktop, select **Close** to continue, and [setup latest version](https://www.microsoft.com/download/details.aspx?id=58494).

![Error message: Unable to open document .](media/pbi_error3.PNG "Error message: Unable to open document ")

When you see sign in issues, you may have issues with your data source settings being cached to the wrong user or tenant. Here are a few examples of what that might look like:
![Error message: Data Source Error. The remote name could not be resolved.](media/pbi-signin-failure1.PNG "Error message: Data Source Error. The remote name could not be resolved")
![Error message: Authorization wasn't specified.](media/pbi-signin-failure2.PNG "Error message: Authorization wasn't specified")

The solution in this case is to clear the permissions:

1. Open Power BI Desktop.
1. Select **File > Options and settings > Data source settings**.
1. Select the data source you need to connect to (for example, https://mycoe.crm.dynamics.com) and select **Clear Permissions**.
1. Then, try and open the Power BI template file again.

### (Optional) Configure embedded apps in the CoE dashboard

The **Production_CoEDashboard_MMMYY.pbit** and **Teams_CoEDashboard_MMMYY.pbit** dashboards can be configured to use embedded apps to enable you to drive action based on insights you find. With the embedded apps, you can grant yourself access to resources, delete apps and flows, and reach out to the maker via email. You'll have to configure the Power Apps visuals in the Power BI dashboard before you can use them.

1. Open the CoE Power BI dashboard in **Power BI Desktop**.
1. Go to the **App Detail** page.

      ![Go to App Detail page in Power BI Desktop.](media/coe84.PNG "Go to App Detail page in Power BI Desktop")

1. Select **Power Apps for Power BI** from **Visualizations**.

     ![Power Apps in Power BI visual.](media/coe85.PNG "Power Apps in Power BI visual")

1. Select the fields from your dataset that you want to use in the app.
1. With the visual selected, select **admin_appid** from **App** (on the **Fields** pane).

     ![Select admin_appid from App and add it to the Power Apps Data area on the visual.](media/coe86.PNG "Select admin_appid from App and add it to the Power Apps Data area on the visual")

1. With the visual selected, select the **admin_environmentid** environment (on the **Fields** pane).

     ![Select admin_environmentid from App for Power Apps Data.](media/coe87.PNG "Select admin_environmentid from App for Power Apps Data")

1. In the Power Apps for Power BI visual, select the environment of your CoE (where you imported the apps to).

     ![Select the environment in Power Apps for the Power BI visual.](media/coe88.PNG "Select the environment in Power Apps for the Power BI visual")

1. Select **Choose app**.
1. Select **Admin – Access this app**.

     ![Select Admin - Access this app to embed this app into Power BI.](media/coe89.PNG "Select Admin - Access this app to embed this app into Power BI")

1. Resize and move the visual to the location you want. Delete the placeholder from the template, and move your embedded app to the same place.
1. Next, go to the **Cloud flow detail** tab.
1. Select the **Power Apps visual** from **Visualizations**.
   Select the fields from your dataset that you want to use in the app.
1. With the visual selected, select the **admin_flowid** and **admin_flowenvironment** flows under **Fields**.

     ![Select admin_flowid and admin_flowenvironment from Flow and add it to the Power Apps Data area on the visual.](media/coe91.PNG "Select admin_flowid and admin_flowenvironment from Flow and add it to the Power Apps Data area on the visual")

1. In the visual, select the environment of your CoE (where you imported the apps to).
1. Select **Choose app**.
1. Select **Admin – Access this flow**.

     ![Select Admin - Access this flow to embed this app into Power BI.](media/coe90.PNG "Select Admin - Access this flow to embed this app into Power BI")

1. Resize and move the visual to the location you want. Delete the placeholder from the template, and move your embedded app to the same place.

Republish the dashboard, and view it under [app.powerbi.com](https://app.powerbi.com/).

## It looks like I found a bug with the CoE Starter Kit; where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]