---
title:  Default settings
description: Learn which Business Applications in Work IQ settings are on by default and how to manage them.
ms.date: 09/28/2026
ms.topic: concept-article
ai-usage: ai-assisted
author: NHelgren
ms.author: nhelgren
ms.reviewer: ellenwehrle
---

# Business Applications in Work IQ default settings

**Business Applications in Work IQ** is a set of capabilities that lets Microsoft 365 Copilot, Microsoft 365 Copilot Chat, Copilot Cowork, and Model Context Protocol (MCP) clients work with Power Apps and Dynamics 365 data.

Starting September 30, 2026, Microsoft turns on these capabilities by default for all new environments that aren't listed as exceptions in this article. You can use the capabilities without a separate configuration process.

Starting in November 2026, Microsoft turns on Business Applications in Work IQ for existing environments that aren't listed as exceptions.

## Environments enabled by default

The default applies to public production environments created for new or existing tenants. The following environments are exceptions:

- **European Economic Area (EEA) and European Union (EU) environments**: Microsoft plans to enable environments provisioned in the EEA or EU when the feature becomes generally available. During public preview, customers can turn on Work IQ by using the corresponding setting in the Microsoft 365 admin center.
- **Government-related environments**: This exception applies to environments provisioned by customers with current or previous government cloud deployments that are likely to depend on FedRAMP security controls.
- **Nonproduction environments**: This exception applies to trial, sandbox, and developer environments.

Business Applications in Work IQ isn't currently available in sovereign or government cloud environments, including Department of Defense (DoD), Government Community Cloud (GCC), and GCC High.

You can manually configure an environment where Work IQ is off. See [Set up Business Applications in Work IQ for a pilot](quickstart.md).

## Settings enabled by default

When Work IQ is on by default, the following settings are also on:

- **Dataverse Data Available in Microsoft 365 Copilot**: This Microsoft 365 admin center setting allows environments in the tenant to share Dataverse and Microsoft 365 data bidirectionally. Tenant administrators manage this setting. It must be on for environments to use Work IQ capabilities.
- **Work IQ**: This Power Platform admin center setting turns on Work IQ capabilities for a specific environment. Makers and users can then use these capabilities in apps, Copilot Cowork, coding clients such as GitHub CLI and Dataverse CLI, and Microsoft 365 Copilot Chat. Environment administrators manage this setting.
- **Enable Copilot in model-driven apps**: This app-level setting makes the tables, data, views, and forms for a specific app available to Microsoft 365 Copilot Chat. Makers manage this setting in the Power Apps maker portal.

During public preview, all new apps in an environment where Work IQ is on automatically include Microsoft 365 Copilot Chat.

## Capabilities available with Work IQ

When Work IQ is on, a new environment can use the following capabilities:

- Search Power Apps and Dynamics 365 data by using Microsoft 365 Copilot Chat in-app and mainline search.
- Semantic modeling.
- Power Apps and Dynamics 365 data in Agent Builder declarative agents.
- MCP client interactions with the Work IQ MCP server.

## Storage impact

Some features use extra storage for search indexes. These features include semantic modeling and access to Power Apps and Dynamics 365 data through Microsoft 365 Copilot Chat.

## Solution imports

When you import a solution that contains an app into an environment where Work IQ is on, the following rules apply:

- If the app's **Enable Copilot in model-driven apps** setting is **On** or **Default**, the setting is **On** in the destination environment.
- If the setting is **Off**, it remains **Off** in the destination environment.

## Compliance considerations

> [!IMPORTANT]
> - **Payment Card Industry Data Security Standard (PCI DSS):** PCI DSS attestations apply only to the services, components, environments, and functions identified as in scope in the applicable audit. Dynamics 365 and eligible Power Platform services might be assessed under a scope separate from Microsoft 365. Microsoft 365 coverage is limited to the services and data types identified in its attestation, such as qualifying files and documents in SharePoint Online and OneDrive for Business. When Microsoft 365 Copilot retrieves or presents Dataverse data, the source service's PCI DSS status doesn't automatically extend to that experience. You're responsible for the PCI DSS requirements that apply to cardholder data in transit or at rest.
> - **HITRUST:** HITRUST certification applies only to the services, environments, system boundaries, and controls identified in the applicable certification records. Dynamics 365 and Power Platform services might be assessed under a scope separate from Microsoft 365. Microsoft 365 certification is limited to the Office 365 services listed in its current Letter of Certification. When Microsoft 365 Copilot retrieves or presents Dataverse data, certification of the source service doesn't automatically extend to the receiving service or customer solution. Under the shared responsibility model, you're responsible for access controls, data protection, risk assessment, and compliance with applicable healthcare regulations.
> - **Family Educational Rights and Privacy Act (FERPA):** When you enable data transfers from Microsoft 365 to Dynamics 365 and Power Platform services through Work IQ, these online services might provide different compliance commitments for handling student information. Even when FERPA requirements are satisfied, educational institutions should work with their security and compliance teams to evaluate these integrations before using Work IQ for production or regulated workloads.
> - **FedRAMP:** This information applies to tenants provisioned in the United States that use FedRAMP-accredited environments in Dynamics 365 and eligible Power Platform services. Enabling Work IQ might cause data to flow from the tenant's FedRAMP-accredited environment to Microsoft 365, which is outside the applicable FedRAMP authorization boundary. The egressing information might include Content, personal data, and pseudonymized identifiers. Data leaving the boundary might be processed, stored, backed up, or accessed for support in non-US regions. Outside-boundary data is processed and stored in locations and services to serve customers' AI queries through Work IQ. Customers can configure geographic routing and retention in the recipient Online Service. Before enabling Work IQ, review the boundary, residency, retention, and routing implications.

## Cascading control settings

You manage Business Applications in Work IQ through a cascading set of settings at three levels:

- **Microsoft 365 admin center (tenant level)**: The **Enable Microsoft 365 Copilot Chat and Dataverse** setting allows bidirectional data sharing across environments in the tenant. The setting doesn't share data by itself. Manage data sharing in the Power Platform admin center. If you turn off this setting, data isn't shared between Microsoft 365 Copilot Chat and Dataverse, even if an app is configured to share data.
- **Power Platform admin center (environment level)**: The **Work IQ** setting turns on business skills, semantic modeling, and access to Dataverse data through Microsoft 365 Copilot Chat, Research, and Agent Builder. If you turn off this setting, these features aren't available in the environment.
- **Power Apps maker portal (app level)**: The app-level setting determines which apps share data bidirectionally between Microsoft 365 Copilot Chat and Dataverse and use semantic modeling. Only apps where the setting is on share their data.

### Tenant-level setting

Use the tenant-level setting to manage whether Power Apps and Dynamics 365 data can be used in Microsoft 365 Copilot Chat across the tenant. You need a tenant administrator account.

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/).
1. In the left navigation pane, select **Copilot** > **Settings**.
1. In **Copilot settings**, select **View all** > **Dataverse Data available in Microsoft 365 Copilot**.
1. In the **Dataverse Data available in Microsoft 365 Copilot** pane, select an option:
   - To turn off access for everyone, select **No users**.
   - To turn on access for everyone, select **All users**. This option is the default.
   - To provide access to a limited audience, select **Specific groups**, and then add or remove groups.
1. Select **Save**.

### Environment-level setting

Use the environment-level setting to manage business skills, semantic modeling, and access to Dataverse data through Microsoft 365 Copilot Chat, Research, and Agent Builder. You need an environment administrator account.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the left navigation pane, select **Manage**.
1. Select the environment that you want to manage.
1. On the command bar, select **Settings**.
1. Select **Product** > **Features**.
1. Find **Work IQ**, and then turn the setting on or off.
1. Select **Save**.

### App-level setting

Use the app-level setting to manage whether a model-driven app's tables, forms, and views are available in Microsoft 365 Copilot Chat, Research in Microsoft 365 Copilot, and Agent Builder. You need a maker account.

> [!NOTE]
> Tables can appear in multiple apps. If you turn off an app that includes a table shared through other apps, the data remains available until you turn off the other apps that use the table.

1. Sign in to [Power Apps](https://make.powerapps.com/).
1. In the left navigation pane, select **Apps**.
1. Find the app that you want to manage, and then select **Edit**.
1. On the app navigation bar, select **Settings**.
1. Select **Features**.
1. Set **Enable Microsoft 365 Copilot in model-driven apps** to **On** or **Off**.
1. Select **Save**.
1. Select **Publish**.

## Related content

- [Agent Builder in Microsoft 365 Copilot](/microsoft-365/copilot/extensibility/agent-builder)