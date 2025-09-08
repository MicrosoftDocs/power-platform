---
title: Data protection and privacy
description: Learn how to manage data protection and privacy in the Power Platform admin center by using the available security features.
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
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

Ensure that personal information is securely handled, stored, and protected. Prevent unauthorized access to data, and protect apps and cloud workloads from network-based cyberattacks.

## Customer-managed encryption key

The customer-managed encryption key feature applies only to Managed Environments. Customers can use this feature to manage the key that encrypts Microsoft Power Platform and Dynamics 365 data. In this way, they can prevent outside access to customer data and meet data protection requirements. Learn more in [Manage your customer-managed encryption key](../customer-managed-key.md).

## Data policies

Data policies that are set up at the environment or tenant level act as guardrails to help reduce the risk that users unintentionally expose organizational data. Learn more in [Data policies](../wp-data-loss-prevention.md).

> [!NOTE]
> The recommendation for data policies is triggered if no tenant-level policy is defined. Currently, environment-scoped data policies aren't considered when the security assessment is done for the tenant.

## Azure Virtual Network policies

The Azure Virtual Network policies feature applies only to Managed Environments. Organizations can take advantage of Virtual Network support in Microsoft Power Platform to isolate their network traffic and enforce stringent security policies. Through Virtual Network integration, Power Platform environments can securely connect to on-premises networks and other Azure services to ensure that data remains within trusted network boundaries. This feature provides granular control over egress network traffic from Microsoft Power Platform and helps mitigates data exfiltration risk. Therefore, it's beneficial in scenarios that require high levels of data protection and compliance. Learn more in [Virtual Network support overview](../vnet-support-overview.md).
