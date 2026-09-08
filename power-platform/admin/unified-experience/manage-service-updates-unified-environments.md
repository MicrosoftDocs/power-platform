---
title: Manage service updates for unified environments
description: Learn how service updates are scheduled, configured, and validated for unified finance and operations environments.
author: aarsh-msft
ms.topic: concept-article
ms.date: 09/07/2026
ms.subservice: admin
ms.author: sharmaaarsh
---

# Manage service updates for unified environments

Microsoft regularly delivers service updates to unified finance and operations environments. This article explains how Microsoft communicates the service update schedule, how you can configure update behavior, and how updates are validated in sandbox environments before they're applied to production.

## Notifications

Microsoft publishes the rollout schedule for each service update in [Release schedule for service updates (unified environments)](/dynamics365/fin-ops-core/dev-itpro/get-started/service-update-unified-schedule). The schedule identifies when sandbox and production environments in each station are expected to receive the update.

Microsoft also sends a notification through the [Microsoft 365 Message center](/microsoft-365/admin/manage/message-center) at least one week before the scheduled rollout begins.

> [!NOTE]
> The published [service update schedule](/dynamics365/fin-ops-core/dev-itpro/get-started/service-update-unified-schedule) is the primary source for rollout dates and schedule changes.

## Configure maintenance settings

Maintenance settings control when production environments receive service updates and proactive quality updates (PQUs).

> [!IMPORTANT]
> The maintenance settings described in this section are currently available only for production environments. To manage maintenance settings for a sandbox environment, use the [Finance and Operations Maintenance Settings operations in the Power Platform API](/rest/api/power-platform/dynamics/finance-and-operations-maintenance-settings).

### Weekday Selection

Use the Maintenance Windows Days dropdown to select the preferred days of the week on which your environment can receive service updates and PQUs. The update is scheduled on one of the selected days, based on the rollout schedule for your environment.

The weekday setting is currently available on the **Maintenance window settings** page. A change is being rolled out that also makes this setting available on the **Finance and Operations details** card on the environment home page. During the rollout, the location of the setting might differ between environments.

#### Maintenance window settings

:::image type="content" source="media/maintenance-settings-selection.png" alt-text="Screenshot of the Maintenance window settings selection on Settings Page.":::

:::image type="content" source="media/maintenance-settings-day-selection.png" alt-text="Screenshot of the weekday selection on the Maintenance window settings page.":::

#### Finance and Operations details card

:::image type="content" source="media/maintenance-settings-finance-operations-details-weekday-selection.png" alt-text="Screenshot of the weekday selection on the finance and operations details card.":::

### Cadence Selection

The maintenance window cadence determines whether a production environment receives every service update or every other service update. You can select one of the following options:

- **Every update**: The environment receives the next available service update.
- **Every other update**: The environment skips the next service update and receives the following service update.

#### Maintenance window settings

:::image type="content" source="media/maintenance-settings-cadence-selection.png" alt-text="Screenshot of the maintenance window cadence setting.":::

#### Finance and Operations details card

:::image type="content" source="media/maintenance-settings-finance-operations-details-cadence-selection.png" alt-text="Screenshot of the cadence selection on the finance and operations details card.":::

For example, consider an environment that's running version 10.0.47:

| Selected cadence | Update behavior |
|---|---|
| **Every update** | The environment receives version 10.0.48 according to the published rollout schedule. |
| **Every other update** | Version 10.0.48 is skipped, and version 10.0.49 is applied according to its published rollout schedule. |

If the environment is configured for **Every other update** and the scheduled rollout of version 10.0.48 has already passed, changing the cadence to **Every update** makes the environment eligible to receive version 10.0.48.

## Sandbox validation

Before Microsoft applies a service update to a production environment, the update is applied to at least one sandbox environment in the same tenant. This process gives you an opportunity to validate the update against your business processes and customizations before the production update.

Sandbox environments are generally scheduled to receive a service update 10–15 days before production environments. Before the production update, a validation check confirms that at least one sandbox environment in the tenant received the same update at least five days earlier. The exact timing remains subject to the maintenance windows selected for the environments.

Review the [service update schedule](/dynamics365/fin-ops-core/dev-itpro/get-started/service-update-unified-schedule) to determine the expected sandbox and production rollout dates.
