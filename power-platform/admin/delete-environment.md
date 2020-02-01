---
title: "Delete and recover environments | MicrosoftDocs"
description: Delete and recover environments
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 1/31/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Delete and recover environments

You can delete a sandbox environment to recover storage space and to remove Personally Identifiable Information (PII) data. In order to delete a production environment, you must first change it to a sandbox environment and then delete the sandbox environment. Trial and support environments can be deleted directly without converting to sandbox.

## Delete an environment

1. Follow the steps in [Change the environment type](switch-environment.md).

2. Once the environment has been changed to sandbox, select it and then select **Delete**.

   > [!div class="mx-imgBorder"]
   > ![Delete environment](media/delete-environment.png "Delete environment")

3. Select **Continue** to confirm the deletion.

## Recover a recently deleted environment

You can recover a recently deleted environment ([within 7 days of deletion](backup-restore-environments.md#how-long-are-my-manualon-demand-backups-and-system-backups-retained)), by using the Power Apps cmdlet Recover-AdminPowerAppEnvironment.

```powershell  
## List soft-deleted environments
Get-AdminPowerAppSoftDeletedEnvironment
 
## Attempt a recover operation on a soft-deleted environment
Recover-AdminPowerAppEnvironment -EnvironmentName $environmentName -WaitUntilFinished $true
```  

To learn more on using PowerShell cmdlets for environments, see [Power Apps cmdlets for administrators (preview)](powerapps-powershell.md#power-apps-cmdlets-for-administrators-preview).

<!-- 
> [!NOTE]
> You should have at least 1GB of unused storage capacity to recover an environment. For information on viewing your current storage capacity, see [Common Data Service storage capacity](capacity-storage.md). 
> 
> Please review the following topics that discuss how environments could become marked for deletion and how to restore environments.
> - [Automatic environment cleanup](automatic-environment-cleanup.md)
> - [Back up and restore environments](backup-restore-environments.md). 
-->

<!-- 
Add this to see also
[Automatic environment cleanup](automatic-environment-cleanup.md) <br />
-->

### See also 
[Back up and restore environments](backup-restore-environments.md) <br />
[Manage sandbox environments](sandbox-environments.md) <br />
[Environments overview](environments-overview.md) <br />
[Cmdlet list - Admin Cmdlets](powerapps-powershell.md#cmdlet-list---admin-cmdlets) <br />
[Licensing overview for Power Platform](pricing-billing-skus.md)

