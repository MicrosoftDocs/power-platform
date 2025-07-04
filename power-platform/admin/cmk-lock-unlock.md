---
title: Lock and unlock environments through key vault access
description: Learn how to lock and unlock self-managed key environments
author: paulliew
ms.author: paulliew
ms.reviewer: matp, ratrtile
ms.topic: how-to 
ms.date: 06/02/2023
ms.custom: template-how-to
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
  > You should never revoke key access as part of your normal business process. When you revoked key access, all environments associated with the enterprise policy will be taken completely offline immediately and your users who were active in the environment will experience unplanned downtime including data loss. If you decide to leave the service, locking the environment can ensure that your customer data can never be accessed again by anyone, including Microsoft.
  > Note the following about environments locking:
  >
  > - Locked environments can't be restored from backup.
  > - Locked environment's data can't be copied to another environment.
  > - Locked production and sandbox environment's data persist in the platform but it can't be accessed.

## Unlock environments

To unlock environments, all key access permissions must be restored for the original encryption key. Submit a Microsoft Support request to unlock and enable the environments. The environments can only be enabled when the original encryption key used to encrypt the customer data is restored.

> [!IMPORTANT]
> Locked environments can't be enabled by an administrator when the key access permissions are restored. Environments remain disabled until a Microsoft Support request is received.

## See also

[Manage your customer-managed encryption key](customer-managed-key.md)
