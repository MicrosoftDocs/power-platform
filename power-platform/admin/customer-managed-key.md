---
title: Manage your customer-managed encryption key
description: Learn how to manage your encryption key. 
author: paulliew
ms.author: paulliew
ms.reviewer: sericks, matp, ratrtile
ms.topic: how-to
ms.date: 6/9/2025
ms.custom: template-how-to
ms.contributors:
  - paulliew
  - samathur
  - v-aangie
  - kakazemi
  - lauravasiliums
  - sericks
  - syalandur
contributors
  - paulliew
  - kavehkazms
  - lauravasiliums
  - sericks007
  - syalandur24

---
# Manage your customer-managed encryption key

Customers have data privacy and compliance requirements to secure their data by encrypting their data at-rest. This secures the data from exposure in an event where a copy of the database is stolen. With data encryption at-rest, the stolen database data is protected from being restored to a different server without the encryption key.

All customer data stored in Power Platform is encrypted at-rest with strong Microsoft-managed encryption keys by default. Microsoft stores and manages the database encryption key for all your data so you don't have to. However, Power Platform provides this customer-managed encryption key (CMK) for your added data protection control where you can self-manage the database encryption key that is associated with your Microsoft Dataverse environment. This allows you to rotate or swap the encryption key on demand, and also allows you to prevent Microsoft's access to your customer data when you revoke the key access to our services at any time.

To learn more about customer managed key in Power Platform, watch the customer-managed key video.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=6b5742f5-2ff6-4a26-9ab6-ce983b092c42]

These encryption key operations are available with customer-managed key (CMK):

- Create an RSA (RSA-HSM) key from your Azure Key vault.
- Create a Power Platform enterprise policy for your key.
- Grant the Power Platform enterprise policy permission to access your key vault.
- Grant the Power Platform service admin to read the enterprise policy.
- Apply encryption key to your environment.
- Revert/remove environment’s CMK encryption to Microsoft-managed key.
- Change key by creating a new enterprise policy, removing the environment from CMK and reapply CMK with new enterprise policy.
- Lock CMK environments by revoking CMK key vault and/or key permissions.
- Migrate [bring-your-own-key (BYOK)](cmk-migrate-from-byok.md) environments to CMK by applying CMK key.

Currently, all your customer data stored *only* in the following apps and services can be encrypted with customer-managed key:

- Dataverse (Custom solutions and Microsoft services)
- Dataverse [Copilot for model-driven apps](/power-apps/maker/model-driven-apps/add-ai-copilot)  
- [Power Automate](/power-automate/customer-managed-keys)
- Chat for Dynamics 365
- [Dynamics 365 Sales](/dynamics365/sales/sales-gdpr-faqs#can-the-dynamics-365-sales-data-be-encrypted-using-customer-managed-encryption-key-cmk)
- Dynamics 365 Customer Service
- [Dynamics 365 Customer Insights - Data](/dynamics365/customer-insights/data/overview)
- Dynamics 365 Field Service
- Dynamics 365 Retail
- Dynamics 365 Finance (Finance and operations)
- Dynamics 365 Intelligent Order Management (Finance and operations)
- Dynamics 365 Project Operations (Finance and operations)
- Dynamics 365 Supply Chain Management (Finance and operations)
- Dynamics 365 Fraud Protection (Finance and operations)
- [Copilot Studio](/microsoft-copilot-studio/admin-customer-managed-keys)

> [!NOTE]
>
> - Contact a representative for services not listed above for information about customer-managed key support.
> - Nuance Conversational IVR and [maker welcome content](welcome-content.md) are excluded from customer-managed key encryption.
> - The connection settings for connectors continue to be encrypted with a Microsoft-managed key.
> - Power Apps display names, descriptions, and connection metadata continue to be encrypted with a Microsoft-managed key.
> - The download results link and other data produced by solution checker enforcement during a solution check continues to be encrypted with a Microsoft-managed key.

Environments with finance and operations apps where [Power Platform integration is enabled](/dynamics365/fin-ops-core/dev-itpro/power-platform/enable-power-platform-integration) can also be encrypted. Finance and operations environments without Power Platform integration will continue to use the default Microsoft managed key to encrypt data. More information: [Encryption in finance and operations apps](/dynamics365/fin-ops-core/dev-itpro/sysadmin/customer-managed-keys)

:::image type="content" source="media/cmk-power-platform-diagram.png" alt-text="Customer-managed encryption key in the Power Platform":::

## Introduction to customer-managed key

With customer-managed key, administrators can provide their own encryption key from their own Azure Key Vault to the Power Platform storage services to encrypt their customer data. Microsoft doesn't have direct access to your Azure Key Vault. For Power Platform services to access the encryption key from your Azure Key Vault, the administrator creates a Power Platform enterprise policy, which references the encryption key and grants this enterprise policy access to read the key from your Azure Key Vault.

The Power Platform service administrator can then add Dataverse environments to the enterprise policy to start encrypting all the customer data in the environment with your encryption key. Administrators can change the environment's encryption key by creating another enterprise policy and add the environment (after removing it) to the new enterprise policy. If the environment no longer needs to be encrypted using your customer-managed key, the administrator can remove the Dataverse environment from the enterprise policy to revert the data encryption back to Microsoft-managed key.

The administrator can lock the customer-managed key environments by revoking key access from the enterprise policy and unlock the environments by restoring the key access. More information: [Lock environments by revoking key vault and/or key permission access](cmk-lock-unlock.md)

To simplify the key management tasks, the tasks are broken down into three main areas:

1. Create encryption key.
1. Create enterprise policy and grant access.
1. Manage environment's encryption.

> [!WARNING]
> When environments are locked, they can't be accessed by anyone, including Microsoft support. Environments that are locked become disabled and data loss can occur.

## Licensing requirements for customer managed key

Customer managed key policy is only enforced on environments that are activated for Managed Environments. Managed Environments are included as an entitlement in standalone Power Apps, Power Automate, Microsoft Copilot Studio, Power Pages, and Dynamics 365 licenses that give premium usage rights. Learn more about [Managed Environment licensing](managed-environment-licensing.md), with the [Licensing overview for Microsoft Power Platform](pricing-billing-skus.md).

In addition, access to using customer managed key for Microsoft Power Platform and Dynamics 365 requires users in the environments where the encryption key policy is enforced to have one of these subscriptions:

- Microsoft 365 or Office 365 A5/E5/G5
- Microsoft 365 A5/E5/F5/G5 Compliance
- Microsoft 365 F5 Security & Compliance
- Microsoft 365 A5/E5/F5/G5 Information Protection and Governance
- Microsoft 365 A5/E5/F5/G5 Insider Risk Management

[Learn more about these licenses](https://go.microsoft.com/fwlink/?linkid=2214240).

## Understand the potential risk when you manage your key

As with any business critical application, personnel within your organization who have administrative-level access must be trusted. Before you use the key management feature, you should understand the risk when you manage your database encryption keys. It's conceivable that a malicious administrator (a person who is granted or has gained administrator-level access with intent to harm an organization's security or business processes) working within your organization might use the manage keys feature to create a key and use it to lock your environments in the tenant.

Consider the following sequence of events.

The malicious key vault administrator creates a key and an enterprise policy on the Azure portal. The Azure Key Vault administrator goes to Power Platform admin center, and adds environments to the enterprise policy. The malicious administrator then returns to the Azure portal and revokes key access to the enterprise policy thus locking all the environments. This causes business interruptions as all the environments become inaccessible, and if this event isn't resolved, that is, the key access restored, the environment data can be potentially lost.

> [!NOTE]
>
> - Azure Key Vault has built-in safeguards that help restoring the key, which require the **Soft Delete** and **Purge protection** key vault settings enabled.
> - Another safeguard to be considered is to make sure that there's separation of tasks where the Azure Key Vault administrator isn't granted access to the Power Platform admin center.

### Separation of duty to mitigate the risk

This section describes the customer-managed key feature duties that each admin role is responsible for. Separating these tasks helps mitigate the risk involved with customer-managed keys.

#### Azure Key Vault and Power Platform/Dynamics 365 service admin tasks

To enable customer-managed keys, first the key vault administrator creates a key in the Azure key vault and creates a Power Platform enterprise policy. When the enterprise policy is created, a special Microsoft Entra ID managed identity is created. Next, the key vault administrator returns to the Azure key vault and grants the enterprise policy/managed identity access to the encryption key.

The key vault administrator then grants the respective Power Platform/Dynamics 365 service admin read access to the enterprise policy. Once read permission is granted, the Power Platform/Dynamics 365 service admin can go to the Power Platform Admin Center and add environments to the enterprise policy. All added environments customer data is then encrypted with the customer-managed key linked to this enterprise policy.

##### Prerequisites

- An Azure subscription that includes Azure Key Vault or Azure Key Vault managed hardware security modules.
- A Microsoft Entra ID with:
  - Contributor permission to the Microsoft Entra subscription.
  - Permission to create an Azure Key Vault and key.
  - Access to create a resource group. This is required to set up the key vault.

##### Create the key and grant access using Azure Key Vault

The Azure Key Vault administrator performs these tasks in Azure.

1. Create an Azure paid subscription and Key Vault. Ignore this step if you already have a subscription that includes Azure Key Vault.
1. Go to the Azure Key Vault service, and create a key. More information: [Create a key in the key vault](#create-a-key-in-the-key-vault)
1. Enable the Power Platform enterprise policies service for your Azure subscription. Do this only once. More information: [Enable the Power Platform enterprise policies service for your Azure subscription](#enable-the-power-platform-enterprise-policies-service-for-your-azure-subscription)
1. Create a Power Platform enterprise policy. More information: [Create enterprise policy](#create-enterprise-policy)
1. Grant enterprise policy permissions to access the key vault. More information: [Grant enterprise policy permissions to access key vault](#grant-enterprise-policy-permissions-to-access-key-vault)
1. Grant Power Platform and Dynamics 365 administrators permission to read the enterprise policy. More information: [Grant the Power Platform admin privilege to read enterprise policy](#grant-the-power-platform-admin-privilege-to-read-enterprise-policy)

#### Power Platform/Dynamics 365 service admin Power Platform admin center tasks

##### Prerequisite

Power Platform administrator must be assigned to either the Power Platform or Dynamics 365 Service administrator Microsoft Entra role.

##### Manage environment's encryption in Power Platform admin center

The Power Platform administrator manages customer-managed key tasks related to the environment in Power Platform admin center.

1. Add the Power Platform environments to the enterprise policy to encrypt data with the customer-managed key. More information: [Add an environment to the enterprise policy to encrypt data](#add-an-environment-to-the-enterprise-policy-to-encrypt-data)
1. Remove environments from enterprise policy to return encryption to Microsoft managed key. More information: [Remove environments from policy to return to Microsoft managed key](#remove-environments-from-policy-to-return-to-microsoft-managed-key)
1. Change the key by removing environments from the old enterprise policy and adding environments to a new enterprise policy. More information: [Create encryption key and grant access](#change-the-environments-encryption-key-with-a-new-enterprise-policy-and-key)
1. Migrate from BYOK. If you're using the earlier self-managed encryption key feature, you can migrate your key to customer managed key. More information: [Migrate bring-your-own-key environments to customer-managed key](cmk-migrate-from-byok.md)

## Create encryption key and grant access

### Create an Azure paid subscription and key vault

In Azure, perform the following steps:

1. Create a Pay-as-you-go or its equivalent Azure subscription. This step isn't needed if the tenant already has a subscription.
1. Create a resource group. More information: [Create resource groups](/azure/azure-resource-manager/management/manage-resource-groups-portal#create-resource-groups)

   > [!Note]
   > Create or use a resource group that has a location, for example, Central US, that matches the Power Platform environment's region, such as United States.

1. Create a key vault using the paid subscription that includes soft-delete and purge protection with the resource group you created in the previous step.
  
   > [!IMPORTANT]
   > To ensure that your environment is protected from accidental deletion of the encryption key, the key vault must have soft-delete and purge protection enabled. You won’t be able to encrypt your environment with your own key without enabling these settings. More information: [Azure Key Vault soft-delete overview](/azure/key-vault/general/soft-delete-overview) More information: [Create a key vault using Azure portal](/azure/key-vault/general/quick-create-portal)

#### Create a key in the key vault

1. Make sure you've met the [prerequisites](#prerequisites).
1. Go to the [Azure portal](https://ms.portal.azure.com/) > **Key Vault** and locate the key vault where you want to generate an encryption key.
1. Verify the Azure key vault settings:
   1. Select **Properties** under **Settings**.
   1. Under **Soft-delete**, set or verify that it's set to **Soft delete has been enabled on this key vault** option.
   1. Under **Purge protection**, set or verify that **Enable purge protection (enforce a mandatory retention period for deleted vaults and vault objects)** is enabled.
   1. If you made changes, select **Save**.

##### Create RSA keys

1. Create or import a key that has these properties:
   1. On the **Key Vault** properties pages, select **Keys**.
   1. Select **Generate/Import**.
   1. On the **Create a key** screen set the following values, and then select **Create**.
      - **Options**: **Generate**
      - **Name**: Provide a name for the key
      - **Key type**: **RSA**
      - **RSA key size**: **2048** or **3072**

   > [!Important]
   > If you set an **expiration date** in your key and the key expired, all the environments that're encrypted with this key will be down. Set [an alert to monitor expiry certificates](/azure/key-vault/general/alert#example-log-query-alert-for-near-expiry-certificates) with email notifications for your local Power Platform admin and Azure key vault admin as a reminder to renew the expiration date. This is important to prevent any unplanned system outages.  

#### Import protected keys for Hardware Security Modules (HSM)

You can use your protected keys for hardware security modules (HSM) to encrypt your Power Platform Dataverse environments. Your [HSM-protected keys must be imported into the key vault](/azure/key-vault/keys/hsm-protected-keys) so an Enterprise policy can be created. For more information, see [Supported HSMs](/azure/key-vault/keys/hsm-protected-keys#supported-hsms) [Import HSM-protected keys to Key Vault (BYOK)](/azure/key-vault/keys/hsm-protected-keys-byok?tabs=azure-cli).

#### Create a key in the Azure Key Vault Managed HSM

You can use an encryption key created from the Azure Key Vault Managed HSM to encrypt your environment data. This gives you FIPS 140-2 Level 3 support.

##### Create RSA-HSM keys

1. Make sure you've met the [prerequisites](#prerequisites).
1. Go to the [Azure portal](https://ms.portal.azure.com/).
1. Create a [Managed HSM](/azure/key-vault/managed-hsm/quick-create-cli#create-a-managed-hsm):
   1. [Provision the Managed HSM](/azure/key-vault/managed-hsm/quick-create-cli#provision-a-managed-hsm).
   1. [Activate the Managed HSM](/azure/key-vault/managed-hsm/quick-create-cli#activate-your-managed-hsm).
1. Enable **Purge Protection** in your Managed HSM.
1. Grant the **Managed HSM Crypto User** role to the person who created the Managed HSM key vault.
   1. Access the Managed HSM key vault on the [Azure portal](https://portal.azure.com/).
   1. Navigate to **Local RBAC** and select **+ Add**.
   1. In the **Role** drop-down list, select the **Managed HSM Crypto User** role on the **Role assignment** page.
   1. Select **All keys** under **Scope**.
   1. Select **Select security principal**, and then select the admin on the **Add Principal** page.
   1. Select **Create**.
1. Create an RSA-HSM key:
      - **Options**: **Generate**
      - **Name**: Provide a name for the key
      - **Key type**: **RSA-HSM**
      - **RSA key size**: **2048**

      > [!NOTE]
      > Supported [RSA-HSM key sizes:](/azure/key-vault/keys/about-keys#hsm-protected-keys) 2048-bit and 3072-bit.

#### Encrypt your environment with key from Azure Key Vault with private link

You can update your Azure Key vault's networking by enabling a [private endpoint](/azure/key-vault/general/private-link-service?tabs=portal#establish-a-private-link-connection-to-key-vault-using-the-azure-portal) and use the key in the key vault to encrypt your Power Platform environments.

You can either create a [new key vault and establish a private link connection](/azure/key-vault/general/private-link-service?tabs=portal#create-a-new-key-vault-and-establish-a-private-link-connection) or [establish a private link connection to an existing key vault](/azure/key-vault/general/private-link-service?tabs=portal#establish-a-private-link-connection-to-an-existing-key-vault), and create a key from this key vault and use it to encrypt your environment. You can also [establish a private link connection to an existing key vault](/azure/key-vault/general/private-link-service?tabs=portal#establish-a-private-link-connection-to-an-existing-key-vault) after you have already created a key and use it to encrypt your environment.

##### Encrypt data with key from key vault with private link

1. Create an [Azure Key vault](/azure/key-vault/general/quick-create-portal#create-a-vault) with these options:
   - Enable **Purge Protection**
   - Key type: RSA
   - Key size: 2048 or 3072
1. Copy the key vault URL and the encryption key URL to be used for creating the enterprise policy.

   > [!NOTE]
   > Once you've added a private endpoint to your key vault or disabled the public access network, you won’t be able to see the key unless you have the appropriate permission.
1. Create a [virtual network](/azure/virtual-network/quick-create-portal).
1. Return to your key vault and add [private endpoint connections to your Azure Key vault](/azure/key-vault/general/private-link-service?tabs=portal#establish-a-private-link-connection-to-an-existing-key-vault_).

   > [!NOTE]
   > You need to select the **Disable public access** networking option and enable the **Allow trusted Microsoft services to bypass this firewall** exception.

1. Create a Power Platform enterprise policy. More information: [Create enterprise policy](#create-enterprise-policy)
1. Grant enterprise policy permissions to access the key vault. More information: [Grant enterprise policy permissions to access key vault](#grant-enterprise-policy-permissions-to-access-key-vault)
1. Grant Power Platform and Dynamics 365 administrators permission to read the enterprise policy. More information: [Grant the Power Platform admin privilege to read enterprise policy](#grant-the-power-platform-admin-privilege-to-read-enterprise-policy)
1. Power Platform admin center admin selects the environment to encrypt and enable Managed environment. More information: [Enable Managed environment to be added to the enterprise policy](#enable-managed-environment-to-be-added-to-the-enterprise-policy)
1. Power Platform admin center admin adds the Managed environment to the enterprise policy. More information: [Add an environment to the enterprise policy to encrypt data](#add-an-environment-to-the-enterprise-policy-to-encrypt-data)

### Enable the Power Platform enterprise policies service for your Azure subscription

Register Power Platform as a resource provider. You only need to do this task once for each Azure subscription where your Azure Key vault resides. You need to have access rights to the subscription in order to register the resource provider.

1. Sign in to the [Azure portal](https://ms.portal.azure.com/) and go to **Subscription** > **Resource providers**.
1. In the list of **Resource providers**, search for **Microsoft.PowerPlatform**, and **Register** it.

## Create enterprise policy

1. Install PowerShell MSI. More information: [Install PowerShell on Windows, Linux, and macOS](https://ms.portal.azure.com/#create/Microsoft.Template)
1. After the PowerShell MSI is installed, go back to [Deploy a custom template](https://ms.portal.azure.com/#create/Microsoft.Template) in Azure.
1. Select the **Build your own template in the editor** link.
1. Copy [this JSON template](#enterprise-policy-json-template) into a text editor such as Notepad. More information: [Enterprise policy json template](#enterprise-policy-json-template)
1. Replace the values in the JSON template for: *EnterprisePolicyName*, *location where EnterprisePolicy needs to be created*, *keyVaultId*, and *keyName*. More information: [Field definitions for json template](#field-definitions-for-json-template)
1. Copy the updated template from your text editor then paste it into the **Edit template** of the **Custom deployment** in Azure, and select **Save**.
1. Select a **Subscription** and **Resource group** where the enterprise policy is to be created.
1. Select **Review + create**, and then select **Create**.

A deployment is started. When it's done, the enterprise policy is created.

### Enterprise policy json template

```json
 {
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {},
    "resources": [
        {
            "type": "Microsoft.PowerPlatform/enterprisePolicies",
            "apiVersion": "2020-10-30",
            "name": {EnterprisePolicyName},
            "location": {location where EnterprisePolicy needs to be created},
            "kind": "Encryption",
            "identity": {
                "type": "SystemAssigned"
            },
            "properties": {
                "lockbox": null,
                "encryption": {
                    "state": "Enabled",
                    "keyVault": {
                        "id": {keyVaultId},
                        "key": {
                            "name": {keyName}
                        }
                    }
                },
                "networkInjection": null
            }
        }
    ]
   }
```

### Field definitions for JSON template

- **name**. Name of the enterprise policy. This is the name of the policy that appears in Power Platform admin center.
- **location**. One of the following. This is the location of the enterprise policy and it must correspond with the Dataverse environment’s region:

  - '"unitedstates"'
  - '"southafrica"'
  - '"uk"'
  - '"japan"'
  - '"india"'
  - '"france"'
  - '"europe"'
  - '"germany"'
  - '"switzerland"'
  - '"canada"'
  - '"brazil"'
  - '"australia"'
  - '"asia"'
  - '"uae"'
  - '"korea"'
  - '"norway"'
  - '"singapore"'
  - '"sweden"'

- Copy these values from your key vault properties in the Azure portal:
  - **keyVaultId**: Go to **Key vaults** > select your key vault > **Overview**. Next to **Essentials** select **JSON View**. Copy the **Resource ID** to the clipboard and paste the entire contents into your JSON template.
  - **keyName**: Go to **Key vaults** > select your key vault > **Keys**. Notice the key **Name** and type the name into your JSON template.
  
### Grant enterprise policy permissions to access key vault

Once the enterprise policy is created, the key vault administrator grants the enterprise policy’s managed identity access to the encryption key.

1. Sign into the [Azure portal](https://ms.portal.azure.com/) and go to **Key vaults**.
1. Select the key vault where the key was assigned to the enterprise policy.
1. Select the **Access control (IAM)** tab, and then select **+ Add**.
1. Select **Add role assignment** from the drop-down list,
1. Search **Key Vault Crypto Service Encryption User** and select it.
1. Select **Next**.
1. Select **+ Select members**.
1. Search for the enterprise policy you have created.
1. Select the enterprise policy, and then choose **Select**.
1. Select **Review + assign**.

The above permission setting is based on your key vault's **Permission model** of **Azure role-based access control**. If your key vault is set to **Vault access policy**, it's recommended that you migrate to the role-based model. To grant your enterprise policy access to the key vault using **Vault access policy**, create an Access policy, select **Get** on *Key management operations* and **Unwrap key** and **Wrap key** on *Cryptographic Operations*.

> [!NOTE]
> To prevent any unplanned system outages, it's important that the enterprise policy has access to the key. Make sure that:
>
> - The key vault is active.
> - The key is active and not expired.
> - The key isn't deleted.
> - The above key permissions aren't revoked.
>
> The environments which are using this key are disabled when the encryption key isn't accessible.

### Grant the Power Platform admin privilege to read enterprise policy

Administrators who have Dynamics 365 or Power Platform administration roles can access the Power Platform admin center to assign environments to the enterprise policy. To access the enterprise policies, the admin with Azure key vault access is required to grant the **Reader** role to the Power Platform admin. Once the **Reader** role is granted, the Power Platform administrator is able to view the enterprise policies on the Power Platform admin center.  

> [!NOTE]
> Only Power Platform and Dynamics 365 administrators who are granted the reader role to the enterprise policy can add an environment to the policy. Other Power Platform or Dynamics 365 administrators might be able to view the enterprise policy but they get an error when they try to **Add environment** to the policy.

### Grant reader role to a Power Platform administrator

1. Sign into the [Azure portal](https://ms.portal.azure.com/).
1. Copy the Power Platform or Dynamics 365 admin’s object ID. To do this:
   1. Go to the **Users** area in Azure.
   1. In the **All users** list, find the user with Power Platform or Dynamics 365 admin permissions using **Search users**.
   1. Open the user record, on the **Overview** tab copy the user’s **Object ID**. Paste this into a text editor such as NotePad for later.
1. Copy the enterprise policy resource ID. To do this:
   1. Go to **Resource Graph Explorer** in Azure.
   1. Enter `microsoft.powerplatform/enterprisepolicies` in the **Search** box, and then select the **microsoft.powerplatform/enterprisepolicies** resource.
   1. Select **Run query** on the command bar. A list of all the Power Platform enterprise policies is displayed.
   1. Locate the enterprise policy where you want to grant access.
   1. Scroll to the right of the enterprise policy and select **See details**.
   1. On the **Details** page, copy the **id**.
1. Start [Azure Cloud Shell](https://azure.microsoft.com/get-started/azure-portal/cloud-shell/#features), and run the following command replacing *objId* with the user’s object ID and *EP Resource Id* with the `enterprisepolicies` ID copied in the previous steps:
    `New-AzRoleAssignment -ObjectId { objId} -RoleDefinitionName Reader -Scope {EP Resource Id}`

## Manage environment's encryption

To manage the environment's encryption, you need the following permission:

- Microsoft Entra active user who has a Power Platform and/or Dynamics 365 admin security role.
- Microsoft Entra user who has either a Power Platform or Dynamics 365 service admin role.

The key vault admin notifies the Power Platform admin that an encryption key and an enterprise policy were created and provides the enterprise policy to the Power Platform admin. To enable the customer-managed key, the Power Platform admin assigns their environments to the enterprise policy. Once the environment is assigned and saved, Dataverse initiates the encryption process to set all the environment data, and encrypt it with the customer-managed key.

### Enable Managed environment to be added to the enterprise policy

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**, and then seleect an environment from the available list of environments.
1. Select **Enable Managed Environments**.
1. Select **Enable**.

##### [Classic admin center](#tab/classic)

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Environments** .
1. Select an environment from the available list of environments.
1. Select **Enable Managed Environments**.
1. Select **Enable**.

---

### Add an environment to the enterprise policy to encrypt data

> [!IMPORTANT]
> The environment is disabled when it's added to the enterprise policy for data encryption.

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Data and Privacy** under **Settings**.
1. Select **Customer-managed encryption key** to go to the Enterprise Policies page.
1. Select a policy and then select **Edit**.
1. Select **Add environments**, select the environment you want, and then select **Continue**.
1. Select **Save**, and then select **Confirm**.

##### [Classic admin center](#tab/classic)

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and go to **Policies** > **Enterprise policies**.
1. Select a policy, and then, on the command bar, select **Edit**.
1. Select **Add environments**, select the environment you want, and then select **Continue**.
   :::image type="content" source="media/cmk-add-environments-enterprise-policy.png" alt-text="Add environment to enterprise policy on Power Platform admin center":::
1. Select **Save**, and then select **Confirm**.

---

> [!IMPORTANT]
>
> - Only environments that are in the same region as the enterprise policy are displayed in the **Add environments** list.
> - The encryption can take up to four days to complete, but the environment might be enabled before the **Add environments** operation completes.
> - The operation might not complete and if it fails, your data continues to be encrypted with Microsoft managed key. You can rerun the **Add environments** operation again.

> [!NOTE]
> You can only add environments that are enabled as Managed Environments. Trial and Teams environment types can't be added to the enterprise policy.

### Remove environments from policy to return to Microsoft managed key

Follow these steps if you want to return to a Microsoft managed encryption key.

> [!IMPORTANT]
> The environment is disabled when it's removed from the enterprise policy to return data encryption using the Microsoft managed key.

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Data and Privacy** under **Settings**.
1. Select **Customer-managed encryption key** to go to the Enterprise Policies page.
1. 
1. 
1. Select **Remove environment** on the command bar, select the environment you want to remove, and then select **Continue**.
1. Select **Save**.

##### [Classic admin center](#tab/classic)

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and go to **Policies** > **Enterprise policies**.
1. Select the **Environment with policies** tab, and then find the environment you want to remove from customer-managed key.
1. Select the **All policies** tab, select the environment you verified in step 2, and then select **Edit policy** on the command bar.
   :::image type="content" source="media/cmk-ppac-remove-env-policy.png" alt-text="Remove an environment from customer-managed key":::
1. Select **Remove environment** on the command bar, select the environment you want to remove, and then select **Continue**.
1. Select **Save**.

---

> [!IMPORTANT]
> The environment is disabled when it's removed from the enterprise policy to revert the data encryption to the Microsoft-managed key. **Do not delete or disable the key, delete or disable the key vault, or remove the enterprise policy's permissions to the key vault.** The key and key vault's access is necessary to support database restoration. You may delete and remove the enterprise policy's permissions after 30 days.

### Review the environment's encryption status

#### Review the encryption status from Enterprise policies

###### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Data and Privacy** under **Settings**.
1. Select **Customer-managed encryption key** to go to the Enterprise Policies page.
1. Select a policy, and then on the command bar, select **Edit**.
1. Review the environment's **Encryption status** in the **Environments with this policy** section.

###### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Policies** > **Enterprise policies**.
1. Select a policy, and then on the command bar, select **Edit**.
1. Review the environment's **Encryption status** in the **Environments with this policy** section.

---

   > [!NOTE]
   > The environment's encryption status can be:
   >
   > - **Encrypted** - The Enterprise policy encryption key is active and the environment is encrypted with your key.
   > - **Failed** - The Enterprise policy encryption key is not used by **all** Dataverse storage services. They require more time to process and you can re-run the **Add environment** operation. Contact Support if the re-run fails.
   >
   >      A **Failed** encryption status doesn't impact your environment data and its operations. This means that some of the Dataverse storage services are encrypting your data with your key and some continue to use the Microsoft-managed key. A revert isn't recommended as when you re-run the **Add environment** operation, the service resumes from where it left off.
   >
   > - **Warning** - The Enterprise policy encryption key is active and one of the service's data continues to be encrypted with the Microsoft-managed key. Learn more: [Power Automate CMK application warning messages](/power-automate/customer-managed-keys#power-automate-cmk-application-warning-messages)
   >

#### Review the encryption status from the Environment History page

You can see the [environment history](environments-overview.md#environment-history).

###### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**, and then seleect an environment from the available list of environments.
1. On the command bar, select **History.**
1. Locate the history for **Update Customer Managed Key**.

###### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane, and then select an environment from the list.
1. On the command bar, select **History.**
1. Locate the history for **Update Customer Managed Key**.

---

   > [!NOTE]
   > The **Status** shows **Running** when the encryption is in progress. It shows **Succeeded** when the encryption is complete. The status shows **Failed** when there's some problem with one of the services not able to apply the encryption key.
   >
   > A **Failed** state can be a **warning** and you don't need to re-run the **Add environment** option. You can confirm if it's a [warning](customer-managed-key.md#review-the-encryption-status-from-enterprise-policies).

### Change the environment's encryption key with a new enterprise policy and key

To change your encryption key, create a new key and a new enterprise policy. You can then change the enterprise policy by removing the environments and then adding the environments to the new enterprise policy. The system is down two times when changing to a new enterprise policy - 1) to revert the encryption to Microsoft Managed key and 2) to apply the new enterprise policy.

 > [!Tip]
 > To rotate the encryption key, we recommend using the Key vaults' [**New version** or setting a **Rotation policy**](customer-managed-key.md#rotate-the-environments-encryption-key-with-a-new-key-version).

##### [New admin center](#tab/new)

1. In [Azure portal](https://ms.portal.azure.com/), create a new key and a new enterprise policy. More information:  [Create encryption key and grant access](#create-encryption-key-and-grant-access) and [Create an enterprise policy](#create-enterprise-policy)
2. Grant the new enterprise policy [access to the old key](customer-managed-key.md#grant-enterprise-policy-permissions-to-access-key-vault).
3. After the new key and enterprise policy are created, Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
4. In the navigation pane, select **Security**.
5. In the **Security** pane, select **Data and Privacy** under **Settings**.
6. Select **Customer-managed encryption key** to go to the Enterprise Policies page.
7. Select the **Environment with policies** tab, and then find the environment you want to remove from customer-managed key.
8. Select the **All policies** tab, select the environment you verified in step 2, and then select **Edit policy** on the command bar.
   <image>
9. Select **Remove environment** on the command bar, select the environment you want to remove, and then select **Continue**.
10. Select **Save**.
11. Repeat steps 2-10 until all environments in the enterprise policy have been removed.

  > [!IMPORTANT]
  > The environment is disabled when it's removed from the enterprise policy to revert the data encryption to the Microsoft-managed key. **Do not delete or disable the key, delete or disable the key vault, or remove the enterprise policy's permissions to the key vault**. **Grant the new enterprise policy to the old key vault**. The key and key vault's access is necessary to support database restoration. You may delete and remove the enterprise policy's permissions after 30 days.

12. After all the environments are removed, from the Power Platform admin center, go to the Enterprise Policies page.
13. Select the new enterprise policy, and then select **Edit policy**.
14. Select **Add environment**, select the environments that you want to add, and then select **Continue**.

##### [Classic admin center](#tab/classic)

1. In [Azure portal](https://ms.portal.azure.com/), create a new key and a new enterprise policy. More information:  [Create encryption key and grant access](#create-encryption-key-and-grant-access) and [Create an enterprise policy](#create-enterprise-policy)
2. Grant the new enterprise policy [access to the old key](customer-managed-key.md#grant-enterprise-policy-permissions-to-access-key-vault).
3. After the new key and enterprise policy are created, go to **Policies** > **Enterprise policies**.
4. Select the **Environment with policies** tab, and then find the environment you want to remove from customer-managed key.
5. Select the **All policies** tab, select the environment you verified in step 2, and then select **Edit policy** on the command bar.
   :::image type="content" source="media/cmk-ppac-remove-env-policy.png" alt-text="Remove an environment from customer-managed key":::
6. Select **Remove environment** on the command bar, select the environment you want to remove, and then select **Continue**.
7. Select **Save**.
8. Repeat steps 2-7 until all environments in the enterprise policy have been removed.

  > [!IMPORTANT]
  > The environment is disabled when it's removed from the enterprise policy to revert the data encryption to the Microsoft-managed key. **Do not delete or disable the key, delete or disable the key vault, or remove the enterprise policy's permissions to the key vault**. **Grant the new enterprise policy to the old key vault**. The key and key vault's access is necessary to support database restoration. You may delete and remove the enterprise policy's permissions after 30 days.

9. After all the environments are removed, from the Power Platform admin center, go to **Enterprise policies**.
10. Select the new enterprise policy, and then select **Edit policy**.
11. Select **Add environment**, select the environments that you want to add, and then select **Continue**.

---

> [!IMPORTANT]
> The environment is disabled when it's added to the new enterprise policy.

### Rotate the environment's encryption key with a new key version

You can change the environment’s encryption key by creating a new key version. When you create a new key version, the new key version is automatically enabled. All the storage resources detect the new key version and start applying it to encrypt your data.

When you modify the key or the key version, the protection of the root encryption key changes, but the data in the storage always remains encrypted with your key. There's no more action required on your part to ensure that your data is protected. Rotating the key version doesn't impact performance. There's no downtime associated with rotating the key version. It can take 24 hours for all the resource providers to apply the new key version in the background. The previous key version **must not be disabled** as it's required for the service to use it for the re-encryption and for the support of database restoration.

To rotate the encryption key by creating a new key version, use the following steps.

1. Go to the [Azure portal](https://ms.portal.azure.com/) > **Key Vaults** and locate the key vault where you want to create a new key version.
1. Navigate to **Keys**.
1. Select the current, enabled key.
1. Select **+ New Version**.
1. The **Enabled** setting defaults to **Yes**, which means that the new key version is automatically enabled upon creation.
1. Select **Create**.

> [!TIP]
> To comply with your key rotation policy, you can rotate the encryption key using the [Rotation policy](/azure/key-vault/keys/how-to-configure-key-rotation#key-rotation-policy). You can either configure a rotation policy or rotate, on demand, by invoking [Rotate now](/azure/key-vault/keys/how-to-configure-key-rotation#rotation-on-demand).

> [!IMPORTANT]
> The new key version is automatically rotated in the background and there's no action required by the Power Platform admin. It's important that the previous key version must not be disabled or deleted for, at least, 28 days to support database restoration. Disabling or deleting the previous key version too early can take your environment offline.

### View the list of encrypted environments

##### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Data and Privacy** under **Settings**.
1. Select **Customer-managed encryption key** to go to the Enterprise Policies page.
1. On the **Enterprise policies** page, select the **Environments with policies** tab. The list of environments that were added to enterprise policies are displayed.

##### [Classic admin center](#tab/classic)

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and go to **Policies** > **Enterprise policies**.
1. On the **Enterprise policies** page, select the **Environments with policies** tab. The list of environments that were added to enterprise policies are displayed.

---

> [!NOTE]
> There might be situations where the **Environment status** or the **Encryption status** show a **Failed** status. When this occurs, you can try rerunning the **Add environment** operation or submit a Microsoft Support request for help.

## Environment database operations

A customer tenant can have environments that are encrypted using the Microsoft managed key and environments that are encrypted with the customer managed key. To maintain data integrity and data protection, the following controls are available when managing environment database operations.

- [Restore](backup-restore-environments.md)
   The environment to overwrite (the restored to environment) is restricted to the same environment that the backup was taken from or to another environment that is encrypted with the same customer managed key.

   > [!div class="mx-imgBorder"]
   > ![Restore backup.](media/cmk-restore-backup.png "Restore backup")

- [Copy](copy-environment.md)
   The environment to overwrite (the copied to environment) is restricted to another environment that is encrypted with the same customer managed key.

   > [!div class="mx-imgBorder"]
   > ![Copy environment.](media/cmk-copy-environment.png "Copy environment")

   > [!NOTE]
   > If a Support Investigation environment was created to resolve support issue in a customer managed environment, the encryption key for the Support Investigation environment must be changed to customer managed key before the Copy environment operation can be performed.

- [Reset](sandbox-environments.md#reset-a-sandbox-environment)
   The environment's encrypted data is deleted including backups. After the environment is reset, the environment encryption will revert back to the Microsoft managed key.

## Next steps

[About Azure Key Vault](/azure/key-vault/general/overview)
