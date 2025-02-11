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

## Download local provider SAML metadata from SAP

To set up a trust relationship between SAP and Microsoft Entra ID using SAML 2.0, first download the metadata xml file from SAP.

Perform these steps as an SAP Basis admin in SAP GUI.

1. In SAP GUI, run the transaction **SAML2** to open the relevant SAP-client dependent wizard and choose the **Local Provider** tab.

1. Select **Metadata**, and then select **Download Metadata**. You'll upload the SAP SAML metadata to Microsoft Entra ID in a later step.

1. Take note of the URI-compliant **Provider Name**.

> [!NOTE]
> Microsoft Entra ID requires this value to be URI-compliant. If **Provider Name** is already set and isn't URI-compliant, don't change it without first consulting your SAP Basis team. Changing the **Provider Name** can break existing SAML configurations. The steps for changing it are beyond the scope of this article. Check with your SAML Basis team for guidance.

Consult [SAP's official documentation](https://help.sap.com/docs/SAP_NETWEAVER_750/f118a8960caf41808bd374e28a834f58/4ab4c93185376d61e10000000a42189c.html) for additional info.

## Import SAP metadata into Microsoft Entra ID enterprise application

Perform these steps as a Microsoft Entra ID admin in the [Azure portal](https://portal.azure.com).

1. Select **Microsoft Entra ID** > **Enterprise applications**.

1. Select **New application**.

1. Search for **SAP Netweaver**.

1. Give the enterprise application a name, and then select **Create**.

1. Go to **Single sign-on** and select **SAML**.

1. Select **Upload metadata file** and select the metadata file that you downloaded from SAP.

1. Select **Add**.

1. Change the **Reply URL (Assertion Consumer Service URL)** to the SAP OAuth token endpoint. The URL is in the format `https://<SAP server>:<port>/sap/bc/sec/oauth2/token`.

1. Change the **Sign-on URL** to a URI-compliant value. This parameter isn't used and can be set to any value that's URI-compliant.

1. Select **Save**.

1. Under **Attributes & Claims**, select **Edit**.

1. Confirm that **Claim name Unique User Identifier (Name ID)** is set to **user.userprincipalname [nameid=format:emailAddress]**.

1. Under **SAML Certificates**, select **Download** for **Certificate (Base64)** and **Federation Metadata XML**.

## Configure Microsoft Entra ID as a trusted Identity Provider for OAuth 2.0 in SAP

1. Follow the steps outlined in the [Microsoft Entra ID documentation for SAP NetWeaver and OAuth2 section](/entra/identity/saas-apps/sap-netweaver-tutorial#configure-sap-netweaver-for-oauth).

1. Come back to this article once the OAuth2 client is created in SAP.

See [SAP's official documentation about SAP NETWEAVER](https://help.sap.com/docs/SAP_NETWEAVER_750/3c4e8fc004cb4401a4fdd737f02ac2b9/7e80a762e8b4441fb53b1f6d9bde4f4d.html) for additional details. Note, you must be an SAP administrator to access the information.

## Create a Microsoft Entra ID application that represents the Azure API Management resource

Set up a Microsoft Entra ID application that grants access to the Microsoft Power Platform SAP OData connector. This application allows an Azure API Management resource to convert OAuth tokens to SAML ones.

Take these steps as a Microsoft Entra ID admin in the [Azure portal](https://portal.azure.com).

1. Select **Microsoft Entra ID** > **App registrations** > **New Registration**.

1. Enter a **Name**, and then select **Register**.

1. Select **Certificates & secrets** > **New client secret**.

1. Enter a **Description**, and then select **Add**.

1. Copy and save this *secret* somewhere secure.

1. Select **API Permissions** > **Add a permission**.

1. Select **Microsoft Graph** > **Delegated permissions**.

1. Search for and select **openid**.

1. Select **Add permissions**.

1. Select **Authentication** > **Add a platform** > **Web**.

1. Set **Redirect URIs** to `https://localhost:44326/signin-oidc`.

1. Select **Access tokens** and **ID tokens**, and then select **Configure**.

1. Select **Expose an API**.

1. Next to *Application ID URI*, select **Add**.

1. Accept the **default value** and select **Save**.

1. Select **Add a scope**.

1. Set **Scope name** to *user_impersonation*.

1. Set *Who can consent?* to **Admins and users**.

1. Select **Add a scope**.

1. Copy the **Application (client) ID**.

## Authorize the Azure API Management resource to access SAP Netweaver using the Microsoft Entra ID enterprise application

1. When a Microsoft Entra ID enterprise application is created, it creates a matching app registration. Find the **App registration** that matches the Microsoft Entra ID enterprise application that you created for SAP NetWeaver.

1. Select **Expose an API** > **Add a client application**.

1. Paste the **Application (client) ID** of the Microsoft Entra ID app registration of your Azure API Management instance into **Client ID**.

1. Select the **user_impersonation** scope, and then select **Add application**.

## Authorize the Microsoft Power Platform SAP OData connector to access APIs exposed by Azure API Management

1. In the Microsoft Entra ID app registration of Azure API Management, select **Expose an API** > Add the client id of the Power Platform SAP OData connector `6bee4d13-fd19-43de-b82c-4b6401d174c3` under authorized client applications.

1. Select the **user_impersonation** scope, and then select **Save**.

## Configure SAP OAuth

Create an OAuth 2.0 client in SAP that allows Azure API Management to obtain tokens on behalf of users.

See [SAP's official documentation](https://help.sap.com/docs/SAP_NETWEAVER_750/3c4e8fc004cb4401a4fdd737f02ac2b9/ded106c66334432f963715cb0dc3165f.html) for details.

Perform these steps as an SAP Basis admin in SAP GUI.

1. Run the transaction *SOAUTH2*.

1. Select **Create**.

1. On the **Client ID** page:

    - For **OAuth 2.0 Client ID**, select an SAP system user.
    - Enter a **Description**, and then select **Next**.

1. On the **Client Authentication** page, select **Next**.

1. On the **Grant Type Settings** page:

    - For **Trusted OAuth 2.0 IdP**, select the Microsoft Entra ID entry.
    - Select **Refresh Allowed**, and then select **Next**.

1. On the **Scope Assignment** page, select **Add**, select the OData services that Azure API Management uses (e.g. ZAPI_BUSINESS_PARTNER_0001), and then select **Next**.

1. Select **Finish**.

## Configure Azure API Management

Import the SAP OData XML metadata into your Azure API Management instance. Then, apply an Azure API Management policy to convert the tokens.

1. Open your Azure API Management instance and follow [the steps](/azure/api-management/sap-api?tabs=odata) to create an SAP OData API.

1. Under *APIs*, select **Named values**.

1. Add the following key/value pairs:

| Key                                  | Value |
| ------------------------------------ | ----- |
| AADSAPResource                       | SAP local provider URI |
| AADTenantId                          | Your tenant GUID |
| APIMAADRegisteredAppClientId         | Microsoft Entra ID Application GUID |
| APIMAADRegisteredAppClientSecret     | Client secret from earlier step |
| SAPOAuthClientID                     | SAP system user |
| SAPOAuthClientSecret                 | SAP system user password |
| SAPOAuthRefreshExpiry                | Token refresh expiration |
| SAPOAuthScope                        | OData scopes chosen during SAP OAuth configuration |
| SAPOAuthServerAddressForTokenEndpoint | SAP endpoint for Azure API Management to call to perform the token acquisition |

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
