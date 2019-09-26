---
title: "Modify a configuration data schema  | MicrosoftDocs"
description: Modify a configuration data schema
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/29/2017
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Modify a configuration data schema 

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 

You can modify an existing schema file to include information about new configuration data or to update the existing configuration data definition to enhance the configuration data export process.  
  
<a name="Prereq"></a>   

## Before you begin 

Download the Configuration Migration Tool. The Configuration Migration tool is available as a [NuGet package](https://www.nuget.org/packages/Microsoft.CrmSdk.XrmTooling.ConfigurationMigration.Wpf). To download the tool, see [Download tools from NuGet](/dynamics365/customer-engagement/developer/download-tools-nuget.md). Follow the steps on this page to extract the **DataMigrationUtility.exe** tool. 

- You must have a schema file that was created using the Configuration Migration tool. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create a schema to export configuration data](create-schema-export-configuration-data.md)  
  
<a name="EditSchema"></a> 

## Modify a schema file  
  
1. Start the Configuration Migration tool. Double-click **DataMigrationUtility.exe** in the folder: \[your folder]\Tools\ConfigurationMigration\  
  
2. On the main screen, click **Create schema**, and click **Continue**.  
  
3. On the **Login** screen, provide authentication details to connect to your [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] environment for which you originally created the export data schema file. If you have multiple organizations on the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] server, and want to select an organization, select the **Always display list of available orgs** check box. Click **Login**.  
  
4. If you have multiple organizations, and you selected the **Always display list of available orgs** check box, the next screen lets you choose the organization that you want to connect to. Select a [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps organization to connect to.  
  
5. On the main screen, click **File** > **Load Schema**.  
  
6. Navigate to the schema file that you want to edit, select it, and click **Open**.  
  
7. The schema file definition appears in the Configuration Migration tool. Make the required changes to the schema definition file. For information about defining a schema file, see steps 5-14 in [Create a schema to export configuration data](create-schema-export-configuration-data.md).  
  
8. Save the updated schema file.  
  
9. Click **Exit** to close the tool.  
  
### See also  
 [Import configuration data](import-configuration-data.md)   
 [Create a schema to export configuration data](create-schema-export-configuration-data.md)   
 [Manage your configuration data](manage-configuration-data.md)
