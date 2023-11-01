---
title: Use the SAP Purchase Order Management app
description: Learn how you can search for, view, and edit an existing PO in SAP or create a new PO in SAP using Microsoft's SAP Purchase Order Management app for Microsoft Power Platform.
author: jongilman88
ms.author: jongilman
contributors:
  - EllenWehrle
  - microsoft-george
  - robinsonshields
  - tverhasselt
  - ryanb58
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: conceptual
ms.date: 10/26/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Get started using the SAP Purchase Order Management app

The SAP Purchase Order Management app is part of the SAP Procurement solution for Microsoft Power Platform. It allows you to do several functions in SAP quicker and easier than using SAP GUI. You can search for, view, and change an existing purchase order (PO), or create a new PO.

## Watch the demo

Watch the demo to see how you can manage your SAP PO data using the SAP Purchase Order Management app.

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RW18zOb]

## View a purchase order

You have three options for viewing a purchase order:

- Enter a known PO order number.
- Select a recent PO that you have interacted with.
- Search for a purchase order based on vendor and date range.

:::image type="content" source="media/purchase-order-management/sap-procure-po-ed.png" alt-text="Image of the Power Platform Procurement purchase order app.":::

### Enter a purchase order number

If you know the purchase order number, you can enter it in the _Search purchase order number_ field.

### Select a recent purchase order

You can select a recently viewed PO from the _Select recent purchase order_ drop-down list. Choose a _purchase order_ from the list to load onto your screen.

### Search for a purchase order

If you haven't interacted with the purchase order, and you don't know the exact number, you can search for a PO.

1. Select the **funnel** to open the purchase order search screen. On the screen, you can search by entering information in either the _Order number_, _Vendor_, or _Created from/Created to_ field or any combination of the fields.

   :::image type="content" source="media/purchase-order-management/search-po.png" alt-text="The purchase order search screen.":::

1. Enter your selection criteria in the fields.
1. Select **Search** to display your results.
1. Select the _PO_ you would like to see displayed on the PO overview screen.

## Create a purchase order

You can create a new purchase order:

1. Select **Create**.

1. Enter a _vendor number_.

1. Select the **arrow** next to the vendor number to determine the vendor name.

1. Select the appropriate _purchasing organization_ from the drop-down list.

1. Select the appropriate _purchasing group_ from the drop-down list.

1. Select the appropriate _location_ from the drop-down list.

1. Select the appropriate _currency_ from the drop-down list.

## Add a line item to a purchase order

1. Select **+ Add** at the Items level.

1. View the new purchase order item details page.

1. Select your _location_ (plant).

1. You can add the line item one of two ways:

    - Enter a known _material number_.
    - Search for a material. Select the **filter** symbol to open the material search page so you can search by _material number_, _description_, _material type_, or _location (plant)_.

### Example

Here is an example of a partial material number search within a location.

 1. Select **material number** to search for a material.
 1. Select a _material_ from the drop-down list to populate that data into the new purchase order item detail screen.

 1. Enter the _quantity_ and the _unit price_. Performing the material search and selecting the material prepopulates the Unit field.

 1. View the total automatically calculated based on the quantity multiplied by the unit price.

 1. Select **Done** to add this line item to the purchase order.

### Add, cancel, or save the purchase order

- Select **+ Add** for additional line items or select **Cancel** if you don't want to keep the purchase order. Selecting _cancel_ removes everything.

- Select **Save** when you're finished. When you select _Save_, the purchase order data will be saved to SAP and the SAP document number will appear in the upper left corner.

## Additional functionality

When you load an existing purchase order, you have the ability to edit or approve it.

### Edit a purchase order

If you select **Edit**, you're able to:

- Change values
- Add line items
- Delete unwanted line items. To delete an unwanted line item, select the **check box** on the left side of the line item, and select **Delete**. You can also copy an existing line item by selecting it and selecting **Copy**.

- If you want to edit a line, select the **Edit** link at the right side of the line item under _Details_.

### Additional items functionality

- You can sort column headings by ascending or descending order. To sort, select **Column Heading**. An _arrow_ will appear to show you the sort order.

  > [!NOTE]
  > The sort is done as a character string, so numbers may not be in numeric order.

- You can also filter items in the _Items_ list. The filter box can be found on the right side of the Items list.

## Field mappings

Field mappings from purchase order screen to the function module.

### BAPI_PO_CREATE1 Mapping

| Area             | Display Name            | Parameter | Field     | Default       |
|------------------|-------------------------|-----------|------------|---------------|
| Header           | Vendor                  | POHEADER    | VENDOR |               |
| Header           | Vendor Name             | POHEADER    |            | Not Sent      |
| Header           | Purchasing Organization | POHEADER    | PURCH_ORG  |               |
| Header           | Purchasing Group        | POHEADER    | PUR_GROUP  |               |
| Header           | Currency        | POHEADER    | CURRENCY |               |
| Line             | Item                    | POITEM    | PO_ITEM  |               |
| Line             | Location                | POITEM    | PLANT      |               |
| Line             | Material                | POITEM    | MATERIAL   |               |
| Line             | Description             | POITEM    | SHORT_TEXT |               |
| Line             | Quantity                | POITEM    | QUANTITY   |               |
| Line             | Unit             | POITEM    | PO_UNIT       |               |
| Condition             | Item Number                    | POCOND    | ITM_NUMBER  |               |
| Condition             |Unit Price                   | POCOND    | COND_VALUE  |               |
| Header (Default) | Document Type           | POHEADER    | DOC_TYPE    | NB            |
| Line (Default) | Update Indicator           | POITEM    | INFO_UPD    | X            |
| Condition (Default)             | Condition Type                    | POCOND    | COND_TYPE  | PBXX               |
| Condition (Default)             | Condition Type                    | POCOND    | CHANGE_ID | U               |

### BAPI_PO_CHANGE Mapping

| Area      | Display Name   | Parameter | Field     | Default    |
|-----------|----------------|-----------|---------|-------------|
| Header    | Order Number  |     | PURCHASEORDER |               |
| Header    | Vendor        | POHEADER    | VENDOR |               |
| Header    | Vendor Name   | POHEADER    |            | Not Sent  |
| Header    | Purchasing Organization | POHEADER    PURCH_ORG  |               |
| Header           | Purchasing Group        | POHEADER    | PUR_GROUP  |               |
| Header           | Currency        | POHEADER    | CURRENCY |               |
| Line             | Item                    | POITEM    | PO_ITEM  |               |
| Line             | Location                | POITEM    | PLANT      |               |
| Line             | Material                | POITEM    | MATERIAL   |               |
| Line             | Description             | POITEM    | SHORT_TEXT |               |
| Line             | Quantity                | POITEM    | QUANTITY   |               |
| Line             | Unit                    | POITEM    | PO_UNIT       |               |
| Line             | Crud Type                    | POITEM    | DELETE_IND       |               |
| Schedule Line             | Item                    | POSCHEDULE    | PO_ITEM  |               |
| Schedule Line             | Quantity                    | POSCHEDULE    | QUANTITY   |               |
| Condition             | Item Number                    | POCOND    | ITM_NUMBER  |               |
| Condition             |Unit Price                   | POCOND    | COND_VALUE  |               |
| Header (Default) | Document Type           | POHEADER    | DOC_TYPE    | NB            |
| Line (Default) | Update Indicator           | POITEM    | INFO_UPD    | X            |
| Schedule Line (Default) | Schedule Line           | POSCHEDULE    | SCHED_LINE    | NB            |
| Condition (Default)             | Condition Type                    | POCOND    | COND_TYPE  | PBXX               |
| Condition (Default)             | Condition Type                    | POCOND    | CHANGE_ID | U               |

## See also

[SAP Vendor Management app](vendor-management.md)
[SAP Requisition Management app](requisition-management.md)
[SAP Goods Receipt Management app](goods-receipt-management.md)
[SAP Vendor Invoice Management app](vendor-invoice-management.md)
[SAP Vendor Payment management app](payment-management.md)
