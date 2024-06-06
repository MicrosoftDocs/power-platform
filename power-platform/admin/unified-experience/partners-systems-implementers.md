---
title: Administration for partners and systems implementers 
description: This article provides an overview and explains key differences between the Power Platform admin center and Lifecycle Services (LCS).
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

Microsoft partners and systems implementers play a crucial role in deploying, managing, and optimizing solutions built for finance and operations apps. With the transition of administrative capabilities to Power Platform admin center, there are significant changes and enhancements in both technology and processes. This article provides an overview of these improvements, focusing on the key differences in terminology and processes compared to the Lifecycle Services (LCS) admin center.

## A single, unified admin center 

The Power Platform admin center is designed to provide a unified, streamlined experience for managing all components within the Power Platform ecosystem. For finance and operations partners, this transition brings new administrative capabilities and processes that align more closely with the broader Power Platform and Microsoft 365 environments.

### Key features of Power Platform admin center 

**Unified environment management**
- Manage environments for all Dynamics 365 workloads and low-code resources in a single place, with a single set of APIs and user interface.
- Perform lifecycle operations such as copy, backup, and restore that operates on the whole environment, inclusive of finance and operations apps components in a single action.

**User and role management**
- Assign and manage user roles and permissions across different environments.
- All users with the System Administrator role in Dataverse get the same role in finance and operations apps experiences. (This experience is planned for a future release.)

**License and capacity reporting**
- Review capacity consumption across various categories such as Dataverse database and Operations database.
- Slice consumption by environment or geography. See which tables or files are consuming most your entitlements.
- Manage add-on capabilities such as AI Builder credits and per app passes.

**Compliance and policy**
- Implement data policies to control connector usage by low-code makers and reduce operational risk.
- Utilize advanced security features such as customer-managed keys for data encryption, tenant isolation, and VNET firewalls for your Power Platform workloads.

### Differences in terminology and process
As part of the transition, partners and customers can get similar end results through new approaches and using new terminology.

#### Terminology changes

|Lifecycle Services (LCS) terminology| Power Platform admin center terminology|
|------------------------------------|----------------------------------------|
| Project | Not applicable |
| Finance and operations environment | Finance and Operations App |
| Project Owner role | Power Platform administrator role in Microsoft Entra | 
| Asset library | Not applicable |
| Software deployable package | Unified package |
| Database refresh | Environment copy |
| Maintenance mode | Admin mode |

#### Process changes

1. Environment creation
    - **LCS**: Environments are deployed through LCS and are equal to exactly one app: Finance and operations.
    - **Power Platform admin center**: Environments are created using templates that contain Dataverse as a baseline with many Dynamics 365 apps and low-code apps included. Every environment can contain more than one kind of app.

2. Customization deployment
    - **LCS**: Software deployable packages are built and then uploaded to the asset library. From there, they can be installed in to a sandbox, and then later a snapshot of sandbox, is promoted to become the compute for production environments. There's no automation for the production deployment, it must be done in the LCS user interface.
    - **Power Platform admin center**: Unified packages are created using Power Platform CLI or Azure DevOps tasks that contain both Dataverse solutions and X++ modules. These remain hosted offline in source control as a build artifact or on your local storage. They're installed using CLI or Azure DevOps tasks in to any target, be it a sandbox or production environment. Full automation is possible using service principal authentication.

3. User management
    - **LCS**: Project users can manage data in LCS and manage environment lifecycle. To add users to a finance and operations apps environment, it must be done inside of the environment itself.
    - **Power Platform admin center**: Service-level admins and environment admins can manage resources in PPAC. They can also add or remove users from Power Platform admin center directly without needing to access the environment's Dataverse instance or apps.

4. Monitoring environment health
    - **LCS**: You can use monitoring tools, were available, for each sandbox and production environment. Features such as compute load, slow loading forms, and database deadlocks were available with a 15-minute delay or longer.
    - **Power Platform admin center**: Application Insights is the preferred tool for application health and proactive monitoring. This is available in near-real time.

5. Support
    - **LCS**: Support requests were created from LCS from within a specific project. You could only create tickets for environments in that particular project.
    - **Power Platform admin center**: Support tickets are created from the admin center for any environment in the tenant that you have access to manage. 

### Granular delegated admin privileges
Granular Delegated Admin Privileges (GDAP) provide partners with more precise control over the administrative privileges they have when managing their customers' environments. Unlike traditional Delegated Admin Privileges (DAP), which offer broad access, GDAP allows for more specific permissions, enhancing security and compliance.

Key aspects of GDAP include:
- **Granular permissions**: Partners can request specific administrative permissions tailored to their role and responsibilities, reducing the risk associated with broad administrative access.
- **Enhanced security**: By limiting access to only necessary resources and actions, GDAP enhances the security posture of both partners and customers.
- **Compliance**: GDAP aligns with regulatory and compliance requirements by ensuring that access is granted based on the principle of least privilege.

#### Requesting a GDAP relationship with customers
Partners can request a GDAP relationship with their customers through the Partner Center. The process involves:

1. **Initiating a request**: Partners submit a request specifying the required permissions and the duration of access.
2. **Customer approval**: Customers review and approve the request, granting the specified permissions.
3. **Access Management**: Partners manage their access through the Partner Center, adjusting permissions as needed.

For more detailed information on setting up and managing GDAP, refer to the [Granular Delegated Admin Privileges](/partner-center/gdap-introduction) documentation.
