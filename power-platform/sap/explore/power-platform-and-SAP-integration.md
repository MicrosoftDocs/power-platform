---
title: Explore Power Platform and SAP integration
description: Learn how Power Platform helps you build, extend, and deploy solutions that interact with SAP to improve daily workflows.
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
ms.date: 11/11/2024
ms.service: power-platform
ms.subservice: sap
ms.custom: ignite-2024
# Customer intent: As a business decision maker or as an administrator, I want to learn about Power Platform integration with SAP so I can discover how to integrate and streamline my organization's SAP data and workflows with other system data in Power Platform to give my organization's users a better work experience that leads to saved time, fewer mistakes, and improved data quality and insights.
---

# What is Power Platform integration with SAP?

Unlock the full potential of your SAP data with [Microsoft Power Platform](/power-platform/). Integrate SAP ERP and SAP OData services into your Copilot Studio, Power Apps, and Power Automate solutions to drive innovation and efficiency across your organization. With Power Platform connectors, you can access and operate on SAP data, enabling you to create custom copilots, applications, and automation workflows.

Discover how to streamline your SAP business processes with Power Platform. Whether you're looking to enhance customer experiences, optimize operations, or gain deeper insights into your business, our connectors provide the tools you need to succeed. Transform how you view and work with your SAP data and experience the benefits of a truly integrated digital ecosystem.

:::image type="content" source="media/power-platform-and-SAP-integration/flex-design.png" alt-text="Power Platform Connectors for SAP integrates Power Platform and SAP products":::

## SAP ERP connector

The ERP connector communicates with SAP over the RFC protocol through the SAP .NET connector library (NCo) 3.1 provided by SAP. SAP NCo Release and Support Strategy states that NCo 3.0 works with any SAP back-end system starting with release 4.0B, and transparently supports Unicode and non-Unicode back-ends. SAP NCo 3.1 release and support strategy does not include any statement of versions supported or change in versions supported. The ERP connector has been validated with versions of ECC and S4/HANA. If issues arise in integrating with SAP R/3 4.0B or greater, we will make a best effort attempt at supporting.

## SAP OData connector

The OData connector uses the [OData Version 4.01 Protocol](https://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html), jointly developed by Microsoft and SAP and supported across many SAP products. You can find more about SAP Products supporting OData in [The importance and value of OData in the SAP ecosystem - SAP Community](https://community.sap.com/t5/technology-blogs-by-sap/the-importance-and-value-of-odata-in-the-sap-ecosystem/ba-p/13492946)

## Licensure

Users of Power Platform apps integrated with SAP will need the following licenses:

- A Power Apps Premium license
- An SAP indirect-named user license

If you already have SAP direct named user licenses, you can use these licenses with Power Apps. It is worth noting, however, that SAP indirect named user licenses cost less than direct named user licenses. Customers can also use [Digital Access Licenses](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/999033817c60412f88303c6d6a80c348/4786b16cae0047279eac879b7701d044.html?version=2021.001&locale=en-US).

## Enterprise templates for Power Platform

[Enterprise templates for Power Platform](../../enterprise-templates/overview.md) include the [SAP Procurement](../../enterprise-templates/finance/sap-procurement/overview.md) and [SAP Supplier Self Service](../../enterprise-templates/finance/sap-supplier-self-service/overview.md) templates. These templates and ready-to-use copilots that include sample components and cloud flows for common SAP business processes can accelerate your Power Platform and SAP integration journey.

## Power Platform connectors

Power Platform connectors provide secure, encrypted integration of your SAP data with Power Platform products and connected services through hundreds of [Power Platform connectors](/connectors/).

> [!NOTE]
>There may be issues that are encountered where, as an SAP customer, a support ticket with SAP will need to be submitted for additional support from SAP.

Learn more:

- [SAP and Power Platform white paper](https://go.microsoft.com/fwlink/?linkid=2294900)
- [SAP ERP connector](/connectors/saperp)
- [SAP OData connector](/connectors/sapodata)
- [Get started with the SAP ERP connector](../connect/sap-erp-connector.md)
- [Get started with the OData connector](../connect/sap-odata-connector.md)
- [Set up Microsoft Entra ID using certificates(SSO)](../connect/entra-id-certs.md)
