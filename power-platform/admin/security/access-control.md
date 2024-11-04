---
title: Access controls
description: Learn how to manage access controls in the Power Platform admin center.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/04/2024
author: matapg007
ms.author: matgupta
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Access controls
                                                  
Access controls are a fundamental aspect of securing modern IT environments, particularly within cloud-based platforms such as Azure Virtual Networks and Power Platform. These controls are designed to ensure that only authorized users can access specific resources by protecting sensitive data and maintaining the integrity of organizational systems.

## Tenant isolation 
Tenant isolation lets Power Platform administrators govern the movement of tenant data from Microsoft Entra-authorized data sources to and from their tenant. Learn more in [Cross-tenant inbound and outbound restrictions](../cross-tenant-restrictions.md).

## Data policies 
Setting up data policies at the environment or tenant-level acts as guardrails to help reduce the risk of users from unintentionally exposing organizational data. Learn more in [Data policies](../wp-data-loss-prevention.md).

> [!Note]
> The recommendation for data policies is triggered when there is no tenant-level policy defined. At this time, any environment-scoped data policies are not considered when performing the security assessment for the tenant.

## Environment security groups 
Setting up security groups helps control which licensed users can access environments. Learn more in [Control user access to environments: security groups and licenses](../control-user-access.md).

## Manage sharing 
This feature applies to Managed Environments only. Sharing gives administrators the ability to control who and what their makers can share&mdash;like canvas apps, cloud flows, and copilots&mdash;with other individual users and security groups, which ensures that sensitive information is available only to authorized users, reducing the risk of data breaches and misuse. Learn more in [Limit sharing](../managed-environment-sharing-limits.md).

## Guest access (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

You can bolster your security score by prohibiting guest access to your environment. This feature restricts anyone who is designated as a guest in your tenant in Microsoft Entra from interacting with any resources that have been shared with them or that they made.

> [!Note]
> Items made in Microsoft Copilot Studio may use Graph connectors as knowledge sources, and the information in them may be accessible to guests for now, even if this setting is on.

## Administrator privileges (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

This feature applies to Managed Environments only. You can improve the security score of your tenant by limiting the number of users who have high privileged, administrative roles in Microsoft Entra ID and Power Platform. This feature allows you to review users who have these privileged roles, review the user list, and remove users who should no longer have privileged access. Learn more in [Administer Microsoft Power Platform](../admin-documentation.md).

### Users with administrative privileges
The **Administrative privileges** pane provides a proactive recommendation if your tenant has many users with administrative privileges. You can open the recommendation which shows you a list of environments with many users&mdash;currently more than 20 users&mdash;with the system administrator security role. Select the link below the **System administrators** column for any listed environment to display the **Security roles** page. From there, you can select the **System administrator** security role and select **Membership** to view a list of users with the role assignment. From the **Membership** page, you can select users to remove from the role, one user at a time. 

> [!Note]
> Only users assigned to the Global administrator role can remove other users from the Global administrator role.

### Known issues
Be aware of the following known issues with the feature:

- The security role **Membership** page displays only the security roles in the default business unit. Turn off the **Display only parent security roles** option to list all security roles across all business units.
- After you remove a user from the system administrator role, it takes around 24 hours for the updated admin count to display on the page.
