---
title: Setup and Configure vNet Support for Power Platform
description: Learn how to setup and configure vNet support for Power Platform.
ms.date: 2/1/2024
ms.topic: overview
ms.component: pa-admin
ms.subservice: admin
author: ritesp
ms.author: ritesh.pandey
search.audienceType: admin
ms.custom: "admin-security"
---

# Setup and configure vNet support for Power Platform

Enterprises often want to integrate Dataverse and Power Platform with their own services. One of Enterprises' key integration scenarios is having Dataverse or Power Platform components call out to resources that the Enterprises own. These resources could either be Azure-hosted or on-premises. Often, Enterprises use plug-ins or connectors to make such outbound calls (for example: making a call from a Dataverse plug in to a Enterprises Snowflake instance hosted on Azure).

Today, since all Dataverse and Power Platform services run on public and sovereign Azure clouds, we require these Enterprise resources to be accessible, at the very least, from a list of Azure IP ranges or Service tags which describe public IP addresses. All such integrations happen on the public internet infrastructure.

Some Enterprises want their resources to be entirely encapsulated within a private network and still want to be able to integrate with cloud services. Azure provides the ability to protect Azure services within a customer's virtual network (vNet) via Private Endpoints ([<u>What is a private endpoint? \| Microsoft Docs</u>](https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview)). Customers are also able to bring their on-premises resources to the virtual network via [<u>Express Route</u>](https://docs.microsoft.com/en-us/azure/expressroute/). Customers are then able to protect and monitor the entire virtual network

By doing this, Power Platform components currently lose the ability to connect to these protected resources as they are no longer accessible from the public internet. Only resources from within the virtual network can access these resources.

vNet support for Power Platform using Subnet delegation will enable Enterprises to access their resources within their virtual networks from the Power Platform. This document will guide you through the steps to configure vNet support for Power Platform for Power Platform environments.

You can enable vNet Support for Power Platform environments using below steps.

Before you prepare your tenant for Subnet Delegation

Subnet delegation requires configuration steps in both the Azure portal and in the Power Platform admin centner. Users configuring subnet delegation must have the appropriate permissions in each portal.

- Users must be assigned the Azure Network Administrator role to complete the configuration steps in Azure.

- Users must be assigned the Power Platform Administrator role to complete the and configuration steps in the Power Platform admin center.

Prepare Tenant for Subnet Delegation

Pre-requisites

- An Azure subscription in which you have permissions to create a virtual network, subnet, and the Enterprise Policy resources. 

- Download the PowerShell Scripts from this location ([<u>PowerApps-Samples/powershell/enterprisePolicies at master · microsoft/PowerApps-Samples · GitHub</u>](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies))

- Privileges: The user must be in network administrator role to configure step \#1 to \#4 below.

- Install PowerShell MSI. More information: [Install PowerShell on Windows, Linux, and macOS - PowerShell \| Microsoft Learn](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.4)

## Setup Steps

The setup of vNet support for Power Platform Environment requires two distinct personas.

- User in Azure Network Administrator role

- User in Power Platform Administrator role

Below diagram shows the steps required to configure the vNet support in Power Platform environment.

![A diagram of a diagram Description automatically generated](media/image1.png)

## Azure Configurations

### Step 1: Register Microsoft.PowerPlatform as a resource provider

On the Azure portal, sign in as a subscription owner and register Microsoft.PowerPlatform as a resource provider for the subscription that contains the VNet. This change enables your subscription to work with this resource provider.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to the specific subscription.

1. Select Resource providers.

1. Search for and select Microsoft.PowerPlatform, and then select Register.

![A screenshot of a computer Description automatically generated](media/image2.png)

### Step 2: Setup vNet, subnets

Users in Azure Network Administrator role need to setup virtual network and have at least two subnets primary and failover. The failover subnet should be altogether in different region e.g. if primary subnet is in West US, then failover must be in EAST US.

*Note\*: Power Platform does not support CENTRAL US. Supported Power Platform regions are documented here [PowerApps-Samples/powershell/enterprisePolicies/SubnetInjection/ValidateVnetLocationForEnterprisePolicy.ps1 at master · microsoft/PowerApps-Samples (github.com)](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/enterprisePolicies/SubnetInjection/ValidateVnetLocationForEnterprisePolicy.ps1)*

1. Configure vNet, Subnets by referring to this article [Add or remove a subnet delegation in an Azure virtual network \| Microsoft Learn](https://learn.microsoft.com/en-us/azure/virtual-network/manage-subnet-delegation?tabs=manage-subnet-delegation-portal)

1. **Delegate the subnet to the Power Platform enterprise policies:** Once you have provisioned two vNet and two subnets one in Primary and another in failover region in step \#A above, having at least /24 CIDR IPs in each primary and secondary subnet,

    1. Run [this](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#1-setup-virtual-network-for-subnet-injection) step for primary vNet and Subnet.

    1. Run [this](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#1-setup-virtual-network-for-subnet-injection) step for failover vNet and Subnet.

*We currently request at least /24 [CIDR](https://datatracker.ietf.org/doc/html/rfc4632) (Classless Inter-domain Routing) (251 IP's + 5 IP's reserved) in the subnet that will be delegated to Power Platform. If you are planning to delegate the same subnet to multiple environments, then you may need to provision more Ips within that subnet.*

*If you want to allow internet access within Power Platform containers then you will have to configure* [Azure NAT Gateway](https://learn.microsoft.com/en-us/azure/nat-gateway/nat-overview) *for delegated subnets.*

Before you execute step \#3 below, review the number of IP's allocated to each subnet to cater the load of the environment(s). Both primary and failover subnets must have same number of available IP's.

### Step 3: Create enterprise policy

In this step, you will create enterprise policies using the vNet and Subnet provisioned in step 2 above. Refer to [this step](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/enterprisePolicies#2-create-subnet-injection-enterprise-policy) to create enterprise policies.

### Step 4: Grant the Power Platform admin privilege to read the enterprise policy

In this step, you will be granting read access to the user in Power Platform Administrator role using this [article](https://learn.microsoft.com/en-us/power-platform/admin/customer-managed-key#grant-the-power-platform-admin-privilege-to-read-enterprise-policy) under the section "**Grant the Power Platform admin privilege to read enterprise policy"**.

### Step 5: Power Platform Configurations

To enable vNet support in Power Platform environments, user must be in Power Platform Administrator role and must have read permission to Enterprise Policy created for Power Platform.

To configure on vNet support in Power Platform environment, user in Power Platform Administrator role must follow [this](https://github.com/ritesp/PowerApps-Samples/tree/master/powershell/enterprisePolicies#7-set-subnet-injection-for-an-environment) step.

### Validation

You have enabled vNet support for your Power Platform environment.

To validate it,

- Go to the <https://aka.ms/ppac>

- Browse to Environments

- Click on the environment where vNet support is enabled.

- Click on History, you will see something like below. It implies that linking of enterprise policies with environment is successful.

![A screenshot of a computer Description automatically generated](media/image3.png)

## Supported services on vNet in Power Platform

Following table shows the currents status of services onboarded to Azure Subnet delegation to support vNet in Power Platform.

| Area       | Power Platform Services                                                   | vNet support                  |
|------------|---------------------------------------------------------------------------|-------------------------------|
| Dataverse  | Dataverse 3P plug-ins                                                     | Public Preview is rolling out |
| Connectors | [Azure SQL](https://learn.microsoft.com/en-us/connectors/sql/)            | Private Preview               |
|            | [Azure Queue](https://learn.microsoft.com/en-us/connectors/azurequeues/)  | Private Preview               |
|            | [Azure Key Vault](https://learn.microsoft.com/en-us/connectors/keyvault/) | Private Preview               |

### See also

- Deploying enterprise policies: [Microsoft.PowerPlatform/enterprisePolicies - Bicep, ARM template & Terraform AzAPI reference \| Microsoft Learn](https://learn.microsoft.com/en-us/azure/templates/microsoft.powerplatform/enterprisepolicies?pivots=deployment-language-arm-template)

- [Quickstart: Use the Azure portal to create a virtual network - Azure Virtual Network \| Microsoft Learn](https://learn.microsoft.com/en-us/azure/virtual-network/quick-create-portal)

- [Use plug-ins to extend business processes (Microsoft Dataverse) - Power Apps \| Microsoft Learn](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/plug-ins)
