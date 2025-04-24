---
title: Plan an ExpressRoute deployment for use with Power Platform
description: Learn the prerequisites and considerations for setting up ExpressRoute to connect Power Platform with your network efficiently.
#customer intent: As a network architect, I want to understand the prerequisites for setting up ExpressRoute so that I can plan the deployment effectively.  
author: taiki-yoshida
ms.topic: best-practice
ms.date: 04/17/2025
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

After you decide to use ExpressRoute for Power Platform, your next step is to plan the deployment. This article provides guidance on prerequisites and considerations.

## Prerequisites for using ExpressRoute

ExpressRoute requires specific prerequisites. Failing to plan for them can result in unexpected costs, disrupt the project, and affect the operation of other services.

- **A physical connection set up by a connectivity provider**. ExpressRoute doesn't provide the physical connection itself. Instead, it provides private connectivity over an established physical connection, which must be set up by a connectivity provider. Physical connectivity can be established with ExpressRoute partners in several ways. Learn more in [ExpressRoute documentation](/azure/expressroute/) and check the [list of partners in your region](/azure/expressroute/expressroute-locations#global-commercial-azure).

- **An Azure subscription**. Provision, configure, and bill the ExpressRoute circuits in this subscription.

## Plan the deployment

As part of planning, take the following factors into account:

- **Geography**: Understand where connections need to be made geographically.

- **Cost**: The connectivity provider charges for establishing the private connection. The cost can be significant and vary depending on the type and number of connections you need.

- **Setup time**: In some cases, physical hardware needs to be set up. Incorporate time for this effort into the implementation schedule.

- **Configuration skills and resources**: Most of the complexity lies in setting up the internal routing in your network. Make sure that skilled people are available to do this work.

## Plan the routing configuration for Power Platform traffic across ExpressRoute

You or the connectivity provider configure the routing of Power Platform traffic through ExpressRoute, depending on the connection type. When you plan for routing Power Platform traffic, account for the types of traffic the connection will handle and the connections to and from Power Platform, which depend on the services and features you use.

Although the ExpressRoute connection is between datacenters, the network connection primarily originates from the user's client devices. These devices are often distributed across a wide area network (WAN), such as branch offices. Connections route from the client device through the WAN to the datacenter and then across the ExpressRoute circuit.

Be careful with this configuration. Set up the WAN so that *either*:  

- The route through the network subnet is configured for ExpressRoute, *or*
- The failover circuit is chosen in preference to the public internet connection to Power Platform.

It's important to identify which subnets in your network should be the targets for the main and fallback Border Gateway Protocol (BGP) session connections. Make sure that Power Platform prefixes prefer that route. It isn't necessary to specifically configure the services at each end. That configuration is done by advertising the IP subnets or prefixes through the connection. When a request is initiated, the routing algorithm sees that direct BGP connection as the preferred route for traffic to the subnet connected to the ExpressRoute circuit, and directs the traffic that way.

### Configure ExpressRoute for distributed user bases

ExpressRoute is designed to provide private, dedicated, and predictable connections from your environment to the Microsoft network. A dedicated and direct connection through the connectivity provider to Microsoft reduces the potential for contending with other traffic on the connections you share through the connectivity provider's network. Using ExpressRoute isn't required to achieve this quality of connection, but it helps ensure it.

In the following example, a user in a branch location connects to the company's datacenter connection to ExpressRoute through the WAN.

:::image type="content" source="media/routed-via-wan.png" alt-text="Diagram showing traffic from the customer's branch connected to the customer's datacenter through a WAN.":::

If your users are highly distributed, such as at branch offices located throughout a country/region, the network traffic needs to be connected efficiently from multiple geographically separated locations. The typical pattern is to route traffic through the WAN to the local network connected to ExpressRoute, as shown in the following image.

:::image type="content" source="media/multiple-wan-config.png" alt-text="Diagram of the WAN network setup for each branch location to the customer's datacenter.":::

ExpressRoute can't solve poor, saturated, or inefficient connections between the client device and ExpressRoute. Consider using [ExpressRoute Direct](/azure/expressroute/expressroute-erdirect-about), which lets you connect directly to Microsoft's global network.

:::image type="content" source="media/poor-wan-network.png" alt-text="Diagram showing one branch with poor WAN network connectivity compared with other branches.":::

When you face challenging WAN connections, it can be helpful to establish local internet breakouts from branch offices. This approach avoids slower WAN connections and uses the connectivity provider's reach to achieve a more direct connection to the cloud service.

:::image type="content" source="media/one-branch-connecting-to-internet.png" alt-text="Diagram showing a branch connecting to a Microsoft cloud service bypassing ExpressRoute.":::

You can set up ExpressRoute circuits from multiple locations&mdash;and even out to individual branch locations&mdash;through a local internet breakout, as shown in the following image.

:::image type="content" source="media/one-branch-connecting-directly-to-expressroute.png" alt-text="Diagram showing one branch connecting directly to the partner edge.":::

To mitigate WAN connectivity problems, you could set up an ExpressRoute connection from each branch office. However, setting up connections in many locations is expensive and complicated to maintain. You have more practical alternatives:

- You can connect branch locations to a central datacenter through a WAN and set up an ExpressRoute connection from the central datacenter.

- You can optimize the WAN connection by adding bandwidth or improving routing.

- You can connect all the branch offices and your datacenter on the same IP virtual private network (VPN), and have the IP VPN service provider connect to Microsoft at an ExpressRoute location.

For networks that are distributed across a wide geographical area, having several hubs connected to ExpressRoute can minimize the number of ExpressRoute connections needed while still offering a local connection point for each user. Make sure that unique public IPs are published through each ExpressRoute circuit. Each subnet must be distinct, which requires as many publicly facing subnets as ExpressRoute connections.

:::image type="content" source="media/two-separate-expressroute-circuit.png" alt-text="Diagram showing use of a separate ExpressRoute circuit for each country/region.":::

This approach is helpful if different operational areas are located in vastly different geographic areas, or if the network connectivity between the areas is limited and a more direct connection to Microsoft can be established for each area.

Different regions can have different privacy requirements. Not every region needs to use ExpressRoute just because one does. Some connections might route directly through the internet while others use ExpressRoute, as shown in the following image.

:::image type="content" source="media/one-location-via-expressroute-one-via-internet.png" alt-text="Diagram showing one operation connecting through ExpressRoute, and the other operation connecting directly through the internet.":::

ExpressRoute (standard) offers connectivity in a specific geographic region. ExpressRoute Premium is required to offer multi-geo access from a single ExpressRoute connection point. Let's say that you have US-based offices and European offices, all using a single Power Platform environment. If your Power Platform tenant is deployed in the United States, your ExpressRoute circuit in Europe requires the Premium version. If your Power Platform tenant is in Europe, your US circuit must be Premium.

### Avoid asymmetric routing

One challenge to watch for is asymmetric routing. In asymmetric routing, your network's routing configuration sends traffic to the Microsoft datacenter directly across the internet, but the return traffic is routed through an ExpressRoute circuit. This mismatch can trigger a firewall to reject the traffic because it receives response packets without having sent corresponding request packets.

:::image type="content" source="media/asymmetric-routing.png" alt-text="Diagram of incorrect routing, resulting in asymmetric routing, with the response rejected by the customer's firewall.":::

Asymmetric routing can occur if the local network for a client determines that the most efficient routing to Microsoft cloud services is across the public internet rather than through the WAN to the private ExpressRoute circuit. If the client IP address is a public IP address or is translated through network address translation (NAT) mappings to a public IP address advertised through ExpressRoute, the most efficient route back to that address is likely through the BGP session over ExpressRoute. To avoid this situation, use different NAT IPs on your internet edge and ExpressRoute edge. With a distinct source address, return traffic unambiguously comes back to the same edge.

Asymmetric routing can also occur when multiple ExpressRoute circuits are configured for the same customer, with outbound traffic routing through one circuit and return traffic routing through another. Firewall checks might block traffic on the return path. To avoid asymmetric routing across a different ExpressRoute circuit for the outbound and inbound paths, make sure that unique public IPs are published across each circuit.

## External connectivity to/from Power Platform

When you connect to Power Platform from your locations, the connection can involve two types of peering, Microsoft and private. The same ExpressRoute circuit supports both peering types, as shown in the following image.

:::image type="content" source="media/external-connectivity-with-power-platform.png" alt-text="Diagram showing a single ExpressRoute connection to allow both Microsoft peering and private peering network traffic.":::

Different connection types exist between Power Platform services and an external network. For example, Exchange Web Services connectivity using server-side synchronization uses ExpressRoute to pass network traffic from the Microsoft network to the customer network. The HTTPS client uses the ExpressRoute connection for access from the customer network to the Microsoft network. Web services connectivity uses ExpressRoute for both inbound and outbound traffic to the Microsoft network.

:::image type="content" source="media/connection-types-used-in-power-platform.png" alt-text="Screenshot of a diagram showing different connection types that exist between Power Platform services and an external network.":::

### Outbound traffic (traffic from Power Platform services)

Several types of outbound traffic can pass directly from Power Platform services to customer services. The customer service must be publicly addressable, with a public IP address that Power Platform services can resolve through public DNS. The IP address also needs to be advertised to Microsoft through ExpressRoute so that the internal network routing in Power Platform services knows to route traffic through that ExpressRoute connection.

Power Platform services can't specify which service instance or customer organization can make requests to which IP addresses. Therefore, it's important to treat requests that are inbound to the corporate network as if they were from the internet and secure them as such.

The following table describes outbound traffic from Power Platform services.

| Description | Traffic type and direction | Peering type | Purpose |
| --- | --- | --- | --- |
| Web services | HTTPS outbound from Power Platform services | Microsoft peering<br>Publish web services on public IP addresses that are in ExpressRoute-configured subnets. | Custom plug-ins and workflow activities make web service requests to external services |
| Exchange integration: hybrid mode | HTTPS outbound from Power Platform services | Microsoft peering<br>Publish web services on public IP addresses that are in ExpressRoute-configured subnets. | Exchange Web Services requests from server-side synchronization for hybrid deployments (Power Platform services, Exchange on-premises) |
| Connectors | HTTPS inbound from Power Platform services | Microsoft peering | Requests from Power Platform services through Azure API Management through connectors using the on-premises data gateway |
| Azure Relay | HTTPS outbound from Power Platform services | Microsoft peering<br>Publish web services on public IP addresses that are in ExpressRoute-configured subnets. | Direct connectivity between Power Automate cloud flows and desktop flows |

### Inbound traffic (traffic to Power Platform services)

The following table describes inbound traffic to Power Platform services from the customer network.

| Description | Traffic type and direction | Peering type | Purpose |
| --- | --- | --- | --- |
| Client connectivity | HTTPS inbound to Power Platform services | Microsoft peering<br>Direct internet connection for static content served by Azure Content Delivery Network | Client requests for Power Platform services UI |
| Web services | HTTPS inbound to Power Platform services | Microsoft peering | Requests to Power Platform services through the web service APIs (SOAP, Web API), either from a standard or a custom client application |
| Connectors | HTTPS inbound to Power Platform services | Microsoft peering | Responses back to Power Platform services through API Management through connectors using the on-premises data gateway |

### Internal cloud connectivity in Power Platform services

:::image type="content" source="media/internal-network-connection-types.png" alt-text="Screenshot of a diagram showing different connection types that exist between Power Platform services and an internal network.":::

The following table describes how Power Platform services use and integrate with other Microsoft online services hosted in Microsoft 365 and Azure.

| Description | Traffic type and direction | Purpose |
| --- | --- | --- |
| Exchange integration | HTTPS outbound to Microsoft 365 | Exchange Web Service requests to Exchange Online from server-side synchronization |
| SharePoint integration | HTTPS outbound to Microsoft 365 | SharePoint Web Service requests to SharePoint Online from Power Platform services |
| Service Bus | HTTPS outbound to Azure Service Bus | Push events to Azure Service Bus either as standard event registration or from custom plug-ins and workflow activities |
| Data sync | HTTPS inbound from Azure | Inbound change tracking requests for synchronization of data services, including search/offline/customer insight |
| Authentication | HTTPS outbound to Microsoft Entra | Most authentication is done through passive redirects and claims tokens, but some data is synchronized with Microsoft Entra ID directly. |
| Dataflows | HTTPS outbound to Azure Data Lake Storage | Provides analytics capabilities and allows access to big data solutions incorporating data from Power Platform services and other sources, in addition to the resulting insight from analytics. |
| Connectors | HTTPS outbound to Azure platform as a service (PaaS) services | Connections to various Azure PaaS services |
| Desktop flows | HTTPS outbound to Azure Relay | Direct connectivity between Power Automate cloud flows and desktop flows created in Power Automate for desktop |

Microsoft handles the connectivity between these services, hosted either in Microsoft or customer Azure subscriptions. ExpressRoute isn't applicable for connections with these services.

Where events are pushed onto Service Bus, the connectivity between Power Platform services and Azure is handled internally. Separately, the customer can make requests to Service Bus to retrieve information, which can be managed through Microsoft peering.

## Customer public and private cloud connectivity to/from Power Platform services

Power Platform services also allow direct integration with public or private Azure resources:

- From external sources, by using the Microsoft Dataverse web services APIs.
- To external sources, by using web service requests made.
- To external sources, by using connectors.

The following table describes the types of traffic that can be routed through ExpressRoute to and from Power Platform services.

| Description | Traffic type and direction | Peering type | Purpose |
|--|--|--|--|
| Portals | HTTPS inbound to Azure | Internal to datacenter, except for static content, which uses Content Delivery Network (CDN). ExpressRoute doesn't support CDN, so static content travels across the public internet. | Host public-facing services. If internal employees can access these resources, you might want traffic to travel across ExpressRoute rather than the public internet. |
| Learning Path | HTTPS inbound to Azure | Uses CDN. ExpressRoute doesn't support CDN, so content travels across the public internet. | Hosted on a public-facing service because it doesn't contain private customer data. For predictability purposes, you might want to route this traffic through ExpressRoute. |
| Service Bus | HTTPS inbound to Azure Service Bus | Internal to datacenter | Pull events from Azure Service Bus that have been placed there either as standard event registration or from custom plug-ins or workflow activities |
| Web service requests | Inbound from Azure infrastructure as a service (IaaS) or PaaS | Internal to datacenter | Customers can host custom applications in Azure and make requests of Power Platform web services. |
| Web service requests | Outbound to Azure IaaS/PaaS | Internal to datacenter | Customers can implement custom plug-ins and workflow activities that make requests of Azure hosted services. |
| Dataflows | Data connections to Azure Data Lake Storage | Internal to datacenter | Provide analytics capabilities and allow access to big data solutions incorporating data from Power Platform services and other sources, in addition to the resulting insight from the analytics. |
| Azure Data Lake | Data connections to Azure Data Lake Storage | Internal to datacenter | Provide analytics capabilities and allow access to big data solutions incorporating data from Power Platform services and other sources and the resulting insight from the analytics. |
| Azure SQL | Data connections to Azure SQL services | Internal to datacenter | With capabilities such as Export to Data Warehouse, the use of an Azure SQL instance to hold replicas of Microsoft Dataverse data either for reporting or replication purposes will increase. It might be valuable to protect connections to these resources over ExpressRoute. |

Other public services might connect internally to the datacenter as more Azure capabilities are used.

## Next step

> [!div class="nextstepaction"]
> [Set up ExpressRoute for Power Platform](setup.md)
