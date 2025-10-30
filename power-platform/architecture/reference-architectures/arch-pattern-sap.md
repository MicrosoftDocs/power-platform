---
title: Integrate Power Platform with SAP for data management
description: Integrate Microsoft Power Platform with SAP for seamless data management and automation to enhance your organization's efficiency and security.
#customer intent: As a Power Platform user, I want to integrate Microsoft Power Platform with SAP so that I can enhance data management and automation capabilities.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/17/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
ms.contributors:
  - lezucket
search.audienceType:
  - admin
  - flowmaker
---

# Integrate Power Platform with SAP for data management

Integrating Microsoft Power Platform with SAP enhances your oranization's data management and automation capabilities.

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how to connect these two platforms seamlessly. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/arch-pattern-sap/architecture.png" alt-text="Architecture diagram that shows a Power Platform integration with a typical SAP landing zone." lightbox="media/arch-pattern-sap/architecture.png":::

## Workflow

The example architecture diagram shows a full solution, but the flow between Power Platform and SAP is straightforward. The following steps describe the workflow:

1. **Power Platform**: A Power Apps canvas app uses a Power Automate flow to call the SAP ERP connector.

1. **SAP ERP connector**: Calls the on-premises data gateway using RFC and BAPI.

1. **On-premises data gateway**: Calls SAP and uses SAP. Power Platform doesn't bypass authorizations in SAP.

1. **SAP (and infrastructure)**: Calls SAP through the SAP .NET connector.

1. **SAP OData connector**: Performs operations like create, read, update, and delete actions and invokes functions on the service.

### Alternative connectivity methods

An on-premises data gateway isn't the only way to connect to SAP from Power Platform. You can also use an Azure virtual network or virtual tables.

#### Virtual network

The virtual network data gateway lets you connect your Azure and other data services to Microsoft Fabric and Power Platform to securely communicate with the data source, execute queries, and transmit results back to the service. This method ensures a secure, streamlined connection, enabling efficient data handling and processing.

Because the virtual network data gateway transmits data using HTTPS, this option only works with the SAP OData connector. The SAP ERP connector uses RPC and BAPI.

#### Virtual tables

Another option is to work with SAP through virtual tables, accessing SAP data as if you were accessing a Dataverse table.

**Pro**: In Dataverse, a security role on the table grants table-level permission.

**Cons**: Row-level permissions and user-level validation in the source aren't possible.

### Alternative flows

Power Automate desktop flows let you automate repetitive desktop processes using a drag-and-drop interface or by recording user actions. Use desktop flows on the rare occasions when the connectors don't meet your requirements or for a one-time screen scraping need.

Keep the following considerations in mind when you use desktop flows to integrate with SAP:

- **Power Automate RPA recorder:** Power Automate RPA includes a desktop recorder to capture interactions with SAP GUI and web applications like SAP Fiori, converting actions into RPA tasks. A preview feature called "Record with Copilot" lets you build desktop automations by sharing your screen and describing the task.

- **Integration using SAP actions:** Power Automate RPA offers tools to automate SAP workflows, including launching the SAP GUI app, creating sessions, selecting menu items, and managing transactions.

- **Integration using VBScript:** SAP has a proprietary SAP GUI automation engine that creates VBScript output from user interactions captured during screen recording, which can then be used in a Power Automate RPA bot.

- **Hosted RPA:** Hosted RPA frees up resources and reduces costs by eliminating the need to maintain hardware or virtual machines. It's useful in the following scenarios:

  - Hosted machines for developing, testing, and running bots in the cloud
  - Hosted machine groups for automatically scaling workloads to optimize unattended automation in production

## Components

**Power Apps**: A low-code platform that lets you create custom business applications without extensive coding knowledge, using a drag-and-drop interface to add controls and connect to data sources. This approach allows for highly customizable, pixel-perfect apps that can be used across web and mobile devices.

**Power Automate**: A low-code/no-code platform that lets you automate repetitive tasks and streamline workflows across applications and services.

**SAP ERP connector** for Power Platform: Uses remote procedure calls (RPC) with a business application programming interface (BAPI) to connect your Power Platform flows and apps to any SAP ERP system, including SAP ECC and SAP S/4HANA, through an on-premises data gateway. The connector supports secure authentication methods such as SAP Basic, Windows (Kerberos), and Microsoft Entra ID, making it easier for your organization to develop modern apps and automate business processes using its SAP data.

**On-premises data gateway**: A locally installed Windows client application that acts as a bridge between your on-premises data sources and services in the Microsoft Cloud. It provides quick and secure data transfer without requiring any inbound ports to your network, only outbound ports to reach the Azure web service to which the gateway connects. The gateway supports multiple services, including Power BI, Power Apps, Power Automate, Azure Analysis Services, and Azure Logic Apps, allowing your organization to keep its databases and other data sources on-premises while securely using that data in cloud services.

**Desktop flows** in Power Automate: Use robotic process automation (RPA) to automate repetitive desktop tasks. Desktop flows can interact with both modern and legacy applications, allowing users to streamline their workflows and improve efficiency. In the rare and special instances where connectors don't meet your requirements, consider using desktop flows.

### Scenario details

Of the many use cases for connecting to SAP from Power Platform, two are primary:

- **Task-based straightforward user experience:** The SAP UI is powerful but can be complicated. The example scenario lets the user focus on one to a few key tasks in a modern canvas app experience.

- **"Keep the core clean" principle:** You can use Power Platform to access SAP and keep external flows and rules that can't be embedded cleanly in SAP. This approach ensures that flows and rules stay safely where they belong and don't break SAP core upgrades.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

You can work with SAP in multiple ways, including directly or through the use of virtual tables, which simplify tasks for low-code makers.

### Security

Stringent security and governance for developers and end users are vital when building SAP-connected solutions with Power Platform. Power Platform bypasses authorizations in SAP. You can ensure safety at many levels, such as using Microsoft Entra ID, tenant access, app access, and SAP authentication.

:::image type="complex" source="media/arch-pattern-sap/security.png" alt-text="Diagram of Microsoft Entra ID structure for an example tenant, showing environments, apps, flows, connectors, and access levels." lightbox="media/arch-pattern-sap/security.png":::
    Diagram illustrating the structure and access levels within a Microsoft Entra ID environment, which includes Development, Quality, and Production environments for both Contoso USA and Contoso Australia. Each environment includes apps, flows, connectors, pages, and Copilot experiences, with integrations to services like Salesforce, SAP, Workday, and SQL Server.
:::image-end:::

In the diagram, numbered labels indicate different access levels:

1. Tenant access and isolation
1. Environment access
1. Resource permissions
1. Connector access and data loss prevention (DLP) policies
1. Role-based data access
1. On-premises data gateway

Dataverse is highlighted as a central component in both environments.

### Operational Excellence

You have flexibility in how you incorporate Power Platform solutions into your specific software delivery tools and processes. Power Platform offers in-product tools (pipelines) but can also fit into your broader DevOps strategy by connecting with tools such as Azure DevOps and GitHub Actions.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Lee Zuckett](https://www.linkedin.com/in/leezuckett/)**, Senior Program Manager

## Related resources

Power Platform and SAP:

- [What is Microsoft Power Platform integration with SAP?](/power-platform/sap/explore/power-platform-and-sap-integration)
- [What are the Microsoft Power Platform and SAP connection options?](/power-platform/sap/connect/connect-power-platform-and-sap)
- [Microsoft Power Platform security and governance documentation](/power-platform/admin/security)
- [SAP + Power Platform white paper](/power-platform/sap/explore/white-paper)
- [SAP and Microsoft Power Platform architecture workflow](/azure/cloud-adoption-framework/scenarios/sap/sap-power-platform-architecture-workflow)

Data access:

- [SAP ERP connector](/connectors/saperp/)
- [SAP OData connector](/connectors/sapodata/)
- [Introduction to desktop flows](/power-automate/desktop-flows/introduction)

On-premises data gateway:

- [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem)
- [Set up on-premises data gateway for SAP integration with Power Platform](/power-platform/sap/templates/sap-procurement/administer/set-up-gateway)

Azure Virtual Network:

- [What is a virtual network (VNet) data gateway?](/data-integration/vnet/overview)
- [Virtual Network support overview](/power-platform/admin/vnet-support-overview)

Virtual tables:

- [Virtual tables](/power-platform-release-plan/2022wave2/data-platform/virtual-tables)
- [Create virtual tables using the virtual connector provider](https://aka.ms/VirtualTableProviders)
- [Create and edit virtual tables that contain data from an external data source](/power-apps/maker/data-platform/create-edit-virtual-entities)

ALM:

- [Overview of tools and apps used for ALM](/power-platform/alm/tools-apps-used-alm)
- [Microsoft Power Platform Build Tools for Azure DevOps](/power-platform/alm/devops-build-tools)
- [GitHub Actions for Microsoft Power Platform](/power-platform/alm/devops-github-actions)
