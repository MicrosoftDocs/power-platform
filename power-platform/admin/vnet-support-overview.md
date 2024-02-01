---
title: vNet support for Power Platform overview
description: Learn more about vNet support for Power Platform.
ms.date: 2/1/2024
ms.topic: overview
ms.component: pa-admin
ms.subservice: admin
author: ritesp
ms.author: ritesh.pandey
search.audienceType: admin
ms.custom: "admin-security"
---

## vNet support for Power Platform overview

Enterprises often want to integrate Dataverse and Power Platform with their own services. One of Enterprises' key integration scenarios is having Dataverse or Power Platform components call out to resources that the Enterprises own. These resources could either be Azure-hosted or on-premises. Often, Enterprises use plug-ins or connectors to make such outbound calls (for example: making a call from a Dataverse plug in to an Enterprises Snowflake instance hosted on Azure).

Today, since all Dataverse and Power Platform services run on public and sovereign Azure clouds, we require these Enterprise resources to be accessible, at the very least, from a list of Azure IP ranges or Service tags which describe public IP addresses. All such integrations happen on the public internet infrastructure.

Some Enterprises want their resources to be entirely encapsulated within a private network and still want to be able to integrate with cloud services. Azure provides the ability to protect Azure services within an Enterprises virtual network (vNet) via Private Endpoints ([<u>What is a private endpoint? \| Microsoft Docs</u>](https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview)). Enterprises are also able to bring their on-premises resources to the virtual network via [<u>Express Route</u>](https://docs.microsoft.com/en-us/azure/expressroute/). Enterprises are then able to protect and monitor the entire virtual network.

By doing this, Power Platform components currently lose the ability to connect to these protected resources as they are no longer accessible from the public internet. Only resources from within the virtual network can access these resources.

vNet support for Power Platform using [Subnet delegation](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview) will enable Enterprises to access their resources within their virtual networks from the Power Platform. By delegating, Subnet to Power Platform, you are asking Power Platform to run the vNet supported services in your delegated subnet at runtime. Since the services are running in your delegated subnet, you have full control over the egress traffic from Power Platform in your network. The egress traffic is subjected to network policies applied by your network administrator.

![A diagram of a platform Description automatically generated](media/image1.png)

## Introduction to vNet support for Power Platform

vNet support in Power Platform will allow you to integrate Power Platform services onboarded on [Azure subnet delegation](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview) with your services within your vNet (virtual network) without routing the outbound traffic from Power Platform services to internet. Power Platform leverages [Azure subnet delegation](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview) to support vNet for outbound traffic. By configuring the vNet in Power Platform, you will be able to get all the control and [benefits](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview#advantages-of-subnet-delegation) that Azure subnet delegation provides. With vNet support, you will be able to solve following key problems.

- You don't have to expose private end protected resources within your vNet to internet to allow Power Platform services to connect to these protected resources, thereby protecting your data.

- You don't have to allow-list sets of Power Platform IP's ranges or service tags to allow Power Platform services to connect to resources within your vNet, thereby protecting the resources from unauthorized access.

We will be supporting following scenarios initially with vNet support in Power Platform

You can use secured private outbound connectivity from custom 3rd party Dataverse/ISV plug-ins to enhance the security of data integration with external data sources within your secured private network from your Power Apps, Power Automate, and Dynamics 365 apps. For example, you can:

- Connect privately from Dataverse 3P plug-ins to your on-premises data sources such as SQL server, Oracle, or SAP without exposing them to the internet and protect your data from data breaches and other external threats.

- Connect privately from your 3P plug-ins to your cloud data sources such as Azure SQL, Azure Storage, blob storage, or Azure Key Vault without exposing them to the internet and protect your data from data exfiltration and other incidents.

You can use private outbound connectivity from Power Platform to securely access services, manipulate, and protect data from your apps. You can connect privately from Power Apps, Power Automate, and Dynamics 365 Apps using following connectors.

- Azure SQL: To Azure SQL or SQL server without exposing the traffic to the internet and protect your data from data exfiltration and other external threats.

- Azure File Storage/Blob Storage: To Azure File Storage or blob storage without exposing the files to the internet and protect your data from data breaches and other incidents.

- Azure Key Vault: To Azure Key Vault without exposing the secrets to the internet and protect your data from data leaks and other risks.

- Http with Microsoft Entra ID: To your own services authenticated by Azure AD without exposing them to the internet and protect your data from external attacks and data leaks.

- Azure Queue: To Azure Queue without exposing the endpoint to public internet.

- Custom: To your services hosted within your vNet.

## Regions supported for vNet support for Power Platform

Power Platform region and Azure regions mapping is provided in below table. It is very important to ensure that Power Platform environment and enterprise policy are in supported Power Platform and Azure regions respectively. For example, if you have Power Platform environment in United States, then your vNet, Subnets and Enterprise Policy must be either in East US or West US azure region.

| Power Platform Region | Azure Region                      |
|-----------------------|-----------------------------------|
| Unitedstates          | Eastus, westus                    |
| Southafrica           | Southafricanorth, southafricawest |
| Uk                    | Uksouth, ukwest                   |
| Japan                 | Japaneast, japanwest              |
| India                 | Centralindia, southindia          |
| France                | Francecentral, francesouth        |
| Europe                | Westeurope, northeurope           |
| Germany               | Germanynorth, germanywestcentral  |
| Switzerland           | Switzerlandnorth, switzerlandwest |
| Canada                | Canadacentral, canadaeast         |
| Brazil                | Brazilsouth, southcentralus       |
| Australia             | Australiasoutheast, australiaeast |
| Asia                  | Eastasia, southeastasia           |
| Uae                   | Uaecentral, uaenorth              |
| Korea                 | Koreasouth, koreacentral          |
| Norway                | Norwaywest, norwayeast            |
| Singapore             | southeastasia                     |
| Sweden                | swedencentral                     |

## Supported services on vNet in Power Platform

Following table shows the currents status of services onboarded to Azure Subnet delegation to support vNet for Power Platform.

| Area       | Power Platform Services | vNet support   |
|------------|-------------------------|----------------|
| Dataverse  | Dataverse 3P plug-ins   | Public Preview |
| Connectors | Azure SQL connector     | Coming soon    |
|            | Azure Key Vault         | Coming soon    |
|            | Azure Queue             | Coming soon    |

## Licensing requirements for vNet support for Power Platform

Licensing requirements for vNet support for Power Platform will be announced near to General Availability.

## Understand the changes needed when you enable vNet support on a Power Platform Environment

When you enable vNet support in a Power Platform Environment, all the vNet supported services like Dataverse Plug-ins, SQL connector will start executing the requests at runtime in your delegated subnet i.e. now these services will be subjected to your network policies. Let's say that SQL connector is connecting to SQL available over public internet and your network policy does not allow to connect to SQL server over public internet from within your vNet. The call from SQL connector will start failing. To avoid this situation, you can first bring your SQL server in your vNet or if it is in azure, you can enable private endpoint on Azure SQL before you enable vNet support in a Power Platform environment.

Before enabling the vNet in Power Platform environment, we recommend

- Review your apps, flows and plug-ins code to ensure that they connect over your vNet, they are not reaching out to endpoints available over internet.

- If your apps, flow, and plug-ins etc. needs to connect to public endpoints, ensure that your firewall/network configuration allows such calls.

## Setup and Configuration experiences for enabling vNet support using Azure Subnet Delegation

Refer this document [Setup and Configuration of vNet Support for Power Platform environment.docx](https://microsoft.sharepoint.com/:w:/t/CDS-Sandbox/Ea8ss50L1opIppTmEZAbDgEBwYjvdh4vx0EICTGcG_qAiQ?e=IWriek)

## FAQ

1. Difference between vNet Data Gateway vs Azure vNet support in Power Platform

   vNet data gateway is a managed gateway that allows you to access Azure/Power Platform services from within your virtual network without the need of an on-premises data gateway. You don't need to set up any On-Premises vNet Data Gateway. The managed gateway configuration is available [here](https://learn.microsoft.com/en-us/data-integration/vnet/data-gateway-architecture#hardware)

   Azure vNet support in Power Platform uses Azure subnet delegation where you delegate subnet(s) to Power Platform environment (service) and subnet(s) are going to be used by workloads within the environment.

   1. vNet Data Gateway will continue to support ETL (extract, transform, load) workloads like Power BI and Power Platform Dataflows. vNet Data Gateway is optimized for ETL workloads.

   1. vNet support, which is based on Azure subnet delegation, will be used for Power Platform API (application programming interfaces) workloads as the requests are short lived and it is optimized for large number of requests.

1. How do you ensure that vNet, subnet from one customer will not be used by another customer in Power Platform?

   vNet support in Power Platform ensures that one customer cannot access the vNet/Subnet of other customers by having following measures in place:

   1. vNet support in Power Platform uses [Azure Subnet delegation](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview).

   1. Every Power Platform environment is linked to a particular vNet/subnet. Only calls from that environment are allowed to access that vNet.

   1. Azure Subnet delegation is a feature that allows you to designate a specific subnet for an Azure PaaS (platform as a service) service of your choice that needs to be injected into your virtual network. When you delegate the subnet to an Azure service (Power Platform Enterprise Policy), you allow that service to establish some basic network configuration rules for the subnet, which help the Azure service operate their instances in a stable manner. No other azure service can have access to this subnet. Even if someone tries to delegate a subnet which is used by other azure service, it will fail.

1. Does it support failover?

   Yes, vNet support in Power Platform supports failover. It will be mandatory for you to delegate a primary and failover vNet and Subnets during the configuration in public preview.

1. How can Power Platform Environment in one region connect to resources hosted in another region?

   vNet linked to Power Platform environment must reside in the [Power Platform environment's regions](https://learn.microsoft.com/en-us/power-platform/admin/regions-overview#what-regions-are-available). If an existing vNet is in other region, one will need to create a new vNet in environment region and then use [vNet peering](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview) between vNet across regions.

1. Will I be able to monitor egress traffic from these delegated subnets?  
    Yes, you can use NSGs (National Security Group) and /or firewalls to monitor egress traffic from delegated subnets.

1. How many IPs does Power Platform require in the subnet to be delegated?  
    We currently request at least /24 CIDR (Classless Inter-domain Routing) (255 IPs) in the subnet that will be delegated to Power Platform. If you are planning to delegate the same subnet to multiple environments, then you may need to provision more IPs within that subnet.

1. Will I be able to make internet bound calls from plugins once my environment is subnet delegated?  
    You will be able to make internet bound calls from plugins **<u>only</u>** if the subnet is configured with a [NAT Gateway](https://learn.microsoft.com/en-us/azure/nat-gateway/nat-overview)

1. Can I use vNet Data Gateway for SQL connector and Custom Connector?

   vNet using Azure Subnet Delegation is only supported option for SQL and Custom Connectors for outbound connectivity from Power Platform.

1. Can I update the subnet IP address range after it has been delegated to "Microsoft.PowerPlatform/enterprisePolicies"?

   No, you cannot update the IP address range of the subnet once it has been delegated to "Microsoft.PowerPlatform/enterprisePolicies".

   Dataverse Plugin and Subnet Delegation Specific questions

1. My Vnet has custom DNS (Domain Name Service) configured. Will Power Platform use that?  

   Yes, Power Platform will use the custom DNS configured within the VNET (Virtual network) that holds the delegated subnet to resolve all the endpoints. This means that once the environment is delegated, you may need to update plugin code/ connector code to use the correct URL of the endpoint so that your custom DNS is able to resolve them.

1. My environment has ISV provided plugins. Would they also be subjected to run in the delegated subnet?  

   Yes, all customer plugins and ISV plugins will be run using your subnet. So, if the ISV plugins have outbound connectivity, those URLs might need to be allow listed in your firewall.

1. I am planning to use this feature to connect to my on-premises endpoints and those endpoints TLS (Transport Layer Security) certificates are not signed by well-known Root CA (certification authorities). Do you support such scenarios?

   No, even though the plugins/ connectors are running within customer subnet, we still need to ensure that the endpoint presents a TLS certificate with the complete chain and the Root CA is well-known and it is not possible to add your custom Root CA to our list of well-known CAs (certification authorities).

1. Is there any recommendation on setup of vNet 's within customer tenant?

   No, we do not recommend any specific topology, however Hub and spoke topology is widely used by our customers.
