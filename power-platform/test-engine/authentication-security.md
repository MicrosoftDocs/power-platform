---
title: "Authentication Security Architecture in Test Engine (preview)"
description: "Technical overview of authentication security implementation in Test Engine"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/15/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Authentication Security Architecture in Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

This technical document outlines the security architecture of the authentication mechanisms in Power Apps Test Engine. For user-focused guidance on selecting and configuring authentication methods, see [Authentication Guide](./authentication-guide.md).

## Authentication Methods Overview

Test Engine supports two primary authentication methods:

1. **Storage State Authentication** - Based on persistent browser cookies and storage state
2. **Certificate-Based Authentication** - Based on X.509 certificates and Dataverse integration

Both methods are designed to support modern security requirements including Multi-Factor Authentication (MFA) and conditional access policies.

## Storage State Authentication Architecture

The storage state authentication method leverages Playwright's browser context management to securely store and reuse authentication tokens.

:::image type="content" source="media/authentication-flow.png" alt-text="Overview of authentication flow in Test Engine":::

### Windows Data Protection Implementation

The local storage state implementation uses the Windows Data Protection API (DPAPI) for secure storage:

:::image type="content" source="media/authentication-dpapi.png" alt-text="Overview of authentication using local Windows Data Protection API (DPAPI)":::

### Security Considerations

The storage state security architecture provides:

- Protection of authentication tokens at rest using DPAPI encryption
- Support for Microsoft Entra MFA and conditional access policies
- Sandbox isolation through Playwright's browser contexts
- Compliance with Microsoft Entra session lifetime policies

## Certificate-Based Authentication Architecture

Certificate-based authentication integrates with Dataverse and uses X.509 certificates for enhanced security and encryption of the information at rest.

:::image type="content" source="media/authentication-dataverse.png" alt-text="Overview of authentication using Dataverse":::

### Dataverse Storage Implementation

The Dataverse implementation uses a custom XML repository for secure storage of protection keys:

:::image type="content" source="media/authentication-encryption.png" alt-text="Overview of  Dataverse storage of values":::

## Encryption Technology

### AES-256-CBC + HMACSHA256

By default, data values are encrypted with a combination of AES-256-CBC and HMACSHA256:

:::image type="content" source="media/authentication-dataverse.png" alt-text="Overview of  Dataverse encryption using ASP.Net Data Protection API":::

This provides:

1. **Confidentiality** through AES-256 encryption
2. **Integrity** through HMAC verification
3. **Authentication** of the data source

## Data Protection API Integration

The Test Engine integrates with ASP.NET Core's Data Protection API for key management and encryption:

:::image type="content" source="media/authentication-aspnet-dataprotection.png" alt-text="Overview of  Dataverse Data Protection API usage":::

## Custom XML Repository Implementation

Test Engine implements a custom IXmlRepository for Dataverse integration:

:::image type="content" source="media/authentication-custom-xml.png" alt-text="Overview of   Data Protection API custom xml provider":::

## Conditional Access and MFA Compatibility

Test Engine's authentication architecture is designed to work seamlessly with Microsoft Entra conditional access policies:

:::image type="content" source="media/authentication-cas-mfa.png" alt-text="Overview of   Conditional Access Policy and Multi Factor Authentication":::

## Advanced Security Considerations

### Dataverse Security Model Integration

Test Engine leverages Dataverse's robust security model:

- **Record-Level Security** - Controls access to stored authentication data
- **Sharing Model** - Enables secure sharing of test authentication contexts
- **Auditing** - Tracks access to sensitive authentication data
- **Column-Level Security** - Provides granular protection of sensitive fields

### Azure CLI Token Management

For Dataverse authentication, Test Engine securely obtains access tokens:

:::image type="content" source="media/authentication-az-cli.png" alt-text="Overview of Azure Command Line (CLI) based authentication":::

## Security Best Practices

When implementing Test Engine authentication, consider these security best practices:

1. **Least privilege access** - Grant minimal necessary permissions to test accounts
2. **Regular certificate rotation** - Update certificates periodically
3. **Secure CI/CD variables** - Protect pipeline variables containing sensitive data
4. **Audit access** - Monitor access to authentication resources
5. **Environment isolation** - Use separate environments for testing

## Future Security Enhancements

Potential future enhancements to the authentication security architecture include:

- Integration with Azure Key Vault for enhanced secret management
- Support for managed identities in Azure environments
- Enhanced logging and security monitoring capabilities
- Additional protection providers for cross-platform scenarios

## References and Further Reading

For more details on the underlying technologies:

- [Data Protection in ASP.NET Core](/aspnet/core/security/data-protection/introduction)
- [Windows Data Protection API](/dotnet/standard/security/how-to-use-data-protection)
- [Microsoft Entra authentication](/entra/identity/authentication/overview-authentication)
- [Dataverse security model](../admin/wp-security-cds.md)
- [X.509 certificate-based authentication](/entra/identity/authentication/concept-certificate-based-authentication)

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
