---
title: Setup and Configure vNet Support for Power Platform
description: Learn how to setup and configure vNet support for Power Platform.
ms.date: 2/1/2024
ms.topic: overview
ms.component: pa-admin
ms.subservice: admin
author: ritesp
ms.author: ritesp
search.audienceType: admin
ms.custom: "admin-security"
---

# Set up and configure Virtual Network support for Power Platform (preview)

This article helps you enable Azure Virtual Network support for Power Platform environments.

## Prerequisites

### Prepare your tenant

- Have an Azure subscription with permissions to create a virtual network, subnet, and the enterprise policy resources.

- Download PowerShell scripts for [enterprise policies](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies).

- Install MSI, using PowerShell. For more information, see [Install PowerShell on Windows, Linux, and macOS](/powershell/scripting/install/installing-powershell).

### Give permissions

Subnet delegation requires configuration steps in both the Azure portal and in the Power Platform Admin center. Users must have the appropriate permissions in each portal.

- Azure portal: Assign users the Azure Network Administrator role.

- Power Platform Admin center: Assign users the Power Platform Administrator role.

:::image type="content" source="media/vnet-support/vnet-support-configurations.png" alt-text="Screenshot that shows the configurations for Virtual Network support in a Power Platform environment." lightbox="media/vnet-support/vnet-support-configurations.png":::

## Azure configurations

### Step 1: Register Microsoft.PowerPlatform as a resource provider

Here, you register Microsoft.PowerPlatform as a resource provider for the subscription that contains your Virtual Network.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to the specific subscription.

1. Select Resource providers.

1. Search for and select **Microsoft.PowerPlatform**.

1. Select **Register**.

:::image type="content" source="media/vnet-support/ms-pp-select.png" alt-text="Screenshot showing where to search for Microsoft.PowerPlatform and where the register button is located.":::

### Step 2: Setup Virtual Network and subnets

Users in the Azure Network Administrator role need to set up a virtual network and have at least two subnets: primary and failover. The failover subnet must be in a different region. For example, if your primary subnet is in West US, then failover must be in EAST US.

> [!NOTE]
> Power Platform doesn't support the CENTRAL US region.
>
> Find your [virtual network location](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/enterprisePolicies/SubnetInjection/ValidateVnetLocationForEnterprisePolicy.ps1).

1. Configure Virtual Network and subnets through the [Add or remove a subnet delegation in an Azure Virtual Network](/azure/virtual-network/manage-subnet-delegation?tabs=manage-subnet-delegation-portal) article.

1. Delegate the subnet to the Power Platform enterprise policies by [running a subnet injection script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#1-setup-virtual-network-for-subnet-injection) for both your primary and failover virtual network subnet.

   > [!IMPORTANT]
   > Have at least /24 [Classless Inter-Domain Routing (CIDR)](https://datatracker.ietf.org/doc/html/rfc4632), which is 251 IPs + 5 IPs reserved, in the subnet to delegate. To delegate the same subnet to multiple environments, you might need to provision more IPs within that subnet.

   > [!TIP]
   > To allow internet access within Power Platform containers, configure [Azure NAT Gateway](/azure/nat-gateway/nat-overview) for delegated subnets.

1. Review the number of IPs allocated to each subnet to consider the load of the environment. Both primary and failover subnets must have the _same number_ of available IPs.

### Step 3: Create enterprise policy

[Create subnet injection enterprise policies](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#2-create-subnet-injection-enterprise-policy), using the virtual network and subnet you delegated.

### Step 4: Grant read access to the Power Platform admin

[Grant read access](customer-managed-key.md#grant-the-power-platform-admin-privilege-to-read-enterprise-policy) to the user in the Power Platform administrator role, so they can read the enterprise policy.

### Step 5: Configure your Power Platform environment

Configure Virtual Network support in a Power Platform environment by [running the subnet injection script for your environment](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#7-set-subnet-injection-for-an-environment).

### Validation

With Virtual Network support enabled for your Power Platform environment, you can validate the connection in the Power Platform admin center.

- Go to the [Power Platform admin center](https://aka.ms/ppac)

- Select **Environments** from the navigation menu.

- Select the environment where Virtual Network support is enabled.

- Select **History** from the menu bar.

  You see the enterprise policies link with your environment is successful.

  :::image type="content" source="media/vnet-support/vnet-success-linked.png" alt-text="Screenshot showing your virtual network is linked to your environment." lightbox="media/vnet-support/vnet-success-linked.png":::

### See also

- Deploy enterprise policies with the [Microsoft.PowerPlatform/enterprisePolicies ARM template](/azure/templates/microsoft.powerplatform/enterprisepolicies?pivots=deployment-language-arm-template).

- [Quickstart: Use the Azure portal to create a virtual network](/azure/virtual-network/quick-create-portal).

- [Use plug-ins to extend business processes](/power-apps/developer/data-platform/plug-ins).
