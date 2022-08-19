---
title: "Set up the Power Platform Administration Planning tasks component | Microsoft Docs"
description: "Instructions for how to set up the Power Platform Administration Planning component of the CoE Starter Kit."
author: stjeffer
manager: phtopnes

ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/07/2022
ms.subservice: guidance
ms.author: stjeffer
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Set up the Power Platform administration planning component

This article will help you set up the [Power Platform Administration Planning component](admin-tasks-component.md) of the Center of Excellence (CoE) Starter Kit.

The Power Platform Administration Planning component contains:

- A Dataverse table
- The Admin Tasks model-driven app
- A flow that imports sample admin task data
- A Power BI dashboard

> [!NOTE]
> The Power Platform administration planning component doesn't have a dependency on other components of the CoE Starter Kit. They can be used independently.

## Import the Power Platform Administration Planning component solution

You'll need to download the COE Starter Kit file to install the Administration Planning solution, but the solution doesn't require you to install and use the rest of the COE Starter Kit.

1. Download the CoE Starter Kit compressed file ([aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload)).

1. Extract the zip file after downloading and before moving on to the next step.

   The CoE Starter Kit compressed file contains all solution and non-solution components that make up the CoE Starter Kit.

1. Import the <!--Can we please put the solution name here? I don't know what it is-->solution. (If you're [installing to a production environment](faq.md#installing-a-solution-in-a-production-environment), use the admintaskanalysis_core_x_x_x_xx_managed.zip solution file from the download.)

The import can take up to 15 minutes to be completed.

## Import sample admin task data

>[!NOTE]
>Importing the sample task data is optional but recommended.

If you want to pre-populate the solution with common administrative tasks, import data from the sample admin tasks spreadsheet. This task list can be particularly helpful when you're just getting started with Power Platform.

1. Launch the Admin Tasks app, which you installed as part of this component.
1. From the command bar, select **... > Import from Excel**.
1. Select **Choose File**.
1. Navigate to the location where you saved the 'Sample-task-data.xlsx' file and select **Open**.
1. Select **Next > Review mapping**.
1. Select the fields you want to import.
   > [!NOTE]
   > If you are new to Power Platform administration, importing all sample columns data can be helpful.
1. Select **Finish**.

An import job is created; you can track progress by selecting **Track Progress**.

If the import job successfully completes, all sample tasks should be present in the Dataverse table named 'Admin tasks'. Launch the Admin Tasks app to check that tasks were successfully imported. You should see the sample admin tasks:

![Launch the Admin Tasks app](media/Admin-task-app.png "Launch the Admin Tasks app")

By default, all tasks are set as Active.

<!--It's not clear to me whether the sample data is only the list of tasks or also all the rest of the columns filled out with example data too...?-->

## Configure the admin task data

The dashboard and insights this solution provides derive from admin task data that you interact with via the Admin Tasks app. <!--You could add more here if you want. I removed the table as it was redundant with the other page and didn't seem to add significant value here.-->

Launch the Admin Tasks app to start adding your own tasks or configuring tasks that you [imported from sample data](#importing-sample-admin-task-data). <!--Will it be obvious to them how to find and launch the app after they install the component?-->

## Set up the Power BI dashboard

The Power BI dashboard provides visualizations and insights into what your administration story looks like based on your task metadata. Follow the steps outlined to set up your dashboard.

You can configure and modify the Power BI dashboard by working directly with the Power BI (.pbit) file and Power BI Desktop.  Using Power BI desktop gives you the flexibility to modify the dashboard to your own branding and include or exclude visuals that you want to see in the dashboard.

1. Download and install [Microsoft Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494).

1. In Power BI Desktop, open the **PowerPlatformAdminPlanner.pbit** file, which can be found in [the CoE Starter Kit you downloaded and extracted](#set-up-the-power-platform-administration-planning-component).

1. Enter the URL of the environment where you imported the solution.

   > [!IMPORTANT]
   > Do not include the https:// prefix, or the '/' suffix when adding the environment URL.

1. Save the dashboard locally or select **Publish** and choose the workspace you want to publish the report to.

1. [Configure scheduled refresh](/power-bi/connect-data/refresh-data#configure-scheduled-refresh) for your Power BI Dataset to update the report daily.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
