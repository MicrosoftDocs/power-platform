---
title: "Delete environment | MicrosoftDocs"
description: Delete environment
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/07/2019
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

### See also
[Manage sandbox environments](sandbox-environments.md) <br />
[Environments overview](environments-overview.md)
