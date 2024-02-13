---
title: Virtual Network support for Power Platform overview
description: "Learn more about Azure Virtual Network support for Power Platform."
ms.date: 2/1/2024
ms.topic: overview
ms.component: pa-admin
ms.subservice: admin
author: ritesp
ms.author: ritesp
search.audienceType: admin
ms.custom: "admin-security"
---

# Virtual Network support for Power Platform overview (preview)

The [Azure Virtual Network](/azure/virtual-network/virtual-networks-overview) support for Power Platform helps you integrate from Microsoft Power Platform to resources within your virtual network without exposing your resources over the public internet. Virtual Network support uses [Azure subnet delegation](/azure/virtual-network/subnet-delegation-overview) to manage outbound traffic at runtime from Power Platform. Therefore, you don't need to expose your protected resources over the internet to integrate with Power Platform.


Using Virtual Network, you can:

- Integrate Dataverse and Power Platform with your own services within your network.

  For example, Dataverse or Power Platform components can call resources owned by your enterprise. These resources can be either Azure-hosted or on-premises.
- Use plug-ins to make outbound calls.

  For example, a call from a Dataverse plug-in is made to a Snowflake instance hosted on Azure.

## Introduction to virtual network support for Power Platform

Power Platform integrates with enterprise resources over public networks. With public networks, enterprise resources must be accessible from a list of Azure IP ranges or service tags, which describe public IP addresses. However, virtual network support for Power Platform allows you to use a private network _and_ integrate with cloud services or services hosted within your enterprise network.

Azure services are protected within a virtual network through [private endpoints](/azure/private-link/private-endpoint-overview). You can bring your on-premises resources to the virtual network through [Express Route](/azure/expressroute/), which allows you to protect and monitor the entire virtual network.

You need to delegate virtual networks and subnets to the Power Platform. Power Platform uses the delegated subnet to make outbound calls to enterprise resources over the enterprise private network. Using a private network eliminates the need to egress the traffic over the public internet, which could expose enterprise resources.

In a virtual network, you have full control over the egress traffic from Power Platform. The traffic is subjected to network policies applied by your network administrator.

:::image type="content" source="media/vnet-support/vnet-support-traffic.png" alt-text="Screenshot that shows how a virtual network interacts with resources." lightbox="media/vnet-support/vnet-support-traffic.png":::

## Virtual Network support benefits

 With Virtual Network support, you get all the [benefits](/azure/virtual-network/subnet-delegation-overview#advantages-of-subnet-delegation) that Azure subnet delegation provides.

- **Data protection**: Virtual Network allows Power Platform services to connect to your private and protected resources without exposing them to the internet.

- **No unauthorized access**: Virtual Network connects with your resources without needing Power Platform IP ranges or service tags in the connection.

## Supported Scenarios using Virtual Network support

Power Platform supports Dataverse plug-in scenarios. With a virtual network, you can use secured, private, outbound connectivity with partner software. For example, Dataverse plug-ins enhance data integration security with external data sources from your Power Apps, Power Automate, and Dynamics 365 apps. We plan to extend the virtual network support to more scenarios within Power Platform.

### Private outbound connections to data sources

- Use Dataverse plug-ins to connect to your on-premises data sources such as SQL server, Oracle, or SAP. You protect your data from data breaches and other external threats.

- Use other partner plug-ins to connect to your cloud data sources such as Azure SQL, Azure Storage, blob storage, or Azure Key Vault. You protect your data from data exfiltration and other incidents.

## Supported regions

Confirm that your Power Platform environment and enterprise policy are in supported Power Platform and Azure regions, respectively. For example, if your Power Platform environment is in the United States, then your virtual network, subnets and enterprise policy must be either in the `eastus` or `westus` Azure region.

| Power Platform region | Azure region                      |
|-----------------------|-----------------------------------|
| United States         | eastus, westus                    |
| South Africa          | eouthafricanorth, southafricawest |
| Uk                    | uksouth, ukwest                   |
| Japan                 | japaneast, japanwest              |
| India                 | centralindia, southindia          |
| France                | francecentral, francesouth        |
| Europe                | westeurope, northeurope           |
| Germany               | germanynorth, germanywestcentral  |
| Switzerland           | switzerlandnorth, switzerlandwest |
| Canada                | canadacentral, canadaeast         |
| Brazil                | brazilsouth, southcentralus       |
| Australia             | australiasoutheast, australiaeast |
| Asia                  | eastasia, southeastasia           |
| UAE                   | uaecentral, uaenorth              |
| Korea                 | koreasouth, koreacentral          |
| Norway                | norwaywest, norwayeast            |
| Singapore             | southeastasia                     |
| Sweden                | swedencentral                     |

## Supported services

The current status of services onboarded to the Azure subnet delegation for Virtual Network support for Power Platform.

| Area | Power Platform services | Virtual Network support |
|------------|-------------------|--------------|
| Dataverse  | Dataverse plug-ins | Public preview |

## Licensing requirements

Licensing requirements for Virtual Network support for Power Platform are announced when the service is closer to general availability.

## How to enable Virtual Network support on a Power Platform environment

### Prerequisites

Before enabling Virtual Network support in Power Platform:

- Review your apps, flows and plug-ins code to ensure that they connect over your virtual network. They shouldn't call endpoints available over the public internet.

- If your apps, flow, and plug-ins need to connect to public endpoints, ensure that your firewall or network configuration allows such calls.

### Considerations

When you enable Virtual Network support in a Power Platform environment, all supported services, like a Dataverse plug-ins or a SQL connector, execute requests at runtime in your delegated subnet. Once enabled, your services are subjected to your network policies.

For example, a SQL connector might try to connect to SQL through the public internet, but your network policy doesn't allow public connections to the SQL server in your virtual network. The call from the SQL connector fails.

To avoid a failed connection, you can add a SQL server to your virtual network. Alternatively, if the server is in Azure, you can enable a private endpoint on Azure SQL before you enable your virtual network support in a Power Platform environment.

### Setup and configuration

[Set up and configure Azure Virtual Network support for Power Platform](vnet-support-setup-configure.md).

## FAQ

### 1. What's the difference between a virtual network data gateway and Azure Virtual Network support in Power Platform?

#### Virtual network data gateway

The virtual network data gateway is a managed gateway that allows you to access Azure and Power Platform services from within your virtual network without an on-premises data gateway. You don't need to set up an on-premises virtual network data gateway. For more information, see [Virtual network data gateway architecture](/data-integration/vnet/data-gateway-architecture#hardware).

A virtual network data gateway continues to support ETL (extract, transform, load) workloads, for example Power BI and Power Platform dataflows. A virtual network data gateway is optimized for ETL workloads.

#### Azure Virtual Network support

Virtual Network support in Power Platform uses an Azure subnet delegation for your Power Platform environment. Subnets are used by workloads within the environment.

Virtual Network support is used for Power Platform API workloads as the requests are short lived and optimized for a large number of requests.

### 2. How can you ensure a virtual network subnet or data gateway from one customer isn't used by another customer in Power Platform?

Virtual Network support in Power Platform ensures customer privacy due to:

- Virtual Network support in Power Platform uses [Azure subnet delegation](/azure/virtual-network/subnet-delegation-overview).

- Each Power Platform environment is linked to one virtual network subnet. Only calls from that environment are allowed to access that virtual network.

- Delegation allows you to designate a specific subnet for any Azure PaaS that needs to be injected into your virtual network.

### 3. Does Virtual Network support in Power Platform support failover?

   Yes. You're required to delegate a primary and failover virtual network and subnets during the configuration in public preview.

### 4. How can a Power Platform environment in one region connect to resources hosted in another region?

  Virtual Network linked to a Power Platform environment must reside in the [Power Platform environment's regions](/power-platform/admin/regions-overview#what-regions-are-available). If an existing Virtual Network is in another region, create a new Virtual Network in that region and use [virtual network peering](/azure/virtual-network/virtual-network-peering-overview) to bridge the two regions.

### 5. Can I monitor egress traffic from delegated subnets?

Yes. You can use National Security Group and/or firewalls to monitor egress traffic from delegated subnets.

### 6. How many IPs does Power Platform require in the subnet to be delegated?

At least 24 Classless Inter-domain Routing (CIDR), or 255 IPs, is required in the subnet delegated to Power Platform. If you want to delegate the same subnet to multiple environments, you might need to provision more IPs within that subnet.

### 7. Can I make internet bound calls from plug-ins once my environment is subnet delegated?

Yes. You can make internet bound calls from plugins _only_ if the subnet is configured with a [NAT Gateway](/azure/nat-gateway/nat-overview).

### 8. Can I use vNet data gateway for SQL connectors and custom connectors?

Virtual Network using Azure subnet delegation is the only supported option for SQL and custom connectors for outbound connectivity from Power Platform.

### 9. Can I update the subnet IP address range after it's delegated to "Microsoft.PowerPlatform/enterprisePolicies"?

No. You can't update the IP address range of the subnet once it's delegated to "Microsoft.PowerPlatform/enterprisePolicies."

## FAQ - Dataverse plug-in and subnet delegation questions

### 1. My virtual network has a custom DNS configured. Does Power Platform use my custom DNS?  

Yes, Power Platform uses the custom DNS configured within the virtual network that holds the delegated subnet to resolve all the endpoints. Once the environment is delegated, you can update plug-in or connector code to use the correct endpoint so that your custom DNS is able to resolve them.

### 2. My environment has ISV-provided plugins. Would these plug-ins run in the delegated subnet?  

Yes. All customer plug-ins and ISV plug-ins can run, using your subnet. If the ISV plug-ins have outbound connectivity, those URLs might need to be listed in your firewall.

### 3. My on-premises endpoint TLS certificates aren't signed by well-known root certification authorities (CA). Do you support unknown certificates?

No. We must ensure the endpoint presents a TLS certificate with the complete chain.  It's not possible to add your custom root CA to our list of well-known CAs.

### 4. What's the recommended setup of a virtual network within a customer tenant?

We don't recommend any specific topology, however the hub and spoke topology network model is widely used by our customers.
