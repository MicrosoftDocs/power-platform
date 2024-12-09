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
ms.reviewer: ellenwehrle
ms.service: power-platform
ms.subservice: sap
ms.custom: ignite-2024
ms.topic: how-to
ms.date: 12/09/2024
# Customer intent: As an administrator, I want to learn how to set up Microsoft Entra ID, Azure API Management, and SAP for SSO from SAP OData connector so my users can sign
---

# Set up Microsoft Entra ID, Azure API Management, and SAP for SSO from SAP OData connector

You can set up the Power Platform SAP OData connector to use Microsoft Entra ID credentials for single sign-on (SSO) to SAP. Your users can access SAP data and run SAP Remote Function Calls (RFCs) in Power Platform solutions without having to sign in multiple times to multiple services. This article walks you through the process, including setting up a trust between SAP and Microsoft Entra ID and configuring Azure API Management to convert the Microsoft Entra ID OAuth token to a SAML token that's used to make OData calls to SAP.

:::image type="content" source="media/entra-id-apim-oauth/traffic_flow.jpg" alt-text="Solution diagram that shows the traffic flow from Power Platform and Copilot to SAP through Azure API Management." lightbox="media/entra-id-apim-oauth/traffic_flow.jpg":::

You can also gain additional insights from the blog post, [Hurray! SAP OData connector now supports OAuth2 and SAP Principal Propagation](https://community.powerplatform.com/blogs/post/?postid=c6a609ab-3556-ef11-a317-6045bda95bf0).

## Prerequisites

- SAP instance
- Azure API Management resource

## Set up SAP as a local SAML provider

To set up a trust relationship between SAP and Microsoft Entra ID using SAML 2.0, first set up SAP as a SAML provider.

Take these steps as an SAP Basis admin in SAP GUI.

1. To start the SAML 2.0 wizard, enter *SAML2* in the Command field.

1. Select **Enable SAML 2.0 Support** if it isn't already selected.

1. Enter a URI-compliant **Provider Name**.

    Microsoft Entra ID requires this value to be URI-compliant. If **Provider Name** is already set and isn't URI-compliant, don't change it without first consulting your SAP Basis team. Changing the **Provider Name** can break existing SAML configurations. The steps for changing it are beyond the scope of this article. Check with your SAML Basis team for guidance.

1. Select **Metadata**, and then select **Download Metadata**.

    You'll upload the SAP SAML metadata to Microsoft Entra ID in a later step.

## Create a Microsoft Entra ID enterprise application

With the SAP side of the trust relationship in place, create the other side, a Microsoft Entra ID enterprise application for the SAP system.

Perform these steps as a Microsoft Entra ID admin in the [Azure portal](https://portal.azure.com).

1. Select **Microsoft Entra ID** > **Enterprise applications**.

1. Select **New application**.

1. Search for **SAP Netweaver**.

1. Give the enterprise application a name, and then select **Create**.

1. Go to **Single sign-on** and select **SAML**.

1. Select **Upload metadata file** and select the metadata file that you downloaded from SAP.

1. Select **Add**.

1. Change the **Reply URL (Assertion Consumer Service URL)** to the SAP OAuth token endpoint.

    The SAP OAuth token endpoint is the URL that Azure API Management uses to obtain tokens on behalf of users. The URL is in the format `https://<SAP server>:<port>/sap/bc/sec/oauth2/token`.

1. Change the **Sign-on URL** to a URI-compliant value.

    This parameter isn't used and can be set to any value that's URI-compliant.

1. Select **Save**.

1. Under **Attributes & Claims**, select **Edit**.

1. Confirm that **Claim name Unique User Identifier (Name ID)** is set to **user.userprincipalname [nameid=format:emailAddress]**.

1. Under **SAML Certificates**, select **Download** for **Certificate (Base64)** and **Federation Metadata XML**.

## Set up SAP to trust Microsoft Entra ID

With both sides of the trust relationship in place, set up SAP to trust the Microsoft Entra ID enterprise application.

Perform these steps as an SAP Basis admin in SAP GUI.

1. Run the transaction **SAML2**.

1. Select the **Trusted Providers** tab.

1. From the *Show: dropdown list*, select **OAuth 2.0 Identity Providers**.

1. Select **Add**, and then select **Upload Metadata File**.

1. Select the **metadata XML file** that was downloaded from Microsoft Entra ID, and then select **Next**.

1. Select the **base64 certificate** that was downloaded from Microsoft Entra ID, and then select **Next**.

1. Select **Finish**.

1. In the *List of Trusted Providers*, select the **Microsoft Entra ID entry**.

1. Under *Supported NameID Formats*, select **Add**.

1. Select **Email**, select **OK**, and then select **Save**.

1. Select **Enable**, and then select **OK**.

## Create a Microsoft Entra ID application to act as a client

Set up a Microsoft Entra ID application that grants access to the Microsoft Power Platform SAP OData app registration. This application allows an Azure API Management resource to convert OAuth tokens to SAML ones.

Perform these steps as a Microsoft Entra ID admin in the [Azure portal](https://portal.azure.com).

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

1. When a Microsoft Entra ID enterprise application is created, it creates a matching app registration. Find the **App registration** that matches the *Microsoft Entra ID enterprise application* that you created.

1. Select **Expose an API** > **Add a client application**.

1. Paste the **Application (client) ID** into **Client ID**.

1. Select the **user_impersonation** scope, and then select **Add application**.

## Configure SAP OAuth

Create an OAuth 2.0 client in SAP that allows Azure API Management to obtain tokens on behalf of users.

Perform these steps as an SAP Basis admin in SAP GUI.

1. Run the transaction */nsoauth2*.

1. Select **Create**.

1. On the **Client ID** page:

    - For **OAuth 2.0 Client ID**, select an SAP system user.
    - Enter a **Description**, and then select **Next**.

1. On the **Client Authentication** page, select **Next**.

1. On the **Grant Type Settings** page:

    - For **Trusted OAuth 2.0 IdP**, select the Microsoft Entra ID entry.
    - Select **Refresh Allowed**, and then select **Next**.

1. On the *Scope Assignment* page, select **Add**, select the **OData services** that Azure API Management uses, and then select **Next**.

1. Select **Finish**.

## Configure Azure API Management

Convert the SAP OData XML metadata to an OpenAPI JSON specification and upload it to Azure API Management. Then, apply an Azure API Management policy to convert the tokens.

1. In your browser, go to the SAP OData metadata XML and save this file to your desktop.

1. Use [OData Transformer](https://convert.odata-openapi.net/) to convert your OData metadata XML file to an OpenAPI JSON specification. Save this file to your desktop.

1. Open the [Azure portal](https://portal.azure.com) and go to your Azure API management resource.

1. Select **APIs** > **Add API**.

1. In the **Create from definition** dropdown list, select **OpenAPI**.

1. Select **Select a file**, and then select the **OpenAPI JSON specification file** that you saved to your desktop.

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
| SapOdataFirstParty | Microsoft Power Platform SAP OData connector first-party application GUID. This value should always be *6bee4d13-fd19-43de-b82c-4b6401d174c3* |

## Apply the Azure API Management token policy

Use Azure API Management policies to convert Microsoft Entra ID tokens into SAML tokens that SAP accepts.

1. Copy the example **[Azure API Management policy](https://github.com/Azure/api-management-policy-snippets/blob/master/examples/Request%20OAuth2%20access%20token%20from%20SAP%20using%20AAD%20JWT%20token.xml)** from Microsoft's GitHub page.
1. Open the **[Azure portal](https://portal.azure.com)**.

1. Go to your Azure API Management resource.

1. Select **APIs**, and then select the API that you created by uploading the **OpenAPI JSON specification file**.

1. Select **All operations**.

1. Under *Inbound processing*, select **Policies </>**.

1. Delete the **existing policy** and paste the **policy that you copied**.

1. Select **Save**.

## Related content

- [SAP OData connector](/connectors/sapodata/)
- [SAP OData connector now supports OAuth2 and SAP Principal Propagation](https://community.powerplatform.com/blogs/post/?postid=c6a609ab-3556-ef11-a317-6045bda95bf0) | Power Automate community blog
