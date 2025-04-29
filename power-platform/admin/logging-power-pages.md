---
title: Power Pages activity logging
description: Learn how to view Power Pages logs in the Microsoft Purview compliance portal.
ms.topic: conceptual
ms.date: 04/17/2025
author: PramithaU
ms.subservice: admin
ms.author: pudupa
ms.reviewer: dmartens 
search.audienceType: 
  - admin
---

# Power Pages activity logging

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Power Pages activities are tracked from the [Microsoft Purview compliance portal](/purview/purview).

To view Power Pages activities in Microsoft Purview:

1. Sign in to the [Microsoft Purview compliance portal](https://compliance.microsoft.com/) as a tenant admin.

1. Under **Solutions**, select **Audit**.

    :::image type="content" source="media/admin-activity-logging/logging-power-pages/audit-new-search.png" alt-text="A screenshot of the New Search options for Audit.":::

From the Audit screen, an administrator can filter for specific activities by selecting the **Activities – friendly names** dropdown and choosing from the available options.

To filter or search for Power Pages admin activities, select **PowerPlatformAdministratorActivity** as the value for **Record types**. 

:::image type="content" source="media/admin-activity-logging/logging-power-pages/new-search-record-types.png" alt-text="A screenshot of the New Search page with Record types emphasized. The value PowerPlatformAdministratorActivity is emphasized.":::

For more information about how to search audit logs in Microsoft Purview, see [Search the audit log in Microsoft Purview](/purview/audit-new-search#get-started-with-audit-new-search). 

> [!NOTE]
> You can search Power Pages activities for a specific period by entering the operation names listed in the documentation under **Activities – operation names** or by using the **Keyword Search** option in the search panel.

## What events are audited?

The following are some of the user events you can audit.

| **Activity Name**                              | **Operation Name**                     | **Description**                                                               |
|------------------------------------------------|----------------------------------------|-------------------------------------------------------------------------------|
| Enable Power BI visualization                  | PowerBIVisualizationEnabled            | When Power BI visualization is enabled for the site                           |
| Disable Power BI visualization                 | PowerBIVisualizationDisabled           | When Power BI visualization is disabled for the site                          |
| Enable Power BI embedded service               | PowerBIEmbeddedServiceEnabled          | When Power BI embedded service is enabled for the site                        |
| Disable Power BI embedded service              | PowerBIEmbeddedServiceDisabled         | When Power BI embedded service is disabled for the site                       |
| Enable SharePoint integration                  | SharePointIntegrationEnabled           | When SharePoint integration is enabled for the site                           |
| Disable SharePoint integration                 | SharePointIntegrationDisabled          | When SharePoint integration is enabled for the site                           |
| Edit site URL                                  | SiteURLUpdated                         | When site URL is changed                                                      |
| Edit site details - Name Update                | SiteNameUpdated                        | When site name is changed                                                     |
| Edit site details - Website Record Update      | WebsiteRecordUpdated                   | When website record is updated                                                |
| Shut down site                                 | SiteShutDown                           | When site is shut down                                                        |
| Delete site                                    | SiteDeleted                            | Site is deleted                                                               |
| Add custom domain name                         | CustomDomainConnected                  | When site is connected to a custom domain                                     |
| Remove custom domain name                      | CustomDomainDeleted                    | When custom domain is removed from the site                             |
| Change site visibility                         | SiteVisibilityUpdated                  | When site visibility is changed (private to public, or public to private)     |
| Update site visibility permissions             | SiteVisibilityPermissionsUpdated       | When site visibility permissions (who can change site visibility) are updated |
| convert trial to production                    | ConvertedToProduction                  | When site is converted from trial to production                               |
| Set up IP Restrictions - Adding IP range       | IPRestrictionsAdded                    | When a new range of IP addresses are added which can access the site          |
| Set up IP Restrictions - Deleting IP range     | IPRestrictionsDeleted                  | When a new range of IP addresses are deleted which can access the site        |
| Enable WAF                                     | WAFEnabled                             | When AFD (Azure Front Door) Web Application Firewall for security is enabled  |
| Disable WAF                                    | WAFDisabled                            | When AFD (Azure Front Door) Web Application Firewall for security is disabled |
| Restart site                                   | SiteRestarted                          | When site is restarted                                                        |
| Update custom certificates                     | CustomCertificateUpdated               | When a custom certificate associated with the site is updated                 |
| Enable maintenance mode                        | MaintenanceModeEnabled                 | When site is put in maintenance mode                                          |
| Disable maintenance mode                       | MaintenanceModeDisabled                | When site if taken off of maintenance mode                                    |
| disableAnonymousAccess exception list changed | AnonymousSettingExceptionListChanged | When anonymous access governance control is changed<br /><br />These operations take time to complete from the point they're initiated. The audit logs are captured when the action is initiated. It isn't necessary that the action is successfully completed.                           |
| Update bootstrap version                       | BootstrapVersionUpdated            | When bootstrap version is updated                            |
| Disable custom errors                          | CustomErrorsDisabled            | When custom errors are disabled                            |
| Enable custom errors                           | CustomErrorsEnabled            | When custom errors are enabled                            |
| Update D365 URL                                 | D365URLUpdated                 | When URL for Dynamic365 is updated                           |
| Update data model version                       | DataModelVersionUpdated            | When data model version is updated                           |
| Disable diagnostic logs                       | DiagnosticLogsDisabled            | When diagnostic logs is disabled                           |
| Enable diagnostic logs                         | DiagnosticLogsEnabled                  | When diagnostic logs are enabled                                              |
| Disable early upgrade                          | EarlyUpgradeDisabled                   | When early upgrade is disabled                                                |
| Enable early upgrade                           | EarlyUpgradeEnabled                    | When early upgrade is enabled                                                 |
| Install field service extension               | FieldServiceExtensionInstalled         | When the field service extension is installed                                 |
| Modify maintenance mode URL                   | MaintenanceModeURLModified             | When the maintenance mode URL is modified                                     |
| Install project service automation extension        | ProjectServiceAutomationExtensionInstalled | When the project service automation extension is installed                   |
| Archive site                                   | SiteArchived                           | When the site is archived                                                     |
| Suspend site                                  | SiteSuspended                          | When the site is suspended                                                    |
| Unarchive site                                 | SiteUnarchived                         | When the site is unarchived                                                   |
| Update website authentication key             | WebsiteAuthenticationKeyUpdated        | When the website authentication key is updated                                |
| Create site                                    | SiteCreated                            | When the site is created                                                      |
| Enable CDN                                     | CDNEnabled                             | When CDN is enabled                            |
| Disable CDN                                    | CDNDisabled                            | When CDN is disabled                           |


### See also

- [Power Pages activity logging (video)](https://youtu.be/pBKkkkPpX0I?feature=shared)
- [Search the audit log in Microsoft Purview](/purview/audit-new-search#get-started-with-audit-new-search)
- [View Power Platform administrative logs in Microsoft Purview (preview)](admin-activity-logging.md)
