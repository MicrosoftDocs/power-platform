---
title: Power Pages activity logging
description: Learn how to view Power Pages logs in the Microsoft Purview compliance portal.
author: vamseedillimsft
ms.topic: conceptual
ms.date: 12/20/2023
ms.subservice: admin
ms.author: vamseedilli
ms.reviewer: kkendrick
search.audienceType: 
  - admin
---

# Power Pages activity logging

Power Pages activities are tracked from the [Microsoft Purview compliance portal](/purview/purview).

Follow these steps.

1. Sign in to the [Microsoft Purview compliance portal](https://compliance.microsoft.com/) as a tenant admin.

1. Select **Search** &gt; **Audit log search**.

Once the Audit screen is accessed, an administrator can filter for specific activities by using the 'Activities – friendly names' dropdown and searching within that.

To filter or search for Power Pages admin activities, select the Record types as 'PowerPlatformAdministratorActivity'

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
| Remove custom domain name                      | CustomDomainDeleted                    | When custom domain has been removed from the site                             |
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
| disableAnonymousAccess exception list changed | AnonymousSettingExceptionListChanged | When anonymous access governance control is changed<br /><br />These operations take time to complete from the point they are initiated. The audit logs are captured when the action is initiated. It is not necessary that the action is successfully completed.                           |


## Review your audit data using reports in Microsoft Purview compliance portal

You can review your audit data in the Microsoft Purview compliance portal. See [Search the audit log in the compliance Center](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance).
