---
title: What is the SAP Requisition Management app? (preview)
description: Learn about the SAP Requisition Management app for Microsoft Power Platform.
author: jongilman88
ms.author: jongilman
contributors:
  - EllenWehrle
  - microsoft-george
  - robinsonshields
  - thoverh
  - ryanb58
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: concept
ms.date: 05/02/2023
ms.custom: bap-template
---

# What is the SAP Requisition Management app? (preview)

[This article is prerelease documentation and is subject to change.]

The SAP Requisition Management app allows you to do several functions in SAP quicker and easier than using SAPGui. You can view a requisition, search for a requisition, change an existing requisition, or create a new requisition from scratch.

:::image type="content" source="media/requisition-management/sap-req-app.png" alt-text="Image of the Power Platform Procurement requisition app":::

## View a requisition

There are three options for viewing a requisition. You can select a recent requisition that you have interacted with, if you know the requisition number you can type that in, or you can search for a requisition based on vendor and date range.

## Select a recent requisition

From the _Select recent requisition_ drop down list, you can see a list of previous requisitions that you have interacted with. You can choose one from the list, and it will load the data for that requisition.

## Search for requisition

If you have not interacted with the Requisition, and you don't know the exact number, you can search for a Requisition. Click the funnel icon, shown below in the red box.

This will open the requisition search screen. Here you can search by any individual field or a combination of _Requisition Number_, _Vendor_, and _Date Range_. After entering your desired selection criteria, click the **Search** button and your results will be displayed. Select the requisition you would like to see, and it will be displayed on the requisition overview screen.

## Enter a requisition number

If you know the requisition number of the document you want to view, you can type it in the _Search requisition number_ field.

## Create a requisition

1. Click the **Create** button seen in the red box below.

1. Enter a vendor number.

1. Click on the arrow pointing to the right, next to the vendor number, and the Vendor name will be determined.

1. Select the appropriate Purchasing Organization from the drop-down list.

1. Select the appropriate Purchasing Group from the drop-down list.

## Add a line item to a requisition

1. Click the **+ Add** button at the _Items_ level.

1. View the _New Requisition Item Details_ page.

1. Select your location (plant).

1. If you know your material number, enter it, or you can search by clicking on the filter symbol.

1. If you click on the **Search** filter, the material search page will open.

1. Search by _material number_, _description_, _material type_ or _location_ (_plant_). Click on the **material number**. As an example, pick _PRODUCT2_ and it will populate that data into the new requisition item detail screen.

1. Now we need to enter the quantity and the unit price. The _Unit_ field was pre-populated when we selected this material from the _Material Search_.

1. View the total automatically calculated based on the quantity multiplied by the unit price.

1. Click the **Done** button to add this line item to the requisition.

### Add, cancel, or save the requisition

1. Click **+ Add** to add additional line items.

1. Click the **Cancel** button if you do not want to keep the requisition and everything will be removed.

1. Click the **Save** button when you are finished. When you click **Save**, the requisition data will be saved to SAP and the SAP document number will appear in the top left corner.

## Additional functionality

When you load an existing requisition, you have the ability to edit or convert to purchase order.

- If you click on the **Edit** button, you are able to change values, add additional line items, or delete unwanted line items. To delete an unwanted line item, select the **check box** on the left side of the line, and click the **Delete** button at the top. You can also copy an existing line by selecting it and clicking the **Copy** button.

- If you want to edit a line, click the **Edit** link at the right side of the line under _Details_.

### Additional items functionality

You can sort column headings by ascending or descending order. To sort, click on the **Column Heading**. An _arrow_ will appear to show you the sort order.  

> [!NOTE]
>
> The sort is done as a character string, so numbers may not be in numeric order.

You can also filter items in the _Items_ list. The filter box can be found on the right side of the _Items_ list.

## Field mappings

Field mappings from the requisition screen to the function module.

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