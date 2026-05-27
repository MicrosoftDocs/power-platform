---
title: Use Integration assistant for SAP solutions
description: Follow some examples of how to use Integration assistant for SAP solutions to translate business-oriented goals into actionable SAP NetWeaver tasks.
author: microsoft-dustin
ms.author: drasener
contributors:
  - haowusky
  - hidasa
  - tverhasselt
  - galitskyd
  - Wrighttyler
  - EllenWehrle
  - MartinPankraz
ms.reviewer: ellenwehrle
ms.topic: get-started
ms.date: 05/19/2026
ms.service: power-platform
ms.subservice: sap
# Customer intent: As an administrator, I want to learn how to access, install, and set up the Integration assistant for SAP solutions.
---

# Use Integration assistant for SAP solutions

The Integration assistant for SAP solutions is designed to handle a wide range of business goals by leveraging SAP's NetWeaver capabilities, including remote-enabled function modules. Here are examples of goals it can help your makers achieve:

- Retrieve customer or vendor information from SAP tables.
- Create or update sales orders (The agent might suggest **BAPI_SALESORDER_CREATEFROMDAT2**, for example).
- Fetch real-time inventory data (**BAPI_MATERIAL_AVAILABILITY**).
- Check or export sales order statuses (**BAPI_SALESORDER_GETLIST**, **BAPI_SALESORDER_GETSTATUS**, **BAPI_ACC_DOCUMENT_CHECK**).

## Example query and output

Here's an example of a user query and an agent response:

**User Query**: How do I identify purchasing trends in 2024?

**Agent Response**: To identify the purchase order IDs for analyzing purchasing trends in 2024, use the `BAPI_PO_GETLIST` function. This function retrieves a list of purchase orders based on various selection criteria, such as date range, vendor, and purchasing organization.

Function: BAPI_PO_GETLIST
Parameters:

- **DOC_DATE**: Document Date (range, format: YYYYMMDD)
- **PURCHASING_ORG**: Purchasing Organization (string, optional)
- **VENDOR**: Vendor Number (string, optional)
- **MATERIAL**: Material Number (string, optional)
- **PLANT**: Plant (string, optional)

## Example JSON for Power Automate flow

Here's an example JSON for Power Automate flow.

 ```json
 {
   "rfcName": "BAPI_PO_GETLIST",
   "parameters": {
    "DOC_DATE": {
      "SIGN": "I",
      "OPTION": "BT",
       "LOW": "20240101",
       "HIGH": "20241231"
     },
     "PURCHASING_ORG": "1000",
     "VENDOR": "",
     "MATERIAL": "",
     "PLANT": ""
   }
 }
 ```

Explanations:

- **DOC_DATE**: The date range for which you want to retrieve purchase orders. For example, from "20240101" (January 1, 2024) to "20241231" (December 31, 2024).
- **PURCHASING_ORG**: The purchasing organization (optional). You can specify a particular purchasing organization if needed.
- **VENDOR**: The vendor number (optional). You can specify a particular vendor if needed.
- **MATERIAL**: The material number (optional). You can specify a particular material if needed.
- **PLANT**: The plant (optional). You can specify a particular plant if needed.

By using this function, you can retrieve a list of purchase orders created within the specified date range. This list helps you identify the purchase order IDs needed to analyze purchasing trends for the year 2024.

Here are some next steps you can take:

1. Use the `BAPI_PO_GETLIST` function to retrieve the list of purchase orders for 2024.
1. Extract the purchase order IDs from the response.
1. Use the `BAPI_PO_GETDETAIL` function with the extracted purchase order IDs to get detailed information about each purchase order.
1. Analyze the detailed information to identify purchasing trends.

This approach helps you gather the necessary data to analyze purchasing trends effectively. Always keep in mind that AI-generated content might be incorrect.

## Recommended workflow

Here's a recommended workflow for working with an agent:

1. **Define business goal**: Clearly define the business goal you want to achieve with the agent.
1. **Query agent**: Ask the agent how to achieve your business goal.
1. **Challenge the agent**: Challenge the agent to test the solution against your SAP system. At this step, the agent might identify errors in the suggested solution. This feedback loop helps you avoid hallucinations and ensures that your solution works. **The agent uses the same connector and parameters that you use.**
1. **Implement solution**: Implement the solution in Power Automate using the SAP ERP connector. For now, this process is manual; future versions might automate more of the implementation.

:::image type="content" source="media/usage-screenshot.png" alt-text="Usage example showing copy/paste from agent output to Power Automate designer":::

## Optional functionality: Find RFCs

The agent solution includes an action named `Find RFCs` that reads the `TFDIR` table to identify functions that are available in your SAP system. This action can be useful if you're looking for a custom or fringe-usage RFC to use in your flows. However, the agent tends to overweight the results from this function, which means that it might pass over more common functions and suggest functions that are a poor fit for your use case.
