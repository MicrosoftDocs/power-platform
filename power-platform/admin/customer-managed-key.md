---
title: Manage your encryption key in Power Platform
description: Learn how to manage your encryption key. 
author: paulliew
ms.author: paulliew
ms.reviewer: matp
ms.service: powerapps
ms.topic: how-to
ms.date: 01/25/2023
ms.custom: template-how-to
---
# Manage your encryption key (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Customers have data privacy and compliance requirements to secure their data by encrypting their data at-rest. This secures the data from being exposed in an event where a copy of the database is stolen. With data encryption at-rest, the stolen database data is protected from being restored to a different server without the encryption key. 

All customer data stored in Power Platform is encrypted at-rest with strong Microsoft-managed encryption keys by default. However, we provide customer-managed encryption key for added data protection control so customer can manage their own encryption keys. When customer-managed key is used, all customer data is encrypted with a user-provided key from your own Azure Key Vault. This allows you to rotate or swap the encryption key on demand, and also allows you to prevent Microsoft's access to your customer data when you revoke the key access to our services at any time.

> [!IMPORTANT]
> This is a preview feature.
> 
> These encryption key operations are available with this release:
> 1.	Create a RSA key from your Azure Key vault.
> 1.	Create a Power Platform Enterprise Policy (EP) for your key.
> 1.	Grant the Power Platform EP permission to access your key vault.
> 1.	Grant the Power Platform service admin to read the EP.
> 1.	Apply encryption key to your environment.
> 1.	Revert/remove environment’s CMK encryption to Microsoft-managed key.
> 1.	Change key by creating a new EP, removing the environment from CMK and re-apply CMK with new EP.
> 1.	Lock CMK environments by revoking CMK key vault and/or key permissions.
> 1.	Migrate Bring-your-own-key (BYOK) environments to CMK by applying CMK key.

>
> This feature is gradually being rolled out following this deployment schedule:
>
> |Region station  |Est. public preview availability  |Regions in station  |
> |---------|---------|---------|
> |1 & 2     | March 1, 2023        | Canada, France, Germany, India, Norway, South Africa, South America, South Korea, Switzerland, Australia        |
> |3 & 4     |  May 2023       |  United Arab Emirates, Japan, Asia-Pacific, Great Britain, Oceania, Asia Pacific, Europe       |
> |5     | September 2023     |  North America       |

The following services support using customer-managed key:
>
>1. Dataverse (In-house/Custom solutions and Microsoft 1st party services) 
>1. Chat for Dynamics 365
>1. Dynamics 365 Sales
>1. Dynamics 365 Customer Service
>1. Dynamics 365 Customer Insights
>1. Dynamics 365 Omnichannel
>1. Dynamics 365 Commerce (FnO)
>1. Dynamics 365 Field Service
>1. Dynamics 365 Retail
>1. Dynamics 365 Finance (FnO)
>1. Dynamics 365 Intelligent Order Management (FnO)
>1. Dynamics 365 Project Operations (FnO)
>1. Dynamics 365 Supply Chain Management (FnO)
>1. Dynamics 365 Fraud Protection (FnO)
>
Environments with finance and operations apps where Power Platform integration is enabled can also be encrypted. Finance and operations environments without Power Platform integration will continue to use the default Microsoft managed key to encrypt data. More information: [Enable the Microsoft Power Platform integration](/dynamics365/fin-ops-core/dev-itpro/power-platform/enable-power-platform-integration)

:::image type="content" source="media/cmk-power-platform-diagram.png" alt-text="Customer managed encryption key in the Power Platform":::

## Azure Key Vault and Power Platform/Dynamics 365 service admin
To enable customer managed keys, first the key vault admin creates a key in their key vault and also creates a Power Platform enterprise Azure Policy. When the enterprise policy is created, a special Azure Active Directory (Azure AD) managed identity is created. Next, the key vault admin returns to the key vault and grants the enterprise policy/managed identity access to the encryption key.

The key vault admin then grants the Power Platform/Dynamics 365 service admin Read access to the enterprise policy. Once Read permission is granted, the Power Platform/Dynamics 365 service can go to the Power Platform Admin Center and add environment(s) to the enterprise policy. All added environment(s) customer data is then encrypted with the customer-managed key from the enterprise policy.

## Azure key vault admin tasks
### Prerequisites

- An Azure subscription that includes Azure Key Vault.
- Global tenant admin or an  Azure AD with contributor permission to the Azure AD subscription and permission to create a key vault and key. This is required to set up the key vault.

### Create the key and grant access

The key vault admin performs these steps in Azure:

1. Create an Azure paid subscription and key vault. Ignore this step if you already have a subscription that includes Azure Key Vault.
1. Go to the Azure Key Vault service, and create a key.
1. Enable the Power Platform enterprise policies service for your Azure subscription. Do this only once.
1. Create a Power Platform enterprise Azure Policy.
1. Grant enterprise policy permissions to access the key vault.
1. Grant Power Platform and Dynamics 365 admins permission to read the enterprise policy.

More information: [Azure Key Vault documentation](/azure/key-vault/general/)

## Power Platform/Dynamics 365 service admin Power Platform admin center tasks
### Prerequisite

- Power Platform admin must be assigned to either the Power Platform or Dynamics 365 Service admin AAD role

### Add environment

The Power Platform admin performs these steps in Power Platform admin center:

1. Add the Power Platform environments to the enterprise policy to encrypt data with the customer managed key.
1. Remove environments from enterprise policy to return encryption to Microsoft managed key.
1. Change the key by removing environments from the old enterprise policy and adding environments to a new enterprise policy.

## For customers using the previous key management solution

For customers using the previous [manage the encryption key](manage-encryption-key.md) (BYOK) feature, they can use this new customer-managed key to encrypt their  environments. You can add both type of environments:

- Add non-BYOK enabled environments – these are environments that you haven’t encrypted with your own key.
- Migrate BYOK enabled environments – these are environments that you have encrypted with your own key.

### Enterprise policy

You can create a new enterprise policy with a new key or use an existing enterprise policy. Follow the same steps as [Configure Power Platform environments](#configure-power-platform-environments) to add your non-BYOK enabled and BYOK enabled environments.

> [!IMPORTANT]
> - Environments are disabled during encryption key migration.
> - When BYOK enabled environments are migrated to this key management feature, the BYOK key in the Microsoft key vault is retained for at least 28 days so that support is available for restoring the environment.

If you have enabled audit and search in the BYOK environment and have uploaded files and created a data lake, all these storages will be automatically created and encrypted with the customer-managed encryption key.

Similarly, if you didn’t enable these audit or search functionalities and enabled them after your environment is encrypted with this feature, all these storages will be automatically created and encrypted with the encryption key.

## Create an Azure paid subscription and key vault

In Azure, perform the following steps:

1. Create a Pay-as-you-go or its equivalent Azure subscription. This step isn't needed if the tenant already has a subscription.
1. Create a resource group.
1. Create a key vault using the paid subscription with the resource group you created in the previous step. More information: [Create a key vault using Azure portal](/azure/key-vault/general/quick-create-portal)

> [!IMPORTANT]
> - To ensure that your environment is protected from accidental deletion of the encryption key, the key vault must have soft-delete and purge protection enabled. You won’t be able to encrypt your environment with your own key without enabling these settings. More information: [Azure Key Vault soft-delete overview](/azure/key-vault/general/soft-delete-overview)
> - During preview, your key vault must be accessible from an unrestricted internet connection. It can't be behind your firewall or vNet.

## Create a key in the key vault

1. Make sure you have the [prerequisites](#prerequisites).
1. Go to Azure portal > **Key Vault** and locate the key vault where you want to generate an encryption key.
1. Create or import a key. 
>  Key Type = **RSA** and RSA Key size = **2048**
>  
1. Verify Azure key vault settings:
   1. Access the key vault from Azure portal.
   1. Select **Properties** under **Settings**.
   1. Under **Soft-delete**, verify that it is set to **Soft delete has been enabled on this key vault** option.
   1. Under **Purge protection**, set or verify that **Enable purge protection (enforce a mandatory retention period for deleted vaults and vault objects)** is enabled.
   1. Select **Save**.

   :::image type="content" source="media/cmk-key-vault-purge-protect.png" alt-text="Enable purge protection on the key vault":::

## Enable the Power Platform enterprise policies service for your Azure subscription

In the Azure portal, register Power Platform as a resource provider (this only needed to be done once):

1. Go to **Subscription** > **Resource providers**.
1. Search for **Microsoft.PowerPlatform** and **Register** it.

## Enable Power Platform enterprise policies service

1. Azure CLI is required on your local machine. Download and install from https://aka.ms/InstallAzureCliWindows.
1. Run the downloaded Azure cli.MSI.
1. Download the ARMClient - [ARMClient/README.md projectkudu/ARMClient GitHub](https://github.com/projectkudu/ARMClient/blob/master/README.md).
1. Start PowerShell and run the ARMClient to sign into your Azure subscription.
   > [!NOTE]
   > Depending on where you are running the command from, you could either use armclient.login from PowerShell, or armclient.azlogin from Azure CLI.
1. Enable `enterprisePoliciesPreview` feature for your subscription. Replace {subscriptionId} with your *subscriptionId* number

   `PS C:\> ARMClient.exe POST https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Features/providers/Microsoft.PowerPlatform/features/enterprisePoliciesPreview/register?api-version=2014-08-01-preview`

## Create an enterprise policy

1. Install PowerShell MSI. More information: [Install PowerShell on Windows, Linux, and macOS](https://ms.portal.azure.com/#create/Microsoft.Template)
1. After the PowerShell MSI is installed, go back to [Deploy a custom template](https://ms.portal.azure.com/#create/Microsoft.Template) in Azure.
1. Select the **Build your own template in the editor** link.
1. Copy the json template into a text editor such as Notepad. More information: [Json template](#json-template)
1. Replace the values in the json template for: *EnterprisePolicyName*, *location where EnterprisePolicy needs to be created*, *keyVaultId*, *keyName*, and *keyVersion*. More information: [Field definitions for json template](#field-definitions-for-json-template)
1. Copy the updated template from your text editor to the **Edit template** of the **Custom deployment** in Azure and select **Save**.
   :::image type="content" source="media/cmk-keyvault-template.png" alt-text="Azure key vault template":::
1. Select a **Subscription** and **Resource group** where the enterprise policy is to be created.
1. Select **Review + create**, and then select **Create**.

A deployment is started. When it's done, the enterprise policy is created.

### Json template

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
                            "name": {keyName},
                            "version": {keyVersion}
                        }
                    }
                },
                "networkInjection": null
            }
        }
    ]
   }
```

### Field definitions for json template

- **name**. Name of the enterprise policy. This is the name of the policy that appears in Power Platform admin center.
- **location**. One of the following. This is the location of the enterprise policy and it must correspond with the Dataverse environment’s region:

  - `"unitedstates"`
  - `"southafrica"`
  - `"switzerland”`
  - `"germany"`
  - `"unitedarabemirates"`
  - `"france"`
  - `"uk”`
  - `"japan"`
  - `"india"`
  - `"canada"`
  - `"southamerica"`
  - `"europe"`
  - `"asia"`
  - `"australia"`
  - `"korea"`
  - `"norway"`
  - `"singapore"`
- **keyVaultId**, **keyName**, **keyVersion**: Copy these values from your key vault properties in the Azure portal.

## Grant enterprise policy permissions to access key vault

Once the enterprise policy is created, the key vault admin grants the enterprise policy’s managed identity to access the encryption key.

1. Sign into the [Azure portal](https://ms.portal.azure.com/) and go to the key vault.
1. Select the key vault where the key was assigned to the enterprise policy.
1. Select the **Access policies** tab.
1. Select **+ Add Access Policy**.
1. Under **Key Management Operations**, select the **Get** option, and under **Cryptographic Operations**, select the **Unwrap key**, and **Wrap key** options.
   :::image type="content" source="media/cmk-keyvault-access-policy.png" alt-text="Key vault add access policy":::
1. In the **Principal** panel, select the deployment enterprise policy name.
1. Select **Add**, to add the access policy, and then select **Save**.

## Grant the Power Platform admin to read enterprise policy

Admins who have Azure global, Dynamics 365, and Power Platform administration roles can access the Power Platform admin center to assign environments to the enterprise policy. To access the enterprise policies, the global admin with Azure key vault access is required to grant the **Reader** role to the Power Platform admin. Once the **Reader** role is granted, the Power Platform admins will be able to view the enterprise policies on the Power Platform admin center.  

> [!NOTE]
> Only the Power Platform and Dynamics 365 admins who are granted the reader role to the enterprise policy can add an environment to the policy. Other Power Platform or Dynamics 365 admins might be able to view the enterprise policy but they'll get an error when they try to **Add environment** to the policy.

### Grant reader role to a Power Platform admin

1. Sign into the [Azure portal](https://ms.portal.azure.com/).
1. Obtain the Power Platform or Dynamics 365 admin’s object ID. To do this:
   1. Go to the **Users** area in Azure.
   1. In the All users list, find the user with Power Platform or Dynamics 365 admin permissions using **Search**. 
   1. Open the user record, on the **Overview** tab copy the user’s **Object ID**. Paste this into a text editor such as NotePad for later.
1. Get the enterprise policy resource ID. To do this:
   1. Open Azure Resource Graph Explorer.
   1. Search for `microsoft.powerplatform/enterprisepolicies`, and then select the **microsoft.powerplatform/enterprisepolicies** resource.
   1. Select **Run Query**.
   1. Scroll to the right of the results page and select the **See details** link.
   1. On the **Details** page, copy the ID.
   1. Start the Cloud Shell, and run the following command replacing objId with the user’s object ID and the enterprise policy resource ID with the `enterprisepolicies` ID found in the previous steps:
    `New-AzRoleAssignment -ObjectId { objId} -RoleDefinitionName Reader -Scope {EP Resource Id}`

### Add environments to the enterprise policy

To do this task, you need the following permission:

- Azure AD active user who has the Power Platform and/or Dynamics 365 licenses.
- Azure AD user who has either a global tenant admin, Power Platform or Dynamics 365 service admin role.

The key vault admin notifies the Power Platform admin that an encryption key and an enterprise policy were created and provides the enterprise policy to the Power Platform admin. To enable the customer managed key, the Power Platform admin assigns their environments to the enterprise policy. Once the environment is assigned and saved, Dataverse initiates the encryption process to set all the environment data, and encrypt it with the customer managed key.

> [!IMPORTANT]
> The environment is disabled temporarily during this process and re-enabled to allow users to access while the encryption process continues. It can take up to 3 days to complete the encryption process.

## Add an environment to the enterprise policy to encrypt data

> [!IMPORTANT]
> The environment will be disabled when it is added to the enterprise policy for data encryption.

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and go to **Policies** > **Enterprise policies**.
1. Select a policy, and then on the command bar select **Edit**.
1. Select **Add environments**, select the environment you want, and then select **Continue**.
   :::image type="content" source="media/cmk-add-environments-enterprise-policy.png" alt-text="Add environment to enterprise policy on Power Platform admin center":::
1. Select **Save**, and then select **Confirm**.

## Remove environments from policy to return to Microsoft managed key

> [!IMPORTANT]
> The environment will be disabled when it is removed from the enterprise policy to return data encryption using the Microsoft managed key.

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com), and go to **Policies** > **Enterprise policies**.
1. Select the **Environment with policies** tab, and then find the environment you want to remove from customer managed key.
1. Select the **All policies** tab, select the environment you verified in step 2, and then select **Edit policy** on the command bar.
   :::image type="content" source="media/cmk-ppac-remove-env-policy.png" alt-text="Remove an environment from customer managed key":::
1. Select **Remove environment** on the command bar, select the environment you want to remove, and then select **Continue**.
1. Select **Save**.

## Change the key

To rotate your encryption key, create a new key and a new enterprise policy. You can then change the enterprise policy by removing the environments and then adding the environments to the new enterprise policy.

1. In [Azure portal](https://ms.portal.azure.com/), create a new key and a new enterprise policy. More information: [Create the key and grant access](#create-the-key-and-grant-access) and [Create an enterprise policy](#create-an-enterprise-policy)
1. Once the new key and enterprise policy are created, go to **Policies** > **Enterprise policies**.
1. Select the **Environment with policies** tab, and then find the environment you want to remove from customer managed key.
1. Select the **All policies** tab, select the environment you verified in step 2, and then select **Edit policy** on the command bar.
   :::image type="content" source="media/cmk-ppac-remove-env-policy.png" alt-text="Remove an environment from customer managed key":::
1. Select **Remove environment** on the command bar, select the environment you want to remove, and then select **Continue**.
1. Select **Save**.
1. Repeat steps 2-6 until all environments in the enterprise policy have been removed.

  > [!IMPORTANT]
  > The environment will be disabled when it is removed from the enterprise policy to revert the data encryption to Microsoft managed key.

1. Once all the environments are removed, from the Power Platform admin center go to **Enterprise policies**.
1. Select the new enterprise policy, and then select **Edit policy**.
1. Select **Add environment**, select the environments that you want to add, and then select **Continue**.

> [!IMPORTANT]
> The environment will be disabled when it's added to the new enterprise policy.

## Next steps

[About Azure Key Vault](/azure/key-vault/general/overview)
