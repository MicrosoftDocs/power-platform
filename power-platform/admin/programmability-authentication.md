---
title: Programmability and Extensibility - Authentication | Microsoft Docs
description: Overview of authentication for Power Platform programmability tools
author: laneswenka
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 12/15/2021
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Authentication
This article provides an overview of the authentication setup for the various programmability tools.

## Register a client application in Azure Active Directory
For an overview of general Azure Active Directory (Azure AD) client application creation, visit [Quickstart: Register an application with the Microsoft identity platform](/azure/active-directory/develop/quickstart-register-app).  However, for Microsoft Power Platform, there are some specifics worth mentioning in the sections below. 

### Authentication advanced settings
In the Azure portal, navigate to your newly created client application and select the **Manage - Authentication** tab.  Under the **Advanced Settings** section, set the **Public Client** switch to **Yes**.  This will ensure you can obtain a JSON Web Token (JWT) using simple username and password authentication.  This type of authentication is required for interactive applications you might build and for registering a Service Principal entry in Microsoft Power Platform.

### API permissions
In the Azure portal, navigate to the **Manage - API Permissions** tab.  Under the **Configure permissions** section, select **Add a Permission**.  On the dialog window that opens, select the **APIs my organization uses** tab, and then search for **Power Apps Service**.  You might see several entries with a name similar to this, so ensure you use the one with the GUID **475226c6-020e-4fb2-8a90-7a972cbfc1d4**.  Include all of the Delegated Permissions such as the **User permissions - Access the Power Apps Service API** option.

After this is added to the client application, select **Grant admin consent** to complete the setup.  This is necessary for instances where you want to start using a tool like the REST APIs, which do not have a graphical user interface (GUI) that can request consent on a per-use basis.

### Certificates and secrets
In the Azure portal, navigate to the **Manage - Certificates and secrets** tab.  Under the **Certificates** section, upload an x509 certificate that you can use to authenticate.  Optionally, you can use the **Secrets** section to generate a client secret.  Save the secret in a safe location for use with your automation needs.  The certificate or secret options will allow you to authenticate with Azure AD and receive a token for this client, of which you will pass along to either the REST APIs or PowerShell cmdlets.  

### Obtain a token for username and password authentication
Send a POST request via HTTP to Azure AD with a username and password payload.

```HTTP
Content-Type: application/x-www-form-urlencoded
Host: login.microsoftonline.com
Accept: application/json
POST https://login.microsoftonline.com/YOUR_TENANT.COM/oauth2/v2.0/token
BODY:
client_id={CLIENT_ID_FROM_AZURE_CLIENT_APP}&scope=https://service.powerapps.com//.default&username={USER_EMAIL_ADDRESS}&password={PASSWORD}&grant_type=password
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

### Obtain a token for client authentication
Send a POST request via HTTP to Azure AD with a client secret payload.  This is often referred to as service principal authentication.  This can only be used after you have registered this client application ID with Microsoft Power Platform.  

```HTTP
Content-Type: application/x-www-form-urlencoded
Host: login.microsoftonline.com
Accept: application/json
POST https://login.microsoftonline.com/YOUR_TENANT.COM/oauth2/v2.0/token
BODY:
client_id={CLIENT_ID_FROM_AZURE_CLIENT_APP}&scope=https://service.powerapps.com//.default&client_secret={SECRET_FROM_AZURE_CLIENT_APP}&grant_type=client_credentials
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


