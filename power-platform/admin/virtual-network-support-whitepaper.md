---
title: Virtual Network support white paper
description: Learn how Azure Virtual Network support enhances the security, connectivity, and scalability of your Power Platform solutions.
author: faix
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/02/2025
ms.subservice: admin
ms.author: osfaixat
ms.reviewer: sericks
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/22/2025
---

# Virtual Network support white paper

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Your organization can use Azure Virtual Network to ensure that its Power Platform services operate in a secure and controlled network environment, reducing the risk of data breaches and unauthorized access. This white paper provides an in-depth analysis of Azure Virtual Network support in Power Platform. It highlights key benefits, outlines the implementation process and technical architecture, discusses real-world use cases, and offers practical insights from a successful case study, making it a valuable resource for IT professionals and decision-makers looking to enhance their network security and operational efficiency benefit.

## Key benefits

- **Enhanced security**: Host Power Platform services in a secure network, protecting sensitive data from unauthorized access and potential breaches.

- **Improved connectivity**: Establish secure and reliable connections between Power Platform services and other Azure resources, enhancing overall connectivity.

- **Streamlined network management**: Simplify network management with a centralized and consistent approach to configuring and managing network settings for Power Platform services.

- **Scalability**: Scale Power Platform services efficiently, ensuring that network resources can grow in line with business needs.

- **Compliance**: Meet regulatory and compliance requirements for network security and data protection.

## Background

[Microsoft Power Platform](/power-platform/) is a leading low-code/no-code platform that empowers people to build applications, automate workflows, and analyze data&mdash;even if they're not pro developers&mdash;to create custom solutions that are tailored to specific business needs, fostering innovation and enhancing productivity. Power Platform encompasses the following Microsoft services:

- [Dataverse](/power-apps/maker/data-platform/data-platform-intro) serves as the underlying data platform, providing a secure and scalable environment for storing and managing data.
- [Power Apps](/power-apps/powerapps-overview) offers a user-friendly interface for building custom applications.
- [Power Automate](/power-automate/) offers a drag-and-drop interface for automating repetitive tasks and workflows.
- [Power BI](/power-bi/) offers robust data visualization and analytics capabilities.
- [Power Pages](/power-pages/introduction) offers a user-friendly interface for building professional-grade websites.
- [Copilot Studio](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio) makes it easy to create intelligent bots and agents without in-depth knowledge of AI engineering.

The integration of these components with Azure resources using virtual networks enhances Power Platform's overall functionality and security. Virtual networks provide a secure and isolated network environment in which Power Platform services can operate, allowing your organization to control and manage network traffic while ensuring that data is protected in compliance with regulatory requirements.

### Network security and Virtual Network integration

Network security is a critical aspect of any digital infrastructure. Protecting outbound traffic from Power Platform services is essential to prevent unauthorized access, data breaches, and other security threats. Virtual Network integration plays a vital role. By providing a secure pathway for data transmission, ensuring that all traffic from Power Platform services is routed through a controlled and monitored network environment, it reduces the risk of exposure to potential threats.

By implementing Virtual Network support, your organization can enforce strict security policies, monitor network traffic, and detect any anomalies in real time. This level of control is crucial for maintaining the integrity and confidentiality of sensitive data. At the same time, Virtual Network integration simplifies your overall network architecture and improves reliability by allowing Power Platform services to connect seamlessly with other Azure resources.

## Overview of Virtual Network support in Power Platform

Virtual Network support is a significant enhancement that brings robust security and improved connectivity to Power Platform. Virtual networks are a fundamental component of Azure's networking capabilities, allowing your organization to connect Power Platform services to resources in its enterprise private networks. They establish secure communication among Power Platform services, other Azure resources, and networks, such as on-premises services, databases, storage accounts, and a key vault.

By routing all outbound traffic from Power Platform services through a virtual network, your organization can ensure that data is transmitted securely and remains protected from unauthorized access. A virtual network also improves connectivity by providing a reliable and consistent network environment. Establishing secure connections between Power Platform services and other Azure resources ensures seamless data flow and a more efficient use of network resources.

### Behind the scenes

Power Platform infrastructure consists of a serverless container orchestration layer that executes workloads with a strict security boundary and guarantees individual, workload-level availability and scalability. The container orchestration layer is used for all workloads that need isolation, including internal Microsoft workload-like connectors and customer workloads like plug-ins.

The containerized workload allows Power Platform to support network-level isolation using a combination of Azure subnet delegation and Virtual Network injection features. With Virtual Network injection, a container can be injected into a virtual network by attaching a network interface card. Any workload running on that container is executed in the customer's network and can use private IP addresses within the network. Plug-in workloads can access user services, resources, or Azure resources with a private link exposed to the same virtual network. Similarly, a connector workload can access the target resource or endpoint inside the same virtual network.

### Azure subnet delegation

Virtual Network support for Power Platform relies on [Azure subnet delegation](/azure/virtual-network/subnet-delegation-overview). Enterprises delegate a subnet for use by Power Platform services, such as Dataverse plug-ins and connectors, to process requests at runtime. Containers use the IP address from the delegated subnet to handle these requests.

Because the container operates within the boundaries of the delegated subnet and uses its IP address, any outbound call from the container remains within the enterprise's network boundaries&mdash;that is, the call stays in the virtual network that's part of that subnet. This setup allows your organization to have full control over the policies, rules, and network packets for containers. You can apply the same controls to the delegated subnet that you apply to your own network.

Power Platform doesn't manage the configuration of the delegated subnet. The only requirement is that the delegated subnet can't be used for any other resources or delegated to other services. After a subnet is delegated, the IP addresses within that subnet are reserved for Power Platform.

Internet access from containers is turned off by default. If code running in containers requires internet access, you must configure [Azure NAT Gateway](/azure/nat-gateway/nat-overview) on the delegated subnet to allow the containers to connect to resources on the internet.

The following table summarizes the ownership of the delegated subnet and the controls that are available to customers and Microsoft.

| Controls | Description | Ownership |
|----------|-------------|-----------|
| NAT Gateway | When a NAT gateway is attached to a subnet, it becomes the next hop for all internet-destined traffic from that subnet. Any traffic from the subnet to the internet is routed through the NAT gateway. All instances within the subnet remain private with secure and scalable outbound connectivity. | Customer |
| Network security groups (NSGs) | Customers can associate NSGs with the delegated subnet. Define and enforce security rules to control inbound and outbound traffic to and from the subnet. | Customer |
| Route tables | Customers can associate route tables with the delegated subnet. Define custom routing policies to control the flow of traffic within the virtual network and to external networks. | Customer |
| Network monitoring | Network monitoring helps maintain compliance with security policies by forcing traffic to travel through the enterprise's virtual private network. | Customer|
| IP address management | Customers can dictate the IP address space for the delegated subnet, ensuring that it uses private IP address ranges, such as **10.0.0.0/8**, **192.168.0.0/16**, or **172.16.0.0/12**. | Customer |
| DNS configuration | Customers can configure custom DNS settings for the delegated subnet, including Azure DNS entries. | Customer |
| Container | Containers execute requests from Virtual Network-supported services and acquire IP addresses from the delegated subnet. | Microsoft |

## Technical architecture

The following diagram of the technical architecture of a Power Platform solution shows how components such as data sources, connectors, services, and applications interact and integrate within the solution. The diagram highlights the use of virtual networks to enhance security and connectivity by allowing Power Platform services to connect to private and protected resources without exposing them to the internet. The architecture demonstrates how execution requests are routed to containers in the virtual network while maintaining container-isolation boundaries.

:::image type="content" source="media/technical-architecture.png" alt-text="Diagram illustrating the technical architecture of a Power Platform solution, highlighting the use of virtual networks for secure connectivity and routing execution requests to containers in the virtual network." lightbox="media/technical-architecture.png":::

In a Virtual Network configuration, the container that runs the plug-in or connector is part of the organization's virtual network. Communication to endpoints in the virtual network remains inside the virtual network boundary. You can extend the boundary to other virtual or on-premises networks by using Virtual Network peering and ExpressRoute or VPN Gateway.

Power Platform components in a containerized workload of a virtual network must be able to communicate with other components in the workload. For example, Power Platform might need to trigger a plug-in or call a connector in the workload.

Because the container isn't directly attached to the main network infrastructure, a special communication path, or channel, is established between the container and the orchestration layer. The channel uses a special local IP address, called an APIPA address, to send specific instructions or signals to the workload running inside the container. Only certain types of messages are allowed to reach the workload, ensuring that the container and its workload remain secure and isolated.

The following diagram illustrates how containers are isolated from each other and the host system using virtual networks that route execution requests to containers while maintaining isolation boundaries.

:::image type="content" source="media/container-isolation-boundaries.png" alt-text="Diagram showing container isolation boundaries in a Power Platform solution, highlighting secure and isolated container operations using two virtual networks." lightbox="media/container-isolation-boundaries.png":::

## Turn on Virtual Network support for Power Platform

Follow the instructions in [Set up Virtual Network support for Power Platform](vnet-support-setup-configure.md).

## Common use cases and real-world examples

In this section, you learn about common use cases for virtual networks with Power Platform solutions. You also explore real-world examples of how various industries have benefited from using them.

### Use cases

**Secure data integration**: Your organization can use Virtual Network support to securely connect Power Platform services to its private data sources, such as Azure SQL Database, Azure Storage, and on-premises resources. A virtual network ensures that data remains inside the organization's network boundaries and isn't exposed to the public internet.

**Private endpoints for connectors**: Power Platform connectors can use Virtual Network support to establish private endpoints for secure communications. The private network eliminates the need for public IP addresses and reduces the risk of data breaches.

**Secure Copilot Studio integrations**: You can use Virtual Network support with Power Platform connectors in Copilot Studio to establish secure connectivity with data sources. The private network eliminates the risks associated with exposing the data sources to the public internet and mitigates the risks of data exfiltration.

### Real-world examples

Organizations across industries can benefit from Virtual Network support for Power Platform. By securely connecting Power Platform services to private data sources, organizations can enhance their security posture, improve connectivity, and ensure compliance with regulatory requirements.

**Financial institutions**: A large bank can use a virtual network to securely connect Power Platform solutions and Dynamics 365 apps to its protected databases and services. This setup allows the bank to create secure workflows and automate processes without exposing sensitive information to the public internet, ensuring that customer data is protected and complies with regulatory requirements.

**Healthcare providers**: A healthcare organization can use a virtual network to connect Power Platform solutions and Dynamics 365 apps to its electronic health record systems. The private network can be used for secure access to patient data and to create secure communication channels among departments and between the provider and external partners.

**Retail companies**: A retail company can use a virtual network to securely connect Power Platform solutions and Dynamics 365 apps to its inventory management systems and customer databases. Private connections allow the company to streamline operations, improve inventory tracking, and enhance customer service while ensuring that sensitive data remains protected.

**Government agencies**: Government agencies can use a virtual network to securely connect Power Platform solutions and Dynamics 365 apps to their internal systems and databases. Private connections allow agencies to automate processes, improve data sharing, and enhance collaboration while maintaining strict security and compliance standards.

## Integration patterns

The types of workloads that you want to run in an environment determine the integration pattern for Power Platform. You can use Virtual Network support for Power Platform as an integration pattern in your environment with some exceptions.

**API workloads**: If you plan to run API workloads like plug-ins, connectors, or service endpoints, a virtual network is the only supported way to integrate them securely with data sources inside your network. Virtual networks don't support a subset of connectors that have non-Microsoft driver requirements or use Windows authentication. These connectors aren't in wide use and must use an on-premises data gateway instead of a virtual network. The following plug-ins and connectors are generally available for use in a virtual network:

- Dataverse plug-ins
- Custom connectors
- Azure Blob Storage
- Azure File Storage
- Azure Key Vault
- Azure Queues
- Azure SQL Data Warehouse
- HTTP with Microsoft Entra ID (preauthorized)
- SQL Server

**ETL workloads**: Extract, transform, load (ETL) workloads in [Power BI](/data-integration/vnet/use-data-gateways-sources-power-bi) and [Power Platform data flows](/data-integration/vnet/data-gateway-power-platform-dataflows) use virtual network data gateways.

The following diagram illustrates the integration patterns for API and ETL workloads.

:::image type="content" source="media/VNet-support.png" alt-text="Diagram showing the Power Platform connectors and plug-ins that are either generally available or available in preview for use inside a virtual network." lightbox="media/VNet-support.png":::

## Configuration considerations

Keep the following considerations in mind when you set up Virtual Network support for Power Platform.

### Regions and locations

Delegated subnets in Azure regions must match the location of the Power Platform environment. For example, if your Power Platform environment is in the United States, then each of two virtual networks and subnets must be in the `eastus` and `westus` Azure regions. Check the [list of supported regions and location mappings](vnet-support-overview.md#supported-regions) for the latest information about Azure regions and locations.

If your Azure resources are in different Azure regions, you must still deploy your virtual networks for Power Platform environments in the appropriate Azure location for each environment. Use Virtual Network peering or a similar connectivity option with high speed and low latency to connect the resources with your virtual networks. The [Microsoft global network](/azure/networking/microsoft-global-network) offers multiple options to establish connectivity between the Power Platform virtual network and your enterprise virtual network.

### Subnet size

The size of the delegated subnet in a virtual network should accommodate future growth in usage and the addition of new services. Sizing your subnet appropriately ensures that requests don't get throttled. For more information on sizing your subnet, go to [Estimating subnet size for Power Platform environments](./vnet-support-overview.md#estimating-subnet-size-for-power-platform-environments).

### Azure NAT Gateway

Azure NAT Gateway uses network address translation (NAT) to allow containers in a delegated subnet to securely connect to internet resources by translating the private IP addresses of container instances to a static, public IP address. Static IP addresses allow for consistent and secure outbound connections.

If your organization implements Virtual Network support in an environment without migrating all data sources to the private network, you **must** configure Azure NAT Gateway. It's required to prevent disruptions to existing integrations that require access to internet resources, allowing you to transition your integrations to Virtual Network without affecting current workloads.

### Network monitoring

Network monitoring tracks and analyzes the traffic flow in the delegated subnet, which is essential for identifying and resolving potential issues. By providing insights into the performance and health of the network components, monitoring helps make sure that the network is operating efficiently and securely. Monitoring tools can detect anomalies such as unusual traffic patterns or unauthorized access attempts, allowing for timely intervention and mitigation.

### Network security groups

Network security groups (NSGs) allow you to define security rules that control traffic to and from your Azure resources. When you delegate a subnet, you can configure NSGs to ensure that only authorized traffic is allowed, helping you maintain the security and integrity of your network. NSGs can be applied to both subnets and individual network interfaces, providing flexibility in managing traffic at different levels.

### Best practices for securing outbound connections from Power Platform services

The following best practices help you secure outbound connections from Power Platform services, which is crucial to mitigate data exfiltration risks and ensure compliance with security policies.

- **Restrict outbound traffic**: Limit the outbound traffic from Power Platform resources to specific endpoints. Use network security groups and Azure Firewall to enforce traffic rules and control access.

- **Use private endpoints**: Use private endpoints for secure communication between Power Platform services and Azure resources. Private endpoints ensure that traffic remains inside the Azure network and doesn't traverse the public internet.

- **Monitor and audit traffic**: Use [Azure Network Watcher](/azure/network-watcher/network-watcher-overview) and [Microsoft Sentinel](/azure/sentinel/overview?tabs=azure-portal) to monitor and audit the outbound traffic from Power Platform services to help you identify and respond to potential security threats in real time.

- **Apply security policies**: Enforce security policies using Azure Policy and Azure Firewall to ensure that all outbound connections comply with your organization's security requirements. To control data flow, apply data loss prevention policies and endpoint filtering to connectors.

## Sample Virtual Network configurations

In this section, we provide sample configurations for Virtual Network support in Power Platform. These configurations illustrate how to set up virtual networks and subnets for different scenarios, ensuring secure connectivity between Power Platform services and Azure resources.

### When your Azure resources are in a paired Azure region and the Power Platform environment is in the United States

In this scenario, we make the following assumptions:

- Your Power Platform environment is located in the United States.
- The Azure region for the virtual network is set to West US and East US.
- Your enterprise resources are in a virtual network, VNET1, in the West US region.

The following minimum configuration is needed to set up Virtual Network support in this scenario:

1. Create a virtual network, VNet1, in West US and set up subnets for delegation.
1. Create a second virtual network, VNet2, in East US and set up subnets for delegation.
1. Establish a peering connection between VNet1 and VNet2.
1. Configure Power Platform Virtual Network integration for the desired environments using the subnets you created in steps 1 and 2.

:::image type="content" source="media/vnet-sample-scenario-1.png" alt-text="Diagram showing the configuration of Virtual Network support when Azure resources are in one of the paired Azure regions and the Power Platform environment is in the United States." lightbox="media/vnet-sample-scenario-1.png":::

### When your Azure resources are in the Central US Azure region and the Power Platform environment is in the United States

In this scenario, we make the following assumptions:

- Your Power Platform environment is located in the United States.
- The primary and failover Azure region for the virtual network is set to West US and East US, respectively.
- Your enterprise resources are in a virtual network, VNet1, in the Central US region.

The following minimum configuration is needed to set up Virtual Network support in this scenario:

1. Create a virtual network, VNet2, in West US and set up subnets for delegation.
1. Create another virtual network, VNet3, in East US and set up subnets for delegation.
1. Establish a peering connection between VNet1 and VNet2.
1. Establish a peering connection between VNet1 and VNet3.
1. Configure Power Platform Virtual Network integration for the desired environments using the subnets you created in steps 1 and 2.

:::image type="content" source="media/vnet-sample-scenario-2.png" alt-text="Diagram showing the configuration of Virtual Network support when Azure resources are in the Central US Azure region and the Power Platform environment is in the United States." lightbox="media/vnet-sample-scenario-2.png":::

## Case study

The following case study illustrates how a Microsoft customer successfully implemented Virtual Network support for Power Platform to enhance security and connectivity while ensuring compliance with regulatory requirements.

### A company enhances its business agility with generative AI and secure integration using Azure Virtual Network

To explore practical business use cases for generative AI, our customer conducted a hackathon. The event brought together multiple citizen developers, who built a successful prototype in just one month using Power Platform and Azure AI Services. The hackathon not only showcased the potential of generative AI, but also provided valuable hands-on experience to the participants, fostering innovation and collaboration within the organization.

**Customer challenges**: Transitioning from prototype to production posed significant challenges. The primary hurdle was establishing a secure, private-network architecture on Power Platform and Azure that complied with the company's stringent internal security policies. Ensuring data privacy and security while maintaining agility and scalability was crucial for the customer.

**Solution**: The customer used Azure subnet delegation&mdash;in other words, a virtual network&mdash;with a managed environment to establish a private-network architecture between Power Platform and private Azure resources. Using this architecture, the customer securely connected its Power Platform applications to Azure services without exposing sensitive data to the public internet.

:::image type="content" source="media/whitepaper-case-study.png" alt-text="Diagram showing the architecture our customer used to securely connect its Power Platform applications to Azure services without exposing sensitive data to the public internet." lightbox="media/whitepaper-case-study.png":::

**Benefits**: The implementation of this solution yielded several key benefits.

- The customer built a secure and agile integration foundation between Power Platform and Azure, accelerating the realization of business value. The integration allowed for seamless data flow and enhanced collaboration across departments.

- The new architecture eliminated costs and limitations associated with on-premises data gateways. By avoiding the need for on-premises infrastructure, the customer could reduce operational expenses and simplify maintenance.

- The customer is now poised to integrate other internal data sources, such as private Amazon Web Services and on-premises APIs, through this platform with Azure ExpressRoute. The expansion allows the customer to use a broader range of data and services, driving further innovation and efficiency.

## Conclusion

In this white paper, we explored various aspects of integrating Virtual Network support with Power Platform. We discussed the security benefits of using a virtual network, such as protecting sensitive data from unauthorized access and ensuring secure communication between Power Platform services and private resources. We discussed common use cases and real-world examples, provided integration patterns for different scenarios, and offered considerations for configuring Virtual Network support. We shared best practices for securing outbound connections from Power Platform services, including:

- Restricting outbound traffic
- Using private endpoints and subnet delegation
- Monitoring and auditing traffic
- Applying security policies

Finally, we examined a case study of a Microsoft customer that successfully implemented Virtual Network support for Power Platform to enhance security and connectivity while ensuring compliance with regulatory requirements.

Virtual Network support for Power Platform is a crucial feature that allows organizations to enhance their network security, optimize connectivity, and ensure compliance with regulatory requirements. Organizations that use Virtual Network support can securely connect Power Platform services to their private data sources, eliminating the risks associated with exposing those sources to the public internet.

## Related content

- [Virtual Network support overview](vnet-support-overview.md)
- [Set up Virtual Network support for Power Platform](vnet-support-setup-configure.md)
- [What is subnet delegation?](/azure/virtual-network/subnet-delegation-overview)
- [Understanding Azure Network Pricing](https://azurenavigator.com/understanding-azure-network-pricing/)
