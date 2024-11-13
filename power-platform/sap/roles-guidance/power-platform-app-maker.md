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
ms.date: 11/01/2024
ms.service: power-platform
ms.subservice: sap
ms.custom: ignite-2024
---
# Integrating SAP data with Power Platform for app makers

Power Platform app makers can leverage Microsoft's Power Platform SAP connectors to build applications that seamlessly integrate data from SAP systems. This integration enables the creation of apps, workflows, and copilots that enhance business processes by utilizing SAP data.

## SAP connectors overview

Microsoft provides several connectors to integrate with SAP systems, including the SAP ERP Connector and the SAP OData Connector. These connectors provide the data exchange between Power Platform and SAP, supporting both RFC and HTTP-based connectivity. See [Connect Power Platform and SAP](..//connect/connect-power-platform-and-SAP.md) for more on selecting which connector to use and setting up the connectors in your environment.

## Using SAP RFCs and BAPIs

SAP Remote Function Calls (RFCs) and Business Application Programming Interfaces (BAPIs) are essential for interacting with SAP systems.
SAP RFCs are the foundation that enables communications between SAP and other systems. RFCs must be remote-enabled in SAP to be accessible with the Power Platform SAP connectors. BAPIs are standardized RFCs that allow external applications to perform complex business operations in SAP.

- RFCs: App makers can use RFCs to retrieve specific details from SAP. For example RFC_GET_TABLE_ENTRIES can be used to read contents of a specific table and RFC_GET_FUNCTION_INTERFACE can retrieve the details of a specific function module.
- BAPIs: BAPIs enable app makers to perform operations such as creating, updating, or retrieving data from SAP. For instance, the BAPI BAPI_SALESORDER_CREATEFROMDAT2 allows the creation of sales orders.

Talk to an SAP expert in your organization or ask Microsoft Copilot to find specific RFCs and BAPIs.

## Working with complex JSON structures

When calling Power Platform SAP connectors, app makers often need to handle complex JSON structures. This involves parsing and constructing JSON payloads to interact with SAP APIs effectively.

- Constructing JSON: Power Automate provides actions to construct JSON payloads required by SAP APIs. This involves defining the structure and populating it with the necessary data.
- Parsing JSON: Power Automate also provides actions to parse JSON responses from SAP connectors. This allows app makers to extract specific data elements and use them in subsequent steps.

To learn more about working with JSON structures in Power Automate, refer to [Working with JSON in Power Fx](/power-platform/power-fx/working-with-json) and [Power Automate Cloud flows White paper](https://lnkd.in/guhjGaVG).

## General application flow

1. Trigger: A Power App triggers a Power Automate flow to create a sales order in SAP.
1. Construct JSON: The flow constructs a JSON payload with the sales order details.
1. Call BAPI: The flow calls the BAPI BAPI_SALESORDER_CREATEFROMDAT2 using the SAP ERP Connector.
1. Parse Response: The flow parses the JSON response to extract the sales order number.
1. Update App: The Power App is updated with the sales order number for user reference.

## App-building tips

Here are some tips and resources to help you get started building canvas and model-driven apps that can work with SAP.

### Handling data objects without SAP APIs

If SAP does not provide an API for a data object, there are several options available:

- [Intermediate Document (iDoc):](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/7b24a64d9d0941bda1afa753263d9e39/3854b753128eb44ce10000000a174cb4.html) Use a generic API to synchronously invoke an iDoc for any object type.
- [Batch Input:](https://help.sap.com/doc/saphelp_snc70/7.0/en-US/69/c250274ba111d189750000e8322d00/content.htm?no_cache=true#:%7E:text=Batch%20input%20is%20one%20of%20the%20primary%20ways,legacy%20system%20into%20a%20newly%20installed%20SAP%20system) Utilize a generic API to synchronously process a BDC recording.
- [Legacy System Migration Workbench (LSMW):](https://help.sap.com/doc/saphelp_nw73ehp1/7.31.19/en-US/4d/afeb6ad8f66d57e10000000a42189e/content.htm?no_cache=true) Power Automate can create a file that can be dropped on the SAP application server and processed within transaction LSMW.
- [Custom Function Module:](https://help.sap.com/doc/saphelp_nw75/7.5.5/en-US/c8/19764143b111d1896f0000e8322d00/content.htm?no_cache=true) Create a custom remote-enabled function module in SAP and call it using a Power Automate cloud flow.

### Handling custom SAP fields

The approach to handling custom fields in SAP depends on their location:

- **Appended to SAP-Standard Tables:** Use BAPI Extension Structures in Power Automate flows to populate these fields. Custom fields appended to standard SAP tables are supported if the tables are properly extended according to SAP custom fields standards for the table in the ABAP Dictionary (SAP TCode SE11). For more information, ask an SAP expert in your organization.
- **Custom SAP Tables:** Ensure the function modules updating these tables are remote-enabled to allow the SAP connector to invoke them.

### Diagnosing user security errors

To diagnose a user security error, run a trace in transaction ST01 in the SAP GUI application to determine what is missing from the user's security profile. Confirm that the user has the S_RFC authorization object, which is required to execute BAPIs and remote-enabled custom RFCs.

#### Learn more

- [SAP and Power Platform white paper](https://go.microsoft.com/fwlink/?linkid=2294900)
- [SAP ERP Connector](/connectors/saperp/)
- [SAP OData Connector](/connectors/sapodata/)
