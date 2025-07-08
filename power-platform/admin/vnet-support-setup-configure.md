---
title: Set up Virtual Network support for Power Platform
description: Learn how to set up Azure Virtual Network support for Power Platform.
ms.component: pa-admin
ms.topic: how-to
ms.date: 07/08/2025
author: faix 
ms.author: osfaixat 
ms.reviewer: sericks
ms.subservice: admin
ms.custom: 
  - admin-security
  - NewPPAC
search.audienceType: 
  - admin
contributors:
  - matapg007
  - wifun
---
 
# Set up Virtual Network support for Power Platform

Azure Virtual Network support for Power Platform allows you to integrate Power Platform and Dataverse components with cloud services, or services hosted inside your private enterprise network, without exposing them to the public internet. This article helps you set up virtual network support in your Power Platform environments.

## Prerequisites

- **Review your Power Platform resources**: Review your apps, flows, and plug-in code to ensure they connect over your virtual network. They shouldn't call endpoints over the public internet. If your components need to connect to public endpoints, ensure your firewall or network configuration allows for such calls. Learn more in [Considerations to enable Virtual Network support for Power Platform environment](vnet-support-overview.md#considerations-to-enable-virtual-network-support-for-power-platform-environment) and in the [FAQ](vnet-support-overview.md#faq).
- **Prepare your tenant and set up permissions**:
    - **Azure subscription**: Ensure you have an Azure subscription where virtual network, subnet, and enterprise policy resources will be created.
    - **Assign roles**: Ensure you have the required roles to create resources and enterprise policy.
      - In the Azure portal, assign the Azure Network Administrator role, such as the [network contributor role](/azure/role-based-access-control/built-in-roles#network-contributor) or an equivalent custom role.
      - In the Microsoft Entra admin center, assign the Power Platform Administrator role.

## Set up the virtual network and subnets

1. **Create virtual networks**: Create [virtual networks](/azure/virtual-network/virtual-networks-overview) in Azure regions associated with your Power Platform environment. For example, if your Power Platform environment region is in the United States, your virtual networks should be created in the **eastus** or **westus** Azure regions. For a mapping of environment region to Azure regions, [review the list of supported regions](./vnet-support-overview.md#supported-regions).

    > [!IMPORTANT]
    > - If there are two or more supported regions for the geo, such as the United States with **eastus** and  **westus**, two virtual networks in ***different*** regions are required to create the enterprise policy for [business continuity and disaster recovery] or failover scenarios.
    > - Be sure that the subnet you create has been appropriately sized according to [Estimating subnet size for Power Platform environments](./vnet-support-overview.md#estimating-subnet-size-for-power-platform-environments).
    
    You can [reuse existing virtual networks](./vnet-support-overview.md#can-i-use-an-existing-virtual-network-for-power-platform) if desired. Subnets on the other hand, [can't be reused in multiple enterprise policies](./vnet-support-overview.md#can-i-reuse-the-same-delegated-subnet-in-multiple-enterprise-policies).

1. Create a subnet in each of your virtual networks. Review the number of IP addresses that are allocated to each subnet and consider the load of the environment. Both subnets must have the same number of available IP addresses.

    > [!IMPORTANT]
    > Be sure that the subnet you create has at least a /24 Classless Inter-Domain Routing (CIDR) address block, which equates to 251 IP addresses, including five reserved IP addresses. If you plan to use the same delegated subnet for multiple Power Platform environments, you may need a larger IP address block than /24.

    To allow public internet access for Power Platform components, create an [Azure NAT gateway](/azure/nat-gateway/nat-overview) for the subnets.

1. Ensure that your Azure subscription is registered for the Microsoft.PowerPlatform resource provider by running the [SetupSubscriptionForPowerPlatform.ps1 script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#how-to-run-setup-scripts).

1. Ensure your subnets don't have any resources connected to them. Delegate each subnet to Microsoft.PowerPlatform/enterprisePolicies by running the [SetupVnetForSubnetDelegation.ps1 script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#1-setup-virtual-network-for-subnet-injection) for each subnet.

    Learn more at [Add or remove a subnet delegation](/azure/virtual-network/manage-subnet-delegation?tabs=manage-subnet-delegation-portal).

### Create the enterprise policy

1. Run the [CreateSubnetInjectionEnterprisePolicy.ps1 script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#2-create-subnet-injection-enterprise-policy), using the virtual networks and subnets you delegated. Remember two virtual networks in different regions are required for geos that support two or more regions.
   
    > [!IMPORTANT]
    > If you wish to delete the virtual network or subnet, or are getting errors like `InUseSubnetCannotBeDeleted` and `SubnetMissingRequiredDelegation`, you **must delete the enterprise policy** if it exists. You can delete the enterprise policy with the following command.
    >
    > ```powershell
    > Remove-AzResource -ResourceId $policyArmId -Force
    > ```
    >
    > Various PowerShell scripts are available to [get the enterprise policy](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/enterprisePolicies/README.md#4-get-subnet-injection-enterprise-policies-in-subscription) for the ARM resource ID.

1. [Grant read access](customer-managed-key.md#grant-the-power-platform-admin-privilege-to-read-enterprise-policy) for the enterprise policy to users with the Power Platform Administrator role.

### Configure your Power Platform environment

Run the [NewSubnetInjection.ps1 script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#7-set-subnet-injection-for-an-environment) to apply the enterprise policy to your environment.

> [!Note]
> If you want to remove the enterprise policy from the environment, you can run the [RevertSubnetInjection.ps1 script](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/enterprisePolicies/README.md#9-remove-subnet-injection-from-an-environment).

### Validate the connection

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
