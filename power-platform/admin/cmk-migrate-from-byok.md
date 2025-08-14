---
title: Migrate bring-your-own-key (BYOK) environments to customer-managed key
description: Details how to migrate from the legacy self-managed key feature to customer-managed key
author: paulliew
ms.author: paulliew
ms.reviewer: matp, ratrtile, sericks
ms.topic: how-to 
ms.date: 01/13/2025
ms.custom: template-how-to
contributors:
- MSFTSimranKaur

---

# Migrate bring-your-own-key (BYOK) environments to customer-managed key

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

For customers using the previous [manage the encryption key](manage-encryption-key.md) (BYOK) feature, they can change their environment's encryption to use the new [customer-managed key](customer-managed-key.md). You can also add your existing non-BYOK environments to use the new customer-managed key.

- Add non-BYOK environments – these are environments that you haven’t encrypted with your own key.
- Migrate BYOK environments – these are environments that you have encrypted with your own key.

## Services that don't work in BYOK environments
BYOK tenants' environments are locked out of the following services unless they migrate to customer-managed key:
 
- Audit in IP firewall
-	Audit data in Synapse workspace and Power BI 
-	Copilot search index which uses Dataverse search 
- AI Builder
- Dataverse search index
- Elastic tables
- Power BI embedded – applications and customers’ Power BI reports and dashboards
- Canvas apps 
- Power Automate flows

## Migrate as soon as possible
To ensure uninterrupted service, customers currently using the bring-your-own-key (BYOK) feature, must migrate to customer-managed keys (CMK) before January 6, 2026. You can migrate to [customer-managed key](customer-managed-key.md) immediately without the need to contact Microsoft. If you need assistance, reach out to your FastTrack or account manager, or submit a support ticket.

### What action do I need to take?
Starting January 6, 2026, we will discontinue support for the bring-your-own-key (BYOK) feature. Customers are encouraged to transition to customer-managed keys (CMK), an enhanced solution that offers improved functionality, broader support for data sources, and better performance.
 
### Benefits of migrating to CMK
- **Enhanced data protection**: CMK allows you to manage the database encryption key for your Microsoft Dataverse environment, providing greater control over your data security.
- **No file size limitations**: CMK removes upload size limits for files and images, allowing seamless management of larger data assets.
- **Broader service support**: CMK supports a wider range of first-party services, including environments where files and logs are stored in non-Azure SQL databases, allowing compatibility and scalability.
- **No downtime**: There is no downtime when you migrate your BYOK environment.

### What happens if migration isn't completed?
Effective June 1, 2025, customers will be unable to apply BYOK to production environments.

If your migration to CMK isn't completed by January 6, 2026, your environment automatically reverts to Microsoft-managed keys. While this ensures continuity of encryption, it limits the control and flexibility you currently enjoy with BYOK. To avoid disruption and take full advantage of the enhanced features and security offered by CMK, we strongly recommend that you begin your migration process as soon as possible. 

### Audit and search functionality
If you have turned on audit and search functionality in the BYOK environment and have uploaded files and created a data lake, all these storages are automatically created and encrypted with the customer-managed encryption key.

Similarly, if you didn’t turn on the audit or search functionalities or turned them on after your environment was encrypted with this feature, all these storages are automatically created and encrypted with the encryption key.

## Migration steps

1. Create a new encryption key and a new enterprise policy, or use an existing key and enterprise policy. Learn more in [Create encryption key and grant access](customer-managed-key.md#create-encryption-key-and-grant-access) and [Create enterprise policy](customer-managed-key.md#create-enterprise-policy).
1. Configure the non-BYOK or BYOK environment as a **Managed Environment**. Learn more in [Enable Managed Environment](customer-managed-key.md#enable-managed-environment-to-be-added-to-the-enterprise-policy).
1. Add the non-BYOK or BYOK environment to the policy to the enterprise policy to encrypt data. Learn more in [Add an environment to the enterprise policy to encrypt data](customer-managed-key.md#add-an-environment-to-the-enterprise-policy-to-encrypt-data).

## After migration
After you complete the migration, note the following:

- When a BYOK environment is migrated to customer-managed key, the environment shows up in the **Environments with policies** list, and shows that it is managed by **CustomerViaMicrosoft** on the **Environment Settings\Environment encryption** page.

- Upon completion of migrating your last BYOK environment, create a support ticket and request Microsoft to remove the BYOK option from your Power Platform admin center. Microsoft will also remove the SQL service restriction from all of your remaining environments and delete the BYOK key vaults from your tenant, after 28 days from the date the final BYOK environment was migrated.  

- Once an environment is migrated to customer-managed key, the audit log is automatically moved to Azure CosmosDB and the upload files and images are moved to file storage and are encrypted automatically with the customer-managed key. The migrated environment can't be re-encrypted with the BYOK key. The environment also can't be reverted to Microsoft-managed key for at least seven days.

- When BYOK-enabled environments are migrated to this key management feature, the BYOK key in the Microsoft key vault is retained for at least 28 days so that support is available for restoring the environment.

- In addition to having the ability to use different or multiple encryption keys for separate environments and better management of your encryption key in your own key vault, upgrading BYOK to customer-managed key opens up your environments to all other Power Platform services that use non-SQL storage. For example, Customer Insights and Analytics, larger file upload sizes, more cost effective audit storage with audit retention, elastic table services, Dataverse search, and long-term retention are available.

## Next steps

[Manage your customer-managed encryption key](customer-managed-key.md)
