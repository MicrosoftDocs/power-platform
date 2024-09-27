---
title: Set up Virtual Network support for Power Platform
description: Learn how to set up Azure Virtual Network support for Power Platform.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/27/2024
author: ritesp 
ms.author: ritesp 
ms.reviewer: sericks
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
 
# Set up Virtual Network support for Power Platform

Azure Virtual Network support for Power Platform allows you to integrate Power Platform and Dataverse components with cloud services, or services hosted inside your private enterprise network, without exposing them to the public internet. This article helps you set up virtual network support in your Power Platform environments.

## Prerequisites

- Review your apps, flows, and plug-in code to ensure they connect over your virtual network—they shouldn't call endpoints over the public internet. If your components need to connect to public endpoints, ensure your firewall or network configuration allows such calls.
  
> [!NOTE]
> To enable Virtual Network support for Power Platform, environments must be [Managed Environments](managed-environment-overview.md).

- Prepare your tenant:

  - Have an Azure subscription with permissions to create a virtual network, subnet, and the enterprise policy resources.

  - Download PowerShell scripts for [enterprise policies](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies).

- [Install MSI using PowerShell](/powershell/scripting/install/installing-powershell).

- Give permissions:

  - In the Azure portal, assign users the Azure Network Administrator role.

  - In the Power Platform admin center, assign users the Power Platform Administrator role.

The following diagram shows virtual network support in a Power Platform environment.

:::image type="content" source="media/vnet-support/vnet-support-configurations.png" alt-text="Screenshot that shows the configurations for virtual network support in a Power Platform environment." lightbox="media/vnet-support/vnet-support-configurations.png":::

## Set up Virtual Network support

The following four steps help you set up your virtual network.

1. [Register Microsoft.PowerPlatform as a resource provider](#register-microsoftpowerplatform-as-a-resource-provider) for the subscription that contains your virtual network.

1. [Set up the virtual network and subnets](#set-up-the-virtual-network-and-subnets).

1. [Create the enterprise policy](#create-the-enterprise-policy).

1. [Configure your Power Platform environment](#configure-your-power-platform-environment).

### Register Microsoft.PowerPlatform as a resource provider

1. Sign in to the [Azure portal](https://portal.azure.com/) and navigate to your subscription.

1. Select **Resource providers**.

1. Search for and select **Microsoft.PowerPlatform**.

1. Select **Register**.

More information: [Register resource provider](/azure/azure-resource-manager/management/resource-providers-and-types#register-resource-provider-1)

### Set up the virtual network and subnets

When you set up your virtual network, you need to delegate both a primary and a failover subnet. The failover subnet must be in a different region from the primary. For example, if your primary subnet is in WEST US, then the failover must be in EAST US.

> [!NOTE]
> Power Platform doesn't support the CENTRAL US region. [Find your virtual network location](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/enterprisePolicies/SubnetInjection/ValidateVnetLocationForEnterprisePolicy.ps1).

1. [Set up the virtual network and subnets](/azure/virtual-network/manage-subnet-delegation?tabs=manage-subnet-delegation-portal).

1. You need to delegate subnets that don't have any resources connected to them. Delegate the subnet to the Power Platform enterprise policies by running a [subnet injection script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#1-setup-virtual-network-for-subnet-injection) for both your primary and failover subnets.

   > [!IMPORTANT]
   > Be sure that the subnet you create has at least a /24 Classless Inter-Domain Routing (CIDR) address block, which equates to 251 IP addresses, including 5 reserved IP addresses. If you plan to use the same delegated subnet for multiple Power Platform environments, you may need a larger IP address block than /24.

   To allow internet access within Power Platform containers, create an [Azure NAT gateway](/azure/nat-gateway/nat-overview) for the delegated subnets.

1. Review the number of IP addresses that are allocated to each subnet and consider the load of the environment. Both primary and failover subnets must have the same number of available IP addresses.

### Create the enterprise policy

1. [Create subnet injection enterprise policies](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#2-create-subnet-injection-enterprise-policy), using the virtual network and subnet you delegated.

1. [Grant read access](customer-managed-key.md#grant-the-power-platform-admin-privilege-to-read-enterprise-policy) to the Power Platform Administrator role.

### Configure your Power Platform environment

[Run the subnet injection script for your environment](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#7-set-subnet-injection-for-an-environment).

### Validate the connection

1. Go to the [Power Platform admin center](https://aka.ms/ppac) and select the environment where you set up virtual network support.

1. Select **History**.

   You should see that the enterprise policies link with your environment is successful if the **Status** says **Succeeded**.

    :::image type="content" source="media/vnet-support/vnet-success-linked.png" alt-text="Screenshot showing your virtual network is linked to your environment." lightbox="media/vnet-support/vnet-success-linked.png":::

### See also

- Deploy enterprise policies with the [Microsoft.PowerPlatform/enterprisePolicies ARM template](/azure/templates/microsoft.powerplatform/enterprisepolicies?pivots=deployment-language-arm-template)

- [Quickstart: Use the Azure portal to create a virtual network](/azure/virtual-network/quick-create-portal)

- [Use plug-ins to extend business processes](/power-apps/developer/data-platform/plug-ins)
