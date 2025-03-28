---
title: Governance overview
description: Guidance for developing an governance
author: manuelap-msft
ms.component: pa-admin
ms.topic: conceptual
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 02/28/2025
---

# Governance overview

Microsoft Power Platform is transforming how organizations deliver modern AI-powered customer experiences, improved employee satisfaction, and business results. Customers increasingly rely on Power Platform to run global-scale, mission critical workloads, where the risk and business impact of failure are high. These workloads demand operational excellence: highly controlled change management to avoid unexpected disruptions to stability and quality, deep insights into ongoing operations to detect and resolve issues, and resiliency to recover from failures.

To address these needs, Power Platform has a suite of capabilities to empower organizations of all sizes to build, deploy, and operate their most critical workloads. Built with both existing and emerging AI-driven solutions in mind, these capabilities ensure stability and minimize disruption while maximizing the productivity of operations teams.

This series of articles provides comprehensive guidance on achieving operational excellence with Power Platform. It covers key areas such as application lifecycle management, observability strategies, and data resilience.

1. [Management at scale](govern-at-scale.md)
1. [Establish an environment strategy](environment-strategy.md)
    1. [Manage the default environment](manage-default-environment.md)
    1. [Manage Dataverse for Teams environments](teams-environment-strategy.md)
1. [Gain insights into Power Platform adoption](observability.md). Explore strategies for monitoring and optimizing the performance and health of Power Platform applications.
1. [Report on resource usage](resource-usage.md). Track and analyze the usage of resources within your Power Platform environments.
1. [Monitor license and capacity consumption](cds-usage.md). Keep track of license allocations and capacity usage to ensure efficient resource management and compliance.

> [!TIP]
> For workload specific recommendations review the [Operational Excellence checklist](/power-platform/well-architected/operational-excellence/checklist) of the [Power Platform Well-Architected](/power-platform/well-architected/) guidance. The Operational Excellence pillar defines processes for development practices, monitoring, and release management. The goal is to establish standards that reduce development time, human error, and user disruption.








---
title: "Admin and governance best practices - Microsoft Power Platform | MicrosoftDocs"
description: "Discover admin and governance best practices for Microsoft Power Platform."
author: manuelap-msft

ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/13/2024
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Admin and governance best practices

What sets Microsoft Power Platform apart from other low-code options already in use in your organization (through Excel or Access) or other shadow IT, point-solution SaaS providers, is that everything is governed and authenticated through Microsoft Entra—you need to sign in with your work or school Microsoft Entra account in order to use this service. This means that as an admin, you have full visibility of everything your makers and users do—it's governable, automatable, auditable, and manageable by default.

In this section, we'll explore some best practices to follow when establishing admin and governance for Microsoft Power Platform.

:::row:::
   :::column span="":::
      <img src="media/i_tools.svg" alt="Manage icon" width="80"/><br><br>**Manage** <br /> 

> [!div class="checklist"]
> * [Designate the Microsoft Power Platform admin role](pp-admin.md)
> * [Manage users](../../admin/create-users.md)  
> * [Plan and manage license and capacity](../../admin/capacity-add-on.md)
> * [Establish an environment strategy](../white-papers/environment-strategy.md)
> * [Manage Microsoft Dataverse for Teams environments](teams-environment-strategy.md)
   :::column-end:::
   :::column span="":::
      <img src="media/i_protect.svg" alt="Secure icon" width="80"/><br><br>**Secure**

> [!div class="checklist"]
> * [Establish tenant and environment level DLP Policies](dlp-strategy.md)
> * [Set up Microsoft Entra conditional access](conditional-access.md)
> * [Enable cross-tenant isolation](../../admin/cross-tenant-restrictions.md)
   :::column-end:::
   :::column span="":::
      <img src="media/i_alert.svg" alt="Overview icon" width="80"/><br><br>**Monitor & Alert**

> [!div class="checklist"]
> * [Report on resource usage](resource-usage.md)
> * [Track user access](access-usage.md)
> * [Monitor Microsoft Dataverse usage](cds-usage.md)
> * [Monitor new connectors](new-connectors.md)
> * [Set up sharing alerts and mitigations](sharing-alerts.md)
> * Don't start from scratch, take advantage of the [CoE Starter Kit](../coe/starter-kit.md)
   :::column-end:::
:::row-end:::

## Related resources

- [Microsoft Power Platform admin guide](../../admin/admin-documentation.md)
- [Microsoft Power Apps and Power Automate Admin Whitepaper](https://aka.ms/powerappsadminwhitepaper)
- [Default environment routing](../../admin/default-environment-routing.md)



[!INCLUDE[footer-include](../../includes/footer-banner.md)]