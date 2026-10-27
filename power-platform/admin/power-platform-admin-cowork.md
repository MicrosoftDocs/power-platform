---
title: Power Platform Admin in Cowork (preview)
description: Learn how to install Power Platform Admin (preview) for Copilot Cowork users and connect to Power Platform for Admins V2.
ms.topic: how-to
ms.service: power-platform
ms.date: 10/23/2026
ai-usage: ai-assisted
author: Greggbarker-MS
ms.author: grbarker
ms.reviewer: ellenwehrle
---

# Power Platform Admin in Cowork (preview)

[!INCLUDE [cc-preview-features-top-note](../includes/cc-preview-features-top-note.md)]

Use Power Platform Admin (preview) in Microsoft Copilot Cowork to explore your Power Platform resources. Start by asking which environments you have, then ask about inventory, usage, governance, capacity, or licensing.

This article walks you through installation, connection, and your first question:

- **Microsoft 365 administrators:** Review the [prerequisites](#prerequisites), then [install the plugin for users](#install-the-plugin-for-users).
- **Users with the plugin already installed:** Review the [required roles for data access](#required-roles-for-data-access), then [connect the plugin in Cowork](#connect-the-plugin-in-cowork).

> [!NOTE]
> This feature provides read-only insights and guidance and doesn't independently execute administrative actions.

[!INCLUDE [cc-preview-features-standard-important-note](../includes/cc-preview-features-standard-important-note.md)]

## Prerequisites

To deploy the plugin, you need access to the [Microsoft 365 admin center](https://admin.microsoft.com/) as a tenant administrator or with the Copilot administrator role. For more information, see [Manage plugins for Copilot Cowork](/microsoft-365/copilot/cowork/cowork-manage-plugins#prerequisites).

Users who connect the plugin need:

- An active work or school account in the organization that contains the Power Platform resources you want to access.
- Access to Microsoft Copilot Cowork and the Power Platform Admin (preview) plugin.
- Permission to create a Power Platform for Admins V2 connection.

### Required roles for data access

You can install the plugin for any user, but the account you use to connect must have at least one of the following roles in the organization to access Power Platform data through the plugin in Cowork:

- Global Administrator
- Power Platform Administrator
- Dynamics 365 Administrator

Installing the plugin for a user doesn't grant these roles or access to Power Platform data. These data-access requirements are separate from the Microsoft 365 permissions needed to manage plugin installations.

Confirm that the target users have the required licenses and access to Cowork. Installing the plugin doesn't grant access to Power Platform resources.

> [!IMPORTANT]
> Deploying the Power Platform Admin (preview) plugin doesn't grant access to Cowork itself. Configure Cowork access separately. Current Cowork access controls use a spending policy that includes Cowork; changing the Cowork agent entry in the registry doesn't grant that access. See [Manage Copilot Cowork for your organization](/microsoft-365/copilot/cowork/cowork-admin-governance#allow-access-to-cowork).

## Install the plugin for users

As a Microsoft 365 administrator, install the plugin in the Microsoft 365 admin center.

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/).
1. In the left navigation pane, select **Agents** > **Tools**.
1. On the **Tools** page, select the **Registry** tab.
1. Search for **Power Platform Admin (preview)** and select **Power Platform Admin (preview)**, published by **Microsoft**.

   :::image type="content" source="media/admin-cowork/power-platform-admin-tools-registry.png" alt-text="Microsoft 365 admin center Tools page with Power Platform Admin (preview) listed in the Registry.":::

1. Review the plugin overview and select **Install**.

   :::image type="content" source="media/admin-cowork/power-platform-admin-install-overview.png" alt-text="Power Platform Admin (preview) plugin overview in the Microsoft 365 admin center with the Install button.":::

1. On the **Select users** page, confirm that **Channel** is **Copilot**.
1. Under **Installed for**, select **All users** or **Specific users and groups**. If you select specific users and groups, add them when prompted.
1. Select **Next**.

   :::image type="content" source="media/admin-cowork/power-platform-admin-select-users.png" alt-text="Install wizard Select users page with the Copilot channel and All users or Specific users and groups options.":::

1. On the **Review and install** page, confirm the selected audience and select **Install**.

   :::image type="content" source="media/admin-cowork/power-platform-admin-review-install.png" alt-text="Install wizard Review and install page showing Power Platform Admin (preview) set to install for all users.":::

## Connect the plugin in Cowork

As a user in the installation audience, connect the plugin in Cowork.

1. Open Copilot Cowork with your work or school account.
1. In Cowork's navigation, select **Customize**.
1. Under **Installed**, find **Power Platform Admin (preview)** and select **Connect**.

   :::image type="content" source="media/admin-cowork/power-platform-admin-cowork-customize.png" alt-text="Cowork Customize page with Power Platform Admin (preview) under Installed and a Connect button.":::

1. In the **Connect Power Platform for Admins V2** dialog, set **Authentication Type** to **OAuth Connection**, then select **Connect**.
1. Sign in with an account that has one of the [required roles for data access](#required-roles-for-data-access). Confirm that you're using the account and organization you intend to access before completing consent.
1. Return to Cowork after the connection completes.

   :::image type="content" source="media/admin-cowork/power-platform-admin-cowork-connect.png" alt-text="Cowork dialog to connect Power Platform for Admins V2 using OAuth Connection.":::

> [!IMPORTANT]
> Don't paste passwords, access tokens, or client secrets into a conversation.

## Ask a question and approve the request

Try an inventory question first, then use an environment name from the answer to ask a more focused question.

1. In Cowork, enter:

   > Which environments do we have, and what types are they?

2. When Cowork displays an Ask Advisor approval card, select **View details** to review the request, and then select **Approve** to continue.

   :::image type="content" source="media/admin-cowork/power-platform-admin-cowork-approval.png" alt-text="Cowork Ask Advisor approval card with View details and Approve controls.":::

3. Review the answer. To explore an environment further, ask:

   > Which apps belong to the [environment name] environment?

   Replace `[environment name]` with a name from the answer.

Ask more questions about a named environment, resource, or reporting period. For example:

| Topic | Example question |
| --- | --- |
| Inventory | Which apps belong to the Finance environment? |
| Usage | Which apps had the most usage last month? |
| Governance | Which resources have ownership or sharing concerns? |
| Capacity | Where is Power Platform capacity being consumed? |
| Licensing | Which licensing considerations apply to this scenario? |

To allow future Ask Advisor send-message requests without a separate approval prompt:

1. Open the menu next to **Approve**.
2. Select **Always allow Ask advisor send message advisor**.

Choose this option only if you want Cowork to remember this approval for future requests.

:::image type="content" source="media/admin-cowork/power-platform-admin-cowork-approval-preference.png" alt-text="Cowork approval menu with the Always allow Ask advisor send message advisor option.":::

For guidance on agentic governance, see [Agentic governance with Power Platform Admin in Cowork (preview)](../guidance/adoption/agentic-governance.md).

## Troubleshooting

| Problem | What to do |
| --- | --- |
| You can't install the plugin | Ask your Microsoft 365 administrator to confirm that your account is included in the install audience and that the **Copilot** channel is selected. |
| The plugin is installed, but you can't access Power Platform data | Confirm that the account used for the Power Platform for Admins V2 connection has the Global Administrator, Power Platform Administrator, or Dynamics 365 Administrator role in the intended organization. Plugin installation alone doesn't grant data access. |
| The plugin doesn't appear under **Installed** in Cowork Customize | Ask your Microsoft 365 administrator to confirm that your account was included in the installation audience. |
| The plugin is installed, but Cowork is unavailable | Ask your administrator to check Cowork access separately. Installing the plugin doesn't grant access to Cowork. |
| Cowork asks you to connect | Complete the Power Platform for Admins V2 OAuth connection, then ask your question again. |
| The connection is ready, but Ask Advisor is unavailable | Report the problem through support. Include the plugin name and the error, but no credentials. |
| The account or organization is wrong | Stop before asking for tenant information. Use the connection settings to select or establish the intended connection. If the controls are unclear, ask your administrator or support for help. |
| A request takes longer than expected | Allow the active request to complete. If Cowork can't confirm the answer, include the returned conversation ID in your support request, if one is provided. |

## Disable the plugin or disconnect your account

To disable the plugin for your conversations, open **Customize**, select **Power Platform Admin (preview)**, and turn off its switch. Users can't uninstall an admin-installed plugin. Contact your Microsoft 365 administrator to have the plugin removed from your account.

To disconnect your account, open the connection settings for Power Platform for Admins V2 and remove the connection. If you can't find a disconnect or removal control, contact your administrator or support for instructions.

## Get help and support

For account access or plugin availability, contact your organization's administrator first.

For Power Platform assistance, use [Microsoft Support in the Power Platform admin center](https://admin.powerplatform.microsoft.com/support). The [support guide](get-help-support.md) explains the required roles and support plans. You can access self-help resources without a support plan. You need an active support plan to create a support request.

When reporting a plugin issue, include:

- The plugin name, **Power Platform Admin (preview)**.
- The Copilot experience in which the issue occurred, such as Cowork.
- The time of the issue and the steps you followed.
- Any error message or conversation ID.

Don't include passwords, access tokens, or secrets.

## Related content

- [Manage plugins, skills, and MCP servers in the Microsoft 365 admin center](/microsoft-365/admin/manage/manage-plugins-skills-mcp-servers)
- [Manage plugins for Copilot Cowork](/microsoft-365/copilot/cowork/cowork-manage-plugins)
- [Use plugins with Copilot Cowork](/microsoft-365/copilot/cowork/cowork-plugins)
- [Power Platform for Admins V2 connector reference](/connectors/powerplatformadminv2/)
- [Get support in the Power Platform admin center](get-help-support.md)
