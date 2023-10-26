---
title: Use the SAP Vendor Management app
description: Learn how you can view, update, and create a vendor in SAP using Microsoft's SAP Vendor Management app for Microsoft Power Platform.
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

# Get started using the SAP Vendor Management app

The SAP Vendor Management app is part of the SAP Procurement solution for Microsoft Power Platform. It allows you to do several functions in SAP quicker and easier than using SAP GUI. You can view, update, and create a vendor.

## Watch the demo

 Watch the demo to see how you can manage your SAP vendor data using the SAP Vendor Management app.

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RW18F9g]

## View vendor information

You can load existing vendor information three different ways:

- Select a recent vendor from a dropdown list.
- Search for a vendor.
- Enter a known vendor number.

:::image type="content" source="media/vendor-management/sap-procure-vendors-ed.png" alt-text="Image of Microsoft's SAP Procurement vendor app for Power Platform.":::

### Select a vendor invoice

You can select a recently viewed vendor from the *Select recent vendor* drop-down list. Choose a *vendor* from the list to load that vendor's record onto your screen.

### Search for a vendor

You can search for a vendor using known search criteria.

  1. Select the **funnel** icon to open the vendor search screen.
  1. Enter your search criteria into one or more of the following fields:
      - Vendor name
      - Street
      - City
      - Country
      - State
   :::image type="content" source="media/vendor-management/vendor-search.png" alt-text="Search for a vendor screen.":::
  1. Select **Search** to see your results.
  1. Select the *vendor* you want to view from the list of results.
  1. Select the *vendor number* to load the vendor's information from SAP to your screen.  If the list is too long, you can filter it to narrow the results by typing data from any field into *Filter vendors*.

### Enter a vendor number

You can enter a known vendor number into the *Search vendor number* field and select the **arrow** to retrieve the vendor record from SAP and display the information on your screen.

## Update vendor information

Once an existing vendor record is loaded to the app, making changes is straightforward. Select the **Edit** button to toggle into *Change* mode.

### Edit the header

Header information can be edited directly on the main page.

### Edit purchasing organizations and company codes

1. Select the **Edit** link at the end of a row to edit existing purchasing organization and company code assignments. Each purchasing organization and company code assignment can be edited individually.

1. Select **Done** to return to the main page with the updates or **Cancel** to return with no changes.

1. Select **+ Add** to initiate the creation of a new assignment. Once a row is selected with the checkbox, the *X Delete* button appears. That allows for the assignment to be flagged as deleted in SAP.

> [!NOTE]
>
> Changes won't be finalized in SAP until you select **Save** on the main page.

### Edit phone numbers and email addresses

Phone numbers and email addresses can be maintained in similar fashion to the purchasing organization and company code assignments, with *Edit*, *+ Add*, and *X Delete* options available for each entry.

### Save or cancel

Once the changes are complete, you can select either **Save** or **Cancel**.

- *Save* results in the call of standard functions for *vendor update* in SAP and you'll see the updated vendor record load on to the page from SAP.
- *Cancel* discards all changes and the original vendor data is restored to the state.

## Create a vendor

Creating a vendor is straightforward. Select **+ Create** to start a new vendor record.

### Enter the header information

Header information can be entered directly on the main page.

### Add purchasing organizations and company codes

Select **+ Add** to initiate the assignment of a new purchasing organization.

Each purchasing organization and company code assignment is added individually. Select **Done** to return to the main page with the new assignment or **Cancel** to return with no changes.

### Add phone numbers and email addresses

Phone numbers and email addresses can be added in similar fashion to the purchasing organization and company code assignments, with *Edit*, *+ Add* and *X Delete* options available for each entry.

### Save or cancel changes

Once the changes are complete, you can select either the **Save** or **Cancel** button located at the top of the screen.

- *Save* results in the call of standard functions for *vendor creation* in SAP and you will see the saved vendor record load on to the page from SAP.
- *Cancel* discards all changes and the original data is restored to its initial state.

## Field mappings

The tables provide vendor screen to function module field mappings.

### RFC_READ_TABLE mapping

| Area                    | Table | Field | Description             |
|-------------------------|-------|-------|-------------------------|
| Header                  | LFA1  | LIFNR | Vendor                  |
| Header                  | LFA1  | LAND1 | Country                 |
| Header                  | LFA1  | NAME1 | Vendor name             |
| Header                  | LFA1  | ORTO1 | City                    |
| Header                  | LFA1  | PSTLZ | Postal code             |
| Header                  | LFA1  | STRAS | Street                  |
| Header                  | LFA1  | REGIO | State                   |
| Header                  | LFA1  | KTOKK | Account group           |
| Company                 | LFB1  | AKONT | General ledger account  |
| Company                 | LFB1  | BUKRS | Company code            |
| Company                 | LFB1  | ZTERM | Payment terms           |
| Company                 | LFB1  | ZWELS | Payment method          |
| Purchasing Organization | LFM1  | EKGRP | Purchasing group        |
| Purchasing Organization | LFM1  | EKORG | Purchasing organization |
| Purchasing Organization | LFM1  | WAERS | Currency                |
| Purchasing Organization | LFM1  | ZTERM | Payment terms           |

### BAPI_ADDRESSORG_GETDETAIL mapping

| Structure  | Field      | Label     |
|------------|------------|-----------|
| BAPIADSMTP | E_MAIL     | Email     |
| BAPIADSMTP | STD_NO     | Default   |
| BAPIADSMTP | CONSNUMBER | ID        |
| BAPIADTEL  | COUNTRY    | Country   |
| BAPIADTEL  | TELEPHONE  | Phone     |
| BAPIADTEL  | EXTENSION  | Extension |
| BAPIADTEL  | STD_NO     | Default   |
| BAPIADTEL  | CONSNUMBER | ID        |

### IDOC_INBOUND_SYNCHRONOUS mapping

| Segment | Field | Label                  | Comment               |
|---------|-------|------------------------|-----------------------|
| E1LFA1M | LIFNR | Vendor                 | Blank during *Create* |
| E1LFA1M | KTOKK | AccountGroup           |                       |
| E1LFA1M | LAND1 | Country                |                       |
| E1LFA1M | NAME1 | VendorName             |                       |
| E1LFA1M | ORTO1 | City                   |                       |
| E1LFA1M | PSTLZ | PostalCode             |                       |
| E1LFA1M | REGIO | State                  |                       |
| E1LFA1M | STRAS | Street                 |                       |
| E1LFB1M | MSGFN | CrudType               |                       |
| E1LFB1M | BUKRS | CompanyCode            |                       |
| E1LFB1M | LOEVM | CrudType               | *X* for Delete        |
| E1LFB1M | AKONT | GLAccount              |                       |
| E1LFB1M | ZWELS | PaymentMethods         |                       |
| E1LFB1M | ZTERM | PaymentTerms           |                       |
| E1LFM1M | MSGFN | CrudType               |                       |
| E1LFM1M | EKORG | PurchasingOrganization |                       |
| E1LFM1M | LOEVM | CrudType               | *X* for Delete        |
| E1LFM1M | WAERS | Currency               |                       |
| E1LFM1M | ZTERM | PaymentTerms           |                       |
| E1LFM1M | EKGRP | PurchasingGroup        |                       |

### BAPI_ADDRESSORG_CHANGE mapping

| Structure  | Field      | Label     |
|------------|------------|-----------|
| BAPIADSMTP | E_MAIL     | Email     |
| BAPIADSMTP | STD_NO     | Default   |
| BAPIADSMTP | CONSNUMBER | ID        |
| BAPIADTEL  | COUNTRY    | Country   |
| BAPIADTEL  | TELEPHONE  | Phone     |
| BAPIADTEL  | EXTENSION  | Extension |
| BAPIADTEL  | STD_NO     | Default   |
| BAPIADTEL  | CONSNUMBER | ID        |

## See also

[SAP Vendor Management app](vendor-management.md)
[SAP Requisition Management app](requisition-management.md)
[SAP Purchase Order Management app](purchase-order-management.md)
[SAP Goods Receipt Management app](goods-receipt-management.md)
[SAP Vendor Invoice Management app](vendor-invoice-management.md)
[SAP Vendor Payment management app](payment-management.md)
