---
title: Power Platform and SAP for SAP Basis Administors
description: As an SAP Basis Administrator, you can enable seamless integration of your SAP systems in Power Platform applications. This guide describes key concepts to understand when integrating data from your SAP systems in Power Platform applications.
author: edlehman
ms.author: edleh
contributors:
  - EllenWehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 10/21/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---
# Enabling Power Platform Applications Integrated with SAP for SAP Basis Administrators

SAP Basis Administrators play a crucial role in enabling the integration of SAP systems with Microsoft Power Platform. This integration allows for the creation of applications, workflows, and chatbots that enhance business processes by leveraging SAP data.

 ## Using Copilots to Automate Administrative Tasks

Copilot Studio enables administrators to create and customize AI-powered conversational chatbots (Copilots) that can automate various administrative tasks, such as password resets. These Copilots can interact with users through natural language, providing a user-friendly interface for performing routine tasks efficiently.

## Architecture of the Integration

The integration between Power Platform and SAP involves several key components:

Power Platform Connectors: Microsoft provides connectors such as the SAP ERP Connector and the SAP OData Connector, which encapsulate the necessary APIs for data exchange between Power Platform and SAP. These connectors support both RFC-based and HTTP-based connectivity, enabling app makers to perform operations like creating, updating, or retrieving data from SAP1.
On-Premises Data Gateway: The on-premises data gateway acts as a bridge, providing secure data transfer between on-premises SAP systems and Power Platform. It uses outbound ports to reach Azure services, ensuring no inbound ports are required, which enhances security1.
Principal Propagation: This mechanism ensures secure and seamless authentication between Power Platform and SAP systems. It allows the identity of the user in Power Platform to be propagated to the SAP system, ensuring actions performed in SAP are attributed to the correct user1.

:::image type="content" source="/power-platform/sap/guides/media/explore-power-platform-and-SAP-integration/FlexibleByDesign.png" alt-text="Power Platform Connectors for SAP integrates Power Platform and SAP products":::

Implementing Microsoft Power Platform Connectors

To enable the integration, administrators need to set up and configure the necessary connectors:

Set Up the On-Premises Data Gateway: Install the gateway on a Windows VM and configure it to communicate with the SAP system.
Install the SAP .NET Connector: This connector enables the gateway to communicate with SAP systems using RFC.
Configure Authentication: Set up authentication mechanisms such as SAP Authentication, Windows Authentication (using SNC), or Microsoft Entra ID with Kerberos or Certificates1.
For detailed steps, administrators can refer to the governance administrator page for information on Application Lifecycle Management (ALM) and secure communications1.

## Power Platform SAP Setup Assistant

The Power Platform SAP Setup Assistant provides a guided implementation of the integration. It walks administrators through a checklist of manual and automated steps to get the Power Platform and SAP solution up and running. This includes setting up the on-premises data gateway, configuring connectors, and ensuring secure data transport1.

## Quick tips
### Impact of Power Platform on SAP System Performance

The Power Platform operates on SAP’s API layer, which typically offers better system performance compared to running the same activities in the SAP GUI. As more users transition from the SAP GUI to an external user interface like Power Apps, CPU consumption on the SAP servers is expected to decrease significantly1.

### Performance Bottlenecks in the SAP Connector

There are no inherent performance bottlenecks in the SAP connector. Typically, any bottlenecks are within the SAP system itself. The number of concurrent API threads can be configured to match the session limits on your SAP servers. Additionally, clusters can be arranged for the on-premises data gateway2.

### Authentication Methods Against SAP

The Power Platform currently supports three of the four authentication methods for SAP:

HTTP/OData: Using the HTTP connector, the user authenticates against the OData service3.
Username/Password: Inside Power Apps, a user is prompted for their SAP username and password, which is then sent to SAP4.
OAuth (Kerberos): The On-premises Data Gateway requests a Kerberos ticket on behalf of the Power Apps user, which is then sent to SAP5.
OAuth (X.509): This method is not currently supported but is planned for future support. SAP can support both X.509 and Kerberos authentication on the same SAP instance6.
### Ensuring User Permissions in Power Platform

SAP’s published APIs perform the same security checks as if the user were in the SAP GUI. Additionally, Power Automate flows can query a user’s authorization objects to conditionally hide apps, fields, and buttons, ensuring the user experience matches their permissions in SAP7.

### Encrypting Traffic Between Power Platform and SAP

To ensure encrypted traffic between Power Platform and SAP, it is recommended to use SAP’s Secure Network Communication (SNC), which is available via a connection setting when configuring authentication8.

### Installation Requirements on SAP Servers

No installation is required on SAP servers to get Power Platform to work with SAP9.


Learn more:
- [SAP and Power Platform white paper](https://go.microsoft.com/fwlink/?linkid=2294900)
- [Use a solution to customize](/power-platform/alm/use-solutions-for-your-customizations)
- [Manage solutions using PowerShell](/power-platform/alm/powershell-api) 
 