---
title: Access controls (preview)
description: Learn how to manage access controls in the Power Platform admin center.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/23/2024
author: matapg007
ms.author: matgupta
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Access controls (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]
                                                  
Access controls are a fundamental aspect of securing modern IT environments, particularly within cloud-based platforms such as Azure Virtual Networks and Power Platform. These controls are designed to ensure that only authorized users can access specific resources, thereby protecting sensitive data and maintaining the integrity of organizational systems.

- **Tenant isolation**: Tenant isolation lets Power Platform administrators govern the movement of tenant data from Microsoft Entra-authorized data sources to and from their tenant. Learn more in [Cross-tenant inbound and outbound restrictions](../cross-tenant-restrictions.md).

- **Data policies**: Setting up data policies at the environment or tenant-level acts as guardrails to help reduce the risk of users from unintentionally exposing organizational data. Learn more in [Data policies](../wp-data-loss-prevention.md).

    > [!Note]
    > The recommendation for data policies is triggered when there is no tenant-level policy defined. At this time, any environment-scoped data policies are not considered when performing the security assessment for the tenant.

- **Environment security group**: Setting up security groups helps control which licensed users can access environments. Learn more in [Control user access to environments: security groups and licenses](../control-user-access.md).

- **Manage sharing**: This feature is applicable to Managed Environments only.Sharing gives administrators the ability to control who and what their makers can share (like canvas apps, cloud flows, and copilots) with other individual users and security groups, thereby ensuring that sensitive information is available only to authorized users, reducing the risk of data breachers and misuse. Learn more in [Limit sharing](../managed-environment-sharing-limits.md).

- **App access control**
This feature is applicable to Managed Environments only.You can protect against data exfiltration by managing and controlling what apps can run in your Dataverse environment. Data exfiltration helps prevent sensitive information from unauthorized removal or extraction from your environment. This safeguard allows a business to maintain business continuity, comply with regulatory requirements, and keep up with competitive advantages.

    When this capability is activated in an environment, you can configure which apps are allowed or blocked in your environment. Malicious users can’t create or use unapproved apps to export sensitive data out of the environment.

- **Guest access**
You can bolster your security score by prohibiting guest access to your environment. This feature restricts anyone who is designated as a guest in your tenant in Microsoft Entra from interacting with any resources that have been shared with them or that they made. [Learn more](https://microsoft-my.sharepoint.com/personal/matgupta_microsoft_com/Documents/aka.ms/PowerPlatformGuestAccess).

    > [!Note]
    > Items made in Microsoft Copilot Studio may use Graph connectors as knowledge sources, and the information in them may be accessible to guests for now even if this setting is on.

- **Administrator privileges**
You can improve the security posture of your tenant by limiting the number of users who have high privileged, administrative roles in Microsoft Entra ID and Power Platform. This feature allows you to review users who have these privileged roles, review the user list, and remove users who should no longer have privileged access. Learn more in [Administer Microsoft Power Platform](../admin-documentation.md).

    > [!Note]
    >  Only users assigned to the global administrator role can remove other users from the global administrator role.

