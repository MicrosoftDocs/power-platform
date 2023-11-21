---
title: Manage the Hardware Request and Management template for Power Platform
description: Learn how to manage the Hardware Request and Management template for Microsoft Power Platform.
author: microsoft-george
ms.author: georgenewton
contributors:
  - tverhasselt
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 11/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Get started managing hardware assets and requests

Before requests can be processed and assets can be managed, certain configuration and migration steps must be completed.

As an administrator or program manager, you need to complete set up in the Hardware Request and Management Admin model-driven app for these components:

- Business groups
- Budgets
- Product types
- Product sub-types
- Product (catalog)
- Assets

   :::image type="content" source="media/manage/hrm-manage-grps.png" alt-text="Screenshot of the Hardware Management model-driven app.":::

## Administrate business groups

A Business group record represents a department within your organization that has its own:

- hardware purchasing budget
- business approvers for hardware requests
- administrators of the department's assets

Before requests for hardware can be made, at least one business group must be configured.  To do this:

1. Select **+ New** from the *Business Groups* gallery
1. From the *General* tab, add the *Group Name* of the new business group
    1. If the group is made up of a single user
        1. set *Use Approver Team* to **No**
        1. select the user as the *primary approver*
    1. If instead, the group is to be comprised of a team
        1. set *Use Approver Team* to **Yes*
        1. select the team as the *Approver Team*

Existing business groups can be viewed or edited.  The business group name is in hypertext. Click the link to the view details.  As the business group is designated in budgets, requests, purchase orders and assets, those assignments will be viewable in two places:

- tables on the "General" tab (status "Active" only)
- dedicated tabs: "Budgets", "Requests", "Purchase Orders", "Assets" (with an expanded set of fields and status filter)

## Administrate Budgets

Logging the budget established by the organization allows the app to track cumulative spending and gives visibility to ensures asset purchasing is done within the corporate limits. After the Business Groups are configured, Budgets can be added.

1. Select **plus (+)** up in the Budgets gallery
1. From the general tab, add:
    1. the name of the budget
    1. the dollar amount
    1. assignment of a business group
    1. currency

Existing budgets can be viewed or edited. The budget name is in hypertext. Select the link to view details.  As orders are placed against a budget, the list of purchase orders is expanded and the *Spending Summary* is updated.

For a more detailed view, select **Purchase Orders**.

## Configure and administrate products

Configure Product type, product sub-type, and product classifications to establish and streamline the request process.

### Product types

Product types are the highest level of classification for the products in the catalog. Product types simplify the request process and improve reporting capabilities for administrators.

Before products are loaded to the catalog, the list of product types must be configured.  To do this:

1. Select **plus (+)** up in the Products subtype gallery
1. From the general tab, add:
    1. the name of the product type
    1. an image (if available)

Existing product types can be viewed or edited. The product type name is in hypertext and links to the detail view. As products are assigned a product type, they are added to the list in this *Products* tab view for that product type.

### Product sub-types

The product subtype allows an additional level of product classification within the catalog. The product subtype helps requestors in locating products and gives administrators more specificity in their reporting and analysis.

To add subtypes:

1. Select **plus (+)** up in the Product subtypes gallery
1. From the General tab, give:
    1. a name to the subtype
    1. an assignment to its parent product type. For example, subtype *tablet* could be added to the *computers* product type

Existing product subtypes can be viewed or edited. The product subtype name is in hypertext and links to the detail view. As products are assigned a product subtype, they are added to the list in this *Products* tab view for that product subtype.

### Products

Once product type and subtype are configured, products can be added to the catalog. The list of products in the catalog is used for both products being requested and for any assets being managed within the administrative app.

The following fields are mandatory:

- Name
- Product Type
- Product Subtype

Optional fields include:

- Description
- Several manufacturer details (Name, Part Number, Model Number, Product Details Link)
- Pricing (Default Price and Currency)
- Image (product image can be uploaded from the administrator's files and attached to the product record)
- Refresh Term (months) (informs asset owner and administrator when an asset can be replaced, according to policy)

> [!TIP]
>
> For the initial migration of the product catalog, it may be best to use the *Excel online* capability. From the menu bar, select **Export to Excel** and then **Open in Excel Online**. Data can be pasted in from an existing workbook and saved, as long as the field layout matches. Alternatively, if the source file is in .csv format, it can be imported using the *Import from Excel* menu option.

You can view or edit existing products. The product name is in *hypertext* and it links to a detailed view of the product. As products are designated as assets or assigned to requests, they are added to the list in this *Assets* and *Request Items* tabs view for that product.

## Migrate existing assets

An important part of the setup is the initial migration of existing assets.  We assume that these apps are replacing the current system of hardware requests and asset management.  From that system (or data source), the asset data needs to be extracted.  While practical only for a small dataset, the data can be migrated manually.

1. Select **plus (+)** from the *Assets* gallery
1. Complete the record from the General tab

The following fields are mandatory:

- Product (can be selected from the dropdown menu, with values populated from the catalog)
- Asset Status (Assigned, Unassigned, Retired, Refresh Eligible)
- Business Group (the group within the organization that the asset belongs to)

Optional fields include:

- Delivered On
- Refresh Eligible On (Date)
- Refresh Eligible Notification Sent On
- Retired On
- Hardware Request
- Purchase Order

System-determined fields include:

- Asset Number
- Months Until Refresh
- Created By
- Created On

> [!TIP]
>
> For the initial migration of existing assets, it may be best to use the *Excel online* capability. From the menu bar, select **Export to Excel** and then **Open in Excel Online**. Data can be pasted in from an existing workbook and saved, as long as the field layout matches. Alternatively, if the source file is in .csv format, it can be imported using the *Import from Excel* menu option.

You can view or edit existing assets. The asset name is in *hypertext* and links to the detailed view.
