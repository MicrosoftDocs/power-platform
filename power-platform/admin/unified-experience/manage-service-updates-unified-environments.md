---
title: Manage service updates for unified environments
description: Learn when service updates become available for self-update and how automatic updates are scheduled for unified finance and operations environments.
author: aarsh-msft
ms.topic: concept-article
ms.date: 11/18/2026
ai-usage: ai-generated
ms.subservice: admin
ms.author: sharmaaarsh
ms.reviewer: ellenwehrle
ms.contributors: laneswenka
---

# Manage service updates for unified environments

Microsoft regularly delivers service updates to unified finance and operations environments. This article explains when a service update becomes available for you to apply, how Microsoft communicates the automatic update schedule, how you can configure update behavior, and how to validate updates in sandbox environments before applying them to production.

> [!NOTE]
> Newly created environments aren't eligible to receive service updates during the first seven days after creation. After this period, they become eligible for updates according to the published rollout schedule and their configured maintenance settings.

## Service update availability

Each service update reaches your unified environments in two separate phases:

- **Self-update**: The build becomes available in the Power Platform admin center, and you can apply it to your environments whenever you're ready.
- **Automatic update**: Later, Microsoft applies the update to sandbox environments and then to production environments. Automatic updates roll out station by station. A station is a group of regions that shares the same sandbox and production update windows.

The following table shows when each stage happens and where to find its dates.

| Stage | Environments | Timing | Where to find the dates |
|---|---|---|---|
| Preview build available for self-update | [Early release cycle environments](../early-release.md) only | Generally 48 hours to three days after the preview availability date | **Preview availability** column in [Service update availability](/dynamics365/fin-ops-core/dev-itpro/get-started/public-preview-releases) |
| Generally available build available for self-update | All unified environments | Generally 48 hours to three days after the general availability date | **General availability (self-update)** column in [Service update availability](/dynamics365/fin-ops-core/dev-itpro/get-started/public-preview-releases) |
| Automatic sandbox update | Sandbox environments | During the sandbox window for your environment's station | **Upcoming sandbox schedule** column in [Release schedule for service updates (unified environments)](/dynamics365/fin-ops-core/dev-itpro/get-started/service-update-unified-schedule) |
| Automatic production update | Production environments | During the production window for your environment's station, on a day that your [maintenance settings](#configure-maintenance-settings) allow | **Upcoming production schedule** column in [Release schedule for service updates (unified environments)](/dynamics365/fin-ops-core/dev-itpro/get-started/service-update-unified-schedule) |

The automatic update dates in [Service update availability](/dynamics365/fin-ops-core/dev-itpro/get-started/public-preview-releases) are for environments that are managed in Lifecycle Services. For unified environments, use the station-based dates in [Release schedule for service updates (unified environments)](/dynamics365/fin-ops-core/dev-itpro/get-started/service-update-unified-schedule). To find your environment's station, look up the environment's region in the station-to-region mapping on that page.

To apply a service update yourself, follow the steps in [Tutorial: Update the Finance and Operations Provisioning app](tutorial-update-finance-operations-provisioning-app.md). The version list shows only versions that are later than the installed version. If the new build isn't listed yet, it isn't available for your environment yet, so check again later.

### Self-update window

Your self-update window starts when the build becomes available in the Power Platform admin center. It ends when the automatic update window for your environment's station begins. The length of the window depends on your station and the environment type. Sandbox environments generally receive the automatic update 10–15 days before production environments, so production environments have a longer self-update window.

To estimate the self-update window for an environment, follow these steps:

1. In [Service update availability](/dynamics365/fin-ops-core/dev-itpro/get-started/public-preview-releases), find the **General availability (self-update)** date for the service update, and then add two to three days.
2. In [Release schedule for service updates (unified environments)](/dynamics365/fin-ops-core/dev-itpro/get-started/service-update-unified-schedule), find your environment's region in the station-to-region mapping.
3. In the schedule for the service update, find the sandbox or production window for that station. The time between the availability date and the start of that window is your self-update window.

For example, version 10.0.49 became generally available on September 11, 2026. For unified environments in Stations 2 through 6, that left about two to four weeks to self-update sandbox environments, and about four to six weeks to self-update production environments, before the automatic update.

## Notifications

Microsoft publishes the rollout schedule for each service update in [Release schedule for service updates (unified environments)](/dynamics365/fin-ops-core/dev-itpro/get-started/service-update-unified-schedule). The schedule identifies when sandbox and production environments in each station are expected to receive the update.

Microsoft also sends a notification through the [Microsoft 365 Message center](/microsoft-365/admin/manage/message-center) at least one week before the scheduled rollout begins.

> [!NOTE]
> The published [service update schedule](/dynamics365/fin-ops-core/dev-itpro/get-started/service-update-unified-schedule) is the primary source for rollout dates and schedule changes.

## Configure maintenance settings

Maintenance settings control when production environments receive service updates and proactive quality updates (PQUs).

> [!IMPORTANT]
> The maintenance settings described in this section are currently available only for production environments. To manage maintenance settings for a sandbox environment, use the [Finance and Operations Maintenance Settings operations in the Power Platform API](/rest/api/power-platform/dynamics/finance-and-operations-maintenance-settings).

### Weekday selection

Use the **Maintenance Windows Days** dropdown to select the days of the week when your environment can receive service updates and PQUs. Schedule the update on one of the selected days, based on the rollout schedule for your environment.

Set the weekday selection on the **Finance and Operations details** card on the environment home page.

#### Finance and Operations details card

:::image type="content" source="media/maintenance-settings-finance-operations-details-weekday-selection.png" alt-text="Screenshot of the weekday selection on the finance and operations details card.":::

### Cadence selection

The maintenance window cadence determines whether a production environment receives every service update or every other service update. Select one of the following options:

- **Every update**: The environment receives the next available service update.
- **Every other update**: The environment skips the next service update and receives the following service update.

#### Finance and Operations details card

:::image type="content" source="media/maintenance-settings-finance-operations-details-cadence-selection.png" alt-text="Screenshot of the cadence selection on the finance and operations details card.":::

For example, consider an environment that's running version 10.0.47:

| Selected cadence | Update behavior |
|---|---|
| **Every update** | The environment receives version 10.0.48 according to the published rollout schedule. |
| **Every other update** | The environment skips version 10.0.48 and applies version 10.0.49 according to its published rollout schedule. |

If the environment is configured for **Every other update** and the scheduled rollout of version 10.0.48 has already passed, changing the cadence to **Every update** makes the environment eligible to receive version 10.0.48.

## Sandbox validation

Before Microsoft applies a service update to a production environment, it applies the update to at least one sandbox environment in the same tenant. This process gives you an opportunity to validate the update against your business processes and customizations before the production update.

Sandbox environments generally receive a service update 10–15 days before production environments. Before the production update, a validation check confirms that at least one sandbox environment in the tenant received the same update at least five days earlier. The exact timing remains subject to the maintenance windows you select for the environments.

To determine the expected sandbox and production rollout dates, review the [service update schedule](/dynamics365/fin-ops-core/dev-itpro/get-started/service-update-unified-schedule).
