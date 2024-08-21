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

Integration patterns in Copilot Studio are not exclusive and can be combined to suit different use cases. Here are some key considerations:

1. **Endpoint Performance**: The speed of your integration is limited by the performance of the endpoints you connect to. In a conversational experience, it's crucial to optimize queries to ensure quick responses. For more details, refer to the [Optimize Data Performance](../performance-efficiency/optimize-data-performance.md) guide.

2. **Handling Logic**: If Power Automate or Copilot Studio cannot execute your logic quickly enough, or if the logic is better suited to code, consider moving it to Dataverse custom APIs, Dataverse low-code plug-ins (both with a 2-minute timeout limit), or Azure Functions. These can be invoked via connectors or HTTP requests, providing more flexibility and efficiency.

3. **Middle Layer Integration**: Implementing data integration in a middle layer can be beneficial. This approach allows you to modify messages as they are relayed, such as performing data enrichment or data masking before they reach Copilot Studio. This can enhance data security and ensure that only relevant information is processed.

| | Power Automate cloud flows | HTTP requests and connectors | Bot Framework Skills
| --- | --- | --- | --- |
| **Pro** | No-code / low-code.<br>Clear separation of integration and conversational logic.<br>Can be monitored separately.<br>Existing cloud flows can be updated to integrate with Copilot Studio. | No-code / low-code.<br>Synchronous.<br>Can be monitored as part of Copilot Studio App Insights integration.<br>Can leverage variables, including environment variables and secrets.<br>Variables, conditions, parameters, etc. can use Power Fx formulas.<br>Parsing and error handling support. | Synchronous execution.<br>Support for private endpoints.<br>Existing Bot Framework investments can be reused. |
| **Con** | Asynchronous execution can cause latency and slowness (both to invoke or to run complex flows).<br>If scale/performance are a concern, the higher-tier “Power Automate Process” plan can be evaluated.<br>“Power Automate Process” required for service principal ownership.<br>Need to return results within 100s. | Mixing conversational logic and integration logic, but integration topics can be isolated, as they can be configured for inputs and outputs.<br>Need to return results within 100s. | Pro-code (e.g., C#)<br>Runs in the Azure AI Bot Service.<br>Additional costs need to be covered by an Azure subscription.<br>ALM differs from Power Platform. |

## Power Automate and HTTP/Connector integrations

When integrating Power Automate and HTTP/connectors with Copilot Studio for an intelligent application workload, several key considerations are essential. Power Automate offers extensive integration capabilities with over 1,000 native connectors and options to create custom connectors to your APIs. For a good end-user experience, ensure that cloud flows triggered from Copilot Studio execute quickly, as they have a maximum of 100 seconds to return a response before timing out. To optimize performance, consider making HTTP requests or using connectors directly from Copilot Studio, bypassing cloud flows when possible. Optimize your cloud flows and HTTP/connector requests by filtering results to only return necessary data. Additionally, handle cloud flow timeouts by implementing parallel branches that return results within the 100-second limit, ensuring a graceful handling of timeouts on the copilot side. These strategies will help maintain efficient and responsive interactions in your intelligent application workload.

## See also

- [Call a cloud flow as an action](/microsoft-copilot-studio/advanced-use-flow)
- [Perform HTTP requests](/microsoft-copilot-studio/authoring-http-node)
- [Use connectors](/microsoft-copilot-studio/advanced-connectors)
- [Use plugin actions](/microsoft-copilot-studio/advanced-plugin-actions)
- [Use Bot Framework skills](/microsoft-copilot-studio/advanced-use-skills)
- [Dataverse custom APIs](/power-apps/developer/data-platform/custom-api)
- [Dataverse low-code plug-ins](/power-apps/maker/data-platform/low-code-plug-ins?tabs=instant)
- [Azure functions](/azure/azure-functions/)
