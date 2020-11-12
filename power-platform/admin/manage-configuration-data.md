---
title: "Move configuration data across organizations  | MicrosoftDocs"
description: Move configuration data across organizations
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/08/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Move configuration data across environments and organizations with the Configuration Migration tool

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

The Configuration Migration tool enables you to move configuration data across environments and organizations. Configuration data is used to define custom functionality in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), and is typically stored in custom entities. Configuration data is different from end user data (account, contacts, and so on). A typical example of configuration data is what you define in [!INCLUDE[pn_unified_service_desk_for_crm](../includes/pn-unified-service-desk-for-crm.md)] to configure a customized call center agent application. The [!INCLUDE[pn_unified_service_desk](../includes/pn-unified-service-desk.md)] entities, along with the configuration data that is stored in the entities, define an agent application. For more information about [!INCLUDE[pn_unified_service_desk](../includes/pn-unified-service-desk.md)], see [Unified Service Desk Guide](/dynamics365/customer-engagement/unified-service-desk/unified-service-desk).  
  
 The Configuration Migration tool enables you to:  
  
- Select the entities and fields from where you want to export the configuration data.  
  
- Avoid duplicate records on the target system by defining a uniqueness condition for each entity based on a combination of fields in the entity, which is used to compare against the values on the target system. If there are no matching values, a unique record is created on the target system. If a matching record is found, the record is updated on the target system.  
  
  > [!NOTE]
  > If no duplicate detection (uniqueness) condition is specified for an entity that is being exported, the tool uses the primary field name of the entity to compare against the existing data on the target system.  
  
- Disable plug-ins before exporting data and then re-enable them on the target system after the import is complete for all the entities or selected entities.  
  
- Validate the schema for the selected entities to be exported to ensure that all the required data/information is present.  
  
- Reuse an existing schema to export data from a source system.  

- Automatically move DateTime fields forward at import for demo environments.
  
- Embed the exported modules created from this tool (schema and data files) in other programs. For example, you can use the exported data in Package Deployer along with other solutions files and data to create and deploy packages on a environment. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Deploy packages using  Package Deployer](/powerapps/developer/common-data-service/package-deployer/create-packages-package-deployer)  
  
For information on downloading the Configuration Migration tool, see [Download tools from NuGet](https://docs.microsoft.com/powerapps/developer/common-data-service/download-tools-nuget).

<a name="HowItWorks"></a>   

## How does the Configuration Migration tool work? 
 The following diagram illustrates how the Configuration Migration tool is used for migrating configuration data.  
  
 ![Configuration migration process flow diagram](../admin/media/config-migration-process-flow.png "Configuration migration process flow diagram")  
  
 ![Step 1 symbol](../admin/media/config-migration-step-icon.png "Step 1 symbol") **Define the schema of the source data to be exported**: The schema file (.xml) contains information about the data that you want to export such as the entities, attributes, relationships, definition of uniqueness of the data, and whether the plug-ins should be disabled before exporting the data. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create a schema to export configuration data](create-schema-export-configuration-data.md)  
  
 ![Step 2 symbol](../admin/media/config-migration-step-two.png "Step 2 symbol") **Use the schema to export data**: Use the schema file to export the data into a .zip file that contains the data and the schema of the exported data. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create a schema to export configuration data](create-schema-export-configuration-data.md)  
  
 ![Step 3 symbol](../admin/media/configuration-migration-step-icon.png "Step 3 symbol") **Import the exported data**: Use the exported data (.zip file) to import into the target environment. The data import is done in multiple passes to first import the foundation data while queuing up the dependent data, and then import the dependent data in the subsequent passes to handle any data dependencies or linkages. This ensures clean data import. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Import configuration data](import-configuration-data.md)  
  
<a name="Logfiles"></a>   

## Troubleshoot configuration data migration issues using log files  
 The Configuration Migration tool provides logging support to get detailed information about errors that can occur while signing in to the environment using the tool, activities performed by the tool during the schema definition and export/import of the configuration data, and information about the data that was imported using the tool. There are three log files generated by the tool that are available at the following location on the computer where you run the tool: c:\Users\\*\<UserName>*\AppData\Roaming\Microsoft\Microsoft Dataverse Configuration Migration Tool\\*\<Version>*.  
  
- **Login_ErrorLog.log**: Provides information about the issues that occurred when you use the tool to sign in to the environment. If there are any issues during sign in, a message appears on the tool’s login screen with a link to this log file. The message states that an error occurred while processing the login request and the user can view the error log. You can click the link in the message to view this log file. The log file is created the first time you encounter any sign-in issues in the tool. Thereafter, the log file is used to log information about a sign-in issue, whenever it occurs.  
  
- **DataMigrationUtility.log**: Provides detailed information about each task performed in the tool during last run. You can view the log file from the tool by clicking the **Logs** menu on the main screen, and clicking **Running Log**.  
  
- **ImportDataDetail.log**: Provides detailed information about the data imported in the last import job by using the tool. Each time you run an import job using this tool, the existing details from the log file are moved to a file called ImportDataDetail._old.log in the same directory, and the ImportDataDetail.log file displays information about the latest import job run using the tool. You can view this log file from the tool by clicking the **Logs** menu on the main screen, and then clicking **Last Import Log**.  
  
<a name="BestPractices"></a>   

## Best practices for migrating your configuration data by using the tool  
 The following are things you should consider while using this tool to migrate your configuration data:  
  
-   While creating the export data schema, you must define uniqueness rules appropriately for each entity to avoid any unintentional data updates on the target system.  
  
-   Import the exported data in a pre-production environment (preferably a mirror image of the production environment) to ensure that the data import results are as you intended.  
  
-   Back up your production environment before importing the data.  
  
### See also  
[Download tools from NuGet](https://docs.microsoft.com/powerapps/developer/common-data-service/download-tools-nuget)<br />
[Create a schema to export configuration data](create-schema-export-configuration-data.md)<br />
[Modify a configuration data schema](modify-configuration-data-schema.md)<br /> 
[Import configuration data](import-configuration-data.md)<br /> 
[Manage product catalog configuration](../admin/manage-product-catalog-configuration.md)
