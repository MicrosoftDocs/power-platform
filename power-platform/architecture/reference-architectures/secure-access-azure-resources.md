---
title: Secure Power Platform access to resources inside your virtual network
description: Learn how to integrate Power Platform with Azure Virtual Network to protect resources inside your virtual network from exposure to the public internet.
#customer intent: As a Power Platform user, I want to secure Power Platform access to resources inside my virtual network so that I can integrate without exposing resources to the public internet.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 07/15/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
ms.contributors:
  - rranjit
  - henryluo
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:03/11/2025
---

# Secure Power Platform access to resources inside your virtual network

Power Platform supports the use of Azure Virtual Network to access resources inside your virtual network without exposing them to the public internet. 

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how to secure Power Platform access to Azure resources with Azure Virtual Network. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/secure-access-azure-resources/secure-architecture.png" alt-text="Architecture diagram showing secure Power Platform access to Azure resources." lightbox="media/secure-access-azure-resources/secure-architecture.png":::

## Workflow

The following steps describe the workflow that's shown in the example architecture diagram:

1. **Case management application**: A Power Apps canvas or model-driven app uses a Power Platform custom connector to access a back-end database or service hosted in Azure. Configuration is managed at the environment level to connect to a specific Azure virtual network as required. For example, the development environment might not need to use a virtual network, but test and production do.

1. **Search request**: A search request from the app uses a Power Platform custom connector to access the back-end API hosted in Azure.

1. **Request authorization**: The back-end API is secured by Microsoft Entra ID, and Microsoft Entra ID authenticates the user to the app. The connector uses OAuth to authorize the user's access to the back-end API. The connector gets the client ID and secret from an Azure Key Vault using Power Platform environment variables.

1. **Network access**: The back-end API is hosted in an Azure virtual network and doesn't allow access to the public network. The virtual network delegates a subnet for the Power Platform environment, allowing the API request and response to traverse the network without using the Azure public network.

1. **Back-end API search**: The back-end API receives the search request and performs a database search in the context of the user who made the request.

## Components

**Power Platform environment**: Contains Power Platform resources. The environment is the boundary for data access and security. Power Platform environments can be configured to use Azure Virtual Network integration, which allows Power Platform resources to communicate with Azure resources in a virtual network.

**Power Apps**: Implements the solution's user experience. Users sign in to a canvas or model-driven app using Microsoft Entra ID.

**Power Platform custom connectors**: Define the operations that are available to Power Platform applications from the services they connect to.

[**Azure Virtual Network**](/azure/virtual-network/virtual-networks-overview): Supports hybrid connectivity with on-premises and other Azure networking capabilities to provide a virtual network in the cloud. Virtual networks can delegate a subnetwork to Power Platform resources, allowing Power Platform and Azure resources to interact over a private network without sending traffic over public networks.

[**Azure Key Vault**](/azure/key-vault/general/basic-concepts): Stores the credentials required to connect to back-end APIs using OAuth. Similar to the back-end APIs, Power Platform resources access the Azure Key Vault through the virtual network.

## Scenario details

Organizations with high security needs must ensure safe communication between internal systems and cloud services. Use available security controls and integrate virtual networks between Power Platform and Azure resources as part of your solution architecture.

Implementing network security controls between application components often presents challenges, especially when they're at different levels of technology abstraction. With Azure Virtual Network, you can build solutions with Power Platform and Azure components without the complexity of a typical multi-network solution. The example architecture uses virtual network subnet delegation to let Power Platform and Azure resources work together in solutions that use the strengths of both products without sacrificing simplicity and security.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Redundancy**: Power Platform infrastructure is built to use a primary and a failover region without explicit action by the customer. For example, if your Power Platform environment is in West US, the failover region is East US. To achieve the best resilience, set up a virtual network in both paired Azure regions and establish a peering connection between them. This setup allows for a seamless failover of Azure resources in the event of a disaster. Learn more in [Business continuity and disaster recovery](/power-platform/admin/business-continuity-disaster-recovery) and [Sample scenarios for Virtual Network setup and configuration](/power-platform/admin/virtual-network-support-whitepaper#sample-scenarios-for-virtual-network-setup-and-configuration).

### Security

**Data access control**: The APIs, data store, and other Azure resources for the solution are isolated and only accessible from applications running in the Power Platform environment that's connected to the virtual network.

**Intentional segmentation and perimeters**: Azure Virtual Network integration lets Power Platform and Azure resources communicate securely, isolated from other cloud network interference. This setup prevents lower-level environments, like dev environments, from accidentally connecting to test or production Azure resources, helping maintain a secure development life cycle. With the virtual network configured in a Power Platform environment, you control outbound traffic from Power Platform. Learn more in [best practices for securing outbound connections from Power Platform services](/power-platform/admin/virtual-network-support-whitepaper#best-practices-for-securing-outbound-connections-from-power-platform-services).

**Encryption**: Data moving from Power Platform to Azure services in the virtual network doesn't traverse the public internet.

### Operational Excellence

**Application lifecycle management (ALM)**: Integration is configured at the Power Platform environment level. Corresponding Azure virtual networks make up a complete landing zone for the entire solution and can isolate development, test, and production or specific life cycle stages in your organization's ALM processes.

### Performance Efficiency

**Collect performance data**: The Azure Monitor service collects and aggregates metrics and logs from every component of your system, providing you with a view of availability, performance, and resilience. Learn more in [Monitor Azure Virtual Network](/azure/virtual-network/monitor-virtual-network).

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Rahul Kannathusseril](https://www.linkedin.com/in/lowcodeprodev/)**, Principal Program Manager
- **[Henry Luo](https://www.linkedin.com/in/henryluopp/)**, Senior Program Manager

## Next steps

Follow these high-level steps to build an end-to-end solution:

1. [Set up Virtual Network support for Power Platform](/power-platform/admin/vnet-support-setup-configure).

1. Create an Azure-hosted REST API using your preferred technique. Protect the API with Microsoft Entra ID. Learn more in [Configure your App Service or Azure Functions app to use Microsoft Entra sign-in](/azure/app-service/configure-authentication-provider-aad?tabs=workforce-configuration).

1. Create Power Platform environment variables to hold the client ID and secret from Azure Key Vault. Learn more in [Use environment variables for Azure Key Vault secrets](/power-apps/maker/data-platform/environmentvariables-azure-key-vault-secrets).

1. Create a custom connector for your API. [Get started](/connectors/custom-connectors/learn-with-a-tutorial) with a tutorial.

1. Define the custom connector to use OAuth 2.0 with Azure Active Directory (Microsoft Entra ID) and turn on service principal support.

    :::image type="content" source="media/secure-access-azure-resources/oauth2.0.png" alt-text="Screenshot of custom connector security authentication settings showing use of OAuth 2.0." lightbox="media/secure-access-azure-resources/oauth2.0.png":::

1. Configure the client ID and client secret to use the values from the environment variables you created in step 2.

    :::image type="content" source="media/secure-access-azure-resources/clientid.png" alt-text="Screenshot of custom connector security settings showing the Client ID field set to an environment variable." lightbox="media/secure-access-azure-resources/clientid.png":::

1. Create a canvas app in Power Apps to provide a search interface.

## Related resources

- [Virtual Network support white paper](/power-platform/admin/virtual-network-support-whitepaper)
- [Power Platform Well-Architected Security recommendations](/power-platform/well-architected/security)
- [Use environment variables in solution custom connectors](/connectors/custom-connectors/environment-variables)
