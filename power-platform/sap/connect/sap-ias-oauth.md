---
title: Set up OAuth 2.0 authentication for the SAP OData connector
description: Learn how to set up generic OAuth 2.0 authentication with SAP Cloud Identity Services (Identity Authentication) so users can sign in interactively and make OData calls to SAP from Microsoft Power Platform.
author: haowusky
ms.author: hawu1
contributors:
  - tverhasselt
  - microsoft-dustin
  - Wrighttyler
  - EllenWehrle
  - MartinPankraz
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 09/14/2026
ms.service: power-platform
ms.subservice: sap
# Customer intent: As an administrator, I want to set up OAuth 2.0 authentication for the SAP OData connector so users can sign in with their own identity provider and access SAP data using single sign-on (SSO).
---

# Set up OAuth 2.0 authentication for the SAP OData connector

> [!NOTE]
> The **OAuth 2.0** authentication method for the SAP OData connector is in **preview**.

This article walks you through how to set up the **OAuth 2.0** authentication method in the SAP OData connector for Power Platform. With this method, the connector authenticates against a generic OAuth 2.0 identity provider by using the [authorization code flow](https://oauth.net/2/grant-types/authorization-code/). Users sign in interactively, and the connector uses the resulting access token as a bearer token on OData calls to SAP.

This method is a good fit when you want to broker sign-in through **SAP Cloud Identity Services – Identity Authentication** (also known as SAP IAS), which can federate the actual user sign-in to your corporate identity provider, such as Microsoft Entra ID. Unlike the [Microsoft Entra ID with Azure API Management](entra-id-apim-oauth.md) method, this method doesn't require Azure API Management (APIM) or a SAML token exchange policy. You provide the identity provider's authorization URL, token URL, client ID, and client secret directly in the connection.

This method is available for cloud (non-gateway) connections.

## Prerequisites

Before you begin the setup process, make sure you have the following resources in place:

- [SAP OData connector set up](sap-odata-connector.md).
- An SAP OData service that accepts OAuth 2.0 bearer tokens issued by your identity provider.
- An OAuth 2.0 identity provider that supports the authorization code flow. This article uses **SAP Cloud Identity Services – Identity Authentication (SAP IAS)** as the example provider.
- Admin access to the identity provider so you can register an OAuth 2.0 client application. For SAP IAS, this is the [SAP Cloud Identity Services administration console](https://help.sap.com/docs/identity-authentication/identity-authentication/get-started).
- (Optional) Admin access to [Microsoft Entra ID](https://entra.microsoft.com/) if you want to federate sign-in from SAP IAS to Microsoft Entra ID.

> [!TIP]
> For a video walkthrough of the SAP-side configuration, see [Single sign-on with Power Platform and SAP OData using OAuth](https://www.youtube.com/watch?v=7Y4TH2DWIoo) by Holger Bruchelt.

## Named values

This section lists *named values* to make the examples easier to follow. These values are reused throughout the article and referenced in later sections. When following the examples in this article, be sure to replace the named values with your own values.

| Name | Sample value | Description |
|------|--------------|-------------|
| OData Base URI | `https://\<sap-host\>/sap/opu/odata/sap/API_BUSINESS_PARTNER` | The base URI (service root) of your SAP OData service. |
| Authorization URL | `https://\<tenant\>.accounts.ondemand.com/oauth2/authorize` | The OAuth 2.0 authorization endpoint of your identity provider. |
| Token URL | `https://\<tenant\>.accounts.ondemand.com/oauth2/token` | The OAuth 2.0 token endpoint of your identity provider. Also used to refresh the token. |
| Client ID | A GUID | The client ID of the OAuth 2.0 application registered with your identity provider. |
| Client secret |  | The client secret of the OAuth 2.0 application registered with your identity provider. |
| Redirect URI | `https://global.consent.azure-apim.net/redirect/sapodata` | The Power Platform per-connector consent (callback) URL. Confirm the exact value shown during connection creation for your cloud. |

> [!IMPORTANT]
> The named values in this guide are essential for setting up the connection. Ensure your values match your specific identity provider and SAP configurations.

## High-level overview

You enable users to access SAP data through Power Platform by using OAuth 2.0 and interactive sign-in. The process involves:

1. Registering an OAuth 2.0 client application in your identity provider (SAP IAS).
1. (Optional) Federating sign-in from SAP IAS to Microsoft Entra ID so users authenticate with their corporate account.
1. Whitelisting the connector's redirect URI on the OAuth 2.0 client application.
1. Creating the connection in Power Platform by using the **OAuth 2.0** authentication method.

In short, you register the client, whitelist the redirect URI, and enter the identity provider's endpoints and credentials in the connection.

## Step 1: Register an OAuth 2.0 client application in SAP Cloud Identity Services

Register an application in SAP IAS that represents the SAP OData connector. As an SAP Cloud Identity Services administrator, take these steps in the [SAP Cloud Identity Services administration console](https://help.sap.com/docs/identity-authentication/identity-authentication/get-started):

1. Sign in to the administration console at `https://\<tenant\>.accounts.ondemand.com/admin`.
1. Go to **Applications & Resources** > **Applications**.
1. Select **Create**, enter a name (for example, *Power Platform SAP OData*), and select **Save**.

## Step 2: Configure client authentication and grant types

Configure the application as a confidential client with a secret, and enable the grant types the authorization code flow requires. In the application you created in [Step 1](#step-1-register-an-oauth-20-client-application-in-sap-cloud-identity-services):

1. Under **Application APIs**, select **Client Authentication**.
1. Confirm that **Enable Public Client Flows** is **off**. A confidential client authenticates by using a secret.
1. Under **Secrets**, select **Add**, enter a description, and select the **openid** scope. Save the generated **Client ID** as `Client ID` and the generated secret as `Client secret` in the [*named values* table](#named-values).

    > [!TIP]
    > If the generated secret contains characters such as `=`, `/`, `.`, `+`, or `:`, regenerate it until you get a value that doesn't, or verify that you copy and paste the full value exactly. Special characters can be mishandled during the token exchange and cause authentication to fail.

1. Under **Grant Types**, enable **Authorization Code** and **Refresh Token**. Don't enforce PKCE (Proof Key for Code Exchange), because the connector uses a confidential client.

## Step 3: (Optional) Federate sign-in to Microsoft Entra ID

If you want users to sign in with their Microsoft Entra ID (corporate) account, configure Microsoft Entra ID as a corporate identity provider in SAP IAS. SAP IAS then federates the interactive sign-in to Microsoft Entra ID during the authorization code flow.

1. In the SAP Cloud Identity Services administration console, go to **Identity Providers** > **Corporate Identity Providers**.
1. Create or select a corporate identity provider and configure the trust with Microsoft Entra ID (SAML 2.0 or OpenID Connect).
1. Assign the corporate identity provider to the application you created in [Step 1](#step-1-register-an-oauth-20-client-application-in-sap-cloud-identity-services).

For detailed steps, see [SAP: Configure a corporate identity provider](https://help.sap.com/docs/identity-authentication/identity-authentication/configure-corporate-identity-providers) and [Microsoft Entra ID SSO integration with SAP Cloud Identity Services](/entra/identity/saas-apps/sap-cloud-platform-identity-authentication-tutorial).

> [!NOTE]
> This federation is configured between SAP IAS and Microsoft Entra ID. It doesn't use the connector's redirect URI.

## Step 4: Get the connector redirect URI and whitelist it

The connector uses a standard Power Platform per-connector consent (callback) URL as its OAuth redirect URI. You must register this exact URI on the OAuth 2.0 client application so the identity provider returns the authorization code to Power Platform.

1. The redirect URI has the form `https://global.consent.azure-apim.net/redirect/sapodata`. Confirm the exact value for your cloud on the connection's sign-in page or on the connector's security page. Save it as `Redirect URI` in the [*named values* table](#named-values).
1. In the SAP IAS application, go to **Single Sign-On** > **OpenID Connect Configuration** (or the application's **Redirect URIs** setting), add the `Redirect URI`, and save.

> [!IMPORTANT]
> The redirect URI must match **exactly**, including scheme, host, and path, with no trailing slash or extra path segments. A mismatch causes the token exchange to fail and the connection to report that it isn't authenticated.

## Step 5: Create the connection in Power Platform

Create a connection that uses the **OAuth 2.0** authentication method.

1. Open **Power Automate** or **Power Apps** in your browser.
1. Create a new manual-trigger **flow** (Power Automate) or add a data connection (Power Apps).
1. Add an **SAP OData** action and select **Sign in** to create a new connection.
1. Select **OAuth 2.0** as the authentication type.
1. Enter the following values from the [*named values* table](#named-values):

    - **OData Base URI**: `OData Base URI`
    - **OAuth authorization URL**: `Authorization URL`
    - **OAuth token URL**: `Token URL`
    - **OAuth client ID**: `Client ID`
    - **OAuth client secret**: `Client secret`

1. Select **Sign in**. Complete the interactive sign-in as the user you want to authorize. If SAP IAS federates to Microsoft Entra ID, you sign in with your Microsoft Entra ID account.

> [!TIP]
> To sign in as a specific user rather than reusing the current Power Platform user, use a private or incognito browser window when you create the connection.

## Step 6: Test the connection

1. In your **flow**, select the **SAP OData** action.
1. Choose an **Entity** from the *dropdown* to test.
1. Save your **flow**.
1. Run your **flow** to test the connection.
1. Verify the *run history* for successful authentication and data retrieval.

> [!TIP]
>
> - If the connection reports that it isn't authenticated, confirm that the redirect URI is whitelisted exactly, that the client secret was entered in full, and that the OAuth client is configured as a confidential client with the authorization code and refresh token grant types enabled.
> - If the **Entity** dropdown doesn't populate, recheck your connection parameters and the OAuth 2.0 client configuration in your identity provider.

## Related content

- [SAP OData connector](/connectors/sapodata/)
- [Connect Microsoft Power Platform and SAP](connect-power-platform-and-SAP.md)
- [Set up Microsoft Entra ID with Azure API Management and OAuth](entra-id-apim-oauth.md)
- [Set up Microsoft Entra ID using SuccessFactors](entra-id-using-successfactors.md)
- [SAP Odata connector now supports OAuth2 and SAP Principal Propagation](https://community.powerplatform.com/blogs/post/?postid=c6a609ab-3556-ef11-a317-6045bda95bf0) | Power Platform community blog
- [SAP Cloud Identity Services – Identity Authentication](https://help.sap.com/docs/identity-authentication) | SAP Help Portal
