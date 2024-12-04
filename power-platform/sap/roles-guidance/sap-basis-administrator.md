---
title: Power Platform and SAP for SAP Basis Admins
description: As an SAP Basis Administrator, you can enable seamless integration of your SAP systems in Power Platform applications. This guide describes key concepts to understand when integrating data from your SAP systems in Power Platform applications.
author: edlehman
ms.author: edleh
contributors:
  - EllenWehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 11/01/2024
ms.custom: ignite-2024
ms.service: power-platform
ms.subservice: sap
---
# Enabling Power Platform applications integrated with SAP for SAP Basis Administrators

SAP Basis Administrators play a crucial role in enabling the integration of SAP systems with Microsoft Power Platform. This integration allows for the creation of applications, workflows, and chat bots that enhance business processes by leveraging SAP data.

## Architecture of the integration

The integration between Power Platform and SAP involves several key components:

- **Power Platform Connectors:** Microsoft provides connectors such as the SAP ERP Connector and the SAP OData Connector, which encapsulate the necessary APIs for data exchange between Power Platform and SAP. These connectors support both RFC-based and HTTP-based connectivity, enabling app makers to perform operations like creating, updating, or retrieving data from SAP.
- **On-Premises Data Gateway:** The on-premises data gateway acts as a bridge, providing secure data transfer between on-premises SAP systems and Power Platform. It uses outbound ports to reach Azure services, ensuring no inbound ports are required, which enhances security.
- **Principal Propagation:** This mechanism ensures secure and seamless authentication between Power Platform and SAP systems. It allows the identity of the user in Power Platform to be propagated to the SAP system, ensuring actions performed in SAP are attributed to the correct user.

:::image type="content" source="media/admin/flex-design.png" alt-text="Power Platform Connectors for SAP integrates Power Platform and SAP products":::

## Implementing Microsoft Power Platform connectors

To enable the integration, administrators need to set up and configure the necessary connectors:

- **Set Up the On-Premises Data Gateway:** Install the gateway on a Windows VM and configure it to communicate with the SAP system.
- **Install the SAP .NET Connector:** This connector enables the gateway to communicate with SAP systems using RFC.
- **Configure Authentication:** Set up authentication mechanisms such as SAP Authentication, Windows Authentication (using SNC), or Microsoft Entra ID with Kerberos or Certificates.

## Power Platform SAP Setup Assistant

[Power Platform SAP Setup Assistant](/power-platform/enterprise-templates/finance/sap-procurement/administer/sap-setup-assistant/overview) guides you through integrating Power Platform with SAP and setting up the SAP Procurement template. It walks administrators through a checklist of manual and automated steps to get the Power Platform and SAP solution up and running. This includes setting up the on-premises data gateway, configuring connectors, and ensuring secure data transport.

## Using copilots to automate administrative tasks

Copilot Studio enables administrators to create and customize AI-powered conversational chatbots (Copilots) that can automate various administrative tasks, such as password resets. These Copilots can interact with users through natural language, providing a user-friendly interface for performing routine tasks efficiently.

## Quick tips

### Impact of Power Platform on SAP system performance

The Power Platform operates on SAP's API layer, which typically offers better system performance compared to running the same activities in the SAP GUI. As more users transition from the SAP GUI to an external user interface like Power Apps, CPU consumption on the SAP servers is expected to decrease significantly.

### Performance bottlenecks in the SAP connector

There are no inherent performance bottlenecks in the SAP connector. Typically, any bottlenecks are within the SAP system itself.

### Authentication methods against SAP

The Power Platform currently the following authentication methods for SAP:

- **HTTP/OData:** Using the HTTP connector, the user authenticates against the OData service.
- **Username/Password:** Inside Power Apps, a user is prompted for their SAP username and password, which is then sent to SAP.
- **OAuth (Kerberos):** The On-premises Data Gateway requests a Kerberos ticket on behalf of the Power Apps user, which is then sent to SAP.

### Ensuring user permissions in Power Platform

SAP's published APIs perform the same security checks as if the user were in the SAP GUI. Additionally, Power Automate flows can query a user's authorization objects to conditionally hide apps, fields, and buttons, ensuring the user experience matches their permissions in SAP.

### Encrypting traffic between Power Platform and SAP

To ensure encrypted traffic between Power Platform and SAP, it is recommended to use SAP's Secure Network Communication (SNC), which is available via a connection setting when configuring authentication.

### Installation requirements on SAP servers

No installation is required on SAP servers to get Power Platform to work with SAP.

Learn more:

- [SAP and Power Platform white paper](https://go.microsoft.com/fwlink/?linkid=2294900)
- [Use a solution to customize](/power-platform/alm/use-solutions-for-your-customizations)
- [Manage solutions using PowerShell](/power-platform/alm/powershell-api)
