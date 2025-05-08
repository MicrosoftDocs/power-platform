---
title: Use the SAP Goods Receipt Management app
description: Learn how you can search for, view, and post an SAP goods receipt using Microsoft's SAP Goods Receipt Management app for Microsoft Power Platform.
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
ms.topic: get-started
ms.date: 1/8/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Get started using the SAP Goods Receipt Management app

The SAP Goods Receipt Management app is part of the SAP Procurement solution for Microsoft Power Platform. It allows you to do several functions in SAP quicker and easier than using SAP GUI.  You can search for and view an existing goods receipt document and receive goods against a purchase order.

:::image type="content" source="media/goods-receipts/sap-procure-gr-ed.png" alt-text="Image of Microsoft's SAP Procurement purchase order app for Power Platform.":::

## View a goods receipt

You have three options for viewing a goods receipt:

- Enter a known goods receipt number and fiscal year.
- Select a recent goods receipt that you have interacted with.
- Search for a goods receipt based on vendor, purchase order, material, and date range.

### Enter a goods receipt

If you know the goods receipt number of the material document you want to view, you can type it in the _Search goods receipt number_ field, select a _Fiscal Year_ and select **Search**.

### Select a goods receipt

You can select a recently viewed goods receipt from the _Select recent goods receipt_ drop-down list. Choose a _goods receipt_ from the list to load onto your screen.

### Search for a goods receipt

If you haven't interacted with the goods receipt and you don't know the exact number, you can search for a goods receipt. Select the **Search Goods Receipt** button to open the goods receipt search screen.

The goods receipt search screen allows you to search by any individual field or a combination of _Vendor_, _Purchase order_, _Material_ and _Posting date range_.

1. Enter your selection criteria.
1. Select **Search** to display your results.
1. Select the _goods receipt_ you want to display on the overview screen.

## Create a goods receipt

1. Select the **New Goods Receipt** button.
1. Enter a _purchase order number_ and select **Search**.
1. Confirm the retrieved purchase order and select **Next**.
1. Adjust the line items as needed.
    - Select a line item in the list and select **Edit**.
    - Make adjustments and select **Update Line Item**.
1. Select **Next** to reveiw the goods receipt.
1. Select **Submit** to post the goods receipt.

:::image type="content" source="media/goods-receipts/sap-procure-gr-post.png" alt-text="Image of the Review Goods Receipt screen in Microsoft's SAP Procurement purchase order app for Power Platform.":::

## Field mappings

The table provides requisition screen to function module field mappings.

### BAPI_GOODSMVT_CREATE Mapping

| Area             | Display Name            | Parameter | Field     | Default       |
|------------------|-------------------------|-----------|------------|---------------|
| Header           | Posting Date                  | GOODSMVT_HEADER    | PSTNG_DATE |               |
| Header           | Document Date             | GOODSMVT_HEADER    | DOC_DATE           |      |
| Header           | Header Text | GOODSMVT_HEADER    | HEADER_TXT  |               |
| Line             | Purchase Order Item Number | GOODSMVT_ITEM | PO_ITEM |               |
| Line             | Material Number | GOODSMVT_ITEM | MATERIAL |               |
| Line             | Purchase Order Number | GOODSMVT_ITEM | PO_NUMBER |               |
| Line             | Quantity | GOODSMVT_ITEM | ENTRY_QNT |               |
| Line             | Unit Of Measure | GOODSMVT_ITEM | ENTRY_UOM |               |
| Line             | Location | GOODSMVT_ITEM | PLANT |               |
| Line             | Storage Location | GOODSMVT_ITEM    | STGE_LOC |           |
| Line             | Vendor | GOODSMVT_ITEM | VENDOR |               |
| Line (Default)   | "Delivery Completed" Indicator | GOODSMVT_ITEM    | NO_MORE_GR| 'X' |
| Line (Default)   | Movement Type | GOODSMVT_ITEM    | MOVE_TYPE | '101' |
| Line (Default)   | Movement Indicator | GOODSMVT_ITEM    | MVT_IND | 'B' |
| Header (Default) | Goods Movement Code           | GOODSMVT_CODE    | GM_CODE    | 01            |

### See also

- [SAP Vendor Management app](vendor-management.md)
- [SAP Requisition Management app](requisition-management.md)
- [SAP Purchase Order Management app](purchase-order-management.md)
- [SAP Vendor Invoice Management app](vendor-invoice-management.md)
- [SAP Vendor Payment management app](payment-management.md)
