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

1. **Create virtual networks**: Create [virtual networks](/azure/virtual-network/virtual-networks-overview) in Azure regions associated with your Power Platform environment. For example, if your Power Platform environment region is the United States, create your virtual networks in the **eastus** or **westus** Azure regions. For a mapping of environment region to Azure regions, [review the list of supported regions](./vnet-support-overview.md#supported-regions).

    > [!IMPORTANT]
    > - If there are two or more supported regions for the geo, such as the United States with **eastus** and  **westus**, two virtual networks in ***different*** regions are required to create the enterprise policy for business continuity and disaster recovery or failover scenarios.
    > - Be sure that the subnet you create has been appropriately sized according to [Estimating subnet size for Power Platform environments](./vnet-support-overview.md#estimating-subnet-size-for-power-platform-environments).
    
    You can [reuse existing virtual networks](./vnet-support-overview.md#can-i-use-an-existing-virtual-network-for-power-platform) if desired. Subnets on the other hand, [can't be reused in multiple enterprise policies](./vnet-support-overview.md#can-i-reuse-the-same-delegated-subnet-in-multiple-enterprise-policies).

1. Create a subnet in each of your virtual networks. Review the number of IP addresses that are allocated to each subnet and consider the load of the environment. Both subnets must have the same number of available IP addresses.

    > [!IMPORTANT]
    > - If you plan to use the same delegated subnet for multiple Power Platform environments, you may need a larger IP address block than /24. Review for subnet sizing guidance [Estimating subnet size for Power Platform environments](vnet-support-overview.md#estimating-subnet-size-for-power-platform-environments).
    > - To allow public internet access for Power Platform components, create an [Azure NAT gateway](/azure/nat-gateway/nat-overview) for the subnets.

1. Ensure that your Azure subscription is registered for the Microsoft.PowerPlatform resource provider by running the [SetupSubscriptionForPowerPlatform.ps1 script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#how-to-run-setup-scripts).

1. Ensure your subnets don't have any resources connected to them. Delegate each subnet to Microsoft.PowerPlatform/enterprisePolicies by running the [SetupVnetForSubnetDelegation.ps1 script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#1-setup-virtual-network-for-subnet-injection) for each subnet. If you don’t want to use Powershell you can also delegate subnet while creating virtual network in Azure portal to the service **Microsoft.PowerPlatform/enterprisePolicies**.

    Learn more at [Add or remove a subnet delegation](/azure/virtual-network/manage-subnet-delegation?tabs=manage-subnet-delegation-portal).

1. After you have created paired virtual networks, you can see below in your azure resource group.

    :::image type="content" source="media/virtual-networks.png" alt-text="Virtual networks in your Azure resource group." lightbox="media/virtual-networks.png":::

Creating Enterprise Policy
Option 1: Using Azure ARM Template
•	Ensure you have captured the below necessary details from the virtual network you have created in prior steps.
o	Vnet One subnet name
o	Vnet One Resource ID 
o	Vnet Two subnet name 
o	Vnet Two Resource ID
•	Go to azure portal  Deploy a custom template in Azure and select the Build your own template in the editor link and copy paste the JSON script.
•	Save the template and fill in the details to create the enterprise policy.
o	Policy Name: Name of the enterprise policy that appears in the Power Platform admin center 13.
o	Location: Select the location of the enterprise policy, corresponding with the Dataverse environment’s region
	'"unitedstates"'
	'"southafrica"'
	'"uk"'
	'"japan"'
	'"india"'
	'"france"'
	'"europe"'
	'"germany"'
	'"switzerland"'
	'"canada"'
	'"brazil"'
	'"australia"'
	'"asia"'
	'"uae"'
	'"korea"'
	'"norway"'
	'"singapore"'
	'"sweden"'

o	Vnet One subnet name: Enter the name of subnet from first virtual network.
o	Vnet One Resource ID: Enter the resource ID from first virtual network.
o	Vnet Two subnet name: Enter the name of subnet from second virtual network.
o	Vnet Two Resource ID: Enter the resource ID from second virtual network.
Click "Review and create" to finalize the enterprise policy.

JSON template
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "policyName": {
            "type": "String",
            "metadata": {
                "description": "The name of the Enterprise Policy."
            }
        },
        "powerplatformEnvironmentRegion": {
            "type": "String",
            "metadata": {
                "description": "Geo of the PowerPlatform environment."
            }
        },
        "vNetOneSubnetName": {
            "type": "String"
        },
        "vNetOneResourceId": {
            "type": "String"
        },
        "vNetTwoSubnetName": {
            "defaultValue": "",
            "type": "String"
        },
        "vNetTwoResourceId": {
            "defaultValue": "",
            "type": "String"
        }
    },
    "variables": {
        "vNetOne": {
            "id": "[parameters('vNetOneResourceId')]",
            "subnet": {
                "name": "[parameters('vNetOneSubnetName')]"
            }
        },
        "vNetTwo": {
            "id": "[parameters('vNetTwoResourceId')]",
            "subnet": {
                "name": "[parameters('vNnetTwoSubnetName')]"
            }
        },
        "vNetTwoSupplied": "[and(not(empty(parameters('vNetTwoSubnetName'))), not(empty(parameters('vNetTwoResourceId'))))]"
    },
    "resources": [
        {
            "type": "Microsoft.PowerPlatform/enterprisePolicies",
            "apiVersion": "2020-10-30",
            "name": "[parameters('policyName')]",
            "location": "[parameters('powerplatformEnvironmentRegion')]",
            "kind": "NetworkInjection",
            "properties": {
                "networkInjection": {
                    "virtualNetworks": "[if(variables('vNetTwoSupplied'), concat(array(variables('vNetOne')), array(variables('vNetTwo'))), array(variables('vNetOne')))]"
                }
            }
        }
    ]
}

