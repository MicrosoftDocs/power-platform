---
title: "Administration for partners and systems implementers  | Microsoft Docs"
description: Administration for partners and systems implementers
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 05/23/2024
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Administration for partners and systems implementers 

Microsoft Partners and Systems Implementers (SIs) play a crucial role in deploying, managing, and optimizing solutions built for finance and operations apps. With the transition of administrative capabilities to Power Platform admin center (PPAC), there are significant changes and enhancements in both technology and processes. This article provides an overview of these improvements, focusing on the key differences in terminology and processes compared to the Lifecycle Services (LCS) admin center.

## A single, unified admin center ## 

The Power Platform Admin Center is designed to provide a unified, streamlined experience for managing all components within the Power Platform ecosystem. For Finance and Operations partners, this transition brings new administrative capabilities and processes that align more closely with the broader Power Platform and Microsoft 365 environments.

### Key Features of Power Platform Admin Center ###

1. **Unified environment management**
- Manage environments for all Dynamics 365 workloads and low-code resources in a single place, with a single set of APIs and user interface. 
- Perform lifecycle operations such as copy, backup, restore that operates on the whole environment inclusive of finance and operations apps components in a single action.
2. **User and role management**
- Assign and manage user roles and permissions across different environments.
- All users with the System Administrator role in Dataverse get the same role in finance and operations apps experiences (this experince is coming soon)
3. **License and capacity reporting**
- Review capacity consumption across various categories such as Dataverse Database and Operations Database.
- Slice consumption by environment or geography. See which tables or files are consuming most your entitlements.
- Manage add-on capabilities such as AI Builder Credits, and Per App passes.
4. **Compliance and policy**
- Implement data policies to control connector usage by low-code makers and reduce operational risk.
- Utilize advanced security features such as customer managed keys for data encryption, tenant isolation, and VNET firewalls for your Power Platform workloads.

### Differences in terminology and process ###
As part of the transition, partners and customers can get similar end results via new approaches and using new terminology.

**Terminology changes**
|Lifecycle Services (LCS) Terminology| Power Platform admin center Terminology|
|************************************| *********************************|
| Project | Not applicable |
| Finance and operations environment | Finance and Operations App |
| Project Owner Role | Power Platform Administrator role in Entra | 
| Asset Library | Not applicable |
| Software Deployable Package | Unified package |
| Database refresh | Environment copy |
| Maintenance mode | Admin mode |

**Process changes**
1. Environment creation
- **LCS**: Environments are deployed through LCS and are equal to exactly one app: Finance and operations.
- **PPAC**: Environments are created using templates that contain Dataverse as a baseline with many Dynamics 365 apps and low-code apps included. Every environment can contain more than one kind of app.

2. Customization deployment
- **LCS**: Software deployable packages are built and then uploaded to the asset library. From there, they can be installed in to a sandbox and then later a snapshot of sandbox is promoted to become the compute for production environments. There's no automation for the production deployment, it must be done in LCS UI.
- **PPAC**: Unified packages are created using Power Platform CLI or our Azure DevOps tasks that contain both Dataverse solutions and X++ modules. These remain hosted offline in source control as a build artifact or on your local storage. They're installed using CLI or DevOps tasks in to any target be it a sandbox or production environment. Full automation is possible using service principal authentication.

3. User management
- **LCS**: Project users can manage data in LCS and manage environment lifecycle. But to add users to a finance and operations apps environment it must be done inside of the environment itself.
- **PPAC**: Service-level admins and environment admins can manage resources in PPAC. They can also add/remove users from PPAC directly without needing to access the environment dataverse instance or apps.

4. Monitoring environment health
- **LCS**: Monitoring tools were available for each sandbox and production environment. Features such as compute load, slow loading forms, and database deadlocks were available with a 15-minute delay or longer.
- **PPAC**: Application Insights is the preferred tool for application health and proactive monitoring. This is available in near-real time.

5. Support
- **LCS**: Support requests were created from LCS from within a specific project. You could only create tickets for environments in that particular project.
- **PPAC**: Support tickets are created from PPAC for any environment in the tenant that you have access to manage. 

### Granular delegated admin privileges (GDAP) ###
Granular Delegated Admin Privileges (GDAP) provide partners with more precise control over the administrative privileges they have when managing their customers' environments. Unlike traditional Delegated Admin Privileges (DAP), which offer broad access, GDAP allows for more specific permissions, enhancing security and compliance.

**Key Aspects of GDAP**
- **Granular Permissions**: Partners can request specific administrative permissions tailored to their role and responsibilities, reducing the risk associated with broad administrative access.
- **Enhanced Security**: By limiting access to only necessary resources and actions, GDAP enhances the security posture of both partners and customers.
- **Compliance**: GDAP aligns with regulatory and compliance requirements by ensuring that access is granted based on the principle of least privilege.

**Requesting a Relationship with Customers**
Partners can request a GDAP relationship with their customers through the Partner Center. The process involves:
1. **Initiating a Request**: Partners submit a request specifying the required permissions and the duration of access.
2. **Customer Approval**: Customers review and approve the request, granting the specified permissions.
3. **Access Management**: Partners manage their access through the Partner Center, adjusting permissions as needed.

For more detailed information on setting up and managing GDAP, refer to the [Granular Delegated Admin Privileges](/partner-center/gdap-introduction) documentation.