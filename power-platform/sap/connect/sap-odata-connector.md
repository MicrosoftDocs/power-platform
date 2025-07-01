---
title: Get started with the SAP OData connector
description: Learn about the SAP OData connector and its connection options so you can connect and extend your SAP data in Microsoft Power Platform .
author: galitskyd
ms.author: dgalitsky
contributors:
  - edlehman
  - EllenWehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 11/22/2024
ms.service: power-platform
ms.subservice: sap
ms.custom: ignite-2024
# Customer intent: As an administrator, I want to learn about the SAP OData connector, so I can connect Power Platform to SAP.
---

# Get started with the SAP OData Connector

The [SAP OData connector](/connectors/sapodata/) helps you connect your SAP systems to Microsoft Power Platform. The SAP OData connector works with the latest version of the OData specification, [V4](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html), and is backwards compatible with V3 and V2. This connector can link up with SAP systems like ECC, S/4HANA, SuccessFactors, Concur, and other OData APIs on top of SAP systems. With this connector, you can use the powerful features of SAP in Power Platform—all while keeping your SAP core clean.

## What's OData?

OData stands for [Open Data Protocol](/odata/overview). It's a standard way to create and use data APIs, which are like doors for different software to communicate. OData makes it easy to perform basic tasks like creating, reading, updating, and deleting data. The SAP OData connector uses these rules to connect to and communicate with SAP systems.

## SAP OData connection options

The SAP OData connector for Power Platform offers the following user connection options:

- **Basic authentication**: Use your account credentials to connect.
- **Anonymous token**: No authentication is needed. This option is a good choice for public data.
- **[Microsoft Entra ID using Azure API Management](./entra-id-apim-oauth.md)**: Single sign-on managed by Azure API management enables easy and secure access to your SAP systems.
- **[Microsoft Entra ID using SuccessFactors](./entra-id-using-successfactors.md)** (preview): Single sign-on managed by SAP SuccessFactors.

## Proxy through a corporate firewall

If the SAP system you're integrating with is not accessible from the internet because it's behind a company firewall, you need to *proxy*/route through the corporate firewall. Setting up an **[on-premises data gateway](/data-integration/gateway/)** allows you to access the system. To get started:

1. [download](https://aka.ms/opdg)
1. [install](/data-integration/gateway/service-gateway-install#download-and-install-a-standard-gateway) the on-premises data gateway on your Windows VM. Be sure to install and configure it in the same region as your Power Automate environment.
1. Select **Gateways** to see the gateway installed in your Power Automate environment.

## Set up and test the OData connector

1. Go to Power Automate
1. Create a new flow with a trigger of your choice, such as the *SAP OData query action*.
:::image type="content" source="media/sap-odata-connector/sap-odata.png" alt-text="Power Automate actions query OData entities":::
1. Set up a connection to your SAP system. To connect to a system that is only available from within the company firewall (where the on-premises data gateway is installed), select **Data Gateway** and then select your gateway from the list.
:::image type="content" source="media/sap-odata-connector/connect-odata.png" alt-text="Setting up OData connector in Power Automate":::
1. Provide the required information using the *OData Base URI L* from your local SAP system. It will look something like this:
`https://mylocal.sap.system:50000/sap/opu/odata/iwbep/GWSAMPLE_BASIC`
1. Test the URL internally to verify that it's not accessible from outside the intranet. Once you know it's working properly you can start creating flows and testing how they work with your SAP system.

> [!NOTE]
> Using the OData connector with SAP ECC or prior versions requires configuration of OData endpoints that are not included in the ECC out-of-box setup.

You can learn more about working with the OData connector and Power Platform in [Hurray! SAP OData connector now supports OAuth2 and SAP Principal Propagation](<https://community.powerplatform.com/blogs/post/?postid=c6a609ab-3556-ef11-a317-6045bda95bf0>)
