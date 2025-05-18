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

# Authentication guide for Power Apps Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

This guide provides step-by-step instructions for setting up authentication in Test Engine. For a quick overview of authentication options, see [Authentication in Test Engine](./authentication.md).

## Getting started with authentication

Test Engine supports two authentication methods for web-based tests for canvas and model-driven applications:

- **StorageState** - Default, easy setup for individual development (for web-based canvas and model-driven app tests)
- **Dataverse** - Team-based approach for sharing test users and CI/CD (for web-based canvas and model-driven app tests)


Authentication is handled differently for PowerFx provider and direct Dataverse tests. These tests obtain access tokens directly from your logged in Azure CLI session using `az` commands to get resource access tokens. Make sure you're signed in with `az login --allow-no-subscriptions` before running these types of tests.

## Quick setup: StorageState authentication

StorageState authentication is the simplest way to get started. It uses the Windows Data Protection API to securely store authentication tokens on your local machine.

### Step 1: Run your test with default authentication

Run the following PowerShell command replacing the parameters starting with `your`.

```powershell
pac test run `
   --provider canvas `
   --test-plan-file your-test-plan.yaml `
   --tenant your-tenant-id `
   --environment-id your-environment-id
```

> [!NOTE]
> The [pac test run](../developer/cli/reference/test.md#pac-test-run) `--user-auth` parameter isn't used in this example because the default provider is `StorageState`. You can include it if you wish.

### Step 2: Complete the interactive sign-in

Enter your test user account credentials

1. A browser window opens automatically
1. Sign in with your test user account
1. If prompted, approve MFA and consent prompts
1. Select "Stay signed in" when prompted

Your authentication is now saved.

- Test Engine securely stores your authentication
- Future test runs will use the saved state without requiring sign-in
- Tokens refresh automatically when needed

## Team setup: Dataverse authentication

Dataverse authentication is perfect for teams and CI/CD pipelines. It securely stores authenticated user states in Dataverse, encrypted with X.509 certificates.

### Step 1: Download and import the Test Engine solution

1. Download the Power Platform solution from [https://aka.ms/TestEngineAuth](https://aka.ms/TestEngineAuth).
1. Sign in to [Power Apps](https://make.powerapps.com).
1. Select your target environment.
1. Go to **Solutions** and select **Import solution**.
1. Follow the wizard to upload and install the Test Engine solution.

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

Complete the following steps to set up your test user:

1. Open your terminal and sign out of any existing sessions:

   ```powershell
   # Clear Power Platform CLI credentials
   pac auth clear
   
   # Clear Azure CLI credentials
   az logout
   ```

1. Sign in with Azure CLI (required for Dataverse authentication):

   ```powershell
   az login --allow-no-subscriptions
   ```

1. Set your certificate name as a PowerShell environment variable named `DataProtectionCertificateName`:

   ```powershell
   $env:DataProtectionCertificateName = "CN=testengine"
   ```

1. Run your test with Dataverse authentication:

   ```powershell
   pac test run `
      --provider canvas `
      --user-auth Dataverse `
      --auth Certstore `
      --test-plan-file testplan.yaml `
      --tenant your-tenant-id `
      --environment-id your-environment-id
   ```

   > [!NOTE]
   > Unlike [StorageState](#quick-setup-storagestate-authentication), in this case you must the `--user-auth` parameter with a value of `Dataverse`.

1. Complete the interactive sign-in when prompted.

## Setting up service principals (for CI/CD)

For automated testing in CI/CD pipelines, you can use service principals instead of interactive user accounts.

### Step 1: Create an application registration in Microsoft Entra ID

Complete the following steps to create an application registration in Microsoft Entra ID.

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com)
1. Navigate to **Applications** > **App registrations**
1. Select **New registration**
1. Enter a name (For example "Test Engine Automation")
1. Keep the default options and select **Register**
1. After creation, note the **Application (client) ID** and **Directory (tenant) ID**

### Step 2: Configure API permissions for Dataverse

Complete the following steps to configure API permissions for Dataverse.

1. In your application registration, go to **API permissions**
1. Select **Add a permission**
1. Choose **APIs my organization uses**
1. Search for and select **Dataverse**
1. Select **Delegated permissions**
1. Check **user_impersonation**
1. Select **Add permissions**
1. Select **Grant admin consent**

### Step 3: Create a client secret

Complete the following steps to create a client secret.

1. Go to **Certificates & secrets**
1. Select **New client secret**
1. Add a description and choose an expiration
1. Copy the secret **Value** immediately (you won't be able to see it again)

### Step 4: Add the application user to Dataverse

Complete the following steps to add the application user to Dataverse.

1. Open the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com)
1. Select your environment
1. Go to **Settings** > **Users + permissions** > **Application users**
1. Select **+ New app user**
1. Search for and select your application
1. Assign appropriate business unit and security roles (include "Test Engine User" role)
1. Save the changes

### Step 5: Configure your CI/CD pipeline

Add these variables to your pipeline:

```
AZURE_CLIENT_ID: (your application ID)
AZURE_CLIENT_SECRET: (your client secret)
AZURE_TENANT_ID: (your tenant ID)
DataProtectionCertificateValue: (base64 encoded certificate)
ENVIRONMENT_URL: (your Dataverse environment URL)
```

For Azure DevOps, securely store these in [Variable Groups](/azure/devops/pipelines/library/variable-groups) with appropriate permissions.

## PowerFx and direct Dataverse test authentication

For PowerFx provider tests and direct Dataverse tests, authentication works differently than for web-based tests.

### How PowerFx/Dataverse authentication works

1. Test Engine uses Azure CLI to obtain a resource-specific access token
1. The token is used to authenticate directly with Dataverse APIs
1. No browser or web-based authentication is involved

### Setting up PowerFx/Dataverse authentication

1. Ensure Azure CLI is installed and up to date:
   
   ```powershell
   winget install -e --id Microsoft.AzureCLI
   # Or update it if already installed
   az upgrade
   ```

1. Sign in with Azure CLI:
   
   ```powershell
   # The --allow-no-subscriptions flag is important as you may not have Azure subscriptions
   az login --allow-no-subscriptions
   ```

1. Run your test with the PowerFx provider:
   
   ```powershell
   pac test run `
      --provider powerfx `
      --test-plan-file testplan.yaml `
      --tenant your-tenant-id `
      --environment-id your-environment-id `
      --domain "https://your-environment.crm.dynamics.com"
   ```

## Troubleshooting authentication

This section contains information about troubleshooting authentication with Test Engine.

### Common issues with StorageState

- **Problem**: Authentication prompt appears on every run.
  - **Solution**: Check if you selected **Stay signed in** during login.

- **Problem**: `Cannot access secure storage` error.
  - **Solution**: Ensure you have appropriate access to your user profile folder.

### Common issues with Dataverse authentication

- **Problem**: `Certificate not found` error.
  - **Solution**: Verify that the certificate name matches exactly what's in your certificate store.

- **Problem**: `Unable to connect to Dataverse` error.
  - **Solution**: Check that Azure CLI is logged in with `az login --allow-no-subscriptions`.

- **Problem**: `Access denied` error with service principal.
  - **Solution**: Verify the app has correct permissions in Dataverse and appropriate security roles.

### Common issues with PowerFx/Dataverse authentication

- **Problem**: `Unable to obtain access token` error
  - **Solution**: Verify you're signed in with Azure CLI using `az account get-access-token`

- **Problem**: `Access denied` to Dataverse
  - **Solution**: Ensure your logged-in user has appropriate permissions in the Dataverse environment

- **Problem**: Token expiration during long test runs
  - **Solution**: Use a service principal with longer token expiration or handle reauthentication in test steps

### Related articles

[Authentication security architecture](authentication-security.md)  
[Test canvas applications](canvas-application.md)  
[Test model-driven applications](model-driven-application.md)  
[Test Dataverse extensions](dataverse.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
