---
title: Set up virtual network support for Power Platform
description: Learn how to set up Azure virtual network support for Power Platform.
ms.component: pa-admin
ms.topic: how-to
ms.date: 07/09/2025
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
 
# Set up virtual network support for Power Platform

Azure virtual network support for Power Platform allows you to integrate Power Platform and Dataverse components with cloud services, or services hosted inside your private enterprise network, without exposing them to the public internet. This article helps you set up virtual network support in your Power Platform environments.

## Prerequisites

- **Review your Power Platform resources**: Review your apps, flows, and plug-in code to ensure they connect over your virtual network. They shouldn't call endpoints over the public internet. If your components need to connect to public endpoints, ensure your firewall or network configuration allows for such calls. Learn more in [Considerations to enable virtual network support for Power Platform environment](vnet-support-overview.md#considerations-to-enable-virtual-network-support-for-power-platform-environment) and in the [FAQ](vnet-support-overview.md#faq).
- **Prepare your tenant and set up permissions**:
    - **Azure subscription**: Ensure you have an Azure subscription where virtual network, subnet, and enterprise policy resources will be created.
    - **Assign roles**: Ensure you have the required roles to create resources and enterprise policy.
      - In the Azure portal, assign the Azure network administrator role, such as the [network contributor role](/azure/role-based-access-control/built-in-roles#network-contributor) or an equivalent custom role.
      - In the Microsoft Entra admin center, assign the Power Platform administrator role.

## Set up the virtual network and subnets

1. **Create virtual networks**: Create [virtual networks](/azure/virtual-network/virtual-networks-overview) in Azure regions associated with your Power Platform environment. For example, if your Power Platform environment region is the United States, create your virtual networks in the **eastus** or **westus** Azure regions. For a mapping of environment region to Azure regions, [review the list of supported regions](./vnet-support-overview.md#supported-regions).

    > [!IMPORTANT]
    > - If there are two or more supported regions for the geo, such as the United States with **eastus** and  **westus**, two virtual networks in ***different*** regions are required to create the enterprise policy for business continuity and disaster recovery or failover scenarios.
    > - Be sure that the subnet you create has been appropriately sized according to [Estimating subnet size for Power Platform environments](./vnet-support-overview.md#estimating-subnet-size-for-power-platform-environments).
    
    You can [reuse existing virtual networks](./vnet-support-overview.md#can-i-use-an-existing-virtual-network-for-power-platform) if desired. Subnets on the other hand, [can't be reused in multiple enterprise policies](./vnet-support-overview.md#can-i-reuse-the-same-delegated-subnet-in-multiple-enterprise-policies).

1. Create a subnet in each of your virtual networks. Review the number of IP addresses that are allocated to each subnet and consider the load of the environment. Both subnets must have the same number of available IP addresses.

    > [!IMPORTANT]
    > - If you plan to use the same, delegated subnet for multiple Power Platform environments, you may need a larger IP address block than /24. Review subnet sizing guidance in [Estimating subnet size for Power Platform environments](vnet-support-overview.md#estimating-subnet-size-for-power-platform-environments).
    > - To allow public internet access for Power Platform components, create an [Azure NAT gateway](/azure/nat-gateway/nat-overview) for the subnets.

1. Ensure that your Azure subscription is registered for the Microsoft.PowerPlatform resource provider by running the [SetupSubscriptionForPowerPlatform.ps1 script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#how-to-run-setup-scripts).

1. Ensure your subnets don't have any resources connected to them. Delegate each subnet to Microsoft.PowerPlatform/enterprisePolicies by running the [SetupVnetForSubnetDelegation.ps1 script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#1-setup-virtual-network-for-subnet-injection) for each subnet. If you don’t want to use Powershell, you can delegate subnet while creating the virtual network in Azure portal to the service **Microsoft.PowerPlatform/enterprisePolicies**.

    Learn more at [Add or remove a subnet delegation](/azure/virtual-network/manage-subnet-delegation?tabs=manage-subnet-delegation-portal).

1. After you have created paired virtual networks, you can view them in your Azure resource group, as shown in the image below.

    :::image type="content" source="media/virtual-networks.png" alt-text="Virtual networks in your Azure resource group." lightbox="media/virtual-networks.png":::

## Creating enterprise policy

### Option 1: Using Azure ARM template
1. Ensure you have captured the necessary details, such as the following information, from the virtual networks you have created.
    - Virtual network 1 subnet name
    - Virtual network 1 resource ID 
    - Virtual network 2 subnet name 
    - Virtual network 2 resource ID

1. [Deploy a custom template](https://ms.portal.azure.com/#create/Microsoft.Template) in Azure portal. Select the **Build your own template in the editor** link and copy and paste the JSON script.

    ```JSON template
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
    ```

1. Save the template and fill in the details to create the enterprise policy.
    - **Policy name**: Name of the enterprise policy that appears in the Power Platform admin center.
    - **Location**: Select the location of the enterprise policy, corresponding with the Dataverse environment’s region:
        - '"unitedstates"'
        - '"southafrica"'
        - '"uk"'
        - '"japan"'
        - '"india"'
        - '"france"'
        - '"europe"'
        - '"germany"'
        - '"switzerland"'
        - '"canada"'
        - '"brazil"'
        - '"australia"'
        - '"asia"'
        - '"uae"'
        - '"korea"'
        - '"norway"'
        - '"singapore"'
        - '"sweden"'
    - **Virtual network 1 subnet name**: Enter the name of the subnet from the first virtual network.
    - **Virtual network 1 resource ID**: Enter the resource ID from the first virtual network.
    - **Virtual network 2 subnet name**: Enter the name of the subnet from the second virtual network.
    - **Virtual network 2 resource ID**: Enter the resource ID from the second virtual network.

1. Select **Review and create** to finalize the enterprise policy.


### Option 2: Using PowerShell
1. Run the [CreateSubnetInjectionEnterprisePolicy.ps1 script](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#2-create-subnet-injection-enterprise-policy), using the virtual networks and subnets you delegated. Remember two virtual networks in different regions are required for geos that support two or more regions.
 
1. [Grant read access](customer-managed-key.md#grant-the-power-platform-admin-privilege-to-read-enterprise-policy) for the enterprise policy to users with the Power Platform Administrator role.

## Configuring your Power Platform environment

### Option 1: Using Power Platform admin center
1.	Sign in to the Power Platform admin center.
2.	The enterprise policies link works if the Status shows Succeeded.
3.	In the command bar, select History.
4.	On the Environments page, select an environment.
5.	In the Manage Pane, select Environments.
6.	In the navigation pane, select Manage.

### Option 2: Using PowerShell
1.	Run the NewSubnetInjection.ps1 script to apply the enterprise policy to your environment.
2.	If you want to remove the enterprise policy from the environment, you can run the RevertSubnetInjection.ps1 script.

### Validating the connection
1.	Sign in to the Power Platform admin center.
2.	In the navigation pane, select Security.
3.	In the Security Pane, select Data and privacy.
4.	In the Data protection and Privacy page, select Azure virtual network policies.
5.	Select the environment you want to assign to the enterprise policy, select the policy, and save. Now the enterprise policy is linked to the environment.

## Best practices
- Ensure you choose the subnet size as per your requirement because once subnet is delegated to Power platform and later if there is a need to change the subnet range it requires Microsoft support to reflect the updated subnet changes.


