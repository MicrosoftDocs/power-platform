---
title: Data protection and privacy
description: Learn how to manage data prorection and privacy in the Power Platform admin center with security features available.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/29/2025
author: matapg007
ms.custom: NewPPAC
ms.author: matgupta
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Data protection and privacy

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]
Make sure personal information is handled, stored, and protected securely; prevent unauthorized access to data; and protect apps and cloud workloads from network-based cyberattacks.

## Customer-managed encryption key
This feature applies to Managed Environments only. This feature allows customers to manage the key that encrypts Power Platform and Dynamics 365 data, preventing outside access to customer data and meeting data protection requirements. Learn more in [Manage your customer-managed encryption key](../customer-managed-key.md).

## Data policies 
Setting up data policies at the environment or tenant-level acts as guardrails to help reduce the risk of users from unintentionally exposing organizational data. Learn more in [Data policies](../wp-data-loss-prevention.md).

> [!Note]
> The recommendation for data policies is triggered when there is no tenant-level policy defined. At this time, any environment-scoped data policies are not considered when performing the security assessment for the tenant.

## Azure Virtual Network policies
This feature applies only to Managed Environments. Virtual Network support in Power Platform allows organizations to isolate their network traffic and enforce stringent security policies. Virtual Network integration allows Power Platform environments to securely connect to on-premises networks and other Azure services, ensuring that data remains within trusted network boundaries. This feature is beneficial for scenarios requiring high levels of data protection and compliance, as it provides granular control over egress network traffic from Power Platform and helps mitigates data exfiltration risk. Learn more in [Virtual Network support overview](../vnet-support-overview.md).
