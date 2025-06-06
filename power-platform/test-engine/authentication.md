---
title: "Authentication in Power Apps Test Engine (preview)"
description: "Simple guide to authentication options in Test Engine"
author: pvillads
ms.author: pvillads
ms.subservice: test-engine
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - grant-archibald-ms
---

# Authentication in Power Apps Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Test Engine offers straightforward authentication options to support both development and production scenarios. This article provides a clear overview of your authentication choices and how to select the best option for your needs.

## Authentication made simple

Test Engine offers easy-to-use authentication methods depending on the type of test you're looking to create.

## Web based tests (canvas, model-driven apps)

For web based tests that make use of an interactive user account to run the test.

:::row:::
   :::column:::
**StorageState** (Default)

- Uses Windows Data Protection API for secure local storage
- Perfect for individual development and testing
- Handles MFA and conditional access automatically
- Interactive first-time sign-in, automated after that
- Used for web-based Canvas and Model-driven app tests
   :::column-end:::
   :::column:::
**Dataverse**

- Uses X.509 certificates and ASP.NET Core Data Protection
- Ideal for team environments and CI/CD pipelines
- Stores encrypted tokens in Dataverse
- Supports service principals for automated testing
- Used for web-based Canvas and Model-driven app tests
   :::column-end:::
:::row-end:::

## OAuth based tests (Dataverse)

For PowerFx provider and direct Dataverse tests, authentication works differently. These tests obtain access tokens directly from your Azure CLI session using `az` commands to get resource-specific access tokens. Ensure you're signed in with `az login --allow-no-subscriptions` before running these types of tests.

## When to use each authentication method

The following table describes when to use each authentication method:

| If you need to... | Choose | Why it works best |
|-------------------|--------|-------------------|
| Get started quickly | `StorageState` | Zero setup, just run your tests and sign-in |
| Test locally with MFA | `StorageState` | Handles all modern authentication methods |
| Share test users with your team | `Dataverse` | Centralized, secure credential storage |
| Run tests in CI/CD pipelines | `Dataverse` | Non-interactive, automation-friendly |
| Use service principals | `Dataverse` | Supports secure, headless authentication |

## StorageState authentication: Quick start

The `StorageState` method securely stores browser authentication data locally using Windows Data Protection API. It's perfect for individual developers and testers.

```powershell
# StorageState is the default, so you don't need to set it using the --user-auth parameter
pac test run `
   --provider canvas `
   --test-plan-file testplan.yaml `
   --tenant your-tenant-id `
   --environment-id your-environment-id
```

## Dataverse authentication: Team-ready

The Dataverse method stores encrypted tokens in Dataverse using X.509 certificates and ASP.NET Core Data Protection. It's ideal for teams and automated workflows.

### Setting up Dataverse authentication

1. Download the Test Engine solution: [https://aka.ms/TestEngineAuth](https://aka.ms/TestEngineAuth)
2. Import the solution into your Dataverse environment
3. Set up a certificate (self-signed or from your certificate authority)
4. Configure service principals for automated testing (optional but recommended)

```powershell
# Example command with Dataverse authentication
pac test run `
   --provider canvas `
   --user-auth Dataverse `
   --auth Certstore `
   --test-plan-file testplan.yaml `
   --tenant your-tenant-id `
   --environment-id your-environment-id
```

## Next steps

Choose the path that's right for you:

- [Authentication Guide](authentication-guide.md) - Step-by-step instructions for both authentication methods
- [Security Details](authentication-security.md) - Technical details for security professionals
- [Service Principal Setup](authentication-guide.md#setting-up-service-principals-for-cicd) - Configure non-interactive authentication for automation

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
