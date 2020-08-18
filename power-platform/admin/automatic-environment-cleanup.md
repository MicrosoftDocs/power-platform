---
title: "Automatic environment cleanup  | MicrosoftDocs"
description: Automatic environment cleanup
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/23/2020
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Automatic environment cleanup

Datacenter operational processes will periodically identify environments that do not have an active subscription and mark them for deactivation and eventual deletion. This frees up capacity from environments that are not in use so you apply it elsewhere in your tenant.

To see the status of your environments:

1. Sign in as an admin to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select **Environments**.
3. Look for environments with **Inactive** status.

> [!div class="mx-imgBorder"] 
> ![Inactive environment](media/inactive-environment.png "Inactive environment")

## Scope

Only production and sandbox environments are affected by the automatic cleanup.

## Admin notification due to environment cleanup 

Here's what you can expect to receive if you (as an admin) or someone in your organization has created an environment that is marked for clean up. 

- Fourteen days prior to disabling the environment, an email is sent to all admins in your organization.
- Seven days prior to disabling the environment, an email is sent to all admins in your organization.
- One day prior to disabling the environment, an email is sent to all admins in your organization.
- If no action is taken, the environment will be deleted ten days after the final email.

## Actions you can take to prevent environment disabling and deletion

Any time prior to the environment deletion you can purchase licenses. Be sure to purchase enough licenses and/or capacity to cover all the production environments in your tenant. See [Licensing overview for Power Platform](pricing-billing-skus.md).

Within 24 hours after the licenses and capacity are applied to your tenant, the environment will automatically be enabled and no longer be considered marked for deletion. If your environment has already been deleted, it is possible to recover it within a limited window of time. See [Recover environment](recover-environment.md).

> [!IMPORTANT] 
> Please allow ample time to take appropriate action. Your organization may have a central admin and purchasing group and might be purchasing through Microsoft partners. Please plan accordingly. 

### See also
[Back up and restore environments](backup-restore-environments.md) <br />
[Licensing overview for Power Platform](pricing-billing-skus.md)<br />
[Microsoft Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130)