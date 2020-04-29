---
title: "Delete environment | MicrosoftDocs"
description: Delete environment
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
---
# Delete environment

You can delete a sandbox environment to recover storage space and to remove Personally Identifiable Information (PII) data. In order to delete a production environment, you must first change it to a sandbox environment and then delete the sandbox environment. Trial and support environments can be deleted directly without converting to sandbox.

## Delete an environment

1. Follow the steps in [Change the environment type](switch-environment.md).

2. Once the environment has been changed to sandbox, select it and then select **Delete**.

   > [!div class="mx-imgBorder"]
   > ![Delete environment](media/delete-environment.png "Delete environment")

3. Select **Continue** to confirm the deletion.

### See also 
[Back up and restore environments](backup-restore-environments.md) <br />
[Automatic environment cleanup](automatic-environment-cleanup.md) <br />
[Manage sandbox environments](sandbox-environments.md) <br />
[Environments overview](environments-overview.md) <br />
[Cmdlet list - Admin Cmdlets](powerapps-powershell.md#cmdlet-list---admin-cmdlets) <br />
[Licensing overview for Power Platform](pricing-billing-skus.md)

