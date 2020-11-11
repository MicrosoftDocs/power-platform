---
title: "Miscellaneous privileges  | MicrosoftDocs"
description: About miscellaneous privileges
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/11/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Miscellaneous privileges

This topic provides a mapping of the security role user interface to the privilege names. Each section in this topic corresponds to a tab in the user interface (Power Platform admin center > **Environments** > [select an environment] > **Settings** > **Users + permissions** > **Security Roles** > select a role). A blank cell means that there is no privilege for that combination of entity and action.

> [!div class="mx-imgBorder"] 
> ![Miscellaneous privileges](media/miscellaneous-privileges.png "Miscellaneous privileges")

## Core Records tab

The following table lists the privileges shown in the security role editor miscellaneous privileges section on the core records tab.

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Miscellaneous Privileges</p></th>
<th><p>Privilege name</p></th>
<th><p>More information</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Add Reporting Services Reports</p></td>
<td><p>prvPublishRSReport</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/analytics-common-data-service#download-reports">Download reports</a></p></td>
</tr>
<tr class="even">
<td><p>Bulk Delete</p></td>
<td><p>prvBulkDelete</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/delete-bulk-records">Bulk delete</a></p></td>
</tr>
<tr class="odd">
<td><p>Delete Audit Partitions</p></td>
<td><p>prvDeleteAuditPartitions</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/recover-database-space-deleting-audit-logs">Recover database space by deleting audit logs</a></p></td>
</tr>
<tr>
<td><p>Delete Audit Record Change History</p></td>
<td><p>prvDeleteRecordChangeHistory</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p>Manage Data Encryption key - Activate</p></td>
<td><p>prvRestoreSqlEncryptionKey</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/manage-encryption-key#activate-an-encryption-key-for-a-tenant">Activate an encryption key for a tenant</a></p></td>
</tr>
<tr class="odd">
<td><p>Manage Data Encryption key - Change</p></td>
<td><p>prvChangeSqlEncryptionKey</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/manage-encryption-key#manage-encryption-for-an-environment">Manage encryption for an environment</a></p></td>
</tr>
<tr class="even">
<td><p>Manage Data Encryption key - Read</p></td>
<td><p>prvReadSqlEncryptionKey</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/manage-encryption-key">Manage the encryption key</a></p></td>
</tr>
<tr class="odd">
<td><p>Manage User Synchronization Filters</p></td>
<td><p>prvAdminFilter</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/control-field-synchronization-outlook">Control field synchronization with Outlook</a></p></td>
</tr>
<tr>
<td><p>Promote User to Microsoft Dynamics 365 Administrator Role</p></td>
<td><p></p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/database-security">Configure user security to resources in an environment</a></p></td>
</tr>
<tr class="even">
<td><p>Publish Duplicate Detection Rules</p></td>
<td><p>prvPublishDuplicateRule</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/set-up-duplicate-detection-rules-keep-data-clean">Set up duplicate detection rules to keep your data clean</a></p></td>
</tr>
<tr class="odd">
<td><p>Publish Email Templates</p></td>
<td><p>prvCreateOrgEmailTemplates</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/create-templates-email">Create templates for email</a></p></td>
</tr>
<tr class="even">
<td><p>Publish Mail Merge Templates to Organization</p></td>
<td><p>prvPublishOrgMailMergeTemplate</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/work-mail-merge-templates">Work with mail merge templates</a></p></td>
</tr>
<tr class="odd">
<td><p>Publish Reports</p></td>
<td><p>prvPublishOrgReport</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/analytics-common-data-service">Common Data Service analytics</a></p></td>
</tr>
<tr class="even">
<td><p>Run SharePoint Integration Wizard</p></td>
<td><p>prvConfigureSharePoint</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/set-up-sharepoint-integration">Set up SharePoint integration</a></p></td>
</tr>
<tr>
<td><p>Turn On Tracing</p></td>
<td><p></p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/system-settings-dialog-box-customization-tab">Plug-in and custom workflow activity tracing</a></p></td>
</tr>
<tr class="odd">
<td><p>View Audit History</p></td>
<td><p>prvReadRecordAuditHistory</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/common-data-service-gdpr-dsr-guide#audit-history">Audit history</a></p></td>
</tr>
<tr class="even">
<td><p>View Audit Partitions</p></td>
<td><p>prvReadAuditPartitions</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/audit-data-user-activity">Audit data and user activity for security and compliance</a></p></td>
</tr>
<tr class="odd">
<td><p>View Audit Summary</p></td>
<td><p>prvReadAuditSummary</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/logging-powerapps">Power Apps activity logging</a></p></td>
</tr>
</tbody>
</table>

## Marketing tab

The following table lists the privileges shown in the security role editor miscellaneous privileges section on the marketing tab.

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Miscellaneous Privileges</p></th>
<th><p>Privilege Name</p></th>
<th><p>More information</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Configure Internet Marketing module</p></td>
<td><p>prvConfigureInternetMarketing</p></td>
<td><p><a href="https://docs.microsoft.com/dynamics365/marketing/create-deploy-marketing-pages">Create and deploy marketing pages</a></p></td>
</tr>
<tr class="even">
<td><p>Create Quick Campaign</p></td>
<td><p>prvAllowQuickCampaign</p></td>
<td><p><a href="https://docs.microsoft.com/dynamics365/sales-enterprise/create-quick-campaign-using-app-marketing-sales">Create a quick campaign using in-app marketing (Sales)</a></p></td>
</tr>
<tr class="odd">
<td><p>Use internet marketing module</p></td>
<td><p>prvUseInternetMarketing</p></td>
<td><p><a href="https://docs.microsoft.com/dynamics365/customerengagement/on-premises/developer/sample-distribute-a-quick-campaign">Create a quick campaign using in-app marketing (Sales)</a></p></td>
</tr>
</tbody>
</table>

## Sales tab

The following table lists the privileges shown in the security role editor miscellaneous privileges section on the sales tab.

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Miscellaneous Privileges</p></th>
<th><p>Privilege Name</p></th>
<th><p>More information</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Override Invoice Pricing</p></td>
<td><p>prvOverridePriceEngineInvoice</p></td>
<td><p><a href="https://docs.microsoft.com/dynamics365/sales-enterprise/create-edit-invoice-sales">Create or edit invoices (Sales and Sales Hub)</a></p></td>
</tr>
<tr class="even">
<td><p>Override Opportunity Pricing</p></td>
<td><p>prvOverridePriceEngineOpportunity</p></td>
<td><p><a href="https://docs.microsoft.com/dynamics365/sales-enterprise/add-products-opportunity">Add products to an opportunity (Sales Hub)</a></p></td>
</tr>
<tr class="odd">
<td><p>Override Order Pricing</p></td>
<td><p>prvOverridePriceEngineOrder</p></td>
<td><p><a href="https://docs.microsoft.com/dynamics365/sales-enterprise/create-edit-order-sales">Create or edit orders (Sales and Sales Hub)</a></p></td>
</tr>
<tr class="even">
<td><p>Override Quote Order Invoice Delete</p></td>
<td><p>prvQOIOverrideDelete</p></td>
<td><p><a href="https://docs.microsoft.com/dynamics365/sales-enterprise/create-edit-quote-sales">Create or edit quotes (Sales and Sales Hub)</a></p></td>
</tr>
<tr class="odd">
<td><p>Override Quote Pricing</p></td>
<td><p>prvOverridePriceEngineQuote</p></td>
<td><p><a href="https://docs.microsoft.com/dynamics365/sales-enterprise/price-calculation-opportunity-quote-order-invoice-records">Price calculation for opportunity, quote, order, and invoice records</a></p></td>
</tr>
</tbody>
</table>

## Service tab

The following table lists the privileges shown in the security role editor miscellaneous privileges section on the service tab.

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Miscellaneous Privileges</p></th>
<th><p>Privilege Name</p></th>
<th><p>More information</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Approve Knowledge Articles</p></td>
<td><p>prvApproveKnowledgeArticle</p></td>
<td><p><a href="https://docs.microsoft.com/dynamics365/customer-service/customer-service-hub-user-guide-knowledge-article">Create and manage knowledge articles</a></p></td>
</tr>
<tr class="even">
<td><p>Publish Articles</p></td>
<td><p>prvPublishArticle</p></td>
<td><p><a href="https://docs.microsoft.com/dynamics365/customer-service/customer-service-hub-user-guide-knowledge-article">Create and manage knowledge articles</a></p></td>
</tr>
<tr class="odd">
<td><p>Publish Knowledge Articles</p></td>
<td><p>prvPublishKnowledgeArticle</p></td>
<td><p><a href="https://docs.microsoft.com/dynamics365/customer-service/customer-service-hub-user-guide-knowledge-article">Create and manage knowledge articles</a></p></td>
</tr>
</tbody>
</table>

## Business Management tab

The following table lists the privileges shown in the security role editor miscellaneous privileges section on the business management tab.

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Miscellaneous Privileges</p></th>
<th><p>Privilege Name</p></th>
<th><p>More information</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Act on Behalf of Another User</p></td>
<td><p>prvActOnBehalfOfAnotherUser</p></td>
<td><p><a href="https://docs.microsoft.com/powerapps/developer/common-data-service/impersonate-another-user">Impersonate another user</a></p></td>
</tr>
<tr class="even">
<td><p>Approve Email Addresses for Users or Queues</p></td>
<td><p>prvApproveRejectEmailAddress</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/connect-exchange-online#approve-email">Approve email</a></p></td> 
</tr>
<tr class="odd">
<td><p>Assign manager for a user</p></td>
<td><p>prvAssignManager</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/hierarchy-security#manager-hierarchy">Manager hierarchy</a></p></td>
</tr>
<tr class="even">
<td><p>Assign position for a user</p></td>
<td><p>prvAssignPosition</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/hierarchy-security#position-hierarchy">Position hierarchy</a></p></td>
</tr>
<tr class="odd">
<td><p>Assign Territory to User</p></td>
<td><p>prvAssignTerritory</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/add-remove-territory-members">Add or remove sales territory members</a></p></td>
</tr>
<tr class="even">
<td><p>Bulk Edit</p></td>
<td><p>prvBulkEdit</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p>Change Hierarchy Security Settings</p></td>
<td><p>prvWriteHierarchicalSecurityConfiguration</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/hierarchy-security">Hierarchy security to control access</a></p></td>
</tr>
<tr class="even">
<td><p>Dynamics 365 Address Book</p></td>
<td><p>prvAddressBook</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/system-settings-dialog-box-outlook-tab">Set schedule for address book synchronization</a></p></td>
</tr>
<tr class="odd">
<td><p>Enable or Disable a Business Unit</p></td>
<td><p>prvDisableBusinessUnit</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/create-edit-business-units">Create or edit business units</a></p></td>
</tr>
<tr class="even">
<td><p>Enable or Disable User</p></td>
<td><p>prvDisableUser</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/create-users-assign-online-security-roles#enable-or-disable-user-accounts">Enable or disable user accounts</a></p></td>
</tr>
<tr class="odd">
<td><p>Language Settings</p></td>
<td><p>prvLanguageSettings</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/enable-languages">Regional and language options for your environment</a></p></td>
</tr>
<tr class="even">
<td><p>Merge</p></td>
<td><p>prvMerge</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/merge-data">Merge data</a></p></td>
</tr>
<tr class="odd">
<td><p>Override Created on or Created by for Records during Data Import</p></td>
<td><p>prvOverrideCreatedOnCreatedBy</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/import-data-all-record-types">Import data (all record types) from multiple sources</a></p></td>
</tr>
<tr class="even">
<td><p>Perform in sync rollups on goals</p></td>
<td><p>prvRollupGoal</p></td>
<td><p><a href="https://docs.microsoft.com/dynamics365/sales-enterprise/create-edit-goal-sales">Create or edit goals (Sales and Sales Hub)</a></p></td>
</tr>
<tr class="odd">
<td><p>Read License info</p></td>
<td><p>prvReadLicense</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/wp-license-management#what-users-are-licensed">What users are licensed</a></p></td>
</tr>
<tr class="even">
<td><p>Reparent Business unit</p></td>
<td><p>prvReparentBusinessUnit</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/assign-business-unit-different-parent">Assign a business unit a different parent business</a></p></td>
</tr>
<tr class="odd">
<td><p>Reparent team</p></td>
<td><p>prvReparentTeam</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/manage-teams">Manage teams</a></p></td>
</tr>
<tr class="even">
<td><p>Reparent user</p></td>
<td><p>prvReparentUser</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/create-users-assign-online-security-roles">Create users and assign security roles</a></p></td>
</tr>
<tr class="odd">
<td><p>Send Email as Another User</p></td>
<td><p>prvSendAsUser</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/use-outlook-category-track-appointments-emails#delegate-users">Delegate users</a></p></td> 
</tr>
<tr class="even">
<td><p>Send Invitation</p></td>
<td><p>prvSendInviteForLive</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/invite-users-azure-active-directory-b2b-collaboration">Invite users with Azure Active Directory B2B collaboration</a></p></td>
</tr>
<tr class="even">
<td><p>Web Mail Merge</p></td>
<td><p>prvWebMailMerge</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/work-mail-merge-templates">Work with mail merge templates</a></p></td>
</tr>
</tbody>
</table>

## Service Management tab

The following table lists the privileges shown in the security role editor miscellaneous privileges section on the service management tab.

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Miscellaneous Privileges</p></th>
<th><p>Privilege Name</p></th>
<th><p>More information</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Browse availability</p></td>
<td><p>prvBrowseAvailability</p></td>
<td><p></p>
<p></p></td>
</tr>
<tr class="odd">
<td><p>Create own calendar</p></td>
<td><p>prvCreateOwnCalendar</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/customize-marketing-calendars">Create and customize marketing calendars</a></p></td>
</tr>
<tr class="even">
<td><p>Delete own calendar</p></td>
<td><p>prvDeleteOwnCalendar</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/customize-marketing-calendars">Create and customize marketing calendars</a></p></td>
</tr>
<tr class="odd">
<td><p>Read own calendar</p></td>
<td><p>prvReadOwnCalendar</p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/customize-marketing-calendars">Create and customize marketing calendars</a></p></td>
</tr>
<tr class="even">
<td><p>Search Availability</p></td>
<td><p>prvSearchAvailability</p></td>
<td><p> </p></td>
<tr class="even">
<td><p>Write own calendar</p></td>
<td><p>prvWriteOwnCalendar</p></td>
<td><p></p></td>
</tr>
</tbody>
</table>

## Customization tab

The following table lists the privileges shown in the security role editor miscellaneous privileges section on the customization tab.

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Miscellaneous Privileges</p></th>
<th><p>Privilege Name</p></th>
<th><p>More information</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Activate Business Process Flows</p></td>
<td><p>prvActivateBusinessProcessFlow</p></td>
<td><p><a href="https://docs.microsoft.com/power-automate/business-process-flows-overview">Model business process flows</a></p></td>
</tr>
<tr class="even">
<td><p>Activate Business Rules</p></td>
<td><p>prvActivateBusinessRule</p></td>
<td><p><a href="https://docs.microsoft.com/power-automate/business-process-flows-overview">Model business process flows</a></p></td>
</tr>
<tr class="odd">
<td><p>Activate Real-time Processes</p></td>
<td><p>prvActivateSynchronousWorkflow</p></td>
<td><p><a href="https://docs.microsoft.com/power-automate/business-process-flows-overview">Model business process flows</a></p></td>
</tr>
<tr class="even">
<td><p>Configure Yammer</p></td>
<td><p>prvConfigureYammer</p></td>
<td><p><a href="https://resources.techcommunity.microsoft.com/yammer/adoption/">Yammer resources</a></p></td>
</tr>
<tr class="odd">
<td><p>Execute Workflow Job</p></td>
<td><p>prvWorkflowExecution</p></td>
<td><p><a href="https://docs.microsoft.com/power-automate/configure-workflow-steps">Configure background workflow stages and steps</a></p></td>
</tr>
<tr class="even">
<td><p>Export Customizations</p></td>
<td><p>prvExportCustomization</p></td>
<td><p><a href="https://docs.microsoft.com/powerapps/maker/common-data-service/import-update-export-solutions">ExportSolution message privileges</a></p></td>
</tr>
<tr class="odd">
<td><p>Import Customizations</p></td>
<td><p>prvImportCustomization</p></td>
<td><p><a href="https://docs.microsoft.com/powerapps/maker/common-data-service/import-update-export-solutions">ImportSolution message privileges</a></p></td>
</tr>
<tr class="even">
<td><p>ISV Extensions</p></td>
<td><p>prvISVExtensions</p></td>
<td><p>Not currently in use.</p></td>
</tr>
<tr>
<td><p>Learning Path Authoring</p></td>
<td><p></p></td>
<td><p><a href="https://docs.microsoft.com/power-platform/admin/on-off-switch-for-learning-path-guided-help">On-off switch for Learning Path</a></p></td>  
</tr>
<tr class="even">
<td><p>Publish Customizations</p></td>
<td><p>prvPublishCustomization</p></td>
<td><p><a href="https://docs.microsoft.com/dynamics365/customerengagement/on-premises/developer/customize-dev/publish-customizations">PublishXml message privileges</a></p>
<p><a href="https://docs.microsoft.com/dynamics365/customerengagement/on-premises/developer/customize-dev/publish-customizations">PublishAllXml message privileges</a></p></td>
</tr>
<tr class="odd">
<td><p>Retrieve Multiple Social Insights</p></td>
<td><p>prvRetrieveMultipleSocialInsights</p></td>
<td><p></p></td>
</tr>
<tr>
<td><p>Run Flows</p></td>
<td><p></p></td>
<td><p><a href="https://docs.microsoft.com/power-automate/ui-flows/run-ui-flow">Run attended and unattended UI flows</a></p></td>  
</tr>
</tbody>
</table>




