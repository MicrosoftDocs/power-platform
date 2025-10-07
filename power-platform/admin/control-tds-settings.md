---
title: Control access of the TDS endpoint 
description: Learn how to control user access with the TDS endpoint settings in Power Platform.
author: sericks007
ms.author: paulliew
ms.reviewer: matp
ms.component: pa-admin
ms.subservice: admin
ms.topic: how-to
ms.date: 12/09/2024
search.audienceType: 
  - admin
---
# Control access of the TDS endpoint

The Tabular Data Stream (TDS) protocol is an application-level protocol used for the transfer of requests and responses between clients and database server systems. When enabled in a Power Platform environment, you can use this protocol to access Microsoft Dataverse using Power BI, Excel, and dataflows.

The Dataverse TDS endpoint has two settings, which control the level of access to the TDS endpoint.

- Environment-level. The feature environment setting **Enable TDS endpoint**. This setting controls whether the environment listens to TDS traffic. To enable, go to **Settings** > **Product** > **Features**. Under **TDS endpoint**, select **Enable TDS endpoint.**
- User-level. This setting is located in the same location as the environment-level setting. The **Enable user level access control for TDS endpoint** setting determines whether all environment users have access to the TDS endpoint or if access is controlled at the individual user level.
  - When disabled (default) all environment users have access to use the TDS endpoint to access the data they have permission to access. 
  - When enabled, users don't have access to use the TDS endpoint unless the **Allow user to access TDS endpoint** miscellaneous privilege is assigned to the user in a security role.

## Features dependent on the TDS endpoint

The features listed here require the TDS endpoint:

- Power BI Desktop: When using the Dataverse connector in Power BI Desktop app the Dataverse TDS endpoint is used. This feature allows users to connect to Dataverse and create reports and dashboards using the Power BI Desktop app. 
- Power BI service: This feature allows users to publish and share their Power BI Desktop reports and dashboards to the Power BI online service, where they can access and refresh data from Dataverse using the Dataverse connector. 
- Power Apps visualize this view: This feature allows users to create and embed Power BI visuals in their Power Apps model-driven apps, using data from Dataverse views. More information: [Visualize data in a view with Power BI service](/power-apps/user/visualize-in-power-bi)
- Excel Get data: This feature allows users to import data from Dataverse data into Excel using the Power Query editor and Dataverse connector, where they can transform and analyze the data. More information: [Import using a connector](/power-apps/maker/data-platform/data-platform-import-export#import-using-a-connector)
- Power Platform dataflows: This feature allows users to import and transform data from Dataverse using the Dataverse connector.  
- Omnichannel for customer service real-time analytics dashboard: This feature allows users to monitor and optimize their digital contact center. More information: [Overview of Omnichannel real-time analytics dashboard](/dynamics365/customer-service/use/intro-realtime-analytics-dashboard)
- Power Automate visualizing task mining processes: This feature allows users to visualize the process map and identify optimizations. More information: [Visualize processes](/power-automate/process-advisor-visualize)

## Enable individual user level control for TDS endpoint

In addition to enabling the environment settings, when using individual user level control the Power Platform administrator must ensure the appropriate security roles have the **Allow user to access TDS endpoint** privilege enabled and all users who need access to the TDS endpoint have membership in those roles.

### Enable user level control

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com) open the environment you want, and then go to **Settings** > **Product** > **Features**.
1. In the **TDS endpoint** section, make sure **Enable TDS endpoint** is turned on. 
1. Under **Enable TDS endpoint**, turn on **Enable user level access control for TDS endpoint**.  
   :::image type="content" source="media/enable-user-level-tds.png" alt-text="Enable user level access control for TDS endpoint setting":::
   > [!IMPORTANT]
   > The **Enable TDS endpoint** setting must be turned on for this setting to work.
1. Select **Save**.
1. Go to the security roles section in the Power Platform admin center, **Settings** > **Users + permissions** > **Security roles**.
1. Select the security role where users who need to use the TDS endpoint will be assigned.  
  a. Select the **Miscellaneous privileges** tab, select the **Show all privileges** in the dropdown list. In the **Search** box enter *TDS*, and then press Enter.  
  b. Select the **Allow user to access TDS endpoint** privilege and set the **Privilege Level** to **Organization**.
    :::image type="content" source="media/allow-user-access-TDS.png" alt-text="Allow user access to TDS endpoint privilege" lightbox="media/allow-user-access-TDS.png":::
  c. Select **Save**.
1. Assign those users who need TDS endpoint access to the security role. More information: [Assign a security role to a user](assign-security-roles.md)

> [!Note]
> - To access the data in Dataverse, users are required to have data access permissions to the tables in their assigned security role, in addition to the miscellaneous privilege to access the TDS endpoint.

## Known issues when users aren't properly assigned privileges

If the user level access control is enabled, users without the **Allow user to access TDS endpoint** miscellaneous privilege get the error message "Attempted to perform an unauthorized operation. User misses prvAllowTDSAccess privilege" when trying to retrieve data using the TDS endpoint. The error message can occur at different points depending on the application being used.

Another issue occurs in Power BI desktop with the Dataverse connector in the **Get Data** dialog when displaying the environment list in the navigator and trying to expand the table list. This action fails with an authentication error or the missing privilege error.

To resolve these issues, add the user to a security role that has the privilege described in [Enable individual user level control for TDS endpoint](#enable-individual-user-level-control-for-tds-endpoint).
