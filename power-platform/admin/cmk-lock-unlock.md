---
title: Lock self-managed key environments with Power Platform
description: Learn how to lock and unlock self-managed key environments
author: paulliew
ms.author: paulliew
ms.reviewer: sericks
ms.topic: how-to 
ms.date: 05/19/2025
ms.custom: template-how-to
---
# Lock environments by revoking key vault and/or key permission access

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
  > - Locked sandbox environments will be deleted after 7 days and production environments will be deleted after 30 days if key access is not restored.

## Enterprise policy status check (Preview)
To ensure the smooth operation of your customer-managed key environments, the health of the **Enterprise policy** is continually monitored. In an event the Azure key access is revoked, the enterprise policy is flagged as unhealthy and all the environments that are associated with the enterprise policy will be shut-down automatically. Users will not be able to use these locked out environments until the Azure key access is restored. 

When the environments are shut-down due to unhealthy entreprise policy status, a message will show up in the environment details page that the '**Environment disabled** due to unhealthy enterprise policy' on the Power Platform admin center.  

<<image of environment disabled message>>


## Unlock environments (Preview)

To unlock environments, all key access permissions must be restored for the original encryption key. The environments can only be enabled when the original Azure encryption key used to encrypt the customer data is restored. 
Re-enable the environments to unlock them.

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), and locate the environment.
1. On the environment **Details** page and under the **Environment disabled** section, select the **Re-enable environment** action.
1. Environment shall be enabled if the Azure key access was restored.

> [!IMPORTANT]
> Locked environments can be enabled by an administrator when the key access permissions are restored. Environments remain disabled and they can be enabled independently by the Power Platform administrator once the Azure key has been restored. 

## See also

[Manage your customer-managed encryption key](customer-managed-key.md)
