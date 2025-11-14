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

# Configure the Secure Web and AI Gateway for agents (Preview)

As organizations integrate autonomous and interactive AI agents to perform tasks previously handled by humans, administrators may notice a reduction in visibility and control compared to the traditional user network security policy and management experience.

With Global Secure Access (GSA) for Agents, you can now regulate how these agents use knowledge, tools, and actions to access other resources in a way that's similar to how you regulate users.

:::image type="content" source="media/agent-traffic-flow.png" alt-text="Diagram showing agent traffic flowing through Global Secure Access to protected resources.":::

## Key benefits

After you forward agent traffic to Global Secure Access, you can apply the following security controls:

- **Web content filtering**: Control access to web content based on categories and URLs.
- **Threat intelligence filtering**: Block access to known malicious sites and services.
- **Network file filtering**: Control file uploads and downloads.

You configure security policies for agents by using the baseline profile in Global Secure Access. The baseline profile applies security policies at the tenant level, ensuring consistent security controls across all agent traffic.

## How Secure Web and AI Gateway for Copilot Studio agents works

To enforce consistent network security controls on Copilot Studio Agents, forward traffic from the agents to Global Secure Access's globally distributed proxy service. You can enable forwarding of agent traffic in the Power Platform Admin Center on a per-Environment or per-Environment Group basis. Forwarding applies to all kinds of agent traffic, including traffic from HTTP Node and Tools generated connectors, including custom connectors, the custom Model Context Protocol (MCP) server connector, and a full list of [supported connectors](#supported-connectors).

Once you forward traffic from the agent to GSA, you can enforce the same security controls you use on users to agents, including web content filtering, threat intelligence filtering, network file filtering, and more.

When an agent makes a request to external resources, the Global Secure Access service evaluates the request in real time against the security policies you configured. If the request complies with the configured policies, the service allows it. If the request violates any security policy, the Global Secure Access service denies the request with appropriate logging for audit and monitoring purposes.

## Prerequisites

- Administrators who interact with **Global Secure Access** features must have one or more of the following role assignments depending on the tasks they're performing:
  - The [Global Secure Access Administrator role](/azure/active-directory/roles/permissions-reference) role to manage the Global Secure Access features.
  - The [Power Platform Administrator](../use-service-admin-role-manage-tenant.md) role to manage Copilot Studio environments.
- Create a Power Platform environment with Dataverse added to it.

## High-level steps

Configuring network controls for Copilot Studio agents involves several steps:

1. [Enable Network Controls for Copilot Studio Agents in Power Platform environment settings](#enable-network-controls-for-copilot-studio-agents)
1. [Create security policies for Copilot Studio traffic](#next-steps)

## Enable network controls for Copilot Studio Agents

The first step is to enable traffic forwarding from Copilot Studio Agents in the Power Platform Admin Center.

### Enable using Power Platform admin center

1. Browse to the **Power Platform Admin Center**.
1. Navigate to **Security** > **Identity & access** > **Global Secure Access for Agents**.
1. Select the appropriate Environment or Environment Group and select **Set up**.
1. **Enable** Global Secure Access for Agents for the selection.

### Enable network controls at the environment group level

To configure Global Secure Access settings at the environment group-level, complete the following steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Identity and access**.
1. Select **Global Secure Access for Agents**.
1. In the pane that is displayed, select the **Environment groups** tab or the **Environments** tab to which you want the security setting applied, then select **Set up Global Secure Access**.
1. In the **Set up Global Secure Access** pane, select **Global Secure Access for Agents** to **On**.
1. Select **Save**.

> [!NOTE]
> After enabling GSA for Agents for a given environment or environment group, you need to create or update any existing custom connectors for them to route traffic through Global Secure Access.

 ## Next step

[Configure security controls in the Global Secure Access portal](/entra/global-secure-access/how-to-secure-web-ai-gateway-agents)

## Known limitations

- Currently the agent name returned in the Global Secure Access traffic logs is the agent's unique `schema name`.
- Currently the block experience for Copilot Studio agents blocked by GSA shows a `502 Bad Gateway` for HTTP Actions or a `403 Forbidden` for connectors. This experience is a known issue, and improvements are coming soon.
- Currently only the baseline profile is supported for enforcement, so network security policies are per-tenant.
- GSA partner ecosystem integrations, for example, third-party Data Loss Prevention (DLP), aren't supported.
- Copilot Studio Bing search network transactions not supported.
- Limited connector support (see [supported connectors](#supported-connectors) for details).

## Supported connectors

The following connectors currently support secure web and AI gateway Copilot Studio agents:

:::row:::
    :::column:::
    - Amazon S3
    - Approvals
    - ArcGIS
    - Azure AD App Registrations
    - Azure AI Document Intelligence (form recognizer)
    - Azure AI Foundry Agent Service
    - Azure AI Foundry Inference
    - Azure Cognitive Service for Language
    - Azure Communication Services SMS
    - Azure Communication Services SMS Events
    - Azure Data Factory
    - Azure Log Analytics Data Collector
    - Azure Table Storage
    - Azure VM
    - Bitly
    - Blackbaud Altru Constituent
    - Blackbaud RENXT Gifts
    - Blackbaud SKY Add-ins
    - Box MCP Server
    - Cards for Power Apps
    - ClickSend SMS
    - Cloudmersive Document Conversion
    - Computer Vision API
    - Converter by Power2Apps
    - Copilot for Finance
    - Databricks
    - Defender for Cloud Apps
    - Desktop flows
    - Docusign Demo
    - Egnyte
    - Encodian - Convert
    - Encodian - PDF
    - Encodian - Word
    :::column-end:::
    :::column:::
    - Event Hubs
    - Experlogix Smart Flows
    - Formstack Forms
    - Freshdesk
    - Freshservice
    - Google Contacts
    - Google Drive
    - Google Tasks
    - Hash Generator (Independent Publisher)
    - Hashify (Independent Publisher)
    - iAuditor
    - Jira
    - JotForm
    - Jotform Enterprise
    - kintone
    - Luware Nimbus
    - Microsoft 365 message center
    - Microsoft Bookings
    - Microsoft Copilot Studio
    - Microsoft Dataverse
    - Microsoft Defender ATP
    - Microsoft Entra ID
    - Microsoft Forms
    - Microsoft Learn Docs MCP
    - Microsoft Loop
    - Microsoft School Data Sync V2
    - Microsoft Teams
    - Microsoft To-do (Business)
    - Muhimbi PDF
    - NetDocuments
    - Notifications
    :::column-end:::
    :::column:::
    - Office 365 Groups
    - Office 365 Outlook
    - OneDrive
    - OneDrive for Business
    - Outlook Tasks
    - PagerDuty
    - Partner Center Referrals
    - Plumsail Actions
    - Planner
    - Portfolio and Roadmap
    - Power Apps for Admins
    - Power Apps for Makers
    - Power Apps Notification
    - Power Apps Notification V2
    - Power Automate for Admins
    - Power Automate Management
    - Power BI
    - Power Platform for Admins
    - Power Platform for Admins V2
    - Project Online
    - Redmine
    - SendGrid
    - ServiceNow
    - Shifts for Microsoft Teams
    - Slack
    - Smartsheet
    - Stripe
    - Survey123
    - Team Forms
    - Todoist
    - Trello
    - Twilio
    - UiPath Orchestrator
    - Updates App (Microsoft 365)
    - Vena Solutions
    - WordPress
    - YouTube
    :::column-end:::
:::row-end:::

You can find more information about individual connectors at [Connector reference overview](/connectors/connector-reference/).
