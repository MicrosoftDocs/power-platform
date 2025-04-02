---
title: Understand Power Platform architecture and ExpressRoute
description: Understand Power Platform's architecture and its interaction with ExpressRoute to plan secure and efficient deployments.
#customer intent: As a network architect, I want to under the Power Platform architecture in the context of ExpressRoute so that I can plan deployments effectively.
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

# Understand Power Platform architecture and ExpressRoute

This article provides an overview of Power Platform's architecture, its interaction with ExpressRoute, and key considerations for network architects planning deployments.

## Regions and environments

Power Platform runs on Microsoft Azure infrastructure and is deployed across regions worldwide. Each deployment is called an [environment](../../../admin/environments-overview.md)and is associated with a specific region.  

:::image type="complex" source="media/region-and-data-centers.png" alt-text="Diagram illustrating each Microsoft Power Platform region with its corresponding datacenters.":::
   Each Microsoft Power Platform region has a pair of datacenters. The diagram shows four different regions: Oceania, Great Britain, North America, and Europe. Each of these regions has a pair. For example, the North America region has West US and East US datacenters in this example. Scale groups exist within each datacenter. There are several scale groups including canary group, sandbox group, and production scale groups.
:::image-end:::

Each environment is contained inside a *scale group*&mdash;a shared infrastructure that provides a maintainable and scalable infrastructure set. A scale group hosts multiple customer organizations, each with their own database but with shared service infrastructure. It uses various Azure services, including Azure SQL, Azure Virtual Machines, and Azure Cache for Redis. Scale groups are set in pairs for each region the customer selects. For example, selecting United States as the region creates scale groups in West US and East US.

A common misunderstanding is whether ExpressRoute can connect Power Platform and Azure services. The answer is no. Power Platform uses a shared service infrastructure, and ExpressRoute connects only to the edge of Microsoft's datacenter.

ExpressRoute is a technology that provides a private connection between your on-premises network and the "entrance" to the cloud service. Therefore, any network connections within the same cloud&mdash;in this case, Power Platform and Azure services&mdash;can't use ExpressRoute.

Because Power Platform doesn't have designated Border Gateway Protocol (BGP) communities like Microsoft 365 does, you must use two regional BGP communities for the region you've selected.

For example, if you selected Europe as the region you'd like to use for your Power Platform environment, and you'd like to connect that environment with ExpressRoute, you must select West Europe and North Europe as the two regional BGP communities. Learn more about the regional pair you'll need to set up in [Power Automate regions overview](/power-automate/regions-overview).

## Connectors

[Connectors](/connectors/connectors) are a great way of connecting to Microsoft first-party services&mdash;in addition to third-party services&mdash;with Power Platform, allowing you to connect with over 400 different services and apps. Consider how connectors interact with various services and how this will impact connectivity with ExpressRoute.

Connectors use Azure API Management behind the scenes to manage the credentials and connections from each user.

:::image type="content" source="media/apim-datasource.png" alt-text="Diagram showing Power Apps using API management to connect to various data sources.":::

These connections are then directed to various data sources. For Microsoft connectors, the connections are within the Microsoft datacenter. Connectors that are non-Microsoft services are accessed via the public internet.

:::image type="content" source="media/public-internet-and-microsoft-network.png" alt-text="Diagram showing the relationship between Microsoft Power Platform and connections to other services.":::

## On-premises data gateway

Using an [on-premises data gateway](/data-integration/gateway/service-gateway-onprem) enables you to connect to your on-premises services with Power Platform in a secure way by using Azure behind the scenes. Any data transmitted via the on-premises data gateway is sent via Azure Service Bus, as shown in the following image.

:::image type="complex" source="media/data-gateway-architecture.png" alt-text="Architectural diagram of an on-premises data gateway.":::
    The gateway cloud service encrypts and stores data source credentials and on-premises data gateway details. It routes queries and results between cloud services, the on-premises data gateway, and the data source. Azure Service Bus is used to transmit data between the gateway cloud service and the on-premises data gateway. The on-premises data gateway decrypts data source credentials and connects to a data source. It sends queries to the data source and returns the results to the gateway cloud service.
:::image-end:::

The gateway uses Transport Layer Security (TLS) 1.2 to communicate between the on-premises data gateway and Power Platform services.

The on-premises data gateway connects to one datacenter region per gateway. When setting up the gateway, consider [setting the datacenter region](/data-integration/gateway/service-gateway-data-region) to the closest region to minimize latency. Learn more in [On-premises data gateway architecture](/data-integration/gateway/service-gateway-onprem-indepth).

Depending on the connector you use with on-premises systems, implementing ExpressRoute doesn't necessarily mean you can remove the on-premises data gateway. The on-premises data gateway includes functionality that converts data. For example, with SQL Server, the on-premises data gateway converts protocol from OData requests to SQL Data Manipulation Language statements.

:::image type="content" source="media/inside-connectors.png" alt-text="Diagram showing how connectors connect to data sources behind the scenes.":::

Enabling ExpressRoute doesn't completely remove the need to implement an on-premises data gateway. Be sure to check each connector you're using in the [list of connectors](/power-automate/gateway-manage) to determine whether an on-premises gateway will still be required.

An on-premises data gateway is used when connecting to on-premises systems from Power Platform. The gateway connects on-premises systems with Power Platform by using Azure Service Bus.

## Content Delivery Network

Power Platform uses Azure Content Delivery Network (CDN) to optimize performance and user experiences when using static content like images and icons. Static content served by the Content Delivery Network can't be routed via ExpressRoute, so it will be routed directly across the public internet. This content uses common platform capabilities that don't contain customer data, so it doesn't need protection over private networks like ExpressRoute.  

> [!NOTE]  
> For canvas apps specifically, CDN can be turned off by system administrators using the setting **Load default static content from Content Delivery Network** in the case of firewall restrictions and IP approved list related issues. This setting does not apply to model-driven apps, as they do not use CDN currently. Learn more in [Manage behavior settings](../../../admin/settings-behavior.md).

## Azure Relay

Microsoft Power Automate uses Azure Relay for direct connectivity between Power Automate cloud flows and desktop flows in Power Automate for desktop. It uses HTTPS and data is encrypted when transmitted between the computer and the cloud. However, to make sure that the traffic isn't transmitted through the public internet, you can use ExpressRoute instead.

Learn more about required network settings in [Power Automate architecture](/power-automate/desktop-flows/pad-architecture).

## Next step

> [!div class="nextstepaction"]
> [Plan an ExpressRoute deployment](planning-expressroute.md)