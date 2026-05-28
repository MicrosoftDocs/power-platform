---
title: Power Platform and SAP for SAP Basis Admins
description: As an SAP Basis Administrator, you can enable seamless integration of your SAP systems in Power Platform applications. This guide describes key concepts to understand when integrating data from your SAP systems in Power Platform applications.
author: edlehman
ms.author: edleh
contributors:
  - EllenWehrle
  - haowusky
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 03/17/2026
ms.service: power-platform
ms.subservice: sap
---
# Enable Power Platform applications integrated with SAP as an SAP Basis administrator

As an SAP Basis administrator, you play a crucial role in enabling the integration of SAP systems with Microsoft Power Platform. By integrating these systems, you can create applications, workflows, and chatbots that enhance business processes by leveraging SAP data.

## Architecture of the integration

The integration between Power Platform and SAP involves several key components:

- **Power Platform Connectors:** Microsoft provides connectors such as the SAP ERP Connector and the SAP OData Connector. These connectors encapsulate the necessary APIs for data exchange between Power Platform and SAP. They support both RFC-based and HTTP-based connectivity, enabling app makers to perform operations like creating, updating, or retrieving data from SAP.
- **On-Premises Data Gateway:** The on-premises data gateway acts as a bridge, providing secure data transfer between on-premises SAP systems and Power Platform. It uses outbound ports to reach Azure services, so it doesn't require any inbound ports. This design enhances security.
- **Principal Propagation:** This mechanism ensures secure and seamless authentication between Power Platform and SAP systems. It allows the identity of the user in Power Platform to be propagated to the SAP system, so all actions performed in SAP are attributed to the correct user.

:::image type="content" source="media/admin/flex-design.png" alt-text="Power Platform Connectors for SAP integrates Power Platform and SAP products":::

## Implementing Microsoft Power Platform connectors

To enable the integration, administrators need to set up and configure the necessary connectors:

- **Set up the on-premises data gateway:** Install the gateway on a Windows VM and configure it to communicate with the SAP system.
- **Install the SAP .NET Connector:** This connector enables the gateway to communicate with SAP systems by using RFC.
- **Configure authentication:** Set up authentication mechanisms such as SAP Authentication, Windows Authentication (using SNC), or Microsoft Entra ID with Kerberos or Certificates.

## Power Platform SAP Setup Assistant

[Power Platform SAP Setup Assistant](/power-platform/enterprise-templates/finance/sap-procurement/administer/sap-setup-assistant/overview) guides you through integrating Power Platform with SAP and setting up the SAP Procurement template. It walks administrators through a checklist of manual and automated steps to get the Power Platform and SAP solution up and running. This process includes setting up the on-premises data gateway, configuring connectors, and ensuring secure data transport.

## Using copilots to automate administrative tasks

By using Copilot Studio, administrators can create and customize AI-powered conversational copilot chatbots that automate various administrative tasks, such as password resets. These copilots can interact with users through natural language, providing a user-friendly interface for performing routine tasks efficiently.

## Quick tips

### Impact of Power Platform on SAP system performance

The Power Platform runs on SAP's API layer, which typically provides better system performance than running the same activities in the SAP GUI. As more users move from the SAP GUI to an external user interface like Power Apps, CPU consumption on the SAP servers significantly decreases.

### Performance bottlenecks in the SAP connector

The SAP connector doesn't have any inherent performance bottlenecks. Usually, bottlenecks exist within the SAP system itself.

### Authentication methods against SAP

The Power Platform currently supports the following authentication methods for SAP:

- **HTTP/OData:** By using the HTTP connector, the user authenticates against the OData service.
- **Username and password:** Inside Power Apps, a user enters their SAP username and password, which the app sends to SAP.
- **OAuth (Kerberos):** The on-premises data gateway requests a Kerberos ticket on behalf of the Power Apps user, and then sends it to SAP.

### Ensuring user permissions in Power Platform

SAP's published APIs perform the same security checks as if the user were in the SAP GUI. Additionally, Power Automate flows can query a user's authorization objects to conditionally hide apps, fields, and buttons, so the user experience matches their permissions in SAP.

### Encrypting traffic between Power Platform and SAP

To ensure encrypted traffic between Power Platform and SAP, use SAP's Secure Network Communication (SNC). You can enable this feature through a connection setting when you configure authentication.

### Installation requirements on SAP servers

To get Power Platform to work with SAP, you don't need to install anything on SAP servers.

Learn more:

- [SAP and Power Platform white paper](https://go.microsoft.com/fwlink/?linkid=2294900)
- [Use a solution to customize](/power-platform/alm/use-solutions-for-your-customizations)
- [Manage solutions using PowerShell](/power-platform/alm/powershell-api)
