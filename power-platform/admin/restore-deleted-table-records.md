---
title: Restore deleted Microsoft Dataverse table records
description: Learn how to use the Power Platform admin center to view restore deleted Microsoft Dataverse table records.
author: rijoshi1
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/27/2026
ms.subservice: admin
ms.author: rijoshi
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
- Mattp123
- JimDaly
ms.contributors:
   - erjost
   - hnatuva
   - shahzorkhan123
   - matp
ms.custom: sfi-image-nochange
---

# Restore deleted Microsoft Dataverse table records

As part of the regular business processes with Microsoft Dataverse, users often delete records or transactions either manually or systematically, either planned or by accident, via system processes, single selection, multiple selections, and bulk deletion. Retrieving deleted data is hard and often records aren't always recoverable. To address this limitation, manage deleted records from this environment is available to recover table record data from most types of delete scenarios within a specified configurable time frame.

Developers should read [Restore deleted records with code](/power-apps/developer/data-platform/restore-deleted-records) to learn how to interact with this feature using code.

## Prerequisites

To restore deleted Dataverse records, turn on the **Keep deleted Dataverse records** setting in your environment.

### Keep deleted Dataverse records

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin).
1. Select **Manage** > **Environments** and then open the environment you want.
1. Select **Settings** > **Product** > **Features**.
1. Scroll down to view the **Deleted records** area, and select the **Keep deleted Dataverse records** option.
1. In the **Keep deleted records (days)** box, enter the number of days, between 1 and 30, to keep deleted records.
1. Select **Save**.
1. Allow 30 minutes for the system to configure the feature.
    > [!NOTE]
    > You can only restore records deleted after the feature is turned on.

## View and restore the deleted records in Power Apps

You can proactively manage the storage used by deleted records. At any time, you can free up this storage by selecting the **Delete all records** option, which permanently removes all deleted items currently consuming storage.

### Power Platform admin center

To restore deleted records from the admin center, sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a user with the system administrator security role and complete the following steps.

1. Select **Manage**.
1. Select **Environments** and open the environment you want to view and restore deleted records.
1. Go to **Settings** > **Data management** > **Deleted Records**.
1. View all the deleted records from all tables.
1. Select one or more records you wish to restore, and then select **Restore** on the command bar.
1. Select **OK** to confirm the action to restore.

### Power Platform Environment Settings app

To restore deleted records from the Power Platform Environment Settings app:

1. Sign in to the Power Platform environment as a user with the system administrator security role.
1. Select the **Power Platform Environment Settings** app, or select **Settings** > **Advanced Settings**.
1. Go to **System** > **Data management** > **Deleted Records**.
1. View all the deleted records from all tables.
1. Select one or more records to restore, and then select **Restore** on the command bar.
1. Select **OK** to confirm the restoration.

## Troubleshooting and limitations

### Deleted records feature only supports delete operations

The deleted records feature only supports delete operations, not updates.

### Restore operation only supports records

The restore operation only supports records. It doesn't support recovering organizations or tables.

### Some records aren't restored

Some organizations add custom business logic that deletes records related to a record that is deleted. To restore related records deleted by custom business logic, you need to apply the opposite logic on the `Restore` operation to recover the records when you restore the original record that was deleted.

You can restore records deleted through the table relationship cascade behavior process. For more information about cascade behavior, see [Configure table relationship cascading behavior](/power-apps/developer/data-platform/configure-entity-relationship-cascading-behavior).

### Deleted records don't appear after turning on the _Keep delted Dataverse records_ feature

#### Before you troubleshoot 
Deleted records are only kept after the **Keep deleted Dataverse records** feature is turned on. Records deleted before you turned on the feature can't be restored.

Turning on the **Keep deleted Dataverse records** feature triggers a background system job called **Enable keeping deleted data for Organization**. This job must complete successfully before deleted records are kept for restoration later. Even though the feature is turned on, that doesn't guarantee that the job has finished.

#### How the job works
- When you turn on the feature, the system job is automatically created and begins running.
- If the job **succeeds**, it is automatically removed from the **System Jobs** list. Its absence means success.
- If the job **fails**, it remains in the list for a few days so you can open it and view the error details.

#### Check the system job status

1. Open the Power Platform admin center.
1. Select the environment where the issue is occurring.
1. Go to **Settings** > **Audit and logs** > **System jobs**.
1. On the **All System Jobs** page, search for **Enable keeping deleted data for Organization**.

#### Interpreting what you see

| What you see       | What it means | Action |
|--------------------|------------------|------------------|
| Job is not listed | Job completed and was automatically removed. This is the expected outcome. | Verify by checking whether the recently deleted record appears under **Settings** > **Data management** > **Deleted records**.    | 
| Job is listed, Status: Succeeded | Job completed successfully and hasn't been cleaned up yet.	| No action needed. |
| Job is listed, Status: Failed | Job encountered an error. | Open the job to view error details, then contact support. |
| Job is listed, Status: Waiting or In Progress | Job is still running. | Wait a few minutes and refresh. |

#### When to contact support
Contact a [Microsoft support representative](get-help-support.md) if any of the following apply:
- The job shows Failed and you cannot resolve the error from the details provided.
- The job is no longer listed (or shows Succeeded) but the deleted records still don't appear under **Data management** > **Deleted records**
- It has been more than 30 minutes since you turned on the feature, but deleted records still don't appear under **Data management** > **Deleted records**.

### Records deleted through cascading behaviors aren't present in Deleted Records view

Records deleted through automated, cascading behaviors can't be restored independently. You need to restore these records in the order in which they were deleted. The original record that was deleted must be restored before any related records that were deleted through automated cascading behaviors.

For more information about cascading behavior, see [Configure table relationship cascading behavior](/power-apps/developer/data-platform/configure-entity-relationship-cascading-behavior).

## Tables not supported

When the deleted records feature is generally available, it is enabled for most tables.

Some tables don't support restoring deleted records. These tables include:

- [Virtual tables](/power-apps/maker/data-platform/create-edit-virtual-entities)
- Tables that store [solution components](../alm/solution-concepts-alm.md#solution-components)
- [Elastic tables](/power-apps/maker/data-platform/create-edit-elastic-tables)
- Tables with more than 600 attributes

Check the attribute count for a specific entity using **{organizationUrl}/api/data/v9.0/EntityDefinitions(LogicalName='account')/Attributes?$count=true**.

Developers can [detect which tables are enabled for deleted record keeping](/power-apps/developer/data-platform/restore-deleted-records#detect-which-tables-are-enabled-for-deleted-record-keeping) in their environment.

### Tables that the deleted records feature doesn't support

As of August 2024, the query to [detect which tables don't have deleted records feature enabled](/power-apps/developer/data-platform/restore-deleted-records#detect-which-tables-arent-enabled-for-deleted-record-keeping) returns these tables in an uncustomized Dataverse environment.

Your environment might return different results. Tables might not be supported if you customize them by adding a large number of columns.

:::row:::
   :::column:::
      `aaduser`<br />
      `aicopilot`<br />
      `aiplugin`<br />
      `aipluginconversationstartermapping`<br />
      `aipluginexternalschemaproperty`<br />
      `aipluginoperation`<br />
      `aipluginoperationresponsetemplate`<br />
      `annualfiscalcalendar`<br />
      `appaction_appactionrule_classicrules`<br />
      `appactionrule`<br />
      `appconfig`<br />
      `application`<br />
      `applicationuser`<br />
      `applicationuserrole`<br />
      `appmodulecomponent`<br />
      `appnotification`<br />
      `asyncoperation`<br />
      `attributeimageconfig`<br />
      `backgroundoperation`<br />
      `bot_botcomponent`<br />
      `bot_environmentvariabledefinition`<br />
      `botcomponent_aipluginoperation`<br />
      `botcomponent_connectionreference`<br />
      `botcomponent_environmentvariabledefinition`<br />
      `botcomponent_workflow`<br />
      `bulkdeletefailure`<br />
      `businessunit`<br />
      `callbackregistration`<br />
      `card`<br />
      `cardstateitem`<br />
      `catalogassignment`<br />
      `columnmapping`<br />
      `componentversion`<br />
      `componentversionnrddatasource`<br />
      `connectionreference`<br />
      `connectionroleassociation`<br />
      `copilotexamplequestion`<br />
      `copilotsynonyms`<br />
      `customapi`<br />
      `customapiresponseproperty`<br />
      `customcontroldefaultconfig`<br />
      `datalakefolder`<br />
      `datalakeworkspace`<br />
      `dataprocessingconfiguration`<br />
      `desktopflowbinary`<br />
      `displaystring`<br />
      `duplicaterulecondition`<br />
      `dvfilesearchattribute`<br />
      `dvtablesearch`<br />
      `dvtablesearchentity`<br />
      `entity`<br />
      `entitydataprovider`<br />
      `entityindex`<br />
      `entityrecordfilter`<br />
      `environmentvariabledefinition`<br />
      `eventexpanderbreadcrumb`<br />
      `expiredprocess`<br />
      `fabricaiskill`<br />
      `federatedknowledgeconfiguration`<br />
      `fieldpermission`<br />
      `fixedmonthlyfiscalcalendar`<br />
      `flowlog`<br />
      `flowmachinegroup`<br />
      `flowmachineimageversion`<br />
      `flowrun`<br />
      `goal`<br />
      `importentitymapping`<br />
      `importjob`<br />
      `importmap`<br />
      `interactionforemail`<br />
      `kbarticletemplate`<br />
      `lookupmapping`<br />
      `mainfewshot`<br />
      `managedproperty`<br />
      `metadataforarchival`<br />
      `mobileofflineprofileitem`<br />
      `mobileofflineprofileitemfilter`<br />
      `msdyn_aiconfiguration`<br />
      `msdyn_aitemplate`<br />
      `msdyn_componentlayer`<br />
      `msdyn_connectordatasource`<br />
      `msdyn_dataflow_datalakefolder`<br />
      `msdyn_dataflowtemplate`<br />
      `msdyn_dmsrequest`<br />
      `msdyn_entitylinkchatconfiguration`<br />
      `msdyn_helppage`<br />
      `msdyn_knowledgeassetconfiguration`<br />
      `msdyn_knowledgesearchfilter`<br />
      `msdyn_modulerundetail`<br />
      `msdyn_odatav4ds`<br />
      `msdyn_pmbusinessruleautomationconfig`<br />
      `msdyn_pmcalendarversion`<br />
      `msdyn_pmprocessextendedmetadataversion`<br />
      `msdyn_pmprocessusersettings`<br />
      `msdyn_pmrecording`<br />
      `msdyn_pmview`<br />
      `msdyn_salesforcestructuredqnaconfig`<br />
      `msdyn_slakpi`<br />
      `msdyn_solutioncomponentcountsummary`<br />
      `msdyn_solutioncomponentsummary`<br />
      `msdyn_solutionhistorydatasource`<br />
      `msdyn_tour`<br />
      `mspp_adplacement`<br />
      `mspp_columnpermissionprofile`<br />
      `mspp_entityform`<br />
      `mspp_entitylist`<br />
      `mspp_pagetemplate`<br />
      `mspp_powerpagescoreentityds`<br />
      `mspp_publishingstatetransitionrule`<br />
      `mspp_shortcut`<br />
      `mspp_sitesetting`<br />
      `mspp_webform`<br />
      `mspp_webformstep`<br />
      `mspp_weblinkset`<br />
      `mspp_webpageaccesscontrolrule`<br />
      `mspp_website`<br />
      `mspp_websitelanguage`<br />
      `navigationsetting`<br />
      `nlsqregistration`<br />
      `ownermapping`<br />
      `pluginassembly`<br />
      `plugintracelog`<br />
      `position`<br />
      `powerbimashupparameter`<br />
      `powerfxrule`<br />
      `powerpagecomponent_powerpagecomponent`<br />
      `powerpagesite_dvfilesearch`<br />
      `powerpageslog`<br />
      `principalentitymap`<br />
      `privilegesremovalsetting`<br />
      `processstage`<br />
      `publisher`<br />
      `quarterlyfiscalcalendar`<br />
      `queuemembership`<br />
      `recordfilter`<br />
      `recyclebinconfig`<br />
      `relationshipattribute`<br />
      `reportcategory`<br />
      `retaineddataexcel`<br />
      `ribbonmetadatatoprocess`<br />
      `roleeditorlayout`<br />
      `roletemplate`<br />
      `runtimedependency`<br />
      `savedqueryvisualization`<br />
      `sdkmessagefilter`<br />
      `sdkmessageprocessingstepimage`<br />
      `searchtelemetry`<br />
      `serviceendpoint`<br />
      `serviceplanappmodules`<br />
      `serviceplanmapping`<br />
      `sharepointsite`<br />
      `sitemap`<br />
      `slaitem`<br />
      `solution`<br />
      `solutioncomponentattributeconfiguration`<br />
      `solutioncomponentconfiguration`<br />
      `solutionhistorydata`<br />
      `subscriptionsyncentryoffline`<br />
      `synapselinkprofile`<br />
      `synapselinkschedule`<br />
      `systemform`<br />
      `systemuserauthorizationchangetracker`<br />
      `systemuserroles`<br />
      `teamprofiles`<br />
      `teamtemplate`<br />
      `tracelog`<br />
      `transformationparametermapping`<br />
      `userform`<br />
      `userquery`<br />
      `virtualentitymetadata`<br />
      `webwizard`<br />
      `workflowbinary`<br />
      `workflowlog`<br />
      `workqueueitem`<br />
   :::column-end:::
   :::column:::
      `activityfileattachment`<br />
      `aicopilot_aiplugin`<br />
      `aipluginconversationstarter`<br />
      `aipluginexternalschema`<br />
      `aiplugininstance`<br />
      `aipluginoperationparameter`<br />
      `aiplugintitle`<br />
      `appaction`<br />
      `appactionmigration`<br />
      `appactionrule_webresource_scripts`<br />
      `appconfiginstance`<br />
      `applicationroles`<br />
      `applicationuserprofile`<br />
      `appmodule`<br />
      `appmoduleroles`<br />
      `appointment`<br />
      `attribute`<br />
      `attributemaskingrule`<br />
      `bot`<br />
      `bot_botcomponentcollection`<br />
      `botcomponent`<br />
      `botcomponent_botcomponent`<br />
      `botcomponent_dvtablesearch`<br />
      `botcomponent_msdyn_aimodel`<br />
      `botcomponentcollection`<br />
      `bulkdeleteoperation`<br />
      `calendar`<br />
      `canvasapp`<br />
      `cardentityconnections`<br />
      `catalog`<br />
      `channelaccessprofileentityaccesslevel`<br />
      `complexcontrol`<br />
      `componentversiondatasource`<br />
      `connectioninstance`<br />
      `connectionrole`<br />
      `connector`<br />
      `copilotglossaryterm`<br />
      `credential`<br />
      `customapirequestparameter`<br />
      `customcontrol`<br />
      `customcontrolresource`<br />
      `datalakefolderpermission`<br />
      `datalakeworkspacepermission`<br />
      `dependency`<br />
      `desktopflowmodule`<br />
      `duplicaterule`<br />
      `dvfilesearch`<br />
      `dvfilesearchentity`<br />
      `dvtablesearchattribute`<br />
      `elasticfileattachment`<br />
      `entityanalyticsconfig`<br />
      `entityimageconfig`<br />
      `entitykey`<br />
      `entityrelationship`<br />
      `environmentvariablevalue`<br />
      `exchangesyncidmapping`<br />
      `exportedexcel`<br />
      `featurecontrolsetting`<br />
      `federatedknowledgeentityconfiguration`<br />
      `fieldsecurityprofile`<br />
      `flowcredentialapplication`<br />
      `flowmachine`<br />
      `flowmachineimage`<br />
      `flowmachinenetwork`<br />
      `fxexpression`<br />
      `import`<br />
      `importfile`<br />
      `importlog`<br />
      `indexattributes`<br />
      `invaliddependency`<br />
      `keyvaultreference`<br />
      `mailmergetemplate`<br />
      `managedidentity`<br />
      `maskingrule`<br />
      `mobileofflineprofile`<br />
      `mobileofflineprofileitemassociation`<br />
      `monthlyfiscalcalendar`<br />
      `msdyn_aimodel`<br />
      `msdyn_appinsightsmetadata`<br />
      `msdyn_componentlayerdatasource`<br />
      `msdyn_dataflow`<br />
      `msdyn_dataflowconnectionreference`<br />
      `msdyn_datalakeds`<br />
      `msdyn_dmsrequeststatus`<br />
      `msdyn_formmapping`<br />
      `msdyn_insightsstorevirtualentity`<br />
      `msdyn_knowledgemanagementsetting`<br />
      `msdyn_mobileapp`<br />
      `msdyn_nonrelationalds`<br />
      `msdyn_pmanalysishistory`<br />
      `msdyn_pmcalendar`<br />
      `msdyn_pminferredtask`<br />
      `msdyn_pmprocesstemplate`<br />
      `msdyn_pmprocessversion`<br />
      `msdyn_pmtemplate`<br />
      `msdyn_salesforcestructuredobject`<br />
      `msdyn_schedule`<br />
      `msdyn_solutioncomponentcountdatasource`<br />
      `msdyn_solutioncomponentdatasource`<br />
      `msdyn_solutionhistory`<br />
      `msdyn_timelinepin`<br />
      `msdyn_workflowactionstatus`<br />
      `mspp_columnpermission`<br />
      `mspp_contentsnippet`<br />
      `mspp_entityformmetadata`<br />
      `mspp_entitypermission`<br />
      `mspp_pollplacement`<br />
      `mspp_publishingstate`<br />
      `mspp_redirect`<br />
      `mspp_sitemarker`<br />
      `mspp_webfile`<br />
      `mspp_webformmetadata`<br />
      `mspp_weblink`<br />
      `mspp_webpage`<br />
      `mspp_webrole`<br />
      `mspp_websiteaccess`<br />
      `mspp_webtemplate`<br />
      `newprocess`<br />
      `optionset`<br />
      `picklistmapping`<br />
      `pluginpackage`<br />
      `plugintype`<br />
      `powerbidataset`<br />
      `powerbireport`<br />
      `powerpagecomponent`<br />
      `powerpagesite`<br />
      `powerpagesitelanguage`<br />
      `principalentitybusinessunitmap`<br />
      `privilege`<br />
      `processsession`<br />
      `processtrigger`<br />
      `publisheraddress`<br />
      `queue`<br />
      `recentlyused`<br />
      `recurringappointmentmaster`<br />
      `relationship`<br />
      `report`<br />
      `reportparameter`<br />
      `retentionconfig`<br />
      `role`<br />
      `roleprivileges`<br />
      `roletemplateprivileges`<br />
      `savedquery`<br />
      `sdkmessage`<br />
      `sdkmessageprocessingstep`<br />
      `searchresultscache`<br />
      `semiannualfiscalcalendar`<br />
      `serviceplan`<br />
      `serviceplancustomcontrol`<br />
      `sharedlinksetting`<br />
      `similarityrule`<br />
      `sla`<br />
      `slakpiinstance`<br />
      `solutioncomponent`<br />
      `solutioncomponentbatchconfiguration`<br />
      `solutioncomponentrelationshipconfiguration`<br />
      `subscriptionstatisticsoffline`<br />
      `synapsedatabase`<br />
      `synapselinkprofileentity`<br />
      `syncerror`<br />
      `systemuser`<br />
      `systemuserprofiles`<br />
      `teammobileofflineprofilemembership`<br />
      `teamroles`<br />
      `template`<br />
      `transformationmapping`<br />
      `translationprocess`<br />
      `usermobileofflineprofilemembership`<br />
      `userqueryvisualization`<br />
      `webresource`<br />
      `workflow`<br />
      `workflowcardconnections`<br />
      `workqueue`<br />
   :::column-end:::
:::row-end:::

### Related information

[Restore deleted records with code](/power-apps/developer/data-platform/restore-deleted-records)
