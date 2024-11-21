---
title: Virtual Network support white paper
description: Learn about Microsoft Azure Virtual Network support within Power Platform.
author: ritesp
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/21/2024
ms.subservice: admin
ms.author: ritesp
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Virtual Network support white paper

This white paper provides an in-depth analysis of the integration of Azure Virtual Network support within Power Platform. Learn about significant benefits of this integration such as enhanced security, improved connectivity, and streamlined network management. With Virtual Network support, organizations ensure their Power Platform services operate within a secure and controlled network environment, reducing the risk of data breaches and unauthorized access.

This paper outlines the implementation process, technical architecture, and real-world use cases. Virtual Network support optimizes architecture and scalability of Power Platform applications. This paper provides practical insights from successful case studies, making it valuable resource for IT professionals and decision-makers looking to enhance their network security and operational efficiency benefit.

## Key benefits

- **Enhanced security**: Host Power Platform services within a secure network, protecting sensitive data from unauthorized access and potential breaches.

- **Improved connectivity**: Establish secure and reliable connections between Power Platform services and other Azure resources, enhancing overall connectivity.

- **Streamlined network management**: Simplify network management by providing a centralized and consistent approach to configuring and managing network settings for Power Platform services.

- **Scalability**: Scale Power Platform services efficiently, ensuring network resources can grow in line with business needs.

- **Compliance**: Meet regulatory and compliance requirements for network security and data protection.

## Background

[Microsoft Power Platform](/power-platform/) is a leading low-code/no-code platform that empowers users worldwide to build applications, automate workflows, and analyze data with minimal coding effort. Power Platform encompasses various Microsoft services, including Dataverse, Power Apps, Power Automate, Power BI, Copilot Studio, and Power Pages. You can create custom solutions tailored to specific business needs that foster innovation and enhance productivity.

[Dataverse](/power-apps/maker/data-platform/data-platform-intro) serves as the underlying data platform, providing a secure and scalable environment for storing and managing data. [Power Apps](/power-apps/powerapps-overview) allows users to build custom applications with a user-friendly interface, while [Power Automate](/power-automate/) allows the automation of repetitive tasks and workflows. [Power BI](/power-bi/) offers robust data visualization and analytics capabilities, and [Copilot Studio](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio) allows the creation of intelligent bots and agents. [Power Pages](/power-pages/introduction) facilitates the creation of professional-grade websites with ease.

The integration of these components with Azure resources using virtual networks, enhances the overall functionality and security of the Power Platform. Virtual networks provide a secure and isolated network environment, allowing organizations to control and manage network traffic effectively. With Virtual Network support, Power Platform services can operate within a secure network, ensuring data protection and compliance with regulatory requirements.

### Network security and Virtual Network integration

Network security is a critical aspect of any digital infrastructure. Protecting outbound traffic from Power Platform services is essential to prevent unauthorized access, data breaches, and other security threats. Virtual Network integration plays a vital role by providing a secure pathway for data transmission. The integration ensures that all outbound traffic from Power Platform services is routed through a controlled and monitored network environment, reducing the risk of exposure to potential threats.

By implementing Virtual Network support, organizations can enforce strict security policies, monitor network traffic, and detect any anomalies in real-time. This level of control is crucial for maintaining the integrity and confidentiality of sensitive data. Virtual Network integration allows for seamless connectivity between Power Platform services and other Azure resources, simplifying overall network architecture and improving the reliability.

## Overview of Virtual Network support in Power Platform

Virtual Network support for Power Platform is a significant enhancement that brings robust security and improved connectivity to the platform. Virtual networks are a fundamental component of Azure's networking capabilities, providing a secure and isolated environment for resources. With Virtual Network support for Power Platform, organizations can ensure their applications and services operate within a controlled network environment, safeguarding sensitive data and enhancing overall performance.

Virtual Network support for Power Platform allows organizations to connect their Power Platform services, such as Dataverse, Power Apps, Power Automate, Copilot Studio to resources within enterprise private networks. This integration enables secure communication between Power Platform services, other Azure resources, and networks such as on-premises services, databases, storage accounts, and a key vault. Organizations can enforce network security policies, control access to resources, and monitor network traffic effectively.

### How Virtual Network support enhances Power Platform security and connectivity

The integration of Virtual Network support significantly enhances the security and connectivity of Power Platform. By routing all outbound traffic from Power Platform services through a virtual network. Organizations can ensure that data is transmitted securely and remains protected from unauthorized access. This level of control is crucial for maintaining the integrity and confidentiality of sensitive information.

Virtual Network support improves connectivity by providing a reliable and consistent network environment. Organizations can establish secure connections between Power Platform services and other Azure resources, ensuring seamless data flow. This enhanced connectivity leads to improved security and a more efficient use of network resources.

Overall, Virtual Network support for Power Platform offers a comprehensive solution for organizations looking to enhance their network security and optimize the network configuration of their Power Platform applications.

## Implement Virtual Network support

Power Platform infrastructure consists of a serverless container orchestration layer that executes different workloads with a strict security boundary and guarantees individual, workload-level availability and scalability requirements. This container orchestration layer is used for all workloads needing isolation, including internal, Microsoft workload-like connectors and customer workloads, like plugins.

The containerized workload allows Power Platform to support network-level isolation, using a combination of Azure Subnet Delegation and Virtual Network injection features. The Virtual Network *injection* feature allows a container to get injected into a customer’s Virtual Network by attaching a network interface card (NIC). Any workload, running on that configured container, is executed within the customer’s network and can use private IP addresses within the network. For a plugin workload, the plugin code can access user services, resources, or Azure resources with a private link exposed to the same Virtual Network. Similarly, a connector workload can access the target resource or endpoint inside the same Virtual Network.

### Azure subnet delegation

Virtual Network support for Power Platform relies on [Azure subnet delegation](/azure/virtual-network/subnet-delegation-overview). Enterprises delegate a subnet to Power Platform, used by Power Platform services such as Dataverse plugins and connectors like [custom](/connectors/custom-connectors/), SQL, and Azure file storage, to process requests at runtime. Windows containers use the IP address from the delegated subnet to handle these requests.

Since the container operates within the boundaries of the delegated subnet and uses its IP address, any outbound call from this container remains within the enterprise's network boundaries. For example, the call stays within the virtual network that's part of this subnet. This setup allows enterprises to have full control over the policies, rules, and network packets that exit these Windows containers. Enterprises can apply the same controls to the delegated subnet as they do with their own network.

Power Platform doesn't manage the configuration of the delegated subnet. The only requirement is that the delegated subnet must not be associated with any other service. Once a subnet is delegated, the IPs within that subnet are reserved only for Power Platform. The subnet can't be used for any other resources or  delegated to other services.

By default, internet access is disabled from Windows containers. If the enterprise's code running within these containers have a requirement for internet access, they can configure [NAT Gateway](/azure/nat-gateway/nat-overview) on the delegated subnet to allow the Windows containers to connect to resources on the internet.

#### Delegated subnet ownership for Microsoft and customers

| Controls | Description | Ownership lies with |
|----------|-------------|---------------------|
| NAT Gateway | When a NAT Gateway is attached to a subnet, it becomes the next hop for all internet-destined traffic from that subnet. Any outbound traffic from the subnet to the internet is routed through the NAT Gateway. All instances within the subnet remain private with secure and scalable outbound connectivity. | Customer |
| Network Security Groups (NSGs) | Customers can associate NSGs with the delegated subnet. Define and enforce security rules to control inbound and outbound traffic to and from the subnet. | Customer |
| Route Tables | Customers can associate route tables with the delegated subnet. Define custom routing policies to control the flow of traffic within the virtual network and to external networks. | Customer |
| Network Monitoring | Network monitoring also helps in maintaining compliance with security policies by enforcing traffic to travel through the enterprise's virtual private network. | Customer|
| IP Address Management | Customers can dictate the IP address space for the delegated subnet, ensuring it uses private IP address ranges, for example `10.0.0.0/8`, `192.168.0.0/16`, `172.16.0.0/12`. | Customer |
| DNS Configuration | Customers can configure custom DNS settings for the delegated subnet, including Azure DNS entries | Customer |
| Windows Container | Windows containers execute requests from Virtual Network supported services and acquire IPs from the delegated subnet. | Microsoft |
| Multitenant support  | All customer requests are executed in their own delegated subnet. | Microsoft |

## Technical architecture

The layout and communication flow of components demonstrates *using* versus *not using* the virtual network feature for plugin and connector workloads:

:::image type="content" source="media/technical-architecture.png" alt-text="Virtual network technical architecture" lightbox="media/technical-architecture.png":::

In a virtual network configuration, the container running the plugin or connector is part of customer’s virtual network. Communications to endpoints within the virtual network remain within the virtual network boundary. Customers can extend the boundary to other virtual or on-premises networks by using Virtual Network peering and Express route or VPN Gateways.

Power Platform components in a containerized workload of a customer’s virtual network must have some communication with the components in the workload. For example, Power Platform can trigger a plugin in the workload or invoke the connector when needed.

Since the container isn't attached to the infrastructure network, a special channel is established with the container from the orchestration layer. This channel allows specific signals to be sent to the workload. A local IP within the container (APIPA address) is used for this purpose. Only specific inbound messages to the workload from the platform are allowed to maintain the isolation of the container and the workload.

The following diagram shows how Power Platform can route the execution requests to the container while maintaining the container isolation boundaries:  

:::image type="content" source="media/container-isolation-boundaries.png" alt-text="Diagram showing how platform can route the execution requests to the container while maintaining the container isolation boundaries." lightbox="media/container-isolation-boundaries.png":::

## Enable Virtual Network support for Power Platform

Learn how to enable Virtual Network support for Power Platform in [Set up Virtual Network support for Power Platform](vnet-support-setup-configure.md).

## Common use cases and scenarios

Virtual Network support for Power Platform is essential for organizations looking to enhance their network security and optimize connectivity.

In this section, you learn about common use cases of the Virtual Network capability in Power Platform and some real-world examples across industries benefitting from this capability.

### Secure data integration

Organizations can use Virtual Network support to securely connect Power Platform services to their private data sources, such as Azure SQL Database, Azure Storage, and on-premises resources. This setup ensures that data remains within the organization's network boundaries and isn't exposed to the public internet.

### Private endpoints for connectors

Power Platform connectors can use Virtual Network support to establish private endpoints. Power Platform connectors like Azure SQL, Azure File Storage, Azure Key Vault, and other Azure services can communicate securely. The private network eliminates the need for public IP addresses and reduces the risk of data breaches.

### Securing your Copilot Studio integrations

You can use Virtual Network support in Power Platform connectors within Copilot Studio to establish secure connectivity with data sources. This network eliminates the risks associated with exposing the data sources to the public internet and mitigates the risks of data exfiltration.

### Virtual Network integration benefits

Some example institutions and sectors that can benefit greatly with Virtual Network support include:

- Financial
- Healthcare
- Retail
- Government

#### Financial Institutions

A large bank can use Virtual Network support to securely connect Power Platform applications such as Power Apps, Power Automate, Dynamics 365 apps to its protected databases and services. By doing so, the bank can ensure that customer data is protected and complies with regulatory requirements. This setup also allows the bank to create secure workflows and automate processes without exposing sensitive information to the public internet.

#### Healthcare Providers

A healthcare organization can use Virtual Network integration to connect Power Platform applications such as Power Apps, Power Automate, and Dynamics 365 apps with its electronic health record (EHR) systems. Patient data can be securely accessed and managed within the organization's private network. The healthcare provider can also use Virtual Network support to create secure communication channels between different departments and external partners.

#### Retail Companies

A retail company can securely connect its Power Platform applications such as Power Apps, Power Automate, and Dynamics 365 apps to inventory management systems and customer databases. Private connections allow the company to streamline operations, improve inventory tracking, and enhance customer service while ensuring that sensitive data remains protected.

#### Government Agencies

Government agencies can use Virtual Network support to securely connect Power Platform applications such as Power Apps, Power Automate, and Dynamics 365 apps to various internal systems and databases. This connection enables the agencies to automate processes, improve data sharing, and enhance collaboration while maintaining strict security and compliance standards.

Organizations across different industries can enhance their security posture, improve connectivity, and ensure compliance with regulatory requirements.

## Integration Patterns

The type of workload that enterprises want to run within an environment determines the integration pattern for the Power Platform. You can use Virtual Network support for Power Platform as an integration pattern in your environment with some exceptions.

### API workloads

If enterprises plan to run API workloads like plugins, connectors, or service endpoints, Virtual Network support for Power Platform is the only supported way to integrate securely with your data sources within your network.

> [!NOTE]
> For Power Platform connectors, which require partner drivers, a Windows Auth connection, and mashup hosting can't be supported through Virtual Network. These connectors have less than 1% of total usage and continue to use on-premises data gateway (OPDG) today.

### ETL workloads

Power BI and Power Platform data flows use Virtual Network Data Gateway.

:::image type="content" source="media/VNet-support.png" alt-text="Virtual Network support for Power Platform." lightbox="media/VNet-support.png":::

### Set-up and configuration considerations

To use the Virtual Network support for Power Platform, consider the following guidelines when you set up and configure it.

#### Regional

Virtual Network support requires that a Power Platform environment location must match with the delegated subnets Azure regions. If you have a Power Platform environment in the United States, then each of two virtual networks and subnets must be in the East US and West US Azure regions.

If your Azure resources are in different regions, use a global virtual network peering or similar connectivity option with high speed and low latency. With Microsoft Backbone, establish the connectivity between the Power Platform Virtual Network and enterprises Virtual Network.

#### Subnet size

The size of the delegated subnet within a virtual network is a critical concern, considering future growth in usage and the onboarding of new services. The following table provides guidance on the number of environments that can be attached to the same enterprise policy based on available IPs. Size ensures that requests aren't throttled.

  | Min # of environments | Max # of environments | Virtual Network execution load  | Subnet size |
  |----------|------------|--------------|-------------|
  | 3 | 5 | High to high | `/24` <br>251 usable IP addresses |
  | 10 | 20 | High to medium | `/24` <br>251 usable IP addresses |
  | 20 | 50 | Medium to low | `/24` <br>251 usable IP addresses |

#### NAT Gateway

Azure Network Address Translation (NAT) Gateway enables Windows containers within a delegated subnet to securely connect to internet resources. NAT Gateway ensures secure communication by translating the private IP addresses of container instances to a static public IP address. Static IPs allow for consistent and secure outbound connections.

Enterprises need to configure NAT Gateway to prevent disruptions in existing integrations when onboarding a production environment to Virtual Network without migrating all data sources to the private network. This configuration allows enterprises to transition their integrations to Virtual Network without affecting current workloads.

#### Network Monitoring

Network monitoring helps in tracking and analyzing the traffic flow within the delegated subnet. This monitoring is essential for identifying and resolving any potential issues. Monitoring ensures that the network is operating efficiently and securely by providing insights into the performance and health of the network components. Monitoring tools can detect anomalies, such as unusual traffic patterns or unauthorized access attempts, allowing for timely intervention and mitigation.

#### Network Security Group (NSG)

NSGs allow you to define security rules that control inbound and outbound traffic to and from your Azure resources. When delegating a subnet, you can configure NSGs to ensure that only authorized traffic is allowed. NSGs help in maintaining the security and integrity of the network by preventing unauthorized access and potential threats.

NSGs can be applied to both subnets and individual network interfaces, providing flexibility in managing traffic at different levels.

## Security considerations

Using Azure Virtual Network with Power Platform offers several security benefits that enhance the protection of your data and resources. By integrating Power Platform with Virtual Network, you can ensure your services are hosted within a secure network. This security protects sensitive data from unauthorized access and potential breaches. Virtual Network support allows Power Platform services to connect to your private and protected resources without exposing them to the internet, ensuring data protection and preventing unauthorized access.

Additionally, Virtual Network support improves connectivity by providing a reliable and consistent network environment. Organizations can establish secure connections between Power Platform services and other Azure resources, ensuring seamless data flow and security. This enhanced connectivity leads to better security posture and a more efficient use of network resources.

### Best practices for securing outbound connections from Power Platform services

Securing outbound connections from Power Platform services is crucial to mitigate data exfiltration risks and ensure compliance with security policies. Consider the following best practices.

#### Restrict Outbound Traffic

Limit the outbound traffic from Power Platform resources to specific endpoints. This limit can be achieved by using Azure Network Security Groups (NSGs) and Azure Firewall to enforce traffic rules and control access.

#### Use Private Endpoints

Utilize private endpoints to enable secure communication between Power Platform services and Azure resources. This security ensures that traffic remains within the Azure network and doesn't traverse the public internet.

#### Monitor and Audit Traffic

Use [Azure Network Watcher](/azure/network-watcher/network-watcher-overview) and [Microsoft Sentinel](/azure/sentinel/overview?tabs=azure-portal) to monitor and audit the outbound traffic from Power Platform services. This monitoring helps identify and respond to potential security threats in real-time.

#### Apply Security Policies

Enforce security policies using Azure Policy and Azure Firewall to ensure all outbound connections comply with your organization's security requirements. To control data flow, choose data loss prevention (DLP) policies and endpoint filtering on connectors.

By following these best practices, you can secure outbound connections from Power Platform services, protect your data from exfiltration, and ensure compliance with security policies.

## Case Studies

### Customer Case Study: Enhancing Business Agility with Generative AI and Secure Integration using Azure VNet
**Background**: To explore practical business use cases for Generative AI, our customer conducted a hackathon. This event brought together multiple citizen developers who, within a month, successfully developed a prototype using Power Platform and Azure AI Services. The hackathon not only showcased the potential of Generative AI but also provided valuable hands-on experience to the participants, fostering innovation and collaboration within the organization.

**Customer Challenges**: Despite the hackathon's success, transitioning from prototype to production posed significant challenges. The primary hurdle was establishing a secure, private-network architecture on Power Platform and Azure that complied with the company's stringent internal security policies. Ensuring data privacy and security while maintaining agility and scalability was crucial for the customer.

**Solution**: To address these challenges, the customer leveraged Azure Subnet Delegation aka VNet Support available with Managed Environment. This enabled the establishment of a private-network architecture between Power Platform and private Azure resources, all protected by a Virtual Network. By utilizing this architecture, the customer could securely connect their Power Platform applications to Azure services without exposing sensitive data to the public internet.

:::image type="content" source="media/whitepaper-case-study.png" alt-text="A diagram  showing the architecture the customer used to securely connect their Power Platform applications to Azure services without exposing sensitive data to the public internet.":::

**Benefits**: The implementation of this solution yielded several key benefits:
- The customer achieved a secure and agile integration foundation between Power Platform and Azure, accelerating the realization of business value. This integration allowed for seamless data flow and enhanced collaboration across different departments.
- The new architecture eliminated costs and limitations associated with on-premises data gateways. By avoiding the need for on-premises infrastructure, the customer could reduce operational expenses and simplify maintenance.
- The customer is now poised to expand integration with other internal data sources, including private AWS and on-premises APIs, via this platform with ExpressRoute. This expansion will enable the customer to leverage a broader range of data and services, driving further innovation and efficiency.

By overcoming initial challenges and implementing a robust solution, the customer has set the stage for future advancements and continued innovation. The success of this project highlights the potential of Generative AI and secure integration in transforming business operations and delivering tangible benefits.

## Conclusion

In this white paper, we explored the various aspects of integrating Virtual Network support with Power Platform. We discussed the security benefits of using Virtual Network. Benefits such as protecting sensitive data from unauthorized access and ensuring secure communication between Power Platform services and private resources.

We shared best practices for securing outbound connections that include:

- Restricting outbound traffic
- Using private endpoints and subnet delegation
- Monitoring and auditing traffic
- Applying security policies

We discussed common use cases and scenarios where Virtual Network support can enhance security and connectivity such as:

- Financial institutions
- Healthcare providers
- Retail companies
- Government agencies

Virtual Network support for Power Platform is a crucial feature that enables organizations to enhance their network security, optimize connectivity, and ensure compliance with regulatory requirements. Organizations that use Virtual Network support can securely connect Power Platform services to their private data sources. This secure connection eliminates the risks associated with exposing those sources to the public internet. You protect sensitive data and improve the security posture of Power Platform applications.

Integrating Virtual Network support with Power Platform provides a comprehensive solution for organizations looking to enhance their digital infrastructure. It offers a secure, reliable, and efficient way to manage data and resources, ensuring that Power Platform applications can meet the demands of modern business environments.

## Related information

- [Virtual Network support overview](vnet-support-overview.md)
- [Set up Virtual Network support for Power Platform](vnet-support-setup-configure.md)
- [What is subnet delegation in Azure Virtual Network?](/azure/virtual-network/subnet-delegation-overview)
- [Understanding Azure Network Pricing](https://azurenavigator.com/understanding-azure-network-pricing/)
