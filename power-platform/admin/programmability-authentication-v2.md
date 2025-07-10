---
title: Programmability and Extensibility - Authentication 
description: Overview of Microsoft Entra setup for calling Power Platform API and other platform programmability tools
author: laneswenka
ms.reviewer: sericks
ms.topic: reference
ms.date: 06/26/2025
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Authentication

This article provides an overview of the Microsoft Entra setup for calling Power Platform API (preview).  To access resources available via Power Platform API, you must get a bearer token from Microsoft Entra and send it as a header along with each request.  Depending on the identity type you're supporting (user vs service principal) there are different flows to obtain this bearer token, as described in this article.

The following steps are required to obtain a bearer token with the correct permissions:
1. Create an application registration in your Microsoft Entra tenant
2. Configure API permissions
3. Configure Public Client (optional)
4. Configure Certificates and Secrets (optional)
5. Request an access token 

## Step 1. Create an application registration
Navigate to the [Microsoft Entra app registration](https://go.microsoft.com/fwlink/?linkid=2083908) page and create a new registration. Give the application a name, and ensure the **Single tenant** option is selected. You can skip the redirect URI setup.

## Step 2. Configure API permissions
Within your new app registration, navigate to the **Manage - API Permissions** tab. Under the **Configure permissions** section, select **Add a Permission**. On the dialog window that opens, select the **APIs my organization uses** tab, and then search for **Power Platform API**. You might see several entries with a name similar to this, so ensure you use the one with the GUID **8578e004-a5c6-46e7-913e-12f58912df43**.  

If you don't see Power Platform API showing up in the list when searching by GUID, it's possible that you still have access to it but the visibility isn't refreshed. To force a refresh, run the following script:

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

From here, you must select the permissions you require. These are grouped by [**Namespaces** ](/rest/api/power-platform). Within a namespace, you see resource types and actions for example *AppManagement.ApplicationPackages.Read* which give read permissions for application packages. For more information, see our [Permission reference](programmability-permission-reference.md) article.

> [!NOTE]
> Power Platform API makes use of delegated permissions only at this time. For applications that run with a user context, you request delegated permissions using the **scope** parameter. These permissions delegate the privileges of the signed-in user to your application, allowing it to act as the user when calling Power Platform API endpoints.
>
>For service principal identities, application permissions are not used. Instead service principals are treated as Power Platform Administrators today and must be registered by following [PowerShell - Create service principal](powershell-create-service-principal.md).  

After the required permissions are added to the application, select **Grant admin consent** to complete the setup. This is necessary for instances where you want to allow users to access your app right away, instead of requiring an interactive consent experience. If you can support interactive consent, we recommend following the [Microsoft identity platform and OAuth 2.0 authorization code flow](/azure/active-directory/develop/v2-oauth2-auth-code-flow).

## Step 3. Configure Public Client (optional)
If your app requires reading and writing resources on behalf of a user, you must enable the Public Client setting. This is the only way that Microsoft Entra ID accepts username and password properties in the body of your token request. Also note, that if you plan to use this feature, it doesn't work for accounts that have multifactor authentication enabled.  

To enable, visit the **Manage - Authentication** tab.  Under the **Advanced Settings** section, set the **Public Client** switch to **Yes**. 

## Step 4. Configure Certificates and Secrets (optional)
If your app requires reading and writing resources as itself - also known as a Service Principal, there are two ways to authenticate. To use certificates, navigate to the **Manage - Certificates and secrets** tab. Under the **Certificates** section, upload an x509 certificate that you can use to authenticate. The other way is to use the **Secrets** section to generate a client secret. Save the secret in a safe location for use with your automation needs. The certificate or secret options allow you to authenticate with Microsoft Entra and receive a token for this client, of which you pass along to either the REST APIs or PowerShell cmdlets.  

## Step 5. Request an access token
There are two ways to obtain an access bearer token. One is for username and password and the other is for Service Principals.  

#### Username and password flow
Be sure to read the Public Client section above. Then, send a POST request via HTTP to Microsoft Entra ID with a username and password payload.

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
Be sure to read the Certificates and Secrets section above. Then, send a POST request via HTTP to Microsoft Entra ID with a client secret payload. This is often referred to as service principal authentication. 

> [!Important]
> This can only be used after you have registered this client application ID with Microsoft Power Platform following either the related [PowerShell](./powershell-create-service-principal.md) or [REST](./powerplatform-api-create-service-principal.md) documentation. 

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

Use the **access_token** value in subsequent calls to the Power Platform API with the **Authorization** HTTP header. As noted above, the Service Principal flow doesn't use application permissions and is instead, for now, treated as a Power Platform Administrator for all calls that they make.

### Related content
[Creating a service principal application via API (preview)](powerplatform-api-create-service-principal.md)<br/>
[PowerShell - Create service principal](powershell-create-service-principal.md)
