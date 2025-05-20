---
title: Protect application secrets recommendation for Power Platform workloads
description: Learn how to manage application secrets for Power Platform workloads.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 05/10/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for protecting application secrets

**Applies to this Power Platform Well-Architected Security checklist recommendation:**

|[SE:07](checklist.md)| **Protect application secrets by hardening their storage and restricting access and manipulation and by auditing those actions. Run a reliable and regular rotation process that can improvise rotations for emergencies.** |
|---|---|

This guide describes the recommendations for securing sensitive information in workloads. Proper management of secrets is crucial for maintaining the security and integrity of your application, workload, and associated data. Improper handling of secrets can lead to data breaches, service disruption, regulatory violations, and other issues.

Credentials, such as API keys, Open Authorization (OAuth) tokens, and Secure Shell (SSH) keys are secrets. Compliance requirements might cause configuration settings that aren't typically considered secret to be treated as application secrets.

**Definitions** 

| Term | Definition |
|---|---|
| Certificates | Digital files that hold the public keys for encryption or decryption. |
| Credentials | Information that's used to verify the identity of the publisher or consumer in a communication channel. |
| Credential scanning | The process of validating source code to make sure secrets aren't included. |
| Encryption | The process by which data is made unreadable and locked with a secret code. |
| Key | A secret code that's used to lock or unlock encrypted data. |
| Least-privilege access | A Zero Trust principle that aims at minimizing a set of permissions to complete a job function. |
| Managed identity | An identity that's assigned to resources and managed by Azure. |
| Nonsecret | Information that doesn't jeopardize the security posture of the workload if it's leaked. |
| Rotation | The process of regularly updating secrets so that, if they're compromised, they're available only for a limited time. |
| Secret | A confidential component of the system that facilitates communication between workload components. If leaked, secrets can cause a breach. |
| X.509 | A standard that defines the format of public key certificates. |

> [!Important]
> **Don't treat nonsecrets like secrets.** Secrets require operational rigor that's unnecessary for nonsecrets and that might result in extra costs.
>
> Application settings that are not secrets, such as the URLs of the APIs that the application needs, should be kept separate from the application code or application secrets. To store application configuration, consider using a custom connector or environment variables. Another option is to use a Dataverse table to store metadata about the application configuration. However, you’ll need to find a way to fill this data in a new environment, such as transferring config data from development to testing or production. You can use Dataflows to accomplish this.

## Key design strategies

Consider the following areas of concern before storing and managing secrets:

- Created secrets should be kept in secure storage with strict access controls.
- Secret rotation is a proactive operation, whereas revocation is reactive.
- Only trusted identities should have access to secrets.
- You should maintain an audit trail to inspect and validate access to secrets.

Build a strategy around these points to help prevent identity theft, avoid repudiation, and minimize unnecessary exposure to information.

### Safe practices for secret management

We recommend that keys have three distinct roles: user, administrator, and auditor. Role distinction helps to ensure that only trusted identities have access to secrets with the appropriate level of permission. Educate developers, administrators, and other relevant personnel about the importance of secret management and security best practices.

#### Preshared keys

**You can control access by creating distinct keys for each consumer.** For example, a client, like an app or flow, communicates with a third-party API using a preshared key. If another client needs to access the same API, they must use another key. Don't share keys even if two consumers have the same access patterns or roles. Consumer scopes might change over time, and you can't independently update permissions or distinguish usage patterns after a key is shared. Distinct access also makes revocation easier. If a consumer's key is compromised, it's easier to revoke or rotate that key without affecting other consumers.

This guidance applies to different environments. The same key shouldn't be used for both preproduction and production environments. If you're responsible for creating preshared keys, make sure you create multiple keys to support multiple clients.

For more information, see [Recommendations for identity and access management](identity-access.md).

#### Secret storage

**Use a secret management system**, like Azure Key Vault, to store secrets in a hardened environment, encrypt at-rest and in-transit, and audit access and changes to secrets. If you need to store application secrets, keep them outside the source code for easy rotation.

A dedicated secret management system makes it easy to store, distribute, and control access to application secrets. Only authorized identities and services should have access to secret stores. Access to the system can be restricted via permissions. Always apply the least-privilege approach when assigning permissions.

**You also need to control access at the secret level.** Each secret should only have access to a single resource scope. Create isolation boundaries so that a component is only able to use secrets that it needs. If an isolated component is compromised, it can't gain control of other secrets and potentially the entire workload. One way to isolate secrets is to use multiple key vaults. There's no added costs for creating extra key vaults.

**Implement auditing and monitoring for secret access.** Log who accesses secrets and when to identify unauthorized or suspicious activity. For information about logging from a security perspective, see [Recommendations for monitoring and threat detection](monitor-threats.md).

#### Secret rotation

**Have a process in place that maintains secret hygiene.** The longevity of a secret influences the management of that secret. To reduce attack vectors, secrets should be retired and replaced with new secrets as frequently as possible.

Handle OAuth access tokens carefully, taking into consideration their time to live. Consider if the exposure window needs to be adjusted to a shorter period. Refresh tokens must be stored securely with limited exposure to the application. Renewed certificates should also use a new key. For information about refresh tokens, see [Secure OAuth 2.0 On-Behalf-Of refresh tokens](/azure/architecture/example-scenario/secrets/secure-refresh-tokens).

**Replace secrets after they reach their end of life, are no longer used by the workload, or if they've been compromised.** Conversely, don't retire active secrets unless it's an emergency. You can determine a secret's status by viewing access logs. Secret rotation processes shouldn't affect the reliability or performance of the workload. Use strategies that build redundancy in secrets, consumers, and access methods for smooth rotation.

### Safe practices for using secrets

As a secret generator or operator, you should be able to distribute secrets in a safe manner. Many organizations use tools to securely share secrets both within the organization and externally to partners. In absence of a tool, have a process for properly handing off credentials to authorized recipients. Your disaster recovery plans should include secret recovery procedures. Have a process for situations where a key is compromised or leaked and needs to be regenerated on demand. Consider the following best practices for safety when using secrets:

#### Prevent hardcoding

**Don't hard code secrets as static text** in code artifacts such as cloud flows and canvas apps, configuration files, and build-deployment pipelines. This high-risk practice makes the code vulnerable because secrets are exposed to everyone with read access.

**Use tools that periodically detect exposed secrets** in your application code and build artifacts. You can add these tools as part of your deployment pipelines to scan for credentials before source code commits deploy. Review and sanitize application logs regularly to help ensure that no secrets are inadvertently recorded. You can also reinforce detection via peer reviews.

> [!NOTE]
> If the scanning tools discover a secret, that secret must be considered compromised. It should be revoked.

#### Respond to secret rotation

As a workload owner, you need to **understand the secret rotation plan and policies so that you can incorporate new secrets with minimal disruption to users.** When a secret is rotated, there might be a window when the old secret isn't valid, but the new secret hasn't been placed. During that window, the component that the workload is trying to reach doesn't acknowledge requests. You can minimize these issues by building retry logic into the code. You can also use concurrent access patterns that allow you to have multiple credentials that can be safely changed without affecting each other.

**Work with the operations team and be part of the change management process.** You should let credential owners know when you decommission a part of the workload that uses credentials that are no longer needed.

**Integrate secret retrieval and configuration into your automated deployment pipeline.** Secret retrieval helps to ensure secrets are automatically fetched during deployment. You can also use secret injection patterns to insert secrets into application code or configuration at runtime, which prevents secrets from being accidentally exposed to logs or version control.

## Power Platform facilitation

The following sections describe Power Platform features and capabilities you can use to manage application secrets.

### Use Azure Key Vault secrets

Environment variables allow for referencing secrets stored in Azure Key Vault. These secrets are then made available for use within Power Automate flows and custom connectors. Note that the secrets aren't available for use in other customizations or generally via the API.

The actual secrets are stored in Azure Key Vault and the environment variable references the key vault secret location. Using Azure Key Vault secrets with environment variables require that you configure Azure Key Vault so that Power Platform can read the specific secrets you want to reference. For more information, see [Use environment variables in solutions](/power-apps/maker/data-platform/environmentvariables) and [Use environment variables in solution custom connectors](/connectors/custom-connectors/environment-variables).

### Use Solution Checker

With the solution checker feature, you can perform a rich static analysis check on your solutions against a set of best practice rules and quickly identify these problematic patterns. After the check completes, you receive a detailed report that lists the issues identified, the components and code affected, and links to documentation that describes how to resolve each issue. Review the available solution checker rules in the Security category. For more information, see [Use solution checker to validate your solutions](/power-apps/maker/data-platform/use-powerapps-checker).

### Use CyberArk actions

CyberArk offers an identity security platform that secures human and machine identities from end-to-end. Power Automate desktop flows enable you to retrieve credentials from CyberArk. For more information, see [CyberArk actions](/power-automate/desktop-flows/actions-reference/cyberark).

## Related information

- [Use environment variables in solutions](/power-apps/maker/data-platform/environmentvariables)
- [Use environment variables in solution custom connectors](/connectors/custom-connectors/environment-variables)
- [Use solution checker to validate your solutions](/power-apps/maker/data-platform/use-powerapps-checker)
- [CyberArk actions](/power-automate/desktop-flows/actions-reference/cyberark)
- [Azure DevOps Credential Scanner task](/azure/security/develop/security-code-analysis-customize#credential-scanner-task)
- [Configure the Microsoft Security DevOps Azure DevOps extension](/azure/defender-for-cloud/azure-devops-extension)
- [Configure GitHub Advanced Security for Azure DevOps](/azure/devops/repos/security/configure-github-advanced-security-features)
- [Recommendations for monitoring and threat detection](monitor-threats.md)
- [Recommendations for identity and access management](identity-access.md)

## Security checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Security checklist](checklist.md)
