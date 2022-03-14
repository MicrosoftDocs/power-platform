---
title: Programmability and Extensibility - Authentication (preview) | Microsoft Docs
description: Overview of Azure Active Directory (Azure AD) setup for calling Power Platform API and other platform programmability tools
author: laneswenka
ms.reviewer: jimholtz

ms.component: pa-admin
ms.topic: reference
ms.date: 03/09/2022
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Authentication (preview)
This article provides an overview of the Azure Active Directory (Azure AD) setup for calling Power Platform API (preview).  To access resources available via Power Platform API, you must get a bearer token from Azure AD and send it as a header along with each request.  Depending on the identity type you are supporting (user vs service principal) there are different flows to obtain this bearer token.  These are outlined below.

## Basic authentication and authorization steps
The following are the steps required to obtain a bearer token with the correct permissions:
1. Create an application registration in your Azure AD tenant
2. Configure API permissions
3. Configure Public Client (optional)
4. Configure Certificates and Secrets (optional)
5. Request an access token 

### Create an application registration
Navigate to the [Azure AD app registration](https://go.microsoft.com/fwlink/?linkid=2083908) page and create a new registration.  Give the application a name, and ensure the **Single tenant** option is selected.  You can skip the redirect URI setup.

### Configure API permissions
Within your new app registration, navigate to the **Manage - API Permissions** tab.  Under the **Configure permissions** section, select **Add a Permission**.  On the dialog window that opens, select the **APIs my organization uses** tab, and then search for **Power Platform API**.  You might see several entries with a name similar to this, so ensure you use the one with the GUID **8578e004-a5c6-46e7-913e-12f58912df43**.  

From here, you must select the permissions you require. These are grouped by [**Namespaces** ](https://aka.ms/PowerPlatformAPI-Technical).  Within a namespace, you will see resource types and actions for example *AppManagement.ApplicationPackages.Read* which will give read permissions for application packages.  For more details, see our [Permission reference](programmability-permission-reference.md) article.

> [!Note]
> Power Platform API makes use of delegated permissions only at this time.  For applications that run with a user context, you request delegated permissions using the **scope** parameter.  These permissions delegate the privileges of the signed-in user to your application, allowing it to act as the user when calling Power Platform API endpoints.
>
>For service principal identities, application permissions are not used.  Instead service principals are treated as Power Platform Administrators today and must be registered by following [Powershell - Create service principal](powershell-create-service-principal.md).  

After the required permissions are added to the application, select **Grant admin consent** to complete the setup.  This is necessary for instances where you want to allow users to access your app right away, instead of requiring an interactive consent experience.  If you can support interactive consent, we recommend following the [Microsoft identity platform and OAuth 2.0 authorization code flow](https://docs.microsoft.com/azure/active-directory/develop/v2-oauth2-auth-code-flow).

### Configure Public Client (optional)
If your app will require reading and writing resources on behalf of a user, you will need to enable the Public Client setting.  This is the only way that Azure AD will accept username and password properties in the body of your token request.  Also note, that if you plan to use this feature it will not work for accounts that have multi-factor authentication enabled.  

To enable, visit the **Manage - Authentication** tab.  Under the **Advanced Settings** section, set the **Public Client** switch to **Yes**. 

### Configure Certificates and Secrets (optional)
If your app will require reading and writing resources as itself - also known as a Service Principal, there are two ways to authenticate.   To use certificates, navigate to the **Manage - Certificates and secrets** tab.  Under the **Certificates** section, upload an x509 certificate that you can use to authenticate.  The other way is to use the **Secrets** section to generate a client secret.  Save the secret in a safe location for use with your automation needs.  The certificate or secret options will allow you to authenticate with Azure AD and receive a token for this client, of which you will pass along to either the REST APIs or PowerShell cmdlets.  

### Request an access token
There are two ways to obtain an access bearer token.  One is for username and password and the other is for Service Principals.  

#### Username and password flow
Be sure to read the Public Client section above.  Then, send a POST request via HTTP to Azure AD with a username and password payload.

```HTTP
Content-Type: application/x-www-form-urlencoded
Host: login.microsoftonline.com
Accept: application/json
POST https://login.microsoftonline.com/YOUR_TENANT.COM/oauth2/v2.0/token
BODY:
client_id={CLIENT_ID_FROM_AZURE_CLIENT_APP}&scope=https://api.powerplatform.com/.default&username={USER_EMAIL_ADDRESS}&password={PASSWORD}&grant_type=password
```
The above example contains placeholders that you can retrieve from your client application in Azure Active Directory.  You'll receive a response that can be used to make subsequent calls to Power Platform API.

```JSON
{
  "token_type": "Bearer",
  "scope": "https://service.powerapps.com//User https://service.powerapps.com//.default",
  "expires_in": 3599,
  "ext_expires_in": 3599,
  "access_token": "eyJ0eXAiOi...UBkeW5hbWljc2F4ZGVtby5vbm1pY3Jvc29mdC5jb20iLCJ1dGkiOiI1Q1Fnb25PR0dreWlTc1I2SzR4TEFBIiwidmVyIjoiMS4wIn0.N_oCJiEz2tRU9Ls9nTmbZF914MyU_u7q6bIUJdhXd9AQM2ZK-OijiKtMGfvvVmTYZp4C6sgkxSt0mOGcpmvTSagSRDY92M2__p-pEuKqva5zxXXXmpC-t9lKYDlXRcKq1m5xv-q6buntnLrvZIdd6ReD3n3_pnGAa6OxU0s82f7DqAjSQgXR3hwq_NZOa0quCUN9X-TvpIYrJfVgQfVu0R189hWmUzbYpuoPrUMj2vQI_19gEHz_FryXolM4RMStugYrC0Z72ND5vFlGgvYhZfbWJRC6hGvQQin_eAASmmjLwhRBGMJd6IdbgEXAkFF2rFITFFtFY_4hrN3bvHsveg"
}
```

Use the **access_token** value in subsequent calls to the Power Platform API using the **Authorization** HTTP header.

#### Service Principal flow
Be sure to read the Certificates and Secrets section above.  Then, send a POST request via HTTP to Azure AD with a client secret payload.  This is often referred to as service principal authentication.  This can only be used after you have registered this client application ID with Microsoft Power Platform.  

```HTTP
Content-Type: application/x-www-form-urlencoded
Host: login.microsoftonline.com
Accept: application/json
POST https://login.microsoftonline.com/YOUR_TENANT.COM/oauth2/v2.0/token
BODY:
client_id={CLIENT_ID_FROM_AZURE_CLIENT_APP}&scope=https://api.powerplatform.com/.default&client_secret={SECRET_FROM_AZURE_CLIENT_APP}&grant_type=client_credentials
```
The above example contains placeholders that you can retrieve from your client application in Azure Active Directory.  You'll receive a response that can be used to make subsequent calls to Power Platform API.

```JSON
{
  "token_type": "Bearer",
  "scope": "https://service.powerapps.com//User https://service.powerapps.com//.default",
  "expires_in": 3599,
  "ext_expires_in": 3599,
  "access_token": "eyJ0eXAiOi...UBkeW5hbWljc2F4ZGVtby5vbm1pY3Jvc29mdC5jb20iLCJ1dGkiOiI1Q1Fnb25PR0dreWlTc1I2SzR4TEFBIiwidmVyIjoiMS4wIn0.N_oCJiEz2tRU9Ls9nTmbZF914MyU_u7q6bIUJdhXd9AQM2ZK-OijiKtMGfvvVmTYZp4C6sgkxSt0mOGcpmvTSagSRDY92M2__p-pEuKqva5zxXXXmpC-t9lKYDlXRcKq1m5xv-q6buntnLrvZIdd6ReD3n3_pnGAa6OxU0s82f7DqAjSQgXR3hwq_NZOa0quCUN9X-TvpIYrJfVgQfVu0R189hWmUzbYpuoPrUMj2vQI_19gEHz_FryXolM4RMStugYrC0Z72ND5vFlGgvYhZfbWJRC6hGvQQin_eAASmmjLwhRBGMJd6IdbgEXAkFF2rFITFFtFY_4hrN3bvHsveg"
}
```

Use the **access_token** value in subsequent calls to the Power Platform API using the **Authorization** HTTP header.

### See also
[Preview: Creating a service principal application via API](powerplatform-api-create-service-principal.md)
[Powershell - Create service principal](powershell-create-service-principal.md)


