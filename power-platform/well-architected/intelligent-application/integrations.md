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

Copilot Studio integration patterns are not exclusive and can be combined. For each integration use case, consider the best integration option. 

- Integration can only be as fast as the endpoints you connect to. In a conversational experience, queries should always be optimized. Learn more: [Optimize data performance](../performance-efficiency/optimize-data-performance.md)
- If Power Automate or Copilot Studio don’t run your logic fast enough, or if logic is better handled in code, consider moving it to Dataverse custom APIs or Dataverse low-code plug-ins – both have 2-min timeout limit – or Azure functions. These can be invoked by connectors or HTTP.
- Alternatively, doing the data integration in a middle layer gives you an opportunity to effectively modify messages as they are relayed (for example for data enrichment, data masking before they get to Copilot Studio, etc.).

| | Power Automate cloud flows | HTTP requests and connectors | Bot Framework Skills
| --- | --- | --- | --- |
| **Pro** | No-code / low-code.<br>Clear separation of integration and conversational logic.<br>Can be monitored separately.<br>Existing cloud flows can be updated to integrate with Copilot Studio. | No-code / low-code.<br>Synchronous.<br>Can be monitored as part of Copilot Studio App Insights integration.<br>Can leverage variables, including environment variables and secrets.<br>Variables, conditions, parameters, etc. can use Power Fx formulas.<br>Parsing and error handling support. | Synchronous execution.<br>Support for private endpoints.<br>Existing Bot Framework investments can be reused. |
| **Con** | Asynchronous execution can cause latency and slowness (both to invoke or to run complex flows).<br>If scale/performance are a concern, the higher-tier “Power Automate Process” plan can be evaluated.<br>“Power Automate Process” required for service principal ownership.<br>Need to return results within 100s. | Mixing conversational logic and integration logic, but integration topics can be isolated, as they can be configured for inputs and outputs.<br>Need to return results within 100s. | Pro-code (e.g., C#)<br>Runs in the Azure AI Bot Service.<br>Additional costs need to be covered by an Azure subscription.<br>ALM differs from Power Platform. |

## Power Automate and HTTP/Connector integrations

Power Automate offers great integration capabilities, with more 1,000 native connectors or ways to create your own custom connectors to your APIs.

For a good end-user experience, cloud flows triggered from Copilot Studio must execute quickly so that the user doesn’t have to wait too long for the copilot to answer.

Cloud flows triggered from Copilot Studio have a maximum of 100 seconds to return to Copilot Studio before they time out.

You can make HTTP requests or use connectors directly from Copilot Studio, to avoid invoking cloud flows and optimize performance.

Consider how you will optimize your cloud flows and HTTP/Connector requests to make sure they run as fast as possible - for example, when connecting to the target system, filter the results and only returns the columns that will be used. Consider how you will handle cloud flow timeouts and limits - for example, by adding a parallel branch that returns a result to Copilot Studio within 100s, you can more gracefully handle the timeout on the copilot side.

## See also

- [Call a cloud flow as an action](/microsoft-copilot-studio/advanced-use-flow)
- [Perform HTTP requests](/microsoft-copilot-studio/authoring-http-node)
- [Use connectors](/microsoft-copilot-studio/advanced-connectors)
- [Use plugin actions](/microsoft-copilot-studio/advanced-plugin-actions)
- [Use Bot Framework skills](/microsoft-copilot-studio/advanced-use-skills)
- [Dataverse custom APIs](/power-apps/developer/data-platform/custom-api)
- [Dataverse low-code plug-ins](/power-apps/maker/data-platform/low-code-plug-ins?tabs=instant)
- [Azure functions](/azure/azure-functions/)
