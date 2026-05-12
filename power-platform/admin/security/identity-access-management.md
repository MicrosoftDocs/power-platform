---
title: Identity and access management
description: Learn how to manage identity and access in the Power Platform admin center by using the available security features.
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 03/09/2026
ms.custom: NewPPAC
author: matapg007
ms.author: matgupta
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - jahnavisunil
---

# Identity and access management

Ensure that only authorized users can access sensitive data in items across your tenant.

## IP firewall

The IP firewall feature in Microsoft Power Platform is a security control that applies only to Managed Environments with Dataverse. It provides a critical layer of security by controlling inbound traffic to Power Platform environments. Administrators can use this feature to define and enforce IP-based access controls. In this way, they can ensure that only authorized IP addresses can access the Power Platform environment. By using IP firewall, organizations can mitigate risks that are associated with unauthorized access and data breaches, and therefore enhance the overall security of their Power Platform deployments. To learn more, see [IP firewall in Power Platform environments](../ip-firewall.md).

## Tenant isolation

By using tenant isolation, Power Platform administrators can govern the movement of tenant data from Microsoft Entra-authorized data sources to and from their tenant. To learn more, see [Cross-tenant inbound and outbound restrictions](../cross-tenant-restrictions.md).

## IP address-based cookie binding

The IP address-based cookie binding feature applies only to Managed Environments with Dataverse. It prevents session hijacking exploits in Dataverse through IP address-based cookie binding. To learn more, see [Safeguarding Dataverse sessions with IP cookie binding](../block-cookie-replay-attack.md).

## Environment security groups

Use security groups to help control which licensed users can access environments. To learn more, see [Control user access to environments with security groups and licenses](../control-user-access.md).

## Manage sharing

The manage sharing feature applies only to Managed Environments. By using sharing, administrators can control what their makers can share, and which other individual users and security groups they can share it with. Examples of things that makers might share include canvas apps, cloud flows, and agents. This feature ensures that sensitive information is available only to authorized users. Therefore, it reduces the risk of data breaches and misuse. To learn more, see [Limit sharing](../managed-environment-sharing-limits.md).

## App access control (preview)

The app access control feature applies only to Managed Environments. It prevents data exfiltration by controlling which apps are allowed and blocked in each environment. To learn more, see [Control which apps are allowed in your environment](/power-platform/admin/control-app-access-environment).

## Guest access 

To ensure data security and compliance in the Power Platform ecosystem, minimize the risk of oversharing. Therefore, all new Dataverse-backed environments prohibit guest access to Dataverse data by default. However, you can allow guest access to Dataverse data in an environment if your business use case requires it. You can also retroactively turn off (restrict) guest access for Dataverse in existing environments. In this case, you block connections to resources that guests previously had access to. To learn more, see [Control guest access in Microsoft Power Platform environments](./guest-access.md).  

## Administrator privileges (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

The administrator privileges feature applies only to Managed Environments. By limiting the number of users who have high-privileged, administrative roles in Microsoft Entra ID and Microsoft Power Platform, you can improve the security score of your tenant. Use this feature to review users who have those privileged roles, review the user list, and remove users who should no longer have privileged access. To learn more, see [Overview of the Power Platform admin center](../admin-documentation.md).

### Users with administrative privileges

The **Administrative privileges** pane provides a proactive recommendation if many users in your tenant have administrative privileges. You can open the recommendation to view a list of environments where many users have the System administrator security role. (Currently, the list shows environments where more than 20 users have that role.) For any environment in the list, select the link in the **System administrators** column to open the **Security roles** page. There, you can select the **System administrator** security role and then select **Membership** to open the **Membership** page. This page shows a list of users who have the role assignment. You can select users to remove from the role, one user at a time.

  > [!NOTE]
  > Only users with appropriate permissions can remove other users from privileged administrative roles. For more information, see [Least privileged roles by task - Microsoft Entra ID](/entra/identity/role-based-access-control/delegate-by-task).

### Known problems

Be aware of the following known problems with the feature:

- The **Membership** page for the security role shows only the security roles in the default business unit. To view all security roles across all business units, turn off the **Display only parent security roles** option.
- After you remove a user from the System administrator role, it takes about 24 hours for the page to show the updated administrator count.

## Authentication for agents (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

By using this feature, administrators can set up authentication for all agent interactions in the environment. Admins can choose from the following options:

- **Authenticate with Microsoft or Authenticate Manually**: Force authentication through Microsoft Entra ID or [authenticate manually](/microsoft-copilot-studio/configuration-end-user-authentication#authenticate-manually). This option helps prevent makers from creating or using agents with no authentication.
- **No authentication**: Allow anonymous access.

For more information about the authentication options in Copilot Studio, see [Configure user authentication in Copilot Studio](/microsoft-copilot-studio/configuration-end-user-authentication).

The **Authentication for agents** feature is a modernized framework of the existing [virtual connector](../wp-data-loss-prevention.md#virtual-connectors), **Chat without Microsoft Entra ID**. It helps you scale through environment-level configurations and rules. If you use both the virtual connector and the **Authentication for agents** setting in the **Security** area of the Power Platform admin center, you must allow access in both places for it to be allowed at runtime. If you block anonymous access in either one of the places, the most restrictive behavior is enforced and access is blocked at runtime. For example, consider the information in the following table.

| Access in the virtual connector | Access in the _Authentication for agents_ settings in Power Platform admin center| Runtime enforcement |
|------|-----------------------------|----------------------|
| Blocked | Blocked | Blocked |
| Allowed | Blocked| Blocked|
| Blocked| Allowed | Blocked|
| Allowed| Allowed | Allowed|

We recommend that all customers move toward using the **Authentication for agents** setting in the Power Platform admin center to leverage the capability of groups and rules.

## Agent access channels (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

By using this feature, administrators can control where agents are published, so customers can engage across multiple platforms. Admins can select from multiple available channels, such as Microsoft Teams, Direct Line, Facebook, Dynamics 365 for Customer Service, SharePoint, and WhatsApp. 
 
The **Agent access channels** feature is a modernized framework of the existing [virtual connectors](../wp-data-loss-prevention.md#virtual-connectors). It helps you scale through environment-level configurations and rules. If you use both virtual connectors and the **Agent access channels** settings in the **Security** area of the Power Platform admin center, you must allow access in both places. If you block channel access in either one of the places, the most restrictive behavior is enforced and access is blocked. For example, consider the information in the following table.

| Access in the virtual connector | Access in the _Agent access channels_ settings in Power Platform admin center| Runtime enforcement |
|------|-----------------------------|----------------------|
| Blocked | Blocked | Blocked |
| Allowed | Blocked| Blocked|
| Blocked| Allowed | Blocked|
| Allowed| Allowed | Allowed|

We recommend that all customers move toward using the **Agent access channels** settings in the Power Platform admin center to leverage the capability of groups and rules.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
