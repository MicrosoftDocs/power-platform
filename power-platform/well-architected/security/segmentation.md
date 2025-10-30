---
title: Build a segmentation strategy recommendation for Power Platform workloads
description: Learn how to create intentional segmentation in your architecture and workload design.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/18/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for building a segmentation strategy

**Applies to Power Platform Well-Architected Security checklist recommendation:**

|[SE:04](checklist.md)| **Create intentional segmentation and perimeters in your architecture design and the workload’s footprint on the platform. The segmentation strategy must include networks, roles and responsibilities, workload identities, and resource organization.** |
|---|---|

A segmentation strategy defines how you separate workloads from other workloads with their own set of security requirements and measures.

This guide describes the recommendations for **building a unified segmentation strategy**. Using perimeters and isolation boundaries in workloads, you can design a security approach that works for you.

**Definitions**

| Term | Definition |
|---|---|
| Containment | A technique to contain the blast radius if an attacker gains access to a segment. |
| Least-privilege access | A Zero Trust principle that aims at minimizing a set of permissions to complete a job function. |
| Perimeter | The trust boundary around a segment. |
| Resource organization | A strategy to group related resources by flows within a segment. |
| Role | A set of permissions needed to complete a job function. |
| Segment | A logical unit that's isolated from other entities and protected by a set of security measures. |

## Key design strategies

The concept of segmentation is commonly used for networks. However, the same underlying principle can be used throughout a solution, including segmenting resources for management purposes and access control.

Segmentation helps you **design a security approach that applies defense in depth** based on the principles of the Zero Trust model. Ensure that an attacker who breaches one segment can't gain access to another by segmenting workloads with different identity controls. In a secure system, different attributes, such as network and identity,  are used to block unauthorized access and hide the assets from being exposed.

Here are some examples of segments:

- Platform controls that define network boundaries
- Environments that isolate workloads of an organization
- Solutions that isolate workload assets
- Deployment environments that isolate deployment by stages
- Teams and roles that isolate job functions related to workload development and management
- Application tiers that isolate by workload utility
- Microservices that isolate one service from another

Consider these key elements of segmentation to make sure you're building a comprehensive defense in depth strategy:

- The **boundary or perimeter** is the entry edge of a segment where you apply security controls. Perimeter controls should block access to the segment unless explicitly allowed. The goal is to prevent an attacker from breaking through the perimeter and gaining control of the system. For example, a user might have access to an environment but can only launch specific applications in that environment based on their permissions.

- **Containment** is the exit edge of a segment that prevents lateral movement in the system. The goal of containment is to minimize the effect of a breach. For example, a virtual network might be used to configure routing and network security groups to only allow traffic patterns that you expect, avoiding traffic to arbitrary network segments.

- **Isolation** is the practice of grouping entities with similar assurances together to protect them with a boundary. The goal is ease of management and the containment of an attack within an environment. For example, you might group the resources that relate to a specific workload into one Power Platform environment or one solution, and then apply access control so that only specific workload teams can access the environment.

It's important to note the distinction between perimeters and isolation. Perimeter refers to the points of location that should be checked. Isolation is about grouping. Actively contain an attack by using these concepts together.

Isolation doesn't mean creating silos in the organization. A unified segmentation strategy provides alignment between the technical teams and sets clear lines of responsibility. Clarity reduces the risk of human error and automation failures that can lead to security vulnerabilities, operational downtime, or both. Suppose a security breach is detected in a component of a complex enterprise system. It's important that everyone understands who's responsible for that resource so that the appropriate person is included in the triage team. The organization and stakeholders can quickly identify how to respond to different kinds of incidents by creating and documenting a good segmentation strategy.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Segmentation introduces complexity because there's overhead in management.

> :::image type="icon" source="../_images/risk.svg"::: **Risk**: Micro-segmentation beyond a reasonable limit loses the benefit of isolation. When you create too many segments, it becomes difficult to identify points of communication or to allow for valid communication paths within the segment.

### Identity as the perimeter

Various identities such as people, software components, or devices access workload segments. Identity is a perimeter that should be the primary line of defense to **authenticate and authorize access across isolation boundaries**, regardless of where the access request originates. Use identity as a perimeter to:

- **Assign access by role.** Identities only need access to the segments required to do their job. Minimize anonymous access by understanding the roles and responsibilities of the requesting identity so that you know the entity that's requesting access to a segment and for what purpose.

    An identity might have different access scopes in different segments. Consider a typical environment setup, with separate segments for each stage. Identities associated with the developer role have read-write access to the development environment. As the deployment moves to staging, those permissions are curbed. By the time the workload is promoted to production, scope for developers is reduced to read-only access.

- **Consider application and management identities separately.** In most solutions, users have a different level of access than developers or operators. In some applications, you might use different identity systems or directories for each type of identity. Consider creating separate roles for each identity.

- **Assign least-privilege access.** If the identity is allowed access, determine the level of access. Start with the least privilege for each segment and broaden that scope only when needed.

    By applying the least privilege, you limit the negative effects if the identity is ever compromised. If access is limited by time, the attack surface is reduced further. Time-limited access is especially applicable to critical accounts, such as administrators or software components that have a compromised identity.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Role-based access control (RBAC) results in management overhead. Keeping track of identities and their access scopes can become complex in role assignments. Consider assigning roles to security groups instead of individual identities.

> :::image type="icon" source="../_images/risk.svg"::: **Risk**: Identity settings can be complex. Misconfigurations can affect the reliability of the workload. For example, suppose there's a misconfigured role assignment that's denied access to a database. The requests start failing, eventually causing reliability issues that can't otherwise be detected until runtime.

For information about identity controls, see [Recommendations for identity and access management](identity-access.md).

In contrast to network access controls, identity validates access control at access time. It's highly recommended to conduct regular access review and require an approval workflow to obtain privileges for critical impact accounts.

### Networking as a perimeter

Identity perimeters are network agnostic while network perimeters augment identity but never replace it. Network perimeters are established to control blast radius, block unexpected, prohibited, and unsafe access, and obfuscate workload resources.

While the primary focus of the identity perimeter is least privilege, you should assume there will be a breach when you're designing the network perimeter.

Create software-defined perimeters in your networking footprint using Power Platform and Azure services and features. When a workload (or parts of a given workload) is placed into separate segments, you control traffic from or to those segments to secure communication paths. If a segment is compromised, it's contained and prevented from laterally spreading through the rest of your network.

Think like an attacker to achieve a foothold within the workload and establish controls to minimize further expansion. The controls should detect, contain, and stop attackers from gaining access to the entire workload. Here are some examples of network controls as a perimeter:

- Define your edge perimeter between public networks and the network where your workload is placed. Restrict line of sight from public networks to your network as much as possible.
- Create boundaries based on intent. For example, segment workload functional networks from operational networks.

> :::image type="icon" source="../_images/risk.svg"::: **Risk**: Network controls are rule-based and there's a significant chance of misconfiguration, which is a reliability concern.

### Roles and responsibilities

Segmentation that prevents confusion and security risks is achieved by clearly defining lines of responsibility within a workload team.

Document and share roles and functions to create consistency and facilitate communication. Designate groups or individual roles that are responsible for key functions. Consider the built-in roles in Power Platform before creating custom roles for objects.

Consider consistency while accommodating several organizational models when assigning permissions for a segment. These models can range from a single centralized IT group to mostly independent IT and DevOps teams.

> :::image type="icon" source="../_images/risk.svg"::: **Risk**: Membership of groups can change over time as employees join or leave teams or change roles. Management of roles across segments can result in management overhead.

### Resource organization

Segmentation allows you to isolate workload resources from other parts of the organization or even within the team. Power Platform constructs, such as environments and solutions, are ways of organizing your resources that promote segmentation.

## Example

Review the reference architecture for how to [secure Power Platform access to resources inside your virtual network](/power-platform/architecture/reference-architectures/secure-access-azure-resources). This article provides an example scenario and a generalized example architecture to illustrate how to secure Power Platform access to Azure resources with Azure Virtual Network.

## Power Platform facilitation

The following sections describe Power Platform features and capabilities you can use to implement a segmentation strategy.

### Identity

All Power Platform products use Microsoft Entra ID (formerly Azure Active Directory or Azure AD) for identity and access management. You can use built-in security roles, conditional access, privileged identity management, and group access management in Entra ID to define your identity perimeters.

Microsoft Dataverse uses role-based security to group together a collection of privileges. These security roles can be associated directly with users, or they can be associated with Dataverse teams and business units. For more information, see [Security concepts in Microsoft Dataverse](/power-platform/admin/wp-security-cds).

### Networking

With Azure Virtual Network support for Power Platform, you can integrate Power Platform with resources inside your virtual network without exposing them over the public internet. Virtual Network support uses Azure subnet delegation to manage outbound traffic from Power Platform at runtime. Using a delegate avoids the need for protected resources to travel over the internet to integrate with Power Platform. Virtual Network, Dataverse, and Power Platform components can call resources owned by your enterprise inside your network, whether they're hosted in Azure or on-premises, and use plug-ins and connectors to make outbound calls. For more information, see [Virtual Network support for Power Platform overview](/power-platform/admin/vnet-support-overview).

[IP firewall](/power-platform/admin/ip-firewall) for Power Platform environments helps to protect your data by limiting user access to Dataverse from only allowed IP locations.

[Microsoft Azure ExpressRoute](/power-platform/guidance/expressroute/overview) provides an advanced way to connect your on-premises network to Microsoft cloud services by using private connectivity. A single ExpressRoute connection can be used to access multiple online services; for example, Microsoft Power Platform, Dynamics 365, Microsoft 365, and Azure.

## Related information

- [Establish data protection and privacy controls](/power-platform/guidance/adoption/data-protection)

## Security checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Security checklist](checklist.md)
