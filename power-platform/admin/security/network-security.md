---
title: Network security (preview)
description: Learn how to manage network security in Power Platform admin center.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/24/2024
author: matapg007
ms.author: matgupta
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Network security (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]
                                                  
Network security is crucial for protecting applications and cloud workloads from network-based cyberattacks. It's important because it helps safeguard organizational data, ensures secure access to applications, and protects against potential threats and vulnerabilities. It involves several key features.

- **IP firewall**: This feature is applicable to only Managed Environments with Dataverse. The IP firewall helps to protect your organizational data by limiting user access to Dataverse from only allowed IP locations. The IP firewall analyzes the IP address of each request in real-time. Learn more in [IP firewall in Power Platform environments](../ip-firewall.md).
  
- **IP address-based cookie binding**: This feature is applicable to only Managed Environments with Dataverse. It prevents session hijacking exploits in Dataverse with IP address-based cookie binding. Learn more in [Safeguarding Dataverse sessions with IP cookie binding](../block-cookie-replay-attack.md).
  
- **Azure Virtual Network policies**: This feature is applicable only to Managed Environments. Setting up Azure Virtual Network helps you integrate Power Platform with resources inside your virtual network without exposing them over the public internet. Learn more in [Virtual Network support for Power Platform overview](../vnet-support-overview.md).

