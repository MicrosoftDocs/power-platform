---
title: Tenant deployment model
description: Learn about tenant deployment models for the ALM Accelerator for Power Platform.
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.reviewer: sericks
ms.custom: bap-template
ms.date: 04/10/2023
ms.topic: concept-article
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# Tenant deployment model

The ALM Accelerator for Power Platform can be deployed in a [single demo tenant](#demo-deployment-scenario), a [single enterprise tenant](#enterprise-deployment-scenario), or&mdash;with some manual configuration&mdash;[multiple enterprise tenants](#multi-tenant-deployment-scenario).

## Factors to consider

As you plan your tenant deployment model, the following factors may help you determine the best approach:

- Does ALM for low-code solutions introduce new concepts to parts of the business that haven't been exposed to them before?

- Would a demo deployment provide an environment to allow the different personas to experiment and accelerate adoption of ALM processes?

- Who will manage and operate the ALM process?

- How will the maker community be expanded to adopt new ALM concepts?

- What steps can be put in place to adopt a self-service model to create environments and move between validation, test, and production environments?

## Demo deployment scenario

- Example tenant: `https://v1234f.onmicrosoft.com`
- Azure DevOps: `https://dev.azure.com/v1234f`

Attributes:

- Separated from the enterprise environment in a demo Microsoft Entra tenant.
- Uses trial environment and licenses.
- Demonstrates an end-to-end ALM process.
- May be used for learning and exploring.
- Typically has 1&ndash;5 users.

## Enterprise deployment scenario

- Example tenant: <https://contoso.onmicrosoft.com>
- Azure DevOps: <https://dev.azure.com/contoso>

Attributes:

- Integrated into a single enterprise Microsoft Entra tenant.
- Supports multiple environments for development, test, and production.
- Has an end-to-end ALM process for enterprise-wide applications with thousands of users.
- Has fusion development teams of makers, professional developers, and administrators.

In this scenario, the aim is to install the ALM Accelerator in an enterprise tenant. The following configuration is expected:

- Likely to have different administration teams; for example, Microsoft Entra administrators; Power Platform administrators, global or environment; and Azure DevOps administrators.
- Configuration files for the ALM Accelerator installation can be shared among the administration teams.
- Makers have separate development environments to work on changes.
- An ALM Accelerator pipeline is used to validate and promote to test and production environments.

The tenant administration team needs to:

1. Create a Microsoft Entra application to be used as a service principal in Azure DevOps and Power Platform environments.
1. Create a Microsoft Entra group to be used to grant access to makers to Azure DevOps resources, canvas applications, and Microsoft Dataverse tables.
1. Grant tenant consent for the Microsoft Entra application, because the pipeline uses APIs with no interactive user involved.

## Multi-tenant deployment scenario

To support multi-tenant deployments, the Microsoft Entra application must be manually configured to support multi-tenant authentication.

- Example tenants: <https://contoso-dev.onmicrosoft.com>, <https://contoso.onmicrosoft.com>
- Azure DevOps: <https://dev.azure.com/contoso>, <https://dev.azure.com/contoso-dev>

Attributes:

- Has multiple Microsoft Entra tenants, internal to organization or with partners.
- Supports multiple environments for development, test, and production.
- Has an end-to-end ALM process for enterprise-wide applications with thousands of users or applications shared across organizations.
- Has fusion development teams of makers, professional developers, and administrators inside and outside the organization.

This deployment type involves different Microsoft Entra deployments that separate development, test, and production systems. The following configuration is expected:

- Has multiple Microsoft Entra tenants.
- Power Platform environments for development, validation, test, and production might be in different tenants.
- The Azure DevOps environment might be in the development tenant.
- Users of the main tenant might use Azure business-to-business authentication to access the development tenant.
- Users from outside the organization may be invited to the development tenant and not have access to the main tenant.

## Related information

- [Tenancy in Microsoft Entra ID](/azure/active-directory/develop/single-and-multi-tenant-apps)

[!INCLUDE [footer-include](../../../includes/footer-banner.md)]
