---
title: Set up Power Platform managed identity for Dataverse plug-ins or plug-in packages
description: Learn how to set up Power Platform managed identity (version 2) for Dataverse plug-ins or plug-in packages.
author: apurvghai
ms.component: pa-admin
ms.topic: how-to
ms.date: 06/15/2026
ms.subservice: admin
ms.author: apurvgh
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
ms.custom: sfi-image-nochange
contributors:
  - abhijanand
  - sericks
---

# Set up Power Platform managed identity for Dataverse plug-ins or plug-in packages

When you use Power Platform managed identity, Dataverse plug-ins or plug-in packages can connect to Azure resources without managing credentials. This article describes the **recommended (version 2)** setup, which builds the federated identity credential (FIC) from a hash of the certificate's full Distinguished Name (DN).

> [!NOTE]
> Use Power Platform managed identity version 2 for all new and existing plug-ins. If you maintain a plug-in that still uses the version 1 (CN-based) format, see [Set up managed identity version 1](set-up-managed-identity-version-1.md). To move an existing plug-in to version 2, see [Upgrade to version 2](#upgrade-to-version-2).

## Why version 2

Version 2 produces a fixed-length, ASCII-only subject identifier, so it works with any certificate name. Version 1 fails on certain certificate names (CNs):

- **Non-ASCII characters** in the CN (for example, accented letters) → `AADSTS70050: The Federated Managed Identity path is not properly formatted`.
- **Commas** in the CN (for example, `CN=Contoso, Inc.`) → `AADSTS700213: No matching federated identity record found`.

## Prerequisites

- An Azure subscription with access to provision user-assigned managed identity (UAMI) or application registration.
- Tools for plug-ins or plug-in packages:
  - Integrated Development Environment (IDE), like Visual Studio, to build plug-in
  - [Plug-in registration tool](/power-apps/developer/data-platform/download-tools-nuget)
  - [SignTool.exe (Sign Tool)](/dotnet/framework/tools/signtool-exe) to sign the plug-in assembly
  - [Power Platform CLI](../developer/cli/introduction.md)
- A valid certificate to sign the plug-in **assembly**.

## Set up managed identity

1. Create a new app registration or user-assigned managed identity.
1. Build, sign, and register the plug-in.
1. Configure the federated identity credential.
1. Create the managed identity record in Dataverse.
1. Grant access to the Azure resource.
1. Validate the integration.

### Step 1: Create an app registration or user-assigned managed identity

Create either a user-assigned managed identity or an application in Microsoft Entra ID:

- For an app identity associated with the plug-in (so you can apply Azure policies), use [application registration](/entra/identity-platform/howto-create-service-principal-portal).
- For a service principal, provision a [user-assigned managed identity](/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities?pivots=identity-mi-methods-azp#create-a-user-assigned-managed-identity).

> [!NOTE]
> Capture the **Application (client) ID** and **Tenant ID** — you use them in later steps.

### Step 2: Build, sign, and register the plug-in

1. [Create a plug-in](/power-apps/developer/data-platform/write-plug-in?tabs=pluginbase) in Visual Studio. Use the tenant ID from step 1 and a scope like `https://{OrgName}.crm*.dynamics.com/.default`. Use [IManagedIdentityService](/dotnet/api/microsoft.xrm.sdk.imanagedidentityservice?view=dataverse-sdk-latest&preserve-view=true) to request a token:

   ```csharp
   string AcquireToken(IEnumerable<string> scopes);
   ```

1. Sign the plug-in with your certificate.

   Plug-in package (NuGet):

   ```PowerShell
   nuget sign YourPlugin.nupkg `
     -CertificatePath MyCert.pfx `
     -CertificatePassword "MyPassword" `
     -Timestamper http://timestamp.digicert.com
   ```

   Plug-in assembly (SignTool):

   ```PowerShell
   signtool sign /f MyCert.pfx /p MyPassword /t http://timestamp.digicert.com /fd SHA256 MyAssembly.dll
   ```

1. [Register the plug-in](/power-apps/developer/data-platform/tutorial-write-plug-in#register-plug-in) using the [plug-in registration tool](/power-apps/developer/data-platform/download-tools-nuget).

> [!NOTE]
> Use a self-signed certificate only for development or testing. Don't use self-signed certificates in production. To create one, see [Generate a self-signed certificate](#generate-a-self-signed-certificate).

### Step 3: Configure the federated identity credential

In the [Azure portal](https://portal.azure.com/), open your app or user-assigned managed identity (UAMI), go to **Certificates & secrets** > **Federated credentials** > **Add credential**, and select **Other issuer**. Then enter:

- **Issuer** — `https://login.microsoftonline.com/{tenantID}/v2.0`
- **Type** — **Explicit subject identifier**
- **Subject identifier** — use the format for your certificate type:

  - Trusted issuer certificate (production):

    ```
    /eid1/c/pub/t/{encodedTenantId}/a/qzXoWDkuqUa3l6zM5mM0Rw/n/plugin/e/{environmentId}/i/{issuerHash}/s/{subjectHash}
    ```

  - Self-signed certificate (development only):

    ```
    /eid1/c/pub/t/{encodedTenantId}/a/qzXoWDkuqUa3l6zM5mM0Rw/n/plugin/e/{environmentId}/h/{hash}
    ```

  **Segment reference**

  | Segment | Description |
  |---|---|
  | `eid1` | Identity format version |
  | `c/pub` | Cloud code for public cloud, GCC, and first release station in GCC |
  | `t/{encodedTenantId}` | Tenant ID. See [Get the encoded tenant ID](#get-the-encoded-tenant-id) |
  | `a/qzXoWDkuqUa3l6zM5mM0Rw/` | Internal use only. Don't modify |
  | `n/plugin` | Plug-in component |
  | `e/{environmentId}` | Environment ID |
  | `i/{issuerHash}` `s/{subjectHash}` | SHA-256 Base64URL hash of the full issuer/subject DN. See [Compute the issuer and subject hashes](#compute-the-issuer-and-subject-hashes) |
  | `h/{hash}` | SHA-256 of the certificate (self-signed only) |

#### Compute the issuer and subject hashes

Take the SHA-256 hash of the full issuer and subject DN strings as they appear on the certificate, and encode each as URL-safe Base64. Get the DN strings with:

```powershell
$cert = Get-PfxCertificate -FilePath "path\to\your.pfx"
Write-Host "Issuer:  $($cert.Issuer)"
Write-Host "Subject: $($cert.Subject)"
```

Compute the hashes (PowerShell):

```powershell
function Get-Sha256Base64Url {
    param([string]$InputString)
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($InputString)
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    $hash = $sha256.ComputeHash($bytes)
    $base64 = [Convert]::ToBase64String($hash)
    return $base64.Replace('+', '-').Replace('/', '_').TrimEnd('=')
}

$issuerHash = Get-Sha256Base64Url -InputString "<full issuer DN string>"
$subjectHash = Get-Sha256Base64Url -InputString "<full subject DN string>"
Write-Host "Issuer Hash:  $issuerHash"
Write-Host "Subject Hash: $subjectHash"
```

Or in C#:

```csharp
using System.Security.Cryptography;
using System.Text;

static string ComputeSha256Base64Url(string input)
{
    using var sha256 = SHA256.Create();
    byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(input));
    return Convert.ToBase64String(hashBytes)
        .Replace('+', '-')
        .Replace('/', '_')
        .TrimEnd('=');
}
```

The output is a 43-character string containing only `A-Z`, `a-z`, `0-9`, `-`, and `_`.

> [!IMPORTANT]
> Use the exact DN string the runtime uses (the .NET `X509Certificate2.Issuer` and `X509Certificate2.Subject` properties). A differently formatted DN won't match and fails with `AADSTS700213`.

> [!NOTE]
> For deployments outside public cloud, set cloud-specific values. See [Specialized Azure cloud environments](#specialized-azure-cloud-environments).

### Step 4: Create the managed identity record in Dataverse

Send an HTTP POST request by using a REST client. For version 2, set `version` to `2`.

```js
POST https://<<orgURL>>/api/data/v9.0/managedidentities
```

```json
{
  "applicationid": "<<appId>>",
  "managedidentityid": "<<anyGuid>>",
  "credentialsource": 2,
  "subjectscope": 1,
  "tenantid": "<<tenantId>>",
  "version": 2
}
```

Then, bind the plug-in assembly (or package) to the record:

```js
PATCH https://<<orgURL>>/api/data/v9.0/pluginassemblies(<<PluginAssemblyId>>)
```

```json
{
  "managedidentityid@odata.bind": "/managedidentities(<<ManagedIdentityGuid>>)"
}
```

For a plug-in package, use `pluginpackages(<<PluginPackageId>>)` instead.

### Step 5: Grant access to the Azure resource

Grant the application or user-assigned managed identity access to the Azure resource it needs, such as Azure Key Vault.

### Step 6: Validate the integration

Trigger the plug-in and confirm it acquires a token and reaches the Azure resource without separate credentials.

## Upgrade to version 2

If you have a plug-in on version 0 or version 1, you can move it to version 2 without rebuilding or re-registering the plug-in.

### Option 1: Power Platform CLI

> [!NOTE]
> The CLI managed identity verbs don't work on Linux-based operating systems or with user-assigned managed identity (UAMI). If the CLI doesn't work for your certificate, use [Option 2: Manual](#option-2-manual).

1. Install **Power Platform CLI version 2.8.1 or later**. See [Install Microsoft Power Platform CLI](/power-platform/developer/cli/introduction?tabs=windows).
1. Create an authentication profile: `pac auth create`
1. Check the current version: `pac managed-identity show-fic --environment <orgUrl> --component-type PluginAssembly --component-id <pluginAssemblyId> --version 2`
1. Upgrade: `pac managed-identity upgrade-version --environment <orgUrl> --component-type PluginAssembly --component-id <pluginAssemblyId> --target-version 2 --confirm`
1. Trigger the plug-in to validate.

### Option 2: Manual

1. Compute the version 2 issuer and subject hashes. See [Compute the issuer and subject hashes](#compute-the-issuer-and-subject-hashes).
1. Add a new FIC with the version 2 subject identifier format (Step 3).
1. Update the managed identity record to version 2:

   ```js
   PATCH https://<<orgURL>>/api/data/v9.0/managedidentities(<<ManagedIdentityId>>)
   ```

   ```json
   { "version": 2 }
   ```

1. Trigger the plug-in and verify token acquisition succeeds.
1. Remove the old version 1 FIC.

> [!NOTE]
> Version 0 is deprecated. CLI support for generating the version 2 FIC is in progress.

## Reference

### Get the encoded tenant ID

The encoded tenant ID is the tenant GUID converted to bytes and encoded as **Base64URL** (not standard Base64):

```powershell
$tenantId = "<your-tenant-guid>"
$tenantGuid = [System.Guid]::Parse($tenantId)
$tenantBytes = $tenantGuid.ToByteArray()
$base64 = [System.Convert]::ToBase64String($tenantBytes)
$encodedTenantId = $base64.Replace('+', '-').Replace('/', '_').TrimEnd('=')
$encodedTenantId
```

### Generate a self-signed certificate

For development or testing only:

```PowerShell
$params = @{
    Type = 'Custom'
    Subject = 'E=admin@contoso.com,CN=Contoso'
    TextExtension = @(
        '2.5.29.37={text}1.3.6.1.5.5.7.3.4',
        '2.5.29.17={text}email=admin@contoso.com' )
    KeyAlgorithm = 'RSA'
    KeyLength = 2048
    SmimeCapabilities = $true
    CertStoreLocation = 'Cert:\CurrentUser\My'
}
New-SelfSignedCertificate @params
```

Compute the self-signed `{hash}` (SHA-256 over the `.cer`; export from a `.pfx` first if needed):

```powershell
CertUtil -hashfile <CertificateFilePath> SHA256

$cert = Get-PfxCertificate -FilePath "path\to\your.pfx"
$cert.RawData | Set-Content -Encoding Byte -Path "extracted.cer"
```

### Specialized Azure cloud environments

Set **Audience**, **Issuer URL**, and **Subject prefix** explicitly when deploying outside public cloud, GCC, and first release station in GCC.

| Cloud | Audience | Issuer URL | Subject prefix |
| --- | --- | --- | --- |
| GCC High & DoD | `api://AzureADTokenExchangeUSGov` | `https://login.microsoftonline.us` | `/eid1/c/usg` |
| Mooncake (China) | `api://AzureADTokenExchangeChina` | `https://login.partner.microsoftonline.cn` | `/eid1/c/chn` |
| US National (USNAT) | `api://AzureADTokenExchangeUSNat` | `https://login.microsoftonline.eaglex.ic.gov` | `/eid1/c/uss` |
| US Secure (USSec) | `api://AzureADTokenExchangeUSSec` | `https://login.microsoftonline.scloud` | `/eid1/c/usn` |

> [!NOTE]
> The **Audience** value is case-sensitive. For public cloud, GCC, and first release station in GCC, the defaults are Audience `api://AzureADTokenExchange`, Issuer `https://login.microsoftonline.com`, Subject prefix `/eid1/c/pub`.

## Frequently asked questions (FAQs)

### How do I resolve AADSTS700213: No matching federated identity record found?

The subject identifier computed at runtime doesn't match any FIC on the app. Check that:

1. You configured and saved the FIC.
1. The issuer and subject match the format in [Step 3](#step-3-configure-the-federated-identity-credential). You can also find the expected format in the error stack.
1. The record `version` is `2` and the FIC uses the version 2 hash format.
1. The hash is computed from the runtime's DN string (`X509Certificate2.Issuer` / `X509Certificate2.Subject`).
1. The issuer is `https://login.microsoftonline.com/{tenantId}/v2.0` and the audience is `api://AzureADTokenExchange` (case-sensitive).

### How do I resolve AADSTS70050: The Federated Managed Identity path is not properly formatted?

The subject identifier contains characters the identity provider doesn't accept — most often non-ASCII characters in the certificate CN under version 1. Version 2 produces an ASCII-only subject identifier and resolves this error.

### How do I resolve the "Unable to reach or connect to Power Platform" error?

To ensure Power Platform endpoints are reachable and allowlisted, see [Power Platform URLs and IP address ranges](online-requirements.md).
