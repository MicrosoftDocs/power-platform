---
title: "Set up the Power BI dashboard | MicrosoftDocs"
description: "The Power BI dashboard provides a holistic view with visualizations and insights into resources in your tenant - learn how to configure and set this up for your tenant."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
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

The Power BI dashboard provides a holistic view with visualizations and insights into resources in your tenant: environments, apps, Power Automate flows, connectors, connection references, makers, and audit logs. Telemetry from the audit log is stored from the moment you set up the Center of Excellence (CoE) Starter Kit, so over time you can look back and identify trends.

![CoE Starter Kit Power BI dashboard](media/pb-1.PNG "CoE Starter Kit Power BI dashboard")

You can get the CoE Power BI dashboard by downloading the Power BI file and configuring it in Power BI Desktop. This will allow you to make changes to it. You are required you to get the environment URL in order to use the Dashboard.

> [!NOTE]
> - Before setting up the Power BI dashboard, you must have installed the [CoE core components solution](setup-core-components.md).<br>
> - Before you see data in the dashboard, the [core components solution sync flows](core-components.md#admin--sync-template-v2) will need to have completed their runs.

## Get the environment URL

You need the environment URL of the Microsoft Power Platform environment the CoE Starter Kit is installed in. Power BI will connect to the Microsoft Dataverse tables in that environment.

1. Go to the [Power Platform admin center](https://aka.ms/ppac).

1. Select **Environments**, and select the environment where the CoE solution is installed.

1. Copy the organization URL in the details window.

   ![Power Platform admin center, with the environment URL highlighted](media/coe19.png "Power Platform admin center, with the environment URL highlighted")

   If the URL is truncated, you can see the full URL by selecting **See all** > **Environment URL**.

   ![Environment settings available in the Power Platform admin center](media/coe20.png "Environment settings available in the Power Platform admin center")

## Configure the Power BI dashboard

You can configure and modify the Power BI dashboard by working directly with the Power BI (.pbit) file and Power BI Desktop. This gives you flexibility in terms of modifying the dashboard to your own branding, and including (or excluding) pages or visuals you want to see (or not see) in the dashboard.

1. In Power BI Desktop, open the PowerPlatformAdminDashboard.pbit file, which can be found in the CoE Starter Kit you downloaded from [aka.ms/CoeStarterKitDownload](https://aka.ms/CoEStarterKitDownload).

1. Enter the URL of your environment instance (including the https:// prefix) for **OrgUrl**, and&mdash;if prompted&mdash;sign in to Power BI Desktop with your organization account that has access to the environment you installed the CoE Starter Kit in.

   ![Enter OrgUrl to configure Power BI dashboard](media/pbit.png "Enter OrgUrl to configure Power BI dashboard")

1. Save the dashboard locally, or select **Publish** and choose the workspace you want to publish the report to.

You can find the report later by going to [app.powerbi.com](https://app.powerbi.com/).

### (Optional) Configure embedded apps in the CoE dashboard

The dashboard can be configured to use embedded apps to enable you to drive action based on insights you find. With the embedded apps, you can grant yourself access to resources, delete apps and flows, and reach out to the maker via email. You'll have to import the apps first, and then configure them in the dashboard.

#### Import embedded apps

1. Go to **[make.powerapps.com](https://make.powerapps.com)** in the environment where you installed the CoE Starter Kit.
1. On the left pane, select **Apps**.
1. Select **Import canvas app**.

   ![Import canvas app](media/coe83.png "Import canvas app")

1. Import the **Admin – Access this app** app (Admin-AccessthisApp.zip).
1. Configure all the connections.
1. Repeat the same steps for the **Admin – Access this flow** app (Admin-AccessthisFlow.zip). 

#### Embed apps into the Power BI dashboard

You'll now configure the Power Apps visuals in the Power BI dashboard to point to the apps you just imported.

1. Open the CoE Power BI dashboard in **Power BI Desktop**.
1. Go to the **App Detail** page.

      ![Go to App Detail page in Power BI Desktop](media/coe84.PNG "Go to App Detail page in Power BI Desktop")

1. Select **Power Apps for Power BI** from **Visualizations**.

     ![Power Apps in Power BI visual](media/coe85.PNG "Power Apps in Power BI visual")

1. Select the fields from your dataset that you want to use in the app.
1. With the visual selected, select **admin_appid** from **App** (on the **Fields** pane).

     ![Select admin_appid from App and add it to the Power Apps Data area on the visual](media/coe86.PNG "Select admin_appid from App and add it to the Power Apps Data area on the visual")

1. With the visual selected, select the **admin_environmentid** environment (on the **Fields** pane).

     ![Select admin_environmentid from App for Power Apps Data](media/coe87.PNG "Select admin_environmentid from App for Power Apps Data")

1. In the Power Apps for Power BI visual, select the environment of your CoE (where you imported the apps to).

     ![Select the environment in Power Apps for the Power BI visual](media/coe88.PNG "Select the environment in Power Apps for the Power BI visual")

1. Select **Choose app**.
1. Select **Admin – Access this app**.

     ![Select Admin - Access this app to embed this app into Power BI](media/coe89.PNG "Select Admin - Access this app to embed this app into Power BI")

1. Resize and move the visual to the location you want. Delete the placeholder from the template, and move your embedded app to the same place.

**To configure the app on the Flow Detail page**

1. Go to the **Flow Detail** tab.
1. Select the **Power Apps visual** from **Visualizations**.
   Select the fields from your dataset that you want to use in the app.
1. With the visual selected, select the **admin_flowid** and **admin_flowenvironment** flows under **Fields**.

     ![Select admin_flowid and admin_flowenvironment from Flow and add it to the Power Apps Data area on the visual](media/coe91.PNG "Select admin_flowid and admin_flowenvironment from Flow and add it to the Power Apps Data area on the visual")

1. In the visual, select the environment of your CoE (where you imported the apps to).
1. Select **Choose app**.
1. Select **Admin – Access this flow**.

     ![Select Admin - Access this flow to embed this app into Power BI](media/coe90.PNG "Select Admin - Access this flow to embed this app into Power BI")

1. Resize and move the visual to the location you want. Delete the placeholder from the template, and move your embedded app to the same place.

Republish the dashboard, and view it under [app.powerbi.com](https://app.powerbi.com/).
