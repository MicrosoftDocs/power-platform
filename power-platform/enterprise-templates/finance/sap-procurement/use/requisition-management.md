---
title: Use the SAP Requisition Management app
description: Learn how you can view, create, edit, and convert SAP requisition data using Microsoft's SAP Requisition Management app for Microsoft Power Platform.
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

# Get started using the SAP Requisition Management app

The SAP Requisition Management app is part of the SAP Procurement solution for Microsoft Power Platform. It allows you to do several functions in SAP quicker and easier than using SAP GUI. You can view and update an existing requisition, create a new requisition, and convert a requisition to a purchase order.

## Watch the demo

Watch the demo to see how you can manage your SAP requisition data using the SAP Requisition Management app.

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RW18CAe]

## View requisition data

You have three options for viewing a requisition:

- Enter a known requisition number.
- Select a recent requisition that you have interacted with.
- Search for a requisition based on vendor and date range.

:::image type="content" source="media/requisition-management/sap-procure-req-ed.png" alt-text="Image of Microsoft's SAP Procurement requisition app for Power Platform.":::

### Enter a requisition number

If you know the requisition number of the document you want to view, you can type it in the *Search requisition number* field.

### Select a recent requisition

You can select a recently viewed requisition from the *Select recent requisition* drop-down list. Choose a requisition from the list to load onto your screen.

### Search for requisition

If you haven't interacted with the requisition, and you don't know the exact number, you can search for a requisition.

1. Select the **funnel icon** to open the *Requisition search* screen. On the screen, you can search by any individual field or a combination of *Requisition Number*, *Vendor*, and *Date Range*.

   :::image type="content" source="media/requisition-management/req-search.png" alt-text="Image shows requisition search screen.":::

1. Enter your selection criteria in the fields.
1. Select **Search** and your results will be displayed.
1. Select the requisition you would like to display on the requisition overview screen.

## Create a requisition

You can create a new requisition:

1. Select **Create**.

1. Enter a vendor number.

1. Select the **right-pointing arrow** next to the vendor number to see the vendor name.

1. Select the appropriate *Purchasing Organization* from the dropdown list.

1. Select the appropriate *Purchasing Group* from the dropdown list.

## Add a line item to a requisition

1. Select **+ Add** at the *Items* level.

1. View the *New Requisition Item Details* page.

1. Select your *location (plant)*.

1. If you know your material number, enter it, or you can search by selecting the filter symbol.

1. If you select the **Search** filter, the material search page opens.

1. Search by *material number*, *description*, *material type* or *location* (*plant*). Select the **material number**. As an example, pick *PRODUCT2* and it populates that data into the new requisition item detail screen.

1. Enter the quantity and the unit price. The *Unit* field is prepopulated when the material is selected from the *Material Search*.

1. View the total automatically calculated based on the quantity multiplied by the unit price.

1. Select **Done** to add this line item to the requisition.

### Add, cancel, or save the requisition

1. Select **+ Add** to add more line items.

1. Select **Cancel** if you don't want to keep the requisition and everything will be removed.

1. Select **Save** when you're finished. When you select **Save**, the requisition data is saved to SAP, and the SAP document number will appear in the upper left corner.

## Additional functionalities

You can edit, sort, and filter requisition data.

### Edit a requisition

When you load an existing requisition, you have the ability to edit it. You can also convert it to a purchase order.

Select the **Edit** link at the right side of the line under *Details* to edit a requisition. If you select **Edit**, you're able to change values, add more line items, or delete unwanted line items. To delete, select the **check box** to the left of the line item, and select **Delete** at the top. You can also copy an existing line by selecting it and then selecting **Copy**.

### Sort requisition column headings

You can sort column headings by ascending or descending order. To sort, select **Column Heading**. An *arrow* appears to show you the sort order.  

> [!NOTE]
>
> The sort is done as a character string, so numbers may not be in numeric order.

### Filter requisitions

You can filter items in the *Items* list. The filter box is located on the right side of the *Items* list.

## Field mappings

The table provides requisition screen to function module field mappings.

### BAPI_PR_CREATE Mapping

| Area             | Display Name            | Parameter | Field     | Default       |
|------------------|-------------------------|-----------|------------|---------------|
| Header           | Vendor                  | PRITEM    | DES_VENDOR |               |
| Header           | Vendor Name             | PRITEM    |            | Not Sent      |
| Header           | Purchasing Organization | PRITEM    | PURCH_ORG  |               |
| Header           | Purchasing Group        | PRITEM    | PUR_GROUP  |               |
| Line             | Item                    | PRITEM    | PREQ_ITEM  |               |
| Line             | Location                | PRITEM    | PLANT      |               |
| Line             | Material                | PRITEM    | MATERIAL   |               |
| Line             | Description             | PRITEM    | SHORT_TEXT |               |
| Line             | Quantity                | PRITEM    | QUANTITY   |               |
| Line             | Unit                    | PRITEM    | UNIT       |               |
| Line             | Unit Price              | PRITEM    | PREQ_PRICE |               |
| Line (Default)   | REL_DATE                | PRITEM    | REL_DATE   | utcNow() Date |
| Header (Default) | Document Type           | PRITEM    | PR_TYPE    | NB            |

### BAPI_PR_CHANGE Mapping

| Area             | Display Name            | Parameter | Field      | Default                      |
|------------------|-------------------------|-----------|------------|------------------------------|
| Header           | Vendor                  | PRITEM    | DES_VENDOR |                              |
| Header           | Vendor Name             | PRITEM    |            | Not sent                     |
| Header           | Purchasing Organization | PRITEM    | PURCH_ORG  |                              |
| Header           | Purchasing Group        | PRITEM    | PUR_GROUP  |                              |
| Line             | Item                    | PRITEM    | PREQ_ITEM  |                              |
| Line             | Location                | PRITEM    | PLANT      |                              |
| Line             | Material                | PRITEM    | MATERIAL   |                              |
| Line             | Description             | PRITEM    | SHORT_TEXT |                              |
| Line             | Quantity                | PRITEM    | QUANTITY   |                              |
| Line             | Unit                    | PRITEM    | UNIT       |                              |
| Line             | Unit Price              | PRITEM    | PREQ_PRICE |                              |
| Line             | DELETE_IND              | PRITEM    | DELETE_IND | CRUD = D (if row is deleted) |
| Line (Default)   | REL_DATE                | PRITEM    | REL_DATE   | utcNow() Date                |
| Header (Default) | Document Type           | PRHEADER  | PR_TYPE    | NB                           |

## See also

[SAP Vendor Management app](vendor-management.md)
[SAP Purchase Order Management app](purchase-order-management.md)
[SAP Goods Receipt Management app](goods-receipt-management.md)
[SAP Vendor Invoice Management app](vendor-invoice-management.md)
[SAP Vendor Payment management app](payment-management.md)
