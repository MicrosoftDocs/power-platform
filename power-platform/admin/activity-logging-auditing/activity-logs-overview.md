---
title: Overview of Power Platform activity logging and auditing in Microsoft Purview
description: Learn what Microsoft Power Platform admin, maker, and user activities you can view in Microsoft Purview and how to turn on and configure activity logging auditing for each Power Platform environment.
ms.component: pa-admin
ms.topic: how-to
ms.date: 12/16/2025
author: EllenWehrle
ms.subservice: admin
ms.author: grbarker
ms.reviewer: ellenwehrle
contributors: 
  - DanaMartens
  - EllenWehrle
search.audienceType: 
  - admin
---

# Overview of Power Platform activity logs and auditing in Microsoft Purview

Integrating Microsoft Power Platform activity logs into Microsoft Purview auditing solutions boosts your visibility into data and ability to respond to security events and meet compliance obligations. You can view various activities to:

- Monitor who is doing what in your Power Platform environments.
- Track changes to critical settings and configurations.
- Investigate security incidents.
- Meet compliance and regulatory requirements.
- Generate audit reports for internal or external reviews.
- Analyze usage patterns and adoption metrics.

The activity logs are also accessible to developers via the [Office 365 Management API](/office/office-365-management-api/office-365-management-apis-overview).

This overview article covers what Power Platform component activity logs can be viewed in Microsoft Purview, common schema elements, best practices, and prerequisites to review before you try to access and monitor Power Platform activity logs in the Microsoft Purview portal.

## Monitor activity log data

Microsoft Purview can capture activity logging for the these Power Platform components:

|Component |Description  |Article link  |
|---------|---------|---------|
|Connectors    |  Monitor API calls and connector events to gain better visibility into integrations and data movement.  |  [Audit connector logs](activity-logs-connectors.md)      |
|Copilot Studio   |  Monitor agent activities to follow to compliance requirements, mitigate failures, and maintain security. |   [Audit Copilot Studio activities in Microsoft Purview](/microsoft-copilot-studio/admin-logging-copilot-studio)  |
|Dataverse and model-driven apps | Monitor create, read, update, and delete (CRUD), multiple records, and multimedia assets to support Data Protection Impact Assessment (DPIA).   | [Audit Dataverse and model-driven apps logs](activity-logs-dataverse-model-driven-apps.md) |
|Power Apps | Monitor app creation, usage, patching, and deletion to identify errors and optimize user experience. |  [Audit Power Apps logs](activity-logs-power-apps.md)  |
|Power Automate| Monitor flow creations, permissions, runs, and failures, and connector calls to troubleshoot issues and fine-tune performance for users. | [Audit Power Automate logs](activity-logs-power-automate.md) |
|Power Pages| Monitor site interactions and page-level events to diagnose issues in external-facing portals. | [Audit Power Pages logs](activity-logs-power-pages.md) |
|Power Platform admin| Monitor environment lifecycle operations, property and setting changes, groups and rules settings, licensing, lockbox operations, data policies, and other admin actions to support transparency, compliance, and security and mitigate failures. Admin activity collection is enabled by default on all tenants.| [Audit Power Platform admin logs](activity-logs-power-platform-admin.md)|

## Common elements in schema structure

While each Power Platform component has its specific audit schema, most contain common elements such as:

- Date and time of the activity
- User who performed the action
- IP address
- Activity type
- Resource affected
- Environment details
- Result status

## Best practices for using activity logs

- **Regular monitoring**: Check logs periodically for unusual activities
- **Establish baselines**: Understand normal usage patterns to better detect anomalies
- **Document procedures**: Create standard procedures for log review and incident response
- **Combine with other data**: Correlate activity logs with other monitoring data for comprehensive visibility

## Prerequisites

In order to view Power Platform activity logs in Microsoft Purview, high-level admins need to review current subscriptions, licensing, configurations, and roles and make necessary updates. To learn more about these roles, refer to the following guidance:

- [Manage high privileged admin roles for Power Platform](/power-platform/admin/manage-high-privileged-admin-roles).
- [Manage permissions for Microsoft Purview](/purview/purview-permissions).

## Configure and turn on auditing for each Power Platform environment

A Power Platform system admin or customizer needs to configure auditing in the Power Platform admin center and then turn on the **Enable SAS Logging in Purview** setting for each Power Platform production environment so Microsoft Purview auditing solutions can access the environment's audit logs.

> [!NOTE]
>
> - The option to turn on audit logging is only visible when the minimum Office licensing requirements are met.
> - Microsoft Purview auditing solutions capture user activity logs only for production environments.
> - **Power Platform admin activity collection is already enabled by default** on all tenants in Microsoft Purview. No configuration is needed.

### Configure auditing for each environment

Read [Configure auditing for an environment](/power-platform/admin/manage-dataverse-auditing#configure-auditing-for-an-environment) to learn how to configure auditing for each Power Platform production environment and its table and column data. Be sure to turn on activity logging (Read logs) at the environment level first, then turn on auditing for the environment's tables and columns.

Learn more in [Configure auditing](/power-apps/developer/data-platform/auditing/overview).

### Review and update assigned licenses

Review all user, maker, admin, and agent licenses and update as necessary to ensure all activities and interactions are logged accurately. Read
[Assign appropriate licenses](../assign-licenses.md) to learn more.

### Turn on the Enable SAS Logging in Purview setting for each environment

> [!IMPORTANT]
> Prior to activating the Shared Access Signature (SAS) feature, you need to allowlist the `https://*.api.powerplatformusercontent.com` domain or most SAS functionalities will NOT work.

To allow Microsoft Purview access to Power Platform environment data, you need to turn on the **Enable SAS Logging in Purview** setting in the Power Platform admin center for each Power Platform production environment you want to view audit logs for in Microsoft Purview.

  1. Log in to [Power Platform admin center](https://admin.preview.powerplatform.microsoft.com/home) as a tenant admin.
  1. On the navigation pane, select **Manage**.
  1. On the Manage pane,select **Environments**.
  1. On the Environments page, select the **production environment** you're setting up for Microsoft Purview audit logging.
  1. On the selected environment's detail page, select **Settings**.
  1. On the Settings page, expand the **Product** list and select **Privacy and Security**.
  1. On the Privacy and Security settings page, go to the **Storage Shared Access Signature (SAS) Security Settings** section and toggle the **Enable SAS Logging in Purview** setting to **On**.
  1. Select **Save**.

Watch [Turn on Purview audit logging](https://www.youtube.com/watch?v=UGys8QrnE4U) to see how to turn on SAS Logging in Purview.

Read [Advanced security features](/admin/security/data-storage#advanced-security-features) to learn more.

## Get started in Microsoft Purview

After you've taken the steps to allow Microsoft Purview access and configured auditing for each Power Platform production environment, you're ready to get set up in Microsoft Purview. Be sure to review:

- [Verify the auditing status for your organization](/purview/audit-log-enable-disable#verify-the-auditing-status-for-your-organization).
- [Turn on auditing](/purview/audit-log-enable-disable#turn-on-auditing) if it's not already turned on.
- [Get started with auditing solutions](/purview/audit-get-started) in Microsoft Purview.
- [Assign permissions](/purview/purview-permissions).
- [Manage audit log retention policies](/purview/audit-log-retention-policies).
- [Get started with search](/purview/audit-search).
- [Search audit logs to investigate common support issues](/purview/audit-troubleshooting-scenarios).

Learn more about [Auditing solutions in Microsoft Purview](/purview/audit-solutions-overview).

## Related content

- [Manage Dataverse auditing](/power-platform/admin/manage-dataverse-auditing)
- [Auditing overview](/power-apps/developer/data-platform/auditing/overview)
- [Microsoft Purview](/purview/)
- [Microsoft Purview portal](https://purview.microsoft.com/home)
- [Microsoft Power Platform admin center](/power-platform/admin/)
- [Search the audit logs for user activity using Office 365 Management APIs overview](/office/office-365-management-api/office-365-management-apis-overview)
- [Detailed properties in the audit log](/purview/audit-log-detailed-properties)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
