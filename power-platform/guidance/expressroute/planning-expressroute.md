---
title: "Plan to deploy ExpressRoute with Microsoft Power Platform | MicrosoftDocs"
description: "Points to consider before setting up ExpressRoute`"
author: taiki-yoshida
ms.service: power-platform
ms.topic: conceptual
ms.date: 10/08/2021
ms.subservice: guidance
ms.author: tayoshi
ms.reviewer: kathyos
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
contributors:
  - rogergilchrist
  - topness-msft
---

# Plan an ExpressRoute deployment for use with Microsoft Power Platform

Now that you've decided to use ExpressRoute for Microsoft Power Platform, it's
important to plan the deployment to allow for your needs and
environment.

## Prerequisites for ExpressRoute

Setting up ExpressRoute requires several prerequisites to be considered and set
up. These can lead to unexpected costs and activities, which if not planned for
can affect the project and the continuing operation of other services.

### External prerequisites

ExpressRoute doesn't provide the physical connection itself; it provides the
private connectivity over an already established physical connection. The
physical connectivity must first be set up by a connectivity provider. There are
several ways this connectivity can be established with existing ExpressRoute
partners. The ExpressRoute documentation gives detailed explanations of the
options and the [currently available partners](/azure/expressroute/expressroute-locations#global-commercial-azure).

As part of planning, you'll need to take the following into account:

- **Geography**: As we'll discuss in more detail later, understanding geographically where one or more connections need to be made from will affect your overall planning.

- **Cost**: The connectivity provider will charge for establishing the
    private connection. This can be a significant cost; it will vary depending on the type and number of connections needed.

- **Setup time**: In some cases, physical hardware will need to be set up. This setup time will need to be incorporated into the implementation schedule.

- **Configuration skills and resources**: Most of the configuration complexity lies in setting up the internal routing within your network. It's essential that you ensure that skilled people are available to do this.

### Microsoft prerequisites

After the physical connectivity is in place, you can proceed to set up the
ExpressRoute connections themselves. This will require:

-   An Azure subscription within which to provision and bill the ExpressRoute
    circuits.

-   Configuration within the Azure subscription of the ExpressRoute circuits,
    which is done through the Azure tools.

## Planning the routing configuration for Microsoft Power Platform traffic across ExpressRoute

When planning for routing Microsoft Power Platform traffic, you'll need to take into account the various types of
traffic, which depend on how you've configured and used Microsoft Power Platform.

To understand how to configure ExpressRoute for Microsoft Power Platform, you'll need to consider the different
uses and connections to and from Microsoft Power Platform, which depend on the services and features that you use.

### Routing configuration

The routing configuration is done either by the connectivity provider or the
customer, depending on the connection type provided.

Although the ExpressRoute connection itself is between datacenters, the actual
network connection is mostly from the user's client devices (which will often
be distributed across a broader WAN, for example distributed bank branches).
This means that connections are routed from the location of the client device through the
WAN to the datacenter and then across the ExpressRoute circuit. This requires careful
configuration. The WAN must be set up in such a way that:

- The route via the network subnet is configured for ExpressRoute.

  or

- The failover circuit is chosen in preference to the public internet
    connection to Microsoft Power Platform.

Therefore, it's important to identify which subnets within your network should be the
targets for the main and fallback Border Gateway Protocol (BGP) session connections, to make
sure that Microsoft Power Platform prefixes prefer that route. It isn't necessary to
specifically configure the services at each end, because this configuration is done
by advertising the IP subnets/prefixes through this connection. When a request
is initiated, the routing algorithm sees that direct BGP connection as the
preferred route for traffic to the subnet connected to the ExpressRoute circuit,
and directs the traffic that way.

#### Configuring ExpressRoute for distributed user bases

ExpressRoute is designed to provide private, dedicated, and therefore predictable
connections from your environment to the Microsoft network. When you have a
dedicated and direct connection through the connectivity provider to Microsoft, you
reduce the potential for having to contend with other traffic on the
connections you share through the connectivity provider's network. It shouldn't be
necessary to use ExpressRoute to achieve this quality of connection through
a connectivity provider, but it's a way to help ensure it.

In the following example, a user in a branch location has their
connection routed via the WAN to the customer datacenter connection to
ExpressRoute.

![Traffic from the customer's branch is connected to the customer's datacenter through a WAN.](media/routed-via-wan.png)

Where a customer has a highly distributed network of users, such as a branch
network of offices distributed around a country, the network traffic needs
to be connected efficiently from multiple, highly geographically distributed
locations. The typical pattern for this is to route things through
the WAN to the local network connected to ExpressRoute, as shown in the following image.

![The WAN network is set up for each branch location to the customer's datacenter.](media/multiple-wan-config.png)

If the connection between the client and ExpressRoute is poor, or is
saturated or inefficient in some other way, ExpressRoute won't be able to solve this, because
the connection problems in getting to the ExpressRoute entry point will still
affect the user experience. In a case like this, you should consider using ExpressRoute Direct, which
gives you the ability to connect directly to Microsoft's global network.

![One branch has a poor WAN network connectivity compared with other branches.](media/poor-wan-network.png)

When connecting to cloud services and being constrained by challenging WAN
connections, it can be beneficial to establish local internet breakouts from local branches. This will avoid the slower WAN connection and
take advantage of the reach of the connectivity provider to achieve a more direct
connection to the cloud service.

![One branch is connecting to a Microsoft cloud service without accessing via ExpressRoute.](media/one-branch-connecting-to-internet.png)

It's possible to set up ExpressRoute circuits from multiple locations&mdash;and even
out to individual branch locations&mdash;through a local internet breakout, as shown in the
following image.

![One branch is connecting directly to the partner edge.](media/one-branch-connecting-directly-to-expressroute.png)

The approach of connecting branch locations to a central datacenter via a WAN and establishing ExpressRoute
circuits between the customer and Microsoft datacenters is typically preferable
and more practical than trying to establish an ExpressRoute connection from each
branch office location. That would be relatively expensive and complicated to
set up and maintain, if this were required in many locations.

An alternative approach is to connect all the branch offices and customer datacenter on the same IP VPN and have the IP VPN service provider connect to
Microsoft at an ExpressRoute location.

If you have challenges with a local WAN connection, it's typically better
to optimize that&mdash;through methods such as gaining additional bandwidth or optimizing the
routing&mdash;rather than trying to establish an ExpressRoute connection from each
location.

For networks that are distributed across a wide geographical area, it might be valuable to have several
hubs connected to ExpressRoute to minimize the number of ExpressRoute
connections needed while still offering a more local connection point for each
user. In this case, it's important to ensure that unique public IPs are published
via each ExpressRoute circuit; each of these subnets must be distinct, which
requires that you have as many publicly facing subnets as ExpressRoute connections.

![A separate ExpressRoute circuit is used for each country.](media/two-separate-expressroute-circuit.png)

This is particularly beneficial if different operational areas are located in vastly
different geographic areas, or if the network connectivity between the areas is
limited and a more direct connection to Microsoft can be established for each.

It's also possible for different regions to have different privacy requirements,
and it's not necessary for every region to use ExpressRoute simply because one
does. It might be possible for some connections to be routed directly through the
internet and others through ExpressRoute, as shown in the following image.

![One operation connects via ExpressRoute, and the other operation connects directly via the internet.](media/one-location-via-expressroute-one-via-internet.png)

ExpressRoute (standard) offers connectivity only within a specific geographic
region; ExpressRoute Premium is required to offer multi-geo access from a single
ExpressRoute connection point. This would be relevant if, for example, a
customer had US-based offices and European offices, all using a single
Microsoft Power Platform environment. If the customer's Microsoft Power Platform tenant is deployed
in the United States, their ExpressRoute circuit in Europe needs to be the Premium SKU. If
their Microsoft Power Platform tenant is in Europe, their US circuit would need to be
Premium.

#### Avoiding asymmetric routing

One challenge to watch for is asymmetric routing, where routing configuration
within the customer network routes traffic to the Microsoft datacenter directly
across the internet but then the return traffic determines that the responses
should be routed via an ExpressRoute circuit. This can often trigger a firewall
to reject the traffic, because it receives response packets without having sent
the request packets.

![Incorrect routing is set up, resulting in asymmetric routing, and the response is rejected by the customer's firewall.](media/asymmetric-routing.png)

This can happen if the local network for a client determines that the most
efficient routing to Microsoft cloud services is across the public internet
rather than through the WAN to the private ExpressRoute circuit. But if
the client IP address is either a public IP address or is translated
through NAT mappings to a public IP address that's advertised through
ExpressRoute, the most efficient route back to that IP would likely be through
the BGP session over ExpressRoute. You can use different NAT IPs on your
internet edge and ExpressRoute edge. With a distinct source address,
return traffic will unambiguously come back to the same edge.

This can also happen where there are multiple ExpressRoute circuits configured
for the same customer with outbound traffic routing via one circuit but return
routing through another where firewall checks can block traffic through the
return path. To avoid asymmetric routing across a different ExpressRoute circuit
for the outbound and inbound paths, it's important to ensure that unique public
IPs are published across each circuit.

As you can see, it's important to determine how the routing is managed within
your WAN and ensure that the paths to and from Microsoft cloud
services are carefully considered.

## External connectivity to/from Microsoft Power Platform

When making connections to Microsoft Power Platform from customer locations, there are
multiple traffic types to consider. This can lead to both peering types,
Microsoft and private peering, and the same ExpressRoute circuit can
be used for these peering types as show in the following image.

![Overview of external connectivity with Microsoft Power Platform. A single ExpressRoute connection is used to allow both Microsoft peering and private peering network traffic.](media/external-connectivity-with-power-platform.png)

There are different connection types that exist between Microsoft Power Platform services
and an external network. For example, Exchange Web Services connectivity using server-side synchronization uses ExpressRoute to pass network traffic from the Microsoft network to the customer network. Web services connectivity uses ExpressRoute for both inbound and outbound traffic to the Microsoft network. For the HTTPS client, the ExpressRoute connection is used for access from the customer network to the Microsoft network. The following image illustrates these examples.


![Diagram showing different connection types that exist between Microsoft Power Platform services and an external network.](media/connection-types-used-in-power-platform.png)



### Outbound traffic (traffic from Microsoft Power Platform services)

Several types of outbound traffic can occur directly from Microsoft Power Platform
services to customer services. For each of these, it's important to note that the customer service must be
publicly addressable with a public IP that can be resolved through public DNS by
the Microsoft Power Platform services.

This IP address also needs to be advertised to Microsoft through
ExpressRoute so that the internal network routing within Microsoft Power Platform services
knows to route it via that ExpressRoute connection.

Microsoft Power Platform services can't specify which service instance or customer
organization can make requests to which IP addresses. Therefore, it's important
to treat requests inbound to the corporate network as if they were from the
internet and secure them as such.

The following table describes outbound traffic from Microsoft Power Platform services.

| Description                       | Traffic type and direction                  | Peering type          | Purpose          |
|-----------------------------------|---------------------------------------------|--------------------------|---------------|
| Web services                      | HTTPS outbound from Microsoft Power Platform services | Microsoft peering<br>Publish web services on public IP addresses that are within ExpressRoute- configured subnets                   | Custom plug-ins and workflow activities can make web service requests to external services      |
| Exchange Integration: hybrid mode | HTTPS outbound from Microsoft Power Platform services | Microsoft peering<br>Web services would need to be published on public IP addresses that are within ExpressRoute-configured subnets | Exchange Web Services requests from server-side synchronization for hybrid deployments (Microsoft Power Platform services, Exchange on-premises) |
| Connectors                        | HTTPS inbound from Microsoft Power Platform services  | Microsoft peering     | Requests from Microsoft Power Platform services through the Azure API Management service via connectors using the on-premises data gateway                                  |
| Azure Relay                       | HTTPS outbound from Microsoft Power Platform services | Microsoft peering<br>Publish web services on public IP addresses that are within ExpressRoute- configured subnets                   | Direct connectivity between Power Automate cloud flows and desktop flows |

### Inbound traffic (traffic to Microsoft Power Platform services)

The following inbound traffic is possible to Microsoft Power Platform services from the
customer network.

| Description         | Traffic type and direction               | Peering type     | Purpose     |
|---------------------|------------------------------------------|------------------|--------------|
| Client connectivity | HTTPS inbound to Microsoft Power Platform services | Microsoft peering<br>Direct internet connection for static content served by Azure Content Delivery Network | Client requests for Microsoft Power Platform services UI                                                                                        |
| Web services        | HTTPS inbound to Microsoft Power Platform services | Microsoft peering          | Requests to Microsoft Power Platform services through the web service APIs (SOAP, Web API). Either from a standard or custom client application |
| Connectors          | HTTPS inbound to Microsoft Power Platform services | Microsoft peering                  | Responses back to Microsoft Power Platform services through the APIMs via connectors using the on-premises data gateway                             |

## Internal Cloud connectivity within Microsoft Power Platform services

Microsoft Power Platform services use and integrate with several other Microsoft online
services hosted both in Microsoft 365 and Azure.

![Diagram showing different connection types that exist between Microsoft Power Platform services and an internal network.](media/internal-network-connection-types.png)

| Description            | Traffic type and direction                     | Purpose             |
|------------------------|------------------------------------------------|----------------------------|
| Exchange integration   | HTTPS outbound to Microsoft 365                | Exchange web service requests to Exchange Online from Server-Side Synchronization        |
| SharePoint integration | HTTPS outbound to Microsoft 365                | SharePoint web service requests to SharePoint Online from Microsoft Power Platform services      |
| Service Bus            | HTTPS outbound to Azure Service Bus            | Push events to Azure Service Bus either as standard event registration or from custom plug-ins and workflow activities      |
| Data sync              | HTTPS inbound from Azure         | Inbound change tracking requests for synchronization of data services, including search/offline/customer insight      |
| Authentication         | HTTPS outbound to Azure Active Directory (Azure AD)   | Most authentication is done through passive redirects and claims tokens, but some data is synchronized Azure AD directly        |
| Dataflows              | HTTPS outbound to Azure Data Lake Storage | Provides analytics capabilities and allows access to big data solutions incorporating data from both Microsoft Power Platform services and other sources, in addition to the resulting insight from analytics. |
| Connectors             | HTTPS outbound to Azure PaaS services                | Connections to various Azure PaaS services             |
| Desktop flows          | HTTPS outbound to Azure Relay                  | Direct connectivity between Power Automate cloud flows and desktop flows created in Power Automate for Desktop |

The actual connectivity between these services, hosted either in Microsoft or
customer Azure subscriptions, is handled by Microsoft. ExpressRoute isn't
applicable for connections with these services.

Where events are pushed onto the service bus, the connectivity between Microsoft Power
Platform services and Azure is handled internally. Separately, the customer can
make requests to the Service Bus to retrieve information, and this can be
managed through Microsoft peering.

## Customer public and private cloud connectivity to/from Microsoft Power Platform services 

Microsoft Power Platform services also allow direct integration with public or private
Azure resources:

-   From external sources, by using the Microsoft Dataverse web services APIs.

-   To external sources, by using web service requests made.

-   To external sources, by using connectors.

The implications of this need to be considered in the ExpressRoute routing.

| Description          | Traffic type and direction                       | Peering type     | Purpose          |
|----------------------|--------------------------------------------------|------------------|------------------|
| Portals              | HTTPS inbound to Azure                           | Internal to datacenter, with the exception of static content, which uses Content Delivery Network. (Content Delivery Network isn't supported by ExpressRoute, so static content will travel across the public internet.) | Host public-facing services. There might be scenarios where internal employees can access these resources, so you might want traffic to travel across ExpressRoute rather than the public internet        |
| Learning Path        | HTTPS inbound to Azure                           | Uses Content Delivery Network, which isn't supported by ExpressRoute, so content will travel across the public internet       | This is hosted on a public-facing service because it doesn't contain private customer data. For predictability purposes, there might be scenarios where you want to route this via ExpressRoute      |
| Service Bus          | HTTPS inbound to Azure Service Bus               | Internal to datacenter        | Pull events from Azure Service Bus that have been placed there either as standard event registration or from custom plug-ins or workflow activities  |
| Web service requests | Inbound from Azure IaaS/PaaS                     | Internal to datacenter       | Customers can host custom applications in Azure and make requests of Microsoft Power Platform web services           |
| Web service requests | Outbound to Azure IaaS/PaaS                      | Internal to datacenter      | Customers can implement custom plug-ins and workflow activities that make requests of Azure hosted services                                                                                                                                                                       |
| Dataflows            | Data connections to Azure Data Lake Storage | Internal to datacenter     | Provide analytics capabilities and allow access to big data solutions incorporating data from both Microsoft Power Platform services and other sources, in addition to the resulting insight from the analytics.                                                                           |
| Azure Data Lake      | Data connections to Azure Data Lake Storage | Internal to datacenter       | Provide analytics capabilities and allow access to big data solutions incorporating data from both Microsoft Power Platform services and other sources and the resulting insight from the analytics.             |
| Azure SQL            | Data connections to Azure SQL services           | Internal to datacenter     | With capabilities such as Export to Data Warehouse, the use of an Azure SQL instance to hold replicas of Microsoft Dataverse data either for reporting or replication purposes will increase. It might be valuable to protect connections to these resources over ExpressRoute. |

There might be other public services in the future that connect internally to the
datacenter as other Azure capabilities are used.

> [!div class="nextstepaction"]
> [Next step: Setting up ExpressRoute for Microsoft Power Platform](setup.md)
