---
title: What is the SAP Supplier Self Service template for Power Platform?
description: Learn about the SAP Supplier Self Service template for Microsoft Power Platform.
author: sandhangitms
contributor:
  - EllenWehrle
ms.author: sandhan
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 06/27/2025
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
ms.collection: bap-ai-copilot
---

# What is Microsoft Power Platform SAP Supplier Self Service template?

The SAP Supplier Self Service template introduces a customizable Power Pages site to complement the [SAP Procurement](/power-platform/enterprise-templates/finance/sap-procurement/overview) template. It leverages the same architecture as the SAP Procurement template utilizing Power Automate cloud flows and the SAP ERP connector for integration.

:::image type="content" source="media/overview/sap-ss-site.png" alt-text="Screenshot of the Supplier Self-Service site.":::

The SAP Supplier Self Service solution improves your procurement operations. It offers a streamlined self-service site for your suppliers and vendors to create and update business records related to to Vendors, Orders, and Invoices in your SAP system, and the option to set up a copilot chat bot to assist users.

## The SAP Supplier Self Service components

The template's components are ready for you to extend and customize to meet your organization's unique needs. The template consists of two solutions:

- **SAP Supplier Self Service** contains tables, cloud flows, chatbot definitions and customizations
- **Supplier Self Service Portal** contains the Power Pages supplier website and its components

You can learn more about the SAP Supplier Self Service template solutions on the [Templates for Power Platform](https://github.com/microsoft/Templates-for-Power-Platform) GitHub site.

The SAP Supplier Self Service template's solutions work with the SAP Procurement template. It's important that SAP integration with Power Platform is complete and the SAP Procurement template is set up before adding the SAP Supplier Self Service solution. The [Install and set up](install-and-set-up.md) article reviews the prerequisite steps in more detail.

## License information for third-party libraries

The template uses third-party libraries to show data in forms and lists from cloud flows. Please ensure you review and agree to the terms of use for these licenses:

- [**Form.io** License information](https://github.com/formio/formio.js/blob/4.19.x/LICENSE.txt)
- [**Data tables** License information](https://datatables.net/license/mit)
