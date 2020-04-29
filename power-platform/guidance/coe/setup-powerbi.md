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

The Power BI dashboard provides a holistic view with visualizations and insights into resources in your tenant: environments, apps, Power Automate flows, connectors, connection references, makers and audit logs. Telemetry from the audit log is stored from the moment you set up the Center of Excellence (CoE) Starter Kit, so over time you can look back and identify trends.

![CoE Starter Kit Power BI dashboard](media/coe1.PNG "CoE Starter Kit Power BI dashboard")

You can either get the CoE Power BI dashboard from AppSource or download the Power BI file and configure it in Power BI Desktop, which will allow you to make changes to it. Both options are described below; both options require you to get the environment URL first.

Before setting up the Power BI dashboard, you must have installed the [CoE Core Components solution](setup-core-components.md).

## Get the environment URL

You need the environment URL of the Power Platform environment the CoE Starter Kit is installed in. Power BI will connect to the Common Data Service entities in that environment.

1. Go to the [Power Platform admin center](https://aka.ms/ppac).

1. Select **Environments**, and select the environment where the CoE solution is installed.

1. Copy the organization URL in the details window.

   ![Power Platform admin center, with the environment URL highlighted](media/coe19.png "Power Platform admin center, with the environment URL highlighted")

   If the URL is truncated, you can see the full URL by selecting **See all** > **Environment URL**.

   ![Environment settings available in the Power Platform admin center](media/coe20.png "Environment settings available in the Power Platform admin center")

## Option 1: Get the Power BI dashboard from AppSource

> [!NOTE]
> You can't deploy from AppSource if you're deploying to the government cloud (GCC). If you're using GCC, please use the [Configure the Power BI Dashboard by using the .pbix file](#configure-by-using-pbix-file) instructions below.

1. Go to the [CoE Starter Kit page on AppSource](https://appsource.microsoft.com/product/power-bi/powerapps_pbi.powerapps_coe).

1. Select **Get It Now**

   ![Power Platform CoE Starter Kit offer on AppSource](media/coe21.png "Power Platform CoE Starter Kit offer on AppSource")

1. Accept the terms and conditions, and make sure you have signed in by using your organization account.

1. Wait for the app to be installed.

1. After the app installation is finished, select **Go to app**.

   ![Your new app is ready](media/coe22.png "Your new app is ready")

1. To connect the dashboard to your own environment and data, select **Connect** 

   ![How to get started with your app from AppSource](media/coe24.png "How to get started with your app from AppSource")

1. Copy and paste the URL you retrieved in [Get the environment URL](#get-the-environment-url), above, and then select **Next**

   ![Connect to New Power Platform CoE Starter Kit Tenant](media/coe23.png "Connect to New Power Platform CoE Starter Kit Tenant")

1. Confirm your sign-in to finish setting up the app.

The dashboard app will appear under the **Reports** tab of your workspace, and can be opened from there.

## Option 2: Configure the Power BI dashboard by using the .pbix file<a name="configure-by-using-pbix-file"></a>

You can also configure and modify the Power BI dashboard by working directly with the Power BI (.pbix) file and the Power BI Desktop client. This gives you more flexibility in terms of modifying the dashboard to your own branding, and including (or excluding) pages or visuals you want to see (or not see) in the dashboard.

1. In the Power BI Desktop client, open the **PowerPlatformAdminDashboard.pbix** file, which can be found in the CoE Starter Kit you downloaded from [aka.ms/CoeStarterKitDownload](https://aka.ms/CoEStarterKitDownload).

1. Sign in to the Power BI Desktop client with your organization account that has access to the environment you installed the CoE Starter Kit in.

1. Go to **Transform Data** on the **Home** ribbon.

   ![Edit queries in Power BI Desktop](media/coe25.png "Edit queries in Power BI Desktop")

1. Select the **OrgUrl** parameter, and replace the URL with the URL of your instance. Be sure to keep the 'https://'.

   ![Set OrgUrl in Power BI](media/coe26.png "Set OrgUrl in Power BI")

1. Select **Close & Apply**. Your data will now load, and the dashboard will be updated.

1. Select **Publish**, and then choose the workspace you want to publish the report to.

You can find the report later by going to [app.powerbi.com](https://app.powerbi.com/).

### (Optional) Configure embedded apps in the CoE Dashboard

The dashboard can be configured to use embedded apps to enable you to drive action based on insights you find - with the embedded apps, you can grant yourself access to resources, archive and delete apps and flows, and reach out ot the maker via email.
You will have to import the apps first, and then configure them in the dashboard.

#### Import embedded Power Apps apps

**Pre-Requisite:** You must have a SharePoint site with a Document Library set up already, this will be used to store archived apps.

1. Navigate to **[flow.microsoft.com](https://flow.microsoft.com)** in the Environment where you have installed the CoE Starter Kit.
1. Import the **PowerApps Button Archive App Flow** (*PowerAppsButtonArchiveApp.zip*) file and configure the connections. This flow archives apps to a SharePoint Document Library.
1.	Once imported, **edit the flow** to update the SharePoint Site URL and Document Library name. Paste the top level SharePoint URL into the *archiveSiteUrl* variable and the Document Library name into the *archiveFolder* variable (if your document library contains spaces in the name, leave those as they are in the display name)

     ![Configure SharePoint Site URL and Document Library Name](media/coe82.png "Configure SharePoint Site URL and Document Library Name")

1. **Save** the flow.
1. **Navigate** to **[make.powerapps.com](https://make.powerapps.com)** in the Environment where you have installed the CoE Starter Kit
1. Select **Apps** in the navigation.
1. Select **Import Canvas App**.

    ![Import Canvas App](media/coe83.png "Import Canvas App")

1. Import the **Admin – Access this app** app (*Admin-AccessthisApp.zip*)
1. Configure all the connections, including pointing to the PowerApps Button Archive App Flow you have just imported.
1. Repeat the same steps for the **Admin – Access this flow** app (*Admin-AccessthisFlow.zip*). *Note:* This app is not linked to a flow, you will not have to update the connection references to include a Flow.

#### Embed apps into the Power BI Dashboard

You will now configure the Power App visuals in the Power BI Dashboard to point to the apps you have just imported.

1. Open the CoE Power BI Dashboard in **Power BI Desktop**
1. Navigate to the **App Detail** page.

      ![Navigate to App Detail page in Power BI Desktop](media/coe84.PNG "Navigate to App Detail page in Power BI Desktop")

1. Select the **Power App Visual** from Visualizations.

     ![PowerApps in Power BI Visual](media/coe85.PNG "PowerApps in Power BI Visual")

1. Select the fields from your data set that you would like to use in the app.
1. With the visual selected, select **admin_appid** from App (under Fields).

     ![Select admin_appid from App for PowerApps Data](media/coe86.PNG "Select admin_appid from App for PowerApps Data")

1. With the visual selected, select **admin_environmentid** from Environment (under Fields).

     ![Select admin_environmentid from App for PowerApps Data](media/coe87.PNG "Select admin_environmentid from App for PowerApps Data")

1. In the PowerApps for Power BI visual, select the **Environment** of your CoE (where you have imported the apps to).

     ![Select Environment in PowerApps for Power BI visual](media/coe88.PNG "Select Environment in PowerApps for Power BI visual")

1. Select **Choose app**.
1. Select **Admin – Access this app**.

     ![Select Admin - Access this app to embed this app into Power BI](media/coe89.PNG "Select Admin - Access this app to embed this app into Power BI")

1. Resize and move the visual to the desired location. Delete the placeholder that is in the template and move your embedded app to the same place.
1. Repeat the same steps to configure the app on the **Flow Detail** page
Navigate to the Flow Detail tab
1. Select the **Power App Visual** from Visualizations
1. The first step to include a Power App visual is to select the fields from your data set that you would like to use in the app.
1. With the visual selected, select **admin_flowid** and **admin_flowenvironment** from Flow (under Fields).

     ![Select admin_flowid and admin_flowenvironment from Flow for PowerApps Data](media/coe87.PNG "Select admin_flowid and admin_flowenvironment from Flow for PowerApps Data")

1. Your **PowerApps Data** configuration should look like this now.
1. In the visual, select the **Environment** of your CoE (where you have imported the apps to).
1. Select **Choose app**
1. Select **Admin – Access this flow**

     ![Select Admin - Access this flow to embed this app into Power BI](media/coe90.PNG "Select Admin - Access this flow to embed this app into Power BI")

1. Resize and move the visual to the desired location. Delete the placeholder that is in the template and move your embedded app to the same place.

Republish the dashboard and view it under [app.powerbi.com](https://app.powerbi.com/).
