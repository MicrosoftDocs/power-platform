---
title: Restore deleted Microsoft Dataverse table records
description: Learn how to use the Power Platform admin center to view restore deleted Microsoft Dataverse table records.
author: rijoshi1
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/28/2026
ms.subservice: admin
ms.author: rijoshi
ms.reviewer: ellenwehrle
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

Developers should read [Restore deleted records with code](/power-apps/developer/data-platform/restore-deleted-records) to learn how to interact with this setting using code.

## Prerequisites

To restore deleted Dataverse records, turn on the **Keep deleted Dataverse records** setting in your environment.

### Keep deleted Dataverse records

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin).
1. Select **Manage** > **Environments** and then open the environment you want.
1. Select **Settings** > **Product** > **Features**.
1. Scroll down to view the **Deleted records** area, and select the **Keep deleted Dataverse records** option.
1. In the **Keep deleted records (days)** box, enter the number of days, between 1 and 90, to keep deleted records.
1. Select **Save**.
1. Allow 30 minutes for the system to configure the setting.
> [!NOTE]
> 1. When you enable **Keep deleted records**, deleted records remain in storage and continue to count toward your organization's storage capacity until they're permanently removed.
> 1. You can only restore records deleted after this setting is successfully enabled.

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

### Deleted records setting only supports delete operations

The deleted records setting only supports delete operations, not updates.

### Restore operation only supports records

The restore operation only supports records. It doesn't support recovering organizations or tables.

### Some records aren't restored

Some organizations add custom business logic that deletes records related to a record that is deleted. To restore related records deleted by custom business logic, you need to apply the opposite logic on the `Restore` operation to recover the records when you restore the original record that was deleted.

You can restore records deleted through the table relationship cascade behavior process. For more information about cascade behavior, see [Configure table relationship cascading behavior](/power-apps/developer/data-platform/configure-entity-relationship-cascading-behavior).

### Deleted records don't appear after turning on the _Keep deleted Dataverse records_ setting

#### Before you troubleshoot 
Deleted records are only kept after the **Keep deleted Dataverse records** setting is turned on. Records deleted before you turned on the setting can't be restored.

Turning on the **Keep deleted Dataverse records** setting triggers a background system job called **Enable keeping deleted data for Organization**. This job must complete successfully before deleted records are kept for restoration later. Even though the setting is turned on, that doesn't guarantee that the job has finished.

#### How the job works
- When you turn on the setting, the system job is automatically created and begins running.
- If the job **succeeds**, it's automatically removed from the **System Jobs** list. Its absence means success.
- If the job **fails**, it remains in the list for a few days so you can open it and view the error details.

#### Check the system job status

1. Open the Power Platform admin center.
1. Select the environment where the issue is occurring.
1. Go to **Settings** > **Audit and logs** > **System jobs**.
1. On the **All System Jobs** page, search for **Enable keeping deleted data for Organization**.

#### Interpreting what you see

| What you see       | What it means | Action |
|--------------------|------------------|------------------|
| Job isn't listed | Job completed and was automatically removed. This is the expected outcome. | Verify by checking whether the recently deleted record appears under **Settings** > **Data management** > **Deleted records**.    | 
| Job is listed, Status: Succeeded | Job completed successfully, but isn't cleaned up yet.   | No action needed. |
| Job is listed, Status: Failed | Job encountered an error. | Open the job to view error details, then contact support. |
| Job is listed, Status: Waiting or In Progress | Job is still running. | Wait a few minutes and refresh. |

#### When to contact support
Contact a [Microsoft support representative](get-help-support.md) if any of the following apply:
- The job shows **Failed** and you can't resolve the error from the details provided.
- The job is no longer listed (or shows **Succeeded**) but the deleted records still don't appear under **Setting** > **Data management** > **Deleted records**
- It has been more than 30 minutes since you turned on the setting, but deleted records still don't appear under **Settings** > **Data management** > **Deleted records**.

### Records deleted through cascading behaviors aren't present in Deleted Records view

Records deleted through automated, cascading behaviors can't be restored independently. You need to restore these records in the order in which they were deleted. The original record that was deleted must be restored before any related records that were deleted through automated cascading behaviors.

For more information about cascading behavior, see [Configure table relationship cascading behavior](/power-apps/developer/data-platform/configure-entity-relationship-cascading-behavior).

## Tables not supported

When the deleted records setting is generally available, it's enabled for most tables.

Some tables don't support restoring deleted records. These tables include:

- [Virtual tables](/power-apps/maker/data-platform/create-edit-virtual-entities)
- Tables that store [solution components](../alm/solution-concepts-alm.md#solution-components)
- [Elastic tables](/power-apps/maker/data-platform/create-edit-elastic-tables)
- Tables with more than 600 attributes

Check the attribute count for a specific table by using **{organizationUrl}/api/data/v9.0/EntityDefinitions(LogicalName='account')/Attributes?$count=true**.

Developers can [detect which tables are enabled for deleted record keeping](/power-apps/developer/data-platform/restore-deleted-records#detect-which-tables-are-enabled-for-deleted-record-keeping) in their environment.

### Tables that the deleted records setting doesn't support

As of October 2026, the query to [detect which tables don't have deleted records feature enabled](/power-apps/developer/data-platform/restore-deleted-records#detect-which-tables-arent-enabled-for-deleted-record-keeping) returns these tables in an uncustomized Dataverse environment.

Your environment might return different results. Tables might not be supported if you customize them by adding a large number of columns.

:::row:::
   :::column:::
      `aaduser`<br />
      `advancedsimilarityrule`<br />
      `agentmemory`<br />
      `agenttask`<br />
      `aicopilot_aiplugin`<br />
      `aiplugin`<br />
      `aipluginconversationstartermapping`<br />
      `aipluginexternalschemaproperty`<br />
      `aipluginoperation`<br />
      `aipluginoperationresponsetemplate`<br />
      `aiskillconfig`<br />
      `annualfiscalcalendar`<br />
      `appaction`<br />
      `appactionmigration`<br />
      `appactionrule_webresource_scripts`<br />
      `appconfiginstance`<br />
      `appentitysearchview`<br />
      `applicationroles`<br />
      `applicationuserprofile`<br />
      `appmodule`<br />
      `appmodulemetadata`<br />
      `appmodulemetadataoperationlog`<br />
      `appnotification`<br />
      `appointment`<br />
      `appsetting`<br />
      `attribute`<br />
      `attributeimageconfig`<br />
      `attributemaskingrule`<br />
      `backgroundoperation`<br />
      `bot_botcomponent`<br />
      `bot_environmentvariabledefinition`<br />
      `botcomponent_aipluginoperation`<br />
      `botcomponent_connectionreference`<br />
      `botcomponent_environmentvariabledefinition`<br />
      `botcomponent_workflow`<br />
      `bulkarchiveconfig`<br />
      `bulkdeleteoperation`<br />
      `businessprocess`<br />
      `businessprocesslinkedartifact`<br />
      `businessunitmap`<br />
      `callbackregistration`<br />
      `card`<br />
      `cardstateitem`<br />
      `cascadegrantrevokeaccessversiontracker`<br />
      `catalogassignment`<br />
      `channelaccessprofileentityaccesslevel`<br />
      `channelaccessprofileruleitem`<br />
      `channelpropertygroup`<br />
      `complexcontrol`<br />
      `componentchangesetversion`<br />
      `componentversiondatasource`<br />
      `computeruseagent`<br />
      `connectionreference`<br />
      `connectionroleassociation`<br />
      `connector`<br />
      `convertrule`<br />
      `copilotexamplequestion`<br />
      `copilotsynonyms`<br />
      `customapi`<br />
      `customapiresponseproperty`<br />
      `customcontroldefaultconfig`<br />
      `datalakefolder`<br />
      `datalakeworkspace`<br />
      `dataprocessingconfiguration`<br />
      `dependency`<br />
      `dependencynode`<br />
      `desktopflowmodule`<br />
      `displaystringmap`<br />
      `duplicaterule`<br />
      `dvfilesearch`<br />
      `dvfilesearchentity`<br />
      `dvtablesearchattribute`<br />
      `elasticfileattachment`<br />
      `emailhash`<br />
      `entity`<br />
      `entityclusterconfig`<br />
      `entitydatasource`<br />
      `entityindex`<br />
      `entitymap`<br />
      `entityrelationship`<br />
      `environmentvariablevalue`<br />
      `exchangesyncidmapping`<br />
      `expiredprocess`<br />
      `fabricaiskill`<br />
      `federatedknowledgeconfiguration`<br />
      `fieldpermission`<br />
      `fixedmonthlyfiscalcalendar`<br />
      `flowcredentialapplication`<br />
      `flowlog`<br />
      `flowmachinegroup`<br />
      `flowmachineimageversion`<br />
      `flowrun`<br />
      `gitbranch`<br />
      `gitorganization`<br />
      `gitrepository`<br />
      `globalsearchconfiguration`<br />
      `hierarchyrule`<br />
      `import`<br />
      `importfile`<br />
      `importlog`<br />
      `indexattributes`<br />
      `intelligentmemory`<br />
      `internalcatalogassignment`<br />
      `kbarticletemplate`<br />
      `knowledgesearchmodel`<br />
      `mailboxtrackingfolder`<br />
      `mainfewshot`<br />
      `managedproperty`<br />
      `mcpprompt`<br />
      `mcpresourcecontent`<br />
      `mcptool`<br />
      `mobileofflineprofile`<br />
      `mobileofflineprofileitemassociation`<br />
      `mobileofflineprofilesuggestion`<br />
      `monthlyfiscalcalendar`<br />
      `msdyn_aiconfiguration_documenttemplate`<br />
      `msdyn_aidocumenttemplate`<br />
      `msdyn_aievaluationmetric`<br />
      `msdyn_aimodelcatalog`<br />
      `msdyn_aitestcase`<br />
      `msdyn_aitestcaseinput`<br />
      `msdyn_componentlayer`<br />
      `msdyn_connectordatasource`<br />
      `msdyn_dataflow_datalakefolder`<br />
      `msdyn_dataflowtemplate`<br />
      `msdyn_dataworkspace`<br />
      `msdyn_dmsrequeststatus`<br />
      `msdyn_evalassertion`<br />
      `msdyn_evalprompt`<br />
      `msdyn_evalrun`<br />
      `msdyn_function`<br />
      `msdyn_insightsstorevirtualentity`<br />
      `msdyn_knowledgeharvestplan`<br />
      `msdyn_knowledgesearchfilter`<br />
      `msdyn_modulerundetail`<br />
      `msdyn_nonrelationalds`<br />
      `msdyn_plan`<br />
      `msdyn_planattachment`<br />
      `msdyn_pmbusinessruleautomationconfig`<br />
      `msdyn_pmcalendarversion`<br />
      `msdyn_pmprocessextendedmetadataversion`<br />
      `msdyn_pmprocessusersettings`<br />
      `msdyn_pmrecording`<br />
      `msdyn_pmtab`<br />
      `msdyn_pmview`<br />
      `msdyn_rtestructuredtemplateconfig`<br />
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
      `organizationui`<br />
      `picklistmapping`<br />
      `pluginassembly`<br />
      `plugintracelog`<br />
      `position`<br />
      `powerpagecomponent`<br />
      `powerpagesite`<br />
      `powerpagesite_dvtablesearch`<br />
      `powerpageslog`<br />
      `powerpagessourcefile`<br />
      `principalentitymap`<br />
      `privilege`<br />
      `privilegesremovalsetting`<br />
      `processstage`<br />
      `publisher`<br />
      `quarterlyfiscalcalendar`<br />
      `queueitemcount`<br />
      `queuemembership`<br />
      `recordfilter`<br />
      `recyclebinconfig`<br />
      `relationshipattribute`<br />
      `reportcategory`<br />
      `reportparameter`<br />
      `retaineddataexcel`<br />
      `revokeinheritedaccessrecordstracker`<br />
      `ribboncontextgroup`<br />
      `ribbondiff`<br />
      `ribbonrule`<br />
      `role`<br />
      `roleprivileges`<br />
      `roletemplateprivileges`<br />
      `routingrule`<br />
      `runtimedependency`<br />
      `savedqueryvisualization`<br />
      `sdkmessage`<br />
      `sdkmessagepair`<br />
      `sdkmessageprocessingstepimage`<br />
      `sdkmessagerequestfield`<br />
      `sdkmessageresponsefield`<br />
      `searchtelemetry`<br />
      `sensitivitylabel`<br />
      `serviceendpoint`<br />
      `serviceplanappmodules`<br />
      `serviceplanmapping`<br />
      `sharedlinksetting`<br />
      `sharedworkspaceaccesstoken2`<br />
      `sharepointsite`<br />
      `similarityrule`<br />
      `skill`<br />
      `skillchangesetreviewer`<br />
      `skillevalresult`<br />
      `skillresource`<br />
      `sla`<br />
      `slakpiinstance`<br />
      `solutioncomponent`<br />
      `solutioncomponentbatchconfiguration`<br />
      `solutioncomponentdefinition`<br />
      `solutionhistorydata`<br />
      `sourcecontrolcomponent`<br />
      `sourcecontrolconfiguration`<br />
      `statusmap`<br />
      `subscription`<br />
      `subscriptionstatisticsoffline`<br />
      `subscriptiontrackingdeletedobject`<br />
      `synapselinkprofile`<br />
      `synapselinkschedule`<br />
      `systemform`<br />
      `systemuserauthorizationchangetracker`<br />
      `systemusermanagermap`<br />
      `systemuserprofiles`<br />
      `tag`<br />
      `taggedprocess`<br />
      `teammobileofflineprofilemembership`<br />
      `teamroles`<br />
      `template`<br />
      `textdatarecordsindexingstatus`<br />
      `traceregarding`<br />
      `transformationmapping`<br />
      `translationprocess`<br />
      `unstructuredfilesearchrecord`<br />
      `userentityuisettings`<br />
      `usermobileofflineprofilemembership`<br />
      `userqueryvisualization`<br />
      `uxagentprojectfile`<br />
      `webresource`<br />
      `workflow`<br />
      `workflowcardconnections`<br />
      `workflowlog`<br />
      `workqueue`<br />
   :::column-end:::
   :::column:::
      `activityfileattachment`<br />
      `agenticscenario`<br />
      `agentprompt`<br />
      `aicopilot`<br />
      `aiinsightcard`<br />
      `aipluginconversationstarter`<br />
      `aipluginexternalschema`<br />
      `aiplugininstance`<br />
      `aipluginoperationparameter`<br />
      `aiplugintitle`<br />
      `allowedmcpclient`<br />
      `anyprivilegeentity`<br />
      `appaction_appactionrule_classicrules`<br />
      `appactionrule`<br />
      `appconfig`<br />
      `appelement`<br />
      `application`<br />
      `applicationuser`<br />
      `applicationuserrole`<br />
      `appmodulecomponent`<br />
      `appmodulemetadatadependency`<br />
      `appmoduleroles`<br />
      `appnotificationsignal`<br />
      `approvalprocess`<br />
      `asyncoperation`<br />
      `attributeclusterconfig`<br />
      `attributemap`<br />
      `attributepicklistvalue`<br />
      `bot`<br />
      `bot_botcomponentcollection`<br />
      `botcomponent`<br />
      `botcomponent_botcomponent`<br />
      `botcomponent_dvtablesearch`<br />
      `botcomponent_msdyn_aimodel`<br />
      `botcomponentcollection`<br />
      `bulkdeletefailure`<br />
      `businessdatalocalizedlabel`<br />
      `businessprocessflowinstance`<br />
      `businessunit`<br />
      `calendar`<br />
      `canvasapp`<br />
      `cardentityconnections`<br />
      `cascadegrantrevokeaccessrecordstracker`<br />
      `catalog`<br />
      `channelaccessprofile`<br />
      `channelaccessprofilerule`<br />
      `channelproperty`<br />
      `columnmapping`<br />
      `componentchangesetpayload`<br />
      `componentversion`<br />
      `componentversionnrddatasource`<br />
      `connectioninstance`<br />
      `connectionrole`<br />
      `connectionroleobjecttypecode`<br />
      `controlconfiguration`<br />
      `convertruleitem`<br />
      `copilotglossaryterm`<br />
      `credential`<br />
      `customapirequestparameter`<br />
      `customcontrol`<br />
      `customcontrolresource`<br />
      `datalakefolderpermission`<br />
      `datalakeworkspacepermission`<br />
      `deleteditemreference`<br />
      `dependencyfeature`<br />
      `desktopflowbinary`<br />
      `displaystring`<br />
      `duplicaterecord`<br />
      `duplicaterulecondition`<br />
      `dvfilesearchattribute`<br />
      `dvtablesearch`<br />
      `dvtablesearchentity`<br />
      `emailaddressconfiguration`<br />
      `enablearchivalrequest`<br />
      `entityanalyticsconfig`<br />
      `entitydataprovider`<br />
      `entityimageconfig`<br />
      `entitykey`<br />
      `entityrecordfilter`<br />
      `environmentvariabledefinition`<br />
      `eventexpanderbreadcrumb`<br />
      `expanderevent`<br />
      `exportedexcel`<br />
      `featurecontrolsetting`<br />
      `federatedknowledgeentityconfiguration`<br />
      `fieldsecurityprofile`<br />
      `flowaggregation`<br />
      `flowgroup`<br />
      `flowmachine`<br />
      `flowmachineimage`<br />
      `flowmachinenetwork`<br />
      `fxexpression`<br />
      `gitconfigurationretrievaldatasource`<br />
      `gitproject`<br />
      `gitsolution`<br />
      `goal`<br />
      `hierarchysecurityconfiguration`<br />
      `importentitymapping`<br />
      `importjob`<br />
      `importmap`<br />
      `indexedtrait`<br />
      `interactionforemail`<br />
      `invaliddependency`<br />
      `keyvaultreference`<br />
      `lookupmapping`<br />
      `mailmergetemplate`<br />
      `managedidentity`<br />
      `maskingrule`<br />
      `mcpresource`<br />
      `mcpserver`<br />
      `metadataforarchival`<br />
      `mobileofflineprofileitem`<br />
      `mobileofflineprofileitemfilter`<br />
      `mobileofflineprofilesuggestionimpactedtable`<br />
      `msdyn_aiconfiguration`<br />
      `msdyn_aiconfigurationsearch`<br />
      `msdyn_aievaluationconfiguration`<br />
      `msdyn_aimodel`<br />
      `msdyn_aitemplate`<br />
      `msdyn_aitestcasedocument`<br />
      `msdyn_appinsightsmetadata`<br />
      `msdyn_componentlayerdatasource`<br />
      `msdyn_dataflow`<br />
      `msdyn_dataflowconnectionreference`<br />
      `msdyn_datalakeds`<br />
      `msdyn_dmsrequest`<br />
      `msdyn_entitylinkchatconfiguration`<br />
      `msdyn_evaldataset`<br />
      `msdyn_evalresult`<br />
      `msdyn_formmapping`<br />
      `msdyn_helppage`<br />
      `msdyn_knowledgeassetconfiguration`<br />
      `msdyn_knowledgemanagementsetting`<br />
      `msdyn_mobileapp`<br />
      `msdyn_nativeextension`<br />
      `msdyn_odatav4ds`<br />
      `msdyn_planartifact`<br />
      `msdyn_pmanalysishistory`<br />
      `msdyn_pmcalendar`<br />
      `msdyn_pminferredtask`<br />
      `msdyn_pmprocesstemplate`<br />
      `msdyn_pmprocessversion`<br />
      `msdyn_pmsimulation`<br />
      `msdyn_pmtemplate`<br />
      `msdyn_rtestructuredtemplate`<br />
      `msdyn_rtetemplatemapping`<br />
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
      `organizationsetting`<br />
      `ownermapping`<br />
      `plugin`<br />
      `pluginpackage`<br />
      `plugintype`<br />
      `powerfxrule`<br />
      `powerpagecomponent_powerpagecomponent`<br />
      `powerpagesite_dvfilesearch`<br />
      `powerpagesitelanguage`<br />
      `powerpagessiteaifeedback`<br />
      `principalattributeaccessmap`<br />
      `principalobjectaccessreadsnapshot`<br />
      `privilegeobjecttypecodes`<br />
      `processsession`<br />
      `processtrigger`<br />
      `publisheraddress`<br />
      `queue`<br />
      `queuemembercount`<br />
      `recentlyused`<br />
      `recurringappointmentmaster`<br />
      `relationship`<br />
      `report`<br />
      `reportentity`<br />
      `reportvisibility`<br />
      `retentionconfig`<br />
      `ribboncommand`<br />
      `ribboncustomization`<br />
      `ribbonmetadatatoprocess`<br />
      `ribbontabtocommandmap`<br />
      `roleeditorlayout`<br />
      `roletemplate`<br />
      `rollupproperties`<br />
      `routingruleitem`<br />
      `savedquery`<br />
      `savingrule`<br />
      `sdkmessagefilter`<br />
      `sdkmessageprocessingstep`<br />
      `sdkmessagerequest`<br />
      `sdkmessageresponse`<br />
      `searchresultscache`<br />
      `semiannualfiscalcalendar`<br />
      `sensitivitylabelattributemapping`<br />
      `serviceplan`<br />
      `serviceplancustomcontrol`<br />
      `settingdefinition`<br />
      `sharedobjectsforread`<br />
      `sharepointmanagedidentity`<br />
      `signal`<br />
      `sitemap`<br />
      `skillchangesethistory`<br />
      `skilldvtablesearch`<br />
      `skillmetadata`<br />
      `skillrolemapping`<br />
      `slaitem`<br />
      `solution`<br />
      `solutioncomponentattributeconfiguration`<br />
      `solutioncomponentconfiguration`<br />
      `solutioncomponentrelationshipconfiguration`<br />
      `sourcecontrolbranchconfiguration`<br />
      `sourcecontrolcomponentpayload`<br />
      `stagedsourcecontrolcomponent`<br />
      `stringmap`<br />
      `subscriptionclients`<br />
      `subscriptionsyncentryoffline`<br />
      `synapsedatabase`<br />
      `synapselinkprofileentity`<br />
      `syncerror`<br />
      `systemuser`<br />
      `systemuserbusinessunitentitymap`<br />
      `systemuserprincipals`<br />
      `systemuserroles`<br />
      `taggedflowsession`<br />
      `tdsmetadata`<br />
      `teamprofiles`<br />
      `teamtemplate`<br />
      `textanalyticsentitymapping`<br />
      `tracelog`<br />
      `trait`<br />
      `transformationparametermapping`<br />
      `unstructuredfilesearchentity`<br />
      `unstructuredfilesearchrecordstatus`<br />
      `userform`<br />
      `userquery`<br />
      `uxagentproject`<br />
      `virtualentitymetadata`<br />
      `webwizard`<br />
      `workflowbinary`<br />
      `workflowdependency`<br />
      `workflowmetadata`<br />
      `workqueueitem`<br />
   :::column-end:::
:::row-end:::


### Related information

[Restore deleted records with code](/power-apps/developer/data-platform/restore-deleted-records)
