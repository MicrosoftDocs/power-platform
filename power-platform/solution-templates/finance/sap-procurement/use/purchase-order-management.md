---
title: SAP Purchase Order Management app
description: Learn about the SAP Purchase Order Management app for Microsoft Power Platform.
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
ms.topic: concept
ms.date: 06/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# SAP Purchase Order Management app

The SAP Purchase Order Management app allows you to do several functions in SAP quicker and easier than using SAPGui. You can search for, view, and change an existing purchase order (PO), or create a new PO.

:::image type="content" source="media/purchase-order-management/sap-po-app.png" alt-text="Image of the Power Platform Procurement purchase order app.":::

## View purchase order data

You have three options for viewing a purchase order:

- Select a recent PO that you have interacted with.
- Type in the PO order number, if you know it.
- Search for a purchase order based on vendor and date range.

### Select a recent purchase order

From the _Select recent purchase order_ dropdown list, you can see a list of previous orders that you've interacted with. You can choose one from the list, and it will load the PO data.

### Enter a purchase order number

If you know the number of the purchase order you want to view, you can type it in the _Search purchase order number_ field.

### Search for purchase order

If you haven't interacted with the purchase order, and you don't know the exact number, you can search for a PO.

1. Select the **funnel icon** to open the purchase order search screen. On the screen, you can search by any individual field or a combination of _Purchase Order Number_, _Vendor_, and _Date Range_.

   :::image type="content" source="media/purchase-order-management/search-po.png" alt-text="The purchase order search screen.":::

1. Enter your selection criteria in the fields.
1. Select **Search** to display your results.
1. Select the PO you would like to see displayed on the PO overview screen.

## Enter the purchase order number

If you know the number of the purchase order you want to view, you can type it in the _Search purchase order number_ field.

## Create a purchase order

You can create a new purchase order:

1. Select **Create**.

1. Enter a vendor number.

1. Select the **arrow** pointing to the right, next to the vendor number, and the vendor name will be determined.

1. Select the appropriate _purchasing organization_ from the dropdown list.

1. Select the appropriate _purchasing group_ from the dropdown list.

1. Select the appropriate _location_ from the dropdown list.

1. Select the appropriate _currency_ from the dropdown list.

## Add a line item to a purchase order

1. Select **+ Add** at the _Items_ level.

1. View the _New Purchase Order Item Details_ page.

1. Select your location (plant).

1. If you know your material number, enter it, or you can search by selecting on the filter symbol.

1. If you select the **Search** filter, the material search page will open.

1. Search by _material number_, _description_, _material type_ or _location_ (_plant_). Here is an example of a partial material number search within a location. To select a material, select the **material number**. We will pick _PRODUCT2_ for this example, and it will populate that data into the new purchase order item detail screen.

1. Enter the quantity and the unit price. The _Unit_ field was prepopulated when we selected this material from the _Material Search_.

1. View the total automatically calculated based on the quantity multiplied by the unit price.

1. Select **Done** to add this line item to the purchase order.

### Add, cancel, or save the purchase order

- Select **+ Add** for additional line items or select **Cancel** if you don't want to keep the purchase order. Selecting _cancel_ removes everything.

- Select **Save** when you're finished. When you select **Save**, the purchase order data will be saved to SAP and the SAP document number will appear in the upper left corner.

## Additional functionality

When you load an existing purchase order, you have the ability to edit or approve it.

- If you select **Edit**, you're able to change values, add line items, or delete unwanted line items. To delete an unwanted line item, select the **check box** on the left side of the line, and select **Delete** at the top. You can also copy an existing line by selecting it and selecting **Copy**.

- If you want to edit a line, select the **Edit** link at the right side of the line under _Details_.

### Additional items functionality

- You can sort column headings by ascending or descending order. To sort, select **Column Heading**. An _arrow_ will appear to show you the sort order.

  > [!NOTE]
  > The sort is done as a character string, so numbers may not be in numeric order.

- You can also filter items in the Items list. The filter box can be found on the right side of the Items list.

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
