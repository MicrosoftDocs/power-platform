---
title: SAP Goods Receipt Management app
description: Learn about the SAP Goods Receipt Management app for Microsoft Power Platform.
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
ms.date: 07/12/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# SAP Goods Receipt Management app

The SAP Goods Receipt Management application allows you to do several functions in SAP quicker and easier than using SAPGui.  You can search for and view an existing goods receipt document and receive goods against a purchase order.

## View a goods receipt

There are three options for viewing a goods receipt:

- You can select a recent goods receipt that you have interacted with.
- You can search for a goods receipt based on vendor, purchase order, and date range.
- You can enter in the goods receipt number, if known.

### Select a goods receipt

From the _Select recent goods receipt_ drop-down list, you can see a list of previous goods receipts that you have interacted with. You can choose one from the list, and it loads the data for that goods receipt.

### Search for a goods receipt

If you haven't interacted with the goods receipt, and you don't know the exact number, you can search for a goods receipt. Select the **funnel** icon to open the goods receipt search screen.

The goods receipt search screen allows you to search by any individual field or a combination of _Vendor_, _Purchase order_, Movement type_and_Posting date range_.

1. Enter your desired selection criteria.
1. Select the **Search** button to display your results.
1. Select the _goods receipt_ you want to see displayed on the overview screen.

### Enter a goods receipt

If you know the goods receipt number of the material document you want to view, you can type it in the _Search goods receipt number_ field.

## Create goods receipt

1. Select the **Create** button.
1. Enter a _purchase order number_.
1. Select the **right-pointing arrow** next to the purchase order number to view:

    - Vendor number and name
    - Purchase order items
1. Adjust the _Quantity received_ as needed.
1. Select **Save** to post the goods receipt.

## Field Mappings

The field mappings are from requisition screen to function module.

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
