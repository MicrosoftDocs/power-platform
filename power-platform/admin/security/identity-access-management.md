---
title: Identity and access management
description: Learn how to manage identity and access management in the Power Platform admin center with security features available.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/29/2025
ms.custom: NewPPAC
author: matapg007
ms.author: matgupta
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Identity and access management
Make sure authorized users are the only people who can access sensitive data in items across this tenant.

## IP firewall 
This security control applies to only Managed Environments with Dataverse. The IP firewall feature in Power Platform provides a critical layer of security by controlling inbound  traffic to  Power Platform environments. This feature allows administrators to define and enforce IP-based access controls, ensuring that only authorized IP addresses can access the Power Platform environment. By using IP firewall, organizations can mitigate risks associated with unauthorized access and data breaches, which enhances the overall security of their Power Platform deployments. Learn more in [IP firewall in Power Platform environments](../ip-firewall.md).
  
## IP address-based cookie binding
This feature applies to only Managed Environments with Dataverse. It prevents session hijacking exploits in Dataverse with IP address-based cookie binding. Learn more in [Safeguarding Dataverse sessions with IP cookie binding](../block-cookie-replay-attack.md).

## Tenant isolation 
Tenant isolation lets Power Platform administrators govern the movement of tenant data from Microsoft Entra-authorized data sources to and from their tenant. Learn more in [Cross-tenant inbound and outbound restrictions](../cross-tenant-restrictions.md).

## Environment security groups 
Setting up security groups helps control which licensed users can access environments. Learn more in [Control user access to environments: security groups and licenses](../control-user-access.md).

## Manage sharing 
This feature applies to Managed Environments only. Sharing gives administrators the ability to control who and what their makers can share&mdash;like canvas apps, cloud flows, and agents&mdash;with other individual users and security groups, which ensures that sensitive information is available only to authorized users, reducing the risk of data breaches and misuse. Learn more in [Limit sharing](../managed-environment-sharing-limits.md).

## App access control (preview)
This feature applies to Managed Environments only. Prevent data exfiltration by controlling which apps are allowed and blocked in each environment. Learn more in [Control which apps are allowed in your environment](/power-platform/admin/control-app-access-environment).

## Guest access (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

Minimizing the risk of over-sharing is crucial in ensuring data security and compliance within the Power Platform ecosystem. All new Dataverse-backed environments prohibit guest access, ensuring security by default. You can allow guest access for an environment if your business use case requires it. You can also retroactively turn off guest access for existing environments, which blocks connections to resources guests may have already had access to.  

### Configure guest access
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a system administrator.
1. In the navigation pane, select **Security**.
1. In the **Security** section, select **Identity and access**.
1. In the **Identity and access** section, select **Guest access**.
1. The **Guest access** pane appears. Select the environment for which you want to turn off guest access.
1. Select **Configure guest access**.
1. Turn on the **Turn off guest access** option.
1. Select **Save**.
1. The **Guest access** pane is displayed again. Repeat steps 5-8. Close the pane when you're done.

### Improve your security score and act on recommendations 
Restricting guest access is a pivotal way to improve your tenant’s security posture. You can also take action by directly selecting the **Restrict guest user access** recommendation from the main security page, or the action center in the Power Platform admin center. After configuring guest access restrictions, your tenant’s security score improves based on the number of environments configured.  

### Latency considerations 
The time it takes to effectively block guest access varies based on the volume of environments and resources within those environments. For the most extreme cases, the latency for full enforcement is 24 hours.  

### Known limitations 
Guest access is a preview feature with more enhancements to come. The following are some known limitations.

- Blocking guest access prevents any guest from saving and using resources. It may not prevent a guest from accessing the Power Apps maker portal.  
- Items made in Copilot Studio may use graph connectors as knowledge sources from outside of Power Platform. The information in them may be accessible to guests, for now, even if guest access is blocked. 

## Administrator privileges (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

This feature applies to Managed Environments only. You can improve the security score of your tenant by limiting the number of users who have high privileged, administrative roles in Microsoft Entra ID and Power Platform. This feature allows you to review users who have these privileged roles, review the user list, and remove users who should no longer have privileged access. Learn more in [Administer Microsoft Power Platform](../admin-documentation.md).

### Users with administrative privileges
The **Administrative privileges** pane provides a proactive recommendation if your tenant has many users with administrative privileges. You can open the recommendation which shows you a list of environments with many users&mdash;currently more than 20 users&mdash;with the system administrator security role. Select the link below the **System administrators** column for any listed environment to display the **Security roles** page. From there, you can select the **System administrator** security role and select **Membership** to view a list of users with the role assignment. From the **Membership** page, you can select users to remove from the role, one user at a time. 

> [!Note]
> Only users assigned to the Global administrator role can remove other users from the Global administrator role.

### Known issues
Be aware of the following known issues with the feature:

- The security role **Membership** page displays only the security roles in the default business unit. Turn off the **Display only parent security roles** option to list all security roles across all business units.
- After you remove a user from the system administrator role, it takes around 24 hours for the updated admin count to display on the page.

