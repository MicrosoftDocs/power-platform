---
title: Miscellaneous privileges
description: Learn about the miscellaneous privileges that you can assign to a security role in Power Platform.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 07/15/2025
ms.subservice: admin
author: paulliew
ms.author: paulliew
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.custom:
  - bap-template
  - NewPPAC
---

# Miscellaneous privileges

You can assign other privileges to a security role than the familiar Read, Write, Append, and so on. Use either the [security roles and privileges](security-roles-privileges.md) experience to assign privileges to a security role.

The following table describes the miscellaneous privileges, which in the new, modern UI are listpred alphabetically on the **Miscellaneous privileges** tab of the security role editor.

| Miscellaneous privilege | Privilege name | More information |
|-------------------------|----------------|------------|
| Act on Behalf of Another User | prvActOnBehalfOfAnotherUser | [Impersonate another user](/powerapps/developer/common-data-service/impersonate-another-user)   |
| Activate Business Process Flows | prvActivateBusinessProcessFlow | [Model business process flows](/power-automate/business-process-flows-overview) |
| Activate Business Rules | prvActivateBusinessRule | [Model business process flows](/power-automate/business-process-flows-overview) |
| Activate Real-time Processes | prvActivateSynchronousWorkflow | [Model business process flows](/power-automate/business-process-flows-overview) |
| Add Reporting Services Reports | prvPublishRSReport | [Download reports](analytics-common-data-service.md#download-reports) |
| Approve Email Addresses for Users or Queues | prvApproveRejectEmailAddress | [Approve email](connect-exchange-online.md#approve-email) |
| Approve Knowledge Articles | prvApproveKnowledgeArticle | [Create and manage knowledge articles](/dynamics365/customer-service/customer-service-hub-user-guide-knowledge-article) |
| Assign manager for a user | prvAssignManager | [Manager hierarchy](hierarchy-security.md#manager-hierarchy) |
| Assign position for a user | prvAssignPosition | [Position hierarchy](hierarchy-security.md#position-hierarchy) |
| Assign Territory to User | prvAssignTerritory | [Add or remove sales territory members](add-remove-territory-members.md) |
| Browse availability | prvBrowseAvailability | Not applicable |
| Bulk Edit | prvBulkEdit | [Edit multiple rows](/powerapps/user/edit-rows) |
| Bulk Delete | prvBulkDelete | [Bulk delete](delete-bulk-records.md) |
| Change Hierarchy Security Settings | prvWriteHierarchicalSecurityConfiguration | [Hierarchy security to control access](hierarchy-security.md) |
| Configure Internet Marketing module | prvConfigureInternetMarketing | [Create and deploy marketing pages](/dynamics365/marketing/create-deploy-marketing-pages) |
| Configure Yammer | prvConfigureYammer | [Yammer resources](https://adoption.microsoft.com/yammer/) |
| Create own calendar | prvCreateOwnCalendar | [Create and customize marketing calendars](/dynamics365/marketing/customize-marketing-calendars) |
| Create Quick Campaign | prvAllowQuickCampaign | [Create a quick campaign using in-app marketing (Sales)](/dynamics365/sales-enterprise/create-quick-campaign-using-app-marketing-sales) |
| Delete Audit Partitions | prvDeleteAuditPartitions | [Recover database space by deleting audit logs](recover-database-space-deleting-audit-logs.md) |
| Delete Audit Record Change History | prvDeleteRecordChangeHistory | Not applicable |
| Delete own calendar | prvDeleteOwnCalendar | [Create and customize marketing calendars](/dynamics365/marketing/customize-marketing-calendars) |
| Dynamics 365 Address Book | prvAddressBook | [Set schedule for address book synchronization](system-settings-dialog-box-outlook-tab.md) |
| Enable or Disable a Business Unit | prvDisableBusinessUnit | [Create or edit business units](create-edit-business-units.md) |
| Enable or Disable User | prvDisableUser | [Enable or disable user accounts](create-users.md#enable-or-disable-user-accounts) |
| Execute Workflow Job | prvWorkflowExecution | [Configure background workflow stages and steps](/power-automate/configure-workflow-steps) |
| Export Customizations | prvExportCustomization | [ExportSolution message privileges](/powerapps/maker/common-data-service/import-update-export-solutions) |
| Import Customizations | prvImportCustomization | [ImportSolution message privileges](/powerapps/maker/common-data-service/import-update-export-solutions) |
| ISV Extensions | prvISVExtensions | Not currently in use. |
| Language Settings | prvLanguageSettings | [Regional and language options for your environment](enable-languages.md) |
| Learning Path Authoring | Not applicable  | [On-off switch for Learning Path](/power-platform/admin/on-off-switch-for-learning-path-guided-help) |
| Manage Data Encryption key - Activate | prvRestoreSqlEncryptionKey | [Activate an encryption key for a tenant](manage-encryption-key.md#activate-an-encryption-key-for-a-tenant)|
| Manage Data Encryption key - Change | prvChangeSqlEncryptionKey | [Manage encryption for an environment](manage-encryption-key.md#manage-encryption-for-an-environment) |
| Manage Data Encryption key - Read | prvReadSqlEncryptionKey | [Manage the encryption key](manage-encryption-key.md)  |
| Manage User Synchronization Filters | prvAdminFilter | [Control field synchronization with Outlook](control-field-synchronization-outlook.md) |
| Merge | prvMerge | [Merge data](merge-data.md) |
| Override Created on or Created by for Records during Data Import | prvOverrideCreatedOnCreatedBy | [Import data (all record types) from multiple sources](import-data-all-record-types.md) |
| Override Invoice Pricing | prvOverridePriceEngineInvoice | [Create or edit invoices (Sales and Sales Hub)](/dynamics365/sales-enterprise/create-edit-invoice-sales) |
| Override Opportunity Pricing | prvOverridePriceEngineOpportunity | [Add products to an opportunity (Sales Hub)](/dynamics365/sales-enterprise/add-products-opportunity) |
| Override Order Pricing | prvOverridePriceEngineOrder | [Create or edit orders (Sales and Sales Hub)](/dynamics365/sales-enterprise/create-edit-order-sales) |
| Override Quote Order Invoice Delete | prvQOIOverrideDelete | [Create or edit quotes (Sales and Sales Hub)](/dynamics365/sales-enterprise/create-edit-quote-sales) |
| Override Quote Pricing | prvOverridePriceEngineQuote | [Price calculation for opportunity, quote, order, and invoice records](/dynamics365/sales-enterprise/price-calculation-opportunity-quote-order-invoice-records) |
| Perform in sync rollups on goals | prvRollupGoal | [Create or edit goals (Sales and Sales Hub)](/dynamics365/sales-enterprise/create-edit-goal-sales) |
| Promote User to Microsoft Dynamics 365 Administrator Role | Not applicable | [Configure user security to resources in an environment](database-security.md) |
| Publish Articles | prvPublishArticle | [Create and manage knowledge articles](/dynamics365/customer-service/customer-service-hub-user-guide-knowledge-article) |
| Publish Duplicate Detection Rules | prvPublishDuplicateRule | [Set up duplicate detection rules to keep your data clean](set-up-duplicate-detection-rules-keep-data-clean.md) |
| Publish Email Templates | prvCreateOrgEmailTemplates | [Create templates for email](create-templates-email.md) |
| Publish Customizations (deprecated) | prvPublishCustomization | This privilege is deprecated. |
| Publish Knowledge Articles | prvPublishKnowledgeArticle | [Create and manage knowledge articles](/dynamics365/customer-service/customer-service-hub-user-guide-knowledge-article) |
| Publish Mail Merge Templates to Organization | prvPublishOrgMailMergeTemplate | [Work with mail merge templates](work-mail-merge-templates.md) |
| Publish Reports | prvPublishOrgReport | [Common Data Service analytics](analytics-common-data-service.md) |
| Read License info | prvReadLicense | [What users are licensed](wp-license-management.md#what-users-are-licensed) |
| Read own calendar | prvReadOwnCalendar | [Create and customize marketing calendars](/dynamics365/marketing/customize-marketing-calendars) |
| Reparent Business unit | prvReparentBusinessUnit | [Assign a business unit a different parent business](assign-business-unit-different-parent.md) |
| Retrieve Multiple Social Insights | prvRetrieveMultipleSocialInsights | Not applicable |
| Run Flows | Not applicable | [Run attended and unattended UI flows](/power-automate/ui-flows/run-ui-flow) |
| Run SharePoint Integration Wizard | prvConfigureSharePoint | [Set up SharePoint integration](set-up-sharepoint-integration.md) |
| Reparent team | prvReparentTeam | [Manage teams](manage-teams.md) |
| Reparent user | prvReparentUser | [Create users](create-users.md) |
| Search Availability | prvSearchAvailability | Not applicable |
| Send Email as Another User | prvSendAsUser  | [Delegate users](use-outlook-category-track-appointments-emails.md#delegate-users) |
| Send Invitation | prvSendInviteForLive | [Invite users with Microsoft Entra B2B collaboration](invite-users-azure-active-directory-b2b-collaboration.md) |
| Turn On Tracing | Not applicable | [Plug-in and custom workflow activity tracing](system-settings-dialog-box-customization-tab.md) |
| Use internet marketing module | prvUseInternetMarketing | [Create a quick campaign using in-app marketing (Sales)](/dynamics365/customerengagement/on-premises/developer/sample-distribute-a-quick-campaign) |
| View Audit History | prvReadRecordAuditHistory | [Audit history](dataverse-privacy-dsr-guide.md#audit-history) |
| View Audit Partitions | prvReadAuditPartitions | [Audit data and user activity for security and compliance](manage-dataverse-auditing.md) |
| View Audit Summary | prvReadAuditSummary | [Power Apps activity logging](logging-powerapps.md) |
| Web Mail Merge | prvWebMailMerge | [Work with mail merge templates](work-mail-merge-templates.md) |
| Write own calendar | prvWriteOwnCalendar | Not applicable |
