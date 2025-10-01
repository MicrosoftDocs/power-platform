---
title: Manage the encryption key 
description: Learn how you can manage database encryption keys for your environment.
ms.component: pa-admin
ms.topic: how-to
ms.date: 09/04/2025
author: mikferland-msft
ms.subservice: admin
ms.author: miferlan
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  -  udmehta 
  - paulliew
  - MSFTSimranKaur 
ms.custom:
  - "admin-security"
  - sfi-image-nochange
---

# Manage the encryption key 

All environments of Microsoft Dataverse use [!INCLUDE[pn_MS_SQL_Server](../includes/pn-ms-sql-server.md)] Transparent Data Encryption (TDE) to perform real-time encryption of data when written to disk. This is also known as encryption at rest.  
  
By default, [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] stores and manages the database encryption key for your environments so you don't have to. The managed keys feature in the Microsoft Power Platform admin center gives administrators the ability to self-manage the database encryption key that is associated with the Dataverse tenant. 

> [!IMPORTANT]
> Starting January 6, 2026, we'll discontinue support for bring-your-own-key (BYOK). Customers are encouraged to transition to customer-managed keys (CMK), an enhanced solution that offers improved functionality, broader support for data sources, and better performance. Learn more in [Manage your customer-managed encryption key](customer-managed-key.md) and [Migrate bring-your-own-key (BYOK) environments to customer-managed key](cmk-migrate-from-byok.md).

Encryption key management is only applicable to Azure SQL environment databases. The following features and services continue to use the Microsoft-managed encryption key to encrypt their data and can't be encrypted with the self-managed encryption key:
- Copilots and generative AI features in [Microsoft Power Platform and Microsoft Dynamics 365](geographical-availability-copilot.md) 
- Dataverse search
- Elastic tables
- Mobile Offline
- Activity Log (Microsoft 365 portal)
- Exchange (Server-side sync)
 
> [!NOTE] 
> - The self-managed database encryption key feature must be turned on by Microsoft for your tenant before you can use the feature.  
> - To use the data encryption management features for an environment, the environment must be created *after* the self-managed database encryption key feature is turned on by Microsoft.
> - After the feature is turned on in your tenant, all new environments are created with Azure SQL storage only. These environments, regardless of whether they're encrypted with bring-your-own-key (BYOK) or a Microsoft-managed key, have restrictions with file upload size, can't use Azure Cosmos DB and data lake services, and Dataverse search indexes are encrypted with a Microsoft-managed key. To use these services, you must [migrate to a customer-managed key](cmk-migrate-from-byok.md).
> - [Files](/powerapps/developer/data-platform/file-attributes) and [Images](/powerapps/developer/data-platform/image-attributes) with sizes of less than 128 MB can be used if your environment is version 9.2.21052.00103 or higher.
> - Most existing environments have file and log stored in non-Azure SQL databases. These environments can't be opted in to the self-managed encryption key. Only new environments (once you sign up for this program) can be enabled with a self-managed encryption key.

<a name="KM_tasks"></a>   
## Introduction to key management  
With key management, administrators can provide their own encryption key or have an encryption key generated for them, which is used to protect the database for an environment.  
  
The key management feature supports both PFX and BYOK encryption key files, such as those stored in a hardware security module (HSM). To use the upload encryption key option, you need both the public and private encryption key.  
  
The key management feature takes the complexity out of encryption key management by using [!INCLUDE[pn_azure_key_vault](../includes/pn-azure-key-vault.md)] to securely store encryption keys. [!INCLUDE[pn_azure_key_vault](../includes/pn-azure-key-vault.md)] helps safeguard cryptographic keys and secrets used by cloud applications and services. The key management feature doesn't require that you have an [!INCLUDE[pn_azure_key_vault](../includes/pn-azure-key-vault.md)] subscription and for most situations there's no need to access encryption keys used for Dataverse within the vault.  
  
The managed keys feature lets you perform the following tasks:  
  
- Enable the ability to self-manage database encryption keys that are associated with environments.  
  
- Generate new encryption keys or upload existing PFX or BYOK encryption key files.  
  
- Lock and unlock tenant environments.   
    > [!WARNING]
    > While a tenant is locked, no one can access any environments within the tenant. More information: [Lock the tenant](#lock-the-tenant)    
  
<a name="KM_risk"></a>  
 
## Understand the potential risk when you manage your keys
As with any business-critical application, personnel within your organization who have administrative-level access must be trusted. Before you use the key management feature, you should understand the risk when you manage your database encryption keys. It's conceivable that a malicious administrator (a person who is granted or has gained administrator-level access with intent to harm an organization's security or business processes) working within your organization might use the managed keys feature to create a key and use it to lock all environments in the tenant. 

Consider the following sequence of events.  
  
The malicious administrator signs in to the Power Platform admin center, goes to the **Environments** page and selects **Manage encryption key**. The malicious administrator then creates a new key with a password and downloads the encryption key to their local drive, and activates the new key. Now all the environment databases are encrypted with the new key. Next, the malicious administrator locks the tenant with the newly downloaded key, and then takes or deletes the downloaded encryption key.  

These actions result in disabling all the environments within the tenant from online access and make all database backups unrestorable.
  
> [!IMPORTANT]
> To prevent the malicious administrator from interrupting the business operations by locking the database, the managed keys feature doesn't allow tenant environments to be locked for 72 hours after the encryption key has changed or activated. This provides up to 72 hours for other administrators to roll back any unauthorized key changes. 
  
<a name="KM_details"></a>   

### Encryption key requirements

If you provide your own encryption key, your key must meet these requirements that are accepted by [!INCLUDE[pn_azure_key_vault](../includes/pn-azure-key-vault.md)].  
  
- The encryption key file format must be PFX or BYOK.  
- 2048-bit RSA.
- RSA-HSM key type (requires a Microsoft Support request).
- PFX encryption key files must be password protected.  
  
For more information about generating and transferring an HSM-protected key over the internet, see [How to generate and transfer HSM-protected keys for Azure Key Vault](/azure/key-vault/key-vault-hsm-protected-keys). Only [nCipher Vendor HSM key](/azure/key-vault/keys/hsm-protected-keys#supported-hsms) is supported. Before generating your HSM key, go to the Power Platform admin center **Manage encryption keys** > **Create New key** window to obtain the subscription ID for your environment region. You need to copy and paste this subscription ID into your HSM to create the key. This ensures that only our Azure Key Vault can open your file.
  
<a name="keymgt_tasks"></a>   

## Key management tasks  
To simplify the key management tasks, the tasks are broken down into three areas:
- [Generate or upload the encryption key for a tenant](#generate-or-upload-the-encryption-key-for-a-tenant)
- [Activate an encryption key for a tenant](#activate-an-encryption-key-for-a-tenant) 
- [Manage encryption for an environment](#manage-encryption-for-an-environment) 

Administrators can use the [Power Platform admin center](https://admin.powerplatform.microsoft.com/environments) or the [Power Platform administration module](/powershell/module/microsoft.powerapps.administration.powershell) cmdlets to perform the tenant protection key management tasks described here.
  
### Generate or upload the encryption key for a tenant  
All encryption keys are stored in the Azure Key Vault, and there can only be one active key at any time. Since the active key is used to encrypt all the environments in the tenant, managing the encryption is operated at the tenant level. Once the key is activated, each individual environment can then be selected to use the key for encryption. 

Use this procedure to set the managed key feature the first time for an environment or to change (or roll over) an encryption key for an already self-managed tenant.  

> [!WARNING]
> When you perform the steps described here for the first time, you're opting in to self-managing your encryption keys. More information: [Understand the potential risk when you manage your keys](#understand-the-potential-risk-when-you-manage-your-keys)  
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin).
  
1. Select the **Manage** in the navigation pane.
  
1. In the **Manage** pane, select **Environments**. The **Environments** page is displayed.
  
1. Select **Manage encryption keys** on the toolbar. 

1. Select **Confirm** to acknowledge the managed key risk.

1. Select **New key** on the toolbar.  
  
1. On the left pane, complete the details to generate or upload a key: 
     - Select a **Region**. This option is only shown if your tenant has multiple regions.
     - Enter a **Key name**.  
     - Choose from the following options: 
         - To create a new key, select **Generate new (.pfx)**. More information: [Generate a new key (.pfx)](#generate-a-new-key-pfx)
         - To use your own generated key, select **Upload (.pfx or .byok)**. More information: [Upload a key (.pfx or .byok)](#upload-a-key-pfx-or-byok)

1. Select **Next**. 

#### Generate a new key (.pfx)   
1. Enter a password and then reenter the password to confirm.
1. Select **Create** and then select the created file notification on your browser.
1. The encryption key .pfx file is downloaded to your web browser's default download folder. Save the file in a secure location (we recommend that this key is backed up along with its password). 

#### Upload a key (.pfx or .byok)
1. Select **Upload the Key**, select the .pfx or .byok<sup>1</sup> file, and then select **Open**. 
1. Enter the password for the key and then select **Create**.

<sup>1</sup> For .byok encryption key files, make sure you use the subscription ID as shown on the screen when you export the encryption key from your local HSM. More information: [How to generate and transfer HSM-protected keys for Azure Key Vault](/azure/key-vault/key-vault-hsm-protected-keys) 

> [!NOTE]
> To reduce the number of steps for the administrator to manage the key process, the key is automatically activated when it's uploaded the first time. All subsequent key uploads require an extra step to activate the key.

### Activate an encryption key for a tenant
Once an encryption key is generated or uploaded for the tenant, it can be activated. 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin).  
1. Select the **Manage** in the navigation pane. 
1. In the **Manage** pane, select **Environments**. The **Environments** page is displayed. 
1. Select **Manage encryption keys** on the toolbar. 
1. Select **Confirm** to acknowledge the managed key risk.
1. Select a key that has an **Available** state and then select **Activate key** on the toolbar.
1. Select **Confirm** to acknowledge the key change.

When you activate a key for the tenant, it takes a while for the key management service to activate the key. The status of the **Key state** displays the key as **Installing** when the new or uploaded key is activated. 

Once the key is activated, the following occurs: 
- All encrypted environments automatically get encrypted with the active key (there's no downtime with this action).
- When activated, the encryption key is applied to all environments that are changed from Microsoft-provided to self-managed encryption key.

> [!IMPORTANT]
> To streamline the key management process so that all environments are managed by the same key, the active key can't be updated when there are locked environments. All locked environments must be unlocked before a new key can be activated. If there are locked environments that don't need to be unlocked, they must be deleted. 

> [!NOTE]
> After an encryption key is activated, you can't activate another key for 24 hours.

### Manage encryption for an environment
By default, each environment is encrypted with the Microsoft-provided encryption key. Once an encryption key is activated for the tenant, administrators can elect to change the default encryption to use the activated encryption key. To use the activated key, follow these steps.

#### Apply encryption key to an environment
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin).
1. Select the **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. The **Environments** page is displayed.
1. Open a **Microsoft-provided** encrypted environment. 
1. Select **See all**. 
1. In the **Environment Encryption** section, select **Manage**. 
1. Select **Confirm** to acknowledge the managed key risk.
1. Select **Apply this key** to accept changing the encryption to use the activated key. 
1. Select **Confirm** to acknowledge that you're managing the key directly and that there's downtime for this action.

#### Return a managed encryption key back to Microsoft-provided encryption key
Returning to the Microsoft-provided encryption key configures the environment back to the default behavior where [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] manages the encryption key for you.  
  
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin).
1. Select the **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. The **Environments** page is displayed.
1. Select an environment that is encrypted with a self-managed key.
1. Select **See all**.
1. In the **Environment Encryption** section, select **Manage** and then select **Confirm**. 
1. Under **Return to standard encryption management**, select **Return**.
1. For production environments, confirm the environment by entering the environment's name.
1. Select **Confirm** to return to standard encryption key management.
  
#### Lock the tenant
Since there's only one active key per tenant, locking the encryption for the tenant *disables all the environments* that are in the tenant. All locked environments remain inaccessible to everyone, including [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)], until a Power Platform admin in your organization unlocks it by using the key that was used to lock it.  
  
> [!CAUTION]
> You should never lock the tenant environments as part of your normal business process. When you lock a Dataverse tenant, all the environments are taken offline and they can't be accessed by anyone, including Microsoft. Additionally, services such as synchronization and maintenance are all stopped. If you decide to leave the service, locking the tenant can ensure that your online data is never accessed again by anyone.  
>
> Note the following about tenant environments locking: 
> - Locked environments can't be restored from backup.  
> - Locked environments are deleted if not unlocked after 28 days.
> - You can't lock environments for 72 hours after an encryption key change. 
> - Locking a tenant *locks all active environments* within the tenant. 

> [!IMPORTANT]
> - You must wait at least one hour after you lock active environments before you can unlock them. 
> - Once the lock process begins, all encryption keys with either an Active or Available state are deleted. The lock process can take up to an hour and during this time unlocking locked environments isn't allowed. 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin). 
1. Select the **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. The **Environments** page is displayed.
1. Select **Manage encryption keys** on the toolbar. 
1. Select the **Active** key and then select **Lock active environments**. 
1. On the right pane select **Upload active key**, browse to and select the key, enter the password, and then select **Lock**. 
1. When prompted, enter the text that is displayed on your screen to confirm that you want to lock all environments in the region, and then select **Confirm**.
  
#### Unlock locked environments
To unlock environments, you must first [upload](#upload-a-key-pfx-or-byok) and then [activate](#activate-an-encryption-key-for-a-tenant) the tenant encryption key with the same key that was used to [lock the tenant](#lock-the-tenant). Locked environments don't get unlocked automatically once the key has been activated. Each locked environment has to be unlocked individually. 

> [!IMPORTANT]
> - You must wait at least one hour after you lock active environments before you can unlock them. 
> - The unlock process can take up to an hour. Once the key is unlocked, you can use the key to [Manage encryption for an environment](#manage-encryption-for-an-environment). 
> - You can't generate a new or upload an existing key until all locked environments are unlocked. 

##### Unlock encryption key
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin). 
1. Select the **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. The **Environments** page is displayed.
1. Select **Manage encryption keys** on the toolbar. 
1. Select the key that has a **Locked** state, and then on the command bar select **Unlock key**. 
1. Select **Upload locked key**, browse to and select the key that was used to lock the tenant, enter the password, and then select **Unlock**. 

   The key goes into an **Installing** state. You must wait until the key is in an **Active** state before you can unlock locked environments. 
1. To unlock an environment, see the next section. 

##### Unlock environments
1. Go to the **Environments** page, and then select the locked environment name. 

   > [!TIP]
   > Don't select the row. Select the environment name. 

1. In the **Details** section, select **See all** to display the **Details** pane on the right. 
1. In the **Environment** encryption section on the **Details** pane, select **Manage**.
1. On the **Environment encryption** page, select **Unlock**. 
1. Select **Confirm** to confirm that you want to unlock the environment. 
1. Repeat the previous steps to unlock other environments. 

## Environment database operations 
A customer tenant can have environments that are encrypted using the Microsoft managed key and environments that are encrypted with the customer managed key. To maintain data integrity and data protection, the following controls are available when managing environment database operations.

1. [Restore](backup-restore-environments.md) 

   The environment to overwrite (the restored to environment) is restricted to the same environment that the backup was taken from or to another environment that is encrypted with the same customer-managed key. Additionally, a past backup taken when the environment was encrypted with Microsoft-managed key can't be restored to an environment that is currently encrypted with the customer-managed key. In other words, restoring a backup to an environment is allowed when the current environment encryption state (whether Microsoft-managed key or customer-managed key) matches the environment encryption state at the time of when the backup was taken.

1. [Copy](copy-environment.md)

   The environment to overwrite (the copied to environment) is restricted to another environment that is encrypted with the same customer-managed key. 

   > [!NOTE]
   > If a Support Investigation environment was created to resolve a support issue in a customer-managed environment, the encryption key for the Support Investigation environment must be changed to customer-managed key before the Copy environment operation can be performed. 

1. [Reset](sandbox-environments.md#reset-a-sandbox-environment)

   The environment's encrypted data is deleted, including backups. After the environment is reset, the environment encryption will revert back to the Microsoft-managed key. 

### Related content

[SQL Server: Transparent Data Encryption (TDE)](/sql/relational-databases/security/encryption/transparent-data-encryption?view=sql-server-2017&preserve-view=true)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
