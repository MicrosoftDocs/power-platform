---
title: Set up Azure API Management & SAP for single sign-on from SAP OData connector
description:  This guide walks you through setting up SAP and Azure API management so users can access SAP and make OData calls in Microsoft Power Platform using their Microsoft Entra ID.
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
ms.date: 11/01/2024
---

# Set up Microsoft Entra ID, Azure API Management, and SAP for single sign-on from the Microsoft Power Platform SAP OData connector

This guide walks you through setting up Microsoft Entra ID, Azure API Management, and SAP so the Power Platform SAP OData connector can single sign-on into SAP. This process involves setting up a trust between SAP and Microsoft Entra ID. Once trust is set up, Azure API Management is configured to convert the Microsoft Entra ID OAuth token to a SAML token that is used to make OData calls to SAP.


![Flow Chart of HTTP traffic](./media/setup-microsoft-entra-id-with-apim-and-oauth/traffic_flow.jpg)

## Prerequisites

* SAP instance
* Azure API Management resource

## Configure SAP as a local Security Assertion Markup Language (SAML) provider

We configure the SAML 2.0 Configuration of SAP to set up a trust relationship between SAP and Microsoft Entra ID.

1. Log into SAP GUI and navigate to transaction `SAML2`.
1. Choose `Enable SAML 2.0 Support` if this step isn't completed.
1. Enter a URI compliant `Provider Name`. Microsoft Entra ID requires this value to be URI compliant. If `Provider Name` is already configured and isn't URI compliant, consult your SAP Basis team for next steps. Changing this value is potentially a breaking change if `Provider Name` has to be modified so coordinate internally before changing. Steps for changing this value are out of scope for this document.
1. Select the `Metadata` button, then select the `Download Metadata` button to download the SAP SAML metadata. This metadata is uploaded to Microsoft Entra ID.

## Create a Microsoft Entra ID Enterprise application

We create a Microsoft Entra ID Enterprise application that is the SAP system.

1. Open the [Azure portal](https://portal.azure.com), select `Microsoft Entra ID`, then select `Enterprise applications`.
1. Select `New application`.
1. Search for `SAP Netweaver`.
1. Give the Enterprise application a name and select `Create`.
1. Navigate to `Single sign-on` and choose `SAML`.
1. Select `Upload metadata file` to upload the metadata that was exported from SAP then select `Add`.
1. Change the `Reply URL (Assertion Consumer Service URL)` to the SAP OAuth token endpoint.
1. Change the `Sign on URL` to a URI compliant value. This parameter isn't used and can be set to anything.
1. Select `Save`.
1. Under `Attributes & Claims`, select `Edit` and confirm that `Claim name Unique User Identifier (Name ID)` is set to `user.userprincipalname [nameid=format:emailAddress]`.
1. Under `SAML Certificates`, select `Download` for the `Certificate (Base64)` and `Federation Metadata XML`.

## Configure SAP to trust Microsoft Entra ID

With SAP and Microsoft Entra ID pieces being set up, we can configure SAP to trust our Microsoft Entra ID Enterprise application.

1. Log into SAP GUI and navigate to transaction `SAML2`.
1. Select the `Trusted Providers` tab.
1. From the `Show:` dropdown, select `OAuth 2.0 Identity Providers`.
1. Select `Add` then select `Upload Metadata File`.
1. Choose the metadata XML file that was exported from Microsoft Entra ID and select `Next`.
1. Choose the base64 certificate that was downloaded from Microsoft Entra ID and select `Next`.
1. Select `Finish`.
1. Select the Microsoft Entra ID entry among the `List of Trusted Providers` that was added.
1. Under `Supported NameID Formats`, select `Add`.
1. Choose `Email`, select `OK`, then select `Save`.
1. Select `Enable` and select `OK`.

## Create a Microsoft Entra ID application to act as a client

We set up a Microsoft Entra ID application that grants access to the Microsoft Power Platform SAP OData app registration. This application allows our Azure API Management resource to convert OAuth tokens to SAML ones.

1. Open the [Azure portal](https://portal.azure.com).
1. Select `Microsoft Entra ID`, select `App registrations`, then select `New Registration`.
1. Enter a `Name` and select `Register`.
1. Select `Certificates & secrets`, select `New client secret`.
1. Enter a `Description` and select `Add`.
1. Copy and save this secret somewhere secure.
1. Select `API Permissions`, then `Add a permission`.
1. Choose `Microsoft Graph`, then `Delegated permissions` and search for `openid`.
1. Select `openid` then select `Add permissions`.
1. Select `Authentication`, then select `Add a platform`, and select `Web`.
1. Set `Redirect URIs` to `https://localhost:44326/signin-oidc`.
1. Select `Access tokens` and `ID tokens` then select `Configure`.
1. Select `Expose an API`.
1. Next to `Application ID URI` select `Add`, accept the default value, and select `Save`.
1. Select `Add a scope`.
1. Set `Scope name` to `user_impersonation`.
1. Set `Who can consent?` to `Admins and users` then select `Add scope`.
1. Copy the `Application (client) ID` for use in the next steps.
1. When a Microsoft Entra ID Enterprise application is created, it always creates a matching `App registration`. Find this matching `App registration` that is paired with the Microsoft Entra ID Enterprise application that was created previously.
1. Select `Expose an API` then select `Add a client application`.
1. Paste the `Application (client) ID` into `Client ID`, select the `user_impersonation` scope, and select `Add application`.

## Configure SAP OAuth

We create an OAuth 2.0 client within SAP that allows Azure API Management to obtain tokens on behalf of users.

1. Log into SAP GUI and navigate to transaction `/nsoauth2`.
1. Select `Create`.
1. For the `Client ID` step:
    1. For `OAuth 2.0 Client ID` choose an SAP system user.
    1. Fill in `Description` and choose `Next`.
1. For the `Client Authentication` step:
    1. Choose `Next`.
1. For the `Grant Type Settings` step:
    1. For `Trusted OAuth 2.0 IdP` choose the Microsoft Entra ID entry.
    1. Enable `Refresh Allowed` and choose `Next`.
1. For the `Scope Assignment` step:
    1. Select `Add`, choose the OData services that Azure API Management uses, and select `Next`
1. Select `Finish`.

## Configure Azure API Management

We take our SAP OData XML metadata, convert it to an OpenAPI JSON specification and upload that into Azure API Management. We also apply an Azure API Management policy to convert the tokens.

1. Point your browser to the SAP OData metadata XML and save this file to your desktop.
1. Use [OData Transformer](https://convert.odata-openapi.net/) to convert your OData metadata XML file to an OpenAPI JSON specification and save this file to your desktop.
1. Open the [Azure portal](https://portal.azure.com) and navigate to your Azure API management resource.
1. Select `APIs` then `Add API`.
1. From `Create from definition` choose `OpenAPI`.
1. Select `Select a file` and choose the OpenAPI JSON specification file that you saved to your desktop.
1. Under the `APIs` navigation, select `Named values` and add the following key/value pairs:

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
| SAPOAuthServerAdressForTokenEndpoint | SAP endpoint for Azure API Management to call to perform the token acquisition |
| SapOdataFirstParty | Microsoft Power Platform SAP OData connector first party application GUID. This value should always be `6bee4d13-fd19-43de-b82c-4b6401d174c3` |

## Apply the Azure API Management token policy

Azure API Management has the capability, through policies, to convert our Microsoft Entra ID tokens into SAML tokens that SAP accepts.

1. Copy the example [Azure API Management policy](https://github.com/Azure/api-management-policy-snippets/blob/master/examples/Request%20OAuth2%20access%20token%20from%20SAP%20using%20AAD%20JWT%20token.xml) from Microsoft's GitHub page.
1. Open the [Azure portal](https://portal.azure.com).
1. Navigate to your Azure API Management resource.
1. Select `API's` from the navigation menu.
1. Choose the API that created previously by uploading the OpenAPI JSON specification file.
1. Select `All operations`
1. Under `Inbound processing` select `Policies </>`.
1. Delete the existing policy and paste the policy copied previously.
1. Select `Save`.

## Learn more

* [SAP OData connector documentation](/connectors/sapodata/)
* [SAP OData connector now supports OAuth2 and SAP Principal Propagation](https://community.powerplatform.com/blogs/post/?postid=c6a609ab-3556-ef11-a317-6045bda95bf0)