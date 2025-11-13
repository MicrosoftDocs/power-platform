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

:::image type="content" source="media/agent-traffic-flow.png" alt-text="Diagram showing agent traffic flowing through Global Secure Access to protected resources.":::

## Key benefits

After you forward agent traffic to Global Secure Access, you can apply the following security controls:

- **Web content filtering**: Control access to web content based on categories and URLs.
- **Threat intelligence filtering**: Block access to known malicious sites and services.
- **Network file filtering**: Control file uploads and downloads.

Security policies for agents are configured using the baseline profile in Global Secure Access. The baseline profile applies security policies at the tenant level, ensuring consistent security controls across all agent traffic.

## How Secure Web and AI Gateway for Copilot Studio agents works

To enforce consistent network security controls on Copilot Studio Agents, you should forward traffic from the agents to Global Secure Access's globally distributed proxy service. You can enable forwarding of agent traffic in the Power Platform Admin Center on a per-Environment or per-Environment Group basis, and it applies to all kinds of agent traffic, including traffic from HTTP Node and Tools generated connectors, including custom connectors, the custom Model Context Protocol (MCP) server connector, and a full list of [supported connectors](#supported-connectors)

Once traffic from the agent is forwarded to GSA, you can enforce the same security controls you use on users to agents, including web content filtering, threat intelligence filtering, network file filtering, and more.

When an agent makes a request to external resources, the request is evaluated in real time against the security policies configured for the Global Secure Access service. If the request complies with the configured policies, it is allowed. If the request violates any security policy, the Global Secure Access service denies the request with appropriate logging for audit and monitoring purposes.

## Prerequisites

- Administrators who interact with **Global Secure Access** features must have one or more of the following role assignments depending on the tasks they're performing:
  - The [Global Secure Access Administrator role](/azure/active-directory/roles/permissions-reference) role to manage the Global Secure Access features.
  - The [Power Platform Administrator](../use-service-admin-role-manage-tenant.md) role to manage Copilot Studio environments.
- Create a Power Platform environment with Dataverse added to it.

## High level steps

There are several steps to configuring network controls for Copilot Studio agents:

1. [Enable Network Controls for Copilot Studio Agents in Power Platform environment settings](#enable-network-controls-for-copilot-studio-agents)
2. [Create security policies for Copilot Studio traffic](#next-steps)

## Enable network controls for Copilot Studio Agents

The first step is to enable traffic forwarding from Copilot Studio Agents in the Power Platform Admin Center.

### Enable using Power Platform admin center

1. Browse to the **Power Platform Admin Center**
2. Navigate to **Security** > **Identity & access** > **Global Secure Access for Agents**
3. Select the appropriate Environment or Environment Group and Select **Set up**.
4. **Enable** Global Secure Access for Agents for the selection.

### Enable network controls at an environment group-level

To configure Global Secure Access settings at the environment group-level, complete the following steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. In the navigation pane, select **Security**.
3. In the **Security** pane, select **Identity and access**.
4. Select **Global Secure Access for Agents**.
5. In the pane that is displayed, select the **Environment groups** tab or the **Environments** tab to which you want the security setting applied, then select **Set up Global Secure Access**.
6. In the **Set up Global Secure Access** pane, select **Global Secure Access for Agents** to **On**.
7. Select **Save**.

> [!NOTE]
> After enabling GSA for Agents for a given environment or environment group, you need to create or update any existing custom connectors for them to route traffic through Global Secure Access.

 ## Next steps

[Configure security controls in the Global Secure Access portal](/entra/global-secure-access/how-to-secure-web-ai-gateway-agents)

## Known limitations

- Currently the Agent Name returned in the Global Secure Access traffic logs is the agent's unique `schema name`.
- Currently the block experience for Copilot Studio agents blocked by GSA shows a `502 Bad Gateway` for HTTP Actions or a `403 Forbidden` for connectors. This is a known issue, and improvements are coming soon.
- Currently only the baseline profile is supported for enforcement, so network security policies are per-tenant.
- Third-party DLP and ATP integrations with Global Secure Access, for example, Netskope, aren't supported.
- Copilot Studio Bing search network transactions not supported.
- Limited connector support (see [supported connectors](#supported-connectors) for details).

## Supported connectors

The following connectors are currently supported with secure web and AI gateway Copilot Studio agents:

- Office 365 Groups
- Microsoft Teams
- OneDrive for Business
- Microsoft Dataverse
- Power Apps for Makers
- Azure Cognitive Service for Language
- Microsoft Entra ID
- Microsoft Forms
- Power BI
- Planner
- Approvals
- Notifications
- Power Automate Management
- Microsoft Translator V2
- ServiceNow
- Microsoft To-Do (Business)
- Power Apps Notification
- Power Platform for Admins
- Portfolio and Roadmap
- Desktop flows
- Power Apps for Admins
- Office 365 Outlook
- Power Apps Notification V2
- Power Automate for Admins
- Shifts for Microsoft Teams
- SendGrid
- Project Online
- Outlook Tasks
- Slack
- Power Platform for Admins V2
- Jira
- Azure Table Storage
- Microsoft Copilot Studio
- Smartsheet
- Microsoft Forms
- Google Drive
- OneDrive
- Microsoft 365 message center
- Twilio
- Azure Data Factory
- Microsoft Learn Docs MCP
- Trello
- Microsoft Bookings
- Databricks
- YouTube
- Cloudmersive Document Conversion
- Freshdesk
- Azure VM
- Microsoft Defender ATP
- Docusign Demo
- iAuditor
- Survey123
- Muhimbi PDF
- Azure Log Analytics Data Collector
- Azure AI Document Intelligence (form recognizer)
- Hash Generator (Independent Publisher)
- ArcGIS
- JotForm
- Encodian - Convert
- Microsoft Loop
- Event Hubs
- Encodian - PDF
- Freshservice
- Blackbaud Altru Constituent
- Egnyte
- Google Tasks
- Converter by Power2Apps
- ClickSend SMS
- Microsoft School Data Sync V2
- kintone
- Microsoft Translator V3
- Azure Communication Services SMS
- Updates App (Microsoft 365)
- UiPath Orchestrator
- Defender for Cloud Apps
- Experlogix Smart Flows
- Partner Center Referrals
- Azure AI Foundry Agent Service
- Azure AI Foundry Inference
- PagerDuty
- Stripe
- Copilot for Finance
- Redmine
- Computer Vision API
- Encodian - Word
- Cards for Power Apps
- Blackbaud RENXT Gifts
- monday.com
- Formstack Forms
- Google Contacts
- Todoist
- Blackbaud SKY Add-ins
- Plumsail Actions
- Azure Communication Services SMS Events
- NetDocuments
- Vena Solutions
- Jotform Enterprise
- Hashify (Independent Publisher)
- Luware Nimbus
- Azure AD App Registrations
- Box MCP Server
- Bitly
- Impower ERP
- WordPress
- Databricks
- Amazon S3
- Azure Cognitive Service for Language
- Team Forms
