---
title: SAP Vendor Management app
description: Learn about the SAP Vendor Management app for Microsoft Power Platform.
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
ms.date: 06/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# SAP Vendor Management app

The SAP Vendor Management app lets you do several SAP functions quicker and easier than using SAPGui. You can search, view, change existing, or create a new vendor.

:::image type="content" source="media/vendor-management/sap-vendors-app.png" alt-text="Image of the Power Platform Procurement vendor app":::

## View vendor data

There are three options for loading an existing vendor.

- Enter the _requisition number_: If you know the vendor number, you can enter it in the _Search vendor number_ field and select the **arrow** to the right. The vendor record will be retrieved from SAP and displayed in the canvas app.

- Select **recent vendor**: If you have recently worked with a vendor record, you can pick it from a list without having to search. Select the **Select recent vendor** dropdown list to see the vendors that you interacted with previously. Choose one vendor from the list to load that vendor record.

- Search for _vendor_: If you haven't interacted with the vendor before, and you don't know the exact number, you can easily search for it.

    1. Select the **funnel icon**. This will open the vendor search screen. Type your search criteria into one or more of the following fields: _Vendor name_, _Street_, _City_, _Country_, or _State_.
    
       :::image type="content" source="media/vendor-management/vendor-search.png" alt-text="Search for a vendor screen.":::
    
    1. Select **Search** to see your results.
    
    1. Select the vendor from the list of results.
    
    1. Select the vendor number to load the vendor from SAP into the main screen. If the list is too long, you can filter it to narrow the results by typing data from any field into _Filter vendors_.

### Change a vendor

Once an existing vendor record is loaded to the app, making changes is straightforward.  Select the **Edit** button to toggle into _Change_ mode.

#### Edit header

Header information can be edited directly on the main page.

#### Edit purchasing organizations and company codes

1. Select the **Edit** link at the end of a row to edit existing Purchasing Organization and Company Code assignments.

1. Each _Purchasing Organization_ and _Company Code_ assignment can be edited individually.  Select **Done** to return to the main page with the updates or **Cancel** to return with no changes.

1. Select the **+ Add** button to initiate the creation of a new assignment.
Once a row is selected with the checkbox, the _X Delete_ button appears, that allows for the assignment to be flagged as deleted in SAP.

> [!NOTE]
>
> Changes will not be finalized in SAP until you Select the **Save** button on the main page.

#### Phone numbers and email addresses

Phone numbers and email addresses can be maintained in similar fashion to the Purchasing Organization and Company Code assignments, with _Edit_, _+ Add_, and _X Delete_ options available for each entry.

#### Save or cancel

Once the changes are completed, the user has the options at the top of the screen to select **Save** or **Cancel**.

Selecting **Save** results in the call of standard functions for vendor update in SAP. The updated vendor record is loaded to the page from SAP.  Selecting **Cancel** discards all changes and the original vendor data is restored to the page.

### Create a vendor

Creating a vendor is straightforward.  Select the **+ Create** button to start a new vendor record.

#### Enter header information

Header information can be entered directly on the main page.

#### Add purchasing organizations and company codes

Select the **+ Add** button to initiate the assignment of a new purchasing organization.

Each purchasing organization and company code assignment is added individually.  Select **Done** to return to the main page with the new assignment or select **Cancel** to return with no changes.

#### Add phone numbers and email addresses

Phone numbers and email addresses can be added in similar fashion to the purchasing organization and company code assignments, with **Edit**, **+ Add** and **X Delete** options available for each entry.

#### Save or cancel changes

Once the changes are completed, the user has the options at the top of the screen to Select **Save** or **Cancel**.

 Selecting **Save** results in the call of standard functions for Vendor creation in SAP.  The saved vendor record is loaded to the page from SAP.  Selecting **Cancel** discards all inputs and the page is restored to its initial state.

## Field mappings

Field mappings from the vendor screen to the function module.

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
| E1LFA1M | LIFNR | Vendor                 | Blank during _Create_ |
| E1LFA1M | KTOKK | AccountGroup           |                       |
| E1LFA1M | LAND1 | Country                |                       |
| E1LFA1M | NAME1 | VendorName             |                       |
| E1LFA1M | ORTO1 | City                   |                       |
| E1LFA1M | PSTLZ | PostalCode             |                       |
| E1LFA1M | REGIO | State                  |                       |
| E1LFA1M | STRAS | Street                 |                       |
| E1LFB1M | MSGFN | CrudType               |                       |
| E1LFB1M | BUKRS | CompanyCode            |                       |
| E1LFB1M | LOEVM | CrudType               | _X_ for Delete        |
| E1LFB1M | AKONT | GLAccount              |                       |
| E1LFB1M | ZWELS | PaymentMethods         |                       |
| E1LFB1M | ZTERM | PaymentTerms           |                       |
| E1LFM1M | MSGFN | CrudType               |                       |
| E1LFM1M | EKORG | PurchasingOrganization |                       |
| E1LFM1M | LOEVM | CrudType               | _X_ for Delete        |
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
