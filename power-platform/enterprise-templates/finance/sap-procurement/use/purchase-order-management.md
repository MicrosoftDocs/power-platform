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
  - shanep
ms.reviewer: ellenwehrle
ms.topic: conceptual
ms.date: 1/8/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Get started using the SAP Purchase Order Management app

The SAP Purchase Order Management app is part of the SAP Procurement solution for Microsoft Power Platform. It allows you to do several functions in SAP quicker and easier than using SAP GUI. You can search for, view, and change an existing purchase order (PO), or create a new PO.


## View a purchase order

You have three options for viewing a purchase order:

- Enter a known PO order number.
- Select a recent PO that you have interacted with.
- Search for a purchase order based on vendor and date range.

:::image type="content" source="media/purchase-order-management/sap-procure-po-ed.png" alt-text="Image of the Power Platform Procurement purchase order app.":::

### Enter a purchase order number

If you know the purchase order number, you can enter it in the _Search Purchase Orders_ field and select **Search**.

### Select a recent purchase order

You can select a recently viewed PO from the _Recently Searched Purchase Orders_ list. Select a _purchase order_ from the list to load onto your screen.

### Search for a purchase order

If you haven't interacted with the purchase order, and you don't know the exact number, you can search for a PO.

1. Select **Search Purchase Orders** to open the purchase order search screen. On the screen, you can search by entering information in either the _Order number_, _Vendor Number_, or _Created from/Created to_ field or any combination of the fields.

   :::image type="content" source="media/purchase-order-management/search-po.png" alt-text="The purchase order search screen.":::

1. Enter your selection criteria in the fields.
1. Select **Search** to display your results.
1. Select the _PO_ from the search results you would like to see displayed.

## Create a purchase order

You can create a new purchase order:

1. Select **New Purchase Order**.

1. Enter a _vendor number_.

1. Select **Search** next to the vendor number to determine the vendor name.

1. Select the appropriate _purchasing organization_ from the drop-down list.

1. Select the appropriate _purchasing group_ from the drop-down list.

1. Select the appropriate _location_ from the drop-down list.

1. Select the appropriate _currency_ from the drop-down list.

1. Optionally provide header text.

1. Select **Next**.

## Add line items to a purchase order

1. Select your _location_ (plant).

1. Specify a material number. You can do this in one of two ways:

    - Enter a known _material number_.
    - Search for a material. Select **Go to advanced search** to open the material search page so you can search by _material number_, _description_, _material type_, or _location (plant)_.

1. Specify the _Quantity_ and _Unit price_.

1. Select **Add Line Item**

1. Continue to add additional line items until complete.


## Review and Submit Purchase Order

1. Select **Next** after adding all line items.

1. Review the Purchase Order details and select **Submit**.

## Additional functionality

When you load an existing purchase order, you have the ability to edit or approve it.

### Edit a purchase order

If you select **Edit Purchase Order**, you're able to:

- Change values
- Add line items
- Delete unwanted line items. To delete an unwanted line item, select a line item and then select **Delete**. You can also copy an existing line item by selecting it and selecting **Copy**.

- If you want to edit a line item, select the line item and then select **Edit**.

### Additional items functionality

- You can sort column headings by ascending or descending order. To sort, select **Column Heading** and choose a sort order.

  > [!NOTE]
  >
  > The sort is done as a character string, so numbers may not be in numeric order.

- You can edit the column width of columns in the _Items_ list. Select **Column Heading** and then select **Column Width** in the drop-down list. Specify the width.
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
| Header    | Purchasing Organization | POHEADER  |  PURCH_ORG  |   |
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

### See also

- [SAP Vendor Management app](vendor-management.md)
- [SAP Requisition Management app](requisition-management.md)
- [SAP Goods Receipt Management app](goods-receipt-management.md)
- [SAP Vendor Invoice Management app](vendor-invoice-management.md)
- [SAP Vendor Payment management app](payment-management.md)
