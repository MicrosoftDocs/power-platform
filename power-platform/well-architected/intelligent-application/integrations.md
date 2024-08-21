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

## Key considerations

- Balancing configuration vs custom development: Determine when to use out-of-the-box configuration vs custom development to meet specific organizational needs.
- Monitoring and auditing: Understand how to monitor and audit integrations to ensure compliance and performance.
- Understanding integration options: Explore the available integration options using connectors and plugin actions in Copilot Studio.

## Integration patterns

Copilot Studio integration patterns are not exclusive and can be combined. 
Integration can only be as fast as the endpoints you connect to. In a conversational experience, queries should always be optimized.
If Power Automate or Copilot Studio don’t run your logic fast enough, or if logic is better handled in code, consider moving it to Dataverse custom APIs or Dataverse low-code plug-ins – both have 2-min timeout limit – or Azure functions. These can be invoked by connectors or HTTP.
Alternatively, in specific scenarios, customers may want to do the data integration in a middle layer, effectively modifying messages as they are relayed (e.g., for data enrichment, data masking before they get to Copilot Studio, etc.).
Use of premium connectors is covered as part of Copilot Studio licensing.

| | Power Automate cloud flows | HTTP requests and connectors | Bot Framework Skills
| --- | --- | --- | --- |
| **Pro** | No-code / low-code.<br>Clear separation of integration and conversational logic.<br>Can be monitored separately.<br>Existing cloud flows can be updated to integrate with Copilot Studio. | No-code / low-code.<br>Synchronous.<br>Can be monitored as part of Copilot Studio App Insights integration.<br>Can leverage variables, including environment variables and secrets.<br>Variables, conditions, parameters, etc. can use Power Fx formulas.<br>Parsing and error handling support. | Synchronous execution.<br>Support for private endpoints.<br>Existing Bot Framework investments can be reused. |
| **Con** | Asynchronous execution can cause latency and slowness (both to invoke or to run complex flows).<br>If scale/performance are a concern, the higher-tier “Power Automate Process” plan can be evaluated.<br>“Power Automate Process” required for service principal ownership.<br>Need to return results within 100s. | Mixing conversational logic and integration logic, but integration topics can be isolated, as they can be configured for inputs and outputs.<br>Need to return results within 100s. | Pro-code (e.g., C#)<br>Runs in the Azure AI Bot Service.<br>Additional costs need to be covered by an Azure subscription.<br>ALM differs from Power Platform. |

## See also

- [Call a cloud flow as an action](/microsoft-copilot-studio/advanced-use-flow)
- [Perform HTTP requests](/microsoft-copilot-studio/authoring-http-node)
- [Use connectors](/microsoft-copilot-studio/advanced-connectors)
- [Use plugin actions](/microsoft-copilot-studio/advanced-plugin-actions)
- [Use Bot Framework skills](/microsoft-copilot-studio/advanced-use-skills)
- [Dataverse custom APIs](/power-apps/developer/data-platform/custom-api)
- [Dataverse low-code plug-ins](/power-apps/maker/data-platform/low-code-plug-ins?tabs=instant)
- [Azure functions](/azure/azure-functions/)
