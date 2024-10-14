---
title: Connect Power Platform and SAP
description: Learn how to connect the Power Platform and SAP to help you quickly build, extend, and deploy solutions that improve daily workflows that interact with SAP.
author: edlehman
ms.author: edleh
contributors: 
  - tverhasselt
  - EllenWehrle
  - tbrazelton
  - dgalitsky
  - shnair
  - edlehman
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 08/14/2024
ms.service: power-platform
ms.subservice: connectors
---

# Connect Power Platform and SAP

With our powerful connectors, you can easily access and manipulate SAP data, enabling you to create copilots, custom applications, and automate workflows.

The [SAP ERP Connector](/connectors/saperp/) utilizes the SAP RFC protocol to your SAP ERP environments for create, read, and update operations on SAP data. It can also be used to call RFCs and BAPIs. The ERP connector is compatible with SAP ECC and S/4HANA environments.

The [SAP OData Connector](/connectors/sapodata/) can consume data from across the SAP product portfolio using the http protocols. Using the OData connector with SAP ECC or prior versions requires configuration of Odata enpoints that is not included in ECC out-of-box setup.

Both connectors support data encryption in motion. Encryption from the gateway to SAP is supported by SAP SNC.

Learn more:
 - [SAP ERP Connector](/connectors/saperp/)
 - [SAP OData Connector](/connectors/sapodata/)
 - [Getting Started with the SAP ERP Connector](guides/getting-started-with-the-sap-erp-connector.md)
 - [Set up Secure Network Communications (SNC)](guides/set-up-secure-network-communications.md)
 - [Set up Microsoft Entra ID using certificates (SSO)](guides/set-up-microsoft-entra-id-with-certificates.md)
