---
title: Integration options for intelligent application workloads
description: Explore integration options for Microsoft Copilot Studio like Power Automate, HTTP requests, and Bot Framework skills to automate workflows and enhance the user experience.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/11/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Integration options for intelligent application workloads

Integration options for Microsoft Copilot Studio include Power Automate cloud flows, HTTP requests and connectors, and Bot Framework skills. These integrations enable agents to automate workflows, interact with external services, and enhance conversational capabilities. By using these options, you can streamline processes, improve efficiency, and provide a seamless user experience. Integrations ensure that the agent can perform complex tasks, access necessary data, and respond intelligently to user inputs.

## Key considerations

As you develop your workload and evaluate integration options, consider:

- **Balancing configuration and custom development**: Determine when to use out-of-the-box configurations versus custom development to meet specific organizational needs.
- **Monitoring and auditing**: Understand how to monitor and audit integrations to ensure compliance and performance.
- **Understanding integration options**: Explore the available integration options using connectors and actions in Copilot Studio.

## Integration patterns

Integration patterns in Copilot Studio aren't exclusive and can be combined to suit different use cases.

### Endpoint performance

Endpoint performance is a critical factor that directly impacts the user experience. Consider these key factors and strategies when evaluating endpoints:

- **Speed of integration**: The performance of the endpoints you connect to, such as databases, APIs, and other external services, directly affect the overall speed of your application. Slow endpoints can create bottlenecks, leading to delays in processing and responding to user requests.

- **Conversational experience**: In a conversational interface, users expect quick and seamless interactions. Response delays can interrupt the conversation flow, resulting in a poor user experience and potential frustration.

- **Query performance**: To ensure quick responses, optimize the queries sent to endpoints. Optimizing queries involves:
  - **Efficient data retrieval**: Minimizing the amount of data fetched and ensuring that queries are as efficient as possible.
  - **Caching**: Implementing caching strategies to reduce the load on endpoints and speed up response times.
  - **Load balancing**: Where applicable, distributing requests across multiple endpoints to avoid overloading any single endpoint.
  
  Learn more: [Recommendations for optimizing data performance](../performance-efficiency/optimize-data-performance.md)

- **Scalability and reliability**: High-performing endpoints contribute to the scalability and reliability of your application. As the number of users grows, well-optimized endpoints can handle increased traffic without significant degradation in performance.

- **Monitoring and optimization**: Continuously monitor the performance of your endpoints to identify and address any issues promptly. Use performance metrics and logs to gain insights into bottlenecks and optimize accordingly.

### Handling logic

Ensure that responses are timely and efficient when you're designing logic for your intelligent application workload, especially when integrating with Power Automate. Consider implementing strategies such as:

- **Response time requirement**: Requiring Power Automate to respond to the agent within 100 milliseconds, which necessitates highly optimized and efficient logic.

- **Evaluating execution speed**: If the logic can't be executed quickly enough within Power Automate or Copilot Studio, or if it involves complex operations better suited to code, consider offloading the logic to other services:

  - **[Dataverse custom APIs](/power-apps/developer/data-platform/custom-api),** custom endpoints that can be created within Dataverse to handle specific logic. They have a 2-minute timeout limit, providing more time for complex operations. Custom APIs can be invoked via connectors or HTTP requests, offering flexibility in integration.
  - **[Dataverse low-code plug-ins](/power-apps/maker/data-platform/low-code-plug-ins?tabs=instant),** similar to custom APIs but can be created with minimal coding. They also have a 2-minute timeout limit and can be invoked similarly. 
  - **[Azure Functions](/azure/azure-functions/),** serverless functions that can execute code in response to events. They offer high scalability and can handle complex logic efficiently. Azure Functions can be triggered via HTTP requests, making them easy to integrate with Power Automate and Copilot Studio.

## Middle Layer Integration

Middle Layer Integration is a strategic approach that can significantly enhance the functionality, security, and efficiency of your intelligent application workload.

- **Data enrichment**: Enhance the quality and value of the data before it reaches your workload by integrating external data sources or by applying business logic to add context or additional information to the data. Performing data enrichment can help provide more comprehensive and insightful data for processing, leading to better decision-making and user interactions.

- **Data masking**: Protect sensitive information by obfuscating or anonymizing data. Apply masking techniques to sensitive fields such as personal identifiers, financial information, or proprietary data. Data masking can help enhance data security and privacy, ensuring compliance with regulations like GDPR (General Data Protection Regulation) or HIPAA (Health Insurance Portability and Accountability Act).

- **Message transformation**: Modify the structure or format of messages by using transformation logic to convert data formats, normalize data, or aggregate information. Message transformation can help ensure compatibility and consistency of data, reducing errors and improving processing efficiency.

- **Data validation**: Ensure the integrity and accuracy of data before it's processed by adding validation rules to check for data completeness, correctness, and consistency. Data validation can help prevent errors and ensures that only high-quality data is processed, improving the reliability of the application.

- **Performance optimization**: Improve the speed and efficiency of data processing by using caching, or asynchronous processing, to handle large volumes of data efficiently. This strategy can help reduce latency and ensure timely responses, enhancing the overall user experience.

## Compare integration patterns

Integration patterns aren't exclusive and can be combined. Evaluate the integration options to align with the specific needs and constraints of the intelligent application workload, such as performance requirements, scalability, security, and maintainability. Mitigate risks, optimize resource usage, and ensure a seamless and robust integration by evaluating available integration patterns.

| | Power Automate cloud flows | HTTP requests and connectors | Bot Framework skills
| --- | --- | --- | --- |
| **Pro** | No-code / low-code.<br>Clear separation of integration and conversational logic.<br>Can be monitored separately.<br>Existing cloud flows can be updated to integrate with Copilot Studio. | No-code / low-code.<br>Synchronous.<br>Can be monitored as part of Copilot Studio Application Insights integration.<br>Can use variables, including environment variables and secrets.<br>Variables, conditions, parameters, and so on can use Power Fx formulas.<br>Parsing and error handling support. | Synchronous execution.<br>Support for private endpoints.<br>Existing Bot Framework investments can be reused. |
| **Con** | Asynchronous execution can cause latency and slowness (both to invoke or to run complex flows).<br>If scale/performance is a concern, the higher-tier "Power Automate Process" plan can be evaluated.<br>"Power Automate Process" required for service principal ownership.<br>Need to return results within 100 seconds. | Mixes conversational logic and integration logic, but integration topics can be isolated, as they can be configured for inputs and outputs.<br>Need to return results within 100 seconds. | Pro-code (for example, C#).<br>Runs in the Azure AI Bot Service.<br>Extra costs need to be covered by an Azure subscription.<br>Application lifecycle management differs from Power Platform. |

## Power Automate and HTTP/connector integrations

Power Automate offers extensive integration capabilities with over 1,000 native connectors and options to create custom connectors to your APIs. For a positive user experience, ensure that [cloud flows triggered from Copilot Studio](/microsoft-copilot-studio/advanced-use-flow) execute quickly, as they must return a response within 100 seconds to avoid timing out. 

To optimize performance, consider [making HTTP requests](/microsoft-copilot-studio/authoring-http-node) or [using connectors directly](/microsoft-copilot-studio/advanced-connectors) from Copilot Studio, bypassing cloud flows when possible. Optimize your cloud flows and HTTP/connector requests by filtering results to return only essential data. Additionally, handle cloud flow timeouts by implementing parallel branches that return results within the 100-second limit, ensuring the agent handles timeouts gracefully.

These strategies help maintain efficient and responsive interactions in your intelligent application workload.
