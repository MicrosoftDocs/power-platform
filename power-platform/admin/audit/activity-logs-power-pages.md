---
title: Access and monitor Power Pages activity logs in Microsoft Purview
description: Learn how to access Power Pages activity logs in Microsoft Purview and explore what Power Pages activities you can monitor.
ms.topic: how-to
ms.date: 11/06/2025
author: PramithaU
ms.subservice: admin
ms.author: pudupa
ms.reviewer: ellenwehrle 
search.audienceType: 
  - admin
---

# Monitor Power Pages activities in Microsoft Purview

You can monitor many specific Microsoft Power Pages activities in Microsoft Purview, such as environment lifecycle operations, property and setting changes, groups and rules settings, licensing, lockbox operations, data policies, and admin actions. You also have the ability to view activity logs within specific date ranges to gain insights.

Regularly monitor Power Pages activities in Microsoft Purview to:

- maintain governance, compliance, and security
- gain operational insights
- identify and troubleshoot issues
- mitigate failures.

You can access and view Power Pages activity logs in the [Microsoft Purview compliance portal](https://purview.microsoft.com/). These logs are also accessible to developers via the [Office 365 Management API](/office/office-365-management-api/office-365-management-apis-overview).

Learn more in [Auditing solutions in Microsoft Purview](/purview/audit-solutions-overview).

This article covers prerequisites, how to access the logs in the Microsoft Purview portal, and details about Power Pages activities you can monitor.

## Prerequisites

To view connector activity logs in Microsoft Purview, make sure you've:

- Review and complete all the overview article [prerequisites](activity-logs-overview.md#prerequisites).
- Confirm you're an admin who has a [Microsoft Office 365 E1](https://www.microsoft.com/microsoft-365/enterprise/office-365-e1) or greater license.
- Confirm either the *Audit Logs* or *View-Only Audit Logs* role is assigned to you in Microsoft Purview.

Learn more:

- [Learn more about auditing solutions in Microsoft Purview](/purview/audit-solutions-overview)
- [Permissions in the Microsoft Purview portal](/purview/purview-permissions)

## Access the logs

[!INCLUDE[admin-audit](../../includes/admin-audit-activity-search.md)]

## Explore Power Pages activities

You can search Power Pages activities for a specific period by selecting the dates and entering the operation names listed in the **Activities – operation names** column in this section's table or by using the **Keyword Search** option in the search panel.

This table lists some of the activities you can monitor in Power Pages audit logs.

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
| Unarchive site                                 | SiteUnarchived                         | When the site is not archived                                                   |
| Update website authentication key             | WebsiteAuthenticationKeyUpdated        | When the website authentication key is updated                                |
| Create site                                    | SiteCreated                            | When the site is created                                                      |
| Enable CDN                                     | CDNEnabled                             | When CDN is enabled                            |
| Disable CDN                                    | CDNDisabled                            | When CDN is disabled                           |

### See also

- [Power Pages activity logging (video)](https://youtu.be/pBKkkkPpX0I?feature=shared)
- [Microsoft Purview](/purview/)
- [Microsoft Purview portal](https://purview.microsoft.com/home)
- [Get started with search in Microsoft Purview portal](/purview/audit-search#get-started-with-search)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
