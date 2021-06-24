---
title: "Understand Microsoft Power Platform architecture to use with ExpressRoute | MicrosoftDocs"
description: "Explanation of Power Platform architecture to use with ExpressRoute"
author: taiki-yoshida
ms.service: power-platform
ms.topic: conceptual
ms.date: 06/30/2021
ms.author: tayoshi
ms.reviewer: kathyos
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Understand Microsoft Power Platform architecture to use with ExpressRoute

When setting up ExpressRoute for Power Platform, it’s important to know the
underlying architecture to understand what can be configured.

## Regions and environments

Microsoft Power Platform is built on top of Microsoft Azure infrastructure,
deployed across various regions around the world. Each deployment is called an
[environment](/power-platform/admin/environments-overview), where these environments are set with a particular region.

![Diagram illustrating each Power Platform region with its corresponding data centers](media/region-and-data-centers.png)

Each environment is contained inside a scale group – a shared infrastructure to
provide maintainable and scalable infrastructure set. It hosts multiple customer
organizations each with their own database but shared service infrastructure. It
uses various Azure services including Azure SQL, Azure VMs, Azure Redis cache
etc. These scale groups are set in pairs for each region the customer has
selected. For example, selecting United States as the region will create scale
groups in West US and East US.

One of the misunderstandings that is easy to fall into is whether ExpressRoute
can be set up between Microsoft Power Platform and Azure services, and the answer is no.
As explained with the infrastructure above, Microsoft Power Platform uses a shared service
infrastructure and ExpressRoute is a connection that is set up only to the edge
of Microsoft’s datacenter.

ExpressRoute is a technology that provides a private connection between your
on-premises network and the “entrance” of the cloud service. Therefore, any
network connections within the same cloud, in this case the Microsoft Power Platform and
Azure services, cannot be set up with ExpressRoute.

![Architectural diagram of Power Platform environments](media/environment-architecture.png)

Because Microsoft Power Platform does not have designated BGP communities like Microsoft
365 does, you must instead set up with regional BGP communities from both scale
groups.

Unlike Microsoft 365, where there are designated BPG communities which you can
use, Power Platform requires you to set up with two regional BGP communities for
the region you have selected.

For example, if you have selected Europe as the region you would like to use for
your Microsoft Power Platform environment, and you would like to connect that environment
with ExpressRoute, you must select West Europe and North Europe as the two
regional BGP communities. The regional pair you will need to set up can be found
in [Power Automate regions
overview](/power-automate/regions-overview).

## Connectors

[Connectors](/connectors/connectors) are a great way of connecting to Microsoft first-party services as
well as third party services with Microsoft Power Platform, allowing you to
connect with over 400 different services and apps. One of the details you should
take into consideration is how connectors connect to various services and how it
impacts your connectivity with ExpressRoute.

Connectors utilize Azure API Management behind the scenes to manage the
credentials and connections from each user.

![Power Apps using API management to connect to various data sources.](media/apim-datasource.png)

These connections are then directed to the various data sources. For Microsoft
connectors, the connections would be within the Microsoft datacenter. Connectors
that are non-Microsoft services will be accessed via public internet.

![Overview of relations between Microsoft Power Platform and connections to other services](media/public-internet-and-microsoft-network.png)

## On-premises data gateway

Using [on-premises data gateway](/data-integration/gateway/service-gateway-onprem) enables you to connect to your on-premises
services with Microsoft Power Platform in a secure way using Microsoft Azure
behind the scenes. Any data transmitted via on-premises data gateway is sent via
Azure service bus as shown in the diagram below.

![Architectural diagram of on-premise data gateway. Gateway cloud service encrypts and stores data source credentials and on-premise data gatweay details. It routes queries and results between cloud services, on-premises data gateway, and data source. Azure Service Bus is used to transmit data between gateway cloud service and on-premise data gateway. On-premise data gateway decrypts data source credentials and connects to data source. It sends queries to data source, and returns the results to gateway cloud service.](media/data-gateway-architecture.png)

The gateway uses Transport Layer Security (TLS) 1.2 to communicate between
on-premises data gateway and Power Platform services.

On-premises data gateway connects to one datacenter region per gateway. When
setting up the gateway, you should consider to [set the datacenter
region](/data-integration/gateway/service-gateway-data-region)
to the closest region to minimize latency.

More information: [On-premises data gateway
architecture](https://docs.microsoft.com/data-integration/gateway/service-gateway-onprem-indepth).

Depending on the connector you use with the on-premises systems, implementing
ExpressRoute does not mean that you can remove the on-premises data gateway.
This is because on-premises data gateway includes functionality that converts
data. For example, with SQL server, the on-premises data gateway converts
protocol from OData requests to SQL DML (data manipulation language) statement.

![Diagram showing how connectors connect to data sources behind the scenes.](media/inside-connectors.png)

Therefore, enabling ExpressRoute does not completely result in not needing to
implement on-premises data gateway completely. Make sure to check each connector
you are using from the [list of
connectors](/power-automate/gateway-manage) whether
on-premise gateway will still be required or not.

On-premises data gateway is used when connecting to on-premises systems from
Power Platform. The gateway connects on-premises systems with Microsoft Power
Platform using Azure Service Bus.

## Content Delivery Network (CDN)

Microsoft Power Platform users Azure Content Delivery Network to optimize performance and
user experiences when using static contents such as images and icons. These
static contents served by the CDN service cannot be routed via ExpressRoute, so
would be routed directly across the public Internet. However, these contents are
common platform capabilities that contains no customer data and therefore should
not need to be considered to be protected over private networks like
ExpressRoute.

> [!div class="nextstepaction"]
> [Next step: Plan an ExpressRoute deployment](planning-expressroute.md)
