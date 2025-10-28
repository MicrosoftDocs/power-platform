---
title: Audit Power Platform logs in Microsoft Purview
description: Learn how you can use Microsoft Purview to audit admin, maker, and user activities in Microsoft Power Platform.
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/28/2025
author: EllenWehrle
ms.subservice: admin
ms.author: ellenwehrle
ms.reviewer: ellenwehrle 
search.audienceType: 
  - admin
---

# Audit Power Platform logs in Microsoft Purview

Microsoft Purview is a comprehensive set of solutions that helps you govern, protect, and manage data from multiple sources in your organization. You can use Microsoft Purview to monitor Power Platform activities and troubleshoot issues across data, agents, apps, flows, and pages.

This article introduces Power Platform activities you can monitor in Microsoft Purview and take action on, configuration requirements to consider, and the steps you need to take to enable visibility and governance of Power Platform in Microsoft Purview.

See [Learn about auditing solutions in Microsoft Purview](/purview/audit-solutions-overview) to learn more.

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

## Prerequisites

Before you can audit Power Platform logs in Microsoft Purview, be sure you:

- Have at least one Microsoft Purview admin has a Microsoft 365 E5 or greater license to turn on audit log search in Microsoft Purview to manage the logs. More information: [Auditing solutions in Microsoft Purview](/purview/audit-solutions-overview).
- [Verify the auditing status for your organization](/purview/audit-log-enable-disable#verify-the-auditing-status-for-your-organization). If you need to enable auditing for your organization, see [Turn on auditing](/purview/audit-log-enable-disable#turn-on-auditing).

## Turn on auditing in Power Platform admin center

To ensure Microsoft Purview can access Power Platform data, Power Platform admins need to take steps in the Power Platform admin center to turn on auditing for each Power Platform production environment to be audited and turn on auditing for Dataverse.

### Turn on auditing for Power Platform production environments

You need to turn on the **Enable SAS Logging in Purview** setting in the Power Platform admin center for each Power Platform production environment you want to audit in Microsoft Purview.

  > [!TIP]
  > Prior to activating the Shared Access Signature (SAS) feature, you need to allowlist the `https://*.api.powerplatformusercontent.com` domain or most SAS functionalities will NOT work.

  1. As a Power Platform system admin, log in to [Power Platform admin center](https://admin.preview.powerplatform.microsoft.com/home).
  1. On the navigation pane, select **Manage**.
  1. On the Manage pane,select **Environments**.
  1. On the Environments page, select the **production environment** you want to audit.
  1. On the environment's detail page, select **Settings**.
  1. On the Settings page, expand the **Product** list and select **Privacy and Security**.
  1. On the Privacy and Security settings page, go to the **Storage Shared Access Signature (SA) Security Settings** section and toggle the **Enable SAS Logging in Purview** setting to **On**.
  1. Select **Save**.
  1. Repeat the process for each environment.

Learn more about [Advanced security features](/admin/security/data-storage#advanced-security-features).

### Turn on auditing for Dataverse

1. Sign in to the [Power Platform admin center](https://admin.preview.powerplatform.microsoft.com/home).
1. On the navigation pane, select **Manage**.
1. On the Manage pane, select **Environments**.
1. On the Environments page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Audit and logs**.
1. Select **Audit settings**.


1. Under **Auditing**, enable the following options:
   - **Start Auditing** - Activates auditing for the environment.
   - **Log access** - Tracks user sign-ins.
   - **Read logs** - captures most user activities and events.
2. Set the **retention policy** for auditing logs based on your requirements.
3. Select **Save** to apply the changes.

**Set organization-level auditing on tables**

1. On the **Audit settings** page, select **Global Audit Settings**.
1. Under **Enable Auditing in the following areas**, select the check boxes for the areas you want to audit.
1. Select **OK** to apply the changes.

**Set table-level auditing**

1. Sign in to [Power Apps Home Page](https://make.powerapps.com/). Be sure to turn on the modern experience.
2. In the command bar, select **Settings**, then choose **Advanced settings** to go to Microsoft Dynamics 365.
3. In settings, select **Customizations**, then select **Customize the System**.
4. In the navigation pane, under **Components**, expand **Entities** and select the entity to audit (for example, **Account**).
5. Scroll down to **Data Services**, then enable the check box for **Auditing**.
6. Under **Auditing**, enable the following options:
   - **Single record auditing. Log a record when opened.**
   - **Multiple record auditing. Log all records displayed on an opened page.**
7. In the command bar, select **Save** to apply the changes.
8. Select **Publish** to finalize the customization.
9. Repeat steps **4-8** for other tables you want to audit.
10. Turn on audit logging in **Microsoft Purview**. See [Turn audit log search on or off](https://support.office.com/article/turn-office-365-audit-log-search-on-or-off-e893b19a-660c-41f2-9074-d3631c95a014).
Learn more about how to [Manage Dataverse auditing](/power-platform/admin/manage-dataverse-auditing).

> [!NOTE]
> **Power Platform admin activity collection is already enabled by default** on all tenants, so logs can be accessed without additional configuration in Power Platform admin center.

## Get started in Microsoft Purview

After you have taken the steps to allow Power Platform activities to be viewed from Microsoft Purview, you can [Get started with auditing solutions](/purview/audit-get-started). It's important to read and take steps to:

- [Assign permissions](/purview/purview-permissions).
- Set up [retention policies](/audit-log-retention-policies).
- [Search audit logs to investigate common support issues](/purview/audit-troubleshooting-scenarios).

## See also

- [Microsoft Purview](/purview/)
- [Microsoft Purview portal](https://purview.microsoft.com/home)
- [Microsoft Power Platform admin center](/power-platform/admin/)
