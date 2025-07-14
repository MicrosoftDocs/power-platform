---
title: Identity and access management
description: Learn how to manage identity and access in the Power Platform admin center by using the available security features.
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 07/14/2025
ms.custom: NewPPAC
author: matapg007
ms.author: matgupta
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - 
---

# Identity and access management

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Ensure that authorized users are the only people who can access sensitive data in items across your tenant.

## IP firewall

The IP firewall feature in Microsoft Power Platform is a security control that applies only to Managed Environments with Dataverse. It provides a critical layer of security by controlling inbound traffic to Power Platform environments. Administrators can use this feature to define and enforce IP-based access controls. In this way, they can ensure that only authorized IP addresses can access the Power Platform environment. By using IP firewall, organizations can mitigate risks that are associated with unauthorized access and data breaches, and therefore enhance the overall security of their Power Platform deployments. Learn more in [IP firewall in Power Platform environments](../ip-firewall.md).

## Tenant isolation

By using tenant isolation, Power Platform administrators can govern the movement of tenant data from Microsoft Entra-authorized data sources to and from their tenant. Learn more in [Cross-tenant inbound and outbound restrictions](../cross-tenant-restrictions.md).

## IP address-based cookie binding

The IP address-based cookie binding feature applies only to Managed Environments with Dataverse. It prevents session hijacking exploits in Dataverse through IP address-based cookie binding. Learn more in [Safeguarding Dataverse sessions with IP cookie binding](../block-cookie-replay-attack.md).

## Environment security groups

Security groups help control which licensed users can access environments. Learn more in [Control user access to environments with security groups and licenses](../control-user-access.md).

## Manage sharing

The manage sharing feature applies only to Managed Environments. By using sharing, administrators can control what their makers can share, and which other individual users and security groups they can share it with. (Examples of things that might be shared include canvas apps, cloud flows, and agents.) This feature ensures that sensitive information is available only to authorized users. Therefore, it reduces the risk of data breaches and misuse. Learn more in [Limit sharing](../managed-environment-sharing-limits.md).

## App access control (preview)

The app access control feature applies only to Managed Environments. It prevents data exfiltration by controlling which apps are allowed and blocked in each environment. Learn more in [Control which apps are allowed in your environment](/power-platform/admin/control-app-access-environment).

## Guest access (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

To ensure data security and compliance in the Power Platform ecosystem, it's crucial that you minimize the risk of oversharing. Therefore, all new Dataverse-backed environments prohibit guest access by default. However, you can allow guest access for an environment if your business use case requires it. You can also retroactively turn off (restrict) guest access for existing environments. In this case, you block connections to resources that guests previously had access to.

### Configure guest access

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a system administrator.
1. In the navigation pane, select **Security**.
1. In the **Security** section, select **Identity and access**.
1. In the **Identity and access** section, select **Guest access**.
1. In the **Guest access** pane, select the environment for which you want to turn off guest access.
1. Select **Configure guest access**.
1. Turn on the **Turn off guest access** option.
1. Select **Save**. The **Guest access** pane reappears.
1. Repeat steps 5 through 8 for other environments as required.
1. When you finish, close the **Guest access** pane.

### Improve your security score and act on recommendations

Restriction of guest access is a key way to improve your tenant's security posture. You can also take direct action by selecting the **Restrict guest user access** recommendation on the main **Security** page or in the actions page in the Power Platform admin center. After you configure guest access restrictions, your tenant's security score improves, based on the number of environments that are configured.

### Latency considerations

The time that is required to effectively block guest access varies, depending on the volume of environments and resources in those environments. In the most extreme cases, the latency for full enforcement is 24 hours.

### Known limitations

Guest access is a preview feature. More enhancements are planned. It has the following known limitations, among others:

- By blocking guest access, you prevent any guest from saving and using resources. However, a guest might not be prevented from accessing the Power Apps maker portal.
- Items that are made in Copilot Studio might use graph connectors as knowledge sources from outside Microsoft Power Platform. Currently, the information in them might be accessible to guests, even if guest access is blocked.

## Administrator privileges (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

The administrator privileges feature applies only to Managed Environments. By limiting the number of users who have high-privileged, administrative roles in Microsoft Entra ID and Microsoft Power Platform, you can improve the security score of your tenant. You can use this feature to review users who have those privileged roles, review the user list, and remove users who should no longer have privileged access. Learn more in [Overview of the Power Platform admin center](../admin-documentation.md).

### Users with administrative privileges

The **Administrative privileges** pane provides a proactive recommendation if many users in your tenant have administrative privileges. You can open the recommendation to view a list of environments where many users have the System administrator security role. (Currently, the list shows environments where more than 20 users have that role.) For any environment in the list, select the link in the **System administrators** column to open the **Security roles** page. There, you can select the **System administrator** security role and then select **Membership** to open the **Membership** page. This page shows a list of users who have the role assignment. You can select users to remove from the role, one user at a time.

> [!NOTE]
> Only users who are assigned to the Global administrator role can remove other users from the Global administrator role.

### Known issues

Be aware of the following known issues with the feature:

- The **Membership** page for the security role shows only the security roles in the default business unit. To view all security roles across all business units, turn off the **Display only parent security roles** option.
- After you remove a user from the System administrator role, it takes about 24 hours for the page to show the updated administrator count.

## Authentication for agents
This feature allows administrators to enforce authentication standards by configuring either Microsoft Entra ID authentication or manual authentication. It helps prevent makers from creating or using agents with no authentication, such as anonymous access across environments, thereby securing your agents and helping keep data protected.
