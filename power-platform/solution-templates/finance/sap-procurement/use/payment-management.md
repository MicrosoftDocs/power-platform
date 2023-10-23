---
title: Use the SAP Vendor Payment management app
description: Get started using Microsoft's SAP Vendor Payment Management app for Power Platform.
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
ms.date: 08/14/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Get started using the SAP Vendor Payment management app

The SAP Vendor Payment Management app is part of the SAP Procurement solution for Microsoft Power Platform. It allows you to search for and view a vendor payment quickly and easily.

## View a vendor payment
  
You have three options for viewing a vendor payment:

- Enter a known vendor payment number.
- Select a vendor payment that you have interacted with.
- Search for a vendor payment based on vendor and date range.

### Enter a vendor payment number
  
If you know the vendor payment number of the document you want to view, you can type it in the _Search vendor payment number_ field.

### Select a vendor payment
  
You can select a recently viewed vendor payment from the _Select recent vendor payment_ drop-down list. Choose a vendor from the list to load the data for that vendor payment.
  
:::image type="content" source="media/payments/sap-procure-payments-ed.png" alt-text="Image of the Microsoft's SAP Procurement payment app for Power Platform.":::
  
### Search for vendor payment
  
If you haven't interacted with the vendor payment, and you don't know the exact number, you can search for a vendor payment. Select the **funnel** to open the vendor payment search screen.

The vendor payment search screen allows you to search by any individual field or a combination of _Vendor_ and _Due date range_.

1. Enter your selection criteria.
1. Select **Search** to display your results.
1. Select the _vendor payment_ you would like to display on the vendor payment overview screen.

## Field mappings

The table provides payment screen to function module field mappings.

### Vendor Payment Mapping

|     Area                    |     Table               |     Field             |     Display Name            |     Default value |
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
|     Header               |     BSEG                |     AUGBL/ZLSPR             |     Status            |     'Blocked', 'To Be Paid', 'Paid'
|     Header               |     BKPF                |     AWKEY             |     VendorInvoice            |     |
|     Item                    |     BSEG                |     BUZEI             |     Item            |          |
|     Item                    |     BSEG                |     SHKZG             |     Type            |          |
|     Item                    |     BSEG                |     HKONT             |     GlAccountRaw            |          |
|     Item                    |     BSEG                |     DMBTR             |     Amount            |          |
|     Item                    |     BSEG                |                  |     CrudType            |     R
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

## See also

[SAP Vendor Management app](vendor-management.md)
[SAP Requisition Management app](requisition-management.md)
[SAP Purchase Order Management app](purchase-order-management.md)
[SAP Goods Receipt Management app](goods-receipt-management.md)
[SAP Vendor Invoice Management app](vendor-invoice-management.md)
