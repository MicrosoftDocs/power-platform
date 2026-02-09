---
title: Set up Microsoft Entra ID for SSO to SAP in OData connector
description: Learn how to set up SAP and Azure API Management so that users can access SAP and make OData calls in Microsoft Power Platform using their Microsoft Entra ID.
author: haowusky
ms.author: hawu1
contributors:
  - tverhasselt
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - Wrighttyler
  - EllenWehrle
  - MartinPankraz
  - haowusky
ms.reviewer: ellenwehrle
ms.service: power-platform
ms.subservice: sap
ms.topic: how-to
ms.date: 02/05/2026
search.audienceType:
  - admin
# Customer intent: As an administrator, I want to learn how to set up Microsoft Entra ID, Azure API Management, and SAP for SSO from SAP OData connector so my users can access SAP data in Power Platform solutions without having to sign in multiple times to multiple services.
---

# Set up Microsoft Entra ID, Azure API Management, and SAP for SSO from SAP OData connector

You can set up the SAP OData connector for Power Platform to use Microsoft Entra ID credentials for single sign-on (SSO) to SAP. By using this method, your users can access SAP data in Power Platform solutions without signing in multiple times to multiple services. The solution respects their authorizations and assigned roles in SAP.

This article walks you through the process, including setting up a trust between SAP and Microsoft Entra ID and configuring Azure API Management to convert the Microsoft Entra ID OAuth token to a SAML token that's used to make OData calls to SAP.

:::image type="content" source="media/entra-id-apim-oauth/traffic_flow.jpg" alt-text="Solution diagram that shows the traffic flow from Power Platform and Copilot to SAP through Azure API Management." lightbox="media/entra-id-apim-oauth/traffic_flow.jpg":::

For additional insights and context into the setup process, see the blog post [Hurray! SAP OData connector now supports OAuth2 and SAP Principal Propagation](https://community.powerplatform.com/blogs/post/?postid=c6a609ab-3556-ef11-a317-6045bda95bf0).

## Prerequisites

Before you begin the setup process, make sure you have the following resources in place:

- SAP instance
- Microsoft Entra ID
- Azure API Management (APIM) resource
- Admin privileges:
  - SAP Basis admin
  - [Microsoft Entra ID – cloud or app admin](/entra/identity/role-based-access-control/permissions-reference)


## Named values

This section lists named values to make the examples easier to follow. These values are reused throughout the article and referenced in later sections. When following the examples in this article, be sure to replace the named values with your own values.

| Name | Sample value | Description |
|------|-------------|-------------|
| `AADSAPResource` | `https://SAP_SAML_Client100` | SAP local provider name; must be URI-compliant |
| `AADTenantId`| :::no-loc text="A GUID"::: | Azure Tenant Id |
| `APIMAADRegisteredAppClientId` | :::no-loc text="A GUID"::: | Microsoft Entra ID application (client) ID |
| `APIMAADRegisteredAppClientSecret` |  | Microsoft Entra ID client secret |
| `APIMUserAssignedManagedIdentityId` | :::no-loc text="A GUID"::: | :::no-loc text="APIM"::: user-assigned managed identiy client ID |
| `SAPOAuthClientID` | `OAUTH-JAMES`  | SAP user |
| `SAPOAuthClientSecret` | | SAP user password |
| `SAPOAuthRefreshExpiry` | :::no-loc text="3600"::: | SAP token lifetime in seconds  |
| `SAPOAuthScope`| `ZAPI_BUSINESS_PARTNER_0001` | SAP OAuth service scope |
| `SAPOAuthServerAddressForTokenEndpoint` | `10.0.0.79:44301` | SAP internal IP address: port number |
| `UserEmail` | :::no-loc text="james@contoso.com"::: | The account used for SSO in Power Platform; the same email linked to the SAP User |
| :::no-loc text="OData Base URI"::: | `https://apim-sap-rn.azure-api.net/hao/sap/opu/odata/sap` | :::no-loc text="APIM":::-based URL used in the connections|
| :::no-loc text="Microsoft Entra ID Resource URI (Application ID URI)"::: | `api://b0133ffc-4d2a-4251-bf5e-c159d41486ed` | Microsoft Entra ID application ID URI, used in the connection| 
| :::no-loc text="SAP NetWeaver Enterprise Application Client ID"::: | :::no-loc text="A GUID"::: | Application ID of SAP NetWeaver Enterprise Application in Azure| 

## Step 1: Download local provider SAML metadata from SAP

Set up a trust relationship between SAP and Microsoft Entra ID using :::no-loc text="SAML 2.0":::. To get started, download the **SAP :::no-loc text="SAML 2.0"::: metadata XML file**. As an SAP Basis admin, take these steps in SAP GUI:

1. Run the transaction code `SAML2` to open the SAP client-dependent :::no-loc text="SAML 2.0"::: configuration wizard. If you need to enable :::no-loc text="SAML 2.0":::, go to the [SAP Help Portal](https://help.sap.com/docs/SAP_COMMERCE_CRM/ceb87e45786c470494b445728cd1d8b8/3f4e8a6ca5024080a08a72640b13e75a.html).
1. Select the **Local Provider** tab, and save the *SAP local provider name*, `AADSAPResource`, by following the sample value guidance in the [named values table](#named-values). It must be URI-compliant.
1. Select **Metadata** and then select **Download Metadata**. You'll upload the **SAP SAML metadata XML file** to Microsoft Entra ID in a later step.

> [!IMPORTANT]
> Microsoft Entra ID requires that the **value of *:::no-loc text="Provider Name":::* be URI-compliant**. If :::no-loc text="Provider Name"::: is already set but isn't URI-compliant, don't change it without first consulting your SAP Basis team. Changing the value of :::no-loc text="Provider Name"::: can break existing SAML configurations. The steps for changing it are beyond the scope of this article. Check with your SAP SAML Basis team for guidance.

For more information, see [SAP's official documentation](https://help.sap.com/docs/SAP_NETWEAVER_750/f118a8960caf41808bd374e28a834f58/4ab4c93185376d61e10000000a42189c.html).

## Step 2: Import SAP SAML metadata XML into Microsoft Entra ID enterprise application

 Create a Microsoft Entra ID enterprise application and import the **SAP :::no-loc text="SAML 2.0"::: metadata XML file**. As a Microsoft Entra ID administrator, take these steps in the [Azure portal](https://portal.azure.com):

1. Create Microsoft Entra ID enterprise application:

    1. Search for and select **Microsoft Entra ID**.
    1. In the left navigation pane, expand **Manage** > **Enterprise applications**.
    1. Select **New application**.
    1. Search for **SAP Netweaver**.
    1. Enter a *name* for the enterprise application, select **Create**, and save the *Application (client) ID* as **SAP NetWeaver Enterprise Application Client ID** as seen in the [named values table](#named-values).

1. Import the **SAP :::no-loc text="SAML 2.0"::: metadata XML file**:

    1. Go to **Single sign-on** and select **SAML**.
    1. Select **Upload metadata file** and upload the *SAP SAML metadata XML file*.
    1. Select **Add**.
    1. Verify that the **Identifier (Entity ID)** matches the value of `AADSAPResource`. This value is case-sensitive.
    1. Update the **Reply URL (Assertion Consumer Service URL)** to the SAP OAuth token endpoint in the following format: `https://<SAP server>:<port>/sap/bc/sec/oauth2/token?sap-client=<client ID>`.
    1. Update the **Sign-on URL** to any URI-compliant value. SAP doesn't use this value.
    1. Select **Save**.

1. Confirm the correct attribute is set:

    1. Go to the **Attributes & Claims** section.
    1. Select **Edit**. 
    1. Confirm that **Claim name Unique User Identifier (Name ID)** is set to `user.userprincipalname` [`nameid`="{email address}"].

1. Download the certificates:

   1. Go to the **SAML Certificates** section.
   1. Select the *download links* for:

       - **Certificate (Base64)**.
       - **Federation Metadata XML**.
   
1. Add users and groups:

    1. Go to the **Users and groups** section.
    1. Select **Add users/group**.
    1. Select **Users and groups**.
    1. Search and select **ALL Company** and then select **assign**. 

## Step 3: Configure Microsoft Entra ID as a trusted identity provider for OAuth 2.0 in SAP

Configure SAP to allow Microsoft Entra ID to issue tokens for SAP OAuth 2.0 authentication. As an SAP Basis admin, take these steps in SAP GUI:

1. Run transaction `SAML2`.
1. Select the **Trusted Provider** tab, and then choose **Oauth2.0 Identify provider**.
1. Select **Add**, choose **Upload Metadata File**, and upload the **Federation Metadata XML** file and the **Certificate (Base64)** file that you downloaded from Microsoft Entra ID.
1. Save the configuration, select **Edit**, and then select **Add**.
1. Select **Email** as the **supported NameID format**, then **save** and **enable** the provider.

## Step 4: Create and map an SAP user to the Microsoft Entra ID user

Create and map an SAP user that maps to the Microsoft Entra ID user :::no-loc text="(james@contoso.com)"::: who uses SSO from Power Platform. As an SAP Basis admin, take these steps in SAP GUI:

1. Run transaction **SU01** to create a new user.
1. Enter a **Last Name** (for example, OAUTH-JAMES). Save this value as "SAPOAuthClientID" in the named values table.
1. Enter james@contoso.com as the Email address.
1. Select the **Logon Data** tab, set **User Type** to **System**.
1. Create a password for the user. Save this password as `SAPOAuthClientSecret` as seen in the named values table.

## Step 5: Create an OAuth 2.0 client in SAP

Create an OAuth 2.0 client in SAP so Azure API Management can get tokens on behalf of users. As an SAP Basis admin, follow these steps in SAP GUI:

1. Run transaction `SOAUTH2`.
1. Select **Create**.
1. On the **Client ID** page:

    1. Go to **OAuth 2.0 Client ID** and select the SAP system user: `OAUTH-JAMES`.
    1. Enter a description, and then select **Next**.
1. On the **Client Authentication** page, select **Next**.
1. On the **Grant Type Settings** page:

    - Go to **Trusted OAuth 2.0 IdP** and select the *Microsoft Entra ID* entry.
    - Select **Refresh Allowed**, and then select **Next**.

1. On the **Scope Assignment** page, select **Add** and choose the OData services that Azure API Management uses (for example, `ZAPI_BUSINESS_PARTNER_0001`), and then select **Next**. Save `ZAPI_BUSINESS_PARTNER_0001` as `SAPOAuthScope` as seen in the [named values table](#named-values).
    
1. Select **Finish**.

For more information, see the [SAP documentation](https://help.sap.com/docs/SAP_NETWEAVER_750/3c4e8fc004cb4401a4fdd737f02ac2b9/ded106c66334432f963715cb0dc3165f.html) and [SAP's official documentation about SAP NETWEAVER](https://help.sap.com/docs/SAP_NETWEAVER_750/3c4e8fc004cb4401a4fdd737f02ac2b9/7e80a762e8b4441fb53b1f6d9bde4f4d.html) for additional details.

## Step 6: Register the Microsoft Entra ID application

Register the Microsoft Entra ID application that represents the Azure API Management resource and grants access to the Microsoft Power Platform SAP OData connector. By using this application, Azure API Management can exchange OAuth tokens for SAML tokens.

As a Microsoft Entra ID administrator, take these steps in the [Azure portal](https://portal.azure.com):

1. Name and register the application:
    1. Select **Microsoft Entra ID** > **App registrations** > **New Registration**.
    1. Enter a **Name**, and then select **Register**. Save the client ID as `APIMAADRegisteredAppClientId` as seen in the named values table.
    1. Go to **Certificates & secrets**, select **New client secret**, enter a description, and select **Add**. Save the secret value as `APIMAADRegisteredAppClientSecret` as seen in the named values table.

1. Configure API permissions:
   1. Select **API Permissions** > **Add a permission**.
   1. Select **Microsoft APIS** > **Microsoft Graph** > **Delegated permissions**, search for and select **openid**, and then select **Add permissions**.
   1. Select **Add a permission** again.
   1. Select **APIs my organization uses** > search for the **SAP NetWeaver application** you created earlier, and select **user_impersonation**.
   1. Return to the **API permissions** page and select **Grant admin consent** for both permissions.

1. Expose the API for Azure API Management:
   1. Select **Expose an API**.
   1. Next to **Application ID URI**, select **Add**, accept the default value, and select **Save**. Save this value as "Microsoft Entra ID Resource URI (Application ID URI)" in the named values table.
   1. Select **Add a scope** and take these steps:

      1. Set **Scope name** to **user_impersonation**.
      1. Set **Who can consent?** to **Admins and users**, and then select**Add scope**.
             
1. Authorize Azure API Management and the Microsoft Power Platform SAP OData connector:

   1. On the **Expose an API** page, select **Add a client application**.
   1. Enter the "SAP NetWeaver Enterprise Application Client ID" from named values table, check **Authorized sopes**, and then select **Add application**.
   1. Select **Add a client application** again.
   1. Enter `6bee4d13-fd19-43de-b82c-4b6401d174c3` as the **Client ID**, check **Authorized scopes**, and then select **Add application**. **This is the client ID of the Power Platform SAP OData connector.**
        
## Step 7: Create a user-assigned managed identity for Azure API Management

Create a user-assigned managed identity and assign it to your Azure API Management instance.
By using a user-assigned managed identity with Azure API Management, the platform handles authentication automatically, eliminating the need to manage or rotate `APIMAADRegisteredAppClientSecret`.

As a Microsoft Entra ID administrator, take the following steps in the [Azure portal](https://portal.azure.com):

1. Create a user-assigned managed identity:

    1. Select **Create a resource** > search for and select **User Assigned Managed Identity** by Microsoft
    1. Enter the name and resource group, and then select **Review + create**. Save the **Client ID** as `APIMUserAssignedManagedIdentityId` as seen in the named values table.

1.  Assign the managed identity to Azure API Management:

    1. Open your Azure API Management instance.
    1. Go to **Security** > **Managed identities**.
    1. Select the **User assigned** tab, select **Add**, choose the managed identity you created, and then select **Add**.

## Step 8: Configure Azure API Management

Import the SAP OData metadata into Azure API Management, and then apply an API Management policy to handle token conversion. As a Microsoft Entra ID administrator, take the following steps in the [Azure portal](https://portal.azure.com):

1. Retrieve the SAP OData metadata:

   1. Call the SAP service metadata endpoint. For example: `https://<SAPendpoint>:<port>/sap/opu/odata/sap/API_BUSINESS_PARTNER/$metadata`. The exact URL depends on your SAP service configuration.
   1. Save the response as an **SAP OData metadata XML** file.
   
1. Import the OData API into Azure API Management:

   1. Open your Azure API Management instance.
   1. Select **APIs** > **Add API** > **OData**.
   1. Upload the **SAP OData metadata XML** file.
   1. Enter a name and the API URL suffix. For example, `jms/sap/opu/odata/sap`.
   1. Save the **Base URL** as "Odata Base URI" in the named values table.
   1. Under **All APIs**, verify that your API (for example, API_BUSINESS_PARTNER_Entities) appears and that the entity sets and functions are listed.

1. Configure named values:

   1. In **APIs**, select **Named values**.
   1. Add the following key/value pairs that are in the [named values table](#named-values):
     `AADSAPResource`, `AADTenantId`, `APIMAADRegisteredAppClientId`, `APIMAADRegisteredAppClientSecret`, `APIMUserAssignedManagedIdentityId`, `SAPOAuthClientID`, `SAPOAuthClientSecret`, `SAPOAuthRefreshExpiry`, `SAPOAuthScope`, `SAPOAuthServerAddressForTokenEndpoint`.

> [!NOTE]
> Be aware that the settings differ slightly for SAP SuccessFactors. For more information, see [Azure API Management policy for SAP SuccessFactors](https://github.com/Azure/api-management-policy-snippets/blob/master/examples/Request%20OAuth2%20access%20token%20from%20SuccessFactors%20using%20AAD%20JWT%20token.xml).

## Step 9: Apply the Azure API Management token policy

Use Azure API Management policies to convert a Microsoft Entra ID–issued token into a token accepted by SAP NetWeaver. For more information, see [official SAP documentation](https://help.sap.com/docs/SAP_NETWEAVER_750/3c4e8fc004cb4401a4fdd737f02ac2b9/cdb122d5b0784c77bf1bcce17f730e74.html).

As a Microsoft Entra ID administrator, take the following steps:

1. Copy the Azure API Management policy from the Microsoft GitHub repository: [Azure API Management policy](https://github.com/Azure/api-management-policy-snippets/blob/master/examples/Request%20OAuth2%20access%20token%20from%20SAP%20using%20AAD%20JWT%20token.xml).

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Open your Azure API Management resource.

1. Select **APIs**, and then select the OData API you created earlier.

1. Select **All operations**.

1. In the **Inbound processing** section, select **Policies </>**.

1. Replace the *existing policy* with the **policy that you copied**.

1. Select **Save**.

## Related content

- [SAP OData connector](/connectors/sapodata/)
- [SAP OData connector now supports OAuth2 and SAP Principal Propagation](https://community.powerplatform.com/blogs/post/?postid=c6a609ab-3556-ef11-a317-6045bda95bf0) | Power Automate community blog
- [Azure API Management policy for SAP SuccessFactors](https://github.com/Azure/api-management-policy-snippets/blob/master/examples/Request%20OAuth2%20access%20token%20from%20SuccessFactors%20using%20AAD%20JWT%20token.xml) | GitHub
- [SAP OData connector for SAP SuccessFactors](https://community.sap.com/t5/technology-blogs-by-members/perform-sap-principal-propagation-with-microsoft-entra-id-for-sap/ba-p/13860532) | SAP community blog
- The SAP Business Accelerator Hub also offers content related to the SAP integration suite policy for SuccessFactors and NetWeaver. You must have an SAP account to access this content.
