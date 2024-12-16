---
title: Integration assistant for SAP® solutions
description: Learn about Integration assistant for SAP® solutions and how it translates business-oriented goals into actionable SAP NetWeaver tasks.
author: microsoft-dustin
ms.author: dustin.rasener
contributors:
  - hidasa
  - robinsonshields
  - microsoft-george
  - tverhasselt
  - galitskyd
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
  - EllenWehrle
  - MartinPankraz
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 12/11/2024
ms.service: power-platform
ms.subservice: sap
# Customer intent: As an administrator, I want to learn about the Integration assistant for SAP® solutions and how it translates business-oriented goals into actionable SAP NetWeaver tasks.
---
# Integration assistant for SAP® solutions

The Integration assistant for SAP® solutions is an advanced, LLM-based assistant that translates business-oriented goals into actionable SAP NetWeaver tasks. By helping makers to discover SAP BAPIs, RFCs, and table reads needed to achieve their business goals, the agent empowers makers to build tools to retrieve information and execute operations quickly and easily. The combination of AI and the ability to directly interact with your SAP system allows for easy discoverability and rapid iteration and experimentation. Designed for makers and organizations integrating SAP with Power Platform, this tool provides dynamic, installation-specific insights to maximize accuracy when working to integrate the Power Platform with your specific SAP system.

## Not for Production Use
    WARNING: This agent has wide latitude when interacting with SAP systems. It is intended to be used only in a development environment. 

## Create Connections with a read-only user
It is recommended that you connect to SAP using a read-only user designed for the purpose. It is important that the agent have the ability to read everything in your SAP system, but it could be dangerous to allow it to write data. Remote function calls provided by SAP can be very powerful, and the agent may make changes that are unintended if allowed to do so.

## Prerequisites
Before setting up the Integration assistant for SAP® solutions, ensure the following prerequisites are in place:
-	A license for Copilot Studio (for your makers) 
    -	More information: [Get access to Copilot Studio ](https://learn.microsoft.com/microsoft-copilot-studio/requirements-licensing-subscriptions)
    -	If you don't have experience creating agents, see [Quickstart: Create and deploy a Copilot Studio agent](https://learn.microsoft.com/microsoft-copilot-studio/fundamentals-get-started)
-	Copilot Studio message capacity *or* pay as you go plan
-	Completed [Connect Microsoft Power Platform and SAP - Power Platform | Microsoft Learn](https://learn.microsoft.com/power-platform/sap/connect/connect-power-platform-and-sap)


## Capabilities and Functionality
The agent is designed to handle a wide range of business goals by leveraging SAP's NetWeaver capabilities. (remote-enabled function modules). Here are examples of goals it can help your makers achieve:
-	Retrieve customer or vendor information from SAP tables.
-	Create or update sales orders. (the agent may suggest **BAPI_SALESORDER_CREATEFROMDAT2**, for example)
-	Fetch real-time inventory data. (**BAPI_MATERIAL_AVAILABILITY**)
-	Check or export Sales Order statuses (**BAPI_SALESORDER_GETLIST**, **BAPI_SALESORDER_GETSTATUS**, **BAPI_ACC_DOCUMENT_CHECK**)

## Recommended Workflow
1. **Define Business Goal**: Clearly define the business goal you want to achieve with the agent.
2. **Query Agent**: Ask the agent how to achieve your business goal.
3. **Challenge the Agent**: Challenge the agent to test the solution against your SAP system. At this step, the agent may identify errors in the suggested solution. This feedback loop allows you to avoid hallucinations and ensures that your solution will work. **The agent is using the same connector and parameters that you will use.**
4. **Implement Solution**: Implement the solution in Power Automate using the SAP ERP connector. For now, this is a manual process; future versions may automate more of the implementation.

:::image type="content" source="media/usage-screenshot.png" alt-text="Usage example showing copy/paste from agent output to Power Automate designer":::