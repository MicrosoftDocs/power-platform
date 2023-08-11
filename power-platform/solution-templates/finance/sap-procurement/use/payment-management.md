---
title: SAP Vendor Payment management app
description: Learn about Microsoft's SAP Vendor Payment Management app for Power Platform.
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
ms.date: 08/11/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# SAP Vendor Payment management app

The SAP Vendor Payment Management application allows you to search for and view a Vendor Payment quickly and easily.

## View a vendor payment 
  
There are three options for viewing a vendor payment. You can select a recent vendor payment that you have interacted with, if you know the vendor payment number you can type that in, or you can search for a vendor payment based on vendor and date range. 
  
## Select a vendor payment 
  
From the _Select recent vendor payment_ drop-down list, you can see a list of previous vendor payments that you have interacted with. You can choose one from the list, and it loads the data for that vendor payment. 
  
:::image type="content" source="media/payments/sap-procure-payments-ed.png" alt-text="Image of the Microsoft's SAP Procurement payment app for Power Platform.":::
  
## Search for vendor payment 
  
If you haven't interacted with the vendor payment, and you don't know the exact number, you can search for a vendor payment. Select the funnel icon. 
    
This opens the vendor payment search screen. Here you can search by any individual field or a combination of _Vendor_ and _Due date range_. After entering your desired selection criteria, select the **Search** button and your results will be displayed. Select the vendor payment you would like to see, and it will be displayed on the vendor payment overview screen. 
  
## Enter a vendor payment number 
  
If you know the vendor payment number of the document you want to view, you can type it in the _Search vendor payment number_ field. 
    
Field Mappings from Payment Screen to Function Module. 
    
### Vendor Payment Mapping 
 
| 	Area                    | 	Table               | 	Field	         | 	Display Name	        | 	Default value |
| - | - | - | - | - |
| 	Header               | 	BKPF                | 	BELNR	         | 	Payment	        | 	|
| 	Header               | 	BKPF                | 	BUKRS	         | 	CompanyCode	        | 	|
| 	Header               | 	BKPF                | 	GJAHR	         | 	FiscalYear	        | 	|
| 	Header               | 	BKPF                | 	AWKEY	         | 	ObjectKey	        | 	|
| 	Header               | 	BKPF                | 	BLART	         | 	DocumentType	        |  | 	
| 	Header               | 	BKPF                | 	BKTXT	         | 	HeaderText	        | 	|
| 	Header               | 	BKPF                | 	XBLNR	         | 	ReferenceNumber	        | | 	
| 	Header               | 	BKPF                | 	USNAM	         | 	CreatedBy	        | 	 |
| 	Header               | 	BKPF                | 	BUDAT	         | 	PostingDate	        | 	|
| 	Header               | 	BKPF                | 	BLDAT	         | 	DocumentDate	        |  	|	
| 	Header               | 	BKPF                | 	WAERS	         | 	Currency	        | 	 	|
| 	Header               | 	LFA1                | 	NAME1	         | 	VendorName	        | 	 	|
| 	Header               | 	BSEG                | 	LIFNR	         | 	Vendor	        | 	 	|
| 	Header               | 	BSEG                | 	AUGBL/ZLSPR	         | 	Status	        | 	'Blocked', 'To Be Paid', 'Paid'
| 	Header               | 	BKPF                | 	AWKEY	         | 	VendorInvoice	        | 	| 	
| 	Item                    | 	BSEG                | 	BUZEI	         | 	Item	        | 	 	|
| 	Item                    | 	BSEG                | 	SHKZG	         | 	Type	        | 	 	|
| 	Item                    | 	BSEG                | 	HKONT	         | 	GlAccountRaw	        | 	 	|
| 	Item                    | 	BSEG                | 	DMBTR	         | 	Amount	        | 	 	|
| 	Item                    | 	BSEG                | 		         | 	CrudType	        | 	R
| 	Item                    | 	BSEG                | 	HKONT	         | 	GlAccount	        | 	 	|
| 	Item                    | 	BSEG                | 	LIFNR	         | 	Vendor	        | 	 	|
| 	Item                    | 	BSEG                | 	AUGBL	         | 	Payment	        | 	 	|
| 	Item                    | 	BSEG                | 	AUGBL	         | 	Status	        | 	 	|
| 	Item                    | 	BSEG                | 	AUGDT	         | 	ClearingDate	        | 	| 	
| 	Item                    | 	BSEG                | 	KOSTL	         | 	CostCenter	        | 	 	|
| 	Item                    | 	BSEG                | 	ZTERM	         | 	TermsOfPaymentKey	        | 	| 	
| 	Item                    | 	BSEG                | 	ZFBDT	         | 	BaselineDate	        | 	 	|
| 	Item                    | 	BSEG                | 	ZLSCH	         | 	PaymentMethod	        | 	 	|
| 	Item                    | 	BSEG                | 	EBELN	         | 	PurchaseOrder	        | 	 	|
| 	Item                    | 	BSEG                | 	EBELP	         | 	PurchaseOrderLine	        |  	|	
| 	Item                    | 	BSEG                | 	GJAHR	         | 	FiscalYear	        | 	 	|
| 	Item                    | 	BSEG                | 	BUKRS	         | 	CompanyCode	        | 	 	|
| 	GL Account	             | 	SKAT	          | 	SAKNR            | 	Description	        | 	 	|
| 	GL Account	             | 	SKAT	          | 	TXT50             | 	GlAccount	        | 	 	|
  


