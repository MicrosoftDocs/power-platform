---
title: Recommendations for building a segmentation strategy
description: Learn about the recommendations for building a unified segmentation strategy using perimeters and isolation boundaries. 
author: RobStand
ms.author: mapichle
ms.reviewer: sericks
ms.date: 01/31/2024
ms.subservice: guidance
ms.topic: conceptual
---

# Recommendations for building a segmentation strategy

**Applies to Power Well-Architected Security checklist recommendation:**

|[SE:04](checklist.md)|Create intentional segmentation and perimeters in your architecture design and the workload’s footprint on the platform. The segmentation strategy must include networks, roles and responsibilities, workload identities, and resource organization.|
|---|---|

A segmentation strategy defines how you separate workloads with their own set of security requirements and measures.

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

Segmentation helps you **design a security approach that applies defense in depth** based on the principles of the Zero Trust model. Ensure that an attacker who breaches one network segment can't gain access to another by segmenting workloads with different identity controls. In a secure system, identity and network attributes block unauthorized access and hide the assets from being exposed. Here are some examples of segments:

- Subscriptions that isolate workloads of an organization
- Resource groups that isolate workload assets
- Deployment environments that isolate deployment by stages
- Teams and roles that isolate job functions related to workload development and management
- Application tiers that isolate by workload utility
- Microservices that isolate one service from another

Consider these key elements of segmentation to make sure you're building a comprehensive defense in depth strategy:

The **boundary or perimeter** is the entry edge of a segment where you apply security controls. Perimeter controls should block access to the segment unless explicitly allowed. The goal is to prevent an attacker from breaking through the perimeter and gaining control of the system. For example, an application tier might accept an end user's access token when it processes a request. But the _data_ tier might require a different access token that has a specific permission, which only the application tier can request.

**Containment** is the exit edge of a segment that prevents lateral movement in the system. The goal of containment is to minimize the effect of a breach. For example, an Azure virtual network might be used to configure routing and network security groups to only allow traffic patterns that you expect, avoiding traffic to arbitrary network segments.

**Isolation** is the practice of grouping entities with similar assurances together to protect them with a boundary. The goal is ease of management and the containment of an attack within an environment. For example, you might group the resources that relate to a specific workload into one Azure subscription, and then apply access control so that only specific workload teams can access the subscription.

It's important to note the distinction between perimeters and isolation. Perimeter refers to the points of location that should be checked. Isolation is about grouping. Actively contain an attack by using these concepts together.

Isolation doesn't mean creating silos in the organization. **A unified segmentation strategy provides alignment between the technical teams and sets clear lines of responsibility.** Clarity reduces the risk of human error and automation failures that can lead to security vulnerabilities, operational downtime, or both. Suppose a security breach is detected in a component of a complex enterprise system. It's important that everyone understands who's responsible for that resource so that the appropriate person is included in the triage team. The organization and stakeholders can quickly identify how to respond to different kinds of incidents by creating and documenting a good segmentation strategy.

 > :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Segmentation introduces complexity because there's overhead in management. There's also a tradeoff in cost. For example, more resources are provisioned when deployment environments that run side by side are segmented.

 > :::image type="icon" source="../_images/risk.svg"::: **Risk**: Micro-segmentation beyond a reasonable limit loses the benefit of isolation. When you create too many segments, it becomes difficult to identify points of communication or to allow for valid communication paths within the segment.

### Identity as the perimeter

Various identities such as people, software components, or devices access workload segments. Identity is a perimeter that should be the primary line of defense to **authenticate and authorize access across isolation boundaries**, regardless of where the access request originates. Use identity as a perimeter to:

**Assign access by role.** Identities only need access to the segments required to do their job. Minimize anonymous access by understanding the roles and responsibilities of the requesting identity so that you know the entity that's requesting access to a segment and for what purpose.

An identity might have different access scopes in different segments. Consider a typical environment setup, with separate segments for each stage. Identities associated with the developer role have read-write access to the development environment. As the deployment moves to staging, those permissions are curbed. By the time the workload is promoted to production, scope for developers is reduced to read-only access.

**Consider application and management identities separately.** In most solutions, users have a different level of access than developers or operators. In some applications, you might use different identity systems or directories for each type of identity. Consider using access scopes and creating separate roles for each identity.

**Assign least-privilege access.** If the identity is allowed access, determine the level of access. Start with the least privilege for each segment and broaden that scope only when needed.

By applying the least privilege, you limit the negative effects if the identity is ever compromised. If access is limited by time, the attack surface is reduced further. Time-limited access is especially applicable to critical accounts, such as administrators or software components that have a compromised identity.

 > :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: The performance of the workload can be affected by identity perimeters. Verifying each request explicitly requires extra compute cycles and extra network IO.

Role-based access control (RBAC) also results in management overhead. Keeping track of identities and their access scopes can become complex in role assignments. The workaround is to assign roles to security groups instead of individual identities.

 > :::image type="icon" source="../_images/risk.svg"::: **Risk**: Identity settings can be complex. Misconfigurations can affect the reliability of the workload. For example, suppose there's a misconfigured role assignment that's denied access to a database. The requests start failing, eventually causing reliability issues that can't otherwise be detected until runtime.

For information about identity controls, see [Identity and access management](https://learn.microsoft.com/azure/well-architected/security/identity-access).

In contrast to network access controls, identity validates access control at access time. It's highly recommended to conduct regular access review and require an approval workflow to obtain privileges for critical impact accounts. For example, see [Identity segmentation patterns](https://learn.microsoft.com/azure/well-architected/security/segmentation).

### Networking as a perimeter

Identity perimeters are network agnostic while network perimeters augment identity but never replace it. Network perimeters are established to control blast radius, block unexpected, prohibited, and unsafe access, and obfuscate workload resources.

While the primary focus of the identity perimeter is least privilege, you should assume there will be a breach when you're designing the network perimeter.

Create software-defined perimeters in your networking footprint using Azure services and features. When a workload (or parts of a given workload) is placed into separate segments, you **control traffic from or to those segments to secure communication paths**. If a segment is compromised, it's contained and prevented from laterally spreading through the rest of your network.

Think like an attacker to achieve a foothold within the workload and establish controls to minimize further expansion. The controls should detect, contain, and stop attackers from gaining access to the entire workload. Here are some examples of network controls as a perimeter:

Define your edge perimeter between public networks and the network where your workload is placed. Restrict line of sight from public networks to your network as much as possible.

Implement demilitarized zones (DMZs) in front of the application with proper controls via firewalls.

Create micro-segmentation within your private network by grouping parts of the workload into separate segments. Establish secure communication paths between them.

Create boundaries based on intent. For example, segment workload functional networks from operational networks.

For common patterns related to networking segmentation, see [Networking segmentation patterns](https://learn.microsoft.com/azure/well-architected/security/segmentation).

 > :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Network security controls are often expensive because they're included with the premium SKUs. Configuring rules on firewalls often results in overwhelming complexity requiring broad exceptions.

Private connectivity changes architectural design, often adding more components such as jump boxes for private access to compute nodes.

Because network perimeters are based on control points, or hops, on the network, each hop can be a potential point of failure. These points can have an effect on the reliability of the system.

 > :::image type="icon" source="../_images/risk.svg"::: **Risk**: Network controls are rule-based and there's a significant chance of misconfiguration, which is a reliability concern.

For information about network controls, see [Networking and connectivity](https://learn.microsoft.com/azure/well-architected/security/networking).

### Roles and responsibilities

Segmentation that prevents confusion and security risks is achieved by **clearly defining lines of responsibility** within a workload team.

Document and share roles and functions to create consistency and facilitate communication. Designate groups or individual roles that are responsible for key functions. Consider the built-in roles in Azure before creating custom roles for objects.

Consider consistency while accommodating several organizational models when assigning permissions for a segment. These models can range from a single centralized IT group to mostly independent IT and DevOps teams.

 > :::image type="icon" source="../_images/risk.svg"::: **Risk**: Membership of groups can change over time as employees join or leave teams or change roles. Management of roles across segments can result in management overhead.

### Resource organization

Segmentation allows you to **isolate workload resources from other parts of the organization** or even within the team. Azure constructs, such as management groups, subscriptions, environments, and resource groups, are ways of organizing your resources that promote segmentation. Here are some examples of resource-level isolation:

Polyglot persistence involves a combination of data storing technologies instead of a single database system to support segmentation. Use polyglot persistence for separation by various data models, separation of functionalities such as data storage and analytics, or to separate by access patterns.

Allocate one service for each server when organizing your compute. This level of isolation minimizes complexity and can help contain an attack.

Azure provides built-in isolation for some services, for example separation of compute from storage. For other examples, see [Isolation in the Azure public cloud](https://learn.microsoft.com/azure/security/fundamentals/isolation-choices).

 > :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Resource isolation might result in an increase in total cost of ownership (TCO). For data stores, there might be added complexity and coordination during disaster recovery.

## Power Platform facilitation

Certain Azure services are available for use in implementing a segmentation strategy, as outlined in the following sections.

### Identity

Azure RBAC supports segmentation by isolating access by job function. Only certain actions are allowed for certain roles and scopes. For example, job functions that only need to observe the system can be assigned reader permissions versus contributor permissions that allow the identity to manage resources.

For more information, see [Best practices for RBAC](https://learn.microsoft.com/azure/role-based-access-control/best-practices).

### Networking

[Virtual networks](https://learn.microsoft.com/azure/virtual-network/virtual-networks-overview): Virtual networks provide network-level containment of resources without adding traffic between two virtual networks. Virtual networks are created in private address spaces within a subscription

Network security groups (NSG): An access control mechanism for controlling traffic between resources in virtual networks and external networks, such as the internet. Implement user-defined routes (UDR) to control the next hop for traffic. NSGs can take your segmentation strategy to a granular level by creating perimeters for a subnet, a virtual machine (VM), or a group of VMs. For information about possible operations with subnets in Azure, see [Subnets](https://learn.microsoft.com/rest/api/virtualnetwork/subnets).

[Application security groups (ASGs)](https://learn.microsoft.com/azure/virtual-network/application-security-groups): ASGs allow you to group a set of VMs under an application tag and define traffic rules that are then applied to each of the underlying VMs.

[Azure Firewall](https://learn.microsoft.com/azure/firewall/): A cloud-native service, which can be deployed in your virtual network or in [Azure Virtual WAN](https://learn.microsoft.com/azure/virtual-wan/virtual-wan-about) hub deployments. Use Azure Firewall to filter traffic flowing between cloud resources, the internet, and on-premises resources. Use Azure Firewall or [Azure Firewall Manager](https://learn.microsoft.com/azure/firewall-manager/overview) to create rules or policies that allow or deny traffic using layer 3 to layer 7 controls. Filter internet traffic using Azure Firewall and third parties by directing traffic through third-party security providers for advanced filtering and user protection. Azure supports network virtual appliance deployment, which helps segmentation from third-party firewalls.

## Example

Here are some common patterns for segmenting a workload in Azure. Choose a pattern based on your needs.

This example builds on the Information Technology (IT) environment established in the [security baseline (SE:01)](https://learn.microsoft.com/azure/well-architected/security/establish-baseline). The diagram below shows segmentation at the management group level done by an organization.

### Identity segmentation patterns

#### Pattern 1: Job title-based grouping

One way to organize security groups is by job title like software engineer, database administrator, site reliability engineer, quality assurance engineer, or security analyst. This approach involves **creating security groups for your workload team** based on their roles, without considering the work that needs to be accomplished. Grant security groups RBAC permissions, standing or just in time (JIT), according to their responsibilities in the workload. Assign human and service principles to security groups based on their as-needed access.

Membership is highly visible at the role assignment level, making it easy to see what a _role_ has access to. Each person is usually a member of only one security group, which makes onboarding and offboarding easy. However, unless job titles overlap perfectly with responsibilities, title-based grouping isn't ideal for least-privilege implementation. You might end up combining implementation with function-based grouping.

#### Pattern 2: Function-based grouping

Function-based grouping is a security group organization method that reflects discrete work that needs to be accomplished, not taking into account your team structure. With this pattern, you **grant security groups RBAC permissions, standing or JIT as needed**, according to their required function in the workload.

Assign human and service principles to security groups based on their as-needed access. Where possible, use existing homogeneous groups as members of the function-based groups, such as those groups from pattern 1. Examples of function-based groups include:

- Production database operators
- Preproduction database operators
- Production certificate rotation operators
- Preproduction certificate rotation operators
- Production live-site/triage
- Preproduction all access

This approach maintains the strictest least-privilege access and provides security groups where scope is evident, which makes it easy to audit memberships relative to job duties performed. Often a built-in Azure role exists to match this job function.

However, membership is abstracted at least one layer, forcing you to go to the identity provider to understand who's in the group when looking from the resource perspective. Additionally, one person needs to have multiple memberships maintained for complete coverage. The matrix of overlapping security groups can be complex.

Pattern 2 is recommended to make the access patterns the focus, not the organization chart. Organization charts and member roles sometimes change. Capturing your workload's identity and access management from a functional perspective allows you to abstract your team organization from the secure management of the workload.

### Networking segmentation patterns

##### Pattern 1: Segmentation within a workload (soft boundaries)

In this pattern, the workload is placed in a single virtual network using subnets to mark boundaries. **Segmentation is achieved using two subnets**, one for database and one for web workloads. You must configure NSGs that allow Subnet 1 to only communicate with Subnet 2 and Subnet 2 to only communicate with the internet. This pattern provides layer 3 level control.

##### Pattern 2: Segmentation within a workload

This pattern is an example of platform-level segmentation. Workload c**omponents are spread across multiple networks without peering between them**. All communication is routed through an intermediary that serves as a public access point. The workload team owns all networks.

Pattern 2 provides containment but has the added complexity of virtual network management and sizing. Communication between the two networks takes place over the public internet, which can be a risk. There's also latency with public connections. However, the two networks can be peered, breaking segmentation by connecting them to create a larger segment. Peering should be done when no other public endpoints are needed.

| Considerations | Pattern 1 | Pattern 2 |
|---|---|---|
| Connectivity and routing: How each segment communicates | System routing provides default connectivity to workload components. No external component can communicate with the workload. | Within the virtual network, same as pattern 1.<br>Between networks, the traffic goes over the public internet. There's no direct connectivity between the networks. |
| Network-level traffic filtering | Traffic between the segments is allowed by default. Use NSGs or ASGs to filter traffic. | Within the virtual network, same as pattern 1.<br>Between the networks, you can filter both ingress and egress traffic through a firewall. |
| Unintended open public endpoints | Network interface cards (NICs) don't get public IPs. Virtual networks aren't exposed to internet API management. | Same as pattern 1. Intended open public endpoint on one virtual network, which can be misconfigured to accept more traffic. |

### Resource organization

##### Organize Azure resources based on ownership responsibility

Consider an Azure estate that contains multiple workloads and shared service components like hub virtual networks, firewalls, identity services, and security services like Microsoft Sentinel. Components throughout the estate should be grouped based on their functional areas, workloads, and ownership. For example, shared networking resources should be grouped together into a single subscription and managed by a networking team. Components that are dedicated to individual workloads should be in their own segment and might be further divided based on application tiers or other organizational principles.

**Grant access to manage resources within individual segments by creating RBAC role assignments**. For example, the cloud networking team might be granted administrative access to the subscription that contains their resources, but not to individual workload subscriptions.

A good segmentation strategy makes it possible to easily identify the owners of each segment. Consider using Azure resource tags to annotate resource groups or subscriptions with the owner team.

##### Configure and review access control

Grant appropriate access based on need by clearly defining segments for your resources.

Consider the principle of least privilege when you define access control policies. It's important to distinguish between _control plane operations_ (management of the resource itself) and _data plane operations_ (access to the data stored by the resource). For example, suppose you have a workload that contains a database with sensitive information about employees. You might grant management access to some users that need to configure settings like database backups or users that monitor the performance of the database server. However, these users shouldn't be able to query the sensitive data stored in the database. Select permissions that grant the minimum scope needed for users to perform their duties. Regularly review role assignments for each segment and remove access that's no longer required.

> ![NOTE]
> Some highly privileged roles, like the owner role in RBAC, give users the ability to grant other users access to a resource. Limit how many users or groups are assigned the owner role, and regularly review audit logs to ensure they only perform valid operations.

## Related links

[Isolation in the Azure public cloud](https://learn.microsoft.com/azure/security/fundamentals/isolation-choices)

[Recommendations for RBAC](https://learn.microsoft.com/azure/role-based-access-control/best-practices)

[Virtual networks overview](https://learn.microsoft.com/azure/virtual-network/virtual-networks-overview)

[ASGs](https://learn.microsoft.com/azure/virtual-network/application-security-groups)

[Azure Firewall](https://learn.microsoft.com/azure/firewall/)

[Firewall Manager overview](https://learn.microsoft.com/azure/firewall-manager/overview)

