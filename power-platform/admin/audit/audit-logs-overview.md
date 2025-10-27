---
title: Audit Power Platform logs in Microsoft Purview
description: Learn how you can use Microsoft Purview to audit admin, maker, and user activities in Microsoft Power Platform.
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/27/2025
author: EllenWehrle
ms.subservice: admin
ms.author: ellenwehrle
ms.reviewer: ellenwehrle 
search.audienceType: 
  - admin
---

# Audit Power Platform logs in Microsoft Purview

Use Microsoft Purview to monitor activities and troubleshoot issues across data, agents, apps, flows, and pages. This article introduces the key concepts and steps to enable visibility and governance of Power Platform in Purview.

## Power Platform activities to audit

Logging takes place at the SDK layer which means a single action can trigger multiple events that are logged. You can audit various activities to maintain:

- **Compliance and security**: Track actions and system events to meet regulatory requirements.
- **Operational insights**: Understand usage patterns and diagnose problems quickly.
- **Governance**: Maintain control over data access and connector usage.

### Power Apps activities

- Monitor app creation, usage, patching, and deletion.
- Identify errors and optimize user experience.

Learn more in [Audit Power Apps logs](audit-logs-power-apps.md).

### Power Automate activities

- Monitor flow creations, permissions, runs, and failures, and connector calls.
- Troubleshoot issues and fine-tune performance for users.

Learn more in [Audit Power Automate logs](audit-logs-power-automate.md).

### Power Pages activities

- Monitor site interactions and page-level events.
- Diagnose issues in external-facing portals.

Learn more in [Audit Power Pages logs](audit-logs-power-pages.md).

### Connector activities

- Monitor API calls and connector events.
- Gain better visibility into integrations and data movement.

Learn more in [Audit connector logs](audit-logs-connectors.md).

### Copilot Studio activities

- Monitor agent activities.
- Adhere to compliance requirements, mitigate failures, and maintain security.

Learn more in [Audit Copilot Studio activities in Microsoft Purview](/microsoft-copilot-studio/admin-logging-copilot-studio).

### Dataverse and model-driven apps

- Monitor create, read, update, and delete (CRUD), multiple records, and multimedia assets.
- Support Data Protection Impact Assessment (DPIA).

Learn more in [Audit Dataverse and model-driven apps logs](audit-logs-dataverse-and-model-driven-apps.md).

### Power Platform admin activities

- Monitor environment lifecycle operations, property and setting changes, groups and rules settings, licensing, lockbox operations, data policies, and other admin actions.
- View admin activities to support transparency, compliance, and security and mitigate failures. Admin activity collection is enabled by default on all tenants.

Learn more in [Audit Power Platform administrative logs](audit-logs-power-platform-admin.md).

## Requirements

Before you can audit Power Platform logs in Purview, ensure you understand your organization's current auditing status and determine what next steps you should take.

- [Verify the auditing status for your organization](/purview/audit-log-enable-disable#verify-the-auditing-status-for-your-organization). If you need to enable auditing for your organization, see [Turn on auditing](/purview/audit-log-enable-disable#turn-on-auditing).
- Set up designated Power Platform admins as Microsoft Purview members and assigns *Audit Logs* or *View-Only Audit Logs* roles. To learn more, see [Permissions in the Microsoft Purview portal](/purview/purview-permissions).
- [Turn on auditing for each Power Platform production environment to be audited](#turn-on-auditing-for-power-platform-production-environments). Admin auditing is always on by default in Power Platform admin center.
- [Turn on auditing for Dataverse](#turn-on-auditing-for-dataverse).

## Turn on auditing in Power Platform

To ensure Microsoft Purview can access Power Platform data, Power Platform admins need to take steps in the Power Platform admin center to turn on auditing for each Power Platform production environment to be audited and turn on auditing for Dataverse.

> [!NOTE]
> Power Platform admin activity collection is already enabled by default, so logs can be accessed without additional configuration in Power Platform admin center. However, you need to make sure at least one Purview admin has a Microsoft 365 E5 or greater license to turn on audit log search in Microsoft Purview to manage the logs.

### Turn on auditing for Power Platform production environments

Before you can audit logs in Microsoft Purview, review the [Requirements section](#requirements) and be sure to turn on Microsoft Purview audit logging for each Power Platform production environment you want logs for in the Power Platform admin center.

  1. As a Power Platform system admin, log in to [Power Platform admin center](https://admin.preview.powerplatform.microsoft.com/home)
  1. On the navigation pane, select **Manage**.
  1. On the *Manage* pane,select **Environments**.
  1. On the *Environments* page, Select a specific environment in the *Environments* list.
  1. On the environment's detail page, select **Settings**.
  1. On the *Settings* page, expand the **Product** list and select **Privacy and Security**.
  1. On the *Privacy and Security* settings page, go to the **Storage Shared Access Signature (SA) Security Settings** section and toggle the **Enable SAS Logging in Purview** setting to **On**.
  1. Select **Save**.
  1. Repeat the process for each environment.
  
  > [!NOTE]
  > Prior to activating Shared Access Signature (SAS) features, you need to allowlist `https://*.api.powerplatformusercontent.com` domain or most SAS functionalities will NOT work.

Learn more about [Advanced security features](/admin/security/data-storage#advanced-security-features)

### Turn on auditing for Dataverse

1. Sign in to the [Power Platform admin center](https://admin.preview.powerplatform.microsoft.com/home).
1. On the navigation pane, select Manage.
1. On the Manage pane, select **Environments**.
1. On the Environments page, select an environment.
1. In the command bar, select Settings.
1. Expand **Audit and logs**, then select Audit settings.

## Verify auditing status and get started in Microsoft Purview

 Before you can search audit logs in Microsoft Purview, you need to [verify the Microsoft Purview auditing status for your organization](/purview/audit-search) to determine if you need to [manually turn on audit logging in Microsoft Purview](/purview/audit-log-enable-disable#verify-the-auditing-status-for-your-organization). Large Microsoft 365 organizations have audit logging turned on by default, but for organizations with small or medium business licenses, [the auditing feature needs to be manually turned on](/purview/audit-log-enable-disable) before you can search audit logs.

For an introduction to how Microsoft Purview helps you create unified auditing solutions for your organization, see [Learn about auditing solutions in Microsoft Purview](/purview/audit-solutions-overview). You can also read [Get started with auditing solutions](/purview/audit-get-started) to learn how to [assign permissions](/purview/purview-permissions), enable `SearchQueryInitiated` events in [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell?view=exchange-ps), set up Microsoft 365 Advanced Auditing capabilities and [retention policies](/audit-log-retention-policies), and [search audit logs to investigate common support issues](/purview/audit-troubleshooting-scenarios).

## See also

- [Microsoft Purview](/purview/)
- [Microsoft Power Platform admin center](/power-platform/admin/)
