---
title: Extend cloud flows
description: Extend cloud flows to meet your organization's unique needs. Learn how to extend the cloud flows in your SAP template solutions by adding and mapping new fields to the SAP ERP connector.
author: tverhasselt
ms.author: thoverh
contributors:
  - EllenWehrle
  - jongilman88
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 06/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# How cloud flows are developed and used

Power Apps integrate with SAP through a portfolio of pre-configured cloud flows. By orchestrating a series of transformations and using the [SAP enterprise resource planning (ERP) connector](/connectors/saperp/), these cloud flows greatly simplify the process of integrating data with SAP.

Each SAP object managed from the canvas app is mapped to a series of _search_, _create_, _read_, and _update_ flows. As an example, four cloud flows exist for vendor object:

- **ReadVendor**: Read a single vendor based upon vendor number and key related information.
- **ReadVendorList**: Search for a list of vendors based upon search criteria passed.
- **CreateVendor**: Create a new vendor object with key-related information.
- **UpdateVendor**: Update an existing vendor object and key-related information.

## Extend cloud flows

You can extend cloud flows according to your local business requirements. With the help of your SAP business analyst, you can add and map new fields to the SAP ERP connector and go back and forth to the apps through the JSON payloads.

Creating a new purchase requisition offers a typical transaction scenario between canvas apps, cloud flows, and SAP:

1. The _SAP Requisition Management_ app prepares _JSON_ by using data from the input controls and stored items collections, substituting any null values for empty strings.

   ~~~power-fx
        Set(
           varRequisitionJSON,//Build the requisition JSON
           "{Header: " & JSON(//Build the requisition header JSON
               {
                   PurchaseRequisitionNumber: varRequisition,
                   Vendor: Trim(txtRequisitionDetailsVendor.Text),
                   PurchasingOrganization: cmbRequisitionDetailsPurchasingOrg.Selected.'Value Code',
                   PurchasingGroup: cmbRequisitionDetailsPurchasingGroup.Selected.'Value Code',
                   Currency: cmbRequisitionDetailsCurrency.Selected.'Value Code'
               },
               JSONFormat.IndentFour
           ) & ", items: " & JSON(//Build the requisition items JSON from cached collection
               colRequisitionItems,
               JSONFormat.IndentFour
           ) & "}"
       );    
       Set(
           varRequisitionJSON,
           Substitute(
               varRequisitionJSON,
               "null",
               """"""
           )
       );
   ~~~

1. The app invokes the embedded _CreateRequisition_ flow using the _Run_ function and passing in the previously constructed JSON string.

   ~~~power-fx
           Set(
               varRequisitionReturn,
               CreateRequisition.Run(varRequisitionJSON)
           );
   ~~~

1. The _CreateRequisition_ flow receives the JSON string from the app via the _PowerApps(V2)_ trigger and uses a _Parse JSON_ action to decompose it.
1. _Variables_ are set using the JSON information to allow for easier mapping into the SAP ERP connector calls.
1. Using the [SAP ERP connector](/connectors/saperp/), an SAP session is created, and the business application programming interface (BAPI) calls are made using the parsed requisition JSON information stored in variables.
1. SAP generated errors are assessed and either a successful or error _HTTP Response_ is returned to the canvas app using a JSON payload.
1. The canvas app uses the response information, specifically the _Status_ field, to notify the end user of success or failure and to determine the next processing steps.

~~~power-fx
    Switch(
        varRequisitionReturn.Status,
        "Error",//Raise error messages leaving variables in existing state for user to try again
        Notify(
            Concat(
                varRequisitionReturn.Messages,
                Message,
                " "
            ),
            NotificationType.Error
        ),
        "Success",//Raise success message
        Notify(
            Concat(
                varRequisitionReturn.Messages,
                Message,
                " "
            ),
            NotificationType.Success
    );
 ~~~

More information:

- [Get started with Power Automate](/power-automate/getting-started)
- [Overview of cloud flows](/power-automate/overview-cloud)

### Support multi-language deployments

By default, the [SAP ERP connector](/connectors/saperp/) invokes the user's browser language to interact with SAP so the corresponding SAP language pack must be installed.

However, if you need to support multi-language and global deployments, you can override the user's browser language and default to a certain language. For example, a Power Apps user in Spain who has their browser language set to Spanish may need to interact with an SAP system that only has the English (EN) language pack installed. In this case, pass the two letter _**EN**_ _ISO 639-1_ code as part of the _Language_ property within the SAP connection string to avoid errors.

> [!TIP]
>
> [Configure environment variables](configure-environment-variables.md) as part of your solution management and cloud flow extension strategy to centrally store a language value to pass into various [SAP ERP connector actions](/connectors/saperp/#actions).

More information: [SAP System Property Guidance](/connectors/saperp/#sap-system-property-guidance)

### Error handling

Each flow is designed with a _Try/Catch_ pair of scope operations. Inside the _Try_ operation will be the main SAP connector calls. After each call, the flows check if the SAP ERP connector step had a catastrophic failure or what is also called an _advanced business application programming (ABAP) core dump_. If so, the flows capture the generated error message.

This error message is displayed in the _ErrorTable_ step of the _Catch_ operation, along with all errors generated during that run of the flow.

All erroneous flows are recorded in the _SAP solution template error_ table. Each flow error will show the first error message generated by the flow along with other information.

These errors can be seen in the _SAP Administrator_ app as described in the [Monitor errors](monitor-errors.md) article.

## Next step

[Extend model-driven apps and Dataverse](extend-model-apps-dataverse.md)

### See also

[Get started with the SAP Procurement template](get-started.md)
