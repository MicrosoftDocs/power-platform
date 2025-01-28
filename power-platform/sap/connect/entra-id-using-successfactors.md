---
title: Set up Microsoft Entra ID using SuccessFactors (Preview)
description: This guide walks you through setting up the connector so your users can access SAP SuccessFactors data using their Microsoft Entra ID for authentication.​
author: ryanb58
ms.author: tbrazelton
contributors:
  - hidasa
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
ms.topic: how-to
ms.date: 12/02/2024
ms.service: power-platform
ms.subservice: sap
# Customer intent: As an administrator, I want to learn how to set up Microsoft Entra ID using SuccessFactors, so that users can use single sign-on (SSO).
---

# Microsoft Entra ID using SuccessFactors (Preview)

[This article is prerelease documentation and is subject to change.]

This guide walks you through setting up the **Microsoft Entra ID using SuccessFactors** authentication method in the SAP OData connector for Power Platform. The goal is to accumulate all necessary parameters to enable Single Sign-On (SSO) between Microsoft Entra ID and SuccessFactors.

> [!IMPORTANT]
> The parameters collected in this guide are essential for setting up SSO. Ensure your values match your specific SuccessFactors and Microsoft Entra ID configuration.

> [!TIP]
> Consider using an API Management solution to govern and secure your SAP APIs. For more information, see [this docs article](entra-id-apim-oauth.md) and [this community post](https://community.sap.com/t5/technology-blogs-by-members/perform-sap-principal-propagation-with-microsoft-entra-id-for-sap/ba-p/13860532).

## Prerequisites

- [Set up SAP OData Connector](sap-odata-connector.md).
- Admin access to SAP SuccessFactors.
- Admin access within the [Azure Portal](https://aka.ms/azure).

## Parameters for SuccessFactors connection

- **SuccessFactors Token API**
- **SuccessFactors Client ID**
- **App Resource URI** (format: `api://<App-ID>`)
- **SuccessFactors OData Base URI**
- **Company ID** - Represents the specific SuccessFactors environment for login.

---

## Key configuration notes

- Ensure that the Unique User Identifier claim of the Microsoft Entra ID user aligns precisely with the user alias in SuccessFactors (one-to-one matching).
- **User Access Control:** Only users or groups listed in the Enterprise Application will be allowed to authenticate with SuccessFactors.
- **Resource URI:** Found in the Enterprise App settings under **Expose an API** as the Application ID URI.
- Your **Company ID** is generated based on the enabled SuccessFactors modules.

## High-Level overview

1. Create an *OAuth 2.0 Client Application* in SuccessFactors.
2. Establish a *Microsoft Enterprise Application*.
3. Configure *SAML* settings within the Enterprise Application.
4. Obtain the Enterprise Application's *SAML Certificate*.
5. Upload the SAML Certificate to your OAuth 2.0 Client Application within SuccessFactors.
6. Establish trust.

### Create an OAuth 2.0 Client Application in SuccessFactors

1. Log in to the *SuccessFactors Web UI* with an admin account.
2. Go to **Manage OAuth2 Client Applications**.
3. Select **Register Client Application**.
4. Fill out the required fields:
   - **Company:** Auto-populated.
   - **Application Name:** Any descriptive name.
   - **Description:** Any descriptive text.
   - **Application URL:** Placeholder for now; update later.
   - **X.509 Certificate:** Leave empty initially.
5. Select **Save**. Your new client application now has an **API Key** that serves as the *Client ID* in the SAML2 session flow and is used in the connection and Enterprise App configuration.

Later in the process, you'll import a certificate from your Microsoft Entra ID Enterprise App into SuccessFactors.

### Create a Microsoft Entra ID Enterprise Application

1. Open the **Azure Portal** and go to **Microsoft Entra ID** > **Enterprise Applications**.
1. Select **New application**.
1. Search for and select  **SAP SuccessFactors**.
1. Assign a name for the application and select **Create**.
1. Go to **Single sign-on** and select **SAML**.
1. Follow the specific guidelines in the **SuccessFactors SSO Configuration Guide**.
1. Configure the following:
   - **Identifier (Entity ID):** Set to `api://<Enterprise App ID>` (e.g., `api://33135bc6-be6a-4cdc-9c96-af918e367425`).
   - **Reply URL:** Used in the SAML token as the `Recipient` field (e.g., `https://<api-server>/oauth/token`).
   - **Sign-On URL:** Advisable to set as `https://<your-sf-url>/sf/start?company=<CompanyID>&logonMethod=SSO`.
1. Edit the **Attributes and Claims** section:
    1. Add a claim for `api_key` with the value of the API Key from SuccessFactors.
    1. Update the *Unique User Identifier* claim to match the unique ID for each SuccessFactors user.
1. Download the **Certificate (Base64 format)** from this application.

### Configure Enterprise Application

1. In the **Azure Portal**, go to **App Registrations**.
2. Under **Expose an API**, locate your **Resource URI** (Application ID URI).
3. Select **Add a client application**.
4. Enter the *Client ID for SAP OData*: `6bee4d13-fd19-43de-b82c-4b6401d174c3`.
5. Select the existing scope from the **Authorized scopes** checklist.
6. Select **Add application**.

### Configure SuccessFactors to trust Microsoft Entra ID

1. Log in to the SuccessFactors Web UI with an admin account.
2. Go to **Manage OAuth2 Client Applications**.
3. Select the *client application* you created earlier.
4. Update the certificate to the one downloaded from Microsoft Entra ID and paste only the certificate body content without the header and footer.

### Test the connection

1. Open **Power Automate** in your browser.
2. Create a new flow (manual trigger type).
3. Add an **SAP OData** action.
4. Select **Microsoft Entra ID using SuccessFactors** as the connection.
5. Fill in the required parameters gathered earlier.
6. Choose an **Entity** from the dropdown to test.
7. Save your flow.
8. Run the flow to test the connection.
9. Verify the run history for successful authentication and data retrieval.

> [!NOTE]
>
> - If the test fails, verify your connection parameters and ensure all previous configuration steps are completed correctly.
> - If the **Entity** dropdown does not populate, recheck your connection parameters, the OAuth 2.0 app configuration in SuccessFactors, and the Enterprise App configuration.

## Related content

- [SAP OData connector](/connectors/sapodata/)
- [SAP OData connector now supports OAuth2 and SAP Principal Propagation](https://community.powerplatform.com/blogs/post/?postid=c6a609ab-3556-ef11-a317-6045bda95bf0) | Power Automate community blog
- [Azure API Management policy for SAP SuccessFactors](https://github.com/Azure/api-management-policy-snippets/blob/master/examples/Request%20OAuth2%20access%20token%20from%20SuccessFactors%20using%20AAD%20JWT%20token.xml) | GitHub
- [SAP OData connector for SAP SuccessFactors](https://community.sap.com/t5/technology-blogs-by-members/perform-sap-principal-propagation-with-microsoft-entra-id-for-sap/ba-p/13860532) | SAP community blog
- The SAP Business Accelerator Hub also offers content related to the SAP integration suite policy for SuccessFactors and NetWeaver. You must have an SAP account to access this content.
