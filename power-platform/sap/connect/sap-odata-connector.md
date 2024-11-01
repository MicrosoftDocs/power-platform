---
title: Get started with the SAP OData connector
description: The SAP OData connector for Power Platform helps you seamlessly integrate your SAP systems with Microsoft Power Platform. Learn how to set up the connector so you can start creating flows that work with your SAP environment.
author: galitskyd
ms.author: dgalitsky
contributors:
  - edlehman
  - EllenWehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 11/01/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: sap
ms.custom: ignite-2024
---

# Get Started with the SAP OData Connector

The [SAP OData Connector](/connectors/sapodata/) is a great tool that helps you connect your SAP systems to the Microsoft Power Platform. It's based on the OData specification, which means it follows certain rules to make everything work smoothly. The SAP OData connector works with the latest version of the OData specification, V4, and is backwards compatible with V3 and V2. This connector can link up with SAP systems like ECC, S/4HANA, SuccessFactors, Concur, and other OData APIs on top of SAP systems. With this connector, you can use the powerful features of SAP in the flexible and user-friendly Power Platform all while keeping your core clean.

## What is OData?

OData stands for Open Data Protocol. It's a standard way to create and use data APIs, which are like doors for different software to communicate. OData makes it easy to perform basic tasks like creating, reading, updating, and deleting data. The SAP OData connector uses these rules to connect effortlessly with SAP systems.

## Ways to Connect

The SAP OData connector offers different ways to access your SAP systems, so you can choose what works best for your needs. Here are the options:

    - **Basic Authentication:** Just use your username and password to connect.
    - **Anonymous Token:** No authentication needed, great for public data.
    - **SSO through Azure API Management (APIM):** Use Azure APIM for secure and easy logins.

> **Note:** If the system you are integrating with is behind a company fire wall the On-premises Data Gateway is required as it serves as a secure way to access secured systems.

## Integration with Power Platform

By using the SAP OData connector with Microsoft Power Platform, you can do a lot. Power Platform includes tools like Power Apps, Power Automate, and Power BI. These tools help you create cool apps, automate tasks, and generate insightful reports. This way, you can combine the strong features of SAP with the easy-to-use Power Platform. With the SAP OData connector, your business processes can be more efficient, scalable, and secure. Following the OData specification ensures everything works well together, making this connector a must-have for any company looking to get the most out of their SAP systems.
