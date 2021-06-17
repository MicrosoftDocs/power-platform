---
title: Preview: Hybrid Modern Authentication for Exchange on-premises | Microsoft Docs
description: Learn about connecting mailboxes hosted on Exchange on-premises Hybrid Modern Authentication to Dynamics 365.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/17/2021
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Preview: Hybrid Modern Authentication (HMA) for Exchange on-premises

Dynamics 365 can now connect to mailboxes hosted on Exchange on-premises using Hybrid Modern Authentication (HMA). Server-side synchronization will authenticate against Azure Active Directory (Azure AD) using a certificate you provide and stored securely in Azure Key Vault. You will need to establish an application registration secured by a client secret to enable Dynamics 365 to access to the certificate in Key Vault. Once Dynamics 365 is able to retrieve the certificate, the certificate will be then used to authenticate as a specific app and access the Exchange on-premises resource. 

## Supported Exchange versions

HMA will only be available from Microsoft Exchange 2013 (CU19+) or Microsoft Exchange 2016 (CU8+). See [Announcing Hybrid Modern Authentication for Exchange On-Premises](https://techcommunity.microsoft.com/t5/exchange-team-blog/announcing-hybrid-modern-authentication-for-exchange-on-premises/ba-p/607476).

## Prerequisites

To deploy HMA with Dynamics 365, you'll need to meet the following requirements.

### HMA must be enabled on Exchange using Azure AD pass through

Review the following documents:

- [Exchange Server hybrid deployments](https://docs.microsoft.com/exchange/exchange-hybrid)
- [Hybrid Configuration wizard](https://docs.microsoft.com/exchange/hybrid-configuration-wizard)
- [What is Azure AD Connect?](https://docs.microsoft.com/azure/active-directory/hybrid/whatis-azure-ad-connect)
- [Deploy Azure AD Pass-through Authentication](https://docs.microsoft.com/azure/active-directory/hybrid/how-to-connect-pta-quick-start)
- [Enabling Hybrid Modern Authentication](https://docs.microsoft.com/microsoft-365/enterprise/configure-exchange-server-for-hybrid-modern-authentication?view=o365-worldwide)
 
### A certificate is required for this authentication scheme 

You must provide a valid certificate to configure server-side sync for HMA. It can be generated directly in Key Vault or through your company's process for generating and uploading a certificate to Key Vault.

### You need a Key Vault location 

You need a Key Vault location where the certificate can be stored securely. You will also need to configure App Registration with AppId and ClientSecret to allow Dynamics 365 access to the certificate. See [Key Vault](https://azure.microsoft.com/services/key-vault/).

## Configuration 

Follow the steps below to configure HMA for Exchange on-premises.

### 1. Make a certificate available on Key Vault

1. In the [Azure portal](https://portal.azure.com/), open Key Vault and go to the **Certificates** section. 

2. Select **Generate/Import**.

   :::image type="content" source="media/azure-key-vault-generate-import.png" alt-text="Select Generate/Import":::

3. At this point, a certificate can be either generated or imported. Specify a certificate name and then select **Create**. 

The certificate name will be used later to reference the certificate. For these steps, the certificate will be named “HMA-Cert”. 

### 2. Create a new App Registration for Key Vault access 

Create a new app registration in the Azure portal in the tenant where the Key Vault resides. For these steps, the app will be named “KV-App” during the configuration process. See [Quickstart: Register an application with the Microsoft identity platform](https://docs.microsoft.com/azure/active-directory/develop/quickstart-register-app).

### 3. Add a client secret for KV-App 

The client secret will be used by Dynamics 365 to authenticate the app and retrieve the certificate. See [Add a client secret](https://docs.microsoft.com/azure/active-directory/develop/quickstart-register-app#add-a-client-secret). 

### 4. Add KV-App to the Key Vault access policies 

1. In the [Azure portal](https://portal.azure.com/), open **Key Vault** and go to the **Access policies** section. 

2. Select **Add Access Policy**.

   :::image type="content" source="media/azure-key-vault-access-policies2.png" alt-text="Azure Key Vault add access policy":::

3. For **Select principal**, select a principal. For these steps, we'll select “KV-App”. 

4. Select permissions. Be sure to add **Get permission** under **Secret permissions** and **Certificate permissions**.  Both are required for the KV-App to be able to access the certificate. Then, select **Add**.

   :::image type="content" source="media/azure-key-vault-add-access-policy.png" alt-text="Azure Key Vault set permissions for access policy":::

## Create a new app registration for HMA access 

Create a new app registration in the Azure portal in the tenant where Microsoft Exchange is hybridized. 

For these steps, the app will be named “HMA-App” during this configuration process and will represent the actual app which Dynamics 365 will use to interact with Exchange on-premises resources. See [Quickstart: Register an application with the Microsoft identity platform](https://docs.microsoft.com/azure/active-directory/develop/quickstart-register-app).

## Add the certificate for the HMA-App 

This will be used by Dynamics 365 to authenticate the HMA-App. HMA only supports certificate usage to authenticate an app, therefore, a certificate is needed for this authentication scheme. 

Add the HMA-Cert previously provisioned in Key Vault. See [Add a certificate](https://docs.microsoft.com/azure/active-directory/develop/quickstart-register-app#add-a-certificate).

## Add API permission 

In order to allow HMA-App to have access to Exchange on-premises, grant the “Office 365 Exchange Online” API permission.

1. In the [Azure portal](https://portal.azure.com/), open **App registrations** and select **HMA-App**. 

2. Select **API Permissions** > **Add a permission**.

   :::image type="content" source="media/azure-key-vault-api-permissions.png" alt-text="Add API permissions to app":::

3. Select **APIs my organization uses**.

4. Type: **Office 365 Exchange Online** and select it.

5. Select **Application permissions**.

8. Check **full_access_as_app** to allow the app to have full access to all the mailboxes. Then, select **Add permissions**.

   :::image type="content" source="media/azure-key-vault-api-permissions-full-access.png" alt-text="Assign full access API permissions to app":::

> [!NOTE]
> If having an app with full access on all mailboxes doesn’t not align with your business requirements, the Exchange on-premises admin can scope the mailboxes the app can access configuring the *ApplicationImpersonation* role on Exchange. See [Configure impersonation](https://docs.microsoft.com/exchange/client-developer/exchange-web-services/how-to-configure-impersonation).

9. Select **Grant Admin consent**.

   :::image type="content" source="media/azure-key-vault-api-permissions-grant-admin-access.png" alt-text="Grant admin access to API permission for app":::

Now let’s collect all the information required from the Azure Portal before configuring the email server profile on Dynamics 365: 

- EWS URL: The Exchange WebServices endpoint where the Exchange on-premises is located which must be publicly accessible from Dynamics 365. 
- AAD resource Id: This is the Azure resource id for which the HMA app will request access to. It is usually the host part of the EWS endpoint URL. 
- TenantId: This is the tenantId of the tenant where the Exchange on-premises is configured with AAD passthrough authentication. 
- HMA Application Id: App id for the HMA-App. Can be found on the main page for the Application registration of HMA-App 
- Key Vault Uri: This is URI of the Azure Key Vault used for certificate storage. 
- Key Vault KeyName: This is the certificate name used in Key Vault. 
- KeyVault Application Id: This is the appId of the KV-App used by Dynamics to retrieve the certificate from Key Vault.
- KeyVault Client Secret: This it the client secret for the KV-App used by Dynamics 365. 

## Dynamics 365 Configuration 

Create a new Exchange on-premises email server profile using “Exchange Hybrid Modern Auth (HMA)" authentication. 

> [!NOTE]
> This feature is not available for legacy web client and is only available in the Power Platform admin center under emailServerProfiles in private preview. 

1. In the Microsoft Power Platform admin center, select an environment. 

2. Select **Settings** > **Email** > **Server profiles**.  

3. Select **New server profile**.

4. Fill in the required fields, and then select **Save**.  

## Configure a mailbox 

Now that the email server profile is configured, you can configure a mailbox. See [Configure mailboxes](https://docs.microsoft.com/en-us/power-platform/admin/connect-exchange-server-on-premises#configure-mailboxes).



