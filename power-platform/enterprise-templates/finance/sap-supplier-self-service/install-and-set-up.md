---
title: Install and set up the SAP Supplier Self Service template for Power Platform
description: Learn how to install, set up, and deploy the SAP Supplier Self Service template for Microsoft Power Platform.
author: sandhangitmsft
contributor:
  - EllenWehrle
ms.author: sandhan
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 08/05/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
ms.collection: bap-ai-copilot
---

# Install and set up the SAP Supplier Self Service template

Enterprise templates for Power Platform are solutions designed to digitally transform broad, complex business scenarios for specific lines of business or enterprise wide.

The SAP solutions are enterprise-ready and therefore need to be customized, deployed, and managed by a [centralized team](/power-platform/guidance/adoption/delivery-models#centralized) to [maintain governance and security](/power-platform/guidance/adoption/admin-best-practices).

## Prerequisites

Before you install and set up the SAP Supplier Self Service template, you need to ensure that SAP is integrated with Power Platform and that the SAP Procurement template is installed and set up in its own environment.

These links provide SAP integration with Power Platform steps:

- [Review requirements to integrate SAP with Power Platform](sap-procurement/administer/requirements).
- [Set up environments and DLP policies](sap-procurement/administer/set-up-connections).
- [Set up an on-premises data gateway](sap-procurement/administer/set-up-gateway).
- [Configure authentication](sap-procurement/administer/configure-authentication).

These links provide SAP Procurement installation and setup steps:

- [Install and set up the SAP Procurement solution](sap-procurement/administer/install).
- [Configure environment variables](sap-procurement/administer/configure-environment-variables).
- [Set up connections for SAP and Dataverse](sap-procurement/administer/set-up-connections).
- [Set up SAP List of Values](sap-procurement/administer/apply-seed-data#apply-saps-list-of-values).

The SAP List of Values must be populated, otherwise the SAP Procurement and SAP Supplier Self Service solutions will not work properly.

More information:

- [Power Platform adoption best practices](/power-platform/guidance/adoption/methodology)
- [Administer Microsoft Power Platform](/power-platform/admin/admin-documentation)
- [Working with enterprise systems](/power-apps/guidance/planning/enterprise-systems)

## Download and install

This section provides links to the SAP Supplier Self Service solution files and gives the steps to manually import them into the same developer environment that contains the SAP Procurement solutions.

Go to [Templates for Power Platform](https://github.com/microsoft/Templates-for-Power-Platform) on GitHub and download and import the following solutions in this sequence:

1. Import mpa_supplier_self_service_1_0_0_17.zip (version 1.0.0.17)
1. Import SupplierSelfServicePortal_1_0_0_14.zip  (Version 1.0.0.14)

Once you have imported both solutions, select **Publish all customizations**. You will also need to [set up connections for SAP and Dataverse](sap-procurement/administer/set-up-connections). For the connector setup, use an SAP service user account that is supported with the appropriate SAP licenses and permissions.

## Set up the SAP Supplier Self Service solution

Once you have successfully installed the SAP Supplier template, take these steps to set up the SAP Supplier Self Service solution in the same environment as SAP Procurement:

1. Open make.powerpages.microsoft.com to select the appropiate environment.
1. Go to **Inactive** sites.
1. Reactivate Supplier Self Service site.
1. Choose desired URL for the site and wait for the activation phase to complete.

## Activate and configure cloud flow steps

You need to take steps to ensure that flows are turned on and added to the site.

1. Go to Power Automate and open solution **Supplier Self Service** and ensure all the flows are turned on.
1. Go to **maker studio > Setup**.
1. Remove any flows that already appear to be added to the site.
1. Add these Power Automate flows to your Supplier Self Service site:
    1. Power Pages CreateVendorInvoice
    1. Power Pages ReadPurchseOrder
    1. Power Pages ReadPurchaseOrderList
    1. Power Pages Read Vendor
    1. Power Pages Read Vendor Invoice List
    1. Power Pages Update Vendor
1. Restart the Power Pages site.
1. Update the flow URL in each of the custom components on the respective web pages. High-level instructions are provided in the table. Detailed steps with screenshots are available in [in Appendix – I – Page components and Cloud Flow URL detailed setup]().

| Web Page  | Component Inputs  | Cloud Flow URLs  |
|----------------|--------------------------------------|----------------------------------|
| Manage Profile | Enter **Power Pages Read Vendor flow URL** | Select **Edit Custom Component** and update the URL. Make sure to add the partial URL in this format:/_api/cloudflow/v1.0/trigger/xxxxxxxxx-xxxxxx-xxxxxxxx-xxxxxxxxxxxx. Select **Done**  |
| Edit Profile   | Enter **Power Pages Read Vendor flow URL**; Enter **Power Pages Update Vendor flow URL**   | Select **Edit Custom Component** and update the URL. Make sure to add the partial URL in this format: /_api/cloudflow/v1.0/trigger/xxxxxxxxx-xxxxxx-xxxxxxxx-xxxxxxxxxxxx. Select **Done**  |
| Orders         | Enter **Power Pages Read Vendor flow URL**; Enter **Power Pages ReadPurchaseOrderList flow URL**     | Select **Edit Custom Component** and update the URL. Make sure to add the partial URL in this format: /_api/cloudflow/v1.0/trigger/xxxxxxxxx-xxxxxx-xxxxxxxx-xxxxxxxxxxxx. Select **Done**  |
| Invoice        | Enter **Power Pages Read Vendor flow URL**; Enter **Power Pages Read Vendor Invoice List flow URL**   | Select **Edit Custom Component** and update the URL. Make sure to add the partial URL in this format: /_api/cloudflow/v1.0/trigger/xxxxxxxxx-xxxxxx-xxxxxxxx-xxxxxxxxxxxx. Select **Done**  |
| Create         | Enter **Power Pages Read Vendor flow URL**; Enter **Power Pages Read Purchase Order flow URL**; Enter **Power Pages CreateVendorInvoice flow URL** | Select **Edit Custom Component** and update the URL. Make sure to add the partial URL in this format: /_api/cloudflow/v1.0/trigger/xxxxxxxxx-xxxxxx-xxxxxxxx-xxxxxxxxxxxx. Select **Done**  |

