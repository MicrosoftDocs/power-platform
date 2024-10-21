---
title: Power Platform and SAP for Power Platform App Makers
description: As a Power Platform App Maker, you can seamlessly integrate your SAP systems in your Power Platform applications. This guide describe considerations for walks you through setting up the connector so you can start creating flows that work with your SAP environment.
author: edlehman
ms.author: edleh
contributors:
  - EllenWehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 10/21/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---
# Integrating SAP Data with Power Platform Using Microsoft SAP Connectors
Power Platform app makers can leverage Microsoft SAP connectors to build applications that seamlessly integrate data from SAP systems. This integration enables the creation of apps, workflows, and copilots that enhance business processes by utilizing SAP data.
## SAP Connectors Overview
Microsoft provides several connectors to integrate with SAP systems, including the SAP ERP Connector and the SAP OData Connector. These connectors provide the data exchange between Power Platform and SAP, supporting both RFC and HTTP-based connectivity. See [Connect Power Platform and SAP](/power-platform/sap/connect-power-platform-and-SAP.md) for more on selecting which connector to use and setting up the connectors in your environment.
## Using SAP TCodes and BAPIs
SAP Transaction Codes (TCodes) and Business Application Programming Interfaces (BAPIs) are essential for interacting with SAP systems. TCodes are shortcuts to access specific SAP transactions, while BAPIs are standardized programming interfaces that allow external applications to perform complex business operations in SAP. The SAP connectors can be used to call TCodes and BAPIs.
- SAP TCodes: App makers can use TCodes to navigate to specific transactions within SAP. For example, the TCode VA01 is used to create a sales order.
- BAPIs: BAPIs enable app makers to perform operations such as creating, updating, or retrieving data from SAP. For instance, the BAPI BAPI_SALESORDER_CREATEFROMDAT2 allows the creation of sales orders.

## Working with Complex JSON Structures
When calling SAP connectors, app makers often need to handle complex JSON structures. This involves parsing and constructing JSON payloads to interact with SAP APIs effectively.
- Constructing JSON: Power Automate provides actions to construct JSON payloads required by SAP APIs. This involves defining the structure and populating it with the necessary data.
- Parsing JSON: Power Automate also provides actions to parse JSON responses from SAP connectors. This allows app makers to extract specific data elements and use them in subsequent steps.

To learn more about working with JSON structures in Power Automate, refer to [Working with JSON in Power Fx](/power-platform/power-fx/working-with-json) and [Power Automate Cloud flows White paper](https://lnkd.in/guhjGaVG)

## General application flow
1.	Trigger: A Power App triggers a Power Automate flow to create a sales order in SAP.
2.	Construct JSON: The flow constructs a JSON payload with the sales order details.
3.	Call BAPI: The flow calls the BAPI BAPI_SALESORDER_CREATEFROMDAT2 using the SAP ERP Connector.
4.	Parse Response: The flow parses the JSON response to extract the sales order number.
5.	Update App: The Power App is updated with the sales order number for user reference.


