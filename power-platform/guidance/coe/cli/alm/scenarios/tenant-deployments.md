---
title: "CoE ALM Accelerator for Power Platform tenant deployments"
description: "Overview of tenant deployment models for the ALM Accelerator"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 11/30/2021

ms.topic: "article"
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# CoE ALM Accelerator for Power Platform tenant deployments

AA4PP can be deployed in the following scenarios single demo tenant or single enterprise tenant.

Currently AA4PP doesn't automatically support a multi-tenant enterprise deployment model and more manual configuration will be required to configure that scenario.

## Deployments scenarios

### Demo deployment scenario

Example Tenant: <https://v1234f.onmicrosoft.com>
Azure DevOps: <https://dev.azure.com/v1234f>

Attributes:

- Separated from enterprise environment in a demo Azure Active Directory tenant.
- Uses trial environment and licenses.
- Demonstrates an end-to-end ALM process.
- Learn and explore.
- Typical number of users is 1-5.

### Enterprise deployment scenario

Example Tenant: <https://contoso.onmicrosoft.com>
Azure DevOps: <https://dev.azure.com/contoso>

Attributes:

- Integrated into a single enterprise Azure Active Directory tenant.
- Multiple environments development, test, and production.
- End-to-end ALM process for enterprise-wide applications with thousands of users.
- Fusion development teams of makers, professional developers, and administrators.

### Multi-tenant deployment scenario

Example Tenants: <https://contoso-dev.onmicrosoft.com>, <https://contoso.onmicrosoft.com>
Azure DevOps: <https://dev.azure.com/contoso>, <https://dev.azure.com/contoso-dev>

Attributes:

- Multiple Azure Active Directory tenants – Internal in organization or with partners.
- Multiple environments development, test, and production.
- End-to-end ALM Process for enterprise-wide applications with thousands of users or applications shared across organizations.
- Fusion development teams of makers, pro developers, and administrators from within and outside the organization.

## Factors to consider

- Does ALM for low-code solutions introduce new concepts to parts of the business that hasn't been exposed to them before?

- Would a demo deployment provide an environment to allow the different [personas](../personas.md) to experiment and accelerate adoption of ALM processes?

- Who will manage and operate the ALM process?

- How will the maker community be expanded to adopt new ALM concepts?

- What steps can be put in place to adopt a self-service model to create environments and move between validation, test, and production environments.

## Demonstration deployment

To setup a demonstration deployment, you're looking to quickly install AA4PP and showcase the end-to-end process. For this scenario, the following configuration is expected:

1. Use a trial tenant and environments to demonstrate the solution.

1. Single administrator that has the following rights:
   - Azure Active Directory tenant administrator
   - Power Platform global administrator
   - Power Platform organization administrator

1. Demo non-administration maker users that will be used to show how to create an ALM process for Power Platform solutions.

1. Non-production applications

## Post install

Once you have the [Admin install](../admin-install.md) completed, makers can create [development environments](../development-environments.md) and have administrators add them to Azure DevOps and the required Azure Active Directory security group.

You'll typically use the following commands as the single administrator.

```bash
coe alm generate install -o quickstart.json
coe alm install -f quickstart.json
```

If you're prompted to create an HTTP with Azure Active Directory (AD) connection, enter 'https://graph.microsoft.com' for both the **Base Resource URL** and **Azure AD Resource URI**.

More information: [generate install](https://aka.ms/coe-cli/help/alm/generate/install)
More information: [install](https://aka.ms/coe-cli/help/alm/install)

Then add a demo user as a maker.

```bash
coe alm maker add \
  -e https://contoso-dev-alans.crm.dynamics.com \
  -o https://dev.azure.com/contoso-dev \
  -p alm-sandbox \
  -u alan-s@contoso.onmicrosoft.com
```

More information: [maker add](https://aka.ms/coe-cli/help/alm/maker/add)

Once these steps are completed, the next step is to [Set up managed solutions](../maker-setup.md) for makers.

## Enterprise deployment

In this scenario, the aim is to install AA4PP inside an enterprise tenant and the following configuration is expected.

1. Likely to have different administration teams. For example:
   - Azure Active Directory administrators.
   - Power Platform administrators. May be global administrator or environment administrators.
   - Azure DevOps administrators.
1. Configuration files for AA4PP install can be shared among different administration teams.
1. Makers have separate development environments to work on changes.
1. AA4PP Azure DevOps pipeline used to validate and promote to test and production environments.

### Azure Active Directory administrators

The tenant administration team will need to create the following:

1. Azure Active Directory application that will be used as a service principal in Azure DevOps and Power Platform environments.
1. Azure Active Directory group that will be used to grant access to makers to Azure DevOps resources, Maker Canvas application, and Microsoft Dataverse tables.
1. Grant tenant consent for Azure Active Directory application. This permission is required as the Azure DevOps pipeline uses APIs where there's no interactive user involved. As a result the tenant administrator consent is required.

To install the solution resources, the following options can be used.

#### Azure Active Directory

1. Use the CLI to install the Azure Active Directory components. For example, using the default install parameters.

    ```bash
    coe alm install -c aad
    ```

1. Using a shared configuration file and setting components array value to be [ "aad" ].

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

#### Power Platform environment

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

Manual installation using the [Create an app registration in your Azure Active Directory environment](../../../setup-almacceleratorpowerplatform.md#create-an-app-registration-in-your-azure-ad-environment).

## Multi-tenant deployment

This deployment type involves different Azure Active Directory deployments that separate development, test, and production systems. For example, the following Azure Active Directory tenants.

- contoso.onmicrosoft.com

- contoso-dev.onmicrosoft.com

Currently the AA4PP installation doesn't automatically support a multi-tenant deployment without manual updates.

### Multi-tenant deployment assumptions

The multi-tenant deployment is assumed to have one or more of the following:

1. Multiple Azure Active Directory tenants.

1. Power Platform environments for development, validation, test, and production might be in different tenants.

1. The Azure DevOps environment might be in the development tenant.

1. Users of the main tenant might use Azure business to business authentication to access the development tenant.

1. External users from outside the organization maybe invited to the development tenant and not have access to the main tenant.

### Azure Active Directory implications

To support multi-tenant deployments, the Azure Active Directory application will need to be configured to support multi-tenant authentication.

#### Learn more

1. [Tenancy in Azure Active Directory](/azure/active-directory/develop/single-and-multi-tenant-apps)

[!INCLUDE[footer-include](../../../../../includes/footer-banner.md)]
