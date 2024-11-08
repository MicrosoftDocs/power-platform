---
title: Virtual Network executive summary
description: Learn about Microsoft Azure Virtual Network support Within the Power Platform.
author: ritesp
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/08/2024
ms.subservice: admin
ms.author: ritesp
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Virtual Network executive summary

This white paper provides an in-depth analysis of the integration of Virtual Network (VNet) support within the Power Platform. It highlights the significant benefits of this integration, including enhanced security, improved connectivity, and streamlined network management. By enabling VNet support, organizations can ensure that their Power Platform services operate within a secure and controlled network environment, thereby reducing the risk of data breaches and unauthorized access. The paper outlines the implementation process, technical architecture, and real-world use cases, demonstrating how VNet support can be effectively leveraged to optimize the performance and scalability of Power Platform applications. Additionally, it discusses future enhancements and provides practical insights from successful case studies, making it a valuable resource for IT professionals and decision-makers looking to enhance their network security and operational efficiency. 

## Key Benefits of VNet Support for Power Platform: 

- **Enhanced Security**: VNet support ensures that Power Platform services are hosted within a secure network, protecting sensitive data from unauthorized access and potential breaches. 

- **Improved Connectivity**: By integrating VNet, organizations can establish secure and reliable connections between Power Platform services and other Azure resources, enhancing overall connectivity. 

- **Streamlined Network Management**: VNet support simplifies network management by providing a centralized and consistent approach to configuring and managing network settings for Power Platform services. 

- **Optimized Performance***: VNet integration allows for better control over network traffic, leading to improved performance and reduced latency for Power Platform applications. 

- **Scalability**: VNet support enables organizations to scale their Power Platform services efficiently, ensuring that network resources can grow in line with business needs. 

- **Compliance**: By using VNet, organizations can meet regulatory, and compliance requirements related to network security and data protection.

## Introduction

### Background on Power Platform and its Components 

The Power Platform is a leading low-code/no-code platform that empowers users worldwide to build applications, automate workflows, and analyse data with minimal coding effort. It encompasses various services, including Dataverse, Power Apps, Power Automate, Power BI, Power Virtual Agents, and Power Pages. These services enable organizations to create custom solutions tailored to their specific business needs, fostering innovation and enhancing productivity. 

Dataverse serves as the underlying data platform, providing a secure and scalable environment for storing and managing data. Power Apps allows users to build custom applications with a user-friendly interface, while Power Automate enables the automation of repetitive tasks and workflows. Power BI offers robust data visualization and analytics capabilities, and Microsoft Copilot Studio (MCS) allows the creation of intelligent bots and agents. Power Pages facilitates the creation of professional-grade websites with ease. 

The integration of these components with Azure resources, such as Virtual Networks (VNet’s), enhances the overall functionality and security of the Power Platform. VNet’s provide a secure and isolated network environment, enabling organizations to control and manage network traffic effectively. By leveraging VNet support, Power Platform services can operate within a secure network, ensuring data protection and compliance with regulatory requirements. 

### Importance of Network Security and VNet Integration 

Network security is a critical aspect of any digital infrastructure, and the Power Platform is no exception. Protecting outbound traffic from Power Platform services is essential to prevent unauthorized access, data breaches, and other security threats. VNet integration plays a vital role in this regard by providing a secure pathway for data transmission. It ensures that all outbound traffic from Power Platform services is routed through a controlled and monitored network environment, reducing the risk of exposure to potential threats. 

By implementing VNet support, organizations can enforce strict security policies, monitor network traffic, and detect any anomalies in real-time. This level of control is crucial for maintaining the integrity and confidentiality of sensitive data. Additionally, VNet integration allows for seamless connectivity between Power Platform services and other Azure resources, enhancing overall network performance and reliability. 

This white paper explores the benefits and implementation of VNet support for Power Platform, providing insights into how organizations can enhance their network security and optimize the performance of their Power Platform applications. 

## Overview of VNet Support 

Virtual Network (VNet) support for Power Platform is a significant enhancement that brings robust security and improved connectivity to the platform. VNet’s are a fundamental component of Azure's networking capabilities, providing a secure and isolated environment for resources. By integrating VNet support with Power Platform, organizations can ensure that their applications and services operate within a controlled network environment, safeguarding sensitive data and enhancing overall performance. 

### Explanation of VNet Support for Power Platform 

VNet support for Power Platform allows organizations to connect their Power Platform services, such as Dataverse, Power Apps, Power Automate, Microsoft Copilot Studio etc. to resources within Enterprises private network. This integration enables secure communication between Power Platform services and other Azure resources as well as customer network, such as on-premises services, databases, and azure resources storage accounts, key vault. By leveraging VNet support, organizations can enforce network security policies, control access to resources, and monitor network traffic effectively. 

### How VNet Support Enhances Power Platform Security and Connectivity 

The integration of VNet support significantly enhances the security and connectivity of Power Platform. By routing all outbound traffic from Power Platform services through a VNet, organizations can ensure that data is transmitted securely and remains protected from unauthorized access. This level of control is crucial for maintaining the integrity and confidentiality of sensitive information. 

Additionally, VNet support improves connectivity by providing a reliable and consistent network environment. Organizations can establish secure connections between Power Platform services and other Azure resources, ensuring seamless data flow and reducing latency*. This enhanced connectivity leads to better performance and a more efficient use of network resources*. 

Overall, VNet support for Power Platform offers a comprehensive solution for organizations looking to enhance their network security and optimize the performance of their Power Platform applications. 

## Implementation Details

Power Platform infrastructure consists of a server-less Container Orchestration layer that allows the platform to execute different workloads with strict security boundary and guarantees individual workload level availability and scalability requirements. This container orchestration layer is used for all workloads needing isolation, including internal Microsoft workload like connectors runtime as well as customer workloads like Plugins. 

The containerize workload also allows Power Platform to support network level isolation by utilizing a combination of Azure Subnet Delegation and VNET injection features. The VNET Injection feature allows a Container to get injected into the customer’s VNET by attaching a NIC that is connected to the subnet delegated to Power Platform. Any workload running on that container configured such way is essentially executing within customer’s network and able to use private IP addresses within the network. For plugin workload, this enables the plugin code to be able to access customer’s services, resources or Azure resources with Private Link exposed to the same VNET. Similarly, connector workload can access the target resource or endpoint inside the same VNET. 

VNet support for Power Platform relies on Azure Subnet delegation. This means that Enterprises delegate a subnet to Power Platform, which is then used by Power Platform services such as Dataverse plug-ins and connectors like Custom, SQL, and Azure file storage etc. to process requests at runtime. The IP address from the delegated subnet is utilized by Windows Containers to handle these requests. 

Since the container operates within the boundaries of the delegated subnet and uses its IP address, any outbound call from this container remains within the Enterprise's network boundaries i.e. the VNet that this subnet is part of. This setup allows enterprises to have full control over the policies, rules, and network packets that exit these Windows Containers. Enterprises can apply the same controls to the delegated subnet as they do with their own network. 

Power Platform does not manage the configuration of the delegated subnet. The only requirement is that the delegated subnet must not be associated with any other service. Once a subnet is delegated, the IPs within that subnet will be reserved for Power Platform only and the subnet cannot be used for any other resources or cannot be delegated to other services. 

By default, internet access is disabled from these Windows container. If the Enterprises code running within these containers have requirement to have internet access, they can configure NAT Gateway on the delegated subnet to allow the Windows containers to connect to resources on the internet. 

If you look at the ownership of Delegated subnet between Microsoft and Customers, following table explains it.

| Controls | Description | Ownership lies with |
|----------|-------------|---------------------|
| NAT Gateway | When a NAT Gateway is attached to a subnet, it becomes the next hop for all internet-destined traffic from that subnet. This means that any outbound traffic from the subnet to the internet will be routed through the NAT Gateway. This setup ensures that all instances within the subnet can remain private while still having secure and scalable outbound connectivity | Customer |
| Network Security Groups (NSGs) | Customers can associate NSGs with the delegated subnet. This allows them to define and enforce security rules to control inbound and outbound traffic to and from the subnet. | Customer |
| Route Tables | Customers can associate route tables with the delegated subnet. This enables them to define custom routing policies to control the flow of traffic within the virtual network and to external networks | Customer |
| Network Monitoring | Network monitoring also helps in maintaining compliance with security policies by enforcing traffic to travel through the Enterprises virtual private network. | Customer|
| IP Address Management | Customers can dictate the IP address space for the delegated subnet, ensuring it uses private IP address ranges (e.g., 10.0.0.0/8, 192.168.0.0/16, 172.16.0.0/12) | Customer |
| DNS Configuration | Customers can configure custom DNS settings for the delegated subnet, including Azure DNS entries | Customer |
| Windows Container | Windows container executes the requests from VNet supported services and acquires IP from delegated subnet. | Microsoft |
| Multi-tenant support  | All the customers’ requests are executed in their own delegated Subnet. | Microsoft |

## Technical architecture

<Insert graphic.>

The above diagram depicts the layout and communication flow of components when using VNET feature vs. not using VNET feature for plugin and connector workloads. As explained in the section above, in VNET configuration, the container that running plugin or connector is part of customer’s VNET and communications to endpoints within the VNET remains within the VNET boundary. Customer has the ability to extend the boundary to other VNETs or On-premises networks by using VNET peering and Express route or VPN Gateways. 

While the container, and the specific workload within it is executing in customer’s VNET, for the Power Platform features to work seamlessly, Power Platform component needs to be able to have some communication with the components within the workload. For example, Power Platform needs to be able to trigger a plugin in the workload or invoke the connector when needed. Since the container is not attached to the infrastructure network, there is a special channel that is established with the container from the orchestration layer that allows these specific signals to be sent to the workload. A local specific IP withing the container (APIPA address) is used for this purpose. Only specific inbound messages to the workload from the platform is allowed through this to maintain the isolation of the container and the workload. The following diagram shows how platform can route the execution requests to the container while maintaining the container isolation boundaries.  

<Insert graphic.>

## Steps to enable VNet support for Power Platform

You can enable VNet support for Power Platform on an environment by following this article [Set up Virtual Network support for Power Platform](vnet-support-setup-configure.md).

## Use Cases and Scenarios 

### Common use cases for VNet support in Power Platform 

Virtual Network (VNet) support for Power Platform is essential for organizations looking to enhance their network security and optimize connectivity. Here are some common use cases: 

**Secure Data Integration**: Organizations can use VNet support to securely connect Power Platform services to their private data sources, such as Azure SQL Database, Azure Storage, and on-premises resources. This ensures that data remains within the organization's network boundaries and is not exposed to the public internet. 

**Private Endpoints for Connectors**: Power Platform connectors can leverage VNet support to establish private endpoints, allowing secure communication between Power Platform connectors like Azure SQL, Azure File Storage, Azure Key Vault etc. and other Azure services. This eliminates the need for public IP addresses and reduces the risk of data breaches. 

**Securing your Microsoft Copilot Studio (MCS) Integrations**: You can utilize VNet supported Power Platform connectors within MCS to establish secure connectivity with data sources, eliminating the risks associated with exposing the data sources to public internet and thereby mitigating the risks of Data exfiltration. 

### Examples of how different organizations can benefit from VNet integration 

**Financial Institutions**: A large bank can use VNet support to securely connect Power Platform applications such as Power Apps, Power Automate, Dynamics 365 apps to its protected databases and services. By doing so, the bank can ensure that customer data is protected and complies with regulatory requirements. This setup also allows the bank to create secure workflows and automate processes without exposing sensitive information to the public internet. 

**Healthcare Providers**: A healthcare organization can leverage VNet integration to connect Power Platform applications such as Power Apps, Power Automate, and Dynamics 365 apps with its electronic health record (EHR) systems. This ensures that patient data is securely accessed and managed within the organization's private network. The healthcare provider can also use VNet support to create secure communication channels between different departments and external partners. 

**Retail Companies**: A retail company can benefit from VNet integration by securely connecting its Power Platform applications such as Power Apps, Power Automate, and Dynamics 365 apps to inventory management systems and customer databases. This allows the company to streamline operations, improve inventory tracking, and enhance customer service while ensuring that sensitive data remains protected. 

**Government Agencies**: Government agencies can use VNet support to securely connect Power Platform applications such as Power Apps, Power Automate, and Dynamics 365 apps to various internal systems and databases. This enables the agencies to automate processes, improve data sharing, and enhance collaboration while maintaining strict security and compliance standards. 

By leveraging VNet support, organizations across different industries can enhance their security posture, improve connectivity, and ensure compliance with regulatory requirements. 

## Integration Patterns 

The integration pattern for the Power Platform environment should considered based on kind of workload that Enterprises would like to run within the environment. 

**API workloads**: If Enterprises plan to run API workloads like Plug-ins, connectors, service endpoints etc., then VNet support for Power Platform is the only supported way to integrate securely with your data sources within your network. For Power Platform connectors, which require 3rd party drivers, Windows Auth connection and mashup hosting won’t be supporting through VNet. These connectors have <1% of total usage.  These connectors will continue to use OPDG as it is today. 

**ETL workloads**: Power BI and Power Platform Data Flows will continue to use VNet Data Gateway. 

It implies that Microsoft direction is to use VNet support for Power Platform as integration pattern in your environment with exceptions noted in above paragraph. 

<Insert graphic.>

While implementing the VNet support for Power Platform, following considerations must be applied to the set up and configuration of VNet. 

- **Region considerations**: VNet support requires that Power Platform environment location must match with the delegated subnets azure regions. If you have a Power Platform environment in United States, then each of two VNet and Subnets must be in East US and West US Azure regions. In case, your Azure resources are in different Azure regions, we recommend global VNet peering or similar connectivity options with high speed, low latency and using Microsoft Backbone to establish the connectivity between the Power Platform VNet and Enterprises VNet. 

- **Subnet size considerations**: It is crucial for enterprises to consider the size of the delegated subnet within the VNet, considering future growth in usage and the onboarding of new services. The following table provides guidance on the number of environments that can be attached to the same Enterprise Policy based on available IPs, ensuring that requests are not throttled.

    | Min No of Environments | Max Number of Environments | VNet Execution Load  | Subnet size |
    |------------------------|-------------------------------|--------------------|-------------|
    | 3 | 5 | Very high to high | /24 (251 usable IP addresses)|
    | 10| 20| High to medium | /24 (251 usable IP addresses)|
    | 20 | 50| Medium to low | /24 (251 usable IP addresses) |

- **NAT Gateway**: NAT Gateway enables Windows containers within a delegated subnet to securely connect to internet resources. It ensures secure communication by translating the private IP addresses of container instances to a static public IP address, allowing for consistent and secure outbound connections. 

    Enterprises need to configure NAT Gateway to prevent disruptions in existing integrations when onboarding a production environment to VNet without migrating all data sources to the private network. This configuration allows enterprises to transition their integrations to VNet without affecting current workloads. 

- **Network Monitoring**: Network monitoring helps in tracking and analysing the traffic flow within the delegated subnet, which is essential for identifying and resolving any potential issues. It ensures that the network is operating efficiently and securely by providing insights into the performance and health of the network components. Monitoring tools can detect anomalies, such as unusual traffic patterns or unauthorized access attempts, allowing for timely intervention and mitigation 

- **Network Security Group (NSG)**: NSGs allow you to define security rules that control inbound and outbound traffic to and from your Azure resources. When delegating a subnet, it's crucial to configure NSGs to ensure that only authorized traffic is allowed. This helps in maintaining the security and integrity of the network by preventing unauthorized access and potential threats. NSGs can be applied to both subnets and individual network interfaces, providing flexibility in managing traffic at different levels

## Security Considerations 

### Security benefits of using VNet with Power Platform 

Using a Virtual Network (VNet) with Power Platform offers several security benefits that enhance the protection of your data and resources. By integrating Power Platform with Azure Virtual Network, you can ensure that your services are hosted within a secure network, thereby protecting sensitive data from unauthorized access and potential breaches. VNet support allows Power Platform services to connect to your private and protected resources without exposing them to the internet, ensuring data protection and preventing unauthorized access. 

Additionally, VNet support improves connectivity by providing a reliable and consistent network environment. Organizations can establish secure connections between Power Platform services and other Azure resources, ensuring seamless data flow and reducing latency. This enhanced connectivity leads to better performance and a more efficient use of network resources. 

### Best practices for securing outbound connections from Power Platform services 

Securing outbound connections from Power Platform services is crucial to mitigate data exfiltration risks and ensure compliance with security policies. Here are some best practices to follow: 

**Restrict Outbound Traffic**: Limit the outbound traffic from Power Platform resources to only the endpoints that you allow. This can be achieved by using Azure Network Security Groups (NSGs) and Azure Firewall to enforce traffic rules and control access. 

**Use Private Endpoints**: Utilize private endpoints to enable secure communication between Power Platform services and Azure resources. This ensures that the traffic remains within the Azure network and does not traverse the public internet. 

**Monitor and Audit Traffic**: Use Azure Network Watcher and Azure Sentinel to monitor and audit the outbound traffic from Power Platform services. This helps in identifying and responding to potential security threats in real-time. 

**Apply Security Policies**: Enforce security policies using Azure Policy and Azure Firewall to ensure that all outbound connections comply with your organization's security requirements. This includes applying data loss prevention (DLP) policies and endpoint filtering on connectors to control data flow. 

By following these best practices, you can secure outbound connections from Power Platform services, protect your data from exfiltration, and ensure compliance with security policies. 

## Performance and Scalability 

- Impact of VNet support on performance and scalability. 

- Strategies to optimize performance while using VNet. 

## Case Studies 

- Real-world examples of organizations that have successfully implemented VNet support for Power Platform. 

- Lessons learned and best practices from these implementations. 

## Future Enhancements 

- Planned future enhancements for VNet support in Power Platform. 

- Roadmap for upcoming features and improvements.

## Conclusion 

### Summary of key points 

In this white paper, we have explored the various aspects of integrating Virtual Network (VNet) support with Power Platform. We discussed the security benefits of using VNet, such as protecting sensitive data from unauthorized access and ensuring secure communication between Power Platform services and private resources. We also covered best practices for securing outbound connections, including restricting outbound traffic, using private endpoints, implementing subnet delegation, monitoring and auditing traffic, and applying security policies. 

Additionally, we also looked at common use cases and scenarios where VNet support can enhance security and connectivity for different organizations, such as financial institutions, healthcare providers, retail companies, and government agencies. 

### Final thoughts on the importance of VNet support for Power Platform 

VNet support for Power Platform is a crucial feature that enables organizations to enhance their network security, optimize connectivity, and ensure compliance with regulatory requirements. By leveraging VNet support, organizations can securely connect Power Platform services to their private data sources, eliminating the risks associated with exposing these sources to the public internet. This not only protects sensitive data but also improves security posture of Power Platform applications. 

In conclusion, integrating VNet support with Power Platform provides a comprehensive solution for organizations looking to enhance their digital infrastructure. It offers a secure, reliable, and efficient way to manage data and resources, ensuring that Power Platform applications can meet the demands of modern business environments. 

## Related content

- [Virtual Network support overview](vnet-support-overview.md)
- [Set up Virtual Network support for Power Platform](vnet-support-setup-configure.md)
- [What is subnet delegation in Azure virtual network?](/azure/virtual-network/subnet-delegation-overview)
- [Understanding Azure Network Pricing](https://azurenavigator.com/understanding-azure-network-pricing/)




