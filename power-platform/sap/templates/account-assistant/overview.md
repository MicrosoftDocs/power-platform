---
title: Account assistant for SAP solutions
description: Learn about Account assistant for SAP solutions and how it translates business-oriented goals into actionable SAP NetWeaver tasks.
author: ryanb58
ms.author: tbrazelton
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
ms.date: 12/18/2024
ms.service: power-platform
ms.subservice: sap
# Customer intent: As an administrator, I want to learn about the Account assistant for SAP solutions and how it translates business-oriented goals into actionable SAP NetWeaver tasks.
---

# What is Account assistant for SAP solutions?

The Account assistant for SAP solutions is an advanced, LLM-based agent that translates business-oriented goals into actionable SAP NetWeaver tasks.

In a development environment, it helps makers discover what specific SAP BAPIs, RFCs, and table reads are needed to achieve their business goals by empowering makers to build tools to retrieve information and execute operations quickly and easily.

The combination of AI and the ability to directly interact with your SAP system allows for easy discoverability, rapid iteration, and experimentation. Designed for makers and organizations integrating SAP with Power Platform, this tool provides dynamic, installation-specific insights to maximize accuracy when working to integrate Power Platform with your specific SAP system.

> [!WARNING]
> *Account assistant for SAP solutions* is **only intended to assist makers in a development environment**. This agent has wide latitude when interacting with SAP systems and isn't for production use.

## Preparation

Before setting up the Account assistant for SAP solutions, ensure the following prerequisites are in place:

- Microsoft Copilot Studio licenses for your makers.
- Microsoft Copilot Studio message capacity *or* pay-as-you-go plan.
- [Microsoft Power Platform and SAP integration](/power-platform/sap/connect/connect-power-platform-and-sap)

## Create connections with a read-only user account

You should connect to SAP using a read-only user account set up specifically for using the account assistant. It's important that the agent has the ability to read everything in your SAP system, but it could be dangerous to allow it to write data. Remote function calls (RFCs) provided by SAP can be very powerful, and the agent may make changes that are unintended if allowed to do so.

More information:

- [Get access to Microsoft Copilot Studio](/microsoft-copilot-studio/requirements-licensing-subscriptions)
- [Quickstart: Create and deploy a Copilot Studio agent](/microsoft-copilot-studio/fundamentals-get-started)

## Use Cases

The Account assistant for SAP is an essential tool for both employees and support agents. Employees can resolve account access issues independently, avoiding delays and ensuring uninterrupted workflow. Support teams benefit from reduced workloads as routine tasks, like account unlocks, are handled directly by users. This solution is particularly valuable for organizations looking to minimize downtime, improve user satisfaction, and optimize resource allocation in account servicing scenarios.
