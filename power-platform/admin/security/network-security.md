---
title: Use network security features
description: Learn how to manage network security in Power Platform admin center.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/14/2024
ms.custom: ignite-2024
author: matapg007
ms.author: matgupta
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Use network security features
                                                  
In today's digital landscape, ensuring robust network security is paramount for safeguarding sensitive data and maintaining operational integrity. Power Platform offers comprehensive network security features, including IP firewall and Virtual Network (VNet) support, to enhance the security posture of your organization's applications and data.

## IP firewall 
This security control applies to only Managed Environments with Dataverse. The IP firewall feature in Power Platform provides a critical layer of security by controlling inbound  traffic to  Power Platform environments. This feature allows administrators to define and enforce IP-based access controls, ensuring that only authorized IP addresses can access the Power Platform environment. By using IP firewall, organizations can mitigate risks associated with unauthorized access and data breaches, which enhances the overall security of their Power Platform deployments. Learn more in [IP firewall in Power Platform environments](../ip-firewall.md).
  
## IP address-based cookie binding
This feature applies to only Managed Environments with Dataverse. It prevents session hijacking exploits in Dataverse with IP address-based cookie binding. Learn more in [Safeguarding Dataverse sessions with IP cookie binding](../block-cookie-replay-attack.md).
  
## Azure Virtual Network policies
This feature applies only to Managed Environments. Virtual Network (VNet) support in Power Platform enables organizations to isolate their network traffic and enforce stringent security policies. Virtual Network integration allows Power Platform environments to securely connect to on-premises networks and other Azure services, ensuring that data remains within trusted network boundaries. This feature is beneficial for scenarios requiring high levels of data protection and compliance, as it provides granular control over egress network traffic from Power Platform and helps mitigates data exfiltration risk. Learn more in [Virtual Network support overview](../vnet-support-overview.md).

