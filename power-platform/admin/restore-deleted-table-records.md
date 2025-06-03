---
title: Restore deleted Microsoft Dataverse table records (preview)
description: Learn how to use the Power Platform admin center to view restore deleted Microsoft Dataverse table records.
author: shahzorkhan123
ms.component: pa-admin
ms.topic: how-to
ms.date: 06/02/2025
ms.subservice: admin
ms.author: shkhan
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
contributors:
- Mattp123
- JimDaly
ms.contributors:
- erjost
---

# Restore deleted Microsoft Dataverse table records (preview)

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

As part of the regular business processes with Microsoft Dataverse, users often delete records or transactions either manually or systematically, either planned or by accident, via system processes, single selection, multiple selections, and bulk deletion. Retrieving deleted data is hard and often records aren't always recoverable. To address this limitation, the recycle bin is available to recover table record data from most types of delete scenarios within a specified configurable time frame.

Developers should read [Restore deleted records with code (preview)](/power-apps/developer/data-platform/restore-deleted-records) to learn how to interact with this feature using code.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]
> - This feature is currently being deployed and might not yet be available in your region.
> - Any storage used by the recycle bin doesn't count against your organization's storage capacity.
> - The recycle bin feature **isn't available** for [Dataverse for Teams](about-teams-environment.md), trial environments, or default environments.

## Prerequisites

To restore deleted Dataverse records, turn on the recycle bin in your environment.

### Turn on the recycle bin

Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin) and complete the steps depending on whether you're using the new admin center or the classic admin center.

# [New admin center](#tab/modern)

1. Select **Environments** and open the environment you want.
1. Select **Settings** > **Product** > **Features**.
1. Scroll down to view the **Recycle Bin** settings.

   - Turn **On** the **Recycle Bin** setting.
   - Specify the recovery time interval that allows admins to restore table records. You can restore table records up to *30* days after the record was deleted.
  
1. Select **Save**.
1. Allow 30 minutes for the system to configure the recycle bin.
  
> [!NOTE]
> Only records deleted after the recycle bin feature has been turned on can be restored.

# [Classic admin center](#tab/classic)

1. Select **Environments** and open the environment you want.
1. Select **Settings** > **Product** > **Features**.
1. Scroll down to view the **Recycle Bin** settings.

   - Turn **On** the **Recycle Bin** setting.
   - Specify the time interval, to be able to restore table records. You can restore table records up to *30* days after the record was deleted.
  
1. Select **Save**.
1. Allow 30 minutes for the system to configure the recycle bin.
  
> [!NOTE]
> Only records deleted after the recycle bin feature has been turned on can be restored.

## View and restore the deleted records in Power Apps

Viewing and acting on the deleted records in the Power Apps user experience is only available for System Administrators in the preview phase.

### Power Platform admin center

To restore deleted records from the admin center, sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a user with the system administrator security role and complete the following steps depending on whether you're using the new admin center or the classic admin center.

# [New admin center](#tab/modern)

1. Select **Environments** and open the environment you want to view and restore deleted records.
1. Go to **Settings** > **Data management** > **View Deleted Records**.
1. You can view all the deleted records from all tables.
1. Select one or more records you wish to restore, and then select **Restore** on the command bar.
1. Select **OK** to confirm the action to restore.

# [Classic admin center](#tab/classic)

1. Select **Environments** and open the environment you want to view and restore deleted records.
1. Go to **Settings** > **Data management** > **View Deleted Records**.
1. You can view all the deleted records from all tables.
1. Select one or more records you wish to restore, and then select **Restore** on the command bar.
1. Select **OK** to confirm the action to restore.

### Power Platform Environment Settings app

To restore deleted records from the Power Platform Environment Settings app:

1. Sign in to the Power Platform environment as a user with the system administrator security role.
1. Select the **Power Platform Environment Settings** app, or select **Settings** > **Advanced Settings**.
1. Go to **System** > **Data management** > **View Deleted Records**.
1. You can view all the deleted records from all tables.
1. Select one or more records to restore, and then select **Restore** on the command bar.
1. Select **OK** to confirm the restoration.

## Turn off recycle bin for a table

To turn off the recycle bin for a table:

1. Sign in to [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc) as a user with the system administrator security role and verify the correct environment is selected.
1. Select **Tables** and open the table you want. If Tables isn't in the side panel, select […More](/power-apps/maker/canvas-apps/intro-maker-portal#1--left-navigation-pane) and then select it.
1. Select **Properties**, expand **Advanced options**, and clear **Enable recycle bin**. If the check box appears disabled, it means you don't have the permissions to enable the table for recycle bin, or the feature isn't turned on for the environment.
1. **Config Interval** represents the number of days data is persisted in the Recycle Bin for the table. Setting this value to **-1** uses the environment-default value for this table.

:::image type="content" source="media/disable-recyclebin-for-table.png" alt-text="Screenshot of the Disable Recycle Bin option for a table.":::

## Limitations

### Recycle bin is only supported for delete operations

The recycle bin only supports delete operations, not updates.

### Restore operation is for records

The restore operation is only for records. It doesn't support recovering organizations or tables.

### Some records aren't restored

Some organizations add custom business logic that deletes records related to a record that is deleted. To restore related records deleted by custom business logic, you need to apply the opposite logic on the `Restore` operation to recover the records when you restore the original record that was deleted.

Records deleted via the table relationship cascade behavior process can be restored. For more information about cascade behavior, go to [Configure table relationship cascading behavior](/power-apps/developer/data-platform/configure-entity-relationship-cascading-behavior).

### Deleted records aren't shown after turning on the recycle bin

Deleted records might not appear when the recycle bin feature is turned on. Verify that the **Enable RecycleBin for Organization** system job is turned on. Go to the Power Platform admin center, select the environment where this issue is happening, and select **Settings** > **Audit and logs** > **System jobs**. On the **System Jobs** page, search for **Enable RecycleBin**. Confirm that the **Status Reason** is **Succeeded**.

If the **Status Reason** isn't **Succeeded** and it has been at least 30 minutes since enabling the feature, or despite the success state appearing correct, and you're not seeing the **Restore** option for deleted records, contact a [Microsoft support representative and create a support request](get-help-support.md).

Deleted records only appear after recycle bin is turned on and for records deleted after enabling the feature. You cannot restore records deleted before recycle bin feature was enabled.

### Records deleted through cascading behaviors aren't present in Deleted Records view

Records deleted through automated, cascading behaviors can't be restored independently. You need to restore these records in the order in which they were deleted. The original record that was deleted must be restored before any related records that were deleted through automated cascading behaviors.

For more information about cascading behavior, go to [Configure table relationship cascading behavior](/power-apps/developer/data-platform/configure-entity-relationship-cascading-behavior).

## Tables not supported

When the recycle bin is generally available, it will be enabled for most tables.

Some tables won't support recycle bin. These tables include:

- [Virtual tables](/power-apps/maker/data-platform/create-edit-virtual-entities)
- Tables that store [solution components](../alm/solution-concepts-alm.md#solution-components)
- [Elastic tables](/power-apps/maker/data-platform/create-edit-elastic-tables)

During the preview, some tables with large numbers of columns aren't currently supported. Currently, the maximum number of columns is 400. This value might go higher or lower as we determine the correct threshold.

Developers can run a [query that returns which tables are enabled for recycle bin](/power-apps/developer/data-platform/restore-deleted-records#detect-which-tables-are-enabled-for-recycle-bin) in your environment.

### Tables not currently supported for Recycle Bin

These tables are returned from the query to [detect which tables don't have recycle bin enabled](/power-apps/developer/data-platform/restore-deleted-records#detect-which-tables-dont-have-recycle-bin-enabled) an uncustomized Dataverse environment as of August 2024.

Your environment might have different results. Tables customized by adding large numbers of columns might not be supported.

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

[Restore deleted records with code (preview)](/power-apps/developer/data-platform/restore-deleted-records)