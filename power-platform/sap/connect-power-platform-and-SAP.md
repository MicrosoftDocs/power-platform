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

With our powerful connectors, you can easily access and manipulate SAP data, enabling you to create copilots, custom applications, and automate workflows. There are two connectors available to fit varying needs for integrating with your SAP environments. Both connectors support data encryption in motion. Encryption from the gateway to SAP is supported by SAP SNC.

## Connectors

The [SAP ERP Connector](/connectors/saperp/) utilizes the SAP RFC protocol to your SAP ERP environments for create, read, and update operations on SAP data. It can also be used to call RFCs and BAPIs. The ERP connector is compatible with SAP ECC and S/4HANA environments. The SAP ERP Connector supports SAP Authentication, Windows Authentication, and Microsoft Entra ID with [Kerberos](/power-platform/sap/guides/set-up-microsoft-entra-id-with-kerberos) or [certificates](/power-platform/sap/guides/set-up-microsoft-entra-id-with-certificates).

The [SAP OData Connector](/connectors/sapodata/) can consume data from all products across the SAP portolio that support the [OData Version 4.01 Protocol](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html). Using the OData connector with SAP ECC or prior versions requires configuration of Odata enpoints that is not included in ECC out-of-box setup. The SAP OData Connector supports Anonymous, SAP Authentication, Microsoft Entra ID with [Kerberos](/power-platform/sap/guides/set-up-microsoft-entra-id-with-kerberos) or [certificates](/power-platform/sap/guides/set-up-microsoft-entra-id-with-certificates).

## On-Premises Data Gateway
The [on-premises data gateway](/data-integration/gateway/service-gateway-onprem) is an application that provides the connectivity between Power Platform spplications and your SAP network.

Setup of the integration requires a small Windows virtual machine (VM) with at least 8GB of RAM for the On-Premises Data Gateway, which acts as a proxy server to listen for requests from your Power Platform tenant and relays them to SAP. One windows machine is sufficient for testing, but a cluster of Windows VMs should be set up for deployment to production to avoid single points of failure.

### Learn more:
 - [SAP and Power Platform white paper](https://go.microsoft.com/fwlink/?linkid=2294900)
 - [SAP ERP Connector](/connectors/saperp/)
 - [SAP OData Connector](/connectors/sapodata/)
 - [Getting Started with the SAP ERP Connector](/power-platform/sap/guides/getting-started-with-the-sap-erp-connector)
 - [Set up Secure Network Communications (SNC)](/power-platform/sap/guides/set-up-secure-network-communications)
 - [Set up Microsoft Entra ID using Kerberos](/power-platform/sap/guides/set-up-microsoft-entra-id-with-kerberos)
 - [Set up Microsoft Entra ID using certificates (SSO)](/power-platform/sap/guides/set-up-microsoft-entra-id-with-certificates)
