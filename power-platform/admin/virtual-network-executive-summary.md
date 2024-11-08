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

If you look at the ownership of Delegated subnet between Microsoft and Customers, following table explains it 
