---
title: Audit Power Platform logs in Microsoft Purview
description: In this article, you learn how to view Power Platform administrative logs using auditing solutions in Microsoft Purview.
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/24/2025
author: EllenWehrle
ms.subservice: admin
ms.author: ellenwehrle
ms.reviewer: ellenwehrle 
search.audienceType: 
  - admin
---

# Audit Power Platform logs in Microsoft Purview

Use Microsoft Purview to monitor activity, maintain compliance, and troubleshoot issues across data, agents, apps, flows, and pages. This article introduces the key concepts and features that enable visibility and governance.

Regularly auditing logs enables you to maintain:

- **Compliance and security**: Track user actions and system events to meet regulatory requirements.
- **Operational insights**: Understand usage patterns and diagnose problems quickly.
- **Governance**: Maintain control over data access and connector usage.

## Power Platform activities to audit

Logging takes place at the SDK layer which means a single action can trigger multiple events that are logged. You can audit various activities to gain helpful insights, maintain security, and mitigate failures.

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

### Dataverse and model-driven apps

- Monitor create, read, update, and delete (CRUD), multiple records, and multimedia assets.
- Support Data Protection Impact Assessment (DPIA).
Learn more in [Audit Dataverse and model-driven apps logs](audit-logs-dataverse-and-model-driven-apps.md).

### Power Platform admin activities

- Monitor environment lifecycle operations, property and setting changes, groups and rules settings, licensing, lockbox operations, data policies, and other admin actions.
- Admin activities are on by default in Microsoft Purview to support transparency, constrain security, and mitigate failures.
Learn more in [Audit Power Platform administrative logs](audit-logs-power-platform-admin.md).

## Requirements

- [Verify the auditing status for your organization](/purview/audit-log-enable-disable#verify-the-auditing-status-for-your-organization). If you need to enable auditing for your organization, see [Turn on auditing](/purview/audit-log-enable-disable#turn-on-auditing).
- Microsoft Purview admin sets up designated Power Platform admins as Microsoft Purview members and assigns *Audit Logs* or *View-Only Audit Logs* roles. For more information, see [Permissions in the Microsoft Purview portal](/purview/purview-permissions).
- [Power Platform system admin turns on auditing for each Power Platform production environment to be audited](#turn-on-auditing-for-power-platform-production-environments).
 Power Platform admin auditing is always on by default.
- [Power Platform system admin turns on auditing for Dataverse](#turn-on-auditing-for-dataverse).

## Turn on auditing in Power Platform

Getting started requires some coordination with and between administrative teams to ensure Purview auditing is on and Power Platform is set up to share data with Purview.

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
  > Prior to activating SAS features, you need to allowlist `https://*.api.powerplatformusercontent.com` domain or most SAS functionalities will NOT work.

Learn more about [Advanced security features](/admin/security/data-storage#advanced-security-features)

### Turn on auditing for Dataverse

1. Sign in to the [Power Platform admin center](https://admin.preview.powerplatform.microsoft.com/home).
1. On the navigation pane, select Manage.
1. On the Manage pane, select **Environments**.
1. On the Environments page, select an environment.
1. In the command bar, select Settings.
1. Expand **Audit and logs**, then select Audit settings.
