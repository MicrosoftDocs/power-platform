---
title: Get started with the SAP OData connector
description: Learn how to set up the Power Platform SAP OData connector so that you can start creating automated solutions that work with your SAP environment.
author: galitskyd
ms.author: dgalitsky
contributors:
  - edlehman
  - EllenWehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 11/01/2024
ms.service: power-platform
ms.subservice: sap
ms.custom: ignite-2024
---

<!-- EDITOR'S NOTE: I'm afraid this article is nowhere near ready for publishing. I tried to clean it up, but mostly what it needs is actual information, not content-free marketing lingo. I don't know enough about OData and SAP to even attempt to fill in everything that's missing. Please take this one back to the drawing board. :) -->

# Get started with the SAP OData Connector

The [SAP OData donnector](/connectors/sapodata/) helps you seamlessly integrate Microsoft Power Platform with SAP systems like ECC, S/4HANA, SuccessFactors, Concur, and other OData APIs on top of SAP systems. The SAP OData connector works with the latest version of the OData specification, V4, and is backwards compatible with V3 and V2.

The SAP OData connector offers the following ways to access your SAP systems from Power Platform applications:

- **Basic authentication**: Use your account credentials to connect.
- **Anonymous token**: No authentication is needed. This option is a good choice for public data.
- **SSO through Azure API Management**: Single sign-on managed by Azure API management enables easy and secure access to your SAP systems.

If the SAP system you're integrating with is behind a company firewall, you need to use an on-premises data gateway to access the system.
