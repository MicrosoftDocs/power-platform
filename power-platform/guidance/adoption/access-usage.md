---
title: Track user access
description: Power Apps and Power Automate activities can be tracked and viewed from the Office 365 Security and Compliance Center. This allows tracking when apps or flows are created, edited, or deleted along with other key activities.
#customer intent: As a Power Platform user, I want to track Power Apps and Power Automate activities so that I can monitor user access and actions.
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/09/2020
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
search.audienceType: 
  - admin
---
# Track user access

You can view and track Power Apps and Power Automate activities from the [Office 365 Security & Compliance Center](https://protection.office.com). This lets you track when apps or flows are created, edited, or deleted along with other key activities. These logs can be used manually for discovery and review and can also be accessed via API to automate more complex scenarios.

The following are the Power Automate and Power Apps activities that are logged:

:::row:::
:::column span="6":::
      **Power Automate**
   :::column-end:::
:::column span="6":::
      **Power Apps**
   :::column-end:::
:::row-end:::
:::row:::
:::column span="6":::
        - Created flow
        - Edited flow
        - Deleted flow
        - Edited permissions
        - Deleted permissions
        - Started a paid trial
        - Renewed a paid trial
   :::column-end:::
:::column span="6":::
        - Created app
        - Edited/saved app
        - Published app
        - Deleted app
        - Restored an app from app version
        - Launched app
        - Marked app as featured
        - Marked app as hero
        - Edited app permissions
        - Deleted app permissions
   :::column-end:::
:::row-end:::

> [!IMPORTANT]
> In order to take advantage of the activity logging, you must turn on audit logging in the tenant before data is available for viewing.

Complete this via the following PowerShell commands. More information: [Turn Audit Log Search On or Off](/microsoft-365/compliance/turn-audit-log-search-on-or-off). It might take several hours after you turn on audit log search before you can return results when you search the audit log.

```powershell
Enable-OrganizationCustomization
Set-AdminAuditLogConfig -UnifiedAuditLogIngestionEnabled $true
```

A Microsoft Power Platform or Dynamics 365 Service Admin can be granted permission to view audit log entries.

```powershell
Add-RoleGroupMember "Compliance Management" -Member user1
```

> [!NOTE]
> This will give the user access to view all audit log entries. There's no way to restrict access to only view Power Apps and Power Automate log entries.

If your organization uses a Security Information and Event Management (SIEM) server, you can learn how to enable integration with activity logging. More information: [SIEM Server Integration](/microsoft-365/security/office-365-security/siem-server-integration)

You might also find Microsoft Purview Compliance Manager helpful to manage your compliance efforts across Microsoft cloud services in a single place. More information: [Compliance Manager](https://aka.ms/compliancemanager)

As an administrator, you should:

- Carefully think about audit data via Office 365 Security & Compliance Center in addition to other mechanisms for monitoring. You can create new alert policies to help ensure the overall health of your citizen app development platform.
- Further explore Power Automate capabilities that can help you automate additional steps for ensuring Microsoft Power Platform service health.


[!INCLUDE[footer-include](../../includes/footer-banner.md)]
