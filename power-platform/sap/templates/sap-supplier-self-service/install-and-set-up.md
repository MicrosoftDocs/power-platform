---
title: Install and set up the SAP Supplier Self Service template for Power Platform
description: Learn how to install, set up, and deploy the SAP Supplier Self Service solution for Microsoft Power Platform.
author: sandhangitms
contributor:
  - EllenWehrle
ms.author: sandhan
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 06/27/2025
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
ms.collection: bap-ai-copilot
---

# Install and set up the SAP Supplier Self Service template

The SAP Supplier Self Service template is a customizable Power Pages site designed to complement the [SAP Procurement](/power-platform/enterprise-templates/finance/sap-procurement/overview) solution.

The SAP solutions are enterprise-ready and require a [centralized team](/power-platform/guidance/adoption/delivery-models#centralized) of administrators and developers to customize, deploy, and manage the solutions to [maintain governance and security](/power-platform/guidance/adoption/admin-best-practices).

## Prerequisites

Before you install and set up the SAP Supplier Self Service template, you need to ensure that SAP is integrated with Power Platform and that the SAP Procurement template is installed and set up in its own environment.

Take these steps to integrate SAP with Power Platform:

- [Review requirements to integrate SAP with Power Platform](/power-platform/enterprise-templates/finance/sap-procurement/administer/requirements).
- [Set up environments and DLP policies](/power-platform/enterprise-templates/finance/sap-procurement/administer/set-up-connections).
- [Set up an on-premises data gateway](/power-platform/enterprise-templates/finance/sap-procurement/administer/set-up-gateway).
- [Configure authentication](/power-platform/enterprise-templates/finance/sap-procurement/administer/configure-authentication).

Take these steps to install and set up the SAP Procurement template:

- [Install and set up the SAP Procurement solution](/power-platform/enterprise-templates/finance/sap-procurement/administer/install).
- [Configure environment variables](/power-platform/enterprise-templates/finance/sap-procurement/administer/configure-environment-variables).
- [Set up connections for SAP and Dataverse](/power-platform/enterprise-templates/finance/sap-procurement/administer/set-up-connections).
- [Set up SAP List of Values](/power-platform/enterprise-templates/finance/sap-procurement/administer/apply-seed-data#apply-saps-list-of-values). The SAP *List of Values* must be populated, otherwise the SAP Procurement and SAP Supplier Self Service solutions will not work properly.
- Enable Javascript (JS) files as attachments in your environment. Follow steps for [**Setting blocked file extensions for attachments**](/dynamics365/customer-service/administer/enable-file-attachments#configure-file-size-limit-and-file-extensions) to ensure Supplier Self Service Portal solutions do not fail during import.

### More information

- [Power Platform adoption best practices](/power-platform/guidance/adoption/methodology)
- [Administer Microsoft Power Platform](/power-platform/admin/admin-documentation)
- [Working with enterprise systems](/power-apps/guidance/planning/enterprise-systems)

## Download and install

This section provides links to the SAP Supplier Self Service solution files and the guidance to manually install them into the same developer environment that contains the SAP Procurement solutions.

You have the option to download either *managed* or *unmanaged* solution files.

Whichever option you choose, be sure to download both **SAP Supplier Self Service** and **SAP Supplier Self Service Portal** solution files and then install **SAP Supplier Self Service** first.

- Managed
  - [mpa_supplier_self_service_managed](https://aka.ms/mpa_supplier_self_service_managed)
  - [SupplierSelfServicePortal_managed](https://aka.ms/SupplierSelfServicePortal_managed)
- Unmanaged
  - [mpa_supplier_self_service_unmanaged](https://aka.ms/mpa_supplier_self_service_unmanaged)
  - [SupplierSelfServicePortal_unmanaged](https://aka.ms/SupplierSelfServicePortal_unmanaged)

Once you install both solutions, select **Publish all customizations**. Be sure to [set up connections for SAP and Dataverse](/power-platform/enterprise-templates/finance/sap-procurement/administer/set-up-connections).

> [!NOTE]
> For the connector setup, use an SAP service-user account that is supported with the appropriate SAP licenses and permissions. All interactions corresponding to the operations done on the supplier website are done under this service-user context.

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the SAP Procurement template.

More information: [Managed and unmanaged solutions](/power-platform/alm/solution-concepts-alm#managed-and-unmanaged-solutions)

## Activate the Supplier Self Service site

Once you have successfully installed the SAP Supplier template, take these steps to set up the SAP Supplier Self Service solution in the same environment as SAP Procurement:

1. Open [Power Pages design studio](https://make.powerpages.microsoft.com) and select the appropriate environment.
1. Go to **Inactive** sites.
1. Reactivate **Supplier Self Service** site.
1. Choose desired URL for the site and wait for the activation phase to complete.

## Activate and configure cloud flow steps

Take these steps to ensure that flows are turned on and added to the site.

1. Go to [**Power Automate**](https://make.powerautomate.com/) and open solution **Supplier Self Service** and ensure all the flows are turned on.
1. Go to [**Power Pages design studio**](/power-pages/configure/design-build-overview) > **Setup**.
    1. Remove any flows that already appear to be added to the site.
    2. Add these Power Automate flows to your *Supplier Self Service* site:
        - **Power Pages CreateVendorInvoice**
        - **Power Pages ReadPurchaseOrder**
        - **Power Pages ReadPurchaseOrderList**
        - **Power Pages Read Vendor**
        - **Power Pages Read Vendor Invoice List**
        - **Power Pages Update Vendor**

1. Go to [**Power Platform admin center**](https://admin.powerplatform.microsoft.com/home) to restart the Power Pages site.
    1. Select **Resources**, and then select **Power Pages sites** to manage your sites.
    1. Select the site and then select **Manage**.
    1. Select **Restart site** from the **Site Actions** menu.
    1. Update the flow URL in each of the custom components on the respective web pages. Refer to the table and examples for more guidance.

Learn more:

- [Reactivate sites](/power-pages/admin/reactivate-website)
- [Add a flow to your site](/power-pages/configure/cloud-flow-integration#add-a-flow-to-your-site)
- [Power Platform admin center site actions](/power-pages/admin/admin-overview#site-actions)
- [Roles required for website administration](/power-pages/admin/admin-roles)

### Component inputs and cloud flow URLs table

Refer to this table for high-level guidance for updating component inputs and cloud flow URLs.

| Web Page  | Component Inputs  | Cloud Flow URLs  |
|----------------|--------------------------------------|----------------------------------|
| Manage Profile | Enter **Power Pages Read Vendor flow URL** | Select **Edit Custom Component** and update the URL. Add the partial URL in this format: `/_api/cloudflow/v1.0/trigger/xxxxxxxxx-xxxxxx-xxxxxxxx-xxxxxxxxxxxx`. Select **Done**  |
| Edit Profile   | Enter **Power Pages Read Vendor flow URL**; Enter **Power Pages Update Vendor flow URL**   | Select **Edit Custom Component** and update the URL. Add the partial URL in this format: `/_api/cloudflow/v1.0/trigger/xxxxxxxxx-xxxxxx-xxxxxxxx-xxxxxxxxxxxx`. Select **Done**  |
| Orders         | Enter **Power Pages Read Vendor flow URL**; Enter **Power Pages ReadPurchaseOrderList flow URL**     | Select **Edit Custom Component** and update the URL. Add the partial URL in this format: `/_api/cloudflow/v1.0/trigger/xxxxxxxxx-xxxxxx-xxxxxxxx-xxxxxxxxxxxx`. Select **Done**  |
| Invoice        | Enter **Power Pages Read Vendor flow URL**; Enter **Power Pages Read Vendor Invoice List flow URL**   | Select **Edit Custom Component** and update the URL. Add the partial URL in this format: `/_api/cloudflow/v1.0/trigger/xxxxxxxxx-xxxxxx-xxxxxxxx-xxxxxxxxxxxx`. Select **Done**  |
| Create         | Enter **Power Pages Read Vendor flow URL**; Enter **Power Pages Read Purchase Order flow URL**; Enter **Power Pages CreateVendorInvoice flow URL** | Select **Edit Custom Component** and update the URL. Add the partial URL in this format: `/_api/cloudflow/v1.0/trigger/xxxxxxxxx-xxxxxx-xxxxxxxx-xxxxxxxxxxxx`. Select **Done**  |

### Page component and cloud flow URL update example

Take these steps to update the *Manage Profile* page:

1. Copy flow URL for **Power Pages Read Vendor**.
1. Go to **Power Pages design studio** > **Pages**.
1. Select **Manage Profile** page.
1. Select **Edit Custom Component** and update the URL. Add the partial URL in this format: `/_api/cloudflow/v1.0/trigger/xxxxxxxxx-xxxxxx-xxxxxxxx-xxxxxxxxxxxx`
1. Select **Done**.
:::image type="content" source="media/install-and-set-up/components-flows-updates.png" alt-text="Screenshot of setting up Suppliers with SAP IDs and the associated users with each Supplier account.":::

## Next step

[Manage the SAP Supplier Self Service solution](manage.md)
