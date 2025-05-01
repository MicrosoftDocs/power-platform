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

The following steps help you set up your virtual network.

1. [Set up the virtual network and subnets](#set-up-the-virtual-network-and-subnets).

1. [Create the enterprise policy](#create-the-enterprise-policy).

1. [Configure your Power Platform environment](#configure-your-power-platform-environment).

### Set up the virtual network and subnets

When you set up your virtual network, you need to delegate a subnet to the associated Azure regions of your Power Platform environment. For example, if your Power Platform environment region is United States, your subnets should be created in the **eastus** and **westus** Azure regions. For a list of supported regions, see [Supported regions](./vnet-support-overview.md#supported-regions).

> [!NOTE]
> Power Platform doesn't support the CENTRAL US region. [Find your virtual network location](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/enterprisePolicies/SubnetInjection/ValidateVnetLocationForEnterprisePolicy.ps1).

1. [Set up the virtual network and subnets](/azure/virtual-network/manage-subnet-delegation?tabs=manage-subnet-delegation-portal).

   > [!IMPORTANT]
   > Be sure that the subnet you create has at least a /24 Classless Inter-Domain Routing (CIDR) address block, which equates to 251 IP addresses, including five reserved IP addresses. If you plan to use the same delegated subnet for multiple Power Platform environments, you may need a larger IP address block than /24.

   To allow internet access within Power Platform containers, create an [Azure NAT gateway](/azure/nat-gateway/nat-overview) for the delegated subnets.

1. Ensure that you have set up your subscription for the [Microsoft.PowerPlatform resource provider](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#how-to-run-setup-scripts).

1. Delegate subnets that don't have any resources connected to them. Delegate the subnet to the Power Platform enterprise policies by running a [subnet injection script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#1-setup-virtual-network-for-subnet-injection) for both subnets.

1. Review the number of IP addresses that are allocated to each subnet and consider the load of the environment. Both subnets must have the same number of available IP addresses.

### Create the enterprise policy

1. [Create subnet injection enterprise policies](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#2-create-subnet-injection-enterprise-policy), using the virtual network and subnet you delegated.

1. [Grant read access](customer-managed-key.md#grant-the-power-platform-admin-privilege-to-read-enterprise-policy) to the Power Platform Administrator role.

### Configure your Power Platform environment

[Run the subnet injection script for your environment](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#7-set-subnet-injection-for-an-environment).

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
