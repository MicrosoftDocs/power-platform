---
title: "ALM Accelerator for Power Platform tenant deployments"
description: "Overview of tenant deployment models for the ALM Accelerator"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 04/10/2023

ms.topic: "article"
ms.reviewer: sericks
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# ALM Accelerator for Power Platform tenant deployments

The ALM Accelerator for Power Platform can be deployed in a single demo tenant or single enterprise tenant.

Currently, ALM Accelerator doesn't automatically support a  model for multi-tenant, enterprise deployments. More manual configuration would be required to configure that scenario.

## Deployments scenarios

### Demo deployment scenario

- Example tenant: `https://v1234f.onmicrosoft.com`
- Azure DevOps: `https://dev.azure.com/v1234f`

Attributes:

- Separated from enterprise environment in a demo, Azure Active Directory (AD) tenant.
- Uses trial environment and licenses.
- Demonstrates an end-to-end ALM process.
- Supported for learning and exploring.
- Typically has 1-5 users.

### Enterprise deployment scenario

- Example tenant: <https://contoso.onmicrosoft.com>
- Azure DevOps: <https://dev.azure.com/contoso>

Attributes:

- Integrated into a single, enterprise Azure AD tenant.
- Supports multiple environments for development, test, and production.
- Has an end-to-end ALM process for enterprise-wide applications with thousands of users.
- Has Fusion development teams of makers, professional developers, and administrators.

### Multi-tenant deployment scenario

- Example tenants: <https://contoso-dev.onmicrosoft.com>, <https://contoso.onmicrosoft.com>
- Azure DevOps: <https://dev.azure.com/contoso>, <https://dev.azure.com/contoso-dev>

Attributes:

- Has multiple, Azure AD tenants. (Internal in organization or with partners.)
- Supports multiple environments for development, test, and production.
- Has end-to-end ALM process for enterprise-wide applications with thousands of users, or applications shared across organizations.
- Has Fusion development teams of makers, professional developers, and administrators from within and outside the organization.

## Factors to consider

- Does ALM for low-code solutions introduce new concepts to parts of the business that haven't been exposed to them before?

- Would a demo deployment provide an environment to allow the different personas to experiment and accelerate adoption of ALM processes?

- Who will manage and operate the ALM process?

- How will the maker community be expanded to adopt new ALM concepts?

- What steps can be put in place to adopt a self-service model to create environments and move between validation, test, and production environments.

## Enterprise deployment

In this scenario, the aim is to install ALM Accelerator inside an enterprise tenant and the following configuration is expected:

- Likely to have different administration teams. For example:
   - Azure Active Directory administrators
   - Power Platform administrators (May be global administrator or environment administrators.)
   - Azure DevOps administrators
- Configuration files for ALM Accelerator install can be shared among different administration teams.
- Makers have separate development environments to work on changes.
- ALM Accelerator Azure DevOps pipeline used to validate and promote to test and production environments.

### Azure AD administrators

The tenant administration team will need to create the following:

1. Azure AD application that will be used as a service principal in Azure DevOps and Power Platform environments.
1. Azure AD group that will be used to grant access to makers to Azure DevOps resources, canvas applications, and Microsoft Dataverse tables.
1. Grant tenant consent for Azure AD application. This permission is required as the Azure DevOps pipeline uses APIs where there's no interactive user involved. As a result, the tenant administrator consent is required.

## Multi-tenant deployment

This deployment type involves different Azure AD deployments that separate development, test, and production systems. For example, the following Azure AD tenants:

- contoso.onmicrosoft.com

- contoso-dev.onmicrosoft.com

Currently the ALM Accelerator installation doesn't automatically support a multi-tenant deployment without manual updates.

### Multi-tenant deployment assumptions

The multi-tenant deployment is assumed to have one or more of the following:

- Multiple Azure AD tenants.

- Power Platform environments for development, validation, test, and production might be in different tenants.

- The Azure DevOps environment might be in the development tenant.

- Users of the main tenant might use Azure business-to-business authentication to access the development tenant.

- External users from outside the organization may be invited to the development tenant, and not have access to the main tenant.

### Azure AD implications

To support multi-tenant deployments, the Azure AD application will need to be configured to support multi-tenant authentication.

#### Learn more

[Tenancy in Azure Active Directory](/azure/active-directory/develop/single-and-multi-tenant-apps)

[!INCLUDE[footer-include](../../../includes/footer-banner.md)]
