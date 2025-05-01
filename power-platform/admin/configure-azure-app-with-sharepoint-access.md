---
title: Configure Azure app for SharePoint access
description: Learn how to configure an Azure app for SharePoint access to allow API integration with Dynamics 365. Follow our step-by-step guide.
author: adrianorth
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/01/2025
ms.subservice: admin
ms.author: aorth
ms.reviewer: sericks
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:01/14/2025
contributors:
 - JimDaly
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
  
> [!NOTE]
> To apply more granular access to individual SharePoint sites, the **Sites.Selected** can be used to apply a scope. Learn more at [Understanding Resource Specific Consent for Microsoft Graph and SharePoint Online](/sharepoint/dev/sp-add-ins-modernize/understanding-rsc-for-msgraph-and-sharepoint-online).

## Create managed identities in Dataverse

Create managed identity records in Dataverse. The instructions below use the Dataverse Web API. You may want to use [Insomnia to create these records](/power-apps/developer/data-platform/webapi/insomnia).  Learn more about managed identities in [Setup Dataverse Managed Identities](/power-platform/admin/set-up-managed-identity).

### Add record in Managed Identities table

Insert a row into the [`managedidentity`](/power-apps/developer/data-platform/reference/entities/managedidentity) table using values from the following table.

| Table field | Value | Description |
| --- | --- |--- |
| `applicationid` | A guid value |Use the **Application (client) ID** value from the [Create an Azure application with SharePoint permissions](#create-an-azure-application-with-sharepoint-permissions) section. |
| `tenantid` | A guid value | Use the **Directory (tenant) ID** value from the [Create an Azure application with SharePoint permissions](#create-an-azure-application-with-sharepoint-permissions) section. |
| `credentialsource` | 2 |This is an **IsManaged** source. |
| `subjectscope` | 1 | This is an **EnvironmentScope** scope.|


This example shows how to create a `managedidentity` record using the Dataverse Web API. More information: [Create a record using the Dataverse Web API](/power-apps/developer/data-platform/webapi/create-entity-web-api).

 **Request:**

```http
POST [Organization URI]/api/data/v9.2/managedidentities
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0
Accept: application/json

{
   "applicationid": "<appId>",
   "credentialsource": 2,
   "subjectscope": 1,
   "tenantid": "<tenantId>"
}
```

 **Response:**

```http
HTTP/1.1 204 No Content
OData-Version: 4.0
OData-EntityId: [Organization URI]/api/data/v9.2/managedidentities(aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb)
```

`aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb` represents the `managedidentityid` of the `managedidentity` record created in this example. You will need this in the following step.


### Add record in SharePoint Managed Identities table

Insert a row into the [`sharepointmanagedidentity`](/power-apps/developer/data-platform/reference/entities/sharepointmanagedidentity) table using values from the following table. 

| Table field | Value |
| --- | --- |
| `uniquename` | "msft_ppmiforsharepointauth" |
| `name` | "Managed Identity For SharePoint Auth" |
| `ManagedIdentity@odata.bind` | `/managedidentities(<managedidentityid>)` replacing `<managedidentityid>` with the value from the previous section  |


This example shows how to create a `sharepointmanagedidentity` record using the Dataverse Web API. More information: [Create a record using the Dataverse Web API](/power-apps/developer/data-platform/webapi/create-entity-web-api).

 **Request:**

```http
POST [Organization URI]/api/data/v9.2/sharepointmanagedidentities
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0
Accept: application/json

{
   "uniquename": "msft_ppmiforsharepointauth",
   "name": "Managed Identity For SharePoint Auth",
   "ManagedIdentityId@odata.bind": "/managedidentities(<managedidentityid>)"
}
```

 **Response:**

```http
HTTP/1.1 204 No Content
OData-Version: 4.0
OData-EntityId: [Organization URI]/api/data/v9.2/sharepointmanagedidentities(bbbbbbbb-1111-2222-3333-cccccccccccc)
```

`bbbbbbbb-1111-2222-3333-cccccccccccc` represents the `sharepointmanagedidentityid` of the `sharepointmanagedidentity` record created in this example.

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
    # This script is designed to generate a subject URL for a federated credential configuration in Azure AD.
    # It takes a SharePoint Managed Identity ID, environment ID, tenant ID, and environment type as inputs.
    #
    # The environment type must be one of these values:
    # - "Gov", "GovFR", "High", or "DoD" for environments associated with "https:#login.microsoftonline.us/".
    # - "Mooncake" for "https:#login.partner.microsoftonline.cn".
    # - "USNat" for "https:#login.microsoftonline.eaglex.ic.gov/".
    # - "USSec" for "https:#login.microsoftonline.microsoft.scloud/".
    # - "Public" for "https:#login.microsoftonline.com/".
    
    # This function converts a GUID to a Base64 URL-safe string.
    function Convert-ToBase64Url {
        param (
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [guid]$Guid
        )
        try {
    
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
    
    # This function generates the subject URL for a federated credential configuration in Azure AD.
    function GetSharePointManagedIdentifyConfig {
        param (
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [string]$EnvironmentType,
    
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [guid]$SharePointManagedIdentityId,
    
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [guid]$TenantId,
    
            [Parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [guid]$EnvironmentId
        )
    
        # This is the AAD App Id for DV.
        $POWER_PLATFORM_MANAGED_IDENTITY_APP_ID = '58e835ab-2e39-46a9-b797-accce6633447'
    
        # List of FIC issuer URLs and Token Exchange Resource URLs mapped to environment 
        $environmentConfigList = @(
            # GovGroup
            @{
                IssuerUrl                = "https://login.microsoftonline.com/"
                TokenExchangeResourceUrl = "api://AzureADTokenExchange"
                SubjectPrefix            = "/eid1/c/pub"
                Environments             = @("Gov", "GovFR", "Public")
            },
            # HighGroup
            @{
                IssuerUrl                = "https://login.microsoftonline.us/"
                TokenExchangeResourceUrl = "api://AzureADTokenExchangeUSGov"
                SubjectPrefix            = "/eid1/c/usg"
                Environments             = @("High", "DoD")
            },
            # MoonCake
            @{
                IssuerUrl                = "https://login.partner.microsoftonline.cn"
                TokenExchangeResourceUrl = "api://AzureADTokenExchangeChina"
                SubjectPrefix            = "/eid1/c/chn"
                Environments             = @("MoonCake")
            },
            # USNat
            @{
                IssuerUrl                = "https://login.microsoftonline.eaglex.ic.gov/"
                TokenExchangeResourceUrl = "api://AzureADTokenExchangeUSNat"
                SubjectPrefix            = "/eid1/c/uss"
                Environments             = @("USNat")
            },
            # USSec
            @{
                IssuerUrl                = "https://login.microsoftonline.microsoft.scloud/"
                TokenExchangeResourceUrl = "api://AzureADTokenExchangeUSSec"
                SubjectPrefix            = "/eid1/c/usn"
                Environments             = @("USSec")
            }
        )
    
        try {
    
            # Lookup  environment config based on the environment type 
            $environmentTypeConfig = $environmentConfigList | 
                Where-Object { $_.Environments -contains $EnvironmentType }
    
            if ($null -eq $environmentTypeConfig) {
                Write-Error "Invalid environment type: '$EnvironmentType'. Please provide a valid environment type."
                return
            }
    
            # Construct the issuer URL for the federated credential configuration
            $issuerUrlForFederatedCredentialConfig = $environmentTypeConfig.IssuerUrl + $TenantId + "/v2.0"
    
            # Convert the Tenant ID and Power Platform Managed Identity App ID to Base64 URL-safe strings
            $encodedTenantId = Convert-ToBase64Url -Guid $TenantId
            $encodedPowerPlatformManagedIdentityAppId = Convert-ToBase64Url -Guid $POWER_PLATFORM_MANAGED_IDENTITY_APP_ID
    
            # Construct the subject URL for the federated credential configuration
            $subjectUrlForFederatedCredentialConfig = ("{0}/t/{1}/a/{2}/Env/{3}/sharepointmanagedidentity/{4}" -f 
                $environmentTypeConfig.SubjectPrefix, $encodedTenantId, $encodedPowerPlatformManagedIdentityAppId, 
                $EnvironmentId, $SharePointManagedIdentityId)
    
    Write-Output @"
    Inputs:
        SharePoint Managed Identity ID: $SharePointManagedIdentityId
        Environment ID: $EnvironmentId
        Tenant ID: $TenantId
    
    Calculated Values:
        Encoded Tenant ID: $encodedTenantId
        Power Platform Managed Identity App ID: $POWER_PLATFORM_MANAGED_IDENTITY_APP_ID
        Encoded App ID: $encodedPowerPlatformManagedIdentityAppId
        Token Exchange Resource URL: $($environmentTypeConfig.TokenExchangeResourceUrl)
        Issuer URL for Federated Credential Configuration: $issuerUrlForFederatedCredentialConfig
    
    Result:
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
    . .\GetSharePointManagedIdentifyConfig.ps1
    
    $configInput = @{
        # Specifies the type of environment (e.g., Public, Gov, GovFr, High, DoD, MoonCake, USNat, USSec)
        environmentType = "<environentType>"
        # GUID of the SharePoint Managed Identity
        sharePointManagedIdentityId = "<sharePointManagedIdentityId>"
        # GUID of the Azure AD tenant
        tenantId = "<tenantId>"
        # GUID of the environment where the configuration is being applied
        environmentId = "<environmentId>"
    }
    
    GetSharePointManagedIdentifyConfig @configInput
    ```

1. Execute the `test.ps1` script.

1. Copy the **subject identifier** and paste into the **Value** field of the **Add credential**.
