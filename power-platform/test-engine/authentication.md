---
title: "Authentication in Power Apps Test Engine (preview)"
description: "Describes authentication changes and options Test Engine"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Authentication in Power Apps Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Authentication is a critical component of the test automation process. This article focuses on browser-based authentication options within the Test Engine which offers a range of options to authenticate with Microsoft Entra.

<!-- 
I want to remove this image and replace with text.
I don't feel this image adds value, it seems more like a slide to speak over in a presentation rather than something than better communciates the information in docs. Pictures primarily including text should generally be avoided. 

-->

:::image type="content" source="media/authentication-options.png" alt-text="Overview of authentication options in Test Engine":::

<!-- Example columns start -->

:::row:::
   :::column::: 
   **Browser based** Persist session cookies
   :::column-end:::
   **Certificate based authentication**
   :::column:::
   :::column-end:::
    **Conditional access policy**
   :::column:::
   :::column-end:::
:::row-end:::
:::row:::
   :::column:::
   - Requires user interaction with MFA
   - Governed by "Stay Signed In" and conditional access policies
   :::column-end:::
   :::column:::
   - Can configure a certificate as optional MFA configured for the user persona
   - Issue certificate and store in Release Aget (Power Automate Desktop of Build Agent)
   :::column-end:::
   :::column:::
   - Operating System, Intune Managed, Browser Type, Location, Risk Profile..
   - For projects like CoE Kit we use Windows 11, Intune managed agents with conditional access policy applied
   :::column-end:::
:::row-end:::


<!-- Example columns end -->

These methods can range to include the following scenarios:

- Allow persistent browser cookies governed by the guidelines provided in the Microsoft Entra documentation on [session lifetime](/entra/identity/conditional-access/concept-session-lifetime)
- Allow integration with [conditional access policies](/entra/identity/conditional-access/concept-conditional-access-policies).
- Allow for non-interactive execution of subsequent tests. 
- Allow for OAuth based authentication for Dataverse integration testing

## Browser-Based Authentication

Using persistent browser cookies allows for non-interactive execution of subsequent tests. This approach works with the conditional access policies of your environments and allows a quick and less intrusive process to authenticate as different test personas. The browser persistent browser based cookies are stored locally in windows encrypted using  [Windows Data Projection API](/dotnet/standard/security/how-to-use-data-protection) to protect and unprotect the values stored at rest.

During the first run, the user is prompted to enter their credentials interactively. These credentials are then saved securely in the browser's storage state, allowing for multifactor authentication (MFA).

### Example Command

To run tests using browser-based authentication, you can use the following pac test run command `(uses -u "storagestate" by default)`:

```cmd
pac test run -p "canvas" -test "testplan.te.yaml" -t aaaabbbb-0000-cccc-1111-dddd2222eeee -env 00aa00aa-bb11-cc22-dd33-44ee44ee44ee
```

## Playwright

Test Engine web based tests encapsulate browser automation using [Playwright](https://playwright.dev/dotnet/). The key class in this process is [BrowserContext](https://playwright.dev/dotnet/docs/api/class-browsercontext#browser-context-storage-state) that allows provide a way to operate multiple independent browser sessions. Specifically the key element is the use of storage state for this browser context, contains current cookies and local storage snapshot to allow interactive and headless sign-in.

## Initial sign-in

Using the storage state provider of Test Engine for web based [providers](./providers.md) the initial sign-in must be part of an interactive sign-in process. This process attempts to start a test session. When no previous storage state is available or valid the interactive user will be prompted to be logged in via Microsoft Entra before allowing access to the requested page. This sign-in process uses what ever Multi Factor and Conditional Access policies that have been applied to validate the user sign-in.

Including some further on possible settings for background reading:

- Configured [Authentication Methods](/entra/identity/authentication/concept-authentication-methods)
- [How it works: Microsoft Entra multifactor authentication](/entra/identity/authentication/concept-mfa-howitworks)
- [Reauthentication prompts and session lifetime for Microsoft Entra multifactor authentication](/entra/identity/authentication/concepts-azure-multi-factor-authentication-prompts-session-lifetime)
- [Web browser cookies used in Microsoft Entra authentication](/entra/identity/authentication/concept-authentication-web-browser-cookies)
- [What is Conditional Access?](/entra/identity/conditional-access/overview)
- [Configure adaptive session lifetime policies](/entra/identity/conditional-access/howto-conditional-access-session-lifetime)
- [Require a compliant device, Microsoft Entra hybrid joined device, or multifactor authentication for all users](/entra/identity/conditional-access/policy-alt-all-users-compliant-hybrid-or-mfa)
- [Microsoft Defender for Cloud Apps overview](/defender-cloud-apps/what-is-defender-for-cloud-apps)

The goal of the sign-in process it works with organization defined sign-in process so that defined authentication methods are validated.

## Microsoft Windows Local Storage State

![Overview diagram for Test Engine Local Storage State (Windows Only)](./media/test-engine-security-storage-state-local.png)

1. The current storage state user authentication provider is extended to Save and load the Playwright browser context as Encrypted values
2. Make use of the [Windows Data Projection API](/dotnet/standard/security/how-to-use-data-protection) to protect and unprotect the saved state at rest.
3. Save encrypted json file or retrieve unprotected JSON to the file system for use in other test sessions

## Certificate-Based Authentication

Certificate-based authentication is another method that can be used in the Power Apps Test Engine. This method requires X.509 certificates to be configured as an authentication method and optionally configured as a method of second-factor authentication. Certificates can be stored in the user's personal certificate store or in a secure location accessible by the pipeline. 

### Example Command

To run tests using certificate-based authentication `(uses -u "dataverse")`, you can use the following pac test run command:

```powershell
pac test run -p "canvas" `
   -u "dataverse" `
   -a "certstore" `
   -test "testplan.te.yaml" `
   -t aaaabbbb-0000-cccc-1111-dddd2222eeee `
   -env 00aa00aa-bb11-cc22-dd33-44ee44ee44ee
```

> [!NOTE]
> You can select `certstore` or `certenv` for the authentication provider "-a". `certstore` uses environment variable `$env:DataProtectionCertificateName` with the Certificate name in local windows store. `certenv` uses base 64 encoded certificate in the variable found in `$env:DataProtectionCertificateName`, for example DataProtectionCertificateName="SampleCertificateVariableName" and  SampleCertificateVariableName="*Encoded Certificate Value*".

### Technical Overview

![Overview diagram for Test Engine Storage State](./media/test-engine-security-storage-state.png)

- The current storage state user authentication provider is extended to Save and load the Playwright browser context as Encrypted values
- Make use of the Microsoft.AspNetCore.DataProtection package to offer Windows Data Protection (DAPI) or Certificate public / private encryption
- Use the current logged in Azure CLI session to obtain an access token to the Dataverse instance where Test Engine Key values and encrypted key data is stored
- Use a custom xml repository that provides the ability query and create Data Protection state by implementing IXmlRepository
- Store XML state of data protection in Dataverse Table. Encryption of XML State managed by Data Protection API and selected protection providers
- Make use of Dataverse Security model, sharing and auditing features are enabled to control access and record access to key and key data. Data Protection API is used to decrypt values and apply the state json to other test sessions.
- Use the Data Protection API to decrypt the encrypted value using Windows Data Protection API (DAPI) or X.509 certificate private key.
- A future option could also consider adding integration with [Azure Key Vault](/aspnet/core/security/key-vault-configuration)

#### Windows Data Protection API

Dataverse based storage of persona cookies make use of .NET to provide access to the data protection API (DPAPI). This approach allows you to encrypt data using information from the current user account or computer. When you use the DPAPI, you alleviate the difficult problem of explicitly generating and storing a cryptographic key.

#### Data Protection API

The [Microsoft.AspNetCore.DataProtection](/aspnet/core/security/data-protection/introduction) package offers Windows Data Protection (DAPI) or Certificate public/private encryption. This ensures that sensitive data, such as sign-in tokens, is securely encrypted and stored.

Key information to review for readers that are unfamiliar with Data Protection API:

- [Authenticated encryption details in ASP.NET Core](/aspnet/core/security/data-protection/implementation/authenticated-encryption-details) with `ES-256-CBC` + `HMACSHA256`
- [Key management in ASP.NET Core](/aspnet/core/security/data-protection/implementation/key-management)
- [Custom key repository](/aspnet/core/security/data-protection/implementation/key-storage-providers#custom-key-repository)
- [Windows DPAPI key encryption at rest](/aspnet/core/security/data-protection/implementation/key-encryption-at-rest#windows-dpapi) encryption mechanism for data that's never read outside of the current machine. Only applies to Windows deployments.
- [X.509 certificate key encryption at rest](/aspnet/core/security/data-protection/implementation/key-encryption-at-rest#x509-certificate)

##### DPAPI Encryption

By default data values are encrypted with `ES-256-CBC` and `HMACSHA256`. 

`ES-256-CBC` stands for 'AES-256 in Cipher Block Chaining (CBC) mode'. AES (Advanced Encryption Standard) is a widely used encryption algorithm that ensures data confidentiality. `256` refers to the key size, which is 256 bits. CBC mode is a method of encrypting data in blocks, where each block of plaintext is XORed with the previous ciphertext block before being encrypted. This ensures that identical plaintext blocks produce different ciphertext blocks, enhancing security.

`HMACSHA256` stands for "Hash-based Message Authentication Code using SHA-256." Hash-Based Message Authentication Code (HMAC) is a mechanism that provides data integrity and authenticity by combining a cryptographic hash function (in this case, SHA-256) with a secret key. SHA-256 is a member of the SHA-2 family of cryptographic hash functions, producing a 256-bit hash value.

When combined, `ES-256-CBC` + `HMACSHA256` provides both encryption and authentication:

- Encryption with `AES-256-CBC`: The data is encrypted using AES-256 in CBC mode, ensuring that the data is confidential and can't be read by unauthorized parties.
- Authentication with `HMACSHA256`: An HMAC is generated using SHA-256 and a secret key. This HMAC is appended to the encrypted data. When the data is received, the HMAC can be recalculated and compared to the appended HMAC to verify that the data hasn't been tampered with.

This combination ensures that the data is both encrypted (confidential) and authenticated (integrity and authenticity), providing a robust security mechanism.

### Dataverse Integration

The current logged-in Azure CLI session is used to obtain an access token to the Dataverse instance where Test Engine key values and encrypted key data are stored. The Dataverse security model, sharing, and auditing features are enabled to control access and record access to key and key data.

Further reading for readers unfamiliar with Azure CLI sign-in, Access Token, and Dataverse security model:
- [az sign-in](/cli/azure/reference-index#az-login)
- [az account get-access-token](/cli/azure/account#az-account-get-access-token) using Azure CLI to obtain access token. In this case it's used to obtain access token to integrate with Dataverse custom XML repository
- [Microsoft.PowerPlatform.Dataverse.Client](https://www.nuget.org/packages/Microsoft.PowerPlatform.Dataverse.Client/) used to access Custom XML Repository using the obtained access token
- [Security concepts in Microsoft Dataverse](../admin/wp-security-cds.md) where using User or Team owned records.
- [Granting permission to tables in Dataverse for Microsoft Teams](/power-apps/teams/dataverse-for-teams-table-permissions)
- [Record sharing](../admin/wp-security-cds.md#record-sharing) Individual records can be shared on a one-by-one basis with another user (interactive or application user).
- [Column-level security in Dataverse](../admin/wp-security-cds.md#column-level-security-in-dataverse)
- [System and application users](../admin/system-application-users.md). Specifically [application users](../admin/create-users.md#create-an-application-user) that could be used from the context of a CI/CD process.

### Custom XML Repository

A custom XML repository provides the ability to query and create Data Protection state by implementing [IXmlRepository](/aspnet/core/security/data-protection/extensibility/key-management#ixmlrepository). The XML state of data protection is stored in a Dataverse table, with encryption managed by the Data Protection API and selected protection providers.

Note the `IXmlRepository` doesn't need to parse the XML passing through them. They treat the XML documents as opaque and let higher layers of the Data Protection API worry about generating and parsing the documents.

### Decryption Process

The Data Protection API is used to decrypt the encrypted value using Windows Data Protection API (DAPI) or X509 certificate private key. This decrypted value is then applied to other test sessions.


## Conditional Access Policies

Conditional access policies play a crucial role in controlling browser-based authentication. These policies can be used to enforce specific requirements, such as the allowed browser agents, operating systems, and management policies. For instance, organizations that require that the machine running the tests on machines managed within Microsoft Intune. 

## Supporting multifactor authentication

The use of browser-based authentication in the test automation process is advantageous for supporting multifactor authentication (MFA). MFA is a security measure that requires users to provide multiple forms of verification before gaining access to a system. 

## Persistent Session State and Entra-Based Authentication Tokens

Persistent session state is a key feature of browser-based authentication. It allows users to remain signed in after closing and reopening their browser window. Test Engine uses Playwright to save and load persistent browser cookies, which store the authentication tokens issued by Microsoft Entra. These tokens enable non-interactive execution of subsequent tests, reducing the need for repeated authentication.

## Logging for the sign-in Process

If you encounter issues, the log level can be set to Debug or greater, which generates enhanced logs to summarize the sign-in process. This information includes:

- Selected Authentication Method
- Summary of the request sent as part of the sign-in process
- Network page requests and HTTP status codes

Using this information enables users to diagnose and resolve authentication issues that occur.

## Dataverse Authentication

Review the provider [Dataverse Integration](./providers.md#provider-dataverse-integration) for information on how to authenticate with Dataverse as part of tests.

## Test Engine Security - Authentication Changes

When the experimental release of the Test Engine was initially made available, the only authentication method provided was through environment variables for the username and password. This approach presented several issues. Firstly, it relied on Basic authentication, which is inherently less secure as it transmits credentials in an easily decodable format. Additionally, this method didn't align with Microsoft's strong recommendations for multifactor authentication (MFA), which is crucial for enhancing security by requiring multiple forms of verification.

The reliance on environment variables for authentication posed significant risks. Environment variables can be inadvertently exposed through logs, debugging sessions, or misconfigurations, leading to potential credential leaks. Moreover, Basic authentication doesn't provide the robust security measures needed to protect sensitive information, making it vulnerable to various attacks such as phishing and man-in-the-middle attacks.

In response to these security threats, the newer updates to the Test Engine introduce a new storage state provider that integrates with the browser's storage state. This update allows for multifactor authentication, significantly enhancing the security of the authentication process. 

The integration with the browser's storage state enables the use of modern authentication mechanisms, which support MFA. These mechanisms provide a more secure and seamless user experience by allowing users to authenticate through familiar and trusted interfaces. Overall, it allows the use of organization-controlled settings to manage the lifetime of the created persistent sign-in state.

In conclusion, the shift from environment variable-based authentication to a storage state provider that supports multifactor authentication marks a significant improvement in the security posture of the Test Engine. This change not only addresses the inherent vulnerabilities of Basic authentication but also aligns with Microsoft's broader security recommendations and initiatives, ensuring a more secure and reliable authentication process for users.

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
