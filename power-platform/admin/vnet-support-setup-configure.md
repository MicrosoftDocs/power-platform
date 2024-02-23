---
title: Set up Virtual Network support for Power Platform
description: Learn how to set up Azure Virtual Network support for Power Platform.
ms.date: 2/15/2024
ms.topic: overview
ms.component: pa-admin
ms.subservice: admin
author: ritesp
ms.author: ritesp
search.audienceType: admin
ms.custom: "admin-security"
---

# Set up Virtual Network support for Power Platform (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

Azure Virtual Network support for Power Platform allows you to integrate Power Platform and Dataverse components with cloud services or services that are hosted inside your private enterprise network without exposing them to the public internet. This article provides instructions for setting up virtual network support in your Power Platform environments.

## Prerequisites

- Review your apps, flows, and plug-in code to make sure that they connect over your virtual network. They shouldn't call endpoints over the public internet. If they need to connect to public endpoints, make sure that your firewall or network configuration allows such calls.

- Prepare your tenant:

  - Have an Azure subscription with permissions to create a virtual network, subnet, and the enterprise policy resources.

  - Download PowerShell scripts for [enterprise policies](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies).

- [Install MSI using PowerShell](/powershell/scripting/install/installing-powershell).

- Give permissions:

  - In the Azure portal, assign users the Azure Network Administrator role.

  - In the Power Platform admin center, assign users the Power Platform Administrator role.

  :::image type="content" source="media/vnet-support/vnet-support-configurations.png" alt-text="Screenshot that shows the configurations for virtual network support in a Power Platform environment." lightbox="media/vnet-support/vnet-support-configurations.png":::<!-- EDITOR'S NOTE: If you want to use this image, you need to explain it in the body of the text to meet accessibility requirements. -->

## Set up Virtual Network support

Three tasks are involved in setting up Virtual Network support for Power Platform. First, you need to register Microsoft.PowerPlatform as a resource provider for the subscription that contains your virtual network. Then, you need to set up the virtual network and subnets. Finally, you need to create an enterprise policy and configure your Power Platform environment.

### Register Microsoft.PowerPlatform as a resource provider

1. Sign in to the [Azure portal](https://portal.azure.com/) and navigate to that subscription.

1. Select **Resource providers**.

1. Search for and select **Microsoft.PowerPlatform**.

1. Select **Register**.

    :::image type="content" source="media/vnet-support/ms-pp-select.png" alt-text="Screenshot showing where to search for Microsoft.PowerPlatform and where the register button is located.":::<!-- EDITOR'S NOTE: Please recapture this image, with "Microsoft.PowerPlatform" selected and the Register button selectable and called out. -->

### Set up the virtual network and subnets

When you set up your virtual network, you need to delegate both a primary and a failover subnet. The failover subnet must be in a different region from the primary. For example, if your primary subnet is in WEST US, then the failover must be in EAST US.

> [!NOTE]
> Power Platform doesn't support the CENTRAL US region. [Find your virtual network location](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/enterprisePolicies/SubnetInjection/ValidateVnetLocationForEnterprisePolicy.ps1).

1. [Set up the virtual network and subnets](/azure/virtual-network/manage-subnet-delegation?tabs=manage-subnet-delegation-portal).

1. Delegate the subnet to the Power Platform enterprise policies by [running a subnet injection script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#1-setup-virtual-network-for-subnet-injection) for both your primary and failover subnets.

    > [!IMPORTANT]
    > Have at least 24 [Classless Inter-Domain Routing (CIDR) addresses](https://datatracker.ietf.org/doc/html/rfc4632), which is 251 IP addresses and 5 reserved IP addresses, in the subnet you create. To delegate the same subnet to multiple environments, you might need more IP addresses in that subnet.

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

You should see that the enterprise policies link with your environment was successful.

 :::image type="content" source="media/vnet-support/vnet-success-linked.png" alt-text="Screenshot showing your virtual network is linked to your environment." lightbox="media/vnet-support/vnet-success-linked.png":::

### See also

- Deploy enterprise policies with the [Microsoft.PowerPlatform/enterprisePolicies ARM template](/azure/templates/microsoft.powerplatform/enterprisepolicies?pivots=deployment-language-arm-template)

- [Quickstart: Use the Azure portal to create a virtual network](/azure/virtual-network/quick-create-portal)

- [Use plug-ins to extend business processes](/power-apps/developer/data-platform/plug-ins)
