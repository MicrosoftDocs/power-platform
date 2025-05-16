---
title: "Authentication Guide for Power Apps Test Engine (preview)"
description: "User guide for authentication options in Test Engine"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/15/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Authentication Guide for Power Apps Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

This article provides guidance on how to use the authentication options available in Power Apps Test Engine. For a more detailed technical overview of the authentication architecture and security implementation, see [Authentication Security Architecture](./authentication-security.md).

## Authentication Options Overview

Power Apps Test Engine offers two primary authentication methods:

1. **Browser-based Authentication (Storage State)** - Uses persistent browser cookies to store authentication state
2. **Certificate-based Encryption (Dataverse)** - Uses X.509 certificates for encrypted authentication stored in Dataverse

Each method has its own benefits depending on your testing scenario:

| Authentication Method | Best For | Key Benefits |
|----------------------|----------|-------------|
| Browser-based (Default) | Interactive development, Testing with MFA | Works with conditional access policies, Simple setup |
| Certificate-based encryption| CI/CD pipelines, Automated environments | Non-interactive execution, Enhanced security |

## Using Browser-based Authentication

Browser-based authentication is the default method and is ideal for development environments and scenarios that require MFA. It uses persistent browser cookies to maintain your authentication state.

### How it works

1. During the first test run, you'll be prompted to sign in interactively
2. Your authentication state is securely saved locally (encrypted on Windows)
3. Subsequent test runs use the saved state without requiring re-authentication

### Running Tests with Browser-based Authentication

To run tests using browser-based authentication, use the following command:

```powershell
pac test run `
   --provider canvas `
   --test-plan-file "testplan.te.yaml" `
   --tenant aaaabbbb-0000-cccc-1111-dddd2222eeee `
   --environment-id 00aa00aa-bb11-cc22-dd33-44ee44ee44ee
```

This is the default behavior (`--user-auth Storagestate` is implicit), so you don't need to specify other authentication parameters.

### Benefits of Browser-based Authentication

- Supports Multi-Factor Authentication (MFA)
- Honors conditional access policies
- Works with Microsoft Entra session settings
- Allows for testing with different user personas
- Encrypted storage of authentication state

## Using Certificate-based Encryption

Certificate-based encryption is ideal for CI/CD pipelines and automated environments. It uses X.509 certificates for authentication and can be configured to work with Dataverse.

### Prerequisites

Before using certificate-based encryption:

1. Ensure you have a valid X.509 certificate
2. Configure User Account or Service Principal to access encrypted data
3. Set up the appropriate environment variables

### Running Tests with Certificate-based Encryption

To run tests using certificate-based authentication, use the following command:

```powershell
pac test run `
   --provider canvas `
   --user-auth Dataverse `
   --auth Certstore `
   --test-plan-file testplan.te.yaml `
   --tenant aaaabbbb-0000-cccc-1111-dddd2222eeee `
   --environment-id 00aa00aa-bb11-cc22-dd33-44ee44ee44ee
```

### Certificate Storage Options

You can store your certificate in one of two ways:

1. **Certificate Store** (`--auth Certstore`):
   - Uses the certificate from your local Windows certificate store
   - Set the environment variable `$env:DataProtectionCertificateName` to the certificate name

   ```powershell
   $env:DataProtectionCertificateName = "YourCertificateName"
   ```

2. **Environment Variable** (`--auth Certenv`):
   - Uses a base64-encoded certificate from an environment variable
   - Set `$env:DataProtectionCertificateName` to the name of the environment variable containing the certificate
   - Set the referenced environment variable to the base64-encoded certificate value

   ```powershell
   $env:DataProtectionCertificateName = "SampleCertificateVariableName"
   $env:SampleCertificateVariableName = "BASE64_ENCODED_CERTIFICATE"
   ```

### Benefits of Certificate-based Encryption

- Non-interactive execution ideal for CI/CD pipelines
- Enhanced security through certificate-based encryption of data at rest
- Integration with Dataverse security model
- Support for automated test environments

## Dataverse Encryption

When working with Dataverse directly (for integration testing), use the `--user-auth Dataverse` option. This requires you to be logged in with Azure CLI:

```powershell
az login --use-device-code --allow-no-subscriptions
```

For more information on Dataverse integration, see [Test Dataverse extensions](./dataverse.md).

## Troubleshooting Authentication Issues

If you encounter authentication issues, you can enable detailed logging:

1. Set the log level to Debug or greater
2. Review the logs for:
   - Selected authentication method
   - Authentication request details
   - Network page requests and HTTP status codes

Common authentication issues include:

- Expired authentication tokens
- Missing or incorrect certificates
- Conditional access policy restrictions
- Dataverse permissions
- Network connectivity problems

## Next Steps

- Learn about the [security architecture of Test Engine authentication](./authentication-security.md)
- Explore [canvas application testing](./canvas-application.md) and [model-driven application testing](./model-driven-application.md)
- Understand [how to test Dataverse extensions](./dataverse.md)

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
