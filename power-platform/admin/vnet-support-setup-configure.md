---
title: Set up virtual network support for Power Platform
description: Learn how to set up Azure virtual network support for Power Platform.
ms.component: pa-admin
ms.topic: how-to
ms.date: 02/09/2026
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
zone_pivot_group_filename: admin/zone-pivot-groups.json
zone_pivot_groups: subnet-setup
---

# Set up virtual network support for Power Platform

> [!NOTE]
> The [Power Platform Virtual Network](https://engage.cloud.microsoft/main/org/microsoft.com/groups/eyJfdHlwZSI6Ikdyb3VwIiwiaWQiOiIyNDY2NTkxNzAzMDQifQ) community on Microsoft Viva Engage is available. You can post any questions or feedback that you have about this functionality. You can join by filling out a request through the following form: [Request access to Finance and Operations Viva Engage Community](https://forms.office.com/r/qe94aGXWgp).

Azure virtual network support for Power Platform lets you integrate Power Platform and Dataverse components with cloud services or services hosted inside your private enterprise network without exposing them to the public internet. This article explains how to set up virtual network support in your Power Platform environments.

## Prerequisites

> [!NOTE]
> To enable virtual network support for Power Platform, environments must be [Managed Environments](managed-environment-overview.md).

- **Review your Power Platform resources**: Check your apps, flows, and plug-in code to ensure they connect over your virtual network. They shouldn't call endpoints over the public internet. If your components need to connect to public endpoints, ensure your firewall or network configuration lets such calls. Learn more in [Considerations to enable virtual network support for Power Platform environment](vnet-support-overview.md#considerations-to-enable-virtual-network-support-for-power-platform-environment) and in the [Frequently asked questions](vnet-support-overview.md#frequently-asked-questions).

- **Prepare your tenant and set up permissions**:
    - **Azure subscription**: Make sure you have an Azure subscription where you create virtual network, subnet, and enterprise policy resources.
    - **Assign roles**: Make sure you have the required roles to create resources and enterprise policy.
      - In the Azure portal, assign the Azure network administrator role, such as the [network contributor role](/azure/role-based-access-control/built-in-roles#network-contributor) or an equivalent custom role.
      - In the Microsoft Entra admin center, assign the Power Platform administrator role.

- **Prepare to use PowerShell**:
  - Use Windows PowerShell or [Install PowerShell Core](/powershell/scripting/install/installing-powershell). Our module is compatible with both versions.

The following diagram shows the functions of the roles in the setup process for virtual network support in a Power Platform environment.

:::image type="content" source="media/vnet-support/vnet-support-configurations.png" alt-text="Screenshot of the configurations for virtual network support in a Power Platform environment." lightbox="media/vnet-support/vnet-support-configurations.png":::

> [!IMPORTANT]
> Power Platform performs active health checks when set up within the delegated network. As a result, expect periodic requests to verify your connection to the configured DNS server via TCP on port 53. To ensure health reporting is accurate, *allowlist* this request from the subnet that makes requests. You can validate the functionality of this setting by using the diagnostic tooling with the `Test-NetworkConnectivity` command. Learn more about this topic in [Troubleshoot virtual network issues](/troubleshoot/power-platform/administration/virtual-network).

## Clarifications

- Your [virtual networks](/azure/virtual-network/virtual-networks-overview) must be created in Azure regions associated with your Power Platform environment. For example, if your Power Platform environment region is United States, create your virtual networks in the **eastus** and **westus** Azure regions. For a mapping of environment region to Azure regions, [review the list of supported regions](./vnet-support-overview.md#supported-regions).

- If there are two or more supported regions for the geography, such as the United States with **eastus** and  **westus**, you need two virtual networks in ***different*** regions to create the enterprise policy. This requirement applies to both production and nonproduction environments. 

- Make sure that you appropriately size the subnet you create according to [Estimating subnet size for Power Platform environments](./vnet-support-overview.md#estimating-subnet-size-for-power-platform-environments). If more than one subnet is required, both subnets must have the same number of available IP addresses. After you delegate the subnet to Power Platform, you need to contact Microsoft Support to change the subnet range.

- You can [reuse existing virtual networks](./vnet-support-overview.md#can-i-use-an-existing-virtual-network-for-power-platform), if desired. The same subnet [can't be reused in multiple enterprise policies](./vnet-support-overview.md#can-i-reuse-the-same-delegated-subnet-in-multiple-enterprise-policies).

## Set up Virtual Network support

Virtual Network support can be configured and enabled using PowerShell scripts or through manual steps. In both methods the steps to follow can be categorized as follows.

1. Set up the virtual network and subnets.
1. Create the enterprise policy.
1. Configure your Power Platform environment.

::: zone pivot="powershell"

### Setup with PowerShell

1. Install and load the Microsoft.PowerPlatform.EnterprisePolicies module.

```PowerShell
Install-Module Microsoft.PowerPlatform.EnterprisePolicies
Import-Module Microsoft.PowerPlatform.EnterprisePolicies
```

1. Configure your virtual network and subnet for delegation to Power Platform. This must be run for each virtual network that has a subnet delegated. Review the number of IP addresses that are allocated to each subnet and consider the load of the environment.

# [Existing virtual network](#tab/existing)

```PowerShell
New-VnetForSubnetDelegation -SubscriptionId "00000000-0000-0000-0000-000000000000" -VirtualNetworkName "myVnet" -SubnetName "mySubnet"
```

# [Create virtual network](#tab/new)

```PowerShell
New-VnetForSubnetDelegation -SubscriptionId "00000000-0000-0000-0000-000000000000" -VirtualNetworkName "myVnet" -SubnetName "mySubnet" -ResourceGroupName "myResourceGroup" -CreateVirtualNetwork -AddressPrefix "10.0.0.0/16" -SubnetPrefix "10.0.1.0/24" -Region "westus"
```
---

> [!IMPORTANT]
> - If you plan to use the same delegated subnet for multiple Power Platform environments, you might need a larger IP address block than /24. Review subnet sizing guidance in [Estimating subnet size for Power Platform environments](vnet-support-overview.md#estimating-subnet-size-for-power-platform-environments).
> - To allow public internet access for Power Platform components, create an [Azure NAT gateway](/azure/nat-gateway/nat-overview) for the subnets.

1. Create your enterprise policy using the virtual networks and subnets you delegated. Remember two virtual networks in different regions are required for geographies that support two or more regions.

# [Single region geography](#tab/single)

```PowerShell
New-SubnetInjectionEnterprisePolicy -SubscriptionId "00000000-0000-0000-0000-000000000000" -ResourceGroupName "myResourceGroup" -PolicyName "myPolicy" -PolicyLocation "unitedstates" -VirtualNetworkId "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/myVnet" -SubnetName "default"
```

# [Two region geography](#tab/double)

```PowerShell
New-SubnetInjectionEnterprisePolicy -SubscriptionId "00000000-0000-0000-0000-000000000000" -ResourceGroupName "myResourceGroup" -PolicyName "myPolicy" -PolicyLocation "unitedstates" -VirtualNetworkId "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/myVnet" -SubnetName "default" -VirtualNetworkId2 "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/myVnet" -SubnetName2 "default"
```
---

1. **(Optional)** [Grant read access](customer-managed-key.md#grant-the-power-platform-admin-privilege-to-read-enterprise-policy) for the enterprise policy to users with the Power Platform administrator role.

1. To link your newly created policy, run the following command.

    ```PowerShell
    Enable-SubnetInjection -EnvironmentId "00000000-0000-0000-0000-000000000000" -PolicyArmId "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/myResourceGroup/providers/Microsoft.PowerPlatform/enterprisePolicies/myPolicy"
    ```

    > [!TIP]
    > If you need a different account to link the policy, you can use the -ForceAuth switch to ensure you get prompted to sign in to a new account.

::: zone-end

::: zone pivot="manual"

### Manual setup

1. The following resource providers need to be registered in your subscription. For information on how to register a resource provider, see [Register resource provider](/azure/azure-resource-manager/management/resource-providers-and-types#register-resource-provider-1).

    - Microsoft.Network
    - Microsoft.PowerPlatform

1. The following feature needs to be registered in your subscription. For information on how to register a feature, see [Register preview feature
](/azure/azure-resource-manager/management/preview-features?tabs=azure-portal#register-preview-feature).

    - enterprisePoliciesPreview

1. Create your virtual network and subnets by following the guidance at [Create a virtual network](/azure/virtual-network/tutorial-connect-virtual-networks?tabs=portal#create-a-virtual-network-and-an-azure-bastion-host).

> [!NOTE]
> You can skip creating the bastion host. It isn't necessary for the Power Platform Virtual Network functionality.

1. Use an existing subnet or create a new subnet and delegate it **Microsoft.PowerPlatform/enterprisePolicies**. Learn more at [Add or remove a subnet delegation](/azure/virtual-network/manage-subnet-delegation?tabs=manage-subnet-delegation-portal).

1. To verify if a subnet has been successfully delegated, you can navigate to your subnet and verify the **Delegated to** column, as shown below.

    :::image type="content" source="media/vnet-support/delegated-subnet.png" alt-text="Screenshot of a delegated subnet in the Azure portal." lightbox="media/vnet-support/delegated-subnet.png":::

1. After you create paired virtual networks, you can view them in your Azure resource group, as shown in the following image.

    :::image type="content" source="media/virtual-networks.png" alt-text="Screenshot of virtual networks in your Azure resource group." lightbox="media/virtual-networks.png":::

1. Make sure you capture the necessary details from the virtual networks you created, such as the following information:
   
    - VnetOneSubnetName
    - VnetOneResourceId 
    - VnetTwoSubnetName 
    - VnetTwoResourceId

1. [Deploy a custom template](https://ms.portal.azure.com/#create/Microsoft.Template) in the Azure portal. Select the **Build your own template in the editor** link and copy and paste the following JSON script.

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
                    "description": "Geography of the PowerPlatform environment."
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

1. Save the template and fill in the details to create the enterprise policy, which includes the following information:
    - **Policy name**: Name of the enterprise policy that appears in the Power Platform admin center.
    - **Location**: Select the location of the enterprise policy, corresponding with the Dataverse environment's region:
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
        - usgov
    - **VnetOneSubnetName**: Enter the name of the subnet from the first virtual network.
    - **VnetOneResourceId**: Enter the resource ID from the first virtual network.
    - **VnetTwoSubnetName**: Enter the name of the subnet from the second virtual network.
    - **VnetTwoResourceId**: Enter the resource ID from the second virtual network. It should match the strings from JSON script, for example: vNetOneResourceId, vNetOneSubnetName

1. Select **Review + create** to finalize the enterprise policy.

    :::image type="content" source="media/virtual-networks-json-script.png" alt-text="Screenshot of selecting Review and create to finalize the enterprise policy." lightbox="media/virtual-networks-json-script.png":::

1. **(Optional)** [Grant read access](customer-managed-key.md#grant-the-power-platform-admin-privilege-to-read-enterprise-policy) for the enterprise policy to users with the Power Platform administrator role.

1. To assign your policy to your environment, sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
    1. In the navigation pane, select **Security**.
    1. In the **Security** pane, select **Data and privacy**.
    1. In the **Data protection and privacy** page, select **Azure Virtual Network policies**. The **Virtual Network policies** pane is displayed.
    1. Select the environment you want to assign to the enterprise policy, select the policy, and select **Save**. Now the enterprise policy is linked to the environment.

  > [!IMPORTANT]
  > Removing an enterprise policy from an environment can only be done through PowerShell by using [Disable-SubnetInjection](https://github.com/microsoft/PowerPlatform-EnterprisePolicies/blob/main/docs/en-US/Microsoft.PowerPlatform.EnterprisePolicies/Disable-SubnetInjection.md).
  > 
  > ```PowerShell
  > Disable-SubnetInjection -EnvironmentId "00000000-0000-0000-0000-000000000000"
  > ```

1. Validate the policy association by signing in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
    1. In the navigation pane, select **Manage**.
    1. In the **Manage** pane, select **Environments**.
    1. On the **Environments** page, select an environment.
    1. In the command bar, select **History**.
    1. Verify that the **Status** shows **Succeeded**.

::: zone-end

### Related content

- Deploy enterprise policies with the [Microsoft.PowerPlatform/enterprisePolicies ARM template](/azure/templates/microsoft.powerplatform/enterprisepolicies?pivots=deployment-language-arm-template)
- [Quickstart: Use the Azure portal to create a virtual network](/azure/virtual-network/quick-create-portal)
- [Use plug-ins to extend business processes](/power-apps/developer/data-platform/plug-ins)
- [Troubleshoot Virtual Network issues](/troubleshoot/power-platform/administration/virtual-network)
