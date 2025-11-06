---
title: Global Secure Access for Copilot Studio agents (preview)
description: Learn how to configure the Secure Web and AI Gateway for Microsoft Copilot Studio agents to enforce network security controls.
ms.date: 11/05/2025
ms.topic: how-to
author: fgomulka
ms.author: frankgomulka
ms.reviewer: ellenwehrle
ms.custom:
  - template-overview
  - bap-template
contributors:
  - fgomulka
---

# Secure Web and AI Gateway for agents (Preview)

As organizations integrate autonomous and interactive AI agents to perform tasks previously handled by humans, administrators may notice a reduction in visibility and control compared to the traditional user network security policy and management experience.

With Global Secure Access (GSA) for Agents, you can now regulate how these agents use knowledge, tools, and actions to access other resources in a way that's quite like how you regulate users.

<!--# TODO :::image type="content" source="media/secure-web-ai-gateway-agents-diagram.png" alt-text="Diagram illustrating the Secure Web and AI Gateway feature for agents.":::-->

## Key benefits

Implementing Secure Web and AI Gateway for Microsoft Copilot Studio agents offers several key benefits:

- **Enhanced visibility and control**: Gain the same level of network security oversight for AI agents as you have for human users.
- **Consistent security policies**: Apply existing web content filtering, threat intelligence filtering, network file filtering, and more to agent traffic.
- **Threat protection**: Protect against malicious agent behavior and ensure secure communication between agents and external resources.

## How Secure Web and AI Gateway for Copilot Studio agents works

To enforce consistent network security controls on Copilot Studio agents, you should forward traffic from the agents to Global Secure Access's globally distributed proxy service. You can enable forwarding of agent traffic in the Power Platform Admin Center on a per-Environment or per-Environment Group basis, and it applies to all kinds of agent traffic, including traffic from HTTP Node and Tools generated connectors, including custom connectors, the Model Context Protocol (MCP) Server Connector, and a full list of [supported connectors](#supported-connectors)

Once traffic from the agent is forwarded to GSA, you can enforce the same security controls you use on users to agents, including web content filtering, threat intelligence filtering, network file filtering, and more.

When an agent makes a request to external resources, the request is evaluated in real time against the security policies configured for the Global Secure Access service. If the request complies with the configured policies, it's allowed. If the request violates any security policy, the Global Secure Access service denies the request with appropriate logging for audit and monitoring purposes.

## Prerequisites

Before you get started, make sure you meet these prerequisites:

- Administrators who interact with **Global Secure Access** features must have one or more of the following role assignments depending on the tasks they're performing:
  - The [Global Secure Access Administrator role](/azure/active-directory/roles/permissions-reference) role to manage the Global Secure Access features.
  - The [Power Platform Administrator](/power-platform/admin/use-service-admin-role-manage-tenant.md) role to manage Copilot Studio environments.
- Create a Power Platform environment, ensuring a Dataverse is added to the environment.

## High-level steps

There are several steps to configuring network controls for Copilot Studio agents:

1. [Enable Network Controls for Copilot Studio agents in Power Platform environment settings](#enable-network-controls-for-copilot-studio-agents)
2. [Create security policies for Copilot Studio traffic](#next-steps)

## Enable network controls for Copilot Studio agents

### Enable using Power Platform admin center

The first step is to enable traffic forwarding from Copilot Studio Agents in the Power Platform Admin Center.

1. Browse to the **Power Platform Admin Center**
1. Navigate to **Security** > **Identity & access** > **Global Secure Access for Agents**
1. Select the appropriate Environment or Environment Group and Select **Set up**.
1. **Enable** Global Secure Access for Agents for the selection.

### Enable network controls at an environment group-level

To configure Global Secure Access settings at the environment group-level, complete these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Identity and access**.
1. Select **Global Secure Access for Agents**.
1. In the pane that is displayed, select the **Environment groups** tab to which you want the security setting applied. Then select **Set up Global Secure Access**.
1. In the **Set up Global Secure Access** pane, select **Global Secure Access for Agents** to **On**.
1. Select **Save**.

> [!NOTE]
> Selected settings are applied to all the environments in that environment group.

## Known limitations

- Only support baseline profile for enforcement, so network security policies are per-tenant.
- Third-party DLP and ATP integrations with Global Secure Access, like Netskope, aren't supported.
- Copilot Studio Bing search network transactions not supported.
- Limited connector support (see supported connectors list for details).

## Supported connectors

## Next steps

[Configure security controls in the Global Secure Access portal](/entra/global-secure-access/how-to-secure-web-ai-gateway-agents).
