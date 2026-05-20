---
title: Use the SAP Vendor Payment management app
description: Learn how you can search for and view SAP vendor payment data using Microsoft's SAP Vendor Payment Management app for Microsoft Power Platform.
author: microsoft-dustin
ms.author: drasener
contributors:
  - EllenWehrle
  - tverhasselt
  - Wrighttyler
  - shanep
ms.reviewer: ellenwehrle
ms.topic: get-started
ms.date: 05/20/2026
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Get started using the SAP Vendor Payment management app

The SAP Vendor Payment Management app is part of the SAP Procurement solution for Microsoft Power Platform. It helps you quickly and easily search for and view a vendor payment.

## View a vendor payment
  
You have three options for viewing a vendor payment:

- Enter a known vendor payment number.
- Select a vendor payment that you interacted with.
- Search for a vendor payment based on vendor and date range.

### Enter a vendor payment number
  
If you know the vendor payment number of the document you want to view, type it in the _Search vendor payment number_ field and select **Search**. You can also optionally provide company code and fiscal year.

### Select a vendor payment
  
Select a recently viewed vendor payment from the _Recently searched payments_ list. Select a vendor from the list to load the data for that vendor payment.
  
:::image type="content" source="media/payments/sap-procure-payments-ed.png" alt-text="Image of the Microsoft's SAP Procurement payment app for Power Platform.":::
  
### Search for vendor payment
  
If you don't know the exact number and you didn't interact with the vendor payment, you can search for a vendor payment. Select **Search Payments** to open the vendor payment search screen.

The vendor payment search screen allows you to search by any individual field or a combination of _Vendor_ and _Due date range_. If you don't know the Vendor Number, select **Go to advanced search** and search for vendors by name and address.

1. Enter your selection criteria.
1. Select **Search** to display your results.
1. Select the _vendor payment_ you want to display on the vendor payment overview screen.

## Field mappings

The table provides payment screen to function module field mappings.

### Vendor payment mapping

|     Area                    |     Table               |     Field             |     Display name            |     Default value |
| - | - | - | - | - |
|     Header               |     BKPF                |     BELNR             |     Payment            |     |
|     Header               |     BKPF                |     BUKRS             |     CompanyCode            |     |
|     Header               |     BKPF                |     GJAHR             |     FiscalYear            |     |
|     Header               |     BKPF                |     AWKEY             |     ObjectKey            |     |
|     Header               |     BKPF                |     BLART             |     DocumentType            |  |
|     Header               |     BKPF                |     BKTXT             |     HeaderText            |     |
|     Header               |     BKPF                |     XBLNR             |     ReferenceNumber            | |
|     Header               |     BKPF                |     USNAM             |     CreatedBy            |      |
|     Header               |     BKPF                |     BUDAT             |     PostingDate            |     |
|     Header               |     BKPF                |     BLDAT             |     DocumentDate            |      |
|     Header               |     BKPF                |     WAERS             |     Currency            |          |
|     Header               |     LFA1                |     NAME1             |     VendorName            |          |
|     Header               |     BSEG                |     LIFNR             |     Vendor            |          |
|     Header               |     BSEG                |     AUGBL/ZLSPR             |     Status            |     'Blocked', 'To Be Paid', 'Paid'|
|     Header               |     BKPF                |     AWKEY             |     VendorInvoice            |     |
|     Item                    |     BSEG                |     BUZEI             |     Item            |          |
|     Item                    |     BSEG                |     SHKZG             |     Type            |          |
|     Item                    |     BSEG                |     HKONT             |     GlAccountRaw            |          |
|     Item                    |     BSEG                |     DMBTR             |     Amount            |          |
|     Item                    |     BSEG                |                  |     CrudType    |     R |
|     Item                    |     BSEG                |     HKONT             |     GlAccount            |          |
|     Item                    |     BSEG                |     LIFNR             |     Vendor            |          |
|     Item                    |     BSEG                |     AUGBL             |     Payment            |          |
|     Item                    |     BSEG                |     AUGBL             |     Status            |          |
|     Item                    |     BSEG                |     AUGDT             |     ClearingDate            |     |
|     Item                    |     BSEG                |     KOSTL             |     CostCenter            |          |
|     Item                    |     BSEG                |     ZTERM             |     TermsOfPaymentKey            |     |
|     Item                    |     BSEG                |     ZFBDT             |     BaselineDate            |          |
|     Item                    |     BSEG                |     ZLSCH             |     PaymentMethod            |          |
|     Item                    |     BSEG                |     EBELN             |     PurchaseOrder            |          |
|     Item                    |     BSEG                |     EBELP             |     PurchaseOrderLine            |      |
|     Item                    |     BSEG                |     GJAHR             |     FiscalYear            |          |
|     Item                    |     BSEG                |     BUKRS             |     CompanyCode            |          |
|     GL Account                 |     SKAT              |     SAKNR            |     Description            |          |
|     GL Account                 |     SKAT              |     TXT50             |     GlAccount            |          |

### See also

- [SAP Vendor Management app](vendor-management.md)
- [SAP Requisition Management app](requisition-management.md)
- [SAP Purchase Order Management app](purchase-order-management.md)
- [SAP Goods Receipt Management app](goods-receipt-management.md)
- [SAP Vendor Invoice Management app](vendor-invoice-management.md)
