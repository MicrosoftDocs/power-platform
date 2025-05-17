---
title: "Authentication Guide for Power Apps Test Engine (preview)"
description: "Step-by-step guide for setting up authentication in Test Engine"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/17/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Authentication Guide for Power Apps Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

This guide provides step-by-step instructions for setting up authentication in Test Engine. For a quick overview of authentication options, see [Authentication in Test Engine](./authentication.md).

## Getting Started with Authentication

Test Engine supports two authentication methods:

1. **StorageState** - Default, easy setup for individual development (for web-based Canvas and Model-driven app tests)
2. **Dataverse** - Team-based approach for sharing test users and CI/CD (for web-based Canvas and Model-driven app tests)

> [!NOTE]
> For PowerFx provider and direct Dataverse tests, authentication is handled differently. These tests obtain access tokens directly from your logged in Azure CLI session using `az` commands to get resource access tokens. Make sure you're signed in with `az login --allow-no-subscriptions` before running these types of tests.

## Quick Setup: StorageState Authentication

StorageState authentication is the simplest way to get started. It uses the Windows Data Protection API to securely store authentication tokens on your local machine.

### Step 1: Run your test with default authentication

```powershell
pac test run `
   --provider canvas `
   --test-plan-file testplan.yaml `
   --tenant your-tenant-id `
   --environment-id your-environment-id
```

### Step 2: Complete the interactive sign-in

- A browser window opens automatically
- Sign in with your test user account
- If prompted, approve MFA and consent prompts
- Select "Stay signed in" when prompted

### Step 3: Your authentication is now saved

- Test Engine securely stores your authentication
- Future test runs will use the saved state without requiring sign-in
- Tokens refresh automatically when needed

## Team Setup: Dataverse Authentication

Dataverse authentication is perfect for teams and CI/CD pipelines. It securely stores authenticated user states in Dataverse, encrypted with X.509 certificates.

### Step 1: Download and import the Test Engine solution

1. Download the Power Platform solution from [https://aka.ms/TestEngineAuth](https://aka.ms/TestEngineAuth)
2. Sign in to [Power Platform Admin Center](https://admin.powerplatform.microsoft.com)
3. Select your target environment
4. Go to Solutions and select Import solution
5. Upload and follow the import wizard to install the Test Engine solution

### Step 2: Create a certificate for encryption

For a self-signed certificate (development only), run this in PowerShell:

```powershell
$Params = @{
  DnsName = @("testengine", "testengine")
  CertStoreLocation = "Cert:\CurrentUser\My"
  NotAfter = (Get-Date).AddMonths(6)
  KeyAlgorithm = "RSA"
  KeyLength = 2048
}
New-SelfSignedCertificate @Params
```

For production, use a certificate from your enterprise certificate authority.

### Step 3: Set up your test user

1. Open your terminal and sign out of any existing sessions:

   ```powershell
   # Clear Power Platform CLI credentials
   pac auth clear
   
   # Clear Azure CLI credentials
   az logout
   ```

2. Sign in with Azure CLI (required for Dataverse authentication):

   ```powershell
   az login --allow-no-subscriptions
   ```

3. Set your certificate name as an environment variable:

   ```powershell
   $env:DataProtectionCertificateName = "CN=testengine"
   ```

4. Run your test with Dataverse authentication:

   ```powershell
   pac test run `
      --provider canvas `
      --user-auth Dataverse `
      --auth Certstore `
      --test-plan-file testplan.yaml `
      --tenant your-tenant-id `
      --environment-id your-environment-id
   ```

5. Complete the interactive sign-in when prompted

## Setting Up Service Principals (For CI/CD)

For automated testing in CI/CD pipelines, you can use service principals instead of interactive user accounts.

### Step 1: Create an application registration in Microsoft Entra ID

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com)
2. Navigate to **Applications** > **App registrations**
3. Select **New registration**
4. Enter a name (For example "Test Engine Automation")
5. Keep the default options and select **Register**
6. After creation, note the **Application (client) ID** and **Directory (tenant) ID**

### Step 2: Configure API permissions for Dataverse

1. In your application registration, go to **API permissions**
2. Select **Add a permission**
3. Choose **APIs my organization uses**
4. Search for and select **Dataverse**
5. Select **Delegated permissions**
6. Check **user_impersonation**
7. Select **Add permissions**
8. Select **Grant admin consent**

### Step 3: Create a client secret

1. Go to **Certificates & secrets**
2. Select **New client secret**
3. Add a description and choose an expiration
4. Copy the secret **Value** immediately (you won't be able to see it again)

### Step 4: Add the application user to Dataverse

1. Open the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com)
2. Select your environment
3. Go to **Settings** > **Users + permissions** > **Application users**
4. Select **+ New app user**
5. Search for and select your application
6. Assign appropriate business unit and security roles (include "Test Engine User" role)
7. Save the changes

### Step 5: Configure your CI/CD pipeline

Add these variables to your pipeline:

```
AZURE_CLIENT_ID: (your application ID)
AZURE_CLIENT_SECRET: (your client secret)
AZURE_TENANT_ID: (your tenant ID)
DataProtectionCertificateValue: (base64 encoded certificate)
ENVIRONMENT_URL: (your Dataverse environment URL)
```

For Azure DevOps, securely store these in Variable Groups with appropriate permissions.

## Troubleshooting Authentication

### Common issues with StorageState

- **Problem**: Authentication prompt appears on every run
  - **Solution**: Check if you selected "Stay signed in" during login

- **Problem**: "Cannot access secure storage" error
  - **Solution**: Ensure you have appropriate access to your user profile folder

### Common issues with Dataverse authentication

- **Problem**: Certificate not found
  - **Solution**: Verify that the certificate name matches exactly what's in your certificate store

- **Problem**: "Unable to connect to Dataverse" error
  - **Solution**: Check that Azure CLI is logged in with `az login --allow-no-subscriptions`

- **Problem**: "Access denied" with service principal
  - **Solution**: Verify the app has correct permissions in Dataverse and appropriate security roles

## PowerFx and Direct Dataverse Test Authentication

For PowerFx provider tests and direct Dataverse tests, authentication works differently than for web-based tests.

### How PowerFx/Dataverse Authentication Works

1. Test Engine uses Azure CLI to obtain a resource-specific access token
2. The token is used to authenticate directly with Dataverse APIs
3. No browser or web-based authentication is involved

### Setting Up PowerFx/Dataverse Authentication

1. Ensure Azure CLI is installed and up to date:
   ```powershell
   winget install -e --id Microsoft.AzureCLI
   # Or update it if already installed
   az upgrade
   ```

2. Sign in with Azure CLI:
   ```powershell
   # The --allow-no-subscriptions flag is important as you may not have Azure subscriptions
   az login --allow-no-subscriptions
   ```

3. Run your test with the PowerFx provider:
   ```powershell
   pac test run `
      --provider powerfx `
      --test-plan-file testplan.yaml `
      --tenant your-tenant-id `
      --environment-id your-environment-id `
      --domain "https://your-environment.crm.dynamics.com"
   ```

### Common Issues with PowerFx/Dataverse Authentication

- **Problem**: "Unable to obtain access token" error
  - **Solution**: Verify you're signed in with Azure CLI using `az account get-access-token`

- **Problem**: "Access denied" to Dataverse
  - **Solution**: Ensure your logged-in user has appropriate permissions in the Dataverse environment

- **Problem**: Token expiration during long test runs
  - **Solution**: Use a service principal with longer token expiration or handle reauthentication in test steps

## Next Steps

- [Understand technical details](authentication-security.md) of the security architecture
- [Test canvas applications](canvas-application.md) with your authenticated users
- [Test model-driven applications](model-driven-application.md) with authenticated sessions
- [Explore Dataverse testing](dataverse.md) with authenticated connections

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
