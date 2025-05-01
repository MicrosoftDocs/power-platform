---
title: Administration for partners and systems implementers
description: This article provides an overview and explains key differences between the Power Platform admin center and Lifecycle Services.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 06/06/2024
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Administration for partners and systems implementers

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Microsoft partners and systems implementers play a crucial role in deploying, managing, and optimizing solutions that are built for finance and operations apps. The transition of administrative capabilities to the Power Platform admin center brings significant changes and enhancements in both technology and processes. This article provides an overview of the improvements. It focuses on the key differences in terminology and processes between the Power Platform admin center and the previous admin center, Microsoft Dynamics Lifecycle Services.

## A single, unified admin center

The Power Platform admin center is designed to provide a unified, streamlined experience for managing all components within the Power Platform ecosystem. For finance and operations partners, this transition brings new administrative capabilities and processes that are more closely aligned with the broader Power Platform and Microsoft 365 environments.

### Key features of the Power Platform admin center

**Unified environment management**

- Manage environments for all Dynamics 365 workloads and low-code resources in a single place by using a single set of APIs and a single user interface (UI).
- In a single action, perform lifecycle operations, such as copy, backup, and restore, that work on the whole environment, including finance and operations apps components.

**User and role management**

- Assign and manage user roles and permissions across different environments.
- All users who have the System Administrator role in Dataverse have the same role in finance and operations apps experiences. (This feature is planned for a future release.)

**License and capacity reporting**

- Review capacity consumption across various categories, such as Dataverse database and Operations database.
- Slice consumption by environment or geography. View which tables or files are consuming most of your entitlements.
- Manage add-on capabilities such as AI Builder credits and per-app passes.

**Compliance and policy**

- Implement data policies to control connector usage by low-code makers and reduce operational risk.
- Use advanced security features such as customer-managed keys for data encryption, tenant isolation, and virtual network (VNet) firewalls for your Power Platform workloads.

### Differences in terminology and process

As part of the transition, partners and customers can achieve similar results through new approaches and by using new terminology.

#### Terminology changes

| Lifecycle Services terminology | Power Platform admin center terminology |
|--------------------------------|-----------------------------------------|
| Project | Not applicable |
| Finance and operations environment | Finance and operations app |
| Project Owner role | Power Platform administrator role in Microsoft Entra |
| Asset library | Not applicable |
| Software deployable package | Unified package |
| Database refresh | Environment copy |
| Maintenance mode | Admin mode |

#### Process changes

- Environment creation

    - **Lifecycle Services**: Environments are deployed through Lifecycle Services and correspond to exactly one app: a finance and operations app.
    - **Power Platform admin center**: Environments are created by using templates that contain Dataverse as a baseline. Many Dynamics 365 apps and low-code apps are included. Every environment can contain more than one kind of app.

- Customization deployment

    - **Lifecycle Services**: Software deployable packages are built and then uploaded to the Asset library. From there, they can be installed in a sandbox environment. Later, a snapshot of the sandbox is promoted to become the compute for production environments. There's no automation for the production deployment. It must be done in the Lifecycle Services UI.
    - **Power Platform admin center**: Unified packages are created by using Power Platform CLI or Azure DevOps tasks that contain both Dataverse solutions and X++ modules. These packages are hosted offline in source control as a build artifact or in your local storage. Power Platform CLI or Azure DevOps tasks are used to install them in any target, regardless of whether that target is a sandbox environment or a production environment. Full automation is possible through service principal authentication.

- User management

    - **Lifecycle Services**: Project users can manage data in Lifecycle Services and can also manage the environment lifecycle. Users can be added to a finance and operations apps environment only from inside the environment itself.
    - **Power Platform admin center**: Service-level admins and environment admins can manage resources in the Power Platform admin center. They can also add or remove users directly from the Power Platform admin center, without having to access the environment's Dataverse instance or apps.

- Environment health monitoring

    - **Lifecycle Services**: Monitoring tools are available for each sandbox and production environment. Features such as compute load, slow loading forms, and database deadlocks are available, but there's a delay of at least 15 minutes.
    - **Power Platform admin center**: Application Insights is the preferred tool for application health and proactive monitoring. This tool is available in near-real time.

- Support

    - **Lifecycle Services**: Support requests are created from within a specific project in Lifecycle Services. You can create tickets only for environments in that specific project.
    - **Power Platform admin center**: Support tickets are created in the Power Platform admin center, for any environment in the tenant that you have access to manage.

### Granular delegated administrative privileges

Granular delegated administrative privileges (GDAP) give partners more precise control over the administrative privileges that they have when they manage their customers' environments. Unlike traditional delegated administrative privileges (DAP), which give broad access, GDAP allows for more specific permissions. Therefore, it enhances security and compliance.

Key aspects of GDAP include:

- **Granular permissions**: Partners can request specific administrative permissions that are tailored to their role and responsibilities. In this way, GDAP helps reduce the risk that is associated with broad administrative access.
- **Enhanced security**: Access is limited to necessary resources and actions. In this way, GDAP enhances the security posture of both partners and customers.
- **Compliance**: Access is granted based on the principle of least privilege. In this way, GDAP is aligned with regulatory and compliance requirements.

#### Request a GDAP relationship with customers

Partners can request a GDAP relationship with their customers through Partner Center. The process involves three steps:

1. **Initiate a request**: Partners submit a request, where they specify the required permissions and the duration of access.
2. **Receive customer approval**: Customers review the request and approve it to grant the specified permissions.
3. **Manage access**: Partners manage their access through Partner Center and adjust permissions as needed.

For more detailed information about how to set up and manage GDAP, review the [Granular Delegated Admin Privileges](/partner-center/gdap-introduction) documentation.
