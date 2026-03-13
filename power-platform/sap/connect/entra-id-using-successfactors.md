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
# Customer intent: As an administrator, I want to learn how to configure Microsoft Entra ID and SAP SuccessFactors so that users can access SuccessFactors data via SAP OData connectors using single sign-on (SSO)
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

## Named values

This section lists named values to make the examples easier to follow. These values are reused throughout the article and referenced in later sections. When following the examples in this article, be sure to replace the named values with your own values.

| Name | Sample value | Description |
|------|-------------|-------------|
| Success Factors token URL | https://<api-server>/oauth/token | SuccessFactors SAML token Recipient field |
| Service Provider Client Id | API key | SuccessFactors OAuth API key |
| OData Base URI | https://<odata-sf>/odata/v2 | SuccessFactors Odata base URI |
| Microsoft Entra Resource URL (Application ID URI) | api://33135bc6-be6a-4cdc-9c96-af918e367425 | A unique string that identifies the SAML service provider  |
| Company Id | SFSALES012345 | SuccessFactors Company Id |

## High-Level overview

This setup enables users to access SAP SuccessFactors securely via Power Automate using single sign-on (SSO) and OAuth. The process involves:
1. Adding a Enterprise Application in Microsoft Entra ID.
2. Creating an OAuth 2.0 Client Application in SuccessFactors.
3. Establishing trust between Microsoft Entra ID and SuccessFactors using SAML.
4. Mapping users from Entra ID to SuccessFactors to enable seamless SSO.
In short: we configure the apps on both sides, establish trust, match users, and enable token-based access for API integrations.

### Step 1: Create and configure Microsoft Entra ID Enterprise Application

1. Create Microsoft Entra ID enterprise application:

    1. Search for and select **Microsoft Entra ID**.
    1. In the left navigation pane, expand **Manage** > **Enterprise applications**.
    1. Select **New application**.
    1. Search for and select **SAP SuccessFactors** from the gallery.
    1. Enter a name for the application and select **Create**.
       
1. Configuring **Basic SAML Configuration**:

    1. Go to the **Single sign-on** section and select **SAML** as the sign-on method.
    1. **Identifier (Entity ID):** Set to `api://<Enterprise App ID>`. (e.g., `api://33135bc6-be6a-4cdc-9c96-af918e367425`). Save this value as **Microsoft Entra Resource URL (Application ID URI)** in the [named values table](#named-values)
    1. **Reply URL:** Use the SuccessFactors SAML token Recipient field. (e.g., `https://<api-server>/oauth/token`).
    1. **Sign-On URL:** Recommended format: https://<your-sf-url>/sf/start?company=<CompanyID>&logonMethod=SSO.
    1. Tip: Confirm the correct server URL with your SuccessFactors IT admin if unsure.
    1. Select **Save**.

1. Confirm the correct attribute is set:

    1. Go to the **Attributes & Claims** section.
    1. Select **Edit**. 
    1. Confirm that **Claim name Unique User Identifier (Name ID)** is set to `user.userprincipalname` [`nameid`="{email address}"].

1. Download the certificates:

   1. Go to the **SAML Certificates** section.
   1. Select the *download links* for:

       - **Certificate (Base64)**.
   
1. Add users and groups:

    1. Go to the **Users and groups** section.
    1. Select **Add users/group**.
    1. Select **Users and groups**.
    1. Search and select **ALL Company** and then select **assign**. 

### Step 2: Create an OAuth 2.0 Client Application in SuccessFactors

1. Log in to the SuccessFactors Web UI using an admin account.
1. Navigate to **Manage OAuth2 Client Applications**.
1. Click **Register Client Application**.
1. Complete the required fields:
   
    1. **Company**: Auto-populated. Copy the value and save it as the **Company Id** in the Named values table.
    1. **Application Name**: Enter any descriptive name.
    1. **Description**: Enter any descriptive text.
    1. **API Key**: Auto-populated. Copy the value and save it as the **Service Provider Client Id** in the Named values table.
    1. **Application URL**: Update this with the **Microsoft Entra Resource URL (Application ID URI)** from the Named values table.
    1. **X.509 Certificate**: Open the certificate downloaded in step 1 with a text editor (e.g., Visual Studio Code), copy everything between -----BEGIN CERTIFICATE----- and -----END CERTIFICATE-----, and paste it.

1. Click **Save**.

### Step 3: Update Microsoft Entra ID Enterprise Application

1. Search for and select **Microsoft Entra ID**.
1. In the left navigation pane, expand **Manage** > **Enterprise applications**.
1. Locate and select the enterprise application you created in Step 1.

   1. Navigate to **Manage** > **Single sign-on**.
   1. Go to **Attributes & Claims**, then select **Edit**.
   1. Click **Add new claim**, and configure it as follows:
          **Name**: api_key
          **Source**: Attribute
          **Source attribute**: Paste the **Service Provider Client Id** from the Named values table.

### Step 4: Configure Microsoft Entra ID App registrations

1. Search for and select **Microsoft Entra ID**.
1. In the left navigation pane, go to **Manage** > **App Registrations**.
1. Under the **All applications** tab, locate and select the application you created in Step 1.

    1. Navigate to **Manage** > **Expose an API**. Under **Application ID URI**, select **Add**, and enter the **Microsoft Entra Resource URL (Application ID URI)** from the Named values table.
    1. Under **Authorized client applications**, Select **Add a client application**.
    1. Enter the Client ID for SAP OData connector: **6bee4d13-fd19-43de-b82c-4b6401d174c3**.
    1. From the Authorized scopes list, select the existing scope.
    1. Click **Add application**.


### Test the connection

1. Open **Power Automate** in your browser.
2. Create a new flow (manual trigger type).
3. Add an **SAP OData** action.
4. Select **Microsoft Entra ID using SuccessFactors** as the connection.
5. Fill in the required parameters gathered from Named values table.
7. Choose an **Entity** from the dropdown to test.
8. Save your flow.
9. Run the flow to test the connection.
10. Verify the run history for successful authentication and data retrieval.

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
