---
title: Set up Virtual Network support for Power Platform
description: Learn how to set up Azure Virtual Network support for Power Platform.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/24/2025
author: faix 
ms.author: osfaixat 
ms.reviewer: sericks
ms.subservice: admin
ms.custom: 
  - admin-security
  - NewPPAC
search.audienceType: 
  - admin
---
 
# Set up Virtual Network support for Power Platform

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Azure Virtual Network support for Power Platform allows you to integrate Power Platform and Dataverse components with cloud services, or services hosted inside your private enterprise network, without exposing them to the public internet. This article helps you set up virtual network support in your Power Platform environments.

## Prerequisites

> [!NOTE]
> To enable Virtual Network support for Power Platform, environments must be [Managed Environments](managed-environment-overview.md).

- Review your apps, flows, and plug-in code to ensure they connect over your virtual network—they shouldn't call endpoints over the public internet. If your components need to connect to public endpoints, ensure your firewall or network configuration allows such calls. More information [here](./vnet-support-overview.md#considerations-to-enable-virtual-network-support-for-power-platform-environment) and in [the FAQ](./vnet-support-overview.md#can-i-make-internet-bound-calls-from-plug-ins-or-connectors-after-my-environment-is-subnet-delegated)

- Prepare your tenant, setup permissions:
  - Have an Azure subscription where virtual network, subnet, and enterprise policy resources will be created
  - In the Azure portal, assign the Azure Network Administrator role (ie. [network contributor role](/azure/role-based-access-control/built-in-roles#network-contributor) or equivalent custom role).
  - In the Microsoft Entra admin center, assign the [Power Platform Administrator role](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator).

- Prepare to use PowerShell
  - [Install PowerShell](/powershell/scripting/install/installing-powershell)
  - Download [PowerShell scripts for enterprise policies](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies)
  - Run the ["install modules and setup subscription" scripts](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/enterprisePolicies/README.md#how-to-run-setup-scripts)

The following diagram depicts the functions of the roles in the setup process for virtual network support in a Power Platform environment:

:::image type="content" source="media/vnet-support/vnet-support-configurations.png" alt-text="Screenshot that shows the configurations for virtual network support in a Power Platform environment." lightbox="media/vnet-support/vnet-support-configurations.png":::

## Set up Virtual Network support

1. [Set up the virtual network and subnets](#set-up-the-virtual-network-and-subnets).
1. [Create the enterprise policy](#create-the-enterprise-policy).
1. [Configure your Power Platform environment](#configure-your-power-platform-environment).

### Set up the virtual network and subnets

> [!NOTE]
> Power Platform doesn't support the CENTRAL US region. [See list of supported regions](./vnet-support-overview.md#supported-regions).

1. Create [virtual network(s)](/azure/virtual-network/virtual-networks-overview) in Azure region(s) associated with your Power Platform environment. For example, if your Power Platform environment region is United States, your virtual network(s) should be created in the **eastus**/**westus** Azure regions. For a mapping of environment region to Azure regions, [see list of supported regions](./vnet-support-overview.md#supported-regions).

    > [!IMPORTANT]
    > If there are 2+ supported regions for the geo (ex. United States with eastus, westus). **2** virtual networks in ***different*** regions are required to create the enterprise policy (needed for BCDR/failover scenarios)
    * you can [reuse existing virtual networks](./vnet-support-overview.md#can-i-use-an-existing-virtual-network-for-power-platform) if desired

1. Create a subnet in each of your virtual networks. Review the number of IP addresses that are allocated to each subnet and consider the load of the environment. Both subnets must have the same number of available IP addresses.

    > [!IMPORTANT]
    > Be sure that the subnet you create has at least a /24 Classless Inter-Domain Routing (CIDR) address block, which equates to 251 IP addresses, including five reserved IP addresses. If you plan to use the same delegated subnet for multiple Power Platform environments, you may need a larger IP address block than /24.

    To allow public internet access for Power Platform components, create an [Azure NAT gateway](/azure/nat-gateway/nat-overview) for the subnets.

1. Ensure your Azure subscription is registered for the `Microsoft.PowerPlatform` resource provider by running the ["setup subscription for power platform" script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#how-to-run-setup-scripts).

1. Ensure your subnets don't have any resources connected to them, then delegate each subnet to `Microsoft.PowerPlatform/enterprisePolicies` by running the ["setup virtual network for subnet injection" script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#1-setup-virtual-network-for-subnet-injection) for each subnet.
    * More information on subnet delegation [here](/azure/virtual-network/manage-subnet-delegation?tabs=manage-subnet-delegation-portal)

### Create the enterprise policy

1. [Create a subnet injection enterprise policy](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#2-create-subnet-injection-enterprise-policy), using the virtual network(s) and subnet(s) you delegated. Remember two virtual networks in different regions are required for geos that support 2+ regions.
    > [!IMPORTANT]
    > If you wish to delete the virtual network/subnet (or getting errors like `InUseSubnetCannotBeDeleted`, `SubnetMissingRequiredDelegation`), you **will have to delete the enterprise policy** if it exists. You can delete the enterprise policy with the following command:
    > ```powershell
    > Remove-AzResource -ResourceId $policyArmId -Force
    > ```
    > Various PowerShell scripts are available to [get the enterprise policy](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/enterprisePolicies/README.md#4-get-subnet-injection-enterprise-policies-in-subscription) (for the ARM resource ID)

1. [Grant read access](customer-managed-key.md#grant-the-power-platform-admin-privilege-to-read-enterprise-policy) for the enterprise policy to the user(s) with the Power Platform Administrator role.

### Configure your Power Platform environment

1. Run the ["set subnet injection for an environment" script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#7-set-subnet-injection-for-an-environment) to apply the enterprise policy to your environment.

    * In the future, if removing the enterprise policy from the environment you can run the ["remove subnet injection from an environment" script](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/enterprisePolicies/README.md#9-remove-subnet-injection-from-an-environment)

### Validate the connection

> [!NOTE]
> The ["Enterprise Policies"](https://admin.powerplatform.microsoft.com/security/dataprotection/cmk) page in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) **does not** display "Subnet injection" type enterprise policies. Check the environment history as described in this section, or use the [PowerShell scripts](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/enterprisePolicies/README.md#8-get-subnet-injection-for-an-environment) to view details of these enterprise policies.

## [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **History**.
1. The **enterprise policies link** works if the **Status** shows **Succeeded**.

## [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **History**.
1. The **enterprise policies link** works if the **Status** shows **Succeeded**.

---

### Related content

- Deploy enterprise policies with the [Microsoft.PowerPlatform/enterprisePolicies ARM template](/azure/templates/microsoft.powerplatform/enterprisepolicies?pivots=deployment-language-arm-template)
- [Quickstart: Use the Azure portal to create a virtual network](/azure/virtual-network/quick-create-portal)
- [Use plug-ins to extend business processes](/power-apps/developer/data-platform/plug-ins)
