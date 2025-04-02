---
title: Secure Power Platform access to Azure resources
description: Learn to secure Power Platform access to Azure resources using Azure Virtual Network. Integrate without exposing resources to the public internet.
#customer intent: As a Power-Platform user, I want to secure Power Platform access to Azure resources so that I can integrate without exposing resources to the public internet.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 03/24/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
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

# Secure Power Platform access to Azure resources

> [!TIP]
> This article provides an example scenario and visual representation of how to secure Power Platform access to Azure resources with Azure Virtual Network. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.


Use Microsoft Azure Virtual Network support for Power Platform to integrate Power Platform with resources inside your virtual network without exposing them to the public internet. Virtual network support uses Azure subnet delegation to manage outbound traffic from Power Platform at runtime.

> [!TIP]
> The article provides an example scenario and visual representation of how to secure Power Platform access to Azure resources with Azure Virtual Network. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/secure-access-azure-resources/secure-architecture.png" alt-text="Diagram showing secure Power Platform access to Azure resources." lightbox="media/rpa-scale-operations/secure-access-azure-resources/secure-architecture.png":::

## Workflow

1. **Case management application**: A Power Apps application uses a Power Platform custom connector to access a backend database or service hosted in Azure.

1. **Search request**: A search request from the application uses a Power Platform custom connector to access the backend API hosted in Azure.

1. **Request authorization**: The backend API is secured by Microsoft Entra ID and the user is authenticated to the application also using Entra ID. The connector uses OAuth to authorize the user's access to the backend API. The connector gets the client ID and secret from an Azure Key Vault using Power Platform environment variables.

1. **Network access**: The backend API is hosted in an Azure Virtual Network (VNET) and doesn't allow Azure public network access. The VNET delegates a subnet for the Power Platform environment, enabling the API request and response to traverse the network without using the Azure public network.

1. **Backend API search**: The backend API receives the search request and performs a database search in the context of the user who made the request.

## Use case details

Organizations with high security needs must ensure safe communication between internal systems and cloud services. They use available security controls and integrate virtual networks between Power Platform and Azure resources as part of their solution architecture.

With Azure Virtual Network support, you can build solutions with Power Platform and Azure components without the complexity of a typical multi-network solution. Implementing other network security controls between application components often presents challenges, especially when they are at different levels of technology abstraction. This architecture, using virtual network subnet delegation, lets Power Platform and Azure resources work together to implement solutions that use the strengths of both products without sacrificing complexity and security needs.

## Components

- **Power Platform environment**: Contains the Power Platform resources like Power Apps that implement the case management user experience. Configuration is managed at the environment level to connect to a specific Azure Virtual Network. Enable configuration as required on different Power Platform environments and their related virtual networks that are part of an application's lifecycle management. For example, the development environment might not have virtual network integration enabled, but test and production do.

- **Power Apps**: Used to implement the user experience of the solution. Users sign in to the application using Microsoft Entra ID.

- **Power Platform custom connectors**: Define the operations available to Power Platform applications from the service they describe. Using Power Platform custom connectors, the application uses backend API services that implement the organization's business logic.

- **Azure Virtual Network**: Supports hybrid connectivity with on-premises and other Azure networking capabilities to provide a virtual network in the cloud. Virtual networks can delegate a subnetwork to Power Platform resources, allowing Power Platform and Azure resources to interact over a private network without sending traffic over public networks.

- **Azure Key Vault**: Stores the credentials required to connect to the backend APIs using OAuth. Similar to the backend APIs, Power Platform resources access the Azure Key Vault by using the virtual network.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

**Redundancy**: Power Platform infrastructure implements a primary and a failover region without explicit action required by the customer. To achieve the best resilience, set up Virtual Network support in [both paired Azure regions](/power-platform/admin/business-continuity-disaster-recovery). For example, a Power Platform environment in West US with fail over to East US. This setup requires a Virtual Network (VNet) in West US and another VNet in East US. Establish a peering connection between them so that if Power Platform fails over, the Azure resources are still accessible. Learn more in [Sample scenarios for Virtual Network setup](/power-platform/admin/virtual-network-support-whitepaper#sample-scenarios-for-virtual-network-set-up-and-configuration).

The following image illustrates the use of multiple virtual networks to provide redundancy:

:::image type="content" source="media/secure-access-azure-resources/multiplevnet_v2.png" alt-text="Diagram illustrating an example redundancy setup with a dedicated set of subnets for Power Platform." lightbox="media/secure-access-azure-resources/multiplevnet_v2.png":::

### Security

**Data access control**: The APIs, data store, and other Azure resources for the solution are isolated and only accessible from applications running in the Power Platform environment connected to the Virtual Network.

**Intentional segmentation and perimeters**: Azure Virtual Network integration lets Power Platform and Azure resources communicate securely, isolated from other cloud network interference. This setup prevents lower-level environments, like dev environments, from accidentally connecting to test or production Azure resources, helping maintain a secure development lifecycle. With the Virtual Network configured on a Power Platform environment, you control outbound traffic from Power Platform. Review [best practices for securing outbound connections from Power Platform services](/power-platform/admin/virtual-network-support-whitepaper#best-practices-for-securing-outbound-connections-from-power-platform-services).

**Encryption**: Data moving from Power Platform to Azure services in the Virtual Network doesn't traverse the public internet.

### Operational Excellence

**Application lifecycle management (ALM)**: Integration is configured at the Power Platform environment level. Corresponding Azure Virtual Networks make up a complete landing zone for the entire solution and can isolate development, test, and production or specific lifecycle stages in an organization's ALM processes.

### Performance Efficiency

**Collect performance data**: Azure Virtual Networks provide an efficient way to integrate Power Platform and Azure resources. Learn about monitoring performance and collecting data in the [Azure Virtual Network monitoring data reference](/azure/virtual-network/monitor-virtual-network-reference).

## Next steps

Review [Set up Virtual Network support for Power Platform](/power-platform/admin/vnet-support-setup-configure).

After you set up your virtual network, use these high-level steps to build an end-to-end solution:

1. Create an Azure-hosted REST API using your preferred technique for hosting a REST API in Azure. Protect this API using Microsoft Entra ID. Learn more in [Configure your App Service or Azure Functions app to use Microsoft Entra ID sign-in](/azure/app-service/configure-authentication-provider-aad?tabs=workforce-configuration).

1. Create Power Platform environment variables to hold the client ID and secret from Azure Key Vault. Learn more in [Use environment variables for Azure Key Vault secrets](/power-apps/maker/data-platform/environmentvariables-azure-key-vault-secrets).

1. Create a [custom connector](/connectors/custom-connectors/learn-with-a-tutorial) for your API:

    1. Define the custom connector to use OAuth 2.0 with Azure Active Directory (Microsoft Entra ID) and enable service principal support.
    
        :::image type="content" source="media/secure-access-azure-resources/oauth2.0.png" alt-text="Screenshot of Security authentication dialog showing OAuth 2.0." lightbox="media/secure-access-azure-resources/oauth2.0.png":::

    1. Configure the client ID and client secret to use the values from the environment variables created in step 2.
    
        :::image type="content" source="media/secure-access-azure-resources/clientid.png" alt-text="Screenshot showing the Client ID field set to an environment variable." lightbox="media/secure-access-azure-resources/clientid.png":::

1. Create a Power Apps canvas app to build the search interface for the back office.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Rahul Kannathusseril](https://www.linkedin.com/in/lowcodeprodev/)**, Principal Program Manager
- **[Henry Luo](https://www.linkedin.com/in/henryluopp/)**, Senior Program Manager

## Related resources

- [Virtual Network support white paper](/power-platform/admin/virtual-network-support-whitepaper)
- [Power Platform Well-Architected Security recommendations](/power-platform/well-architected/security)
- [Use environment variables for Azure Key Vault secrets](/power-apps/maker/data-platform/environmentvariables-azure-key-vault-secrets)
- [Use environment variables in solution custom connectors](/connectors/custom-connectors/environment-variables)