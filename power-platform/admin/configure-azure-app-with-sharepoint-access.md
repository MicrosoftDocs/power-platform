---
title: Configure Azure app for SharePoint access
description: Learn how to configure an Azure app for SharePoint access to allow API integration with Dynamics 365. Follow our step-by-step guide.
author: adrianorth
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/11/2025
ms.subservice: admin
ms.author: aorth
ms.reviewer: sericks
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:01/14/2025
---
# Configure Azure app for SharePoint access

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Using the SharePoint Documents table in a Dynamics 365 environment outside of the documents grid in a model driven app requires an Azure application to grant access. Examples of this access include use within Power Automate or with Dataverse API calls. The setup uses the Power Platform Managed Identities with Azure to grant access.

Starting in March 2025, the current access is removed to enhance system protection. To ensure continued access, follow these steps to create an Azure application with the necessary SharePoint permissions, set up managed identities in Dataverse, and configure federated credentials.

## Create an Azure application with SharePoint permissions

Create an App registration with API permission to SharePoint. Learn more about registering an app and SharePoint access in [Azure Quickstart Register App](/entra/identity-platform/quickstart-register-app?tabs=certificate) and [SharePoint access via Azure AD App-Only](/sharepoint/dev/solution-guidance/security-apponly-azuread).

1. Open the [Azure portal](https://portal.azure.com/).

1. Under **Azure services**, select **App registrations**.

1. Select **New registration**.

1. Enter a **Name** for the application.

1. Under **Supported account types**, select **Accounts in this organizational directory only**.

    > [!NOTE]
    > Other types aren't supported at this time.

1. Select **Register** to create the **App registration**.

1. Note the **Application (client) ID** and **Directory (tenant) ID**:

   1. In the navigation list, select **Overview**.

   1. Under **Essentials**, copy the **Application (client) ID** and **Directory (tenant) ID** values for use in the next section.

1. In the navigation list, select **Manage** > **API permissions**.

1. Under **Configured permissions**, select **Add a permission** to open the **Request API permissions** panel.

   1. Select **SharePoint**.

   1. Under **What type of permissions does your application require?**, select **Application permissions**.

   1. Under **Select permissions**, select **Sites.FullControl.All**.

   1. Select **Add permissions** to create the SharePoint permission.

   1. Select **Grant admin consent for `<tenant name>`**.

## Create managed identities in Dataverse

Create managed identity records in Dataverse. Learn more about managed identities in [Setup Dataverse Managed Identities](/power-platform/admin/set-up-managed-identity).

### Add record in Managed Identities table

Insert a row into the [`managedidentities`](/power-apps/developer/data-platform/reference/entities/managedidentity) table using values from the following table.

| Table field | Value |
| --- | --- |
| `applicationid` | Use the **Application (client) ID** value from first section |
| `tenantid` | Use the **Directory (tenant) ID** value from first section |
| `managedidentityid` | Create new GUID |
| `credentialsource` | 2 |
| `subjectscope` | 1 |

An example using POST:

- Request:
`https://contoso.crm.dynamics.com/api/data/v9.0/managedidentities`
- Body:

  ```json
  {
  "applicationid": "<appId>",
  "managedidentityid": "<newGuid>",
  "credentialsource": 2,
  "subjectscope": 1,
  "tenantid": "<tenantId>"
  }
  ```

### Add record in SharePoint Managed Identities table

Insert a row into the [`sharepointmanagedidentity`](/power-apps/developer/data-platform/reference/entities/sharepointmanagedidentity) table using values from the following table.

| Table field | Value |
| --- | --- |
| `sharepointmanagedidentityid` | Create new GUID |
| `uniquename` | "msft_ppmiforsharepointauth" |
| `name` | "Managed Identity For SharePoint Auth" |
| `ManagedIdentity@odata.bind` | `/managedidentities(<managedidentityid>)` replacing `<managedidentityid>` with the value from the previous section  |

An example using POST:

- Request:
`https://contoso.crm.dynamics.com/api/data/v9.0/sharepointmanagedidentities`
- Body:

  ```json
  {
  "sharepointmanagedidentityid": "<newGuid>",
  "uniquename": "msft_ppmiforsharepointauth",
  "name": "Managed Identity For SharePoint Auth",
  "ManagedIdentityId@odata.bind": "/managedidentities(<managedIdentityId>)"
  }
  ```

## Create federated credential

Create a federated credential for the app registration. Learn more about federated identity credentials in [Configure an application for federated identity credential](/entra/workload-id/workload-identity-federation-config-app-trust-managed-identity?tabs=microsoft-entra-admin-center).

> [!NOTE]
> Federated identity credentials through Power Platform managed identity is generally available and fully supported for the SharePoint document integration. The Power Platform managed identity is used for many scenarios, but not all are generally available. However, this case is fully supported.

1. Open the [Azure portal](https://portal.azure.com/).

1. Select **Microsoft Entra ID**.

1. In the navigation list, select **Manage** > **App registrations**.

1. In the applications list, select the app registration name created in the previous section.

1. In the navigation list, select **Manage** > **Certificates & secrets**.

1. Select the **Federated credentials** tab.

1. Select **Add credential**.

1. In the **Federated credential scenario** field, select **Other issuer**.

1. In the **Issuer** field, enter the Issuer URL:

   - Value format: `https://login.microsoftonline.com/<tenantId>/v2.0`
   - Replace `<tenantId>` with the **Directory (tenant) ID** GUID value from the previous section.

1. In the **Value** field, enter the Subject Identifier:

    - Value format: `/eid1/c/pub/t/<base64-encoded-tenantId>/a/<base64-encoded-appid>/Env/<orgid>/sharepointmanagedidentity/<sharepointmanagedidentityid>`
    - Replace `<base64-encoded-tenantId>` with the based64 encoded tenant ID.
    - Replace `<base64-encoded-appid>` with the base64 encoded app client ID.
    - Replace `<orgid>` with the organization ID.
    - Replace `<sharepointmanagedidentityid>` with the GUID created earlier with the sharepointmanagedidentities record.

   > [NOTE!]
   > Use the script in [Generate the subject identifer](#generate-the-subject-identifer) to generate the subject identifier value with the base64 encoded values.

1. Select **Add** to create the credential.

By following these steps, you configure an Azure application with the necessary SharePoint permissions, set up managed identities in Dataverse, and configure federated credentials.

## Generate the subject identifer

This PowerShell script generates the subject identifier value based on input values
- EnvironmentType of Public, Gov, GovFR, High, DoD, Mooncake, USNat, USSec
- sharePointManagedIdentityId
- tenantId
- environmentId

1. Copy the following script into `GetSharePointManagedIdentifyConfig.ps1`.

    ```powershell
    # This is the AAD App Id for DV.
    $POWER_PLATFORM_MANAGED_IDENTITY_APP_ID = '58e835ab-2e39-46a9-b797-accce6633447'
     
    # Combined collection of FIC issuer URLs and Token Exchange Resource URLs mapped to environment identifiers.
    $ENVIRONMENT_CONFIG_COLLECTION = @{
        "GovGroup"  = @{
            IssuerUrl                = "https://login.microsoftonline.com/"
            TokenExchangeResourceUrl = "api://AzureADTokenExchange"
            SubjectPrefix            = "/eid1/c/pub"
            Environments             = @("Gov", "GovFR", "Public")
        }
        "HighGroup" = @{
            IssuerUrl                = "https://login.microsoftonline.us/"
            TokenExchangeResourceUrl = "api://AzureADTokenExchangeUSGov"
            SubjectPrefix            = "/eid1/c/usg"
            Environments             = @("High", "DoD")
        }
        "Mooncake"  = @{
            IssuerUrl                = "https://login.partner.microsoftonline.cn"
            TokenExchangeResourceUrl = "api://AzureADTokenExchangeChina"
            SubjectPrefix            = "/eid1/c/chn"
        }
        "USNat"     = @{
            IssuerUrl                = "https://login.microsoftonline.eaglex.ic.gov/"
            TokenExchangeResourceUrl = "api://AzureADTokenExchangeUSNat"
            SubjectPrefix            = "/eid1/c/uss"
        }
        "USSec"     = @{
            IssuerUrl                = "https://login.microsoftonline.microsoft.scloud/"
            TokenExchangeResourceUrl = "api://AzureADTokenExchangeUSSec"
            SubjectPrefix            = "/eid1/c/usn"
        }
    }
   
    <#
    .SYNOPSIS
        Retrieves the environment configuration based on the provided identifier.
     
    .DESCRIPTION
        This function searches the `$ENVIRONMENT_CONFIG_COLLECTION` for a configuration that matches the provided identifier.
        It first checks if the identifier exists in the `Environments` array of any configuration.
        If no match is found, it directly checks if the identifier exists as a key in the collection.
     
    .PARAMETER Identifier
        The identifier used to retrieve the environment configuration. This can be an environment name or a key in the collection.
     
    .OUTPUTS
        [hashtable] The matching environment configuration.
     
    .NOTES
        - If the identifier is invalid or not found, the function throws an error.
        - Ensure that `$ENVIRONMENT_CONFIG_COLLECTION` is properly initialized before calling this function.
    #>
    function Get-EnvironmentConfigByIdentifier {
        param (
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [string]$Identifier
        )
     
        # Search for the identifier in the Environments array of each configuration
        $matchingConfig = $ENVIRONMENT_CONFIG_COLLECTION.Values |
        Where-Object { $_.Environments -and $_.Environments -contains $Identifier }
     
        if ($matchingConfig) {
            return $matchingConfig
        }
     
        # Check if the identifier exists as a key in the collection
        if ($ENVIRONMENT_CONFIG_COLLECTION.ContainsKey($Identifier)) {
            return $ENVIRONMENT_CONFIG_COLLECTION[$Identifier]
        }
     
        # Throw an error if no match is found
        throw "Invalid identifier: '$Identifier'. Please provide a valid identifier from the environment configuration."
    }
     
    <#
    .SYNOPSIS
        Converts a GUID to a Base64 URL-safe string.
     
    .DESCRIPTION
        This function takes a GUID as input, validates it, and converts it into a Base64 URL-safe string.
        The resulting string is trimmed of padding characters and replaces characters to make it URL-safe.
     
    .PARAMETER Guid
        The GUID to be converted to a Base64 URL-safe string. It must be a valid GUID format.
     
    .OUTPUTS
        [string] A Base64 URL-safe string representation of the GUID.
     
    .NOTES
        - If the input is not a valid GUID, the function will output an error message and return `$null`.
        - This function is useful for encoding GUIDs in scenarios where URL-safe strings are required.
    #>
    function Convert-ToBase64Url {
        param (
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [string]$Guid
        )
        try {
            # Validate and convert the input to a GUID object
            [guid]$Guid = $Guid
     
            # Convert the GUID to a byte array
            $guidBytes = $Guid.ToByteArray()
     
            # Convert the byte array to a Base64 string
            $base64String = [Convert]::ToBase64String($guidBytes)
     
            # Make the Base64 string URL-safe
            $base64StringUrl = $base64String.TrimEnd('=') -replace '\+', '-' -replace '/', '_'
     
            return $base64StringUrl
        }
        catch {
            Write-Error "Invalid GUID format. Please provide a valid GUID."
            return $null
        }
    }
   
    <#
    .SYNOPSIS
        Constructs the issuer URL for Federated Identity Credential (FIC) configuration.
     
    .DESCRIPTION
        This function generates the issuer URL by combining a prefix, the provided tenant ID, and a suffix.
        It ensures that the tenant ID is not null or empty and throws an error if validation fails.
     
    .PARAMETER TenantId
        The tenant ID used to construct the issuer URL. It must be a non-empty string.
     
    .OUTPUTS
        [string] The constructed issuer URL.
     
    .NOTES
        - Ensure that `$prefixForFICIssuer` and `$suffixForFICIssuer` are properly initialized before calling this function.
        - This function is critical for generating the issuer URL required for FIC configuration.
    #>
    function New-IssuerUrlForFIC {
        param (
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [string]$TenantId
        )
     
        return "$prefixForFICIssuer$TenantId$suffixForFICIssuer"
    }
     
    <#
    .SYNOPSIS
        Constructs the subject URL for Federated Identity Credential (FIC) configuration.
     
    .DESCRIPTION
        This function generates the subject URL by combining various encoded identifiers and prefixes.
        It ensures that all required parameters are provided and valid before constructing the URL.
     
    .PARAMETER EncodedTenantId
        The Base64 URL-safe encoded tenant ID. It must be a non-empty string.
     
    .PARAMETER EncodedAppId
        The Base64 URL-safe encoded application ID. It must be a non-empty string.
     
    .PARAMETER EnvironmentId
        The environment ID used in the subject URL. It must be a non-empty string.
     
    .PARAMETER SharePointManagedIdentityId
        The SharePoint Managed Identity ID used in the subject URL. It must be a non-empty string.
     
    .OUTPUTS
        [string] The constructed subject URL.
     
    .NOTES
        - Ensure that the required prefix variables (`$subjectPrefixForFICIssuer`, `$tenantIdentifierForFICSubject`, etc.) are initialized before calling this function.
        - This function is critical for generating the subject URL required for FIC configuration.
    #>
    function New-SubjectUrlForFIC {
        param (
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [string]$EncodedTenantId,
     
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [string]$EncodedAppId,
     
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [string]$EnvironmentId,
     
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [string]$SharePointManagedIdentityId
        )
        return "$subjectPrefixForFICIssuer$tenantIdentifierForFICSubject$EncodedTenantId$appIdentifierForFICSubject$EncodedAppId$environmentIdentifierForFICSubject$EnvironmentId$sharePointManagedIdentityIdentifierForFICSubject$SharePointManagedIdentityId"
    }
    
    # Specify the environment identifier that matches the customer's use case.
    # Examples:
    # - Use "Gov", "GovFR", "High", or "DoD" for environments associated with "https:#login.microsoftonline.us/".
    # - Use "Mooncake" for "https:#login.partner.microsoftonline.cn".
    # - Use "USNat" for "https:#login.microsoftonline.eaglex.ic.gov/".
    # - Use "USSec" for "https:#login.microsoftonline.microsoft.scloud/".
    # - Use "Public" for "https:#login.microsoftonline.com/".
    # This value is critical for determining the correct issuer URL and token exchange resource URL.
    $environmentType = ""
     
    # Replace with the id for SharePoint Managed Identity that was created.
    # Refer to the following documentation for configuring an aad app for SharePoint access:
    #  https://learn.microsoft.com/en-us/power-platform/admin/configure-azure-app-with-sharepoint-access
    # For the SharePoint Managed Identity creation, refer to the following documentation:
    #  https://learn.microsoft.com/en-us/power-platform/admin/configure-azure-app-with-sharepoint-access#add-record-in-sharepoint-managed-identities-table
    $sharePointManagedIdentityId = ""
     
    # Placeholder for tenant ID, replaced with the tenant id for the crm organization.
    # This value is used to construct the issuer URL for the federated credential configuration.
    # It is important to ensure that the tenant ID is correctly set to avoid issues with the federated credential configuration.
    # For fetching the tenant ID, refer to the following documentation:
    #  https://learn.microsoft.com/en-us/power-platform/alm/checker-api/overview#find-your-tenant-id
    $tenantId = ""
     
    # Placeholder for environment ID, replaced with the environment id for the crm organization.
    # This value is used to construct the subject URL for the federated credential configuration.
    # It is important to ensure that the environment ID is correctly set to avoid issues with the federated credential configuration.
    # For fetching the environment ID, refer to the following documentation:
    #  https://learn.microsoft.com/en-us/power-platform/admin/determine-org-id-name
    $environmentId = ""
    
    function GetSharePointManagedIdentifyConfig {
        param (
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [string]$environmentType,
     
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [string]$sharePointManagedIdentityId,
     
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [string]$tenantId,
     
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [string]$environmentId
        )
    
        # Main script logic
        try {
            $requiredValues = @{
                "Environment Identifier for FIC Issuer URL" = $environmentType
                "SharePoint Managed Identity ID"            = $sharePointManagedIdentityId
                "Tenant ID"                                 = $tenantId
                "Environment ID"                            = $environmentId
            }
     
            foreach ($key in $requiredValues.Keys) {
                if (-not $requiredValues[$key]) {
                    Write-Error "$key is null or undefined. Please ensure that $key is set."
                    return
                }
            }
     
            $config = Get-EnvironmentConfigByIdentifier -Identifier $environmentType
            $prefixForFICIssuer = $config.IssuerUrl
            $tokenExchangeResourceUrl = $config.TokenExchangeResourceUrl
            $subjectPrefixForFICIssuer = $config.SubjectPrefix
            $suffixForFICIssuer = "/v2.0"
            $tenantIdentifierForFICSubject = "/t/"
            $appIdentifierForFICSubject = "/a/"
            $environmentIdentifierForFICSubject = "/Env/"
            $sharePointManagedIdentityIdentifierForFICSubject = "/sharepointmanagedidentity/"
        
            $encodedTenantId = Convert-ToBase64Url -Guid $tenantId
            $encodedPowerPlatformManagedIdentityAppId = Convert-ToBase64Url -Guid $POWER_PLATFORM_MANAGED_IDENTITY_APP_ID
            $issuerUrlForFederatedCredentialConfig = New-IssuerUrlForFIC -TenantId $tenantId
            $subjectUrlForFederatedCredentialConfig = New-SubjectUrlForFIC -EncodedTenantId $encodedTenantId -EncodedAppId $encodedPowerPlatformManagedIdentityAppId -EnvironmentId $environmentId -SharePointManagedIdentityId $sharePointManagedIdentityId
        
            Write-Output @"
    SharePoint Managed Identity ID: $sharePointManagedIdentityId
    Environment ID: $environmentId
    Tenant ID: $tenantId
    Encoded Tenant ID: $encodedTenantId
    Power Platform Managed Identity App ID: $POWER_PLATFORM_MANAGED_IDENTITY_APP_ID
    Encoded App ID: $encodedPowerPlatformManagedIdentityAppId
    Token Exchange Resource URL: $tokenExchangeResourceUrl
    Issuer URL for Federated Credential Configuration: $issuerUrlForFederatedCredentialConfig
    Subject URL for Federated Credential Configuration: $subjectUrlForFederatedCredentialConfig
    "@
    
        }
        catch {
            Write-Error "Error executing request: $_"
        }
    }
      ```
  1. Create a `test.ps1` and pass inputs to the `GetSharePointManagedIdentifyConfig` function
  
      ```powershell
      . GetSharePointManagedIdentifyConfig.ps1
  
      GetSharePointManagedIdentifyConfig -environmentType "Public" -sharePointManagedIdentityId "7098aeec-1b6e-466d-a9e5-56b5af4f263a" -tenantId "631e6586-3a18-42a6-9204-058bdf23d2eb" -environmentId "ca61fa25-fe11-eabb-9029-9664406f0c0d"
      ```

1. Execute the `test.ps1` script.

1. Copy the **subject identifier** and paste into the **Value** field of the **Add credential**.
