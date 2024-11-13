---
title: Governance Administrator
description: Power Platform enables governance administrators to ensure secure and efficient use of integrated Power Platform and SAP applications. This article describes features and practices to support security and efficient building of Power Platform applications integrated with SAP.
author: edlehman
ms.author: edleh
contributors:
  - EllenWehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 10/21/2024
ms.service: power-platform
ms.subservice: sap
ms.custom: ignite-2024
---
# Managing compliance and security for Microsoft Power Platform and SAP integration

Compliance and security administrators ensure secure, compliant, and efficient use of Microsoft SAP connectors within Power Platform, with guidance provided in [Microsoft Power Platform documentation](/power-platform/guidance/).

## Enforcing permissions

SAP's APIs do the same security checks as the SAP GUI. Power Automate flows can also be set up to check user permissions, so apps, fields, and buttons are shown or hidden based on the user's experience in SAP.

## Principal Propagation

Principal Propagation is a way to make sure that users are securely authenticated between Power Platform and SAP systems. The user's identity in Power Platform is passed to the SAP system, so actions in SAP are linked to the right user. This is done through Single Sign-On (SSO) using Microsoft Entra ID and SAP's authentication methods. With SSO, administrators can apply the same security rules for user access and permissions on both platforms.

## Power Platform Application Lifecycle Management (ALM)

[Application Lifecycle Management (ALM) in Power Platform](/power-platform//alm/basics-alm.md) is important for controlling the development, deployment, and management of apps that work with SAP. ALM practices include using [solutions](/power-platform//alm/solution-concepts-alm.md) to package and move parts like apps, workflows, and connections between environments (e.g., Development, Quality, and Production). Administrators can set environment-specific rules, manage permissions, and make sure only authorized users can make changes. This organized approach helps keep SAP-connected apps secure and reliable.

:::image type="content" source="media/governance/Power_Platform_ALM.png" alt-text="Power Platform ALM uses solutions to migrate apps across dev, test, and prod environments":::

## Support of secure data transport

Secure data transport is very important when connecting Power Platform with SAP systems. The on-premises data gateway acts as a bridge, securely transferring data between on-premises SAP systems and Power Platform. The gateway uses outbound ports to connect to Azure services, which improves security. Additionally, Secure Network Communications (SNC) can be set up to encrypt data between the gateway and SAP systems. Administrators should also use [Data Loss Prevention (DLP)](/power-platform/admin/wp-data-loss-prevention.md) policies to control which connectors can be used and to prevent unauthorized data access or transfer.

Learn more:

- [SAP and Power Platform white paper](https://go.microsoft.com/fwlink/?linkid=2294900)
- [Enable SAP Principal Propagation and SSO for Power Platform](/azure/sap/workloads/expose-sap-odata-to-power-platform)
- [Set up Secure Network Communications (SNC)](..//connect/secure-network-communications.md)
- [Set up Microsoft Entra ID using certificates (SSO)](..//connect/entra-id-certs.md)
