---
title: "Center of Excellence (CoE) Command Line Interface (CLI) Application Lifecycle Management (ALM) Accelerator Tenant Deployments"
description: "Overview of tenant deployment models for the ALM Accelerator"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 11/30/2021
ms.service: power-platform
ms.topic: "article"
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# Tenant Deployments

AA4PP can be deployed in the following scenarios single demo tenant, single enterprise tenant.

Currently AA4PP **doesn't** automatically support a multitenant enterprise deployment model and more manual configuration will be required to configure this scenario.

## Deployments Scenarios

### Demo Deployment

Example Tenant: https://v1234f.onmicrosoft.com
Azure DevOps: https://dev.azure.com/v1234f

Attributes:

- Separated from Enterprise Environment in Demo Azure Active Directory Tenant
- Use Trial environment / licenses
- Demonstrate end to end ALM Process
- Learn and Explore
- Typical Users: 1-5 Users

### Enterprise Deployment

Example Tenant: https://contoso.onmicrosoft.com
Azure DevOps: https://dev.azure.com/contoso

Attributes:

- Integrated into Single Enterprise Azure Active Directory tenant
- Multiple environments Development, Test and Production
- End to end ALM Process for enterprise wide applications with thousands of users
- Fusion Development Teams of Makers, Pro Developers, Administrators

### Multi Tenant Deployment

Example Tenants: https://contoso-dev.onmicrosoft.com, https://contoso.onmicrosoft.com
Azure DevOps: https://dev.azure.com/contoso, https://dev.azure.com/contoso-dev

Attributes:

- Multiple AAD tenants – Internal in organization or with partners
- Multiple environments Development, Test and Production
- End to end ALM Process for enterprise wide applications with thousands of users or applications shared across organizations
- Fusion Development Teams of Makers, Pro Developers, Administrators from within and outside the organization

## Factors to Consider

- Does ALM for Low Code solutions introduce new concepts to parts of the business that hasn't been exposed to them before?

- Would a demo deployment provide an environment to allow the different [personas](../personas.md) to experiment and accelerate adoption of ALM processes?

- Who will manage and operate the ALM process?

- How will the maker community be expanded to adopt new ALM concepts?

- What steps can be put in place to adopt a self-service model to create environments and move between validation, test and production environments.

## Demonstration Deployment

To setup a demonstration deployment, you're looking to quickly install AA4PP to and showcase the end-to-end process. For this scenario, the following configuration is expected:

1. Using Trial tenant and environments to demonstrate the solution

1. Single Administrator that has the following rights:
   - Azure Active Directory tenant administrator
   - Power Platform Global Administrator
   - Power Platform Organization Administrator

1. Demo non-administration maker users that will be used to show process of creating ALM process for Power Platform solutions

1. Non-production applications

## Post Install

Once you have the [Admin Install](../admin-install.md) completed, Advanced makers can create [Development environments](../development-environments.md) and have Administrators add them to Azure DevOps and the required Azure Active Directory Security Group.

You'll typically use the following commands as the **single administrator**

```bash
coe alm generate install -o quickstart.json
coe alm install -f quickstart.json
```

More information: [generate install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/generate/install.md) command
More information: [install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) command

Then add a demo user as a maker

```bash
coe alm maker add \
  -e https://contoso-dev-alans.crm.dynamics.com \
  -o https://dev.azure.com/contoso-dev \
  -p alm-sandbox \
  -u alan-s@contoso.onmicrosoft.com
```

More information: [maker add](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/maker/add.md) command

Once these steps are completed, the next step is to [Set up Managed Solutions](../maker-setup.md) for makers

## Enterprise deployment

In this scenario, the aim is to install AA4PP inside an enterprise tenant and the following configuration is expected.

1. Likely to have different administration teams. For example
   - Azure Active Directory Administrators
   - Power Platform Administrators. May be Global Administrator or Environment Administrators
   - Azure DevOps Administrators
1. Configuration files for AA4PP install can be shared among different Administration teams
1. Makers have separate development environments to work on changes
1. AA4PP Azure DevOps pipeline used to validate and promote to Test and Production environments

### Azure Active Directory administrators

The tenant administration team will need to create the following

1. Azure Active Directory Application that will be used as Service Principal in Azure DevOps and Power Platform Environments
1. Azure Active Directory Group that will be used to grant access to Makers to Azure DevOps resources, Maker Canvas Application, and Dataverse Tables.
1. Grant Tenant Consent for Azure Active Directory Application. This permission is required as the Azure DevOps pipeline uses APIs where there's no interactive user involved. As a result the tenant administrator consent is required.

To install the solution resources, the following options can be used

#### Azure Active Directory

1. Use the CLI to install the Azure Active Directory components. For example, using the default install parameters

```bash
coe alm install -c aad
```

1. Using a shared configuration file and setting components array value to be [ "aad" ]

```json
{
  "log": [
    "info"
  ],
  "components": [
    "aad"
  ],
  "aad": "ALMAcceleratorServicePrincipal",
  "group": "ALMAcceleratorForAdvancedMakers",
  "devOpsOrganization": "https://dev.azure.com/contoso-dev",
  "project": "alm-sandbox",
  "repository": "pipelines",
  "settings": {
    "installEnvironments": [
      "validation",
      "test",
      "prod"
    ],
    "validation": "https://sample-validation.crm.dyamics.com",
    "test": "https://sample-test.crm.dyamics.com",
    "prod": "https://sample-prod.crm.dyamics.com",
    "createSecret": "true",
    "region": [
      "NAM"
    ]
  },
  "importMethod": "api",
  "endpoint": "prod"
}
```

#### Azure DevOps

```bash
coe alm install -c devops \
  -o https://dev.azure.com/contoso-dev \
  -p alm-sandbox
```

#### Power Platform Environment

```bash
coe alm install -f install.json

```

```json
{
  "log": [
    "info"
  ],
  "components": [
    "environment"
  ],
  "aad": "ALMAcceleratorServicePrincipal",
  "group": "ALMAcceleratorForAdvancedMakers",
  "devOpsOrganization": "https://dev.azure.com/contoso",
  "project": "alm-sandbox",
  "repository": "pipelines",
  "settings": {
    "installEnvironments": [
      "validation",
      "test",
      "prod"
    ],
    "validation": "https://contoso-validation.crm.dyamics.com",
    "test": "https://contoso-test.crm.dyamics.com",
    "prod": "https://contoso-prod.crm.dyamics.com",
    "createSecret": "true",
    "region": [
      "NAM"
    ]
  },
  "importMethod": "api",
  "endpoint": "prod"
}
```

1. Manual installation using the [Create An App Registration in your Azure Active Directory environment](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#create-an-app-registration-in-your-aad-environment)

## Multi-tenant deployment

This deployment type involves different Azure Active Directory deployments that separate development, test, and production systems. For example, the following Azure Active Directory tenants

- contoso.onmicrosoft.com

- contoso-dev.onmicrosoft.com

Currently the AA4PP installation doesn't automatically support a multi-tenant deployment without manual updates.

### Multi-tenant deployment assumptions

The multi-tenant deployment is assumed to have one or more of the following

1. Multiple Azure Active Directory tenants

1. Power Platform Environments for Development, Validation, Test, and Production may be in different tenants.

1. The Azure DevOps environment may be in the Development tenant

1. Users of the main tenant my use Azure Business to Business authentication to access the development tenant

1. External users from outside the organization maybe invited to the development tenant and not have access to the main tenant

### Azure Active Directory implications

To support multi-tenant deployments, the Azure Active Directory application will need to be configured to support multi-tenant authentication.

#### Further reading

1. [Tenancy in Azure Active Directory](/azure/active-directory/develop/single-and-multi-tenant-apps)

[!INCLUDE[footer-include](../../../../../includes/footer-banner.md)]
