---
title: Governance Administrator
description: The Power Platform enables goverance administartors to ensure secure and efficient use of the integration of SAP and Power Platform applications. This guide describes features and practices to support security and effecient building of power platform applications integrated with SAP.
author: edlehman
ms.author: edleh
contributors:
  - EllenWehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 10/21/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---
# Microsoft Power Platform SAP Connectors governance and security

Governance administrators play a crucial role in ensuring the secure and efficient use of Microsoft SAP connectors within the Power Platform. This involves understanding Power Platform features that provide data transport between Power Platform and SAP systems and support efficient and compliant development practices. [Microsoft Power Platform guidance documentation](/power-platform/guidance/) provides in-depth guidance and best-practices for compliant, secure, and efficient power platform development.

## Principal Propagation

Principal propagation is a key mechanism that ensures secure and seamless authentication between Power Platform and SAP systems. It allows the identity of the user in Power Platform to be propagated to the SAP system, ensuring that actions performed in SAP are attributed to the correct user. This is achieved through Single Sign-On (SSO) configurations using Microsoft Entra ID (formerly Azure Active Directory) and SAP's authentication mechanisms. By leveraging SSO, administrators can enforce consistent security policies and streamline user access management across both platforms.

## Power Platform Application Lifecycle Management (ALM)

[Application Lifecycle Management (ALM) in Power Platform](/power-platform/alm/) is essential for maintaining control over the development, deployment, and management of applications that integrate with SAP. ALM practices include using [solutions](/power-platform/alm/solution-concepts-alm) to package and move components such as apps, workflows, and connections between environments (e.g., Development, Quality, and Production). Administrators can enforce environment-specific policies, manage permissions, and ensure that only authorized users can deploy changes. This structured approach helps maintain the integrity and security of SAP-connected applications.

## Support of Secure Data Transport

Secure data transport is critical when integrating Power Platform with SAP systems. The on-premises data gateway acts as a bridge, providing secure data transfer between on-premises SAP systems and Power Platform. The gateway uses outbound ports to reach Azure services, ensuring that no inbound ports are required, which enhances security. Additionally, Secure Network Communications (SNC) can be configured to encrypt data between the gateway and SAP systems. Administrators should also implement [Data Loss Prevention (DLP)](/power-platform/admin/wp-data-loss-prevention) policies to control which connectors can be used and to prevent unauthorized data access or transfer.

Learn more:
 - [SAP and Power Platform white paper](https://go.microsoft.com/fwlink/?linkid=2294900)
 - [Enable SAP Principal Propagation and SSO for Power Platform](/azure/sap/workloads/expose-sap-odata-to-power-platform)
 - [Set up Secure Network Communications (SNC)](/power-platform/sap/guides/set-up-secure-network-communications)
 - [Set up Microsoft Entra ID using certificates (SSO)](/power-platform/sap/guides/set-up-microsoft-entra-id-with-certificates)