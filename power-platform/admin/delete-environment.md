---
title: "Delete an environment in Power Platform admin center"
description: "Learn how to delete or remove an environment to recover storage space."
author: sericks007
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: how-to
ms.date: 09/29/2025
ms.subservice: admin
ms.author: sericks
ms.custom: NewPPAC
contributors:
- sericks007
- syalandur24
ms.contributors:
- sericks
- syalandur
search.audienceType: 
  - admin
---

# Delete environment

You can delete an environment to recover storage space and to remove Personally Identifiable Information (PII).

> [!NOTE]
> You can't delete the [default environment](environments-overview.md#default-environment).
>
> You can't delete the Microsoft 365 Copilot Chat environment.

### [New admin center](#tab/new)

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select the source environment to delete.

4. Select the ellipsis next to the environment to delete, and select **Delete**.

  :::image type="content" source="media/delete-environment-updated-new.png" alt-text="Delete a selected environment in the new admin center.":::

4. Provide the confirmation data and then select **Confirm**.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).  

2. Select an environment and then select **Delete**.

  :::image type="content" source="media/delete-environment-updated.png" alt-text="Delete a selected environment.":::

3. Provide the confirmation data and then select **Confirm**.

---

> [!NOTE]
> The URL of a deleted environment can't be used again for another environment until at least 24 hours have passed since the environment deletion.

## See also

[Back up and restore environments](backup-restore-environments.md) <br />
[Automatic environment cleanup](automatic-environment-cleanup.md) <br />
[Manage sandbox environments](sandbox-environments.md) <br />
[Environments overview](environments-overview.md) <br />
[Microsoft.PowerApps.Administration.PowerShell](/powershell/module/microsoft.powerapps.administration.powershell/) <br />
[Licensing overview for Power Platform](pricing-billing-skus.md)



[!INCLUDE[footer-include](../includes/footer-banner.md)]


