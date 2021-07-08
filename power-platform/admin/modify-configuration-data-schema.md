---
title: "Modify a configuration data schema  | MicrosoftDocs"
description: Modify a configuration data schema
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/26/2020
ms.subservice: admin
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Modify a configuration data schema 

You can modify an existing schema file to include information about new configuration data or to update the existing configuration data definition to enhance the configuration data export process.  
  
<a name="Prereq"></a>   

## Before you begin 

Download the Configuration Migration Tool. The Configuration Migration tool is available as a [NuGet package](https://www.nuget.org/packages/Microsoft.CrmSdk.XrmTooling.ConfigurationMigration.Wpf). To download the tool, see [Download tools from NuGet](/powerapps/developer/common-data-service/download-tools-nuget). Follow the steps on this page to extract the **DataMigrationUtility.exe** tool. 

- You must have a schema file that was created using the Configuration Migration tool. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create a schema to export configuration data](create-schema-export-configuration-data.md)  
  
<a name="EditSchema"></a> 

## Modify a schema file  
  
1. Start the Configuration Migration tool. Double-select **DataMigrationUtility.exe** in the folder: \[your folder]\Tools\ConfigurationMigration\  
  
2. On the main screen, select **Create schema**, and select **Continue**.  
  
3. On the **Login** screen, provide authentication details to connect to your environment for which you originally created the export data schema file. If you have multiple organizations on the server, and want to select an organization, select the **Always display list of available orgs** check box. Select **Login**.  
  
4. If you have multiple organizations, and you selected the **Always display list of available orgs** check box, the next screen lets you choose the organization that you want to connect to. Select an organization to connect to.  
  
5. On the main screen, select **File** > **Load Schema**.  
  
6. Navigate to the schema file that you want to edit, select it, and select **Open**.  
  
7. The schema file definition appears in the Configuration Migration tool. Make the required changes to the schema definition file. For information about defining a schema file, see steps 5-14 in [Create a schema to export configuration data](create-schema-export-configuration-data.md).  
  
8. Save the updated schema file.  
  
9. Select **Exit** to close the tool.  
  
### See also  
 [Import configuration data](import-configuration-data.md)   
 [Create a schema to export configuration data](create-schema-export-configuration-data.md)   
 [Manage your configuration data](manage-configuration-data.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]