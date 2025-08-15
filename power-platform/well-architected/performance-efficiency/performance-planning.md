---
title: Performance planning recommendation for Power Platform workloads
description: Learn how to conduct performance and capacity planning in your Power Platform workload.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for performance planning

**Applies to this Power Platform Well-Architected Performance Efficiency checklist recommendation:**

|[PE:02](checklist.md)|**Conduct performance planning. Performance planning should be done before there are predicted changes in usage patterns. Predicted changes include seasonal variations, product updates, marketing campaigns, special events, or regulatory changes.**|
|---|---|

This guide describes the recommendations for performance and capacity planning. Performance isn't something that just happens&mdash;you need to plan for it just like any other requirement. Capacity planning refers to the process of determining the resources required to meet workload performance targets. It involves estimating the amount of resources needed to support the workload's performance requirements, such as storage, throughput, and network bandwidth. Capacity planning ensures the workload has sufficient resources to handle the expected workload demands without experiencing performance degradation or bottlenecks. It also helps prevent over-provisioning and unnecessary costs. A lack of performance and capacity planning can lead to performance issues, resource bottlenecks, increased costs, inefficient allocation, scalability challenges, and unpredictable workload performance.

**Definitions**

| Term | Definition |
|---|---|
| Capacity planning | The process of predicting the resources a workload needs to meet its performance targets. |
| Functional requirements | The features and capabilities a workload must have to fulfill its intended purpose. |
| Technical requirements | The code and infrastructure needed to meet functional requirements. |
| Trend analysis | Historical data analysis to forecast future demand. |

## Key design strategies

Capacity planning is a forward-looking process that involves making decisions based on anticipated workload demands and patterns. Its goal is to optimize workload performance across both continuous and peak load scenarios. By understanding changes in usage, such as seasonal shifts or product releases, you can allocate resources strategically, preventing system strain during high demand periods. This proactive strategy reduces disruptions and bolsters performance efficiency. By analyzing past usage trends and growth data, you can forecast short and long-term needs. You can pinpoint potential bottlenecks and scaling issues, ensuring consistent and efficient workload performance.

### Plan for performance

Design your workload with performance in mind to minimize refactoring after your workload is running. Consider your workload requirements when it comes to performance. Performance considerations affect many aspects of your workload:

- _Data strategy_: Do you have existing data and data stores that you need to connect to? How much data do you need to store? Will the data volume affect how fast users can access it? How will users access the data?

- _Integration strategy_: Can you do real-time integrations without slowing down the system? Can you do batch integrations within a certain time? Where is your data? Do you need an on-premises data gateway strategy?

- _Conversation volumes_: When building an agent, it's important to understand the target volume of messages or conversations and their expected growth. Do your expectations validate the target architecture? What about scale?

- _Data modeling_: Do you need to simplify your data structure for faster queries?

- _Security modeling_: Will your security rules work well with a lot of users and data? Are there any bottlenecks?

- _Environment strategy_: Do you have a test environment for performance testing? Is it similar to the production environment? Have you budgeted for performance testing?

- _Development_: Are the developers following performance best practices? Are they meeting specific performance goals? Do users know what's possible and what's not?

- _Testing design and approach_: How do you measure performance? What's good enough and what's not? Are you testing with realistic scenarios and data? Are you testing for current and future needs?

- _User acceptance and adoption_: How do you track performance? Are users' expectations realistic?

#### Plan your resources

Performance needs time, money, effort, and people. Allocate resources wisely from the beginning of your project. For example, developers might need extra time to find efficient ways to implement business logic and optimize code. You'll also need a testing environment and a team to conduct performance testing.

Performance is not a one-time activity. As your workload usage changes and the platform evolves, you need to revisit the code and continue to find ways to optimize performance.

#### Plan data migrations and integrations

When migrating data from a prior system, plan the migration carefully. Here are some tips to help you avoid problems:

- Understand the business requirements for the data you're migrating. Don't migrate more data than users need. For example, you probably don't need to import 10 years of old leads into your sales system.

- Consider when and how often your integrations run. Avoid running resource-intensive processes when users are interacting with the system. Schedule heavy processes for off-peak hours or use asynchronous processing.

- Be aware of platform limitations and best practices when you design your integrations. 

### Gather performance data

Gathering workload utilization data entails collecting and analyzing information on how a workload uses resources and how it performs. You should collect data on historical patterns for existing workloads and predictive measures for new workloads. This process helps translate business objectives into technical requirements and is essential for forecasting capacity. Consider the following recommendations.

#### Understand an existing workload

Understanding an existing workload for capacity planning involves analyzing historical data related to how the workload utilizes resources. It encompasses metrics like resource utilization, performance data, and workload patterns. This understanding ensures efficient resource allocation, translates business goals into technical requirements, and helps identify potential bottlenecks.

- _Understand the data_: Review the available historical data and understand its structure, format, and relevance to capacity planning. The review might include resource utilization metrics, workload patterns, performance metrics, and other relevant data points. Understand the business processes and the criticality of the applications. Identify the peak usage times, user load, transaction rates, and other relevant metrics.

- _Clean and pre-process the data_: Prepare the data for analysis by removing any inconsistencies, errors, or outliers. Preparing the data might involve data cleaning techniques like data imputation, the handling of missing values, or normalization.

- _Identify key metrics_: Identify the metrics that are relevant for capacity planning. Metrics can include transaction volume, network throughput, and response times.

- _Identify_ _bottlenecks_: Measure throughput and response times to identify the specific components of your system that might become bottlenecks as the workload grows. Use process mining analysis capabilities like rework and root cause analysis to identify bottlenecks in the end-to-end process.  

- _Visualize the_ _data_: Create visualizations, like charts or plots, to gain better insights into historical data. Visualizations can help you identify patterns, trends, and anomalies in data to give you a clearer understanding of workload behavior. Use process mining tools to visualize the data with a process map, enabling a deep analysis of the process.

#### Understand a new workload

Understanding a new workload for capacity planning refers to predicting the resource requirements of a future task without historical data. Predicting the future needs of a new workload without historical data can be challenging. This process ensures you allocate resources efficiently and align allocations with workload objectives when the workload is introduced. 

Consider the following recommendations:

- _User_ _research_: Conducting user research to understand how users handle the current workload can provide valuable insights into the potential demand for a new workload. The research can involve user interviews, surveys, or observing a user performing the existing workload.

- _Expert judgment_: Input from subject matter experts or professionals who have experience in the industry can help you estimate the demand for a new workload. Their expertise and insights can provide valuable inputs for forecasting.

- _Pilot projects or prototypes_: Small-scale pilot projects or prototypes can help you gather real-time data and feedback. You can then use this data to inform the capacity planning process and adjust the forecasted demand.

- _External data sources_: External data sources like industry reports, market studies, or customer surveys can provide additional information for estimating demand for a new workload. These sources can offer valuable insights into customer preferences, market trends, and potential demand drivers.

### Forecast demand

Forecasting demand involves using workload data to predict future needs for a service or product. It's essential for capacity planning to ensure efficient resource allocation, anticipate growth patterns, and prepare for potential surges in demand. When you forecast future demand, you use data to get a sense of future needs. You apply statistical analysis, trend analysis, or predictive modeling techniques to the data you have to forecast future demand. These methods take into account historical or anticipated patterns and project them into the future to provide estimates of the expected workload demand. To forecast demand, consider the strategies that follow.

#### Account for various scenarios

As part of performance planning, you need to plan for different scenarios that might occur. This planning should include both predictable growth patterns and unexpected surges in demand. Usage patterns can grow or shrink. They can be organic (more or less users) or inorganic (an event or security incident). You need to conduct planning before usage changes, at key times:

- Design (prediction)
- Regular spikes (8:00 AM sign-in rush)
- Launch (prediction validation)
- Business model change
- Acquisition or merger
- Marketing push
- Seasonal change
- Feature launch
- Periodically

#### Use prediction techniques

Forecasting future demand for a service or product involves using techniques like statistical analysis, trend analysis, and predictive modeling. 

Here's an overview of how you can use these techniques:

- _Statistical analysis_: Statistical methods can help uncover patterns and relationships within historical data. You can use these patterns to forecast future demand. You can use techniques like time series analysis, regression analysis, and moving averages to identify trends, seasonality, and other patterns in the data.

- _Trend analysis_: Trend analysis involves examining historical data to identify consistent patterns and extrapolating those patterns into the future. For example, if workload demand increased by 10 percent during the past year, you might forecast a continuation of this trend. When you analyze historical demand data over a period of time, you can identify growth or reduction trends. Use these trends as a basis for forecasting future demand. Trend analysis can also identify the effects of one-time events that cause rapid shifts in traffic (inorganic). For example, feature releases might consistently increase demand by 5 percent. If you have four major releases a year, you should plan for 5 percent growth each time.

- _Predictive modeling_: Predictive modeling is the process of building mathematical models that use historical data and other relevant variables to make predictions about future demand. You can use techniques like machine learning algorithms, neural networks, or decision trees. These models can take into account multiple factors and variables to provide more accurate forecasts.

### Align forecasts with workload objectives

Aligning forecasts with workload objectives involves adjusting predictive capacity models to ensure they meet the specific goals and demands of a given workload. This alignment ensures resources are adequately provisioned, preventing both under-utilization and potential workload overloads. For example, if you aim to support an integration with 1 million updates nightly, but current data shows slow update speeds, you need to adjust your system. It's essential to talk with stakeholders to grasp the workload's requirements. Make sure your plans align with the promises (SLAs) of your service providers. This alignment ensures your capacity meets the expected demand and helps pinpoint areas of the system that might need changes.

#### Determine resource requirements

A workload can have many resources, so there's no one metric to observe to determine resource requirements. You need to measure capacity at the resource level to get meaningful results. Estimate the expected demand for your resources based on historical data, market trends, and business projections. Consider the number of transactions, concurrent users, or any other relevant metrics.

Based on the forecasted demand, calculate the resources needed to meet that demand. Consider factors such as API request capacity, network bandwidth, storage capacity, and personnel:

- _Network bandwidth_: Evaluate the network bandwidth that you need to support the anticipated level of traffic. You should include both inbound and outbound data transfer rates to ensure smooth and efficient communication between servers and clients.

- _Storage capacity_: Estimate the amount of data that the workload generates or processes during the forecasted demand. Consider factors like database size, file storage requirements, and any other data storage needs that are specific to your application.

- _API Requests_: Evaluate your API request consumption against your available capacity and the service protection limits. Consider factors like initial load of data and potential spikes in usage.

- _Personnel_: Assess the human resources required to manage and maintain the infrastructure, handle customer support, perform system maintenance, and ensure smooth operations. Consider factors like workload distribution, skill set, and required expertise.

#### Understand resource limitations

Resources in your workload have performance limitations. Performance limitations apply to features within each service. You need to understand the limitations of the resources in your workload and factor those limitations into your design decisions. For example, you should know whether resource limitations require you to change the design approach or to change resources altogether.

You also need to determine reachable limits, which involves identifying the maximum thresholds or boundaries of a workload. These limits usually apply to infrastructure (compute, storage, network), application (concurrent connections, response times, availability), and service (requests per second). When capacity planning identifies reachable limits, you need to modify the workload before the limit creates a performance problem. Performance baselines, continuous monitoring, and testing are essential to validating the limits and the solution.

> :::image type="icon" source="../_images/trade-off.svg":::  **Tradeoff**: Misjudged capacity planning can lead to over-provisioning or under-provisioning of resources. Over-provisioning can lead to higher costs. Under-provisioning can result in poor performance. You may also encounter a higher rate of false positive alerts that can lead to wasted time investigating performance problems that don't exist. Try to find the right balance.

## Power Platform facilitation

**Gathering capacity data and forecasting demand**: [Azure Monitor](/azure/azure-monitor/overview) enables you to collect and analyze telemetry data from your applications and infrastructure. It supports the monitoring of various Azure resources, including virtual machines, containers, and storage accounts. Key tools include [Application Insights](/azure/azure-monitor/app/app-insights-overview) and [Log Analytics](/azure/azure-monitor/logs/log-analytics-overview). By configuring data collection and defining metrics and logs that you want to monitor, you can gather valuable workload data for analysis. For [network monitoring](/azure/networking/fundamentals/networking-overview), combine Azure Monitor with Azure Network Watcher, Azure Monitor network insights, and Azure ExpressRoute monitoring.

Azure Monitor allows you to analyze historical data and apply forecasting techniques to predict future workload trends and capacity requirements. You can generate forecasts that can help you with capacity planning. These forecasts help estimate server capacity, network bandwidth, storage capacity, and other resource needs by using predicted demand patterns.

**Determining resource requirements**: Because they provide a wide range of configurations, Azure tools and services can help you define technical requirements. You can align your workload requirements with available Azure resources, ensuring that you select the appropriate components and settings to meet your functional needs.

**Understanding resource limitations**: Power Platform provides documentation and resources to help you understand the performance limitations of each of the different services. Taking into consideration these limitations can help you make informed design decisions and optimize your workload architecture for performance and cost-effectiveness.

There are scaling limits within your configuration and services that you should be aware of. You can read the documentation or run tests. For more information, see:

- [Power Platform request limits and allocations](/power-platform/admin/api-request-limits-allocations)
- [Service protection API limits](/power-apps/developer/data-platform/api-limits?tabs=sdk)
- [Limits of automated, scheduled, and instant Power Automate flows](/power-automate/limits-and-config)
- [Quotas and limits for Copilot Studio](/microsoft-copilot-studio/requirements-quotas)

**Using data calls from canvas apps**: Data call flows from canvas apps send data to tabular data sources by using connectors over the OData protocol. OData requests flow to back-end layers to reach out to the target data source and retrieve data for the client, or commit data to the data source. Action-based connectors that enable APIs work in the same way.

Understanding how OData and API requests travel in canvas apps can help you to optimize your canvas app performance and your back-end data sources. To learn more, see [Data call flow in canvas apps](/power-apps/maker/canvas-apps/execution-phases-data-flow#data-call-flow-in-canvas-apps).

## Related information

- [Manage solution performance](/power-platform/architecture/key-concepts/performance/)
- [Azure Monitor](/azure/azure-monitor/overview)
- [Application Insights](/azure/azure-monitor/app/app-insights-overview)
- [Log Analytics](/azure/azure-monitor/logs/log-analytics-overview)
- [Process mining and task mining in Power Automate](/power-automate/process-advisor-overview)

## Performance Efficiency checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Performance Efficiency checklist](checklist.md)
