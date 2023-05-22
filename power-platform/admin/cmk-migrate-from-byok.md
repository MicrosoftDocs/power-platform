---
title: Migrate from BYOK to self-managed key with Power Platform
description: Details how to migrate from the legacy self-managed key feature to customer-managed key
author: paulliew
ms.author: paulliew
ms.reviewer: matp, ratrtile
ms.topic: how-to 
ms.date: 02/17/2023
ms.custom: template-how-to
---
# Migrate bring-your-own-key environments to customer-managed key (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

For customers using the previous [manage the encryption key](manage-encryption-key.md) (BYOK) feature, they can change their BYOK enabled environment's encryption to use the new customer-managed key. You can also add your existing non-BYOK enabled environments to use the new customer-managed key.

- Add non-BYOK enabled environments – these are environments that you haven’t encrypted with your own key.
- Migrate BYOK enabled environments – these are environments that you have encrypted with your own key.

> [!IMPORTANT]
>
> - This is a preview feature.
> - The environment is disabled during migration of the BYOK key to the customer-managed key. The downtime is short as we only need to change the encryption key for the SQL storage. Once the environment is migrated to customer-managed key, the audit log is automatically moved to Azure CosmosDB, the upload files and images are moved to file storage and are encrypted automatically with the customer-managed key. When BYOK enabled environments are migrated to this key management feature, the BYOK key in the Microsoft key vault is retained for at least 28 days so that support is available for restoring the environment.

If you have enabled audit and search in the BYOK environment and have uploaded files and created a data lake, all these storages will be automatically created and encrypted with the customer-managed encryption key.

Similarly, if you didn’t enable these audit or search functionalities and enabled them after your environment is encrypted with this feature, all these storages will be automatically created and encrypted with the encryption key.

1. Create a new encryption key and a new enterprise policy, or use an existing key and enterprise policy. More information: [Create the key and grant access overview](customer-managed-key.md#create-the-key-and-grant-access-overview) and [Create enterprise policy](customer-managed-key.md#create-enterprise-policy)
1. Add the non-BYOK or BYOK environment to the policy to the enterprise policy to encrypt data: More information: [Add an environment to the enterprise policy to encrypt data](customer-managed-key.md#add-an-environment-to-the-enterprise-policy-to-encrypt-data)

> [!NOTE]
> When migrating your BYOK environment to use the customer-managed key, the environment shows up in the **Environments with policies** list, and as Managed by **CustomerViaMicrosoft** on the **Environment Settings\Environment encryption** page.

## Next steps

[Manage your customer-managed encryption key (preview)](customer-managed-key.md)
