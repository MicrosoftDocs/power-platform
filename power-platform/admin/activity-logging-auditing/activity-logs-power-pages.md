---
title: View Power Pages activity logs in Microsoft Purview
description: Learn how to access Power Pages activity logs in Microsoft Purview and explore what Power Pages activities you can monitor.
ms.topic: how-to
ms.date: 01/22/2026
author: EllenWehrle
ms.subservice: admin
ms.author: grbarker
ms.reviewer: ellenwehrle 
search.audienceType: 
  - admin
---

# View Power Pages activity logs in Microsoft Purview

You can view many Microsoft Power Pages activities in Microsoft Purview, such as:

- environment lifecycle operations
- property and setting changes
- groups and rules settings
- licensing
- lockbox operations
- data policies
- admin actions

You also have the ability to view activity logs within specific date ranges to gain insights.

Regularly view Power Pages activities in Microsoft Purview to:

- maintain governance, compliance, and security
- gain operational insights
- identify and troubleshoot issues
- mitigate failures.

This article covers prerequisites, how to access the logs in the Microsoft Purview portal, and details about Power Pages activities you can monitor.

## Prerequisites

To view Power Pages activity logs in Microsoft Purview, make sure you:

- Review and complete all the [prerequisites](activity-logs-overview.md#prerequisites) in the overview article.
- Are an admin with a [Microsoft Office 365 E1](https://www.microsoft.com/microsoft-365/enterprise/office-365-e1) or greater license.
- Are assigned either the *Audit Logs* or *View-Only Audit Logs* role in Microsoft Purview.

Learn more:

- [Manage Dataverse auditing](/power-platform/admin/manage-dataverse-auditing)
- [Auditing overview](/power-apps/developer/data-platform/auditing/overview)
- [Learn more about auditing solutions in Microsoft Purview](/purview/audit-solutions-overview)
- [Permissions in the Microsoft Purview portal](/purview/purview-permissions)

## Access the logs

[!INCLUDE[admin-audit](../../includes/admin-audit-activity-search.md)]

## Explore Power Pages activities

You can search Power Pages activities for a specific period by selecting the dates and entering the operation names listed in this section's table or by using the **Keyword Search** option in the search panel.

This table lists some of the activities you can monitor in Power Pages audit logs.

| **Activity Name**                              | **Operation Name**                     | **Description**                                                               |
|------------------------------------------------|----------------------------------------|-------------------------------------------------------------------------------|
| Enable Power BI visualization                  | `PowerBIVisualizationEnabled`            | Power BI visualization is enabled for the site.                           |
| Disable Power BI visualization                 | `PowerBIVisualizationDisabled`           | Power BI visualization is disabled for the site.                          |
| Enable Power BI embedded service               | `PowerBIEmbeddedServiceEnabled`          | Power BI embedded service is enabled for the site.                        |
| Disable Power BI embedded service              | `PowerBIEmbeddedServiceDisabled`         | Power BI embedded service is disabled for the site.                       |
| Enable SharePoint integration                  | `SharePointIntegrationEnabled`           | SharePoint integration is enabled for the site.                           |
| Disable SharePoint integration                 | `SharePointIntegrationDisabled`          | SharePoint integration is disabled for the site.                           |
| Edit site URL                                  | `SiteURLUpdated`                         | A site URL is changed.                                                      |
| Edit site details - Name Update                | `SiteNameUpdated`                        | A site name is changed.                                                     |
| Edit site details - Website Record Update      | `WebsiteRecordUpdated`                   | A website record is updated.                                                |
| Shut down site                                 | `SiteShutDown`                           | A site is shut down.                                                        |
| Delete site                                    | `SiteDeleted`                            | A site is deleted.                                                               |
| Add custom domain name                         | `CustomDomainConnected`                  | A site is connected to a custom domain.                                     |
| Remove custom domain name                      | `CustomDomainDeleted`                    | A custom domain is removed from the site.                             |
| Change site visibility                         | `SiteVisibilityUpdated`                  | Site visibility is changed (private to public, or public to private).     |
| Update site visibility permissions             | `SiteVisibilityPermissionsUpdated`       | Site visibility permissions (who can change site visibility) are updated. |
| Convert trial to production                    | `ConvertedToProduction`                  | A site is converted from trial to production.                               |
| Set up IP Restrictions - Adding IP range       | `IPRestrictionsAdded`                    | A new range of IP addresses is added which can access the site.          |
| Set up IP Restrictions - Deleting IP range     | `IPRestrictionsDeleted`                  | A range of IP addresses is deleted which can access the site.            |
| Enable WAF                                     | `WAFEnabled`                             | AFD (Azure Front Door) Web Application Firewall for security is enabled.  |
| Disable WAF                                    | `WAFDisabled`                            | AFD (Azure Front Door) Web Application Firewall for security is disabled. |
| Restart site                                   | `SiteRestarted`                          | A site is restarted.                                                        |
| Update custom certificates                     | `CustomCertificateUpdated`               | A custom certificate associated with the site is updated.                 |
| Enable maintenance mode                        | `MaintenanceModeEnabled`                 | A site is put in maintenance mode.                                          |
| Disable maintenance mode                       | `MaintenanceModeDisabled`                | A site is taken off of maintenance mode.                                    |
| Disable Anonymous Access exception list changed | `AnonymousSettingExceptionListChanged` | Anonymous access governance control is changed.<br /><br /> The audit logs are captured when this action is initiated and the operations take time to complete. It isn't necessary that the action is successfully completed.                           |
| Update bootstrap version                       | `BootstrapVersionUpdated`            | The bootstrap version is updated.                            |
| Disable custom errors                          | `CustomErrorsDisabled`            | Custom errors are disabled.                            |
| Enable custom errors                           | `CustomErrorsEnabled`            | Custom errors are enabled.                            |
| Update D365 URL                                 | `D365URLUpdated`                 | The URL for Dynamic365 is updated.                           |
| Update data model version                       | `DataModelVersionUpdated`            | The data model version is updated.                           |
| Disable diagnostic logs                       | `DiagnosticLogsDisabled`            | Diagnostic logs are disabled.                           |
| Enable diagnostic logs                         | `DiagnosticLogsEnabled`                  | Diagnostic logs are enabled.                                              |
| Disable early upgrade                          | `EarlyUpgradeDisabled`                   | Early upgrade is disabled.                                               |
| Enable early upgrade                           | `EarlyUpgradeEnabled`                    | Early upgrade is enabled.                                                 |
| Install field service extension               | `FieldServiceExtensionInstalled`         | The field service extension is installed.                                 |
| Modify maintenance mode URL                   | `MaintenanceModeURLModified`             | The maintenance mode URL is modified.                                     |
| Install project service automation extension        | `ProjectServiceAutomationExtensionInstalled` | The project service automation extension is installed.                   |
| Archive site                                   | `SiteArchived`                           | The site is archived.                                                     |
| Suspend site                                  | `SiteSuspended`                          | The site is suspended.                                                    |
| Unarchive site                                 | `SiteUnarchived`                         | The site is unarchived.                                                 |
| Update website authentication key             | `WebsiteAuthenticationKeyUpdated`        | The website authentication key is updated.                                |
| Create site                                    | `SiteCreated`                            | The site is created.                                                      |
| Enable CDN                                     | `CDNEnabled`                             | The CDN is enabled.                            |
| Disable CDN                                    | `CDNDisabled`                            | The CDN is disabled.                           |

### Related content

- [Power Pages activity logging (video)](https://youtu.be/pBKkkkPpX0I?feature=shared)
- [Microsoft Purview](/purview/)
- [Microsoft Purview portal](https://purview.microsoft.com/home)
- [Get started with search in Microsoft Purview portal](/purview/audit-search#get-started-with-search)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
