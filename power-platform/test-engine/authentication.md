---
title: "Authentication in test engine"
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

# Authentication in Power Apps Test Engine

[!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Authentication is a critical component of the test automation process. This article focuses on browser-based authentication options within the Test Engine which offers a range of options to authenticate with Microsoft Entra.

:::image type="content" source="media/authentication-options.png" alt-text="Overview of authentication options in Test Engine":::

These methods can range to include the following scenarios:

- Allow persistent browser cookies governed by the guidelines provided in the Microsoft Entra documentation on [session lifetime](/entra/identity/conditional-access/concept-session-lifetime)
- Allow integration with [conditional access policies](/entra/identity/conditional-access/concept-conditional-access-policies).
- Allow for non-interactive execution of subsequent tests. 
- Allow for OAuth based authentication for Dataverse integration testing

## Browser-Based Authentication

<!-- TODO: Need some text between these headings -->

### Persistent Browser Cookies using Local Microsoft Windows

Using persistent browser cookies allows for non-interactive execution of subsequent tests. This approach works with the conditional access policies of your environments and allows a quick and less intrusive process to authenticate as different test personas. The browser persistent browser based cookies are stored locally in windows encrypted using  [Windows Data Projection API](/dotnet/standard/security/how-to-use-data-protection) to protect and unprotect the values stored at rest.

During the first run, the user is prompted to enter their credentials interactively. These credentials are then saved securely in the browser's storage state, allowing for  multifactor authentication (MFA).

### Example Command

To run tests using browser-based authentication, you can use the following pac test run command:

```cmd
pac test run -p "canvas" -i "testplan.te.yaml" -t ad3f05a5-0e5c-494b-9b8e-9dc5c197529a -e f4326efd-d0fc-4b9e-a21b-d3355f59d37c
```

### Technical Overview

![Overview diagram for Test Engine Local Storage State (Windows Only)](./media/test-engine-security-storage-state-local.png)

1. The current storage state user authentication provider is extended to Save and load the Playwright browser context as Encrypted values
2. Make use of the [Windows Data Projection API](/dotnet/standard/security/how-to-use-data-protection) to protect and unprotect the saved state at rest.
3. Save encrypted json file or retrieve unprotected JSON to the file system for use in other test sessions

## Certificate-Based Authentication

<!-- TODO: Need some text between these headings or remove the useless Overview heading -->

### Overview

Certificate-based authentication is another method that can be used in the Power Apps Test Engine. This method requires X.509 certificates to be configured as an authentication method and optionally configured as a method of second-factor authentication. Certificates can be stored in the user's personal certificate store or in a secure location accessible by the pipeline. This method is useful for scenarios where no user interaction is required.

### Example Command

To run tests using certificate-based authentication, you can use the following pac test run command:

```cmd
pac test run -p "canvas" -u "dataverse" -a "certstore" -i "testplan.te.yaml" -t ad3f05a5-0e5c-494b-9b8e-9dc5c197529a -e f4326efd-d0fc-4b9e-a21b-d3355f59d37c
```

### Technical Overview

![Overview diagram for Test Engine Storage State](./media/test-engine-security-storage-state.png)

1. The current storage state user authentication provider is extended to Save and load the Playwright browser context as Encrypted values
2. Make use of the Microsoft.AspNetCore.DataProtection package to offer Windows Data Protection (DAPI) or Certificate public / private encryption
3. Use the current logged in Azure CLI session to obtain an access token to the Dataverse instance where Test Engine Key values and encrypted key data is stored
4. Use a custom xml repository that provides the ability query and create Data Protection state by implementing IXmlRepository
5. Store XML state of data protection in Dataverse Table. Encryption of XML State managed by Data Protection API and selected protection providers
6. Make use of Dataverse Security model, sharing and auditing features are enabled to control access and record access to key and key data. Data Protection API is used to decrypt values and apply the state json to other test sessions.
7. Use the Data Protection API to decrypt the encrypted value using Windows Data Protection API (DAPI) or X.509 certificate private key.
8. A future option could also consider adding integration with [Azure Key Vault](/aspnet/core/security/key-vault-configuration?view=aspnetcore-9.0)

## Conditional Access Policies

<!-- TODO: Need some text between these headings or remove the useless Overview heading -->

### Overview

Conditional access policies play a crucial role in controlling browser-based authentication. These policies can be used to enforce specific requirements, such as the allowed browser agents, operating systems, and management policies. For instance, organizations that require that the machine running the tests on machines managed within Microsoft Intune. 

## Supporting multifactor authentication

The use of browser-based authentication in the test automation process is advantageous for supporting multifactor authentication (MFA). MFA is a security measure that requires users to provide multiple forms of verification before gaining access to a system. 

## Persistent Session State and Entra-Based Authentication Tokens

Persistent session state is a key feature of browser-based authentication. It allows users to remain signed in after closing and reopening their browser window. Test Engine uses Playwright to save and load persistent browser cookies, which store the authentication tokens issued by Microsoft Entra. These tokens enable non-interactive execution of subsequent tests, reducing the need for repeated authentication.

## Logging for the sign-in Process

<!-- TODO: Need some text between these headings -->

### Enhanced Logging Solution

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
