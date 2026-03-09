---
title: Programmability and Extensibility - Authentication
description: Overview of Microsoft Entra setup for calling Power Platform API and other platform programmability tools.
author: laneswenka
ms.reviewer: sericks
ms.topic: reference
ms.date: 03/09/2026
ms.subservice: admin
ms.author: laswenka
search.audienceType:
  - admin
ms.custom: sfi-ropc-nochange
---

# Authentication

This article provides an overview of the Microsoft Entra setup for calling Power Platform API. To access resources available through the Power Platform API, you must get a bearer token from Microsoft Entra and send it as a header along with each request. Depending on the identity type you're supporting (user vs. service principal) there are different flows to obtain this bearer token, as described in this article.

The following steps are required to obtain a bearer token with the correct permissions:

1. [Create an application registration in your Microsoft Entra tenant](#step-1-create-an-application-registration-in-your-microsoft-entra-tenant)
1. [Configure API permissions](#step-2-configure-api-permissions)
1. [Configure platform and redirect URI](#step-3-configure-platform-and-redirect-uri)
1. [(Optional) Configure certificates and secrets](#step-4-optional-configure-certificates-and-secrets)
1. [Request an access token](#step-5-request-an-access-token)

## Step 1. Create an application registration in your Microsoft Entra tenant
1. Navigate to the [Azure portal](https://portal.azure.com).
1. Select **Microsoft Entra ID** at the top of the page. Then select **+ Add** > **App registration**.
1. Fill in the **Register an application** page:
    1. **Name** — Give the application a recognizable name, for example **Power Platform Admin SDK**.
    1. **Supported account types** — Select **Single tenant only - <your company name>**.
    1. **Redirect URI** — Skip this for now. You configure it in Step 3.
1. Select **Register** to create the application. After registration completes, note the **Application (client) ID** and **Directory (tenant) ID** from the overview page — you need both later.

You can also create the registration using Azure CLI:

```bash
az login

az ad app create --display-name "Power Platform Admin SDK" --sign-in-audience AzureADMyOrg
```

The command returns a JSON object. Note the `appId` value — this is your client ID.

## Step 2. Configure API permissions
Within your new app registration, navigate to the **Manage - API Permissions** tab. Under the **Configure permissions** section, select **Add a Permission**. On the dialog window that opens, select the **APIs my organization uses** tab, and then search for **Power Platform API**. You might see several entries with a name similar to this, so ensure that you use the one with the GUID **8578e004-a5c6-46e7-913e-12f58912df43**.

If you don't see Power Platform API displayed in the list when searching by GUID, it's possible that you still have access to it but the visibility isn't refreshed. To force a refresh, run the following script:

### [PowerShell](#tab/powershell)

```powershell
#Install the Microsoft Graph PowerShell SDK module
Install-Module Microsoft.Graph -Scope CurrentUser -Repository PSGallery -Force

Connect-MgGraph
New-MgServicePrincipal -AppId 8578e004-a5c6-46e7-913e-12f58912df43 -DisplayName "Power Platform API"
```

### [Azure CLI](#tab/azcli)

```bash
az login

az ad sp create --id 8578e004-a5c6-46e7-913e-12f58912df43
```
---

From here, you must select the permissions you require. These are grouped by [**Namespaces**](/rest/api/power-platform). Within a namespace, you see resource types and actions for example *AppManagement.ApplicationPackages.Read* which give read permissions for application packages. For more information, see our [Permission reference](programmability-permission-reference.md) article.

> [!NOTE]
> Power Platform API makes use of delegated permissions only at this time. For applications that run with a user context, you request delegated permissions using the **scope** parameter. These permissions delegate the privileges of the signed-in user to your application, allowing it to act as the user when calling Power Platform API endpoints.
>
> For service principal identities, application permissions aren't used. Instead, after creating your app registration, assign it an RBAC role to grant scoped permissions (such as **Contributor** or **Reader**). For more inforamtion, see [Tutorial: Assign RBAC roles to service principals](programmability-tutorial-rbac-role-assignment.md).

After the required permissions are added to the application, select **Grant admin consent** to complete the setup. Granting admin consent authorizes the permissions for all users in the tenant so they aren't prompted with an interactive consent dialog the first time they use your app. If you prefer interactive consent per user, we recommend following [Microsoft identity platform and OAuth 2.0 authorization code flow](/azure/active-directory/develop/v2-oauth2-auth-code-flow).

You can also grant admin consent using Azure CLI:

```bash
# Replace <app-id> with your application (client) ID
az ad app permission admin-consent --id <app-id>
```

## Step 3. Configure platform and redirect URI
SDKs, PowerShell scripts, and desktop applications that authenticate on behalf of a user require a redirect URI so that Microsoft Entra can return tokens back to your application after authentication.

1. Within your app registration, navigate to the **Manage - Authentication** tab.
1. Select **Add a Redirect URI**, then choose **Mobile and desktop applications**.
1. Select the following built-in redirect URI:

    `https://login.microsoftonline.com/common/oauth2/nativeclient`

1. Select **Configure** to save.

You can also add the redirect URI using Azure CLI:

```bash
# Replace <app-id> with your application (client) ID
az ad app update --id <app-id> --public-client-redirect-uris https://login.microsoftonline.com/common/oauth2/nativeclient
```

### Public client setting

Under the **Advanced settings** section on the same **Authentication** tab, there's a **Allow public client flows** toggle. Set this to **Yes** only if you plan to use the Resource Owner Password Credentials (ROPC) flow, which sends a username and password directly in the token request body. 

This flow doesn't work for accounts that have multifactor authentication enabled. For interactive browser or device code flows, you don't need to enable this setting.

## Step 4. (Optional) Configure certificates and secrets 
If your app requires reading and writing resources as itself, also known as a _service principal_, there are two ways to authenticate. To use certificates, navigate to the **Manage - Certificates and secrets** tab. Under the **Certificates** section, upload an x509 certificate that you can use to authenticate. 

The other way is to use the **Secrets** section to generate a client secret. Save the secret in a safe location for use with your automation needs. The certificate or secret options allow you to authenticate with Microsoft Entra and receive a token for this client, of which you pass along to either the REST APIs or PowerShell cmdlets.

## Step 5. Request an access token
There are two ways to obtain an access bearer token. One is for username and password and the other is for service principals.

#### Username and password flow
Be sure to read the [public client section](#public-client-setting). Then, send a POST request via HTTP to Microsoft Entra ID with a username and password payload.

```HTTP
Content-Type: application/x-www-form-urlencoded
Host: login.microsoftonline.com
Accept: application/json
POST https://login.microsoftonline.com/YOUR_TENANT.COM/oauth2/v2.0/token
BODY:
client_id={CLIENT_ID_FROM_AZURE_CLIENT_APP}&scope=https://api.powerplatform.com/.default&username={USER_EMAIL_ADDRESS}&password={PASSWORD}&grant_type=password
```
The above example contains placeholders that you can retrieve from your client application in Microsoft Entra ID. You receive a response that can be used to make subsequent calls to Power Platform API.

```JSON
{
  "token_type": "Bearer",
  "scope": "https://api.powerplatform.com/AppManagement.ApplicationPackages.Install https://api.powerplatform.com/AppManagement.ApplicationPackages.Read https://api.powerplatform.com/.default",
  "expires_in": 4747,
  "ext_expires_in": 4747,
  "access_token": "eyJ0eXAiOiJKV1QiLCJu..."
}
```

Use the **access_token** value in subsequent calls to the Power Platform API with the **Authorization** HTTP header.

#### Service principal flow
Be sure to read the [Configure certificates and secrets](#step-4-optional-configure-certificates-and-secrets) section. Then, send a POST request via HTTP to Microsoft Entra ID with a client secret payload. This is often referred to as service principal authentication.

> [!Important]
> Before using service principal authentication, complete Steps 1-4 above to create and configure your app registration with a certificate or client secret. Then assign the service principal an RBAC role to control its level of access. See [Tutorial: Assign RBAC roles to service principals](programmability-tutorial-rbac-role-assignment.md) for a step-by-step guide.

```HTTP
Content-Type: application/x-www-form-urlencoded
Host: login.microsoftonline.com
Accept: application/json
POST https://login.microsoftonline.com/YOUR_TENANT.COM/oauth2/v2.0/token
BODY:
client_id={CLIENT_ID_FROM_AZURE_CLIENT_APP}&scope=https://api.powerplatform.com/.default&client_secret={SECRET_FROM_AZURE_CLIENT_APP}&grant_type=client_credentials
```
The above example contains placeholders that you can retrieve from your client application in Microsoft Entra ID. You receive a response that can be used to make subsequent calls to Power Platform API.

```JSON
{
  "token_type": "Bearer",
  "expires_in": 3599,
  "ext_expires_in": 3599,
  "access_token": "eyJ0eXAiOiJKV1..."
}
```

Use the **access_token** value in subsequent calls to the Power Platform API with the **Authorization** HTTP header. The service principal's effective permissions are determined by the RBAC role assigned to it. To learn how to assign a role, see [Tutorial: Assign RBAC roles to service principals](programmability-tutorial-rbac-role-assignment.md).

## Quick start with Azure CLI

The following script creates an app registration end-to-end. Run each command in order and replace placeholder values with your own.

```bash
# Sign in to Azure CLI
az login

# Create the app registration (single tenant)
az ad app create --display-name "Power Platform Admin SDK" --sign-in-audience AzureADMyOrg

# Save the app ID from the output, then create a service principal for it
az ad sp create --id <app-id>

# Add a delegated permission (example: AppManagement.ApplicationPackages.Read)
# The --api value is the Power Platform API app ID.
# The --api-permissions value is the permission ID and type (Scope = delegated).
# Repeat this command for each permission you need. See the Permission reference for IDs.
az ad app permission add --id <app-id> \
  --api 8578e004-a5c6-46e7-913e-12f58912df43 \
  --api-permissions <permission-id>=Scope

# Grant admin consent so users aren't prompted individually
az ad app permission admin-consent --id <app-id>

# Add the native client redirect URI for interactive auth
az ad app update --id <app-id> \
  --public-client-redirect-uris https://login.microsoftonline.com/common/oauth2/nativeclient
```

After running these commands, your app registration is ready to use with the SDKs, PowerShell, or direct REST calls. To look up permission IDs for the `--api-permissions` parameter, see the [Permission reference](programmability-permission-reference.md).

## Troubleshooting common issues

### "Consent required" or "needs admin approval" errors
This error occurs when the API permissions on your app registration haven't been consented by the admin. Go to **App registrations** > your app > **API permissions** and select **Grant admin consent**. 

Alternatively, run:

```bash
az ad app permission admin-consent --id <app-id>
```

### "User is not assigned to a role for the application" errors
This error means the enterprise application associated with your app registration has **User assignment required** set to **Yes**. When this is enabled, only users or groups explicitly assigned to the application can sign in. To fix this, take one of the following actions:

- Navigate to **Microsoft Entra ID** > **Enterprise applications** > your app > **Properties** and set **Assignment required** to **No**.
- Add the relevant users or security groups under **Users and groups**.

### Conditional access policies blocking access
If your organization applies conditional access policies, they may block token acquisition for your app registration. Common causes include device compliance requirements, location restrictions, or risk-based policies. Work with your Microsoft Entra administrator to either exclude your app registration from the policy or ensure clients meet the policy requirements.

### "Power Platform API" not found in the API picker
If searching for **Power Platform API** by name or GUID in the API permissions dialog returns no results, the service principal hasn't been created in your tenant. Follow the force-refresh steps in [Step 2](#step-2-configure-api-permissions) to create it.

## Authenticate with Power Platform SDKs and PowerShell

The following examples show how to authenticate and make a sample API call using each SDK and PowerShell. Before running these examples, complete Steps 1-3 above to create and configure your app registration.

### Interactive authentication (delegated user)

Interactive authentication opens a browser window for the user to sign in. This flow is best for developer scripts, admin tools, and any scenario where a user is present.

#### [PowerShell](#tab/powershell-interactive)

```powershell
# Sign in interactively (opens a browser)
Connect-AzAccount

# Get an access token for the Power Platform API
$token = Get-AzAccessToken -ResourceUrl "https://api.powerplatform.com"

# Call the List Environments endpoint as an example
$headers = @{ Authorization = "Bearer $($token.Token)" }
$environments = Invoke-RestMethod -Uri "https://api.powerplatform.com/environmentmanagement/environments?api-version=2024-10-01" -Headers $headers
$environments.value | Format-Table name, properties.displayName
```

#### [C# SDK](#tab/csharp-interactive)

```csharp
using Microsoft.PowerPlatform.Management;

// Create an interactive client — opens a browser for sign-in
var factory = new ServiceClientFactory();
var client = factory.Create("YOUR_CLIENT_ID");

// List environments as an example
var environments = await client.Environmentmanagement.Environments.GetAsync();
foreach (var env in environments.Value)
{
    Console.WriteLine($"{env.Name} - {env.Properties.DisplayName}");
}
```

#### [Python SDK](#tab/python-interactive)

```python
import asyncio
from azure.identity import InteractiveBrowserCredential
from kiota_authentication_azure import AzureIdentityAuthenticationProvider
from kiota_http import HttpxRequestAdapter
from mspp_management import ServiceClientBase

async def main():
    # Create interactive browser credential
    credential = InteractiveBrowserCredential(client_id="YOUR_CLIENT_ID")

    # Wire up the Kiota request adapter
    auth_provider = AzureIdentityAuthenticationProvider(
        credentials=credential,
        scopes=["https://api.powerplatform.com/.default"]
    )
    adapter = HttpxRequestAdapter(authentication_provider=auth_provider)

    # Create the SDK client
    client = ServiceClientBase(adapter)

    # List environments as an example
    environments = await client.environmentmanagement.environments.get()
    for env in environments.value:
        print(f"{env.name} - {env.properties.display_name}")

asyncio.run(main())
```

---

### Confidential client (service principal)

Confidential client authentication uses a client secret or certificate and doesn't require user interaction. This flow is best for background services, pipelines, and automation.

> [!Important]
> Before using service principal authentication, complete Steps 1-4 above to create and configure your app registration with a certificate or client secret. Then assign the service principal an RBAC role to control its level of access. For more informaiton, see [Tutorial: Assign RBAC roles to service principals](programmability-tutorial-rbac-role-assignment.md).

#### [PowerShell](#tab/powershell-confidential)

```powershell
$tenantId = "YOUR_TENANT_ID"
$clientId = "YOUR_CLIENT_ID"
$clientSecret = "YOUR_CLIENT_SECRET"

# Request a token using client credentials
$body = @{
    client_id     = $clientId
    scope         = "https://api.powerplatform.com/.default"
    client_secret = $clientSecret
    grant_type    = "client_credentials"
}
$tokenResponse = Invoke-RestMethod -Method Post `
    -Uri "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token" `
    -ContentType "application/x-www-form-urlencoded" `
    -Body $body

# Call the List Environments endpoint as an example
$headers = @{ Authorization = "Bearer $($tokenResponse.access_token)" }
$environments = Invoke-RestMethod -Uri "https://api.powerplatform.com/environmentmanagement/environments?api-version=2024-10-01" -Headers $headers
$environments.value | Format-Table name, properties.displayName
```

#### [C# SDK](#tab/csharp-confidential)

```csharp
using Microsoft.PowerPlatform.Management;

// Create a confidential client with a client secret
var factory = new ServiceClientFactory();
var client = factory.CreateConfidential(
    "YOUR_TENANT_ID",
    "YOUR_CLIENT_ID",
    "YOUR_CLIENT_SECRET"
);

// List environments as an example
var environments = await client.Environmentmanagement.Environments.GetAsync();
foreach (var env in environments.Value)
{
    Console.WriteLine($"{env.Name} - {env.Properties.DisplayName}");
}
```

#### [Python SDK](#tab/python-confidential)

```python
import asyncio
from azure.identity import ClientSecretCredential
from kiota_authentication_azure import AzureIdentityAuthenticationProvider
from kiota_http import HttpxRequestAdapter
from mspp_management import ServiceClientBase

async def main():
    # Create client secret credential
    credential = ClientSecretCredential(
        tenant_id="YOUR_TENANT_ID",
        client_id="YOUR_CLIENT_ID",
        client_secret="YOUR_CLIENT_SECRET"
    )

    # Wire up the Kiota request adapter
    auth_provider = AzureIdentityAuthenticationProvider(
        credentials=credential,
        scopes=["https://api.powerplatform.com/.default"]
    )
    adapter = HttpxRequestAdapter(authentication_provider=auth_provider)

    # Create the SDK client
    client = ServiceClientBase(adapter)

    # List environments as an example
    environments = await client.environmentmanagement.environments.get()
    for env in environments.value:
        print(f"{env.name} - {env.properties.display_name}")

asyncio.run(main())
```

---

### Related content
[Tutorial: Assign RBAC roles to service principals](programmability-tutorial-rbac-role-assignment.md)<br/>
[Role-based access control for Power Platform admin center](security/role-based-access-control.md)<br/>
[Permission reference](programmability-permission-reference.md)
