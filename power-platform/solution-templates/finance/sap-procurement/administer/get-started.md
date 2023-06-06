---
title: Get started with SAP Procurement solution template
description: Walk through the high-level steps to integrate SAP with Power Platform and work with the SAP Procurement solution template.
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
ms.topic: install-set-up-deploy
ms.date: 06/05/2023
ms.custom: bap-template
---

# Get started with SAP Procurement solution template (preview)

[This article is prerelease documentation and is subject to change.]

Setting up the SAP Procurement solution template requires coordination within a centralized team that includes a mix of IT administrators, SAP functional analysts (SAP BASIS), and developers who are familiar with Power Platform. Review the steps for each phase in the administration journey.

## Set up integration between SAP and Power Platform

Work with an IT Administrator to install and set up the SAP Procurement solution template in your target environment. The IT administrator will need to have _System Administrator_ access to the Power Platform environments and the general network. The IT admin will also need have SAP BASIS capabilities or be able to work with the designated SAP BASIS admin.

| Step | Description |
| ----------- | ----------- |
| [Review requirements](requirements.md) | Review the requirements necessary to set up SAP integration with Power Platform and install the SAP Procurement solution template to your development environment |
| [Set up environments and data policies](set-up-connections.md) | Develop an environment strategy that supports solution application lifecycle management (ALM) and create data policies to govern access |
| [Set up on-premises data gateway](set-up-gateway.md) | Set up an on-premises data gateway to ensure secure data transfer between on-premises data and Microsoft cloud services |
| [Configure authentication](configure-authentication.md) | Configure how to authenticate to your SAP instance via one of the supported methods |
| [Install solutions](install.md) | Access and install the solutions files into your environment |
| [Set up connections](set-up-connections.md) | Set up connection components to be used by the flows and apps |
| [Configure environment variables](configure-environment-variables.md) | Configure environment variables used by the cloud flows to integrate with SAP and support a healthy ALM strategy |

## Administer the apps and monitor health

Work with your the IT administrator and SAP functional analyst to administrate key items that help control access to the apps, seed data stored in Dataverse, and monitor for functional health.

| Steps                                                                                                                   | Description                                                                      |
|-------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| [Configure Azure Active Directory (AAD) security groups](configure-security-groups.md) | Control access to solutions and components |
| [Administer seed data](apply-seed-data.md)                                                                               | Import and create data used by the flows and apps to integrate with SAP          |
| [Monitor for errors](monitor-errors.md)                                                                             | See and investigate unhandled exceptions generated from either the flows or apps |

## Customize and extend to meet your local business requirements

Work with your SAP functional analyst, business subject matter expert and Power Platform developers to extend upon the solution according to your business requirements.

| Step | Description |
| ----------- | ----------- |
| [Customize your solutions](customize-solutions.md) | Start your local configurations by adding desired components from the SAP Procurement solution template to an unmanaged solution in your development environment |
| [Extend canvas apps](extend-canvas-apps.md) | Add new SAP fields, apply custom themes, localize and connect your SAP data with additional sources and processes|
| [Extend model driven app and Dataverse tables](extend-model-apps-dataverse.md) | Create additional tables, columns, security roles to help drive and persist newly digitized data that is currently not mastered and extend the administrator experience |
| [Extend cloud flows](extend-cloud-flows.md) | Map new SAP fields and connect into additional processes and workflows|

## Next steps

- [Requirements](requirements.md)
- [Set up environments and data policies](set-up-environments-data-policies.md)

### See also

- [Overview](../overview.md)
- [Get started](get-started.md)