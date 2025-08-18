---
title: Configure identity and access management
description: Learn how to configure identity and access management for Microsoft Power Platform to ensure secure access to resources.
#customer intent: As a Power Platform admin, I want to configure identity and access management for Microsoft Power Platform so that I can ensure secure access to resources.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.date: 08/18/2025
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
search.audienceType: 
  - admin
contributors:
  - alaug
ms.custom: sfi-ga-nochange
---

# Configure identity and access management

Managing access to sensitive information and resources is critical for IT admins and Chief Information Security Officers (CISOs) across industries. Ensuring least privilege access is essential for maintaining strong security. 

Power Platform integrates with [Microsoft Entra ID](/entra/identity/) for identity and access management, empowering admins to securely manage users and their interactions with Power Platform resources. Microsoft Entra ID is central to Microsoft authentication and helps protect against identity compromise. Microsoft Entra ID gives IT admins visibility and control and offers security capabilities like multifactor authentication and conditional access. [Managed security](/power-platform/admin/security/managed-security) provides capabilities built on Microsoft Entra ID, giving admins granular control to ensure only authorized users access data and resources.

This article explains identity and access management controls at every layer.

## Tenant access

Tenant-level access is the first layer of security and uses Microsoft Entra ID. It ensures that users have an active user account and comply with any conditional access policies to sign in. However, having an active and enabled account alone doesn't grant access to the platform. Only users with the appropriate licenses can authenticate and use the platform.

### Service admin roles

You can assign two Power Platform related service admin roles to provide a high level of admin management:

- **Power Platform administrator**: This role can perform all admin functions in Power Platform, regardless of security group membership at the environment level.
- **Dynamics 365 administrator**: This role can perform most admin functions in Power Platform, but only for environments where it belongs to the security group.

These roles can't manage user accounts, subscriptions, and access settings for other Microsoft 365 apps. You need to collaborate with other admins in your organization to perform those tasks. For more information on each role's privileges, review the [service administrator permission matrix](/power-platform/admin/use-service-admin-role-manage-tenant).

Administrative identities pose significant security risks because their tasks require privileged access to many systems and applications. Compromise or misuse can harm your business and its information systems. Security of administration is one of the most critical security areas.

Protecting privileged access against determined adversaries requires a complete and thoughtful approach to isolate systems from risks. Here are some strategies:

- Minimize the number of critical impact accounts.
- Use separate roles instead of elevating privileges for existing identities.
- Avoid permanent or standing access by using the just-in-time (JIT) features of your identity provider. For break glass situations, follow an emergency access process. Use [Privileged Identity Management (PIM)](/power-platform/admin/manage-high-privileged-admin-roles), a feature of Microsoft Entra ID, to manage, control, and monitor the use of these high-privilege roles.
- Use modern access protocols like passwordless authentication or multifactor authentication.
- Enforce key security attributes by using conditional access policies.
- Decommission administrative accounts that aren't being used.

### Conditional access

[Conditional access](/azure/active-directory/conditional-access/), a feature of Microsoft Entra ID, lets you apply policies based on signals about the user's situation. These signals help you assess the risk level and enforce appropriate actions. Conditional access policies, at their simplest, are if-then statements that define what users must do to access a resource. For example, you can require users to use multifactor authentication if they want to access a Power Apps canvas app that tracks a compliance process.

Don't give all identities the same level of access. Base your decisions on two main factors:

- **Time**. How long the identity can access your environment.
- **Privilege**. The level of permissions.

These factors aren't mutually exclusive. A compromised identity with more privileges and unlimited access duration can gain more control over the system and data, or use that access to continue to change the environment. Constrain these access factors both as a preventive measure and to control the blast radius.

*Just in Time (JIT)* approaches provide the required privileges only when you need them.

*Just Enough Access (JEA)* provides only the required privileges.

Although time and privilege are the primary factors, other conditions apply. For example, you can also use the device, network, and location from which the access originated to set policies.

Use strong controls that filter, detect, and block unauthorized access, including parameters like user identity and location, device health, workload context, data classification, and anomalies.

For example, your workload might need to be accessed by third-party identities like vendors, partners, and customers. They need the appropriate level of access rather than the default permissions that you provide to full-time employees. Clear differentiation of external accounts makes it easier to prevent and detect attacks that come from these vectors.

Plan how to use policies to enforce your security guidelines for Power Platform. You can use a policy to limit Power Platform access to specific users or conditions, such as where they're located, the device they're using and the apps that are installed on it, and if they use multifactor authentication. Conditional access is flexible, but that flexibility can allow you to create policies that have undesirable results, including locking out your own admins. The [planning guide](/azure/active-directory/conditional-access/plan-conditional-access) can help you think through how to plan for using conditional access.

Learn more:

- [Block access by location with Microsoft Entra Conditional Access](/power-platform/admin/restrict-access-online-trusted-ip-rules)
- [Recommendations for conditional access and multifactor authentication in Microsoft Power Automate (Flow)](/troubleshoot/power-platform/power-automate/administration/conditional-access-and-multi-factor-authentication-in-flow)

### Continuous access evaluation

[Continuous access evaluation](/power-platform/admin/continuous-access-evaluation) is a feature of Microsoft Entra ID that monitors certain events and changes to determine if a user should keep or lose access to a resource. OAuth 2.0 authentication traditionally relies on access token expiration to revoke a user's access to modern cloud services. Users whose access rights are terminated keep access to resources until the access token expires—for Power Platform, as long as an hour, by default. With continuous access evaluation, however, Power Platform services such as Dataverse continuously evaluate a user's [critical events](/azure/active-directory/conditional-access/concept-continuous-access-evaluation#critical-event-evaluation) and network location changes. They proactively terminate active user sessions, or require reauthentication, and enforce tenant policy changes in near real time instead of waiting for an access token to expire.

As organizations continue to adopt hybrid work models and cloud applications, Microsoft Entra ID is a key primary security perimeter that protects users and resources. Conditional access extends that perimeter beyond a network boundary to include user and device identity. Continuous access ensures that access is reevaluated as events or user locations change. By using Microsoft Entra ID with Power Platform products, you can apply consistent security governance across your application portfolio.

Review these [identity management best practices](/azure/security/fundamentals/identity-management-best-practices) for more tips on how to use Microsoft Entra ID with Power Platform.

## Environment access

A [Power Platform environment](/power-platform/admin/environments-overview) is a logical container and unit of governance management that represents the security boundary in Power Platform. Many features such as virtual network, Lockbox, and security groups all operate at an environment-level of granularity from a management perspective. This granularity allows different security requirements to be implemented in different environments depending on your business needs. Users get access to an environment based on a security role that they're assigned. Simply having a license and an identity at tenant level isn't enough to grant access to an environment unless it's the [default environment](/power-platform/admin/environments-overview#default-environment).

Environments with Dataverse support advanced security models for controlling access to data and services in a Dataverse database.  

### Assign security groups to environments

Use [security groups](/power-platform/admin/control-user-access) to control which licensed users can be members of a particular environment. You can use security groups to control who can access resources in Power Platform environments other than the default environment or developer environments. Link one security group to each environment that has at least one user or nested security group. Using a security group for each environment ensures that only the right users can access it. If you automate your environment creation process, you can also automate creating the security group and ensure that your admins have access to any new environment.

Power Platform admins have access to all environments, even if they aren't in the security group for the environment. Dynamics 365 admins need to be in the security group to access the environment.

### Manage guest users

You might need to let guest users access environments and Power Platform resources. As with internal users, you can use Microsoft Entra ID conditional access and continuous access evaluation to ensure that guest users are held to an elevated level of security.

To further enhance security and reduce the risk of incidental over-sharing, you can also block or enable [access by Microsoft Entra guests](/power-platform/admin/security/identity-access-management#guest-access-preview) to your Dataverse-backed environments, as needed. By default, guest access is restricted for new Dataverse-backed environments, ensuring a secure setup from the start. You can further boost your security score by enabling this setting for existing environments too.

### Route makers to their own development environment

[Environment routing](/power-platform/admin/default-environment-routing) allows Power Platform admins to automatically direct new or existing makers into their own personal developer environments when they sign in to Power Platform products like Power Apps or Copilot Studio. We recommend you configure environment routing to offer makers a personal, safe space to build with Microsoft Dataverse without the fear of others accessing their apps or data.

## Resource access

Security roles control the ability to create and run specific applications and flows in environments. For example, you can share canvas apps directly with a user or a Microsoft Entra ID group, but Dataverse security roles still apply. However, you share model-driven apps only through Dataverse security roles.  

### Assign roles to identities based on their requirements

Authorize actions based on each identity's responsibility. Ensure an identity doesn't do more than it needs to do. Before you set authorization rules, make sure you understand who or what is making requests, what that role is permitted to do, and the extent of its permissions. These factors guide decisions that combine identity, role, and scope.

Consider the following questions:

- Does the identity need read or write access to the data? What level of write access is required?
- If the identity is compromised by a bad actor, what would the impact to the system be in terms of confidentiality, integrity, and availability?
- Does the identity need permanent access or can conditional access be considered?
- Does the identity perform actions that require administrative or elevated permissions?
- How will the workload interact with third-party services?

A role is a *set of permissions* assigned to an identity. Assign roles that only allow the identity to complete the task, and no more. When user's permissions are restricted to their job requirements, it's easier to identify suspicious or unauthorized behavior in the system.

Ask questions like these:

- Does the identity need permissions to delete resources?
- Does the role only need access to the records they created?
- Is hierarchical access based on the business unit the user is in required?
- Does the role need administrative or elevated permissions?
- Does the role need permanent access to these permissions?
- What happens if the user changes jobs?

**Limiting the level of access that users have reduces the potential attack surface**. If you grant only the minimum permissions that are required to perform specific tasks, the risk of a successful attack or unauthorized access is reduced. For example, developers only need maker access to the development environment but not the production environment. They need access to create resources but not change environment properties. They might need access to read/write data from Dataverse but not to change the data model or attributes of the Dataverse table.

**Avoid permissions that target individual users**. Granular and custom permissions create complexity and confusion. They can become difficult to maintain as users change roles and move across the business, or as new users with similar authentication requirements join the team. This situation can create a complex legacy configuration that's difficult to maintain and negatively impacts both security and reliability.

**Grant roles that start with least privilege** and add more based on your operational or data access needs. Your technical teams must have clear guidance to implement permissions.

### Establish processes to manage the identity lifecycle

Access to identities must not last longer than the resources that the identities access. Ensure that you have a process for disabling or deleting identities when changes occur in team structure or software components.

Establish an identity governance process to manage the lifecycle of digital identities, high-privileged users, external or guest users, and workload users. Implement access reviews to ensure that when identities leave the organization or the team, their workload permissions are removed.

### Configure sharing limits

As the race to adopt AI is prioritized across industries, admins are looking to address the risk of over-sharing resources. [Managed security](/power-platform/admin/security/managed-security) supports [granular sharing limits](/power-platform/admin/managed-environment-sharing-limits) for canvas apps and solution-aware cloud flows, preventing makers from sharing flows across security groups and with individuals.

For Copilot Studio agent scenarios, admins have fine-grained controls over editor versus viewer permissions on a per environment or environment group basis. They can also restrict viewers to specific security groups, individuals, or a set number of viewers.

:::image type="content" source="media/limit-sharing.png" alt-text="Screenshot of managing sharing limits in the Power Platform admin center.":::

In addition to these granular sharing limits, also limit the makers' ability to use the [*Everyone* shorthand to share apps](/power-platform/admin/powerapps-powershell?branch=ppadoption-refresh-mapichle#display-tenant-setting-for-ability-to-share-apps-with-everyone) with everyone in the organization. 

Learn more:

- [Share a canvas app](/power-apps/maker/canvas-apps/share-app)
- [Share a canvas app with guest users](/power-apps/maker/canvas-apps/share-app-guests)
- [Share a cloud flow](/power-automate/create-team-flows)
- [Share agents with other users](/microsoft-copilot-studio/admin-share-bots)

### Connect to Azure resources that support managed identity

To minimize the risk associated with accessing external resources, [managed identity support for Dataverse plug-ins](/power-platform/admin/managed-identity-overview) provides secure and seamless authentication. This support eliminates the need for hard-coded credentials and simplifies the management of access to resources.

## Dataverse access

Dataverse uses a rich [security model](/power-platform/admin/wp-security) to protect data integrity and user privacy while promoting efficient data access and collaboration. You can combine business units, role-based security, row-based security, and column-based security to define the overall access to information that users have in a Power Platform environment. Role-based access control (RBAC) lets you define access permissions and govern data access in a scalable way. By using various built-in or customized security roles, you can grant permissions at the database, table, or specific record level.  

Dataverse enables fine-grained access controls to manage authorization and data level security roles. These roles define row, field, hierarchical, and group protection, which provide the granularity and flexibility required to secure highly sensitive business data in applications.

[Microsoft Purview Data Map](/purview/register-scan-dataverse) is a unified and automated solution that can discover, classify, and label sensitive data across different data sources and domains, including Dataverse. Labeling with Purview Data Map enables organizations to automatically classify the data and easily identify sensitive data. With Purview Data Map integration, you can reduce the manual effort and human error involved in labeling data in Dataverse by using predefined rules and policies that match your business and compliance needs.

## Understand identity and access management requirements

As a customer, you're responsible for:

- Account and identity management
- Creating and configuring conditional access policies
- Creating and assigning security roles
- Enabling and configuring auditing and monitoring
- Authentication and security of components that Power Platform may connect to

Understand the key requirements for the Power Platform workload you're implementing. Ask yourself the following questions to help identify the identity and access management features to configure.

- How do you implement access control and authentication mechanisms to ensure only authorized users can access the workload?
- How do you ensure secure and seamless user authentication?
- How do you control which apps can interact with the generative AI (agent) and what measures ensure these restrictions are effective?
- How does the workload securely integrate with other internal and external systems?
- Where do users access this solution from? For example, are they using a mobile device or web browser?
- Are your users internal, external, or both?

## Recommendations

Effectively governing makers, users, and guests is essential to maintain security, compliance, and operational efficiency in Power Platform environments. Here are detailed recommendations for managing access and permissions:

1. **Route makers to their own personal development environment**: Use [environment routing](/power-platform/admin/default-environment-routing) to encourage makers to use their own personal development environments for building and testing applications. This approach isolates development activities from production environments, reducing the risk of accidental changes or disruptions. Personal development environments provide a safe space for experimentation and innovation without impacting critical business operations.

1. **Don't allow maker permissions in test and production environments**: Restrict maker permissions in test and production environments to prevent unauthorized changes and ensure that only approved and thoroughly tested applications are deployed. This separation of duties helps maintain the integrity and stability of production systems, minimizing the risk of errors and security vulnerabilities.

1. **Control access using security roles with least privileges**: Implement role-based access control (RBAC) to assign permissions based on the principle of least privilege. Grant users only the access they need to perform their specific tasks. By limiting permissions, you reduce the attack surface and minimize the potential impact of security breaches.

1. **Diagnose user access issues by invoking 'Run Diagnostics'**: Use the [**Run diagnostics**](/power-platform/admin/troubleshooting-user-needs-read-write-access-organization) command to troubleshoot and diagnose user access issues. This tool helps identify and resolve permission-related problems, ensuring that users have the appropriate access to perform their tasks. Regular diagnostics can also help detect and address potential security gaps.

1. **Limit [sharing with Everyone](/power-platform/admin/powerapps-powershell?branch=ppadoption-refresh-mapichle#display-tenant-setting-for-ability-to-share-apps-with-everyone), and evaluate configuring specific limits**: Avoid broad sharing permissions that allow everyone to access a resource. Configure specific sharing limits to control how many users makers can share their applications and data with. 

1. **Apply data loss prevention (DLP) policies to the default and developer environments**: Apply DLP policies to the default and developer environments to restrict access to only the connectors that makers need. This approach helps prevent unauthorized data transfers and ensures that sensitive information is protected. Regularly review and update DLP policies to align with changing security requirements.

1. **Use Microsoft Entra ID Groups to secure environment access**: Use Microsoft Entra ID groups to manage and secure access to Power Platform environments. By grouping users based on their roles and responsibilities, you can efficiently assign and manage permissions. Microsoft Entra ID groups also simplify the process of updating access controls as organizational needs evolve.

1. **Use Dataverse to have built-in flexible RBAC security model**: Dataverse provides a built-in, flexible role-based access control security model that allows you to manage user permissions and access to data effectively. This model enables you to define custom roles and assign specific permissions based on job functions and responsibilities. Ensure that users have only the necessary access to perform their tasks. With features like granular permissions, hierarchical security, and team-based access, Dataverse's RBAC model enhances data protection, supports compliance with regulatory requirements, and simplifies the management of user access within Power Platform environments.

## Next steps

Review the detailed articles in this series to further enhance your security posture:

- [Detect threats to your organization](threat-detection.md)
- [Establish data protection and privacy controls](data-protection.md)
- [Implement a DLP strategy](dlp-strategy.md)
- [Meet compliance requirements](compliance.md)
- [Secure the default environment](secure-default-environment.md)

[!INCLUDE [guidance-adoption-security-review-checklist](../../includes/guidance-adoption-security-review-checklist.md)]