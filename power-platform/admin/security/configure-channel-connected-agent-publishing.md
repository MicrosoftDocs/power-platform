---
title: Configure channel publishing and connected agent access (preview)
description: Channel admin controls help you restrict agent publishing to specific channels. Learn how to configure access rights by environment group in Power Platform.
ms.subservice: admin
ms.topic: concept-article
ms.collection: bap-ai-copilot
author: mikerapid
ms.author: mobajemu
ms.reviewer: ellenwehrle
ms.date: 06/16/2026

---

# Configure channel publishing and connected agent access (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

Use channel publishing and connected agent access controls to enforce governance for Copilot Studio agents. Set these controls at the environment group or environment level to help you apply consistent security and compliance policies in your organization. [Channel access controls](#configure-agent-channel-access-in-the-power-platform-admin-center) determine which channels users can publish to, while [connected agent settings](#configure-connected-agents-for-an-environment) determine whether users can connect agents across environments.

This article explains how to configure each setting and how to verify that restrictions are enforced for users.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Configure agent channel access in the Power Platform admin center

Channel admin controls let administrators specify which [channels](/microsoft-copilot-studio/publication-fundamentals-publish-channels#configure-channels) are available for agents created in Copilot Studio. This feature helps enforce organizational publishing policies. You can't add channels through alternative methods, such as code editing, which helps ensure policies are consistently enforced.

To configure channel access: 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. On the navigation bar, select **Security**.
  
1. In the **Security** pane, select **Identity and access**. The **Identity and access management** page is displayed.

1. Select **Agent access channels** to open the **Agent access channels** pane.

1. Select the environment group or environment for which you want to configure channel access rights. Then select **Set up** at the bottom of the pane. 

1. Select or clear the channel checkbox to grant or limit access to that channel.

1. Select **Save** to apply the changes.

> [!NOTE]
> To learn more about blocking publishing to specific channels, see [Agent access channels](/power-platform/admin/security/identity-access-management#agent-access-channels-preview). Policies set at the environment group level take precedence over environment-level policies. To configure this setting at the environment level, first disable the environment group policy.

When users in your organization try to authorize an agent for a restricted channel, they receive an [on-screen notification about the policy restriction](/microsoft-copilot-studio/authoring-agent-status#agent-issues). If a policy change affects a channel where an agent is already published, users see an error message in the channel area that explains the channel is now blocked. Attempts to use that channel then fail at runtime.

:::image type="content" source="./media/blocked-channel.png" alt-text="Screenshot of blocked Microsoft 365 and Teams channel showing tooltip explaining the channel is disabled by policy.":::

To confirm:

1. In Copilot Studio, open an agent in an environment where channel access is restricted.

1. Try configuring a restricted channel. If the channel access setting is enforced, you can't publish to that channel, and the channel appears grayed out.

## Configure connected agents for an environment

[Connected agents](/microsoft-copilot-studio/add-agent-copilot-studio-agent) enable agents created in Copilot Studio to connect and interact with other agents across environments. Use this setting to control whether agents in an environment can establish these inter-environment connections.

To configure connected agent access:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. On the sidebar, select **Copilot**, select **Settings**, and then locate the **Connected Agents Copilot Studio** setting for Copilot Studio. The **Connected Agents Copilot Studio** panel opens with a list of environments where you can apply your connected agent policy.

1. Select the target environments you want to configure, and then select **Edit settings** at the bottom of the panel.

1. A new panel appears with a radio button to toggle **Connected Agents** on or off. Select **Save**.

1. After you save the setting, refresh the Copilot Studio environment where you set the policy, and confirm that the settings apply.

When you disable connected agents for an environment, users can't add or connect another agent. Existing connected agents remain visible but can't be invoked, and users receive an administrator error.

:::image type="content" source="./media/blocked-connected-agent.png" alt-text="Screenshot displaying blocked connected agent warning in Copilot Studio panel.":::

To confirm:

1. In Copilot Studio, open an agent in an environment where connected agents are disabled.

1. Go to the **Agents** tab at the top of the page.

1. Select **Add an agent**. A pop-up page appears with agents to connect to.

1. If the setting is enforced, agent selection is unavailable and options are grayed out. A warning appears on the pop-up: "Connected agents for Microsoft Copilot Studio has been disabled in your environment or tenant."
