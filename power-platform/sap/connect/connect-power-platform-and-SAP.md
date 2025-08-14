---
title: Connect Microsoft Power Platform and SAP
description: Learn about the Power Platform and SAP connection options available so you can build, extend, and deploy solutions that interact with your data in SAP.
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
ms.topic: overview
ms.date: 02/11/2025
ms.service: power-platform
ms.subservice: sap
ms.custom: ignite-2024
# Customer intent: As an administrator, I want to learn how to connect Power Platform to SAP, so I can build, extend, and deploy Power Platform solutions on top of SAP to integrate data, automate workflows, improve user experiences, and keep the core of my SAP system clean.
---

# What are the Microsoft Power Platform and SAP connection options?

Power Platform offers two connectors to fit varying needs for integrating with your SAP environments. The SAP ERP and SAP OData connectors allow you to easily access and manipulate SAP data, including creating custom applications and agents and automating workflows. Both connectors support data encryption in motion. Secure Network Communications (SNC) encrypts data between the on-premises data gateway and SAP.

## SAP ERP connector

The [SAP ERP connector](./sap-erp-connector.md) uses SAP Remote Function Calls (RFCs) protocol to connect to your SAP ERP environments for create, read, and update operations on SAP data. The connector also uses Business APIs (BAPIs) and tables, including intermediate documents (IDOCs). The SAP ERP connector is compatible with SAP ECC and S/4HANA environments and any SAP product that runs on the NetWeaver stack. The SAP ERP connector supports:

- SAP authentication
- Windows authentication
- [Microsoft Entra ID using Kerberos](./entra-id-kerberos.md) for authentication
- [Microsoft Entra ID using certificates](./entra-id-certs.md) for authentication

The SAP ERP connector runs on SAP's API layer, which typically has better system performance than running the same activity in the SAP GUI. As more users transition off the SAP GUI and to an external user interface like a canvas app, CPU consumption on the SAP servers drops significantly.

The SAP ERP connector uses the message server to invoke APIs that create, read, and update SAP data. This traffic typically flows over port 33XX for single application servers or port 39XX for load-balanced connections, where *XX* is the system number of the SAP instance.

## SAP OData connector

The [SAP OData connector](./sap-odata-connector.md) can consume data from all SAP products that support the [OData Version 4.01 protocol](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html). Using the OData connector with SAP ECC or prior versions requires configuration of OData endpoints that are not included in the ECC out-of-box setup. The SAP OData connector supports:

- Basic authentication
- Anonymous authentication
- [Microsoft Entra ID using Azure API Management](./entra-id-apim-oauth.md) for authentication
- [Microsoft Entra ID using SuccessFactors](./entra-id-using-successfactors.md) for authentication

## On-premises data gateway

An [on-premises data gateway](/data-integration/gateway/service-gateway-onprem) acts as a bridge to securely transfer data between on-premises systems and Microsoft cloud services. A Windows virtual machine (VM) with at least 8 GB of RAM is required for the on-premises data gateway, which acts as a proxy server to listen for requests from your Power Platform tenant and relays them to SAP. One Windows machine is sufficient for testing, but a cluster of Windows VMs should be set up for deployment to production to avoid single points of failure.

The recommended practice is to set up a separate gateway for each environment. This practice allows you to test changes without affecting other environments, and eliminates any risk of development testing affecting test and production environments.

### Related content

- [SAP + Power Platform white paper](https://go.microsoft.com/fwlink/?linkid=2294900)
- [SAP ERP connector](/connectors/saperp/)
- [SAP OData connector](/connectors/sapodata/)
- [Get started with the SAP ERP connector](./sap-erp-connector.md)
- [Get started with the SAP OData connector](./sap-odata-connector.md)
- [Set up Secure Network Communications](./secure-network-communications.md)
- [Set up Microsoft Entra ID using Kerberos for SSO](./entra-id-kerberos.md)
- [Set up Microsoft Entra ID using certificates for SSO](./entra-id-certs.md)
