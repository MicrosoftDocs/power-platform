---
title: "Unified developer experience for finance and operations apps (preview)"
description: Learn about developing code for finance and operations apps using the new Power Platform unified developer experience.
author: pvillads
ms.date: 08/22/2023
ms.topic: overview
ms.reviewer: pehecke
ms.author: pvillads
ms.subservice: developer
---

# Unified developer experience for finance and operations apps (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

The unified developer experience consolidates the disparate developer tools and environments across finance and operations apps and Power Platform to reduce friction and simplify working across these apps. Finance and operations apps provide a rich ecosystem for professional developers by using a metadata and code-based development environment for mission critical scenarios. Power Platform brings the ability to author solutions quickly and seamlessly using low-code development paradigms and leverages Microsoft Dataverse as the relational data store. Power Platform also adds the ability to build and deploy your solutions using a continuous integration and deployment (CI/CD) pipeline.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.


## Typical scenario

Consider a typical scenario where a developer would create a simple app for capturing orders in Microsoft Power Apps and persisting the gathered data in Dataverse. By means of the data synchronization engines mentioned below, the data would be available for finance and operations apps to do the heavy lifting of determining whether the requested items are available and pricing, etc. The results would be available near real-time in Power Apps.

## Finance and operations app development

Development for finance and operations apps is accomplished in Visual Studio using the Visual Studio add-in. This development environment provides everything a professional developer would expect. The unified environment runs in the cloud, and because of that we have made several changes and improvements to the way a developer works with finance and operations apps. However, existing finance and operations app developers will find that the large majority of their workflows will not be different from what they are used to. The article [Write, deploy, and debug X++ code (preview)](finance-operations-debug.md) walks you through how to build X++ code, deploy it to the cloud, execute and debug it there. All other content that you are likely to find about finance and operations app development, like how to extend existing code, is likely to still hold true.

More information: [Install and configure development tools (preview)](finance-operations-install-config-tools.md)

## Power Platform

Power Platform is supported by a rich development ecosystem. There is a rich set of tools in Power Platform that you can leverage for development. In particular, the Dataverse relational database management system is utilized by the unified developer experience. Many unified solutions work by synchronizing data between tables in the finance and operations app database and tables (entities) in Dataverse. There are two technologies for that: dual-write, and virtual entities.

More information: [Microsoft Power Platform developer documentation](../index.yml)

### Dual Write

Dual-write provides a tightly coupled near real-time and bi-directional integration between the finance and operations apps and Dataverse. Once an entity is enabled for dual-write, any create, update, or delete change in finance and operations apps results in writes to Dataverse and vice versa. For example, a change in the Customer entity in finance and operations apps is reflected in the Account entity in Dataverse and vice-versa. While all this happens with minimal setup, Power Platform does provide an advanced user interface for all your customization needs.

More information: [DualWrite](https://powerapps.microsoft.com/blog/announcing-dual-write-preview).

### Virtual tables

Virtual tables, also known as virtual entities, enable the integration of data residing in external systems (including finance and operations). The virtual table capability seamlessly represents external data in Dataverse tables without replication of data and often without custom coding.

More information: [Virtual Tables](/power-apps/developer/data-platform/virtual-entities/get-started-ve).

## Next steps

Set up Visual Studio on your local development computer.

> [!div class="nextstepaction"]
> [Install and configure development tools](finance-operations-install-config-tools.md)

### See also

[Install and configure development tools (preview)](finance-operations-install-config-tools.md)  
[Write, deploy, and debug X++ code (preview)](finance-operations-debug.md)  
[Frequently asked questions (preview)](finance-operations-faq.md)  
[Tutorial: Provision a new environment with an ERP-based template (preview)](../../admin/unified-experience/tutorial-deploy-new-environment-with-ERP-template.md#tutorial-provision-a-new-environment-with-an-erp-based-template-preview)  
[Develop and customize home page](/dynamics365/fin-ops-core/dev-itpro/dev-tools/developer-home-page) (Dynamics 365 legacy information)  
[Unified admin experience for finance and operations apps (preview)](../../admin/unified-experience/finance-operations-apps-overview.md)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
