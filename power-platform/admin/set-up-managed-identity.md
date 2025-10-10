---
title: Set up managed identity for Power Platform - Dataverse plug-ins
description: Learn how to set up Power Platform managed identity for Dataverse plug-ins.
author: abhijananddv
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/10/2025
ms.subservice: admin
ms.author: abhijanand
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
---

# Set up managed identity for Power Platform - Dataverse plug-ins

Power Platform managed identity allows Dataverse plug-ins to connect with Azure resources to support managed identity without the need of credentials. This article helps you set up managed identity in your Power Platform environments.


## Prerequisites

- An Azure subscription with access to provision user-assigned managed identity (UAMI) or application registration.
- Plug-ins tools:
  - Integrated Development Environment (IDE), like Visual Studio, to build plug-in
  - [Plug-in registration tool](/power-apps/developer/data-platform/download-tools-nuget)
  - [SignTool.exe (Sign Tool)](/dotnet/framework/tools/signtool-exe) to sign the plug-in assembly
  - [Power Platform CLI](../developer/cli/introduction.md)
- A valid certificate to sign the plug-in **assembly**.


## Set up managed identity

To configure Power Platform managed identity for Dataverse plug-ins, complete the following steps.

1. Create a new app registration or user-assigned managed identity.
2. Configure federated identity credentials.
3. Create and register Dataverse plug-ins.  
   Be sure to build the plug-in assembly and register the plug-in.
4. Create a managed identity record in Dataverse.
5. Grant access to the Azure resources to the application or user-assigned managed identity (UAMI).
6. Validate the plug-in integration.

## Create a new app registration or user-assigned managed identity

You can create either user-assigned managed identity or an application in Microsoft Entra ID based on the following scenarios.

- If you want to have app identity associated with the plug-in that connects to the Azure resources, such as Azure Key Vault, use [application registration](/entra/identity-platform/howto-create-service-principal-portal). With app identity, you can apply Azure policies on the plug-in accessing Azure resources.
- If you want to have a service principal to access the Azure resources, such as Azure Key Vault, you can provision [user-assigned managed identity](/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities?pivots=identity-mi-methods-azp#create-a-user-assigned-managed-identity).

> [!NOTE]
> Be sure to capture the following IDs, as you'll use them in later steps.  
> - Application (client) ID  
> - Tenant ID

## Configure federated identity credentials

To configure managed identity, open the user-assigned managed identity or Microsoft Entra ID application in the Azure portal that you created in the previous section.

1. Go to the [Azure portal](https://portal.azure.com/).
2. Navigate to **Microsoft Entra ID**.
3. Select **App registrations**.
4. Open the app you created in [Set up managed identity](#set-up-managed-identity).
5. Navigate to **Certificates & secrets**.
6. Select the **Federated credentials** tab and select **Add credential**.
7. Select issuer as **Other issuer**.
8. Enter the following information:

**Issuer**  
Use the tenant’s v2.0 issuer:
```
https://login.microsoftonline.com/{tenantID}/v2.0
```
**Example**
```
https://login.microsoftonline.com/5f8a1a9f-2e1a-415f-b10c-84c3736a21b9/v2.0
```

**Type**  
Choose **Explicit subject identifier**.

**Subject identifier**  
Choose the format that matches your certificate type:

- **Self-signed certificate (development only):**
  ```
  /eid1/c/pub/t/{encodedTenantId}/a/qzXoWDkuqUa3l6zM5mM0Rw/n/plugin/e/{environmentId}/h/{hash}
  ```

- **Trusted issuer certificate (recommended for production):**
  ```
  /eid1/c/pub/t/{encodedTenantId}/a/qzXoWDkuqUa3l6zM5mM0Rw/n/plugin/e/{environmentId}/i/{issuer}/s/{certificateSubject}
  ```

**Segment reference**

- `eid1` – identity format version  
- `c/pub` – cloud code for public cloud, Government Community Cloud (GCC), and first release station in GCC
- `t/{encodedTenantId}` – tenant ID    
- `n/plugin` – plug-in component  
- `e/{environmentId}` – environment ID  
- `h/{hash}` – SHA‑256 of certificate (self-signed only)  
- `i/{issuer}`, `s/{certificateSubject}` – trusted-issuer details

> [!NOTE]
> **Encoding for `{encodedTenantId}`**  
> 1. Convert **GUID → Hex**.  
> 2. Convert **Hex → Base64URL** (not standard Base64).  
>
> **Self-signed hash**  
> - Compute **SHA‑256** over the **.cer**. If you have a **.pfx**, export a **.cer** first:
>   ```powershell
>   CertUtil -hashfile <CertificateFilePath> SHA256
>
>   $cert = Get-PfxCertificate -FilePath "path	o\your.pfx"
>   $cert.RawData | Set-Content -Encoding Byte -Path "extracted.cer"
>   ```

### Specialized Azure cloud environments

Set **Audience**, **Issuer URL**, and **Subject prefix** explicitly when deploying outside public cloud, GCC, and first release station in GCC:

| Cloud | Audience | Issuer URL | Subject prefix |
| --- | --- | --- | --- |
| GCC High & DoD | `api://AzureADTokenExchangeUSGov` | `https://login.microsoftonline.us` | `/eid1/c/usg` |
| Mooncake (China) | `api://AzureADTokenExchangeChina` | `https://login.partner.microsoftonline.cn` | `/eid1/c/chn` |
| US National (USNAT) | `api://AzureADTokenExchangeUSNat` | `https://login.microsoftonline.eaglex.ic.gov` | `/eid1/c/uss` |
| US Secure (USSec) | `api://AzureADTokenExchangeUSSec` | `https://login.microsoftonline.scloud` | `/eid1/c/usn` |

> [!NOTE]
> The **Audience** value is **case-sensitive** and must match exactly.  
> For public cloud, GCC, and first release station in GCC (and other non‑listed clouds), defaults are:  
> Audience `api://AzureADTokenExchange`, Issuer `https://login.microsoftonline.com`, Subject prefix `/eid1/c/pub`.

## Create and register Dataverse plug-ins

### Dataverse plug-ins

#### Build plug-in assembly

- [Create a plug-in](/power-apps/developer/data-platform/write-plug-in?tabs=pluginbase) using Visual Studio. While building the plug-in, use the tenant ID from [Create a new app registration or user-assigned managed identity](#create-a-new-app-registration-or-user-assigned-managed-identity) and scopes as organization URL like `https://{OrgName}.crm*.dynamics.com/.default` or even more granular scopes.
- Use [IManagedIdentityService](/dotnet/api/microsoft.xrm.sdk.imanagedidentityservice?view=dataverse-sdk-latest&preserve-view=true) and acquire a token method to request a token with given scope.  
  Method signature:
  ```csharp
  string AcquireToken(IEnumerable<string> scopes);
  ```
- Sign the assembly with a certificate. For more information, see [SignTool.exe (Sign Tool)](/dotnet/framework/tools/signtool-exe).

> [!NOTE]
> A self-signed certificate should be used only for testing. It's not a supported option for use in production scenarios.

#### Register the plug-in

- Install the plug-in registration tool if you don’t have it on your machine already. For more information, see [Dataverse development tools](/power-apps/developer/data-platform/download-tools-nuget).
- Register the plug-in. For more information, see [Register plug-in](/power-apps/developer/data-platform/tutorial-write-plug-in#register-plug-in).

## Create managed identity record in Dataverse

To provision managed identity record in Dataverse, complete the following steps.

1. Make a POST call using a REST client (for example, Insomnia, Postman). Use a URL with payload in the following format.
  
   ```
   POST https://<<orgURL>>/api/data/v9.0/managedidentities
   ```
   Be sure to replace **orgURL** with the URL of the organization.
   
2. Ensure that **credentialsource** is set to **2** in the payload, **subjectscope** is set to **1** for environment-specific scenarios, and **version** is set to 1 in the payload.

   **Sample payload**
   ```json
   {
     "applicationid": "<<appId>>",
     "managedidentityid": "<<anyGuid>>",
     "credentialsource": 2,
     "subjectscope": 1,
     "tenantid": "<<tenantId>>"
     "version": 1
   }
   ```

3. Make a PATCH call to bind the plug-in assembly ID with the managed identity record that's created through the POST call in step 1.

   **Plug-in assembly**  
   ```
   PATCH https://<<orgURL>>/api/data/v9.0/pluginassemblies(<<PluginAssemblyId>>)
   ```

   **Sample payload**
   ```json
   {
     "managedidentityid@odata.bind": "/managedidentities(<<ManagedIdentityGuid>>)"
   }
   ```

   Be sure to replace **orgURL**, **PluginAssemblyId**, and **ManagedIdentityGuid** with your values.

## Grant access to the Azure resources to application or user-assigned managed identity

If you need to give access to an application ID to access Azure resources, such as Azure Key Vault, grant access to the application or user-assigned managed identity to that resource.

## Validate the plug-in integration

Verify that your plug-in can securely request access to Azure resources that support managed identity, eliminating the need for separate credentials.

## Frequently asked questions (FAQs)

### How do I resolve the this error?
If you receive the following error:
   **Getting Error – A configuration issue is preventing authentication.**  
   **AADSTS700213: No matching federated identity record found** 
Complete the following steps:
   1. Ensure the FIC is correctly configured and saved.  
   1. Verify that the issuer/subject matches the format specified above.

      You can also find the expected format in the error stack.

## How do I resolve the "Unable to reach or connect to Power Platform" error?
Please refer to [Power Platform URLs and IP address ranges](online-requirements.md) to ensure Power Platform endpoints are reachable and allowlisted.
