---
title: Understand Power Platform architecture and ExpressRoute
description: Understand Power Platform's architecture and its interaction with ExpressRoute to plan secure and efficient deployments.
#customer intent: As a network architect, I want to under the Power Platform architecture in the context of ExpressRoute so that I can plan deployments effectively.
author: taiki-yoshida
ms.topic: concept-article
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

# Understand Power Platform architecture and ExpressRoute

This article provides an overview of Power Platform's architecture, its interaction with ExpressRoute, and key considerations for network architects who are planning deployments.

## Regions and environments

Power Platform runs on Microsoft Azure infrastructure and is deployed across regions worldwide. Each deployment is called an [environment](../../../admin/environments-overview.md) and is associated with a specific region.  

:::image type="complex" source="media/region-and-data-centers.png" alt-text="Diagram illustrating each Microsoft Power Platform region with its corresponding datacenters.":::
   The diagram shows four Power Platform regions: Oceania, Great Britain, North America, and Europe. Each region has a pair of datacenters; for example, West US and East US in the North America region. Each datacenter contains scale groups, including canary, sandbox, and production scale groups.
:::image-end:::

Each environment is contained inside a *scale group*&mdash;a shared infrastructure that provides a maintainable and scalable infrastructure set. A scale group hosts multiple customer organizations, each with their own database but with shared service infrastructure. It uses various Azure services, including Azure SQL, Azure Virtual Machines, and Azure Cache for Redis. Scale groups are set in pairs for each region you select. For example, selecting United States as the region creates scale groups in West US and East US.

When you set up an ExpressRoute circuit, you must select a region for the circuit. The region you select must be the same as the region of your Power Platform environment. Because Power Platform doesn't have designated Border Gateway Protocol (BGP) communities like Microsoft 365 does, you must use two regional BGP communities for the region you select. For example, if Europe is the region for your Power Platform environment and you want to connect that environment with ExpressRoute, you must select West Europe and North Europe as the two regional BGP communities. Learn more in [Power Automate regions overview](/power-automate/regions-overview).

A common misunderstanding is that ExpressRoute can connect Power Platform and Azure services. It can't. ExpressRoute establishes a private connection only from your on-premises network to the edge of Microsoft's datacenter, or the "entrance" to the cloud service. Power Platform uses a shared service infrastructure, and Azure services use private peering. Therefore, you can't use ExpressRoute to connect Power Platform and Azure services directly.

## Connectors

[Connectors](/connectors/connectors) connect Power Platform to more than 400 services and apps from Microsoft and others. Consider how connectors interact with various services and how these interactions might affect connectivity with ExpressRoute.

Connectors use Azure API Management behind the scenes to manage the credentials and connections of each user.

:::image type="content" source="media/apim-datasource.png" alt-text="Diagram showing Power Apps using API management to connect to various data sources.":::

These connections are then directed to various data sources. For Microsoft connectors, the connections are in the Microsoft datacenter. Connectors to non-Microsoft services are accessed over the public internet.

:::image type="content" source="media/public-internet-and-microsoft-network.png" alt-text="Diagram showing the relationship between Microsoft Power Platform and connections to other services.":::

## On-premises data gateway

An [on-premises data gateway](/data-integration/gateway/service-gateway-onprem) connects your on-premises services with Power Platform in a secure way by using Azure behind the scenes. Data that's transmitted through the on-premises data gateway goes through Azure Service Bus, as shown in the following image.

:::image type="complex" source="media/data-gateway-architecture.png" alt-text="Architectural diagram of an on-premises data gateway.":::
    The gateway cloud service encrypts and stores data source credentials and on-premises data gateway details. It routes queries and results between cloud services, the on-premises data gateway, and the data source. Azure Service Bus transmits data between the gateway cloud service and the on-premises data gateway. The on-premises data gateway decrypts data source credentials and connects to a data source. It sends queries to the data source and returns the results to the gateway cloud service.
:::image-end:::

The gateway uses Transport Layer Security (TLS) 1.2 to communicate between the on-premises data gateway and Power Platform services.

Each on-premises data gateway connects to one datacenter region. When you set up the gateway, [set the datacenter region](/data-integration/gateway/service-gateway-data-region) to the closest region to minimize latency. Learn more in [On-premises data gateway architecture](/data-integration/gateway/service-gateway-onprem-indepth).

Using ExpressRoute doesn't completely remove the need to implement an on-premises data gateway. It depends on the connector you use with your on-premises systems. Be sure to check each connector you're using in the [list of connectors](/power-automate/gateway-manage) to determine whether an on-premises gateway is required.

:::image type="content" source="media/inside-connectors.png" alt-text="Diagram showing how connectors connect to data sources behind the scenes.":::

## Content Delivery Network

Power Platform uses Azure Content Delivery Network (CDN) to optimize performance and user experiences when serving static content like images and icons. Because ExpressRoute can't route static content from the CDN, that traffic is routed directly across the public internet. Static content uses common platform capabilities that don't contain customer data, so it doesn't need protection over private networks like ExpressRoute.  

> [!NOTE]
> When canvas apps run into firewall restrictions and issues related to approved IP lists, admins can turn off CDN. Model-driven apps don't use CDN. Learn more in [Manage behavior settings](../../../admin/settings-behavior.md).

## Azure Relay and Power Automate

Power Automate uses Azure Relay for direct connectivity between cloud flows and desktop flows. It uses HTTPS, and data is encrypted when transmitted between the computer and the cloud. However, to make sure that the traffic isn't transmitted through the public internet, you can use ExpressRoute instead. Learn more in [Power Automate for desktop architecture](/power-automate/desktop-flows/pad-architecture).

## Next step

> [!div class="nextstepaction"]
> [Plan an ExpressRoute deployment](planning-expressroute.md)
