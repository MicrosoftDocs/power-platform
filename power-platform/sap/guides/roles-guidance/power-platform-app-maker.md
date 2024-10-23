---
title: Power Platform and SAP for Power Platform App Makers
description: As a Power Platform App Maker, you can seamlessly integrate your SAP systems in your Power Platform applications. This guide describes key concepts to understand when integrating data from your SAP systems in Power Platform applications.
author: edlehman
ms.author: edleh
contributors:
  - EllenWehrle
  - mhuguet
ms.contributors:
  - reubenk
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 10/21/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---
# Integrating SAP Data with Power Platform for App Makers
Power Platform app makers can leverage Microsoft's Power Platform connectors for SAP to build applications that seamlessly integrate data from SAP systems. This integration enables the creation of apps, workflows, and copilots that enhance business processes by utilizing SAP data.
## SAP Connectors Overview
Microsoft provides several connectors to integrate with SAP systems, including the ERP Connector for SAP and the OData Connector for SAP. These connectors provide the data exchange between Power Platform and SAP, supporting both RFC and HTTP-based connectivity. See [Connect Power Platform and SAP](/power-platform/sap/connect-power-platform-and-SAP.md) for more on selecting which connector to use and setting up the connectors in your environment.
## Using SAP TCodes and BAPIs
SAP Transaction Codes (TCodes) and Business Application Programming Interfaces (BAPIs) are essential for interacting with SAP systems. TCodes are shortcuts to access specific SAP transactions, while BAPIs are standardized programming interfaces that allow external applications to perform complex business operations in SAP. The SAP connectors can be used to call TCodes and BAPIs.
- SAP TCodes: App makers can use TCodes to navigate to specific transactions within SAP. For example, the TCode VA01 is used to create a sales order.
- BAPIs: BAPIs enable app makers to perform operations such as creating, updating, or retrieving data from SAP. For instance, the BAPI BAPI_SALESORDER_CREATEFROMDAT2 allows the creation of sales orders.

## Working with Complex JSON Structures
When calling Power Platform for SAP connectors, app makers often need to handle complex JSON structures. This involves parsing and constructing JSON payloads to interact with SAP APIs effectively.
- Constructing JSON: Power Automate provides actions to construct JSON payloads required by SAP APIs. This involves defining the structure and populating it with the necessary data.
- Parsing JSON: Power Automate also provides actions to parse JSON responses from SAP connectors. This allows app makers to extract specific data elements and use them in subsequent steps.

To learn more about working with JSON structures in Power Automate, refer to [Working with JSON in Power Fx](/power-platform/power-fx/working-with-json) and [Power Automate Cloud flows White paper](https://lnkd.in/guhjGaVG)

## General application flow
1.	Trigger: A Power App triggers a Power Automate flow to create a sales order in SAP.
2.	Construct JSON: The flow constructs a JSON payload with the sales order details.
3.	Call BAPI: The flow calls the BAPI BAPI_SALESORDER_CREATEFROMDAT2 using the SAP ERP Connector.
4.	Parse Response: The flow parses the JSON response to extract the sales order number.
5.	Update App: The Power App is updated with the sales order number for user reference.

## App-building tips
### Handling Data Objects Without SAP APIs

If SAP does not provide an API for a data object, there are several options available:

- iDoc: Use a generic API to synchronously invoke an iDoc for any object type.
- BDC: Utilize a generic API to synchronously process a BDC recording.
- LSMW: Power Automate can create a file that can be dropped on the SAP application server and processed within transaction LSMW.
- Custom Function Module: Create a custom remote-enabled function module in SAP and call it using a Power Automate cloud flow.

### Handling Custom SAP Fields

The approach to handling custom fields in SAP depends on their location:

Appended to SAP-Standard Tables: Use BAPI Extension Structures in Power Automate flows to populate these fields.
Custom SAP Tables: Ensure the function modules updating these tables are remote-enabled to allow the SAP connector to invoke them.

### Diagnosing User Security Errors

To diagnose a user security error, run a trace in transaction ST01 to determine what is missing from the user's security profile. Confirm that the user has the S_RFC authorization object, which is required to execute BAPIs and remote-enabled custom RFCs.