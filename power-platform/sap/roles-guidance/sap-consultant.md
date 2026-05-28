---
title: Power Platform and SAP for SAP consultants
description: As an SAP consultant, you can seamlessly integrate your SAP systems in Power Platform applications. This guide describes key concepts to understand when integrating data from your SAP systems in Power Platform applications.
author: edlehman
ms.author: edleh
contributors:
  - EllenWehrle
  - haowusky
ms.contributors:
  - reubenk
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 05/20/2026
ms.service: power-platform
ms.subservice: sap
---
# Build integrated Power Platform applications as an SAP consultant

As an SAP consultant, use Microsoft Power Platform to build applications that integrate seamlessly with SAP systems. Create copilots, apps, workflows, and websites that enhance business processes by using SAP data.

## Microsoft Power Platform connectors

Microsoft Power Platform offers connectors, including the SAP ERP and SAP OData connectors, for [streamlined SAP integration](../explore//power-platform-and-SAP-integration.md). These connectors encapsulate APIs needed for data exchange, supporting RFC-based and HTTP-based connectivity. App makers can perform actions like creating, updating, or retrieving SAP data, which makes building integrated solutions simpler.

## Capabilities of Power Platform products

- **Power Apps:** Power Apps is a visual development tool that you use to build custom applications, including mobile apps, with little to no code. It connects to various data sources, including SAP, and runs on any device. Use Power Apps to create forms, dashboards, and interactive applications that streamline business processes.
- **Power Automate (Cloud Flows):** Power Automate is a cloud-based automation platform that you use to create workflows that automate repetitive tasks. It provides powerful AI, RPA, and process mining capabilities. By using Power Automate, you can create flows that interact with SAP data, automate data entry, and trigger actions based on specific events.
- **Copilot Studio:** Copilot Studio is a visual design tool for creating a custom chatbot (referred to as an agent) and autonomous agents that complete processes on behalf of a person, team, or organization. You can publish agents to Microsoft Teams, Power Apps, web portals, and public websites. Copilot Studio also integrates with Azure AI services to enable agents to use resources including powerful language models and Azure AI Search.
- **Power Pages:** By using Power Pages, organizations can quickly design, configure, and publish secure, data-driven, and enterprise-grade websites. You can integrate these websites with SAP to provide users with access to SAP data and services through a web interface.

## Templates for a quick start

Microsoft offers enterprise templates for Power Platform, including a [customizable SAP Procurement template](/power-platform/enterprise-templates/finance/sap-procurement/administer/get-started) to accelerate SAP-integrated solution development on Power Platform. The templates provide essential techniques, building blocks, and sample apps and flows for specific use cases.

## Example workflow structure

- **Trigger:** A Power App triggers a Power Automate flow to create a sales order in SAP.
- **Construct JSON:** The flow constructs a JSON payload with the sales order details.
- **Call BAPI:** The flow calls the BAPI *BAPI_SALESORDER_CREATEFROMDAT2* by using the SAP ERP Connector.
- **Parse the flow** Response: The flow parses the JSON response to extract the sales order number.
- **Update App:** Updates the canvas or model-driven app with the sales order number for user reference.

## App-building tips

Here are some tips and resources to help you get started building canvas and model-driven apps that work with SAP.

### Using Power Automate flows with other applications

You can trigger Power Automate flows that integrate with SAP by using custom applications or any software capable of REST integration.

### Error handling

Power Apps displays errors from SAP in red text, similar to SAP. Users can correct data-related errors in Power Apps and resubmit their work to SAP.

### File attachment handling

Power Automate can attach files to objects in SAP by using Generic Object Services (GOS) and ArchiveLink based on your requirements.

### Adding custom fields

You can easily add custom fields to a canvas or model-driven app. Insert fields and use copy and paste in the editor.

### Calling custom function modules

The Power Platform can call custom function modules if they're remote-enabled. However, SAP doesn't support custom function modules if they don't work correctly, as they're considered custom code.

### Handling completely custom processes in SAP

To handle completely custom processes in SAP, use the **Read SAP Table with Parsing** action to read custom database tables. For create and update operations, remote-enable the custom function modules that maintain this data. After you remote-enable these function modules, the SAP connector can call them.

### User requirements for Power Apps

Users don't need to install anything on their PCs. They access all apps through a web browser.

### Deployment time for Power Apps on SAP

Prebuilt Power Apps on SAP can transact against your SAP system immediately. However, you might need to modify these app templates by adding custom fields or SAP-standard fields that the template doesn't include. Typically, you can have something ready for business users to test within a few weeks.

### Building mobile Power Apps on SAP

Power Apps is responsive to mobile devices, and you can also build native apps on the Power Platform.

### Coexistence of Fiori Apps and Power Apps

You can embed Fiori Apps in Power Apps menus, and you can also embed Power Apps in the Fiori launchpad.

### Upgrading from SAP ECC to S/4HANA

Upgrading from SAP ECC to S/4HANA shouldn't break integrations. SAP ensures their published APIs are available in new versions.

Learn more:

- [SAP and Power Platform white paper](https://go.microsoft.com/fwlink/?linkid=2294900)
- [Use a solution to customize](/power-platform/alm/use-solutions-for-your-customizations)
- [Dataverse developer documentation](/power-apps/developer/data-platform/)
- [Pre-populate connection references and environment variables for automated deployments using Power Platform Build Tools](/power-platform/alm/conn-ref-env-variables-build-tools)
- [Manage solutions using PowerShell](/power-platform/alm/powershell-api)
- [Power Automate Cloud flows Best Practices](https://lnkd.in/guhjGaVG)
- [Working with JSON in Power Fx](/power-platform/power-fx/working-with-json)
- [Power Automate Cloud flows White paper](https://lnkd.in/guhjGaVG)
