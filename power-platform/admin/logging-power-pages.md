---
title: Power Pages activity logging (preview)
description: Learn how to view Power Pages logs in the Microsoft Purview compliance portal.
ms.topic: conceptual
ms.date: 12/22/2023
author: vamseedillimsft
ms.subservice: admin
ms.author: vamseedilli
ms.reviewer: kkendrick 
search.audienceType: 
  - admin
---

# Power Pages activity logging (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

Power Pages activities are tracked from the [Microsoft Purview compliance portal](/purview/purview).

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

To view Power Pages activities in Microsoft Purview:

1. Sign in to the [Microsoft Purview compliance portal](https://compliance.microsoft.com/) as a tenant admin.

1. Under **Solutions**, select **Audit**.

    :::image type="content" source="media/admin-activity-logging/logging-power-pages/audit-new-search.png" alt-text="A screenshot of the New Search options for Audit.":::

From the Audit screen, an administrator can filter for specific activities by selecting the **Activities – friendly names** dropdown and choosing from the available options.

To filter or search for Power Pages admin activities, select **PowerPlatformAdministratorActivity** as the value for **Record types**. 

:::image type="content" source="media/admin-activity-logging/logging-power-pages/new-search-record-types.png" alt-text="A screenshot of the New Search page with Record types emphasized. The value PowerPlatformAdministratorActivity is emphasized.":::

For more information about how to search audit logs in Microsoft Purview, see [Search the audit log in Microsoft Purview](/purview/audit-new-search#get-started-with-audit-new-search). 

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

### See also

- [Search the audit log in Microsoft Purview](/purview/audit-new-search#get-started-with-audit-new-search)
- [View Power Platform administrative logs in Microsoft Purview (preview)](admin-activity-logging.md)
