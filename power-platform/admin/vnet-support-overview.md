---
title: Virtual Network support for Power Platform overview (preview)
description: Learn about Azure Virtual Network support for Microsoft Power Platform and Dynamics 365 apps, understanding prerequisites and support plans to optimize your environment.
ms.date: 2/15/2024
ms.topic: overview
ms.component: pa-admin
ms.subservice: admin
author: ritesp
ms.author: ritesp
search.audienceType: admin
ms.custom: "admin-security"
---

# Virtual Network support for Power Platform overview (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

With [Azure Virtual Network](/azure/virtual-network/virtual-networks-overview) support for Power Platform, you can integrate Power Platform with resources inside your virtual network without exposing them over the public internet. Virtual Network support uses [Azure subnet delegation](/azure/virtual-network/subnet-delegation-overview) to manage outbound traffic from Power Platform at runtime. Using a delegate avoids the need for protected resources to travel over the internet to integrate with Power Platform. Virtual Network, Dataverse, and Power Platform components can call resources owned by your enterprise inside your network, whether they're hosted in Azure or on-premises, and use plug-ins and connectors to make outbound calls.

Power Platform offers two ways to securely connect to enterprise resources:
- **Virtual network support for Power Platform:** Virtual Network support for Power Platform is optimized to handle API workloads with a high request volume and low execution time for requests.
- **Virtual network (VNet) data gateway:** [Virtual Network Data Gateway](https://learn.microsoft.com/data-integration/vnet/overview) is optimized to handle ETL (Extract, Transform, Load) workloads with a low request volume and high execution time for requests.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note.md)]

Power Platform typically integrates with enterprise resources over public networks. With public networks, enterprise resources must be accessible from a list of Azure IP ranges or service tags, which describe public IP addresses. However, Azure Virtual Network support for Power Platform allows you to use a private network and _still_ integrate with cloud services or services that are hosted inside your enterprise network.

Azure services are protected inside a virtual network by [private endpoints](/azure/private-link/private-endpoint-overview). You can use [Express Route](/azure/expressroute/) to bring your on-premises resources inside the virtual network.

Power Platform uses the virtual network and subnets that you delegate to make outbound calls to enterprise resources over the enterprise private network. Using a private network eliminates the need to route the traffic over the public internet, which could expose enterprise resources.

In a virtual network, you have full control over the outbound traffic from Power Platform. The traffic is subject to network policies applied by your network administrator. The following diagram shows how resources inside your network interact with a virtual network.

:::image type="content" source="media/vnet-support/vnet-support-traffic.png" alt-text="Screenshot that shows how resources inside an enterprise network interact with a virtual network." lightbox="media/vnet-support/vnet-support-traffic.png":::

## Benefits of Virtual Network support

With Virtual Network support, your Power Platform and Dataverse components get all the [benefits](/azure/virtual-network/subnet-delegation-overview#advantages-of-subnet-delegation) that Azure subnet delegation provides, such as:

- **Data protection**: Virtual Network allows Power Platform services to connect to your private and protected resources without exposing them to the internet.

- **No unauthorized access**: Virtual Network connects with your resources without needing Power Platform IP ranges or service tags in the connection.

## Supported scenarios

Power Platform supports Dataverse plug-ins, connectors, and with a virtual network, you can use secured, private, outbound connectivity with partner software. For example, Dataverse plug-ins and connectors enhance data integration security with external data sources from your Power Apps, Power Automate, and Dynamics 365 apps. We plan to extend virtual network support to more Power Platform scenarios. For now, you can:

- Use Dataverse plug-ins to connect to your on-premises data sources such as SQL server, Oracle, or SAP. You protect your data from data breaches and other external threats.

- Use other partner plug-ins to connect to your cloud data sources such as Azure SQL, Azure Storage, blob storage, or Azure Key Vault. You protect your data from data exfiltration and other incidents.
  
- Use the SQL Connector to securely connect to your cloud-hosted data sources, such as Azure SQL or SQL Server, without exposing them to the internet. Similarly, you can use Azure Queue to establish secure connections to private endpoint-enabled Azure Queues.

### Limitations

- [Dataverse low-code plug-ins](/power-apps/maker/data-platform/low-code-plug-ins) that use connectors aren't supported until those connector types are updated to use subnet delegation.

## Supported regions

Confirm that your Power Platform environment and enterprise policy are in supported Power Platform and Azure regions. For example, if your Power Platform environment is in the United States, then your virtual network, subnets, and enterprise policy must be in the `eastus` or `westus` Azure region.

| Power Platform region | Azure region |
|-----------------------|--------------|
| United States | eastus, westus |
| South Africa  | eouthafricanorth, southafricawest |
| Uk | uksouth, ukwest |
| Japan | japaneast, japanwest |
| India | centralindia, southindia |
| France | francecentral, francesouth |
| Europe | westeurope, northeurope |
| Germany | germanynorth, germanywestcentral |
| Switzerland | switzerlandnorth, switzerlandwest |
| Canada | canadacentral, canadaeast |
| Brazil | brazilsouth, southcentralus |
| Australia | australiasoutheast, australiaeast |
| Asia | eastasia, southeastasia |
| UAE | uaecentral, uaenorth |
| Korea | koreasouth, koreacentral |
| Norway | norwaywest, norwayeast |
| Singapore | southeastasia |
| Sweden | swedencentral |

## Supported services

The following table lists the services that support Azure subnet delegation for Virtual Network support for Power Platform.

| Area | Power Platform services | Virtual Network support |
|------------|-------------------|--------------|
| Dataverse | Dataverse plug-ins | Public preview |
| Connectors | SQL | Public preview |
|| Azure Queue | Public Preview|


## Licensing requirements

Licensing requirements for Virtual Network support for Power Platform will be announced when the service is closer to general availability.

## Considerations to enable virtual network support for Power Platform Environment

When you use virtual network support in a Power Platform environment, all supported services, like Dataverse plug-ins, connectors, execute requests at runtime in your delegated subnet and are subject to your network policies. The calls to publicly available resources would start to break.

 > [!IMPORTANT]
 >  Before you enable the virtual environment support for Power Platform environment, make sure you check the code of the plug-ins and the connectors. The URL’s/connections need to be updated to work with private connectivity.

For example, a plug-in might try to connect to a publicly available service, but your network policy doesn't allow public internet access within your virtual network. The call from the plugin is blocked in accordance with your network policy. To avoid the blocked call, you can host the publicly available service in your virtual network. Alternatively, if your service is hosted in Azure, you can use a private endpoint on the service before you turn on virtual network support in the Power Platform environment.

## FAQ

### What's the difference between a virtual network data gateway and Azure Virtual Network support for Power Platform?

A [virtual network data gateway](/data-integration/vnet/data-gateway-architecture#hardware) is a managed gateway that allows you to access Azure and Power Platform services from within your virtual network without having to set up an on-premises data gateway. For example, the gateway is optimized for ETL (extract, transform, load) workloads in Power BI and Power Platform dataflows.

Azure Virtual Network support for Power Platform uses an Azure subnet delegation for your Power Platform environment. Subnets are used by workloads in the Power Platform environment. Power Platform API workloads use virtual network support because the requests are short-lived and optimized for a large number of requests.

### How do you ensure that a virtual network subnet or data gateway from one customer isn't used by another customer in Power Platform?

- Virtual Network support for Power Platform uses [Azure subnet delegation](/azure/virtual-network/subnet-delegation-overview).

- Each Power Platform environment is linked to one virtual network subnet. Only calls from that environment are allowed to access that virtual network.

- Delegation allows you to designate a specific subnet for any Azure platform as a service (PaaS) that needs to be injected into your virtual network.

### Does Virtual Network support for Power Platform support failover?

Yes. While the feature is in public preview, you need to delegate a primary and failover virtual network and subnets during setup.

### How can a Power Platform environment in one region connect to resources hosted in another region?

A virtual network linked to a Power Platform environment must reside in the [Power Platform environment's region](/power-platform/admin/regions-overview#what-regions-are-available). If the virtual network is in a different region, create a virtual network in the Power Platform environment's region and use [virtual network peering](/azure/virtual-network/virtual-network-peering-overview) to bridge the two regions.

### Can I monitor outbound traffic from delegated subnets?

Yes. You can use Network Security Group and firewalls to monitor outbound traffic from delegated subnets.

### How many IP addresses does Power Platform need to be delegated in the subnet?

You need to delegate at least 24 Classless Inter-Domain Routing (CIDR), or 255 IP addresses, in the subnet. If you want to delegate the same subnet to multiple environments, you might need more IP addresses in that subnet.

### Can I make internet-bound calls from plug-ins after my environment is subnet-delegated?

Yes. You can make internet-bound calls from plug-ins, but the subnet must be configured with an [Azure NAT gateway](/azure/nat-gateway/nat-overview).

### Can I update the subnet IP address range after it's delegated to "Microsoft.PowerPlatform/enterprisePolicies"?

No. You can't change the IP address range of the subnet after it's delegated to "Microsoft.PowerPlatform/enterprisePolicies."

### My virtual network has a custom DNS configured. Does Power Platform use my custom DNS?

Yes. Power Platform uses the custom DNS configured in the virtual network that holds the delegated subnet to resolve all endpoints. After the environment is delegated, you can update plug-ins to use the correct endpoint so that your custom DNS can resolve them.

### My environment has ISV-provided plug-ins. Would these plug-ins run in the delegated subnet?

Yes. All customer plug-ins and ISV plug-ins can run, using your subnet. If the ISV plug-ins have outbound connectivity, those URLs might need to be listed in your firewall.

### My on-premises endpoint TLS certificates aren't signed by well-known root certification authorities (CA). Do you support unknown certificates?

No. We must ensure the endpoint presents a TLS certificate with the complete chain. It's not possible to add your custom root CA to our list of well-known CAs.

### What's the recommended setup of a virtual network within a customer tenant?

We don't recommend any specific topology. However, our customers widely use the hub and spoke topology network model.

## Next steps

[Set up Virtual Network support](vnet-support-setup-configure.md)
