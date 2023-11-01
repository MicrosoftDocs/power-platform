---
title: Get started with the SAP Procurement template
description: Walk through the high-level steps to integrate SAP with Power Platform and work with the SAP Procurement template.
author: tverhasselt
ms.author: thoverh
contributors:
- jongilman88
- microsoft-george
- robinsonshields
- EllenWehrle
- galitskyd
- microsoft-dustin
- ryanb58
- scottwoodallmsft
- Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 10/26/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Get started with the SAP Procurement template

Enterprise templates for Power Platform published by Microsoft on AppSource are solutions designed to digitally transform broad, complex business scenarios for specific lines of business or enterprise wide.

The SAP Procurement solutions are enterprise-ready and therefore need to be customized, deployed, and managed by a [centralized team](/power-platform/guidance/adoption/delivery-models#centralized) to [maintain governance and security](/power-platform/guidance/adoption/admin-best-practices).

It's recommended that an [executive sponsor](/power-platform/guidance/adoption/executive-sponsorship?source=recommendations) establishes a team that consists of key stakeholders, product owners, business analysts, Power Platform administrators and developers and SAP admins (S-User) and functional analysts (SAP BASIS).

Once established, your team can get started with its SAP + Power Platform administration journey by reviewing the Power Platform resource links and following the SAP integration and administration steps.

More information: [Power Platform adoption best practices](/power-platform/guidance/adoption/methodology), [Administer Microsoft Power Platform](/power-platform/admin/admin-documentation)

## Integrate SAP with Power Platform

Review your organization's current [Power Platform administration and governance](/power-platform/guidance/adoption/admin-best-practices) with your team. Develop a plan of action that supports your organization's deployment of enterprise-scale solutions on Power Platform.

| Step | Description |
| ----------- | ----------- |
| [Review requirements](requirements.md) | Review the requirements to integrate SAP with Power Platform and install the SAP Procurement solution template in your development environment. |
| [Set up environments and data policies](set-up-connections.md) | Develop an environment strategy that supports solution application lifecycle management (ALM) and create data policies to govern access. |
| [Set up an on-premises data gateway](set-up-gateway.md) | Set up an on-premises data gateway to ensure secure data transfer between on-premises data and Microsoft cloud services. |
| [Configure authentication](configure-authentication.md) | Configure how to authenticate to your SAP instance. |
| [Install solutions](install.md) | Install the solution files in your environment. |
| [Set up connections](set-up-connections.md) | Set up connection components for use by flows and apps. |
| [Configure environment variables](configure-environment-variables.md) | Configure environment variables used by the cloud flows to integrate with SAP and support a healthy ALM strategy. |

## Administer the apps and monitor health

Work with your IT administrator and SAP functional analyst to manage key items that help control access to the apps, seed data stored in Microsoft Dataverse, and monitor functional health.

| Steps | Description |
| --- | --- |
| [Configure Azure Active Directory security groups](configure-security-groups.md) | Control access to solutions and components. |
| [Administer seed data](apply-seed-data.md) | Import and create data used by the flows and apps to integrate with SAP. |
| [Monitor for errors](monitor-errors.md) | View and investigate unhandled exceptions generated from either the flows or apps. |

## Extend to meet your local business requirements

Work with your SAP functional analyst, business subject matter experts, and Power Platform developers to customize the solution so it supports your organization's unique business processes.

| Step | Description |
| ----------- | ----------- |
| [Customize your solutions](customize-solutions.md) | Start your local configurations by adding desired components from the SAP Procurement solution template to an unmanaged solution in your development environment. |
| [Extend canvas apps](extend-canvas-apps.md) | Add new SAP fields, apply custom themes, localize, and connect your SAP data with more sources and processes. |
| [Extend model-driven app and Dataverse tables](extend-model-apps-dataverse.md) | Create tables, columns, and security roles to help drive and persist newly digitized data that's currently not mastered and extend the administrator experience. |
| [Extend cloud flows](extend-cloud-flows.md) | Map new SAP fields and connect them to more processes and workflows. |

## Next steps

[Requirements](requirements.md)
