---
title: Select the right services and features recommendation for Power Platform workloads
description: Learn how to select the appropriate services and features that meet the requirements and demands of your Power Platform workload.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for selecting the right services and features

**Applies to this Power Platform Well-Architected Performance Efficiency checklist recommendation:**

|[PE:03](checklist.md)|**Select the right services. The services and features must support your ability to reach the workload's performance targets and accommodate expected capacity changes. The selections should also weigh the benefits of using platform features or building a custom implementation.**|
|---|---|

This guide describes the recommendations for selecting appropriate services for your workload. The following recommendations help you choose services that best meet the requirements and demands of your workload. When you use services that are designed to handle your workload's requirements, you ensure that your workload meets your performance targets. If you choose inappropriate services for your workload, the services might not be capable of handling your workload's demands. Insufficient services can lead to slow response times, bottlenecks, or workload failures.

**Definitions**

| Term | Definition |
|---|---|
| Region | A geographic perimeter that contains a set of datacenters. |
| Resource | A single entity or component that you can create, configure, and utilize within a cloud service provider. |
| Service | A product or offering from a cloud service provider. |
| Storage service | A service that provides storage for objects, blocks, and files. |

## Key design strategies

The services you choose should align with your workload's performance targets and be adaptable to future capacity needs. As the workload expands or evolves, the services you use should match your performance standards without requiring major adjustments. Consider the balance between platform features and custom implementations. Platform features provide immediate solutions, but custom-built options offer precise tailoring. It's common to combine both options in your overall solution, with custom-built options targeted to fill specific gaps in the built-in platform features. Your service selections should be both forward-thinking and tailored to your specific needs, taking into account the trade-offs between convenience and customization.

### Understand workload requirements

Understanding workload requirements refers to grasping the technical and functional demands of a workload. This analysis helps determine the resources, storage, network, and other specifications needed to run the workload. Aligning services with the specific needs of a workload helps prevent over-provisioning or under-utilizing resources.

Evaluate the needs and characteristics of your workload to determine the requirements and align your workload requirements to your performance targets at every tier. You must account for constraints or dependencies. When you understand your workload requirements, you can make informed decisions. You can determine the right infrastructure and implement strategies to handle peak loads or variations in demand.

- _Meet performance targets._ Select services that enable you to meet the performance targets for your workload. Ensure that a service can support the performance needs and that you can monitor its performance. Collect performance data for critical components.

- _Consider organizational restrictions._ Be familiar with restrictions that your organization might have on services that you deploy. Consider these restrictions when you design your solution.

- _Consider compliance and security requirements._ Compliance and security requirements can affect services and configurations that you select. Ensure that a service you choose meets the requirements that are related to storage, encryption, access controls, audit logs, and data locations.

- _Consider team skills._ Your team builds and maintains workloads. Different services require different skills. Choose services that your team knows how to use, or commit to training them before you choose a service. Ensure that team members possess the expertise and knowledge to effectively use services and to optimize their performance.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff:** Power Platform services offer specific functionalities but might limit customization. Workloads that include custom-built components may offer more flexibility, but may require more management and configuration compared to workloads that use only Power Platform services.

### Understand services

Understanding services is about knowing the capabilities, limits, and functionalities of the platform's tools and offerings. An understanding of services helps you use built-in features, reducing the need for complex custom solutions and improving performance efficiency.

Consider various factors and gain a comprehensive understanding of a service before you choose it. Research and assess services and tools that the platform offers. Determine which services and tools best align with your workload requirements. 

### Understand service limits

Service limits are the predefined thresholds or boundaries that services set. Service limits define the maximum usage of resources or capabilities within that service. When you're familiar with service limits, you can avoid issues such as resource contention, performance degradation, or unexpected service interruptions. You can plan and scale your workload appropriately. Your planning takes into account factors such as data volume, processing capacity, and data residency requirements.

### Prefer platform features

Preferring platform features is about using built-in functionalities provided by a platform to handle specific tasks without custom code. The built-in features are designed to handle specific tasks efficiently at scale, and they're regularly maintained. Platform features allow you to better take advantage of cloud infrastructure capabilities because they are abstracted and handled for you. Choose services that allow you to offload functionality to the platform instead of writing and maintaining your own custom code. In many cases, platform-as-a-service (PaaS) solutions provide better performance efficiency than custom code. Custom code adds complexity and makes the workload prone to performance issues. Only develop custom code when service features aren't sufficient.

>:::image type="icon" source="../_images/trade-off.svg":::  **Tradeoff**: The best service for your workload might be a technology that your team isn't skilled at, can't afford, or it might require extra security layers. For example, a Dataverse plugin might fit your performance needs better, but your workload team might only be familiar with Power Automate cloud flows.

### Evaluate infrastructure requirements

The performance efficiency of resources is tied to the infrastructure they reside on. It makes the selection of the right infrastructure critical to service performance efficiency. Evaluating infrastructure requirements involves identifying the geographical region best suited to support your workload. 

Key considerations in this decision-making include:

- _Understand regions._ Every region corresponds to a distinct geographic location. Deploying your solution in the cloud requires selecting a datacenter location, which is where the physical servers and databases for your solution are located. This choice has implications for performance due to latency.

- _Single-region vs. multiple-region deployment model._ A multiple-region deployment can reduce latency to end users. However, it can also increase the cost and complexity of the workload. Consider data usage requirements; for example, a single region might prevent the creation of multiple smaller data silos. Choose the deployment model that best suits your workload needs.

- _Understand available features._ Different regions may offer different features. Understand the features that are available in a region before you select it. Ensure that a region meets your workload performance needs.

- _Consider latency._ Latency, the time data takes to travel from source to destination, increases the further services are from each other. Services communicating across regions can face increased latency. Identifying services that frequently communicate and positioning them within the same region is recommended. Additionally, selecting a region proximate to your primary user base can minimize latency, offering a better user experience. If you have users in different parts of the world, you might need to compromise on latency for some of them. You should analyze your user personas and workloads to find the optimal balance. Choosing a datacenter location is part of your [environment strategy](/power-platform/guidance/adoption/environment-strategy).

### Evaluate networking requirements

Assess your network needs to determine the appropriate workload services and configurations. Ensure that the network can support your workload. 

To evaluate networking requirements, make sure you:

- _Understand network traffic._ Assess the expected network traffic for the workload. Understand the data transfer needs and the frequency of network requests.

- _Understand bandwidth requirements._ Determine the bandwidth requirements for the workload. Consider the amount of data transmitted and received over the network.

- _Understand network latency._ Evaluate the desired latency for the workload. 

- _Understand throughput._ Consider the required throughput for the workload. Throughput refers to the amount of data that can be transmitted over a network during a specified time period. Configure the network routing options to take advantage of network throughput benefits.

- _Understand configurations that impact network traffic and performance._ Firewall settings, on-premises data gateway configurations, and similar can affect network traffic and performance. Understand all components and configurations that can have an impact, and ensure they're configured to support your performance requirements.

### Evaluate compute requirements for custom components

While the platform services manage their own compute requirements, you'll need to evaluate the compute requirements of any custom cloud components you've implemented. Evaluating compute requirements involves assessing the specific compute needs of a workload, including factors such as instance type, scalability, and containerization. Different compute services have varying capabilities and characteristics that can affect the performance of your workload. Select the optimal compute service to ensure that your workload runs efficiently. For more detailed recommendations on evaluating compute requirements for custom components, review [Evaluate compute requirements](/azure/well-architected/performance-efficiency/select-services) in the Azure Well-Architected Framework.

### Evaluate load balancing requirements

While the platform services manage their own load balancing, it's important to evaluate and consider additional load balancing options. The choice should be based on how you use the service features. Load balancing ensures that work is distributed evenly and prevents any single resource from being overwhelmed with requests. Load balancing helps prevent bottlenecks and reduce response times. Evaluate the various load balancing options available with the services included in your solution. Review the documentation and comparison tools to understand the features. 

To select the most suitable load balancing options for your workload, consider: 

- _Robotic Process Automation (RPA) hosts_: Evaluate whether to load balance across multiple RPA hosts to automatically scale workloads and optimize unattended automations.
- _On-premises gateways_: Use load balancing options to avoid single points of failure when accessing on-premises data resources.

### Evaluate database requirements

The database can affect factors such as data storage and retrieval, transaction processing, consistency guarantees, and handling of large or rapidly changing data. Assess the needs and criteria for your database. Select a database system that can meet those requirements. Evaluate the database requirements before you choose a database. 

To evaluate the database requirements and choose the appropriate database, follow these steps:

- _Identify the workload needs._ Understand the specific requirements of your workload, such as data volume, expected transaction rates, concurrency, data types, and expected growth. Evaluate different database systems based on your workload needs. For example, if your workload requires high-performance real-time data processing, you might choose a database system optimized for fast data ingestion and low latency.

- _Consider the data model._ Determine the data model that best suits your workload. Evaluate the database requirements to ensure that the chosen database supports the required data structures, relationships, and integrity constraints. For example, if your data has a highly relational structure, you might opt for a relational database management system (RDBMS) that provides robust support for transactions and referential integrity. The data model might be hierarchical, network, relational, object-oriented, or NoSQL. Assess the complexity of your data model. Ensure that the chosen database supports the required data structures and relationships.

- _Evaluate the capabilities._ Consider factors such as read/write patterns, query complexity, latency requirements, and scalability needs. Evaluate the performance capabilities of different database systems accordingly. Some databases excel in read-heavy workloads, while others are optimized for write-intensive or analytical workloads.

- _Assess the load._ Consider factors such as data volume, transaction rates, read/write ratios, and expected growth. Choose a database that can handle the anticipated workload to ensure smooth operation and prevent performance bottlenecks as your workload is scaled. Consider the scalability requirements of your workload. These requirements include anticipated data growth, concurrent user access, and the need for horizontal or vertical scaling. Evaluate the scalability options and availability features that different database systems provide.

### Evaluate storage requirements

Choose storage services that align with your data access patterns, durability requirements, and performance needs. Most cloud workloads use a combination of storage technologies. This technique is known as the polyglot persistence approach. Determine the appropriate combination of storage services for your workload. You might also want to separate data to avoid contamination. For example, you might have separate storage accounts for monitoring data and business data. Choosing the right mix and correct implementation is important for optimizing application performance.

### Evaluate cache requirements

A cache stores frequently accessed data. Caching reduces data access latency and lowers the load on data storage components. It allows the workload to handle more requests without scaling. It's common to cache workload data and static content. Some platform services automatically cache data to increase performance. Consider adding additional caching to improve performance and reduce your overall API request consumption. 

### Evaluate business logic requirements

Choose how to implement your business logic based on your functional, performance, and reusability requirements. Power Platform offers many options to execute business logic; for example, Power Automate cloud flows, low-code or code-first plugins, and Business Rules. Most workloads will use a combination of different options.

To evaluate how to implement business logic, consider:

- _Team skills_. Your team builds and maintains workloads. Different services require different skills. Choose services that your team knows how to use, or commit to training them before you choose a service. Ensure that team members possess the expertise and knowledge to effectively use the services and to optimize their performance. For example, developing [Dataverse plug-ins](/power-apps/developer/data-platform/plug-ins) will require your workload team to write .NET or [Power Fx code](/power-apps/maker/data-platform/low-code-plug-ins).

- _Logic approach_. Evaluate whether there are steps in the logic that require human interaction—such as through an approval process or a form response—and, if so, determine whether all steps can be executed without human interaction. For example, you might use [Power Automate Approvals](/power-automate/get-started-approvals) if human interaction is required, but choose to use a Dataverse plugin to have the logic run seamlessly as part of the Dataverse data operation when human interaction isn't required.

- _Integration_. Review your architecture diagram and consider which systems your workload needs to integrate with. Evaluate the options for integration and consider the impact on performance and reliability. Real-time integration can provide immediate benefits to users, but it might affect performance and reliability. Using asynchronous approaches like Power Automate, or publishing [Dataverse events](/power-apps/developer/data-platform/business-events#custom-events) to a queue for later processing, can improve performance and reliability. However, these methods don't give users immediate feedback.

- _Complexity_. Consider the complexity of your logic and evaluate whether it can be broken down into separate steps. For example, to use [business rules](/power-apps/maker/data-platform/processes#business-rules) to validate mandatory fields, data formats, and ranges, instead of implementing the logic in a canvas app or custom script. For simple calculations based on existing values, you might use [calculated](/power-apps/maker/data-platform/define-calculated-fields) or [rollup](/power-apps/maker/data-platform/define-rollup-fields) fields, and for more complex calculations use a Dataverse plug-in.  

- _Reusability_. Identify and reuse logic to improve consistency and maintenance. Consider if you need to reuse the business logic from various points of the workload. For example, Dataverse plug-in logic can be called from apps and automations, whereas if you put the business logic in the canvas app, you can’t reuse it.

Remember that the choice depends on your specific requirements, workload complexity, and integration needs. Evaluate each option based on your project goals and organizational context. Consider if using the logic could help more than just a single project. If it can, adjust your approach to provide the most benefits.

### Evaluate responsiveness

Remember that users judge performance by their expectations, not by objective measures. You can improve perceived performance with techniques that don't necessarily speed up processes, but make the user experience smoother. For example, using asynchronous processing doesn't make a task complete faster, but it keeps the user interface responsive, allowing the user to do other things. 

To evaluate responsiveness:

- Consider whether to design for synchronous, asynchronous, or background (batch) processing.
- Consider data growth over time. As more data flows through your system, you might need to tune it to maintain the same response times.
- Consider what data to cache in the page or app versus retrieving it in real time every time the page loads. 

## Power Platform facilitation

**Understanding requirements**: Use [Azure Monitor](/azure/azure-monitor/overview) to collect and analyze data from your workload. Monitor provides insights into the performance and health of your workloads, allowing you to identify and troubleshoot issues.

**Understanding and evaluating services**: Review the platform services to determine if they meet your performance requirements. Power Platform offers several services that accomplish the same outcome. You have the flexibility to align your choice of service to your performance needs, team skill set, and cost requirements.

## Related information

- [Verify network capacity and throughput for clients](/power-platform/admin/verify-network-capacity-throughput-clients)
- [Advanced Monitor concepts](/power-apps/maker/monitor-advanced)
- [Performance considerations for Power Apps](/power-apps/maker/canvas-apps/app-performance-considerations)
- [Understand canvas app execution phases, data call flow, and performance monitoring](/power-apps/maker/canvas-apps/execution-phases-data-flow)
- [Plan, scale, and maintain a business-critical gateway solution](/data-integration/gateway/plan-scale-maintain)
- [Use low-code plugins in Dataverse](/power-apps/maker/data-platform/low-code-plug-ins)
- [Use plug-ins to extend business processes](/power-apps/developer/data-platform/plug-ins)
- [Dataverse formula, calculated, and rollup columns using code](/power-apps/developer/data-platform/calculated-rollup-attributes)
- [Work with formula columns in Dataverse](/power-apps/maker/data-platform/formula-columns)
- [Apply business logic in Microsoft Dataverse](/power-apps/maker/data-platform/processes)
- [Microsoft Dataverse business events](/power-apps/developer/data-platform/business-events)
- [Manage solution performance](/power-platform/architecture/key-concepts/performance/)

## Performance Efficiency checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Performance Efficiency checklist](checklist.md)
