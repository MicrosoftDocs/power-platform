---
title: Migrate from BYOK to self-managed key with Power Platform
description: Details how to migrate from the legacy self-managed key feature to customer-managed key
author: paulliew
ms.author: paulliew
ms.reviewer: matp, ratrtile, sericks
ms.topic: how-to 
ms.date: 08/09/2023
ms.custom: template-how-to
---
# Migrate bring-your-own-key (BYOK) environments to customer-managed key

For customers using the previous [manage the encryption key](manage-encryption-key.md) (BYOK) feature, they can change their BYOK enabled environment's encryption to use the new customer-managed key. You can also add your existing non-BYOK enabled environments to use the new customer-managed key.

- Add non-BYOK enabled environments – these are environments that you haven’t encrypted with your own key.
- Migrate BYOK enabled environments – these are environments that you have encrypted with your own key.

> [!IMPORTANT]
> We have assigned an account manager to each of the BYOK tenants to assist in your BYOK migration. Your account manager will work with you to develop a migration plan. The account manager will submit an internal service ticket to the engineering team to start the process where we first remove the BYOK feature flag from your Power Platform admin center. You will then start the migration as described in this documentation. We automatically complete the final migration steps when you move your last BYOK environment to customer-managed key. This is where we remove the SQL service restriction from all your remaining environments and remove the BYOK key vaults from your tenant, after 28 days from the date the final BYOK environment was migrated.  
>
> Once an environment is migrated to customer-managed key, the audit log is automatically moved to Azure CosmosDB and the upload files and images are moved to file storage and are encrypted automatically with the customer-managed key. When BYOK-enabled environments are migrated to this key management feature, the BYOK key in the Microsoft key vault is retained for at least 28 days so that support is available for restoring the environment.
>
> In addition to having the ability to use different or multiple encryption keys for separate environments and better management of your encryption key in your own key vault, upgrading BYOK to customer-managed key opens up your environments to all other Power Platform services that use non-SQL storage. For example, Customer Insights and Analytics, larger file upload sizes, more cost effective audit storage with audit retention, elastic table services, Dataverse search, and long-term retention are available.

If you have enabled audit and search in the BYOK environment and have uploaded files and created a data lake, all these storages will be automatically created and encrypted with the customer-managed encryption key.

Similarly, if you didn’t enable these audit or search functionalities and enabled them after your environment is encrypted with this feature, all these storages will be automatically created and encrypted with the encryption key.

1. Create a new encryption key and a new enterprise policy, or use an existing key and enterprise policy. More information: [Create the key and grant access overview](customer-managed-key.md#create-the-key-and-grant-access-overview) and [Create enterprise policy](customer-managed-key.md#create-enterprise-policy).
1. Enable the non-BYOK or BYOK environment as **Managed Environment**. More information: [Enable Managed Environment](customer-managed-key.md#enable-managed-environment-to-be-added-to-the-enterprise-policy).
1. Add the non-BYOK or BYOK environment to the policy to the enterprise policy to encrypt data: More information: [Add an environment to the enterprise policy to encrypt data](customer-managed-key.md#add-an-environment-to-the-enterprise-policy-to-encrypt-data).

> [!NOTE]
> There is no downtime when you migrate your BYOK environment.
>
> When a BYOK environment is migrated to customer-managed key, the environment shows up in the **Environments with policies** list, and shows that it is managed by **CustomerViaMicrosoft** on the **Environment Settings\Environment encryption** page.

## Next steps

[Manage your customer-managed encryption key](customer-managed-key.md)
