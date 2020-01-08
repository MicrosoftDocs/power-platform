---
title: "Delete environment | MicrosoftDocs"
description: Delete environment
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/20/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Delete an environment 

You can delete a sandbox environment to recover storage space and to remove Personally Identifiable Information (PII) data. In order to delete a production environment, you must first change it to a sandbox environment and then delete the sandbox environment. Trial and support environments can be deleted directly without converting to sandbox.

## Delete an environment

1. Follow the steps in [Change the environment type](switch-environment.md).

2. Once the environment has been changed to sandbox, select it and then select **Delete**.

   > [!div class="mx-imgBorder"]
   > ![Delete environment](media/delete-environment.png "Delete environment")

3. Select **Continue** to confirm the deletion.

## Recover a recently deleted environment

You can recover a recently deleted environment (within 7 days of deletion), by using the Power Apps cmdlet Recover-AdminPowerAppEnvironment.

To learn more on using PowerShell cmdlets for environments, see [Power Apps cmdlets for administrators (preview)](powerapps-powershell.md#power-apps-cmdlets-for-administrators-preview).

> [!NOTE]
> Environments that can be restored are environments deleted by an administrator and not those deleted by the system due to license expiration and other scenarios.

### See also
[Manage sandbox environments](sandbox-environments.md) <br />
[Environments overview](environments-overview.md) <br />
[Cmdlet list - Admin Cmdlets](powerapps-powershell.md#cmdlet-list---admin-cmdlets)

