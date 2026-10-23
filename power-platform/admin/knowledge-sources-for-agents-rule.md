---
title: Configure knowledge sources for agents (preview)
description: Configure knowledge sources for agents in the Power Platform admin center to control access to SharePoint, public websites, and documents. Learn how to manage sources today.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 10/21/2026
author: laneswenka
ms.author: laswenka
ms.contributors:
  - mkaur
  - ronimilner
ms.reviewer: ellenwehrle
ms.subservice: admin
ms.custom: NewPPAC
ai-usage: ai-assisted
search.audienceType:
  - admin
---

# Configure knowledge sources for agents in the Power Platform admin center (preview)

[!INCLUDE [cc-preview-features-top-note](../includes/cc-preview-features-top-note.md)]

You can choose which types of knowledge sources your agents can reference. The **Knowledge sources for agents** setting controls access to sources like SharePoint, public websites, and documents such as files.

You can access the knowledge sources for agents setting from two places in the Power Platform admin center:

- The environment group rule policy.
- The Security Hub.

This setting is available at both the environment and environment group level. The configuration structure is similar to other settings: if an admin sets the control at the environment group level, then it's distributed to the environment level and can't be modified there.

## Manage knowledge sources for agents

To manage knowledge sources for agents:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Security**.
1. Select the **Data and privacy** setting.
1. Select the **Knowledge sources for agents** setting.

    :::image type="content" source="media/controls-knowledge.png" lightbox="media/controls-knowledge.png" alt-text="Screenshot of the Knowledge sources for agents setting in the Power Platform admin center":::

1. In the side pane, choose whether to sort by **Environment groups** or by **Environments**.
1. Select the environment group or environment that you want to configure.
1. After you select your environment group or environment, select **Manage knowledge sources**.
1. Select the type of information that you want to manage knowledge sources for:

   - **SharePoint + OneDrive**: Configures whether agents can use SharePoint and OneDrive sites as knowledge sources. Choose from three options:
     - **None**: Don't use any SharePoint and OneDrive sites as knowledge sources.
     - **All**: Use all SharePoint and OneDrive sites as knowledge sources.
     - **Custom**: Select which SharePoint and OneDrive sites agents can use. Agents reference them in priority order, starting with the first URL. Select either **Allow** or **Deny** under **Access** for each URL.
   - **Public websites**: Configures whether agents can use public websites as knowledge sources.
     - **None**: Don't use any public websites as knowledge sources.
     - **All**: Use all public websites as knowledge sources.
     - **Custom**: Select which public websites agents can use. Agents reference them in priority order, starting with the first URL. Select either **Allow** or **Deny** under **Access** for each URL.
   - **Documents**: Configures whether people can upload documents to their agents to use as knowledge sources.
     - **Yes**: Agents can use uploaded documents as knowledge sources.
     - **No**: Agents can't use uploaded documents as knowledge sources.

1. Select **Save**.

## Related content

- [Choose knowledge sources for agents built in Copilot Studio](/microsoft-copilot-studio/choose-knowledge-sources)
- [Rules for environment groups](environment-groups-rules.md)
- [Security overview](security/security-overview.md)
- [Data protection and privacy](security/data-protection-privacy.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
