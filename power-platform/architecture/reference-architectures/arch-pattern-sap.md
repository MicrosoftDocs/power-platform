---
title: SAP and Power Platform solution
description: Discover how to integrate Microsoft Power Platform with SAP for seamless data management and automation.
#customer intent: As an admin, I want to integrate Microsoft Power Platform with SAP so that I can enhance data management and automation capabilities.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 03/10/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# SAP and Power Platform solution

Integrating Microsoft Power Platform with SAP enhances data management and automation capabilities within your organization. This document provides a guide on how to connect these two platforms seamlessly. 

Learn about the architecture, workflows, and connectivity methods available to ensure a smooth integration process. Additionally, alternative connectivity options and use cases are discussed to help you choose the best approach for your needs. Using the Power Platform streamlines operations, improves efficiency, and maintains robust security and governance standards while working with SAP systems.

## Architecture diagram

:::image type="content" source="media/arch-pattern-sap-power-platform/architecture.png" alt-text="Diagram that shows an architecture of a Microsoft Power Platform integration with a typical SAP landing zone." lightbox="media/arch-pattern-sap-power-platform/architecture.png":::

## Workflow

The architecture image shows a full solution, but the flow between the Power Platform and SAP is straightforward:

1. **Power Platform Power Apps / Power Automate flow**: A Power App uses a Power Automate flow to call the SAP ERP connector.
1. **SAP ERP connector**: The SAP ERP connector calls the on-premises data gateway (OPDG). These calls use RFC/BAPI calls.
1. **On-premises data gateway (OPDG)**: Calls SAP and uses SAP. Power Platform doesn't bypass authorizations in SAP.
1. **SAP (and infrastructure)**: OPDG then calls SAP through the SAP .NET connector.
1. **SAP OData connector**: The OData connector can be used to perform operations like create, read, update, and delete entities, and invoke functions on the service.

## Alternative connectivity methods

In addition to an on-premises data gateway (OPDG), there are other ways to connect to SAP from Power Platform. For example, using a virtual network (VNet) or virtual tables.

### Virtual network

The virtual network data gateway option only works with the OData SAP connector, as it transmits data through the HTTP(s) protocol. The SAP ERP connector uses remote procedure calls (RPC) with a business application programming interface (BAPI).

The virtual network data gateway lets you connect your Azure and other data services to Microsoft Fabric and Power Platform to securely communicate with the data source, execute queries, and transmit results back to the service. This method ensures a secure, streamlined connection, enabling efficient data handling and processing.

As noted, the OData connector is used to perform operations with SAP but isn't designed for BAPI calls.

### Virtual tables

Another option is to work with SAP through virtual tables. The goal is to access SAP as if accessing a Dataverse table.

**Pros**

  In Dataverse, a security role on the table grants table-level permission.

**Cons**

  - Row-level permissions aren't possible at this time.
  - User-level validation in the source isn't possible.

## Alternative flows

Desktop flows in Power Automate let you automate repetitive desktop processes using robotic process automation (RPA) capabilities. You create the process through a drag-and-drop interface or by recording user actions. Power Automate makes it straightforward to automate tasks such as data entry, file organization, and web scraping. 

Desktop flows interact with both modern and legacy applications, letting users streamline workflows and improve efficiency. Use desktop flows for rare occasions when the connectors don't meet your requirements or for a one-time screen scraping need.

Keep in mind the following for desktop flows:

- **Power Automate RPA recorder:** Power Automate RPA includes a desktop recorder to capture interactions with SAP GUI and web applications like SAP Fiori, converting actions into RPA tasks. A preview feature called "Record with Copilot" lets you build desktop automations by sharing your screen and describing the task.

- **Integration using SAP actions:** Power Automate RPA offers tools to automate SAP workflows, including launching the SAP GUI app, creating new sessions, selecting menu items, and managing transactions.

- **Integration using VBScript:** SAP has a proprietary SAP GUI automation engine that creates VBScript output from user interactions captured during screen recording, which can then be used in a Power Automate RPA bot.

- **Hosted RPA:** Hosted RPA frees up resources and reduces costs by eliminating the need for maintaining hardware or virtual machines. It offers two main scenarios:
    - Hosted machines for developing, testing, and running bots in the cloud.
    - Hosted machine groups for automatically scaling workloads to optimize unattended automation in production.

## Use case details

There are many use cases for connecting to SAP from the Power Platform. The two primary reasons are:

1. **Task-based straightforward user experience:** The SAP UI is powerful but can be complicated. This use case lets the user focus on one to a few key tasks in a modern canvas app experience.
1. **Keep the core clean principle:** Using Power Platform, you can access SAP and keep external flows and rules that can't be embedded cleanly in SAP. This ensures they are safely where they belong and don't break SAP core upgrades.

## Components

**Power Apps** is a low-code platform that lets users create custom business applications without extensive coding knowledge. Canvas applications in Power Apps let users design and build apps from a blank canvas, using a drag-and-drop interface to add controls and connect to various data sources. This approach allows for highly customizable, pixel-perfect applications that can be used across web and mobile devices.

**Power Automate** is a cloud-based service from Microsoft that lets you automate repetitive tasks and streamline workflows across various applications and services. It enables users to create automated workflows, known as flows, which can synchronize files, get notifications, collect data, and more. Designed for both business users and IT professionals, Power Automate offers a no-code/low-code platform that makes it accessible for anyone to create automated processes.

The **SAP ERP connector** for Power Platform enables seamless integration of SAP systems with Microsoft Power Automate and Power Apps. It lets users connect their flows and apps to any SAP ERP system, including SAP ECC and SAP S/4HANA, by invoking RFC and BAPI functions through an on-premises data gateway. This connector supports secure authentication methods such as SAP Basic, Windows (Kerberos), and Microsoft Entra ID, making it easier for organizations to develop modern apps and automate business processes using their existing SAP data.

The **On-Premises Data Gateway** (OPDG) is a locally installed Windows client application that acts as a bridge between your local on-premises data sources and services in the Microsoft cloud. It provides quick and secure data transfer without requiring any inbound ports to your network, only outbound ports to reach the Azure web service to which the gateway connects. This gateway supports multiple services, including Power BI, Power Apps, Power Automate, Azure Analysis Services, and Azure Logic Apps, enabling organizations to keep their databases and other data sources on-premises while securely using that data in cloud services.

**Desktop flows** support the creation of automation to help remove repetitive desktop tasks. Desktop flows can interact with both modern and legacy applications, allowing users to streamline their workflows and improve efficiency.

As noted earlier, for the rare and special instances where connectors don't meet requirements, consider using desktop flows.

## Considerations

There are multiple ways to work with SAP. You can access SAP directly, as discussed, or use virtual tables, which simplify tasks for low-code makers.

### Security

Stringent security and governance for developers and end users are vital when building SAP-connected solutions with Power Platform. Power Platform bypasses authorizations in SAP. There are many levels to ensure safety, such as using Microsoft Entra ID, tenant-access, app access, and SAP authentication. 

:::image type="complex" source="media/arch-pattern-sap-power-platform/security.png" alt-text="Diagram of Microsoft Entra ID structure for an example tenant, showing environments, apps, flows, connectors, and access levels." lightbox="media/arch-pattern-sap-power-platform/security.png":::
     Diagram illustrating the structure and access levels within a Microsoft Entra ID environment, which includes Development, Quality, and Production environments for both Contoso USA and Contoso Australia. Each environment includes Apps, Flows, Connectors, Pages, and Copilots with integrations to services like Salesforce, SAP, Workday, SQL Server, etc. Key elements are labeled with numbers indicating different access levels: 1) Tenant access and isolation; 2) Environment access; 3) Resource permissions; 4) Connector access and DLP (Data Loss Prevention); 5) Role-based data access; 6) On-premises data gateway. Dataverse is highlighted as a central component in both environments.
:::image-end:::

### Operational excellence

You have flexibility in how you incorporate Power Platform solutions into your specific software delivery tools and processes. Power Platform offers in-product tools (pipelines) but can also fit into your broader DevOps strategy by connecting with tools such as Azure DevOps and GitHub Actions.

## Related resources

- [What is Microsoft Power Platform integration with SAP?](/power-platform/sap/explore/power-platform-and-sap-integration)
- [Microsoft Power Platform security and governance documentation](/power-platform/admin/security)
- [SAP + Power Platform white paper](/power-platform/sap/explore/white-paper)
- [SAP and Microsoft Power Platform architecture workflow](//cloud-adoption-framework/scenarios/sap/sap-power-platform-architecture-workflow)

Data access:

- [SAP ERP connector](/connectors/saperp/)
- [SAP OData connector](/connectors/sapodata/)
- [Introduction to desktop flows](/power-automate/desktop-flows/introduction)
- [What is SAP HANA?](https://www.sap.com/products/technology-platform/hana/what-is-sap-hana.html).

On-premises data gateway:

- [What is an on-prem data gateway?](/data-integration/gateway/service-gateway-on)
- [Set up on-premises data gateway for SAP](/power-platform/enterprise-/finance/sap-prourement/administer/set-up-gateway#gateway-cluster-configuration)

VNet:

- [What is a virtual network (VNet) data gateway?](/data-integration/vnet/overview)
- [Virtual Network support overview](/power-platform/admin/vnet-support-overview)

Virtual tables:

- [Microsoft Dataverse virtual tables](/power-platform-release-plan/2022wave2/data-platform/virtual-tables)
- [Create virtual tables using the virtual connector provider](https://aka.ms/VirtualTableProviders)
- [Create and edit virtual tables with Microsoft Dataverse](/power-apps/maker/data-platform/create-edit-virtual-entities)

ALM:

- [Overview of tools and apps used for ALM in Power Platform](/power-platform/alm/tools-apps-used-alm#pipelines)
- [Microsoft Power Platform Build Tools for Azure DevOps](/power-platform/alm/devops-build-tools)
- [GitHub Actions for Microsoft Power Platform](/power-platform/alm/devops-github-actions)