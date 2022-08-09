---
title: "Set up Admin tasks component | MicrosoftDocs"
description: "The admin tasks component contains a model driven app for managing your admin tasks."
author: stjeffer
manager: phtopnes

ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/14/2020
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
# Setup admin tasks component

This article will help you set up the admin tasks components of the Center of Excellence (CoE) Starter Kit.

If your organization is just getting started, or already using Power Platform, defining administrative tasks and analyzing where you spend time administrating the platform enables you to:

- Plan your team structure.
- Expose opportunities for automation and innovation.

The admin tasks component contains the following:

- Dataverse table
- Model driven app
- Sample data import flow
- Power BI Dashboard

Install the solution following the steps below:
 
## Import the core components solution

1. Download the CoE Starter Kit compressed file ([aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload)).

    >[!IMPORTANT]
    > **Extract the zip file** after downloading and before moving on to the next step. The CoE Starter Kit compressed file contains all solution components in addition to the non–solution-aware components that make up the CoE Starter Kit.

1. Import the solution:
    1. If you're [installing to a production environment](faq.md#installing-a-solution-in-a-production-environment), use the CenterOfExcellenceCoreComponents_x_x_x_xx_managed.zip solution file from the download.

1. Update environment variable values by using the [relevant information](#gather-environment-variable-values). The environment variables are used to store application and flow configuration data with data specific to your organization or environment. This means that you only have to set the value once per environment and it will be used in all necessary flows and apps in that environment. All the flows in the solution depend on all environment variables' being configured.

The import can take up to 15 minutes to be completed.

>[!NOTE]
>The next steps walk you through turning on the Import-SampleTaskData cloud flow.

## Turn on cloud flow

If you plan to import sample admin task data, you should turn on the following cloud flow:

- Import-SampleTaskData

## Import sample admin task data

If you are getting started or simply want to populate the solution with common administrative tasks, then you should import data from the sample admin tasks spreadsheet.

### Import data

1. Copy the file 'Sample-task-data.xlsx' to a location that can be accessed by Power Automate (e.g. OneDrive, SharePoint site).
1. From solution explorer > Import-SampleTaskData cloud flow > ... > Edit
1. Expand the first action labeled 'List rows present in a table' and update the following action parameters:
    1. Location
    1. Document Library
    1. File
    1. Table
1. Then save the flow.


The final step is to run the flow, which will import the sample admin tasks to the Dataverse table.

### Admin tasks - model driven app

Launch the Admin tasks app to start adding administrative tasks, or to configure tasks that you imported via the Sample-task-data.xlsx spreadsheet.

![Launch the admin tasks app](media/Admin-task-app.png "Launch the Admin tasks app")





[!INCLUDE[footer-include](../../includes/footer-banner.md)]
