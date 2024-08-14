---
title: Security considerations for intelligent application workloads
description: Security considerations for intelligent application workloads TODO
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/12/2024
ms.subservice: well-architected
ms.topic: conceptual
---

# Security considerations for intelligent application workloads

Security is crucial for any architecture. Microsoft Power Platform offers a comprehensive range of tools to effectively secure your intelligent application workload. This article describes security considerations and recommendations for developing intelligent application workloads with Power Platform. For more information, see [Copilot Studio security and governance](/microsoft-copilot-studio/security-and-governance) and [Security in Microsoft Power Platform](/power-platform/admin/security/overview).

You should periodically assess the services and technologies you employ to ensure that your security measures align with the changing threat landscape.

## User authentication and access control

Implement robust authentication and access control measures to ensure authorized users can access Copilot. Ensuring only authorized users can access the Copilot is the foundation of security. Implementing MFA adds an extra layer of security – learn more https://learn.microsoft.com/en-us/entra/fundamentals/how-subscriptions-associated-directory

## Compliance

Ensuring that data is protected and managed in compliance with regulatory requirements. Protecting the data handled by the HR helpdesk is critical to maintaining trust and adhering to legal and regulatory standards – learn more https://learn.microsoft.com/en-us/power-platform/well-architected/security/principles#design-to-protect-confidentiality

## Integration

Secure all integrations with service principals and other best practices.
The HR helpdesk needs to integrate with other systems to access and process data. Using service principals ensures connections are secure and do not rely on individual credentials. – learn more https://learn.microsoft.com/en-us/power-platform/well-architected/security/principles#design-for-integration-security

## Ongoing monitoring and auditing

Continuously monitor and audit the Copilots activities to detect and respond proactively. Security is an ongoing process, not one-time configuration. Regular monitoring and auditing user access and interactions are essential – learn more https://learn.microsoft.com/en-us/microsoft-copilot-studio/admin-logging-copilot-studio






