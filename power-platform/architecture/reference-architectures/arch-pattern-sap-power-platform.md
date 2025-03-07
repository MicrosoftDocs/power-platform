---
title: SAP and Power Platform solution. 
description: Discover how to integrate Microsoft Power Platform with SAP for seamless data management and automation. Learn more about architecture, workflows, and connectivity methods.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 03/07/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---



# SAP and Power Platform solution

## Architecture diagram

:::image type="content" source="media/arch-pattern-sap-power-platform/architecture.png" alt-text="Screenshot of architecture." lightbox="media/arch-pattern-sap-power-platform/architecture.png":::

## Workflow

While the image above shows a full solution, the flow between the Power
Platform and SAP is straightforward:

**Power Platform Power App / Power Automate flow** – A Power App
leverages Power Automate flow to call through the SAP ERP Connector.

**SAP ERP Connector** – The SAP ERP Connector calls the on-premises
gateway (OPDG). These calls use RFC/BAPI calls.

**On-premises Data Gateway (OPDG)** – Calls SAP and uses SAP. Power
Platform does not bypass authorizations in SAP.

**SAP (and infrastructure)** -OPDG then calls to SAP through the SAP
.Net connector.

**SAP OData connector** – The OData connector can be used to perform
operations like create, read, update, and delete of entities, as well as
invoking functions on the service.

## Alternative connectivity methods

### Virtual Network (VNet)

This document has noted the use the OPDG. There is another option for
connectivity when which is the virtual network data gateway (VNet). This
option only works with the <u>OData SAP connector</u> as it transmits
data through the HTTP(s) protocol (The SAP ERP connector uses RPC/BAPI
calls.)

The VNet lets you connect your Azure and other data services to
Microsoft Fabric and the Power Platform to securely communicate with the
data source, execute queries, and transmit results back to the service.
This method ensures a secure and streamlined connection, enabling
efficient data handling and processing.

As noted above, the OData connector is used to perform operations around
SAP but not design for BAPI call.

### Virtual Tables

Another option is to work with SAP through Virtual Tables. The goal here
allows for Makers to be able to access SAP as if they were access a
Dataverse Table.

**Pros**

- On the Dataverse side you can have a security role that is on the
  table, and then that can be used to grant table level permission.

**Cons**

- Row level permissions are not possible at this time.

- User level validation in the source is not possible.

## Alternative flows

**Desktop flows** in Power Automate will allow you to automate
repetitive desktop processes using robotic process automation (RPA)
capabilities. The process is created through a drag-and-drop interface
or by recording user actions. This makes the creation in a
straightforward way to automate tasks such as data entry, file
organization, and web scraping. Desktop flows can interact with both
modern and legacy applications, allowing users to streamline their
workflows and improve efficiency.

For the rare and special times that the connectors do not meet your
requirements or for a one-off screen scraping need, Desktop flows can be
leveraged.

There are a few areas to point out for Desktop flow:

**Power Automate RPA recorder**

Power Automate RPA includes a desktop recorder to capture interactions
with SAP GUI and web applications like SAP Fiori, converting actions
into RPA tasks. A preview feature called Record with Copilot allows
users to build desktop automations by sharing their screen and
describing the task.

**Integration using SAP Actions**

Power Automate RPA offers tools to automate SAP workflows, including
launching the SAP GUI app, creating new sessions, selecting menu items,
and managing transactions.

**Integration using VBScript**

SAP has a proprietary SAP GUI automation engine that creates VBScript
output from user interactions captured during screen recording, which
can then be used in a Power Automate RPA bot.

**Hosted RPA**

Hosted RPA frees up resources and reduces costs by eliminating the need
for maintaining hardware or virtual machines. It offers two main
scenarios: hosted machines for developing, testing, and running bots in
the cloud, and hosted machine groups for automatic scaling of workloads
to optimize unattended automation in production.

## Use case details

The use-case for connecting to SAP from the Power Platform are many. The
two primary reasons are:

1)  Task based straightforward user experience – The SAP UI is powerful
    but can be very complicated. This use-case allows the user to focus
    on one to few key tasks in a modern Canvas app experience.

2)  “Keep the core clean” principle – By using the Power Platform you an
    access SAP and keep external flows and rules that are not embedded
    or able to be embedded cleanly in in SAP already safely where they
    belong and do not break SAP core upgrades.

## Components

**Power Apps** is a low-code platform that allows users to create custom
business applications without extensive coding knowledge. Canvas
applications in Power Apps enable users to design and build apps from a
blank canvas, using a drag-and-drop interface to add controls and
connect to various data sources. This approach allows for highly
customizable, pixel-perfect applications that can be used across web and
mobile devices.

**Power Automate** is a cloud-based service from Microsoft that allows
you to automate repetitive tasks and streamline workflows across various
applications and services. It enables users to create automated
workflows, known as flows, which can synchronize files, get
notifications, collect data, and more. Designed for both business users
and IT professionals, Power Automate offers a no-code/low-code platform
that makes it accessible for anyone to create automated processes.

The **SAP ERP connector** for Power Platform allows seamless integration
of SAP systems with Microsoft Power Automate and Power Apps. It enables
users to connect their flows and apps to any SAP ERP system, including
SAP ECC and SAP S/4HANA, by invoking RFC and BAPI functions through an
on-premises data gateway. This connector supports secure authentication
methods such as SAP Basic, Windows (Kerberos), and Azure Active
Directory, making it easier for organizations to develop modern apps and
automate business processes using their existing SAP data.

The **on-premises data gateway** (OPDG) is a locally installed Windows
client application that acts as a bridge between your local on-premises
data sources and services in the Microsoft cloud. It provides quick and
secure data transfer without requiring any inbound ports to your
network, only outbound ports to reach the Azure web service to which the
gateway connects. This gateway supports multiple services, including
Power BI, Power Apps, Power Automate, Azure Analysis Services, and Azure
Logic Apps, allowing organizations to keep their databases and other
data sources on-premises while securely using that data in cloud
services.

**Desktop flows** in support the creation of Automation to help remove
repetitive desktop tasks. Desktop flows can interact with both modern
and legacy applications, allowing users to streamline their workflows
and improve efficiency1.

As noted earlier, for the rare and special instances where connectors do
not meet requirements, Desktop flows can be used.

## Considerations

There are multiple ways to work with SAP, above it was discussed
accessing SAP directly, but you can also consider using Virtual Tables
which would make work for low-code Makers easier.

### Security

Stringent security & governance for developers and end-users is vital
when building SAP-connected solutions with Power Platform. Power
Platform does not bypass authorizations in SAP. Leveraging Entra ID,
Tenant access, App access and SAP authentication, there are many levels
to ensure data is kept safe.

:::image type="content" source="media/arch-pattern-sap-power-platform/security.png" alt-text="Screenshot of security." lightbox="media/arch-pattern-sap-power-platform/security.png":::




### Operational Excellence

You have flexibility in how you incorporate Power Platform solutions
into your specific software delivery tools and processes. The Power
Platform offers in-product tools (Pipelines) but also fits into your
broader DevOps strategy by connecting with tools such as Azure DevOps
and GitHub Actions.

## Related resources

- What is Microsoft Power Platform integration with SAP? - [Explore Power Platform and SAP integration - Power Platform](/power-platform/sap/explore/power-platform-and-sap-integration)

- Microsoft Power Platform security and governance documentation -
[Microsoft Power Platform security and governance documentation - Power Platform](/power-platform/admin/security)

- SAP + Power Platform white paper [SAP + Power Platform white paper - Power Platform](/power-platform/sap/explore/white-paper)

- SAP and Microsoft Power Platform architecture workflow - [SAP and Power Platform Architecture Workflow - Cloud Adoption Framework](/azure/cloud-adoption-framework/scenarios/sap/sap-power-platform-architecture-workflow)

Data Access

 - SAP ERP Connector - [SAP ERP - Connectors \| Microsoft Learn](/connectors/saperp/)

 - SAP OData - [SAP OData - Connectors \| Microsoft Learn](/connectors/sapodata/)

 - Desktop Flows - [Introduction to desktop flows - Power Automate](/power-automate/desktop-flows/introduction)

 - SAP Hana - [What is SAP
 HANA?](https://www.sap.com/products/technology-platform/hana/what-is-sap-hana.html)

 On-premises data gateway

 - On-premises data gateway - [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem)

 - Set up on-premises data gateway for SAP integration with Power
 Platform - [Set up on-premises data gateway for SAP - Power Platform](/power-platform/enterprise-templates/finance/sap-procurement/administer/set-up-gateway#gateway-cluster-configuration)

VNet

 - [What is a virtual network (VNet) data gateway](/data-integration/vnet/overview)

 - [Virtual Network support overview - Power Platform](/power-platform/admin/vnet-support-overview)

Virtual Tables

 - [Microsoft Dataverse - Virtual tables](/power-platform-release-plan/2022wave2/data-platform/virtual-tables)

 - [Create virtual tables using the virtual connector provider](/aka.ms/VirtualTableProviders)

 - [Create and edit virtual tables with Microsoft Dataverse - Power Apps](/power-apps/maker/data-platform/create-edit-virtual-entities)

ALM

 - Pipelines - [Overview of tools and apps used for ALM in Power Platform - Power Platform](/power-platform/alm/tools-apps-used-alm#pipelines)

 - Microsoft Power Platform Build Tools for Azure DevOps - [Microsoft Power Platform Build Tools for Azure DevOps - Power Platform](/power-platform/alm/devops-build-tools)

- GitHub Actions for Microsoft Power Platform - [GitHub Actions for Microsoft Power Platform - Power Platform](/power-platform/alm/devops-github-actions)
