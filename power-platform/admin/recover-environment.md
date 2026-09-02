---
title: Recover a recently deleted environment
description: Learn how to recover a recently deleted environment by using the Power Platform admin center or a Power Apps cmdlet.
ms.component: pa-admin
ms.topic: how-to
ms.date: 08/31/2026
ms.subservice: admin
ms.custom: NewPPAC
author: fkarakus
ms.author: fatihk
ms.reviewer: ellenwehrle
ai-usage: ai-assisted
search.audienceType: 
  - admin
contributors:
- matapg007
- parkumar-msft
---

# How do I recover a recently deleted environment?

You can recover a recently deleted environment by using the Power Platform admin center or the [Recover-AdminPowerAppEnvironment](/powershell/module/microsoft.powerapps.administration.powershell/recover-adminpowerappenvironment?view=pa-ps-latest&preserve-view=true) Power Apps cmdlet. The standard soft-delete period is seven days. The exception is a production environment that has Dynamics 365 applications, which remains available for recovery for up to 28 days. For details, see [How can I restore a deleted environment?](backup-restore-environments.md#how-can-i-restore-a-deleted-environment)

> [!NOTE]
> Depending on the environment type, you might need sufficient storage capacity to recover an environment. To review available capacity, see [Microsoft Dataverse storage capacity](capacity-storage.md).
> 
> For information about why environments can be marked for deletion and how environment backups work, see:
>
> - [Automatic environment cleanup](automatic-environment-cleanup.md)
> - [Back up and restore environments](backup-restore-environments.md)

## Power Platform admin center

An administrator can recover a recently deleted environment by following these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. Select **Recently deleted environments**.
1. Select the environment that you want to recover, and then select **Recover**.

Recovery can take several hours. During this period, the environment remains visible in the deleted environments list. When recovery is complete, the environment reappears on the **Environments** page.

## PowerShell

An administrator can recover a recently deleted environment by using the following PowerShell cmdlet.

```powershell  
## List soft-deleted environments
Get-AdminPowerAppSoftDeletedEnvironment
 
## Attempt a recover operation on a soft-deleted environment
Recover-AdminPowerAppEnvironment -EnvironmentName $environmentName -WaitUntilFinished $true
```

To learn more about using PowerShell cmdlets for environments, see [Power Apps cmdlets for administrators](powerapps-powershell.md#power-apps-cmdlets-for-administrators).

## Next steps after recovering an environment

After the environment returns to an active state, validate its workloads before returning it to normal use. Except for [solution-aware cloud flows](/power-automate/guidance/coding-guidelines/understand-benefits-solution-aware-flows), the following checks don't imply that recovery changes these resources.

- **Solution-aware cloud flows**: Recovery disables cloud flows that are included in solutions. Review dependencies, enable child flows before parent flows, and then turn on the flows that should resume.
- **Connections and connection references**: Test the connections used by apps and flows. Reauthorize, update, or recreate connections and connection references as needed if credentials, owners, endpoints, or permissions changed while the environment was deleted.
- **Application users and integrations**: Confirm that application users are enabled, have the required Dataverse security roles, and use valid service principal credentials. Test custom connectors, gateways, webhooks, plug-ins, and other external integrations.
- **Apps and other workloads**: Test model-driven apps, canvas apps, Power Pages sites, background processes, server-side synchronization, and business-critical workloads before returning the environment to normal use. Review environment variables and environment-specific URLs or settings.

### See also

[Back up and restore environments](backup-restore-environments.md)<br>
[Automatic environment cleanup](automatic-environment-cleanup.md)<br>
[Manage sandbox environments](sandbox-environments.md)<br>
[Environments overview](environments-overview.md)<br>
[Microsoft.PowerApps.Administration.PowerShell](/powershell/module/microsoft.powerapps.administration.powershell/?view=pa-ps-latest&preserve-view=true)<br>
[Licensing overview for Microsoft Power Platform](pricing-billing-skus.md)
