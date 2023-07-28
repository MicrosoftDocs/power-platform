---
title: SAP Vendor Invoice Management app
description: Learn about the Microsoft SAP Vendor Invoice Management app for Power Platform.
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
ms.date: 07/24/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# SAP Vendor Invoice Management app

You can do several functions in SAP more easily and quickly using Microsoft's SAP Vendor Invoice app for Power Platform than using SAP GUI. You can view a recent vendor invoice, approve a vendor invoice for payment, and create an invoice against an existing purchase order.

## View a vendor invoice

You have three options for viewing a vendor invoice:

- Select a recent vendor invoice that you have interacted with.
- Search for a vendor invoice based on vendor, document type, company code, and date range.
- Enter a known vendor invoice number.

### Select a vendor invoice

From the _Select recent vendor invoice_ drop down list, you can see a list of previous vendor invoices that you have interacted with. You can choose one from the list, and it loads the data for that vendor invoice.

### Search for vendor invoice

If you have not interacted with the vendor invoice, and you don't know the exact number, you can search for a vendor invoice. Select the **funnel** icon to open the vendor invoice search screen.

The vendor invoice search screen allows you to search by an individual field or a combination of these fields:

- Vendor
- Document type
- Company code
- Creation date range

Take these steps to perform a search:

1. Enter your selection criteria.
1. Select **Search** to display your results.
1. Select the _vendor invoice_ you want to display on the overview screen.

### Enter a vendor invoice number

If you know the vendor invoice number of the material document you want to view, you can type it in the _Search vendor invoice number_ field.

### Create vendor invoice

1. Select the **Create** button.
1. Enter a _purchase order_ number.
1. Select the **right-pointing arrow** next to the purchase order number to view:

    - Vendor number and name
    - Purchase order items

1. Adjust the _Quantity received_ as needed.
1. Select **Save** to post the vendor invoice.

## Field mappings

The table provides invoice screen to function module field mappings.

### BAPI INCOMINGINVOICE CREATE1 mapping

| Area             | Display Name            | Parameter | Field     | Default       |
|------------------|-------------------------|-----------|------------|---------------|
| Header           |                  | HEADERDATA    | INVOICE_IND |               |
| Header           |                  | HEADERDATA    | DOC_TYPE |               |
| Header           |                  | HEADERDATA    | DOC_DATE |               |
| Header           |                  | HEADERDATA    | PSTNG_DATE |               |
| Header           |                  | HEADERDATA    | COMP_CODE |               |
| Header           |                  | HEADERDATA    | DIFF_INV |               |
| Header           |                  | HEADERDATA    | CURRENCY |               |
| Header           |                  | HEADERDATA    | GROSS_AMOUNT |               |
| Header           |                  | HEADERDATA    | BLINE_DATE |               |
| Header           |                  | HEADERDATA    | PYMT_METH |               |
| Header           |                  | INVOICESTATUS    | RBSTAT | "A"              |
| Line             | Item                    | GOODSMVT_ITEM | PREQ_ITEM  |               |
| Line (Default)   | REL_DATE                | GOODSMVT_ITEM    | REL_DATE   | utcNow() Date |
| Header (Default) | Document Type           | GOODSMVT_CODE    | GM_CODE    | 01            |
