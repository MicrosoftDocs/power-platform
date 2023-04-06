---
title: "Miscellaneous privileges  | MicrosoftDocs"
description: About miscellaneous privileges
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/02/2023
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Miscellaneous privileges

This article provides information about **Miscellaeous privileges** that are available with security roles.

You can specify privileges for each security role using the [new](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role) or [legacy](security-roles-privileges.md#security-roles-and-the-legacy-ui) experience.

## New experience (preview)

Miscellaneous privileges in the new, modern UI are listed alphabetically on the **Miscellaneous privileges** tab of the security role editor.

> [!Important]
> [!include [preview](../includes/cc-preview-features-definition.md)]
> 
> This capability is in process of rolling out, and may not be available in your region yet.


| Miscellaneous privilege                          | Privilege name            | More information       |
|--------------------------------|----------------------|------------|
| Act on Behalf of Another User                                    | prvActOnBehalfOfAnotherUser               | [<u>Impersonate another user</u>](/powerapps/developer/common-data-service/impersonate-another-user)                                             |
| Activate Business Process Flows | prvActivateBusinessProcessFlow | [Model business process flows](/power-automate/business-process-flows-overview) |
| Activate Business Rules | prvActivateBusinessRule | [Model business process flows](/power-automate/business-process-flows-overview) |
| Activate Real-time Processes | prvActivateSynchronousWorkflow | [Model business process flows](/power-automate/business-process-flows-overview) |
| Add Reporting Services Reports                            | prvPublishRSReport             | [<u>Download reports</u>](analytics-common-data-service.md#download-reports)                                           |
| Approve Email Addresses for Users or Queues                      | prvApproveRejectEmailAddress              | [<u>Approve email</u>](connect-exchange-online.md#approve-email)                                                              |
| Approve Knowledge Articles   | prvApproveKnowledgeArticle | [<u>Create and manage knowledge articles</u>](/dynamics365/customer-service/customer-service-hub-user-guide-knowledge-article) |
| Assign manager for a user                                        | prvAssignManager                          | [<u>Manager hierarchy</u>](hierarchy-security.md#manager-hierarchy)                                                           |
| Assign position for a user                                       | prvAssignPosition                         | [<u>Position hierarchy</u>](hierarchy-security.md#position-hierarchy)                                                         |
| Assign Territory to User                                         | prvAssignTerritory                        | [<u>Add or remove sales territory members</u>](add-remove-territory-members.md)                                               |
| Browse availability          | prvBrowseAvailability |  Not applicable|
| Bulk Edit                                                        | prvBulkEdit                               | [<u>Edit multiple rows</u>](/powerapps/user/edit-rows)|
| Bulk Delete                                               | prvBulkDelete                  | [<u>Bulk delete</u>](delete-bulk-records.md)      |
| Change Hierarchy Security Settings                               | prvWriteHierarchicalSecurityConfiguration | [<u>Hierarchy security to control access</u>](hierarchy-security.md)                                                          |
| Configure Internet Marketing module | prvConfigureInternetMarketing | [<u>Create and deploy marketing pages</u>](/dynamics365/marketing/create-deploy-marketing-pages)  |
| Configure Yammer | prvConfigureYammer | [Yammer resources](https://resources.techcommunity.microsoft.com/yammer/adoption/) |
| Create own calendar          | prvCreateOwnCalendar  | [<u>Create and customize marketing calendars</u>](/dynamics365/marketing/customize-marketing-calendars) |
| Create Quick Campaign               | prvAllowQuickCampaign         | [<u>Create a quick campaign using in-app marketing (Sales)</u>](/dynamics365/sales-enterprise/create-quick-campaign-using-app-marketing-sales)            |
| Delete Audit Partitions                                   | prvDeleteAuditPartitions       | [<u>Recover database space by deleting audit logs</u>](recover-database-space-deleting-audit-logs.md)                  |
| Delete Audit Record Change History                        | prvDeleteRecordChangeHistory   | Not applicable         |
| Delete own calendar          | prvDeleteOwnCalendar  | [<u>Create and customize marketing calendars</u>](/dynamics365/marketing/customize-marketing-calendars) |
| Dynamics 365 Address Book                                        | prvAddressBook                            | [<u>Set schedule for address book synchronization</u>](system-settings-dialog-box-outlook-tab.md)                             |
| Enable or Disable a Business Unit                                | prvDisableBusinessUnit                    | [<u>Create or edit business units</u>](create-edit-business-units.md)                                                         |
| Enable or Disable User                                           | prvDisableUser                            | [<u>Enable or disable user accounts</u>](create-users.md#enable-or-disable-user-accounts)                                     |
| Execute Workflow Job | prvWorkflowExecution | [Configure background workflow stages and steps](/power-automate/configure-workflow-steps) |
| Export Customizations | prvExportCustomization | [ExportSolution message privileges](/powerapps/maker/common-data-service/import-update-export-solutions) |
| Import Customizations | prvImportCustomization | [ImportSolution message privileges](/powerapps/maker/common-data-service/import-update-export-solutions) |
| ISV Extensions | prvISVExtensions | Not currently in use. |
| Language Settings                                                | prvLanguageSettings                       | [<u>Regional and language options for your environment</u>](enable-languages.md)                                              |
| Learning Path Authoring | Not applicable  | [On-off switch for Learning Path](/power-platform/admin/on-off-switch-for-learning-path-guided-help) |
| Manage Data Encryption key - Activate                     | prvRestoreSqlEncryptionKey     | [<u>Activate an encryption key for a tenant</u>](manage-encryption-key.md#activate-an-encryption-key-for-a-tenant)     |
| Manage Data Encryption key - Change                       | prvChangeSqlEncryptionKey      | [<u>Manage encryption for an environment</u>](manage-encryption-key.md#manage-encryption-for-an-environment)           |
| Manage Data Encryption key - Read                         | prvReadSqlEncryptionKey        | [<u>Manage the encryption key</u>](manage-encryption-key.md)    |
| Manage User Synchronization Filters                       | prvAdminFilter                 | [<u>Control field synchronization with Outlook</u>](control-field-synchronization-outlook.md)                          |
| Merge                                                            | prvMerge                                  | [<u>Merge data</u>](merge-data.md)   |
| Override Created on or Created by for Records during Data Import | prvOverrideCreatedOnCreatedBy             | [<u>Import data (all record types) from multiple sources</u>](import-data-all-record-types.md)                                |
| Override Invoice Pricing            | prvOverridePriceEngineInvoice     | [<u>Create or edit invoices (Sales and Sales Hub)</u>](/dynamics365/sales-enterprise/create-edit-invoice-sales)                                                        |
| Override Opportunity Pricing        | prvOverridePriceEngineOpportunity | [<u>Add products to an opportunity (Sales Hub)</u>](/dynamics365/sales-enterprise/add-products-opportunity)                                                            |
| Override Order Pricing              | prvOverridePriceEngineOrder       | [<u>Create or edit orders (Sales and Sales Hub)</u>](/dynamics365/sales-enterprise/create-edit-order-sales)                                                            |
| Override Quote Order Invoice Delete | prvQOIOverrideDelete              | [<u>Create or edit quotes (Sales and Sales Hub)</u>](/dynamics365/sales-enterprise/create-edit-quote-sales)                                                            |
| Override Quote Pricing              | prvOverridePriceEngineQuote       | [<u>Price calculation for opportunity, quote, order, and invoice records</u>](/dynamics365/sales-enterprise/price-calculation-opportunity-quote-order-invoice-records) |
| Perform in sync rollups on goals                                 | prvRollupGoal                             | [<u>Create or edit goals (Sales and Sales Hub)</u>](/dynamics365/sales-enterprise/create-edit-goal-sales)                                        |
| Promote User to Microsoft Dynamics 365 Administrator Role |     Not applicable                           | [<u>Configure user security to resources in an environment</u>](database-security.md)                                  |
| Publish Articles             | prvPublishArticle          | [<u>Create and manage knowledge articles</u>](/dynamics365/customer-service/customer-service-hub-user-guide-knowledge-article) |
| Publish Duplicate Detection Rules                         | prvPublishDuplicateRule        | [<u>Set up duplicate detection rules to keep your data clean</u>](set-up-duplicate-detection-rules-keep-data-clean.md) |
| Publish Email Templates                                   | prvCreateOrgEmailTemplates     | [<u>Create templates for email</u>](create-templates-email.md)     |
| Publish Customizations | prvPublishCustomization | [PublishXml message privileges](/dynamics365/customerengagement/on-premises/developer/customize-dev/publish-customizations)</br>[PublishAllXml message privileges](/dynamics365/customerengagement/on-premises/developer/customize-dev/publish-customizations) |
| Publish Knowledge Articles   | prvPublishKnowledgeArticle | [<u>Create and manage knowledge articles</u>](/dynamics365/customer-service/customer-service-hub-user-guide-knowledge-article) |
| Publish Mail Merge Templates to Organization              | prvPublishOrgMailMergeTemplate | [<u>Work with mail merge templates</u>](work-mail-merge-templates.md)  |
| Publish Reports                                           | prvPublishOrgReport            | [<u>Common Data Service analytics</u>](analytics-common-data-service.md) |
| Read License info                                                | prvReadLicense                            | [<u>What users are licensed</u>](wp-license-management.md#what-users-are-licensed)                                            |
| Read own calendar            | prvReadOwnCalendar    | [<u>Create and customize marketing calendars</u>](/dynamics365/marketing/customize-marketing-calendars) |
| Reparent Business unit                                           | prvReparentBusinessUnit                   | [<u>Assign a business unit a different parent business</u>](assign-business-unit-different-parent.md)                         |
| Retrieve Multiple Social Insights | prvRetrieveMultipleSocialInsights | Not applicable |
| Run Flows | Not applicable | [Run attended and unattended UI flows](/power-automate/ui-flows/run-ui-flow) |
| Run SharePoint Integration Wizard                         | prvConfigureSharePoint         | [<u>Set up SharePoint integration</u>](set-up-sharepoint-integration.md) |
| Reparent team                                                    | prvReparentTeam                           | [<u>Manage teams</u>](manage-teams.md)      |
| Reparent user                                                    | prvReparentUser                           | [<u>Create users</u>](create-users.md)      |
| Search Availability          | prvSearchAvailability |    Not applicable |
| Send Email as Another User                                       | prvSendAsUser                             | [<u>Delegate users</u>](use-outlook-category-track-appointments-emails.md#delegate-users)                                     |
| Send Invitation                                                  | prvSendInviteForLive                      | [<u>Invite users with Azure Active Directory B2B collaboration</u>](invite-users-azure-active-directory-b2b-collaboration.md) |
| Turn On Tracing                   |        Not applicable                        | [<u>Plug-in and custom workflow activity tracing</u>](system-settings-dialog-box-customization-tab.md)                 |
| Use internet marketing module       | prvUseInternetMarketing       | [<u>Create a quick campaign using in-app marketing (Sales)</u>](/dynamics365/customerengagement/on-premises/developer/sample-distribute-a-quick-campaign) |
| View Audit History                                        | prvReadRecordAuditHistory      | [<u>Audit history</u>](common-data-service-gdpr-dsr-guide.md#audit-history)                                            |
| View Audit Partitions                                     | prvReadAuditPartitions         | [<u>Audit data and user activity for security and compliance</u>](manage-dataverse-auditing.md)                        |
| View Audit Summary                                        | prvReadAuditSummary            | [<u>Power Apps activity logging</u>](logging-powerapps.md)    
| Web Mail Merge                                                   | prvWebMailMerge                           | [<u>Work with mail merge templates</u>](work-mail-merge-templates.md)                                                         |
| Write own calendar           | prvWriteOwnCalendar   |   Not applicable |


## Legacy experience

All the privileges explained earlier are grouped by various tabs. The following list shows the availability of privileges under various tabs:

- **Core Records tab**
    -  Add Reporting Services Reports
    -  Bulk Delete
    -  Delete Audit Partitions
    -  Delete Audit Record Change History
    -  Manage Data Encryption key - Activate
    -  Manage Data Encryption key - Change
    -  Manage Data Encryption key - Read
    -  Manage User Synchronization Filters
    -  Promote User to Microsoft Dynamics 365 Administrator Role
    -  Publish Duplicate Detection Rules
    -  Publish Email Templates
    -  Publish Mail Merge Templates to Organization
    -  Publish Reports
    -  Run SharePoint Integration Wizard
    -  Turn On Tracing
    -  View Audit History
    -  View Audit Partitions
    -  View Audit Summary
- **Marketing tab**  
    - Configure Internet Marketing module
    - Create Quick Campaign
    - Use internet marketing module
- **Sales tab**
    - Override Invoice Pricing
    - Override Opportunity Pricing
    - Override Order Pricing
    - Override Quote Order Invoice Delete
    - Override Quote Pricing
- **Service tab**
    - Approve Knowledge Articles
    - Publish Articles
    - Publish Knowledge Articles
- **Business Management tab**
    - Act on Behalf of Another User
    - Approve Email Addresses for Users or Queues
    - Assign manager for a user
    - Assign position for a user
    - Assign Territory to User
    - Bulk Edit
    - Change Hierarchy Security Settings
    - Dynamics 365 Address Book
    - Enable or Disable a Business Unit
    - Enable or Disable User
    - Language Settings
    - Merge
    - Override Created on or Created by for Records during Data Import
    - Perform in sync rollups on goals
    - Read License info
    - Reparent Business unit
    - Reparent team
    - Reparent user
    - Send Email as Another User
    - Send Invitation
    - Web Mail Merge
- **Service Management tab**
    - Browse availability
    - Create own calendar
    - Delete own calendar
    - Read own calendar
    - Search Availability
    - Write own calendar
- **Customization tab**
    - Activate Business Process Flows
    - Activate Business Rules
    - Activate Real-time Processes
    - Configure Yammer
    - Execute Workflow Job
    - Export Customizations
    - Import Customizations
    - ISV Extensions
    - Learning Path Authoring
    - Publish Customizations
    - Retrieve Multiple Social Insights
    - Run Flows
