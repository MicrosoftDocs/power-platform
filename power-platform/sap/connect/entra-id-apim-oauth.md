---
title: Set up Microsoft Entra ID for SSO to SAP in OData connector
description: Learn how to set up SAP and Azure API Management so that users can access SAP and make OData calls in Microsoft Power Platform using their Microsoft Entra ID.
author: scottwoodallmsft
ms.author: scottwoodall
contributors:
  - robinsonshields
  - microsoft-george
  - tverhasselt
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
  - EllenWehrle
  - MartinPankraz
  - haowusky
ms.reviewer: ellenwehrle
ms.service: power-platform
ms.subservice: sap
ms.custom: ignite-2024
ms.topic: how-to
ms.date: 12/09/2024
# Customer intent: As an administrator, I want to learn how to set up Microsoft Entra ID, Azure API Management, and SAP for SSO from SAP OData connector so my users can sign
---

# Set up Microsoft Entra ID, Azure API Management, and SAP for SSO from SAP OData connector

You can set up the SAP OData connector for Power Platform to use Microsoft Entra ID credentials for single sign-on (SSO) to SAP. This allows your users to access SAP data in Power Platform solutions without having to sign in multiple times to multiple services while honoring their authorizations and assigned roles in SAP.

This article walks you through the process, including setting up a trust between SAP and Microsoft Entra ID and configuring Azure API Management to convert the Microsoft Entra ID OAuth token to a SAML token that's used to make OData calls to SAP.

:::image type="content" source="media/entra-id-apim-oauth/traffic_flow.jpg" alt-text="Solution diagram that shows the traffic flow from Power Platform and Copilot to SAP through Azure API Management." lightbox="media/entra-id-apim-oauth/traffic_flow.jpg":::

You can also gain additional insights and context into the setup process in the blog post, [Hurray! SAP OData connector now supports OAuth2 and SAP Principal Propagation](https://community.powerplatform.com/blogs/post/?postid=c6a609ab-3556-ef11-a317-6045bda95bf0).

## Prerequisites

- SAP instance
- Azure API Management resource

## Named values

This article uses a few named values to make the examples easier to follow. These values are reused throughout the article and referenced in later sections.
Replace the named values with your own values when following the examples.

| Name | Value | Description |
|------|-------------|-------------|
| AADSAPResource | https://SAP_SAML_Client100 | SAP local provider name, must be URI-compliant |
| AADTenantId| A GUID | Azure Tenant Id |
| APIMAADRegisteredAppClientId | A GUID  | Microsoft Entra ID application(client) ID |
| APIMAADRegisteredAppClientSecret | ********* | Microsoft Entra ID client secret |
| APIMUserAssignedManagedIdentityId | A GUID | APIM user assgined managed identiy |
| SAPOAuthClientID | OAUTH-JAMES  | SAP user |
| SAPOAuthClientSecret | ********* | SAP user password |
| SAPOAuthRefreshExpiry | 3600 | SAP token life time in seconds  |
| SAPOAuthScope| ZAPI_BUSINESS_PARTNER_0001 | SAP OAuth service scope |
| SAPOAuthServerAddressForTokenEndpoint | 10.0.0.79:44301 | SAP internal IP address : port number |
| User Email | james@contoso.com | The account used for SSO in PowerPlatfrom, the same Email linked to the SAP User |
| Odata Base URI | https://apim-sap-rn.azure-api.net/hao/sap/opu/odata/sap | Find it in the APIM, used in the connection |
| Microsoft Entra ID Resource URI (Application ID URI) | api://b0133ffc-4d2a-4251-bf5e-c159d41486ed | Find it in app registration, used in the connection| 
| SAP NetWeaver Enterprise Application Client ID | A GUID | Application ID of SAP NetWeaver Enterprise Applicatio in Azure| 


## Download local provider SAML metadata from SAP

To set up a trust relationship between SAP and Microsoft Entra ID using SAML 2.0, perform the followiung steps in SAP GUI as an SAP Basis administrator.

1. In SAP GUI, run transaction **SAML2** to open the SAP-client dependent SAML 2.0 configuration wizard.
   - If SAML 2.0 is not enabled, enable it first by following the guidance provided [here](https://help.sap.com/docs/SAP_COMMERCE_CRM/ceb87e45786c470494b445728cd1d8b8/3f4e8a6ca5024080a08a72640b13e75a.html).
   - Select the **Local Provider** tab, and save the provider name as AADSAPResource in the named values table.

1. Select **Metadata**, and then select **Download Metadata**. The SAP SAML metadata XML file will be uploaded to Microsoft Entra ID in a later step.

> [!NOTE]
> Microsoft Entra ID requires the value of **Provider Name** to be URI-compliant. If **Provider Name** is already set and isn't URI-compliant, don't change it without first consulting your SAP Basis team. Changing the **Provider Name** can break existing SAML configurations. The steps for changing it are beyond the scope of this article. Check with your SAML Basis team for guidance.

Consult [SAP's official documentation](https://help.sap.com/docs/SAP_NETWEAVER_750/f118a8960caf41808bd374e28a834f58/4ab4c93185376d61e10000000a42189c.html) for additional info.

## Import SAP SAML metadata XML into Microsoft Entra ID enterprise application

Perform the following steps as a Microsoft Entra ID admin in the [Azure portal](https://portal.azure.com).

1. Select **Microsoft Entra ID** > **Enterprise applications**.
   - Select **New application**.
   - Search for **SAP Netweaver**.
   - Enter a name for the enterprise application, select **Create**, and save the Application (client) ID as "SAP NetWeaver Enterprise Application Client ID" in the named values table.

1. Go to **Single sign-on** and select **SAML**.
   - Select **Upload metadata file** and upload the SAP SAML metadata XML file.
   - Select **Add**.
   - Verify the **Identifier (Entity ID)** matches the value of "AADSAPResource". This value is case-sensitive.
   - Update the **Reply URL (Assertion Consumer Service URL)** to the SAP OAuth token endpoint in the following format: https://<SAP server>:<port>/sap/bc/sec/oauth2/token?sap-client=100. Replace 100 with your SAP client ID.
   - Update the **Sign-on URL** to any URI-compliant value. This value is not used by SAP.
   - Select **Save**.

1. Under **Attributes & Claims**, select **Edit** and confirm that **Claim name Unique User Identifier (Name ID)** is set to **user.userprincipalname [nameid=format:emailAddress]**.

1. Under **SAML Certificates**, download the following items:
   - **Certificate (Base64)**.
   - **Federation Metadata XML**.
   
1. Under **Users and groups**, select **Add users/group**
   - Select **Users and groups**, search and select **ALL Company**, and then select **assgin**. 

## Configure Microsoft Entra ID as a trusted Identity Provider for OAuth 2.0 in SAP

1. In SAP GUI, run transaction **SAML2**.
   
   - Select the **Trusted Provider** tab, then chosose **Oauth2.0 Identify provider**.
   - Select **Add**, choose **Upload Metadata File**, and upload the **Federation Metadata XML** file and **Certificate (Base64)** downloaded from Microsoft Entra ID.
   - Save the configuration, select **Edit**, then select **Add**.
   - Select **Email** as the **supported NameID format**, then **save** and **enable** the provider.

## Create an SAP user to map the Microsoft Entra ID user (james@contoso.com) who will use single sign-on from Power Platform
1. In SAP GUI,  run transaction **SU01** to create a new user.
   
   - Enter a **Last Name** (for example, OAUTH-JAMES). Save this value as "SAPOAuthClientID" in the named values table.
   - Enter james@contoso.com as the Email address.
   - Select the **Logon Data** tab, set **User Type** to **System**, and create a password for the user. Save this password as "SAPOAuthClientSecret" in the named values table.

## Create an OAuth 2.0 client in SAP to allow Azure API Management to obtain tokens on behalf of users

Perform the following steps in SAP GUI as an SAP Basis administrator.

1. Run transaction *SOAUTH2*.

1. Select **Create**.

1. On the **Client ID** page:

    - For **OAuth 2.0 Client ID**, select the SAP system user: OAUTH-JAMES.
    - Enter a **Description**, and then select **Next**.

1. On the **Client Authentication** page, select **Next**.

1. On the **Grant Type Settings** page:

    - For **Trusted OAuth 2.0 IdP**, select the Microsoft Entra ID entry.
    - Select **Refresh Allowed**, and then select **Next**.

1. On the **Scope Assignment** page, select **Add**, choose the OData services that Azure API Management uses (e.g. ZAPI_BUSINESS_PARTNER_0001), and then select **Next**, save ZAPI_BUSINESS_PARTNER_0001 as "SAPOAuthScope" in the valued names table.

1. Select **Finish**.

For more information, see the [SAP documentation](https://help.sap.com/docs/SAP_NETWEAVER_750/3c4e8fc004cb4401a4fdd737f02ac2b9/ded106c66334432f963715cb0dc3165f.html) and [SAP's official documentation about SAP NETWEAVER](https://help.sap.com/docs/SAP_NETWEAVER_750/3c4e8fc004cb4401a4fdd737f02ac2b9/7e80a762e8b4441fb53b1f6d9bde4f4d.html) for additional details.

## Create a Microsoft Entra ID application that represents the Azure API Management resource

Create a Microsoft Entra ID application that grants access to the Microsoft Power Platform SAP OData connector. This application allows Azure API Management to exchange OAuth tokens for SAML tokens.

Perform the following steps as a Microsoft Entra ID administrator in the [Azure portal](https://portal.azure.com).

1. Select **Microsoft Entra ID** > **App registrations** > **New Registration**.
   - Enter a **Name**, and then select **Register**, save the client id as "APIMAADRegisteredAppClientId" in the named values table.
   - Go to **Certificates & secrets**, select **New client secret**, enter a **Description**, and select **Add**. Save the secret value as "APIMAADRegisteredAppClientSecret" in the named values table.

1. Configure API permissions..
   - Select **API Permissions** > **Add a permission**.
   - Select **Microsoft APIS** > **Microsoft Graph** > **Delegated permissions**, search for and select **openid** and then select **Add permissions**.
   - Select **Add a permission** again.
   - Select **APIs my organization uses** > search for the **SAP NetWeaver application** we created eariler, and select **user_impersonation**.
   - Return to the **API permissions** page and select **Grant admin consent** for both permissions.

1. Expose the API for Azure API Management.
   - Select **Expose an API**.
   - Next to **Application ID URI**, select **Add**, accept the default value, and select **Save**. Save this value as "Microsoft Entra ID Resource URI (Application ID URI)" in the named values table.
   - Select **Add a scope**.
       - Set **Scope name** to **user_impersonation**.
       - Set **Who can consent?** to **Admins and users**, and then select**Add scope**.
             
1. Authorize Azure API Management and the Microsoft Power Platform SAP OData connector.
   - On the **Expose an API** page, select **Add a client application**.
   - Enter the "SAP NetWeaver Enterprise Application Client ID" from named values table, check **Authorized sopes**, and then select **Add application**.
   - Select **Add a client application** again.
   - Enter "6bee4d13-fd19-43de-b82c-4b6401d174c3" as the **Client ID**, check **Authorized sopes**, and then select **Add application**.
      - This is the client id of the Power Platform SAP OData connector.

## Configure Azure API Management

Import the SAP OData XML metadata into your Azure API Management instance. Then, apply an Azure API Management policy to convert the tokens.

1. Open your Azure API Management instance and follow [the steps](/azure/api-management/sap-api?tabs=odata) to create an SAP OData API.

1. Under *APIs*, select **Named values**.

1. Add the following key/value pairs:


> [!NOTE]
> Be aware that the settings differ slightly for SAP SuccessFactors. For more information, see the [Azure API Management policy for SAP SuccessFactors](https://github.com/Azure/api-management-policy-snippets/blob/master/examples/Request%20OAuth2%20access%20token%20from%20SuccessFactors%20using%20AAD%20JWT%20token.xml).

## Apply the Azure API Management token policy

Use Azure API Management policies to convert a Microsoft Entra ID issued token to one that SAP NetWeaver accepts. This is done using the OAuth2SAMLBearer flow. See SAP's [official documentation](https://help.sap.com/docs/SAP_NETWEAVER_750/3c4e8fc004cb4401a4fdd737f02ac2b9/cdb122d5b0784c77bf1bcce17f730e74.html) for more information.

1. Copy the [Azure API Management policy](https://github.com/Azure/api-management-policy-snippets/blob/master/examples/Request%20OAuth2%20access%20token%20from%20SAP%20using%20AAD%20JWT%20token.xml) from Microsoft's official GitHub page.

1. Open the [Azure portal](https://portal.azure.com).

1. Go to your Azure API Management resource.

1. Select **APIs**, and then select the OData API that you created.

1. Select **All operations**.

1. Under *Inbound processing*, select **Policies </>**.

1. Delete the **existing policy** and paste the **policy that you copied**.

1. Select **Save**.

## Related content

- [SAP OData connector](/connectors/sapodata/)
- [SAP OData connector now supports OAuth2 and SAP Principal Propagation](https://community.powerplatform.com/blogs/post/?postid=c6a609ab-3556-ef11-a317-6045bda95bf0) | Power Automate community blog
- [Azure API Management policy for SAP SuccessFactors](https://github.com/Azure/api-management-policy-snippets/blob/master/examples/Request%20OAuth2%20access%20token%20from%20SuccessFactors%20using%20AAD%20JWT%20token.xml) | GitHub
- [SAP OData connector for SAP SuccessFactors](https://community.sap.com/t5/technology-blogs-by-members/perform-sap-principal-propagation-with-microsoft-entra-id-for-sap/ba-p/13860532) | SAP community blog
- The SAP Business Accelerator Hub also offers content related to the SAP integration suite policy for SuccessFactors and NetWeaver. You must have an SAP account to access this content.
