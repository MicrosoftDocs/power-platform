---
title: Set up virtual network support for Power Platform
description: Learn how to set up Azure virtual network support for Power Platform.
ms.component: pa-admin
ms.topic: how-to
ms.date: 09/15/2025
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

Azure virtual network support for Power Platform lets you integrate Power Platform and Dataverse components with cloud services or services hosted inside your private enterprise network without exposing them to the public internet. This article explains how to set up virtual network support in your Power Platform environments.

## Prerequisites

> [!Note]
> To enable virtual network support for Power Platform, environments must be [Managed Environments](managed-environment-overview.md).

- **Review your Power Platform resources**: Check your apps, flows, and plug-in code to ensure they connect over your virtual network. They shouldn't call endpoints over the public internet. If your components need to connect to public endpoints, ensure your firewall or network configuration lets such calls. Learn more in [Considerations to enable virtual network support for Power Platform environment](vnet-support-overview.md#considerations-to-enable-virtual-network-support-for-power-platform-environment) and in the [FAQ](vnet-support-overview.md#faq).

- **Prepare your tenant and set up permissions**:
    - **Azure subscription**: Make sure you have an Azure subscription where virtual network, subnet, and enterprise policy resources are created.
    - **Assign roles**: Make sure you have the required roles to create resources and enterprise policy.
      - In the Azure portal, assign the Azure network administrator role, such as the [network contributor role](/azure/role-based-access-control/built-in-roles#network-contributor) or an equivalent custom role.
      - In the Microsoft Entra admin center, assign the Power Platform administrator role.

- **Prepare to use PowerShell**:
  - Use Windows PowerShell or [Install PowerShell Core](/powershell/scripting/install/installing-powershell).
  - Clone the GitHub repository to get the [PowerShell scripts for enterprise policies](https://github.com/microsoft/PowerPlatform-EnterprisePolicies).
  - Run the ["install modules and setup subscription" scripts](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/README.md#how-to-run-setup-scripts).

The following diagram shows the functions of the roles in the setup process for virtual network support in a Power Platform environment.

:::image type="content" source="media/vnet-support/vnet-support-configurations.png" alt-text="Screenshot of the configurations for virtual network support in a Power Platform environment." lightbox="media/vnet-support/vnet-support-configurations.png":::

## Set up Virtual Network support

1. [Set up the virtual network and subnets](#set-up-the-virtual-network-and-subnets).
1. [Create the enterprise policy](#create-the-enterprise-policy).
1. [Configure your Power Platform environment](#configure-your-power-platform-environment).

### Set up the virtual network and subnets

> [!NOTE]
> Power Platform isn't supported in the Central US region. [Review the list of supported regions](./vnet-support-overview.md#supported-regions).

1. Create [virtual networks](/azure/virtual-network/virtual-networks-overview) in Azure regions associated with your Power Platform environment. For example, if your Power Platform environment region is United States, your virtual networks should be created in the **eastus** and **westus** Azure regions. For a mapping of environment region to Azure regions, [review the list of supported regions](./vnet-support-overview.md#supported-regions).

    > [!IMPORTANT]
    > - If there are two or more supported regions for the geo, such as the United States with **eastus** and  **westus**, two virtual networks in ***different*** regions are required to create the enterprise policy for business continuity and disaster recovery or failover scenarios.
    > - Be sure that the subnet you create has been appropriately sized according to [Estimating subnet size for Power Platform environments](./vnet-support-overview.md#estimating-subnet-size-for-power-platform-environments).
    
    You can [reuse existing virtual networks](./vnet-support-overview.md#can-i-use-an-existing-virtual-network-for-power-platform), if desired. Subnets [can't be reused in multiple enterprise policies](./vnet-support-overview.md#can-i-reuse-the-same-delegated-subnet-in-multiple-enterprise-policies).

1. Create a subnet in each of your virtual networks. Review the number of IP addresses that are allocated to each subnet and consider the load of the environment. Both subnets must have the same number of available IP addresses.

    > [!IMPORTANT]
    > - If you plan to use the same, delegated subnet for multiple Power Platform environments, you may need a larger IP address block than /24. Review subnet sizing guidance in [Estimating subnet size for Power Platform environments](vnet-support-overview.md#estimating-subnet-size-for-power-platform-environments).
    > - To allow public internet access for Power Platform components, create an [Azure NAT gateway](/azure/nat-gateway/nat-overview) for the subnets.

1. Ensure your Azure subscription is registered for the Microsoft.PowerPlatform resource provider by running the [SetupSubscriptionForPowerPlatform.ps1 script](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/README.md#how-to-run-setup-scripts).

1. Ensure your subnets don't have any resources connected to them. Delegate each subnet to Microsoft.PowerPlatform/enterprisePolicies by running the [SetupVnetForSubnetDelegation.ps1 script](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/README.md#1-setup-virtual-network-for-subnet-injection) for each subnet. If you don't want to use PowerShell, you can delegate the subnet while creating the virtual network in Azure portal to the service **Microsoft.PowerPlatform/enterprisePolicies**.

    Learn more at [Add or remove a subnet delegation](/azure/virtual-network/manage-subnet-delegation?tabs=manage-subnet-delegation-portal).

1. After you have created paired virtual networks, you can view them in your Azure resource group, as shown in the following image.

    :::image type="content" source="media/virtual-networks.png" alt-text="Screenshot of virtual networks in your Azure resource group." lightbox="media/virtual-networks.png":::

## Create the enterprise policy

### Option 1: Use the Azure ARM template
1. Ensure you have captured the necessary details, such as the following information, from the virtual networks you have created.
   
    - VnetOneSubnetName
    - VnetOneResourceId 
    - VnetTwoSubnetName 
    - VnetTwoResourceId

1. [Deploy a custom template](https://ms.portal.azure.com/#create/Microsoft.Template) in Azure portal. Select the **Build your own template in the editor** link and copy and paste the following JSON script.

    ```JSON template
    {
        "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
        "contentVersion": "1.0.0.0",
        "parameters": {
            "policyName": {
                "type": "string",
                "metadata": {
                    "description": "The name of the Enterprise Policy."
                }
            },
            "powerplatformEnvironmentRegion": {
                "type": "string",
                "metadata": {
                    "description": "Geo of the PowerPlatform environment."
                }
            },
            "vNetOneSubnetName": {
                "type": "string"
            },
            "vNetOneResourceId": {
                "type": "string",
          			"metadata": {
                    "description": "Fully qualified name, such as /subscription/{subscriptionid}/..."
                }
            },
            "vNetTwoSubnetName": {
                "defaultValue": "",
                "type": "string"
            },
            "vNetTwoResourceId": {
                "defaultValue": "",
                "type": "string",
          			"metadata": {
                    "description": "Fully qualified name, such as /subscription/{subscriptionid}/..."
                }
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
                    "name": "[parameters('vNetTwoSubnetName')]"
                }
            },
            "vNetTwoSupplied": "[and(not(empty(parameters('vNetTwoSubnetName'))), not(empty(parameters('vNetTwoResourceId'))))]"
        },
        "resources": [
            {
                "type": "Microsoft.PowerPlatform/enterprisePolicies",
                "apiVersion": "2020-10-30-preview",
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

1. Save the template and fill in the details to create the enterprise policy, which includes the following inforamtion:
    - **Policy name**: Name of the enterprise policy that appears in the Power Platform admin center.
    - **Location**: Select the location of the enterprise policy, corresponding with the Dataverse environment’s region:
        - unitedstates
        - southafrica
        - uk
        - japan
        - india
        - france
        - europe
        - germany
        - switzerland
        - canada
        - brazil
        - australia
        - asia
        - uae
        - korea
        - norway
        - singapore
        - sweden
    - **VnetOneSubnetName**: Enter the name of the subnet from the first virtual network.
    - **VnetOneResourceId**: Enter the resource ID from the first virtual network.
    - **VnetTwoSubnetName**: Enter the name of the subnet from the second virtual network.
    - **VnetTwoResourceId**: Enter the resource ID from the second virtual network. It should match the strings from Json script, for example: vNetOneResourceId, vNetOneSubnetName

1. Select **Review + create** to finalize the enterprise policy.

    :::image type="content" source="media/virtual-networks-json-script.png" alt-text="Screenshot of selecting Review and create to finalize the enterprise policy." lightbox="media/virtual-networks-json-script.png":::

### Option 2: Use PowerShell
1. Run the [CreateSubnetInjectionEnterprisePolicy.ps1 script](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/README.md#2-create-subnet-injection-enterprise-policy), using the virtual networks and subnets you delegated. Remember two virtual networks in different regions are required for geos that support two or more regions.

    > [!IMPORTANT]
    > If you wish to delete the virtual network or subnet, or are getting errors like `InUseSubnetCannotBeDeleted` and `SubnetMissingRequiredDelegation`, you **must delete the enterprise policy** if it exists. You can delete the enterprise policy with the following command.
    >
    > ```powershell
    > Remove-AzResource -ResourceId $policyArmId -Force
    > ```
    >
    > Various PowerShell scripts are available to [get the enterprise policy](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/README.md#4-get-subnet-injection-enterprise-policies-in-subscription) for the ARM resource ID.

1. [Grant read access](customer-managed-key.md#grant-the-power-platform-admin-privilege-to-read-enterprise-policy) for the enterprise policy to users with the Power Platform administrator role.

## Configure your Power Platform environment

### Prerequisites

In the following procedures, you assign your environment to an enterprise policy. You're environment must be a [managed environment](managed-environment-overview.md) to assign an enterprise policy to it.

### Option 1: Use the Power Platform admin center
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1.	In the navigation pane, select **Security**.
1.	In the **Security** pane, select **Data and privacy**.
1.	In the **Data protection and privacy** page, select **Azure Virtual Network policies**. The **Virtual Network policies** pane is displayed.
1.	Select the environment you want to assign to the enterprise policy, select the policy, and select **Save**. Now the enterprise policy is linked to the environment.

### Option 2: Use PowerShell
1.	Run the [NewSubnetInjection.ps1](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/README.md#7-set-subnet-injection-for-an-environment) script to apply the enterprise policy to your environment.
1.	If you want to remove the enterprise policy from the environment, you can run the [RevertSubnetInjection.ps1](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/README.md#9-remove-subnet-injection-from-an-environment) script.

### Validate the connection
## [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **History**.
1. Verify that the **Status** shows **Succeeded**. 

## [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **History**.
1. Verify that the **Status** shows **Succeeded**.
---

## Best practices
Ensure you choose the subnet size as per your requirement. After the subnet is delegated to Power Platform&mdash;and if later, there's a need to change the subnet range&mdash;it requires Microsoft Support to reflect the updated subnet changes.

### Related content

- Deploy enterprise policies with the [Microsoft.PowerPlatform/enterprisePolicies ARM template](/azure/templates/microsoft.powerplatform/enterprisepolicies?pivots=deployment-language-arm-template)
- [Quickstart: Use the Azure portal to create a virtual network](/azure/virtual-network/quick-create-portal)
- [Use plug-ins to extend business processes](/power-apps/developer/data-platform/plug-ins)
- [Troubleshoot Virtual Network issues](/troubleshoot/power-platform/power-platform-administration/troubleshoot-virtual-network-power-platform)


