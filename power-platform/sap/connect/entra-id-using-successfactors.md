---
title: Set up Microsoft Entra ID using SuccessFactors (Preview) - single sign-on
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
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 11/21/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Microsoft Entra ID using SuccessFactors (Preview)

This guide will help you set up the **Microsoft Entra ID using SuccessFactors** authentication method in the SAP OData connector for Power Platform. The goal is to accumulate all necessary parameters to enable Single Sign-On (SSO) between Microsoft Entra ID and SuccessFactors.

> [!IMPORTANT]
> The parameters collected in this guide are essential for setting up SSO. Ensure your values match your specific SuccessFactors and Microsoft Entra ID configuration.

---

## Prerequisites

1. [Set up SAP ERP Connector](sap-erp-connector.md).
2. Admin access to SAP SuccessFactors.
3. Admin access within the [Azure Portal](https://aka.ms/azure).

---

## Parameters for SuccessFactors Connection

- **SuccessFactors Token API**
- **SuccessFactors Client ID**
- **App Resource URI** (format: `api://<App-ID>`)
- **SuccessFactors OData Base URI**
- **Company ID** - Represents the specific SuccessFactors environment for login.

---

## Key Configuration Notes
- Ensure that the Unique User Identifier claim of the Microsoft Entra ID user aligns precisely with the user alias in SuccessFactors (one-to-one matching).
- **User Access Control:** Only users or groups listed in the Enterprise Application will be allowed to authenticate with SuccessFactors.
- **Resource URI:** Found in the Enterprise App settings under **Expose an API** as the Application ID URI.
- Your **Company ID** is generated based on the enabled SuccessFactors modules.

---

## High-Level Overview

1. Create an OAuth 2.0 Client Application in SuccessFactors.
2. Establish a Microsoft Enterprise Application.
3. Configure SAML settings within the Enterprise Application.
4. Obtain the Enterprise Application's SAML Certificate.
5. Upload the SAML Certificate to your OAuth 2.0 Client Application within SuccessFactors.
6. Establish trust.

---

## Creating an OAuth 2.0 Client Application in SuccessFactors

1. Log in to the SuccessFactors Web UI with an admin account.
2. Navigate to **Manage OAuth2 Client Applications**.
3. Click **Register Client Application**.
4. Fill out the required fields:
   - **Company:** Auto-populated.
   - **Application Name:** Any descriptive name.
   - **Description:** Any descriptive text.
   - **Application URL:** Placeholder for now; update later.
   - **X.509 Certificate:** Leave empty initially.
5. Click **Save**. Your new client application will now have an **API Key**:
   - This **API Key** serves as the Client ID in the SAML2 session flow and is used in the connection and Enterprise App configuration.

---

## Import Microsoft Entra ID Certificate

Later in the process, you will import a certificate from your Entra ID Enterprise App into SuccessFactors.

---

## Creating a Microsoft Entra ID Enterprise Application

1. Open the **Azure Portal** and navigate to **Microsoft Entra ID** > **Enterprise applications**.
2. Click **New application**.
3. Search for **SAP SuccessFactors** and select it.
4. Assign a name for the application and click **Create**.
5. Go to **Single sign-on** and select **SAML**.
6. Follow the specific guidelines in the **SuccessFactors SSO Configuration Guide**.
7. Configure the following:
   - **Identifier (Entity ID):** Set to `api://<Enterprise App ID>` (e.g., `api://33135bc6-be6a-4cdc-9c96-af918e367425`).
   - **Reply URL:** Used in the SAML token as the `Recipient` field (e.g., `https://<api-server>/oauth/token`).
   - **Sign-On URL:** Advisable to set as `https://<your-sf-url>/sf/start?company=<CompanyID>&logonMethod=SSO`.
8. Edit the **Attributes and Claims** section:
   - Add a claim for `api_key` with the value of the API Key from SuccessFactors.
   - Update the Unique User Identifier claim to match the unique ID for each SuccessFactors user.
9. Download the **Certificate (Base64 format)** from this application.

---

## Configuring Enterprise Application

1. In the **Azure Portal**, navigate to **App Registrations**.
2. Under **Expose an API**, locate your **Resource URI** (Application ID URI).
3. Click **Add a client application**.
4. Enter the Client ID for SAP OData: `6bee4d13-fd19-43de-b82c-4b6401d174c3`.
5. Select the existing scope from the **Authorized scopes** checklist.
6. Click **Add application**.

---

## Configuring SuccessFactors to Trust Microsoft Entra ID

1. Log in to the SuccessFactors Web UI with an admin account.
2. Navigate to **Manage OAuth2 Client Applications**.
3. Select the client application you created earlier.
4. Update the certificate to the one downloaded from Microsoft Entra ID.
   - Paste only the certificate content (without the header and footer).

---

## Testing the Connection

1. Open **Power Automate** in your browser.
2. Create a new Flow (manual trigger type).
3. Add an **SAP OData** action.
4. Select **Microsoft Entra ID using SuccessFactors** as the connection.
5. Fill in the required parameters gathered earlier.
6. Choose an **Entity** from the dropdown to test.
7. Save your Flow.
8. Run the Flow to test the connection.
9. Verify the run history for successful authentication and data retrieval.

> **Note:**  
> - If the test fails, verify your connection parameters and ensure all previous configuration steps are completed correctly.  
> - If the **Entity** dropdown does not populate, recheck your connection parameters, the OAuth 2.0 app configuration in SuccessFactors, and the Enterprise App configuration.