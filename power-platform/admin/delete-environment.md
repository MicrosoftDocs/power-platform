---
title: "Delete an environment in Power Platform admin center"
description: "Learn how to delete or remove an environment to recover storage space."
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/26/2021
ms.subservice: admin
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Delete environment

You can delete an environment to recover storage space and to remove Personally Identifiable Information (PII). 

> [!NOTE]
> You can't delete the [default environment](environments-overview.md#the-default-environment).

1. Sign in to [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com).  

2. Select an environment and then select **Delete**.

   > [!div class="mx-imgBorder"]
   > ![Delete environment](media/delete-environment.png "Delete environment")

3. Provide the confirmation data and then select **Confirm**.

> [!NOTE]
> The URL of a deleted environment can't be used again for another environment until at least 24 hours have passed since the environment deletion.

### See also 
[Back up and restore environments](backup-restore-environments.md) <br />
[Automatic environment cleanup](automatic-environment-cleanup.md) <br />
[Manage sandbox environments](sandbox-environments.md) <br />
[Environments overview](environments-overview.md) <br />
[Microsoft.PowerApps.Administration.PowerShell](/powershell/module/microsoft.powerapps.administration.powershell/?view=pa-ps-latest) <br />
[Licensing overview for Power Platform](pricing-billing-skus.md)



[!INCLUDE[footer-include](../includes/footer-banner.md)]

“After a URL name change is saved, all users who access that environment must be notified of the change. Users will be able to access the environment for up to 24 hours by using the previous URL. After the 24-hour period has passed, the previous URL will not work.”
