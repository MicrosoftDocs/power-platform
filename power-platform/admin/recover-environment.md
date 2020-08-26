---
title: "Recover environment | MicrosoftDocs"
description: Recover environment
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/05/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Recover environment

You can recover a recently deleted environment ([within 7 days of deletion](backup-restore-environments.md#how-long-are-my-manualon-demand-backups-and-system-backups-retained)), by using the Power Apps cmdlet Recover-AdminPowerAppEnvironment.

```powershell  
## List soft-deleted environments
Get-AdminPowerAppSoftDeletedEnvironment
 
## Attempt a recover operation on a soft-deleted environment
Recover-AdminPowerAppEnvironment -EnvironmentName $environmentName -WaitUntilFinished $true
```  

To learn more on using PowerShell cmdlets for environments, see [Power Apps cmdlets for administrators](powerapps-powershell.md#power-apps-cmdlets-for-administrators).

 
> [!NOTE]
> You should have at least 1GB of unused storage capacity to recover an environment. For information on viewing your current storage capacity, see [Common Data Service storage capacity](capacity-storage.md). 
> 
> Please review the following topics that discuss how environments could become marked for deletion and how to restore environments.
> - [Automatic environment cleanup](automatic-environment-cleanup.md)
> - [Back up and restore environments](backup-restore-environments.md). 

### See also 
[Back up and restore environments](backup-restore-environments.md) <br />
[Automatic environment cleanup](automatic-environment-cleanup.md) <br />
[Manage sandbox environments](sandbox-environments.md) <br />
[Environments overview](environments-overview.md) <br />
[Cmdlet list - Admin Cmdlets](powerapps-powershell.md#cmdlet-list---admin-cmdlets) <br />
[Licensing overview for Power Platform](pricing-billing-skus.md)

