---
title: Use the SAP Vendor Invoice Management app
description: Work with vendor invoices in SAP using the SAP Vendor Invoice Management app for Microsoft Power Platform.
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

# Get started using the SAP Vendor Invoice Management app

The SAP Vendor Invoice Management app is part of the SAP Procurement solution for Microsoft Power Platform. It enables you to perform several functions in SAP more easily than with the SAP GUI. You can view a recent vendor invoice, approve a vendor invoice for payment, and create an invoice against an existing purchase order.

:::image type="content" source="media/invoices/sap-procure-invoices-ed.png" alt-text="Screenshot of Microsoft's SAP Procurement purchase order app for Power Platform.":::

## View a vendor invoice

You have three options for viewing a vendor invoice:

- Select a recent vendor invoice.
- Search for a vendor invoice based on vendor, document type, company code, and date range.
- Enter a known vendor invoice number.

### Select a vendor invoice

Select a recently viewed vendor invoice from *Recent Vendor Invoices* list to load onto the screen.

### Search for vendor invoice

If you haven't interacted with the vendor invoice and don't know the exact number, you can search for it by selecting **Search Vendor Invoices** to open the vendor invoice search screen.

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

If you know the vendor invoice number of the material document you want to view, you can type it in the _Search Vendor Invoices_ field.

### Create vendor invoice

1. Select the **New Vendor Invoice** button.
1. Enter a _purchase order_ number and select the **Search** button.
1. Select a _Payment Method_ from the drop-down list and select **Next**.
1. Review the line items and adjust as needed. To make changes to a line item, select the line item row and then select **Edit**. Make the appropriate changes and select **Update**.
1. Select **Next** when all invoice line items are correct.
1. Review the invoice and select **Submit** if everything is correct.

## Field mappings

The table provides an invoice screen to function module field mappings.

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

### See also

- [SAP Vendor Management app](vendor-management.md)
- [SAP Requisition Management app](requisition-management.md)
- [SAP Purchase Order Management app](purchase-order-management.md)
- [SAP Goods Receipt Management app](goods-receipt-management.md)
- [SAP Vendor Payment management app](payment-management.md)
