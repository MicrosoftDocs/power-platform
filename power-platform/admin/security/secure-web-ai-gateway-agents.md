---
title: Global Secure Access for Copilot Studio agents (preview)
description: Learn how to configure the Secure Web and AI Gateway for Microsoft Copilot Studio agents to enforce network security controls.
ms.date: 01/13/2026
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

# Configure Global Secure Access, the Secure Web and AI Gateway for agents (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

As organizations integrate autonomous and interactive AI agents to perform tasks previously handled by humans, administrators may notice a reduction in visibility and control compared to the traditional user network security policy and management experience.

With Global Secure Access (GSA) for Agents, you can now regulate how these agents use knowledge, tools, and actions to access other resources in a way that's similar to how you regulate users.

:::image type="content" source="media/agent-traffic-flow.png" alt-text="Diagram showing agent traffic flowing through Global Secure Access to protected resources.":::

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Key benefits

After you forward agent traffic to Global Secure Access, you can apply the following security controls:

- **Web content filtering**: Control access to web content based on categories and URLs.
- **Threat intelligence filtering**: Block access to known malicious sites and services.
- **Network file filtering**: Control file uploads and downloads.

You configure security policies for agents by using the baseline profile in Global Secure Access. The baseline profile applies security policies at the tenant level, ensuring consistent security controls across all agent traffic.

## How Secure Web and AI Gateway for Copilot Studio agents works

To enforce consistent network security controls on Copilot Studio agents, forward traffic from the agents to Global Secure Access's globally distributed proxy service. You can enable forwarding of agent traffic in the Power Platform admin center on a per-Environment or per-Environment Group basis. Forwarding applies to all kinds of agent traffic, including traffic from HTTP Node and Tools generated connectors, including custom connectors, the custom Model Context Protocol (MCP) server connector, and a full list of [supported connectors](#supported-connectors).

Once you forward traffic from the agent to GSA, you can enforce the same security controls you use on users to agents, including web content filtering, threat intelligence filtering, network file filtering, and more.

When an agent makes a request to external resources, the Global Secure Access service evaluates the request in real time against the security policies you configured. If the request complies with the configured policies, the service allows it. If the request violates any security policy, the Global Secure Access service denies the request with appropriate logging for audit and monitoring purposes.

## Prerequisites

- Administrators who interact with **Global Secure Access** features must have one or more of the following role assignments depending on the tasks they're performing:
  - The [Global Secure Access Administrator](/azure/active-directory/roles/permissions-reference) role to manage the Global Secure Access features.
  - The [Power Platform Administrator](../use-service-admin-role-manage-tenant.md) role to manage Copilot Studio environments.
- A Power Platform environment with Dataverse added to it.

## High-level steps

Configuring network controls for Copilot Studio agents involves several steps:

1. [Enable Network Controls for Copilot Studio Agents in Power Platform environment settings](#enable-network-controls-for-copilot-studio-agents)
1. [Create security policies for Copilot Studio traffic](#more-details-on-security-controls-in-global-secure-access)

## Enable network controls for Copilot Studio Agents

The first step is to enable traffic forwarding from Copilot Studio Agents in the Power Platform Admin Center.

> [!NOTE]
> Before you enable this feature in the Power Platform Admin Center, ensure your tenant is onboarded to Global Secure Access in the [Microsoft Entra Admin Center](https://aka.ms/entragsaportal)

### Enable network controls at the environment level

To configure Global Secure Access settings at the environment level, complete the following steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Security**
1. On the **Security** pane, select **Identity & access**.
1. Select **Global Secure Access for Agents**.
1. Select the appropriate Environment and select **Set up**. 
1. Toggle **Enable Global Secure Access for Agents** to *on* for your selected environment.
1. Select **Save**.

### Enable network controls at the environment group level

To configure Global Secure Access settings at the environment group-level, complete the following steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Security**.
1. On the **Security** pane, select **Identity and access**.
1. Select **Global Secure Access for Agents**.
1. Select the **Environment groups** tab to which you want the security setting applied, then select **Set up**.
1. Toggle **Enable Global Secure Access for Agents** to *on* for the selected environment group.
1. Select **Save**.

> [!NOTE]
> After enabling GSA for Agents for a given environment or environment group, you need to create or update any existing custom connectors for them to route traffic through Global Secure Access.

## Create security policies for Copilot Studio agents

After enabling network controls, you can enforce Global Secure Access security policies on agent traffic. You can apply web content filtering, threat intelligence filtering, and other security policies. The following example shows how to configure a web content filtering policy:

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com) as a [Global Secure Access Administrator](/azure/active-directory/roles/permissions-reference).
1. Browse to **Global Secure Access** > **Secure** > **Web content filtering policies**.
1. Select **Create policy**.
1. Enter a descriptive name and a description for the policy, then select **Next**.
1. Select **Add rule**.
1. Configure rules based on your security to Copilot Studio agent requirements. For example, block access to `Web respositories`, `Illegal software`, not safe for work (NSFW) sites, and more.
1. Select **Next** to review the policy.
1. Select **Create policy**.

Next, you can create policies like [threat intelligence](/entra/global-secure-access/how-to-configure-threat-intelligence) to protect agents against malicious destinations or [file policy](/entra/global-secure-access/how-to-network-content-filtering) to safeguard against unintended data exposure and prevent inline data leaks.

## Link policies to the baseline profile

Group your security policies by linking them to the baseline profile to apply them to Copilot Studio agent traffic. Security profiles linked to Conditional Access policies aren't currently supported for Copilot Studio agents.

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com) as a [Global Secure Access Administrator](/azure/active-directory/roles/permissions-reference).
1. Browse to **Global Secure Access** > **Secure** > **Security profiles**.
1. Select the **Baseline profile** tab.
1. Select **Edit** to edit the baseline profile rules.
1. Select **Link a policy** and then select **Existing policy**.
1. Select the Copilot Studio agent web repositories policy created earlier and select **Add**.
1. Select **Save** to save the profile changes.

## Monitor and maintain

Regular monitoring and maintenance ensure your security configuration remains effective:

1. **Review traffic logs** regularly for unusual patterns or blocked legitimate traffic. For more information, see [Global Secure Access network traffic logs](/entra/global-secure-access/how-to-view-traffic-logs).
1. **Update filtering policies** as new services or requirements emerge.
1. **Test policy changes** in a development environment before applying to production.

> [!NOTE]
> Configuration changes in the Global Secure Access experience related to web content filtering typically take effect in less than five minutes.

## More details on security controls in Global Secure Access

[Configure security controls in the Global Secure Access portal](/entra/global-secure-access/how-to-secure-web-ai-gateway-agents)

## Known limitations

- Currently the agent name returned in the Global Secure Access traffic logs is the agent's unique `schema name`.
- Currently the block experience for Copilot Studio agents blocked by GSA shows a `502 Bad Gateway` for HTTP Actions or a `403 Forbidden` for connectors. This experience is a known issue, and improvements are coming soon.
- Currently only the baseline profile is supported for enforcement, so network security policies are per-tenant.
- GSA partner ecosystem integrations, for example, third-party Data Loss Prevention (DLP), aren't supported.
- Copilot Studio Bing search network transactions (including knowledge from _public websites_ and _Wikipedia_) aren't supported.
- Network requests to Dataverse and Azure SQL knowledge sources aren't supported. 
- Network requests to the following custom tools aren't supported: prompt, agent flow, Computer Use, and child agents.
- Network requests to Large Language Model (LLM), either for orchestration or results enhancement, aren't supported.
- Limited connector support (see [supported connectors](#supported-connectors) for details).
- Connectors other than those listed in [supported connectors](#supported-connectors) are not supported and may not function reliably.

## Supported connectors

The following connectors currently support secure web and AI gateway Copilot Studio agents:

:::row:::
    :::column:::
    - Office 365 Groups
    - Microsoft Teams
    - OneDrive for Business
    - Power Apps for Makers
    - Microsoft Forms
    - Power BI
    - Planner
    - Power Automate Management
    - Microsoft Translator V2
    - Microsoft To-Do (Business)
    - Power Apps Notification
    - Power Platform for Admins
    - Desktop flows
    - Power Apps for Admins
    - Office 365 Outlook
    - Power Automate for Admins
    - Shifts for Microsoft Teams
    - Project Online
    - Slack
    - Jira
    - Azure Table Storage
    - Microsoft Copilot Studio
    :::column-end:::
    :::column:::
    - Smartsheet
    - Google Drive
    - OneDrive
    - Azure Data Factory
    - Microsoft Learn Docs MCP
    - Databricks
    - Microsoft Defender ATP
    - iAuditor
    - Azure Log Analytics Data Collector
    - Blackbaud Altru Constituent
    - Partner Center Referrals
    - Azure AI Foundry Agent Service
    - Azure AI Foundry Inference
    - Copilot for Finance
    - Blackbaud RENXT Gifts
    - Blackbaud SKY Add-ins
    - Luware Nimbus
    - Box MCP Server
    - Impower ERP
    - Databricks
    - Amazon S3
    - Azure Cognitive Service for Language
    :::column-end:::
:::row-end:::

You can find more information about individual connectors at [Connector reference overview](/connectors/connector-reference/).

## Unsupported connectors

The following connectors are not currently supported with Global Secure Access for agents and may not function reliably:

<details>
<summary>View full list of unsupported connectors</summary>

Due to the large number of Power Platform connectors, this list represents a subset of commonly used unsupported connectors:

:::row:::
    :::column:::
    - SharePoint
    - SQL Server
    - Dataverse (Common Data Service)
    - Azure Blob Storage
    - Azure Key Vault
    - Azure Queues
    - Azure Tables
    - Salesforce
    - Dynamics 365 Business Central
    - Dynamics 365 Customer Voice
    - ServiceNow
    - Zendesk
    - FreshDesk
    - MailChimp
    - SendGrid
    - Twilio
    - Adobe Acrobat Sign
    - DocuSign
    - Dropbox
    - GitHub
    - Gmail
    - Google Calendar
    - Google Sheets
    - Excel Online (Business)
    :::column-end:::
    :::column:::
    - Word Online (Business)
    - OneNote (Business)
    - Outlook.com
    - Trello
    - Asana
    - Monday.com
    - QuickBooks
    - Xero
    - MySQL
    - PostgreSQL
    - Oracle Database
    - DB2
    - Snowflake
    - Azure SQL
    - Event Hubs
    - Service Bus
    - FTP
    - SFTP
    - RSS
    - Bing Maps
    - Bing Search
    - HTTP with Microsoft Entra ID
    - And others. For the complete list of all Power Platform connectors, see [Connector reference overview](/connectors/connector-reference/connector-reference-powerapps-connectors).
    :::column-end:::
:::row-end:::

For the complete list of all Power Platform connectors, see [Connector reference overview](/connectors/connector-reference/connector-reference-powerapps-connectors).

</details>

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
