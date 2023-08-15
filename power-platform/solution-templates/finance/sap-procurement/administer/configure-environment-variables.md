---
title: Configure environment variables for SAP and Power Platform SAP solutions
description: Set up environment variables for SAP and Microsoft Power Platform SAP solutions.
author: jongilman88
ms.author: jongilman
contributors:
  - EllenWehrle
  - robinsonshields
  - microsoft-george
  - tverhasselt
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: install-set-up-deploy
ms.date: 06/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Configure environment variables

Environment variables are solution components that store parameter keys and values, which then serve as input to various other application objects, such as Power Automate flows and Power Apps. Enterprise systems often have multiple connection parameters, and manually entering the parameters into each component can be redundant and time-consuming.

The SAP Procurement solution template uses environment variables within cloud flows to centrally manage and set key properties on the [SAP ERP connector](/connectors/saperp/) flow action steps.

As a best practice, use environment variables as part of your [application lifecycle management (ALM)](/power-platform/alm/overview-alm) strategy. Set both default and current environment values as you migrate and manage the various solution files across your environments.

Learn more: [Use environment variables in Power Automate solution cloud flows](/power-apps/maker/data-platform/environmentvariables#use-environment-variables-in-power-automate-solution-cloud-flows)

## Configure environment variables at time of installation

The _SAP Base_ solution template contains five environment variables that set the SAP connection parameters used in the cloud flows.

When you install the SAP Procurement solution template, you'll be prompted to enter values for four of the five environment variables that don't have a default value. You can configure the environment variables to your local needs.

Once set up, the environment variables can be edited as you build your own solutions in the development environment.

The table lists, describes, and provides the available default value for the five environment variables that you need to set the SAP connection parameters.

| Syntax | Description | Default Value |
| ----------- | ----------- | ----------- |
| SAP Application Server | JSON string that contains system parameters, host, system number, client, and more. Refer to the [SAP property guidance](/connectors/saperp/#sap-system-property-guidance).  |  |
| SAP Client ID | The SAP client ID identifies your connection to the SAP system. The SAP backend client (or 'Mandant') into which to log in. It's a number ranging from 000 to 999. Used separately in IDoc transactions. |  |
| SAP Count of Rows To Read | Sets the maximum number of records to be returned on any search query and helps to alleviate performance concerns.  | 1000 |
| SAP SPRAS | There are times when you will need to specify a language on specific transactions, such as _ReadMaterial_. We have created an environmental variable called SAP SPRAS that allows you to easily control the value in one place according to your localization requirements. |  |
| SAP System ID | The SAP system's three-letter system ID (Mandatory if connection type is _Message Server_ and a message server service isn't present). Used separately in IDoc transactions. | |

More information:

- [Customizing solutions](customize-solutions.md)
- [Create an environment variable in a solution](/power-apps/maker/data-platform/environmentvariables#create-an-environment-variable-in-a-solution) using the [SAP property guidance](/connectors/saperp/#sap-system-property-guidance) or for any local environment variable need.

## Reuse the environment variable in a flow

The environment variables you set up are now available in a flow's dynamic content selector. Go into an SAP Procurement solution template cloud flow to select the environment variables to reuse in [SAP actions](/connectors/sap/#actions).

> [!IMPORTANT]
>
> Any time an environment variable is updated in a cloud flow, the updated values are not automatically used the next time the flow runs. The updated flow must be _deactivated_ and _reactivated_ for the updated values to take effect.

1. [Edit a solution-aware cloud flow.](/power-automate/edit-solution-aware-flow)
1. Select **Add dynamic content** to open the dynamic content selector in a flow _action_. All environment variables that you have access to are listed.
1. Select the desired environment variable.
1. Select **Save**.

    :::image type="content" source="media/configure-environment-variables/use-env-var-in-connector-actions.png" alt-text="Reuse environment variables in the SAP ERP connector's actions":::

## Next steps

- [Configure security groups](configure-security-groups.md)
- [Apply seed data](apply-seed-data.md)

### See also

- [Overview](../overview.md)
- [Get started](get-started.md)
