---
title: Plan an ExpressRoute deployment for use with Power Platform
description: Learn the prerequisites and considerations for setting up ExpressRoute to connect Power Platform with your network efficiently.
#customer intent: As a network architect, I want to understand the prerequisites for setting up ExpressRoute so that I can plan the deployment effectively.  
author: taiki-yoshida
ms.topic: concept-article
ms.date: 04/02/2025
ms.subservice: architecture-center
ms.author: tayoshi
ms.reviewer: jhaskett-msft
contributors:
  - rogergilchrist
  - topness-msft
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/02/2025
---

# Plan an ExpressRoute deployment for use with Power Platform

Now that you've decided to use ExpressRoute for Power Platform, your next step is to plan the deployment.

## Prerequisites for using ExpressRoute

Setting up ExpressRoute requires specific prerequisites. Failing to plan for these prerequisites can result in unexpected costs, disrupt the project, and impact the operation of other services.  

### External prerequisites

ExpressRoute doesn't provide the physical connection itself. Instead, it provides the private connectivity over an already established physical connection. The physical connectivity must first be set up by a connectivity provider. There are several ways this connectivity can be established with existing ExpressRoute partners. The ExpressRoute documentation gives detailed explanations of the options and the [currently available partners](/azure/expressroute/expressroute-locations#global-commercial-azure).

As part of planning, take the following into account:

- **Geography**: Understanding where connections need to be made geographically will affect your planning.

- **Cost**: The connectivity provider charges for establishing the private connection. This cost can be significant and vary depending on the type and number of connections needed.

- **Setup time**: In some cases, physical hardware needs to be set up. Incorporate this setup time into the implementation schedule.

- **Configuration skills and resources**: Most of the configuration complexity lies in setting up the internal routing within your network. Ensure skilled people are available to do this.

### Microsoft prerequisites

After the physical connectivity is in place, set up the ExpressRoute connections, which requires:  

- An Azure subscription within which to provision and bill the ExpressRoute circuits.
- Configuration within the Azure subscription of the ExpressRoute circuits, which is done through the Azure tools. 

## Planning the routing configuration for Power Platform traffic across ExpressRoute

When planning for routing Power Platform traffic, you need to take into account the various types of traffic, which depend on how you've configured and used Power Platform.

To understand how to configure ExpressRoute for Power Platform, you need to consider the different uses and connections to and from Power Platform, which depend on the services and features that you use.

### Routing configuration

The routing configuration is done either by the connectivity provider or the customer, depending on the connection type provided.

Although the ExpressRoute connection is between datacenters, the network connection primarily originates from the user's client devices, which are often distributed across a broader WAN, such as bank branches. Connections route from the client device through the WAN to the datacenter and then across the ExpressRoute circuit. 

Careful configuration is required. Set up the WAN so that *either*:  

- The route via the network subnet is configured for ExpressRoute, *or*
- The failover circuit is chosen in preference to the public internet connection to Power Platform.

It's important to identify which subnets within your network should be the targets for the main and fallback Border Gateway Protocol (BGP) session connections, to make sure that Power Platform prefixes prefer that route. It isn't necessary to specifically configure the services at each end, because this configuration is done by advertising the IP subnets/prefixes through this connection. When a request is initiated, the routing algorithm sees that direct BGP connection as the preferred route for traffic to the subnet connected to the ExpressRoute circuit, and directs the traffic that way.

#### Configuring ExpressRoute for distributed user bases

ExpressRoute is designed to provide private, dedicated, and therefore predictable connections from your environment to the Microsoft network. When you have a dedicated and direct connection through the connectivity provider to Microsoft, you reduce the potential for having to contend with other traffic on the connections you share through the connectivity provider's network. While using ExpressRoute isn't required to achieve this quality of connection, it helps ensure it.

In the following example, a user in a branch location has their connection routed via the WAN to the customer datacenter connection to ExpressRoute.

:::image type="content" source="media/routed-via-wan.png" alt-text="Diagram showing traffic from the customer's branch connected to the customer's datacenter through a WAN.":::

Where a customer has a highly distributed network of users, such as a branch network of offices distributed around a country/region, the network traffic needs to be connected efficiently from multiple, highly geographically distributed locations. The typical pattern for this is to route traffic through the WAN to the local network connected to ExpressRoute, as shown in the following image.

:::image type="content" source="media/multiple-wan-config.png" alt-text="Diagram of the WAN network set up for each branch location to the customer's datacenter.":::

If the connection between the client and ExpressRoute is poor, saturated, or inefficient, ExpressRoute can't solve this because connection problems to the ExpressRoute entry point still affect the user experience. Consider using ExpressRoute Direct, which lets you connect directly to Microsoft's global network.

:::image type="content" source="media/poor-wan-network.png" alt-text="Diagram showing one branch with poor WAN network connectivity compared with other branches.":::

When you connect to cloud services and face challenging WAN connections, it can be beneficial to establish local internet breakouts from local branches. This approach avoids slower WAN connections and uses the connectivity provider's reach to achieve a more direct connection to the cloud service.

:::image type="content" source="media/one-branch-connecting-to-internet.png" alt-text="Diagram showing a branch connecting to a Microsoft cloud service without accessing via ExpressRoute.":::

It's possible to set up ExpressRoute circuits from multiple locations&mdash;and even out to individual branch locations&mdash;through a local internet breakout, as shown in the following image.

:::image type="content" source="media/one-branch-connecting-directly-to-expressroute.png" alt-text="Diagram showing one branch connecting directly to the partner edge.":::

Connecting branch locations to a central datacenter via a WAN and setting up ExpressRoute circuits between the customer and Microsoft datacenters is usually more practical than establishing an ExpressRoute connection from each branch office location. Setting up connections in many locations is expensive and complicated to maintain.

An alternative approach is to connect all the branch offices and customer datacenter on the same IP VPN and have the IP VPN service provider connect to Microsoft at an ExpressRoute location.

If you have challenges with a local WAN connection, it's typically better to optimize it&mdash;by adding bandwidth or improving routing&mdash;rather than trying to establish an ExpressRoute connection from each location.

For networks distributed across a wide geographical area, having several hubs connected to ExpressRoute can minimize the number of ExpressRoute connections needed while still offering a local connection point for each user. Ensure that unique public IPs are published via each ExpressRoute circuit. Each subnet must be distinct, which requires as many publicly facing subnets as ExpressRoute connections.

:::image type="content" source="media/two-separate-expressroute-circuit.png" alt-text="Diagram showing use of a separate ExpressRoute circuit for each country/region.":::

This approach is beneficial if different operational areas are located in vastly different geographic areas, or if the network connectivity between the areas is limited and a more direct connection to Microsoft can be established for each area.

Different regions can have different privacy requirements, and not every region needs to use ExpressRoute just because one does. Some connections might route directly through the internet, while others use ExpressRoute, as shown in the following image.

:::image type="content" source="media/one-location-via-expressroute-one-via-internet.png" alt-text="Diagram showing one operation connecting via ExpressRoute, and the other operation connecting directly via the internet.":::

ExpressRoute (standard) offers connectivity within a specific geographic region. ExpressRoute Premium is required to offer multi-geo access from a single ExpressRoute connection point. This would be relevant if, for example, a customer had US-based offices and European offices, all using a single Power Platform environment. If the customer's Power Platform tenant is deployed in the United States, their ExpressRoute circuit in Europe requires the Premium version. If their Power Platform tenant is in Europe, their US circuit must be Premium.

#### Avoiding asymmetric routing

One challenge to watch for is asymmetric routing. In this scenario, the customer network's routing configuration sends traffic to the Microsoft datacenter directly across the internet, but the return traffic is routed via an ExpressRoute circuit. This mismatch can trigger a firewall to reject the traffic because it receives response packets without having sent corresponding request packets.  

:::image type="content" source="media/asymmetric-routing.png" alt-text="Diagram of incorrect routing, resulting in asymmetric routing, with the response rejected by the customer's firewall.":::

This issue can occur if the local network for a client determines that the most efficient routing to Microsoft cloud services is across the public internet rather than through the WAN to the private ExpressRoute circuit. If the client IP address is a public IP address or is translated through NAT (network address translation) mappings to a public IP address advertised through ExpressRoute, the most efficient route back to that IP is likely through the BGP session over ExpressRoute. Use different NAT IPs on your internet edge and ExpressRoute edge. With a distinct source address, return traffic will unambiguously come back to the same edge.   

This issue can also occur when multiple ExpressRoute circuits are configured for the same customer, with outbound traffic routing via one circuit and return routing through another. Firewall checks might block traffic on the return path. To avoid asymmetric routing across a different ExpressRoute circuit for the outbound and inbound paths, ensure that unique public IPs are published across each circuit.

As you can see, it's important to determine how routing is managed within your WAN and to carefully consider the paths to and from Microsoft cloud services.

## External connectivity to/from Power Platform

When connecting to Power Platform from customer locations, consider multiple traffic types. This connection can involve two peering types: Microsoft and private peering. The same ExpressRoute circuit supports both peering types, as shown in the following image.

:::image type="content" source="media/external-connectivity-with-power-platform.png" alt-text="Diagram showing a single ExpressRoute connection to allow both Microsoft peering and private peering network traffic.":::

Different connection types exist between Power Platform services and an external network. For example, Exchange Web Services connectivity using server-side synchronization uses ExpressRoute to pass network traffic from the Microsoft network to the customer network. Web services connectivity uses ExpressRoute for both inbound and outbound traffic to the Microsoft network. For the HTTPS client, the ExpressRoute connection is used for access from the customer network to the Microsoft network. 

:::image type="content" source="media/connection-types-used-in-power-platform.png" alt-text="Screenshot of a diagram showing different connection types that exist between Power Platform services and an external network.":::

### Outbound traffic (traffic from Power Platform services)

Several types of outbound traffic can occur directly from Power Platform services to customer services. The customer service must be publicly addressable with a public IP that resolves through public DNS by Power Platform services.

The IP address also needs to be advertised to Microsoft through ExpressRoute so that the internal network routing within Power Platform services knows to route it via that ExpressRoute connection.

Power Platform services can't specify which service instance or customer organization can make requests to which IP addresses. Therefore, it's important to treat requests inbound to the corporate network as if they were from the internet and secure them as such.

The following table describes outbound traffic from Power Platform services.

| Description                       | Traffic type and direction                  | Peering type          | Purpose                                                                                                   |
|-----------------------------------|---------------------------------------------|-----------------------|-----------------------------------------------------------------------------------------------------------|
| Web services                      | HTTPS outbound from Power Platform services | Microsoft peering<br>Publish web services on public IP addresses that are within ExpressRoute-configured subnets | Custom plugins and workflow activities can make web service requests to external services               |
| Exchange Integration: hybrid mode | HTTPS outbound from Power Platform services | Microsoft peering<br>Web services would need to be published on public IP addresses that are within ExpressRoute-configured subnets | Exchange Web Services requests from server-side synchronization for hybrid deployments (Power Platform services, Exchange on-premises) |
| Connectors                        | HTTPS inbound from Power Platform services  | Microsoft peering     | Requests from Power Platform services through the Azure API Management service via connectors using the on-premises data gateway |
| Azure Relay                       | HTTPS outbound from Power Platform services | Microsoft peering<br>Publish web services on public IP addresses that are within ExpressRoute-configured subnets | Direct connectivity between Power Automate cloud flows and desktop flows                                |

### Inbound traffic (traffic to Power Platform services)

The following inbound traffic is possible to Power Platform services from the customer network.

| Description         | Traffic type and direction               | Peering type     | Purpose                                                                                                   |
|---------------------|------------------------------------------|------------------|-----------------------------------------------------------------------------------------------------------|
| Client connectivity | HTTPS inbound to Power Platform services | Microsoft peering<br>Direct internet connection for static content served by Azure Content Delivery Network | Client requests for Power Platform services UI                                                  |
| Web services        | HTTPS inbound to Power Platform services | Microsoft peering          | Requests to Power Platform services through the web service APIs (SOAP, Web API). Either from a standard or custom client application. |
| Connectors          | HTTPS inbound to Power Platform services | Microsoft peering          | Responses back to Power Platform services through the APIMs via connectors using the on-premises data gateway |

## Internal Cloud connectivity within Power Platform services

Power Platform services use and integrate with several other Microsoft online services hosted both in Microsoft 365 and Azure.

:::image type="content" source="media/internal-network-connection-types.png" alt-text="Screenshot of a diagram showing different connection types that exist between Power Platform services and an internal network.":::

| Description            | Traffic type and direction                     | Purpose                                                                                     |
|------------------------|------------------------------------------------|---------------------------------------------------------------------------------------------|
| Exchange integration   | HTTPS outbound to Microsoft 365                | Exchange web service requests to Exchange Online from Server-Side Synchronization          |
| SharePoint integration | HTTPS outbound to Microsoft 365                | SharePoint web service requests to SharePoint Online from Power Platform services |
| Service Bus            | HTTPS outbound to Azure Service Bus            | Push events to Azure Service Bus either as standard event registration or from custom plug-ins and workflow activities |
| Data sync              | HTTPS inbound from Azure                       | Inbound change tracking requests for synchronization of data services, including search/offline/customer insight |
| Authentication         | HTTPS outbound to Microsoft Entra              | Most authentication is done through passive redirects and claims tokens, but some data is synchronized with Microsoft Entra ID directly |
| Dataflows              | HTTPS outbound to Azure Data Lake Storage      | Provides analytics capabilities and allows access to big data solutions incorporating data from both Power Platform services and other sources, in addition to the resulting insight from analytics. |
| Connectors             | HTTPS outbound to Azure PaaS services          | Connections to various Azure PaaS services                                                 |
| Desktop flows          | HTTPS outbound to Azure Relay                  | Direct connectivity between Power Automate cloud flows and desktop flows created in Power Automate for desktop |

The actual connectivity between these services, hosted either in Microsoft or customer Azure subscriptions, is handled by Microsoft. ExpressRoute isn't applicable for connections with these services.

Where events are pushed onto the service bus, the connectivity between Power Platform services and Azure is handled internally. Separately, the customer can make requests to the Service Bus to retrieve information, which can be managed through Microsoft peering.

## Customer public and private cloud connectivity to/from Power Platform services

Power Platform services also allow direct integration with public or private Azure resources:

- From external sources, by using the Microsoft Dataverse web services APIs.
- To external sources, by using web service requests made.
- To external sources, by using connectors.

Consider the implications for ExpressRoute routing.

| Description          | Traffic type and direction                       | Peering type     | Purpose          |
|----------------------|--------------------------------------------------|------------------|------------------|
| Portals              | HTTPS inbound to Azure                           | Internal to datacenter, with the exception of static content, which uses Content Delivery Network. (Content Delivery Network isn't supported by ExpressRoute, so static content will travel across the public internet.) | Host public-facing services. There might be scenarios where internal employees can access these resources, so you might want traffic to travel across ExpressRoute rather than the public internet. |
| Learning Path        | HTTPS inbound to Azure                           | Uses Content Delivery Network, which isn't supported by ExpressRoute, so content will travel across the public internet | This is hosted on a public-facing service because it doesn't contain private customer data. For predictability purposes, there might be scenarios where you want to route this via ExpressRoute. |
| Service Bus          | HTTPS inbound to Azure Service Bus               | Internal to datacenter        | Pull events from Azure Service Bus that have been placed there either as standard event registration or from custom plugins or workflow activities. |
| Web service requests | Inbound from Azure IaaS/PaaS                     | Internal to datacenter       | Customers can host custom applications in Azure and make requests of Power Platform web services. |
| Web service requests | Outbound to Azure IaaS/PaaS                      | Internal to datacenter      | Customers can implement custom plugins and workflow activities that make requests of Azure hosted services. |
| Dataflows            | Data connections to Azure Data Lake Storage      | Internal to datacenter     | Provide analytics capabilities and allow access to big data solutions incorporating data from both Power Platform services and other sources, in addition to the resulting insight from the analytics. |
| Azure Data Lake      | Data connections to Azure Data Lake Storage      | Internal to datacenter       | Provide analytics capabilities and allow access to big data solutions incorporating data from both Power Platform services and other sources and the resulting insight from the analytics. |
| Azure SQL            | Data connections to Azure SQL services           | Internal to datacenter     | With capabilities such as Export to Data Warehouse, the use of an Azure SQL instance to hold replicas of Microsoft Dataverse data either for reporting or replication purposes will increase. It might be valuable to protect connections to these resources over ExpressRoute. |

Other public services might connect internally to the datacenter as additional Azure capabilities are used.  

## Next step

> [!div class="nextstepaction"]
> [Set up ExpressRoute for Power Platform](setup.md)