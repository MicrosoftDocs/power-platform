---
title: Set up exporting to Application Insights | Microsoft Docs
description: About setting up exporting to Application Insights from the Power Platform admin center
services: powerapps
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/08/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Set up  exporting to Application Insights 

## Prerequisites

1.	Ensure that you have an Application Insights instance set up for receiving the data as well as the  Environment (Org) with a database. 
   - You (admin) must have one of - contributor, writer or admin rights, for the Application Insights instance created.
   - The Application Insights instance must be unique for an environment/org. Note that Application Insights OOB reports will not function correctly if a single Application Instance has multiple environments data.
2.	The data export setup in the Power Platform Admin Center will require one of these roles - Power Platform Service admin, Dynamics 365 admin, Microsoft 365 Global admin. 

## Set up export to your Applications Insights instance from the Power Platform Admin Center

1.	In the Power Platform Admin Center, on the left nav bar, go to the Data Export option. Click on new data export.

> [!div class="mx-imgBorder"] 
> ![Data export](media/data-export.png "Data export")

2.	Select Export to Application Insights. 

> [!div class="mx-imgBorder"] 
> ![Data export to Application Insights](media/data-export-application-insights.png "Data export to Application Insights")

3.	Search for the environment that you will set up for the Application Insights data export setup. You can choose to filter based off the environment type.

> [!div class="mx-imgBorder"] 
> ![Select an environment type](media/data-export-application-insights-select-environment-type.png "Select an environment type")

Save, once you choose the environment.

> [!div class="mx-imgBorder"] 
> ![Select an environment](media/data-export-application-insights-select-environment.png "Select an environment")

4.	Now choose the Azure subscription, Resource Group and Application Insights instance and click on Create. You must have one of - contributor, writer or admin rights to the Application Insights instance. Typically a production environment/org will map to one Application Insights instance. 

> [!div class="mx-imgBorder"] 
> ![Data export Application Insights details](media/data-export-application-insights-details.png "Data export Application Insights details")

5.	The data export connection should now be set up. In the next 24 hours, data will start being exported to your Application Insights instance.

> [!div class="mx-imgBorder"] 
> ![Data export success](media/data-export-application-insights-success.png "Data export success")

6.	In case you decide that you would like to stop the data export to Application Insights, you can choose to Delete export. You could set up a new connection whenever you decide to restart the data export.

> [!div class="mx-imgBorder"] 
> ![Delete export](media/data-export-delete.png "Delete export")

## Regional Availability 


|Zone  |Public Preview Availability  |
|---------|---------|
|Canada     | Jan 2021        |
|EMEA     | Jan 2021        |
|North America     | Jan 2021        |
|Germany  | Azure Dependencies        |
|France     | March 2021        |
|South America     | Jan 2021        |
|Asia Pacific     |  Jan 2021       |
|Japan     |  Jan 2021       |
|UK     | Jan 2021        |
|OCE     | Jan 2021        |
|India     | March 2021        |
|South Africa (ZAF)     | Azure Dependencies        |
|UAE     | March 2021        |
|Switzerland (CHE)     | Azure Dependencies        |



