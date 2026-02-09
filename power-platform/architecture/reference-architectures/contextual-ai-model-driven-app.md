---
title: Use Copilot Studio agents in model-driven apps
description: Learn how to integrate Microsoft Copilot Studio with Power Apps using Agent APIs in PCF controls to provide users with intelligent, contextual recommendations.
#customer intent: As a Power Apps developer, I want to integrate Copilot Studio Agents into model-driven app forms so that users receive real-time, domain-specific insights.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 01/12/2026
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
---

# Use Copilot Studio agents in model-driven apps

Provide users with real-time, domain-specific AI insights by integrating Microsoft Copilot Studio agents directly into model-driven app forms. This architecture uses Power Apps Component Framework (PCF) controls to invoke Copilot Studio Agent APIs, enabling intelligent decision support for scenarios like clinical assessments, investment recommendations, and contextual guidance.

> [!TIP]
> This article provides an example scenario and visual representation of how to deliver contextual AI insights within model-driven app forms. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/contextual-ai-model-driven-app/model-driven-app-architecture.png" alt-text="Architecture diagram showing how a model‑driven app uses the Copilot Studio Agent API to send context data and receive the agent's response." border="true" lightbox="media/contextual-ai-model-driven-app/model-driven-app-architecture.png":::

## Workflow

This workflow describes how the Power Apps Component Framework (PCF) control integrates with Copilot Studio Agent APIs to deliver intelligent, domain-aware guidance to users directly within model-driven app forms.

1. **User interaction:** A user opens a model-driven app form where a custom PCF control is embedded.

1. **Event triggered:** The PCF control invokes `Xrm.Copilot.executeEvent()` to raise a custom event with a unique event name. The control passes record context and metadata, including the record ID, selected columns, and user and environmental variables.

1. **Agent topic execution:** The event triggers a defined Copilot Studio agent topic with the unique event name. The agent evaluates the context by using domain-specific prompts, logic, and plugins.

1. **AI reasoning:** The agent processes the input and produces structured response recommendations, adaptive cards, summaries, or intelligent insights.

1. **Response returned:** The PCF receives the agent response payload asynchronously.

1. **User review:** The PCF renders the insights within the form UI for review.

1. **Optional action:** The user can apply the recommendation back to Dataverse via the form, such as updating fields or triggering flows.

## Use case details

This architecture supports scenarios where users in a model-driven app form need real-time, domain-specific insights or decision support. Instead of navigating away or manually aggregating data, they receive AI-powered recommendations in context.

### Example use cases

- Healthcare: Clinicians receive patient treatment suggestions based on symptoms, vitals, and medical history.
- Finance: Advisors are presented with investment recommendations aligned with current portfolio and risk appetite.

### Business value

- Speeds up decision-making with embedded AI.
- Keeps users in context&mdash;no switching between apps or dashboards.
- Ensures consistency by applying domain rules through reusable agent topics powered by custom prompts.

## Components

- **Model-driven app**: Hosts the form interface with embedded PCF controls.
- **PCF control**: A custom Power Apps component framework control that invokes Agent APIs.
- **Copilot Studio agent**: Hosts the topics triggered through events.
- **Custom prompts**: Provide domain reasoning, data lookups, scoring logic, and structured recommendations.
- **Dataverse table**: Stores the app data and is optionally updated after insight review.

### Why these components?

- PCF enables deep UI customization and logic injection right inside the model-driven app form.
- Copilot Studio simplifies domain prompt management without redeploying apps and makes use of event parameters received as part of the custom event.
- Agent API allows loose coupling between apps and AI logic.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

- Implement retry and timeout policies around Agent API calls. Surface nonblocking error states in the PCF.
- Provide graceful degradation. If the agent call fails, show cached or rule-based guidance so the form remains usable.
- Use environment variables to disable the AI call if the upstream agent service is degraded.
- Monitor agent invocation success and failure rates through telemetry (App Insights, Dataverse plug-ins, or custom logging) to detect regressions.

### Security

- Enforce least privilege. Send only required fields and user context. Never send full record payloads by default.
- Respect data classification. Exclude or tokenize personal data and protected health information (PHI) unless governance policy permits transmission to Copilot Studio.
- Use environment separation (dev, test, prod) and managed solutions to control where agent topics can be invoked.
- Honor Dataverse security. The PCF should request data through the platform context, so row and column security are respected.
- Ensure agent responses don't auto commit. Users must confirm before data writes occur.

### Operational Excellence

- Source control PCF and agent definitions. Automate build and packaging with pipeline tasks.
- Use solution checker and static analysis to validate components before deployment.

### Performance Efficiency

- Make agent calls asynchronously. Don't block form load. Show loading or progressive disclosure.
- Cache recent responses in-session or states when data hasn't changed to reduce repeated calls.

### Experience Optimization

- Present insights in a compact, scannable format, such as cards, severity badges, and call-to-action buttons.
- Clearly label AI-suggested content and show confidence or rationale when available.
- Provide accept, dismiss, and feedback actions. Never overwrite user-entered data without consent.
- Support accessibility through keyboard navigation, screen reader labels, and high-contrast themes.
- Localize prompts and responses when you expect multilingual user bases.

## Responsible AI

This workload invokes AI agents that use domain prompts and might optionally include generative components. The platform (Copilot Studio and Power Platform) provides baseline governance, but solution owners must add domain‑specific guardrails in custom prompts, data policies, and acceptance flows. The example evaluates user data based on business needs and passes only scoped context.

Custom prompts include guardrails that complement Responsible AI principles. The solution implements these principles:

- **Fairness**: Avoid sensitive demographic attributes in prompts unless explicitly required. Review outputs for unintended bias before enabling writeback.
- **Reliability and safety**: Agent responses never autowrite to Dataverse. The user must review and accept (human in the loop). Add confidence thresholds and fallback messaging for low-quality responses.
- **Privacy and security**: Pass only the minimum record fields needed. Exclude or mask personal data unless data governance approves. Log only telemetry that excludes sensitive payloads.
- **Inclusiveness:** Render results in accessible formats (text and adaptive card semantics). Support screen readers and high‑contrast modes. Provide localization hooks for multilingual deployments.
- **Transparency:** Clearly label insights as AI‑generated. Indicate what data fields you evaluated and which agent or topic produced the recommendation. Provide a "Learn more" link to your organization's AI use policy.
- **Accountability:** Human makes final decisions. No autonomous updates.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Ramakrishnan Raman](https://www.linkedin.com/in/ramakrishnan-raman-49312724/)**,
Senior Software Engineer

## Related resources

- [Power Apps + Copilot Studio: Smart Forms with Agent APIs](https://github.com/Ramakrishnan24689/agent-api-pcf)
- [Add agents to your model-driven app (preview)](/power-apps/maker/model-driven-apps/add-agents-to-app)
- [Create and manage agent topics](/microsoft-copilot-studio/authoring-create-edit-topics?tabs=webApp)
- [Xrm.Copilot (Client API reference) (preview)](/power-apps/developer/model-driven-apps/clientapi/reference/xrm-copilot)
- [Power Apps component framework overview](/power-apps/developer/component-framework/overview)
