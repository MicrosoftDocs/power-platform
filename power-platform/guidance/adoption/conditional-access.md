---
title: Configure identity and access management for Microsoft Power Platform
description: Guidance on configuring identity and access management for Microsoft Power Platform
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/28/2025
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
- alaug
---

# Configure identity and access management

Managing access to sensitive information and resources is top of mind for IT admins and CISOs across industries and ensuring the least privilege access is paramount in maintaining a strong security stance. Power Platform is well-integrated with [Microsoft Entra ID](/entra/identity/) for identity and access management, empowering admins to securely manage users and their interactions with various Power Platform resources. Entra ID is core to Microsoft authentication, and helps by protecting against identity compromise. Entra ID gives the IT admin visibility and control, and offers additional security capabilities such as multi-factor authentication and conditional access. [Managed security](/power-platform/admin/security/managed-security) boasts an additional wealth of seamless capabilities built upon Entra ID offering granular control to ensure that your data and resources are only viewed by authorized users.

## Tenant access

Tenant-level access is the initial layer of security and utilizes Microsoft Entra ID. This ensures that users have an active user account and comply with any conditional access policies to log in. However, having an active and enabled account alone does not grant access to the platform; only users with the appropriate licenses can authenticate and use the platform.

### Service admin roles

To help you administer environments and settings for the Microsoft Power Platform, you can assign users to manage the service at the tenant level without having to assign a role that provides access to other services within the tenant.

There are two Power Platform related service admin roles you can assign to provide a high level of admin management.

- Power Platform administrator: This role can perform all admin functions in Microsoft Power Platform, regardless of security group membership at the environment level.
- Dynamics 365 administrator: This role can perform most admin functions in Power Platform, but only for environments where they belong to the security group.

Neither of these roles can do tasks that only the Microsoft 365 global admin can do, such as managing user accounts, subscriptions, and access settings for other Microsoft 365 apps. You might need to assign additional roles to admins who need to perform those tasks. Review the [service administrator permission matrix](/power-platform/admin/use-service-admin-role-manage-tenant) for more details of each role’s privileges.

Administrative identities introduce some of the highest impact security risks because the tasks they perform require privileged access to a broad set of these systems and applications. Compromise or misuse can have a detrimental effect on your business and its information systems. Security of administration is one of the most critical security areas.

Protecting privileged access against determined adversaries requires you to take a complete and thoughtful approach to isolate these systems from risks. Here are some strategies:

- Minimize the number of critical impact accounts.
- Use separate roles instead of elevating privileges for existing identities.
- Avoid permanent or standing access by using the JIT features of your IdP. For break glass situations, follow an emergency access process. To support this, [use Privileged Identity Management (PIM)](/power-platform/admin/manage-high-privileged-admin-roles), a feature of Microsoft Entra ID, to manage, control, and monitor the use of these high-privilege roles.
- Use modern access protocols like passwordless authentication or multifactor authentication.
- Enforce key security attributes by using conditional access policies.
- Decommission administrative accounts that aren't being used.

### Conditional access

[Conditional access](/azure/active-directory/conditional-access/), a feature of Microsoft Entra ID, lets you apply policies based on signals about the user’s situation. These signals help you assess the risk level and enforce appropriate actions. Conditional access policies, at their simplest, are if-then statements that define what users must do to access a resource. For example, you can require users to use multifactor authentication if they want to access a Power Apps canvas app that tracks a compliance process.

Don't give all identities the same level of access. Base your decisions on two main factors:

- **Time**. How long the identity can access your environment.
- **Privilege**. The level of permissions.

Those factors aren't mutually exclusive. A compromised identity that has more privileges and unlimited duration of access can gain more control over the system and data or use that access to continue to change the environment. Constrain those access factors both as a preventive measure and to control the blast radius.

*Just in Time (JIT)* approaches provide the required privileges only when they're needed.

*Just Enough Access (JEA)* provides only the required privileges.

Although time and privilege are the primary factors, there are other conditions that apply. For example, you can also use the device, network, and location from which the access originated to set policies.

Use strong controls that filter, detect, and block unauthorized access, including parameters like user identity and location, device health, workload context, data classification, and anomalies.

For example, your workload might need to be accessed by third-party identities like vendors, partners, and customers. They need the appropriate level of access rather than the default permissions that you provide to full-time employees. Clear differentiation of external accounts makes it easier to prevent and detect attacks that come from these vectors.

You should plan how to use policies to enforce your security guidelines for Power Platform. You can use a policy to limit Power Platform access to specific users or conditions, such as where they’re located, the device they’re using and the apps that are installed on it, and if they use multifactor authentication. Conditional access is very flexible, but that flexibility can allow you to create policies that have undesirable results, including locking your own admins out. The [planning guide](/azure/active-directory/conditional-access/plan-conditional-access) can help you think through how to plan for using conditional access.

Learn more:

- [Block access by location with Microsoft Entra Conditional Access](/power-platform/admin/restrict-access-online-trusted-ip-rules)
- [Recommendations for conditional access and multifactor authentication in Microsoft Power Automate](/troubleshoot/power-platform/power-automate/administration/conditional-access-and-multi-factor-authentication-in-flow)

### Continuous access evaluation

[Continuous access evaluation](power-platform/admin/continuous-access-evaluation) is a feature of Microsoft Entra ID that monitors certain events and changes to decide if a user should keep or lose access to a resource. OAuth 2.0 authentication traditionally relies on access token expiration to revoke a user's access to modern cloud services. Users whose access rights have been terminated still have access to resources until the access token expires—for Power Platform, as long as an hour, by default. With continuous access evaluation, however, Power Platform services such as Dataverse continuously evaluate a user's [critical events](/azure/active-directory/conditional-access/concept-continuous-access-evaluation#critical-event-evaluation) and network location changes. They proactively terminate active user sessions, or require reauthentication, and enforce tenant policy changes in near real time instead of waiting for an access token to expire.

As organizations continue to adopt hybrid work models and cloud applications, Microsoft Entra ID is a key primary security perimeter that protects users and resources. Conditional access extends that perimeter beyond a network boundary to include user and device identity. Continuous access ensures that access is re-evaluated as events or user locations change. By using Microsoft Entra ID with Power Platform products, you can apply consistent security governance across your application portfolio.

Review these [identity management best practices](https://learn.microsoft.com/en-us/azure/security/fundamentals/identity-management-best-practices) for more tips on how to use Microsoft Entra ID with Power Platform.

## Environment access

A [Power Platform environment](/power-platform/admin/environments-overview) is a logical container and unit of governance management that represents the security boundary in Power Platform. Many features such vNet, Lockbox, and security groups all operate at an environment-level of granularity from a management perspective. This allows different security requirements to be implemented in different environments depending on your business needs. Users will get access to an environment based on a security role that they are assigned. Simply having a license and an identity at tenant level is not enough to grant access to an environment unless it is the [default environment](/power-platform/admin/environments-overview#default-environment).

Environments that have Dataverse support more advanced security models specific to controlling access to data and services with a Dataverse database.

### Assign security groups to environments

We recommend you [use security groups](/power-platform/admin/control-user-access) to control which licensed users can be members of a particular environment. You can use security groups to control who can access resources in Power Platform environments other than the default environment or developer environments. Link one security group to each environment that has at least one user or nested security group. Using a security group for each environment helps you make sure that only the right users have access to each one. If you automate your environment creation process, you can also automate creating the security group and make sure that your admins have access to any new environment.

Power Platform admins have access to all environments, even if they aren’t in the security group for the environment. Dynamics 365 admins need to be in the security group to access the environment.

### Manage guest users

You might need to let guest users access environments and Power Platform resources. Set up their access to environments and apps as described earlier. As with internal users, you can use Microsoft Entra ID conditional access and continuous access evaluation to ensure that guest users are held to an elevated level of security.

To further enhance security and reduce the risk of incidental over-sharing, you can also block or enable [access by Entra guests to your Dataverse-backed environments](/power-platform/admin/security/identity-access-management#guest-access-preview) as needed. By default, guest access is restricted for new Dataverse-backed environments, ensuring a secure setup from the start. With this new public preview feature, you can further boost your security score by enabling this setting for existing environments, too.

### Route makers to their own development environment

[Environment routing](/power-platform/admin/default-environment-routing) allows Power Platform admins to automatically direct new or existing makers into their own personal developer environments when they visit make.powerapps.com or copilotstudio.microsoft.com. We recommend you configure environment routing offers makers a personal, safe space to build with Microsoft Dataverse without the fear of others accessing their apps or data.

## Resource access

The ability to create and run specific applications and flows is controlled by security roles in the context of environments. For example, one can share a canvas apps directly with a user or with an Entra ID group, while still being subject to Dataverse security roles. On the other hand, sharing of model-driven apps is done via Dataverse security roles only.

### Provide role-based authorization

Based on the responsibility of each identity, authorize actions that should be permitted. An identity must not be allowed to do more than it needs to do. Before you set authorization rules, you need to have a clear understanding of who or what is making requests, what that role is allowed to do, and to what extent it can do it. Those factors lead to choices that combine identity, role, and scope.

Consider the following:

- Does the identity need read or write access to the data? What level of write access is required?
- If the identity is compromised by a bad actor, what would the impact to the system be in terms of confidentiality, integrity, and availability?
- Does the identity need permanent access or can conditional access be considered?
- Does the identity perform actions that require administrative/elevated permissions?
- How will the workload interact with third-party services?

### Assign roles to identities based on their requirements

A role is a *set of permissions* assigned to an identity. Assign roles that only allow the identity to complete the task, and no more. When user's permissions are restricted to their job requirements, it's easier to identify suspicious or unauthorized behavior in the system.

Ask questions like these:

- Is read-only access enough?
- Does the identity need permissions to delete resources?
- Does the role only need access to the records they created?
- Is hierarchical access based on the business unit the user is in required?
- Does the role need administrative or elevated permissions?
- Does the role need permanent access to these permissions?
- What happens if the user changes jobs?

**Limiting the level of access that users have reduces the potential attack surface**. If you grant only the minimum permissions that are required to perform specific tasks, the risk of a successful attack or unauthorized access is significantly reduced. For example, developers only need maker access to the Development environment but not the Production environment; they only need access to create resources but not change environment properties; and they may only need access to read/write data from Dataverse but not change the data model or attributes of the Dataverse table.

**Avoid permissions that target individual users**. Granular and custom permissions create complexity and confusion and can become difficult to maintain as users change roles and move across the business, or as new users with similar authentication requirements join the team. This situation can create a complex legacy configuration that's difficult to maintain and negatively impact both security and reliability.

**Grant roles that start with least privilege** and add more based your operational or data access needs. Your technical teams must have clear guidance to implement permissions.

### Establish processes to manage the identity lifecycle

Access to identities must not last longer than the resources that the identities access. Ensure that you have a process for disabling or deleting identities when there are changes in team structure or software components.

Establish an identity governance process to manage the lifecycle of digital identities, high-privileged users, external/guest users, and workload users. Implement access reviews to ensure that when identities leave the organization or the team, their workload permissions are removed.

### Configure sharing limits

As the race to adopt AI is prioritized across industries, admins are looking to address the risk of over-sharing resources. [Managed security](/power-platform/admin/security/managed-security) supports [granular sharing limits](/power-platform/admin/managed-environment-sharing-limits) for canvas apps and solution-aware cloud flows, preventing makers from sharing flows across security groups and with individuals.

For Copilot Studio agent scenarios, admins are equipped with fine-grained controls over editor versus viewer permissions on a per environment or environment group basis and can limit viewers to security groups, individuals, or a finite number of viewers.

:::image type="content" source="media/limit-sharing.png" alt-text="Limit sharing":::

### Connect to Azure resources that support managed identity

To minimize the risk associated with accessing external resources, [Managed Identities support for Dataverse plugins](/power-platform/admin/managed-identity-overview) allows for secure and seamless authentication, eliminating the need for hard-coded credentials and simplifying the management of access to resources.

## Dataverse access

Dataverse has a rich [security model](/power-platform/admin/wp-security) to protect the data integrity and privacy of users while promoting efficient data access and collaboration. You can combine business units, role-based security, row-based security, and column-based security to define overall access to the information that users have in a Power Platform environment. With Role-Based Access Control you can easily define access permissions and govern data access in a scalable manner. Using a variety of out of the box or customized security roles, your permissions can be granted on a database, table, or even specific record level.

Dataverse even enables fine-grained access controls to manage authorization and data level security roles that define row, field, hierarchical, and group protection, which provide the granularity and flexibility required for securing data used in applications that use highly sensitive business data.

Finally, [Microsoft Purview Data Map](/purview/register-scan-dataverse) is a unified and automated solution that can discover, classify, and label sensitive data across different data sources and domains, including Dataverse. Labeling with Purview Data Map enables organizations to automatically classify the data and easily identify sensitive data. With Purview Data Map integration for Dataverse, you can reduce the manual effort and human error involved in labeling data in Dataverse by using predefined rules and policies that match your business and compliance needs.

## Understand identity and access management requirements

As a customer, you're responsible for:

- Account and identity management
- Creating and configuring conditional access policies
- Creating and assigning security roles
- Enabling and configuring auditing and monitoring
- Authentication and security of components that a Power Platform may connect to

Understand the key requirements for the Power Platform workload you're implementing. Ask yourself the following questions to help identify the identity and access management features to configure.

- How will you implement access control and authentication mechanisms to ensure only authorized users can access the workload?
- How do you ensure secure and seamless user authentication?
- How do you control which apps can interact with the generative AI (agent) and what measures ensure these restrictions are effective?
- How will the workload securely integrate with other internal and external systems?
- Where will users access this solution from - are they using a mobile device or web browser?
- Are your users internal, external, or both?

## Recommendations

Effectively governing makers, users, and guests is essential for maintaining security, compliance, and operational efficiency within Power Platform environments. Here are detailed recommendations for managing access and permissions:

1. **Route makers to their own personal development environment**: Use [environment routing](/power-platform/admin/default-environment-routing) to encourage makers to use their own personal development environments for building and testing applications. This approach isolates development activities from production environments, reducing the risk of accidental changes or disruptions. Personal development environments provide a safe space for experimentation and innovation without impacting critical business operations.

1. **Don't allow maker permissions in test and production environments**: Restrict maker permissions in test and production environments to prevent unauthorized changes and ensure that only approved and thoroughly tested applications are deployed. This separation of duties helps maintain the integrity and stability of production systems, minimizing the risk of errors and security vulnerabilities.

1. **Control access using security roles with least privileges**: Implement role-based access control (RBAC) to assign permissions based on the principle of least privilege. This means granting users only the access they need to perform their specific tasks. By limiting permissions, you reduce the attack surface and minimize the potential impact of security breaches.

1. **Diagnose user access issues by invoking 'Run Diagnostics'**: Use the ['Run diagnostics'](/power-platform/admin/troubleshooting-user-needs-read-write-access-organization) feature to troubleshoot and diagnose user access issues. This tool helps identify and resolve permission-related problems, ensuring that users have the appropriate access to perform their tasks. Regular diagnostics can also help detect and address potential security gaps.

1. **Limit sharing with everyone, and evaluate configuring specific limits**: Avoid broad sharing permissions that allow access to everyone. Instead, configure specific sharing limits to control who can access applications and data. This targeted approach ensures that only authorized users can access sensitive information, reducing the risk of data leaks and unauthorized access.

1. **Apply Data Loss Prevention (DLP) policies to developer environments**: Apply DLP policies to developer environments to restrict access to only the connectors that makers need. This helps prevent unauthorized data transfers and ensures that sensitive information is protected. Regularly review and update DLP policies to align with changing security requirements.

1. **Use Entra ID Groups to secure environment access**: Use Microsoft Entra ID groups to manage and secure access to Power Platform environments. By grouping users based on their roles and responsibilities, you can efficiently assign and manage permissions. Entra ID groups also simplify the process of updating access controls as organizational needs evolve.

1. **Use Dataverse to have built-in flexible RBAC security model**: Using Dataverse provides a built-in, flexible Role-Based Access Control (RBAC) security model that allows you to manage user permissions and access to data effectively. This model enables you to define custom roles and assign specific permissions based on job functions and responsibilities, ensuring that users have only the necessary access to perform their tasks. With features like granular permissions, hierarchical security, and team-based access, Dataverse's RBAC model enhances data protection, supports compliance with regulatory requirements, and simplifies the management of user access within Power Platform environments.

## Next steps

> [!div class="nextstepaction"]
> [Meet compliance requirements](compliance.md)

## Resources

<!-- TODO -- >