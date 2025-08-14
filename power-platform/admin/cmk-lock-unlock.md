---
title: Lock and unlock environments through key vault access
description: Learn how to lock and unlock self-managed key environments
author: paulliew
ms.author: paulliew
ms.reviewer: matp
ms.topic: how-to 
ms.date: 07/14/2025
ms.custom: template-how-to
contributors: sericks007
---
# Lock and unlock environments through key vault access

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Since separate encryption keys can be used to encrypt different Microsoft Dataverse environments, you can separately lock these environments by revoking key vault access to the respective enterprise policy. Locking key vault or key access can only be done by the Azure Key Vault admin. There's no advanced warning to the Power Platform admin or users when an Azure Key Vault admin revoked key access.

Key access revocation can be triggered by completing any of the following tasks:

- Revoking key vault permissions from the enterprise policy.
- Disabling the encryption key.
- Deleting the encryption key.
- Deleting the key vault.
- Deleting the enterprise policy.
- Disabling the key version.
- Disabling key vault networking's public access.
- Adding a virtual network or adding an IP range outside of Microsoft services' reach.

  > [!CAUTION]
  > You should never revoke key access as part of your normal business process. When you revoke key access, all environments associated with the enterprise policy are taken offline immediately and your users, who were active in the environment, experience unplanned downtime including data loss. If you decide to leave the service, locking the environment can ensure that your customer data can never be accessed again by anyone, including Microsoft.
  > Note the following information about locked environments:
  >
  > - Locked environments can't be restored from backup.
  > - Locked environment's data can't be copied to another environment.
  > - Locked production and sandbox environment's data persist in the platform but it can't be accessed.
  > - Locked sandbox environments are deleted after seven days and production environments are deleted after 30 days if key access isn't restored.

## Enterprise policy status check (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

To ensure the smooth operation of your customer-managed key environments, the health of the *enterprise policy* is continually monitored. When the Azure key access is revoked, the enterprise policy is flagged as unhealthy and all the environments that are associated with the enterprise policy are shut down automatically. Users can't use these locked-out environments until the Azure key access is restored.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

When an environment is shut down due to unhealthy enterprise policy status, an **Environment disabled** message is displayed in the environment details page.

:::image type="content" source="media/environment-disabled.png" alt-text="An environment is shut down." lightbox="media/environment-disabled.png":::

## Unlock environments (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

To unlock environments, all key access permissions must be restored for the original encryption key. The environments can only be turned on when the original Azure encryption key, used to encrypt the customer data, is restored.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

Reenable the environments to unlock them.

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Manage** in the navigation pane, and then on the **Manage** page, select **Environments**.
1. On the **Environments** page, open an environment. **Details** about the environment are displayed.
1. In the **Environment disabled** card, select the **Re-enable environment** action.
1. Repeat this step for each environment that's associated with the enterprise policy to enable it.

    It can take up to five minutes to re-enable the environment.

> [!IMPORTANT]
> Locked environments can be enabled by an admin. The admin must have read access to the enterprise policy when the key access permissions are restored. Environments can be enabled independently by the Power Platform admin after the Azure key is restored.

## Related content

[Manage your customer-managed encryption key](customer-managed-key.md)
