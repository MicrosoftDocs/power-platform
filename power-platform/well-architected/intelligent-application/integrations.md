---
title: Understand integration options for intelligent application workloads
description: Understand integration options for intelligent application workloads TODO
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/12/2024
ms.subservice: well-architected
ms.topic: conceptual
---

# Understand integration options for intelligent application workloads

Integration options for Microsoft Copilot Studio include Power Automate cloud flows, HTTP requests and connectors, and Bot Framework skills. These integrations enable Copilot to automate workflows, interact with external services, and enhance conversational capabilities. By using these options, you can streamline processes, improve efficiency, and provide a seamless user experience. Integrations ensure that Copilot can perform complex tasks, access necessary data, and respond intelligently to user inputs.

## Key considerations

As you develop your workload and evaluate integration options, consider:

- **Balancing configuration vs custom development**: Determine when to use out-of-the-box configuration vs custom development to meet specific organizational needs.
- **Monitoring and auditing**: Understand how to monitor and audit integrations to ensure compliance and performance.
- **Understanding integration options**: Explore the available integration options using connectors and plugin actions in Copilot Studio.

## Integration patterns

Integration patterns in Copilot Studio aren't exclusive and can be combined to suit different use cases. Here are some key considerations:

### Endpoint Performance

Endpoint performance is a critical factor that directly impacts the user experience. Here are the key considerations and strategies when evaluating endpoints:

- **Speed of Integration**: The performance of the endpoints you connect to, for example databases, APIs, and other external services, directly affect the overall speed of your application. Slow endpoints can create bottlenecks, leading to delays in processing and responding to user requests.

- **Conversational Experience**: In a conversational interface users expect quick, and seamless interactions. Delays in responses can disrupt the flow of conversation, leading to a poor user experience and potentially causing frustration.

- **Optimizing Queries**: To ensure quick responses, optimize the queries sent to these endpoints. Optimizing queries involves:
  - **Efficient Data Retrieval**: Minimizing the amount of data fetched and ensuring that queries are as efficient as possible.
  - **Caching**: Implementing caching strategies to reduce the load on endpoints and speed up response times.
  - **Load Balancing**: Where applicable, distributing requests across multiple endpoints can avoid overloading any single endpoint.
  
    Learn more: [Optimized Data Performance](../performance-efficiency/optimize-data-performance.md).

- **Scalability and Reliability**: High-performing endpoints contribute to the scalability and reliability of your application. As the number of users grows, well-optimized endpoints can handle increased traffic without significant degradation in performance.

- **Monitoring and Optimization**: Continuously monitor the performance of your endpoints to identify and address any issues promptly. Use performance metrics and logs to gain insights into bottlenecks and optimize accordingly.

### Handling Logic

Ensure that responses are timely and efficient when you're designing logic for your intelligent application workload, especially when integrating with Power Automate. Here are the key considerations and strategies:

- **Response Time Requirement**: Power Automate needs to respond to Copilot within 100 ms. This requirement necessitates highly optimized and efficient logic.
- **Evaluating Execution Speed**: If the logic can't be executed quickly enough within Power Automate or Copilot Studio, or if it involves complex operations better suited to code, consider offloading this logic to other services.
- **Alternative Solutions**: 
  - **Dataverse Custom APIs** are custom endpoints that can be created within Dataverse to handle specific logic. They have a 2-minute timeout limit, providing more time for more complex operations. Custom APIs can be invoked via connectors or HTTP requests, offering flexibility in integration.
  - **Dataverse Low-Code Plug-ins** are similar to custom APIs but can be created with minimal coding. They also have a 2-minute timeout limit and can be invoked similarly. 
  - **Azure Functions** are serverless functions that can execute code in response to events. They offer high scalability and can handle more complex logic efficiently. Azure Functions can be triggered via HTTP requests, making them easy to integrate with Power Automate and Copilot Studio.

## Middle Layer Integration

Middle Layer Integration is a strategic approach that can significantly enhance the functionality, security, and efficiency of your intelligent application workload. Here are the key considerations:

- **Data Enrichment**: Enhance the quality and value of the data before it reaches your workload by integrating external data sources or applying business logic to add context or additional information to the data. Performing data enrichment can help provide more comprehensive and insightful data for processing, leading to better decision-making and user interactions.

- **Data Masking**: Protect sensitive information by obfuscating or anonymizing data by applying masking techniques to sensitive fields such as personal identifiers, financial information, or proprietary data. Data masking can help enhance data security and privacy, ensuring compliance with regulations like GDPR or HIPAA.

- **Message Transformation**: Modify the structure or format of messages by using transformation logic to convert data formats, normalize data, or aggregate information. Message transformation can help ensure compatibility and consistency of data, reducing errors and improving processing efficiency.

- **Data Validation**: Ensure the integrity and accuracy of data before it's processed by adding validation rules to check for data completeness, correctness, and consistency. Data validation can help prevent errors and ensures that only high-quality data is processed, improving the reliability of the application.

- **Performance Optimization**: Improve the speed and efficiency of data processing by using caching, or asynchronous processing to handle large volumes of data efficiently. This can help reduce latency and ensures timely responses, enhancing the overall user experience.

## Compare integration patterns

Integration patterns aren't exclusive and can be combined. Evaluate the integration options to align with the specific needs and constraints of the intelligent application workload, such as performance requirements, scalability, security, and maintainability. Mitigate risks, optimize resource utilization, and ensure a seamless and robust integration by evaluating available integration patterns.

| | Power Automate cloud flows | HTTP requests and connectors | Bot Framework Skills
| --- | --- | --- | --- |
| **Pro** | No-code / low-code.<br>Clear separation of integration and conversational logic.<br>Can be monitored separately.<br>Existing cloud flows can be updated to integrate with Copilot Studio. | No-code / low-code.<br>Synchronous.<br>Can be monitored as part of Copilot Studio App Insights integration.<br>Can use variables, including environment variables and secrets.<br>Variables, conditions, parameters, etc. can use Power Fx formulas.<br>Parsing and error handling support. | Synchronous execution.<br>Support for private endpoints.<br>Existing Bot Framework investments can be reused. |
| **Con** | Asynchronous execution can cause latency and slowness (both to invoke or to run complex flows).<br>If scale/performance are a concern, the higher-tier “Power Automate Process” plan can be evaluated.<br>“Power Automate Process” required for service principal ownership.<br>Need to return results within 100 s. | Mixing conversational logic and integration logic, but integration topics can be isolated, as they can be configured for inputs and outputs.<br>Need to return results within 100 s. | Pro-code (for example, C#)<br>Runs in the Azure AI Bot Service.<br>Extra costs need to be covered by an Azure subscription.<br>Application Lifecycle Management differs from Power Platform. |

## Power Automate and HTTP/Connector integrations

When integrating Power Automate and HTTP/connectors with Copilot Studio for an intelligent application workload, several key considerations are essential. Power Automate offers extensive integration capabilities with over 1,000 native connectors and options to create custom connectors to your APIs. For a good end-user experience, ensure that cloud flows triggered from Copilot Studio execute quickly, as they have a maximum of 100 seconds to return a response before timing out. To optimize performance, consider making HTTP requests or using connectors directly from Copilot Studio, bypassing cloud flows when possible. Optimize your cloud flows and HTTP/connector requests by filtering results to only return necessary data. Additionally, handle cloud flow timeouts by implementing parallel branches that return results within the 100-second limit, ensuring a graceful handling of timeouts on the copilot side. These strategies help maintain efficient and responsive interactions in your intelligent application workload.

## See also

- [Call a cloud flow as an action](/microsoft-copilot-studio/advanced-use-flow)
- [Perform HTTP requests](/microsoft-copilot-studio/authoring-http-node)
- [Use connectors](/microsoft-copilot-studio/advanced-connectors)
- [Use plugin actions](/microsoft-copilot-studio/advanced-plugin-actions)
- [Use Bot Framework skills](/microsoft-copilot-studio/advanced-use-skills)
- [Dataverse custom APIs](/power-apps/developer/data-platform/custom-api)
- [Dataverse low-code plug-ins](/power-apps/maker/data-platform/low-code-plug-ins?tabs=instant)
- [Azure functions](/azure/azure-functions/)
