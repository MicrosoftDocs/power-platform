---
title: "Authentication in Power Apps Test Engine (preview)"
description: "Describes authentication options in Test Engine"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/15/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Authentication in Power Apps Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Authentication is a critical component of the test automation process. The Power Apps Test Engine offers flexible authentication options that support diverse testing scenarios - from interactive development environments to automated CI/CD pipelines.

## Authentication Options

The Test Engine provides two primary authentication methods:

<!-- Example columns start -->

:::row:::
   :::column:::
   **Browser based** (Default)

   - Persist session cookies for repeated test runs
   - Support for MFA and conditional access policies
   - Interactive first-time sign-in, automated subsequent runs
   :::column-end:::
   :::column:::
   **Certificate based authentication**

   - Use X.509 certificates for encrypted authentication stored in Dataverse
   - Integrate with Dataverse security model
   - Ideal for CI/CD pipelines and automation
   :::column-end:::
:::row-end:::

<!-- Example columns end -->

## Documentation Overview

We've organized the authentication documentation into two focused guides:

1. **[User Guide for Authentication](authentication-guide.md)** - Practical guidance on setting up and using authentication methods
   - How to configure and run tests with each authentication method
   - Command examples and parameter explanations
   - Troubleshooting common authentication issues

2. **[Authentication Security Architecture](authentication-security.md)** - Technical details for security professionals
   - Detailed security implementation with sequence diagrams
   - Encryption mechanisms and data protection
   - Integration with enterprise security systems

## Key Features

Test Engine authentication supports:

- **Modern Authentication** - Microsoft Entra integration with MFA and conditional access
- **Flexible Storage Options** - Local encryption or Dataverse-based secure storage
- **Automation Support** - Non-interactive execution for CI/CD scenarios
- **Enterprise Security** - Integration with organizational security policies

## Choose the Right Authentication Method

Select the best authentication approach based on your specific testing needs:

| Scenario | Recommended Method | Key Considerations |
|----------|-------------------|-------------------|
| Development environment | Browser-based | Simple setup, interactive first sign-in |
| Testing with MFA | Browser-based | Supports all Microsoft Entra authentication methods |
| Automated CI/CD | Certificate-based | No user interaction required |
| Dataverse integration | Certificate-based | Enhanced security integration |

## What's New in Authentication

The Test Engine's authentication has evolved significantly to enhance security:

- **Modern Authentication** - Moved from basic authentication to modern Microsoft Entra authentication
- **MFA Support** - Full support for multifactor authentication requirements
- **Secure Storage** - Encrypted storage of authentication state
- **Conditional Access** - Integration with organizational security policies

## Next Steps

1. [**Get Started with Authentication**](authentication-guide.md)
   - Learn how to configure and use each authentication method
   - Find command examples and troubleshooting tips
   
2. [**Understand the Security Architecture**](authentication-security.md)
   - Explore the technical implementation details
   - Review integration with enterprise security systems

3. [**Explore Application Types**](canvas-application.md)
   - Learn how authentication integrates with [canvas applications](canvas-application.md), [model-driven applications](model-driven-application.md), and [Dataverse extensions](dataverse.md)
   - Configure application-specific authentication options

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
