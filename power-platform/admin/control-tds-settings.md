---
title: Control access through the TDS endpoint 
description: Learn how to control access through the TDS endpoint settings in Power Platform.
author: sericks007
ms.author: richdi
ms.reviewer: matp
ms.component: pa-admin
ms.subservice: admin
ms.topic: how-to
ms.date: 02/28/2024
search.audienceType: 
  - admin
---

# Control access through the TDS endpoint

The Tabular Data Stream (TDS) protocol is is an application-level protocol used for the transfer of requests and responses between clients and database server systems. When enabled, you can use this protocol to access Dataverse using Power BI, Excel, and dataflows.

The Dataverse TDS endpoint has two settings which control the level of access to the TDS endpoint.

- Environment-level. The first setting in the Power Platform admin center feature environment setting. To enable, go to Settings > Product > Features. Under TDS endpoint, and then select **Enable TDS endpoint**, which controls whether the environment will listen to TDS traffic.
- User-level. The second setting located in the same location as the environment-level setting,**Enable user level access control for TDS endpoint**, which determines whether all environment users have access (the default), or if access to the TDS endpoint is controlled at the individual user level with the **Allow user to access TDS endpoint** miscellaneous privilege is required to be assigned to a user in a security role.

## Features dependent on the TDS endpoint

- Power BI Desktop: When using the Dataverse connector in Power BI Desktop app the Dataverse TDS endpoint is used. This feature allows users to connect to Dataverse and create reports and dashboards using the Power BI Desktop app. 
- Power BI service: This feature allows users to publish and share their Power BI Desktop reports and dashboards to the Power BI online service, where they can access and refresh data from Dataverse using the Dataverse connector. 
- Power Apps "Visualize this View": This feature allows users to create and embed Power BI visuals in their Power Apps canvas apps, using data from Dataverse views. 
- Excel Get Data: This feature allows users to import data from Dataverse data into Excel using the Power Query editor and Dataverse connector, where they can transform and analyze the data. 
- Power Platform Data flows: This feature allows users to import and transform data from Dataverse using the Dataverse connector.  
Omnichannel for customer service real-time analytics dashboard: This feature allows users to monitor and optimize their digital contact center. More information  
Power Automate visualizing task mining processes: This feature allows users to visualize the process map and identify optimizations. More information 
 
## Enable individual user level control for TDS endpoint

When using individual user level control, the administrator MUST ensure all users needing access to the TDS endpoint and dependent features have the “Allow user to access TDS endpoint” privilege. This is done by adding the “Allow user to access TDS endpoint” privilege to the necessary security roles found under “Miscellaneous privileges” in the security role editor.  
Steps to enable user level control: 
1.	In the Power Platform admin center under Environment>Settings>Product>Features under the TDS endpoint section. Enable the “Enable user level access control for TDS endpoint” setting.  
  
2.	Go to the security roles section in the Power Platform admin center Environment>Settings>Users + permissions>Security roles 
3.	Select the security role which users will be assigned.  
a.	Select the Miscellaneous privileges tab, and search for “TDS” in the search box.  
b.	Select the “Allow user to access TDS endpoint” privilege and set privilege level to “Organization”. 
  
More information: [Security roles and privileges](security-roles-privileges.md)

## Errors when users are not properly assigned privileges

If the user level access control is enabled, users without the “Allow user to access TDS endpoint” miscellaneous privilege  will get the error message “Attempted to perform an unauthorized operation. User misses prvAllowTDSAccess privilege.” trying to retrieve data using the TDS endpoint. The error message may occur at different points depending on the application being used.  
Specifically for Power BI desktop when using the Get Data dialog to with the Dataverse connector when seeing the environment list in the navigator trying to expand the table list will fail with an authentication error or the missing privilege error.  
 

