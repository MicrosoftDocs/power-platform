---
title: "Assign user licenses and manage access"
description: "Assign licenses and manage access to Microsoft Copilot Studio for your organization"
keywords: "Administration, licensing, PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "licensing, admin, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Assign licenses and manage access to Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

This topic is written for tenant admins. If you want to sign up for Microsoft Copilot Studio as an individual, see the [Sign up for a Microsoft Copilot Studio trial](sign-up-individual.md) topic.

To create and manage bots with Microsoft Copilot Studio, you need:

- A license for each user, also known as a "per user license" (or "Power Virtual Agent User License" as referred to on the [Microsoft 365 admin center](https://admin.microsoft.com)), should be assigned to individual users who need access to create and manage chatbots.
- A license for your organization, also known as a "tenant license" (or "Power Virtual Agent" as referred to on the [Microsoft 365 admin center](https://admin.microsoft.com)), should be acquired by the tenant admin. This license cannot be assigned to individual users.

> [!NOTE]
> Users of your bot don't need a special license. After you publish your bot, anyone who can access where you published the bot can interact with the bot.

More information: [Licensing guide](https://go.microsoft.com/fwlink/?linkid=2085130)
  
> [!IMPORTANT]
> If you purchase a Microsoft Copilot Studio license through volume licensing or any channel other than the [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx), you need to acquire both a tenant license and a user licenses through that channel, preferably as part of a single transaction.
  
## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

# [Web app](#tab/web)

### Buy a tenant license

Purchase licenses for your organization by going to the [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx). You'll need to sign in with an admin account to buy licenses.

1. Go to the [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx) and sign in with your admin account.
1. On the side pane, expand the **Billing** menu, and then select **Purchase services**.
1. Search for **Power Virtual Agent**, and complete the checkout process.

### Acquire user licenses

1. After you've purchased a Microsoft Copilot Studio license from the Microsoft 365 admin center, you need to purchase user licenses to give users access to the product. In the Microsoft 365 admin center, go to **Billing**, and then select **Purchase services**.
1. Scroll down to the **Add-ons** section.
1. Look for **Power Virtual Agent User License**. Select the number of licenses you need, and complete the checkout process.

> [!IMPORTANT]
> If you purchased a Microsoft Copilot Studio license through volume licensing or any channel other than the [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx), you need to acquire both a tenant license and user licenses through that channel, preferably as part of a single transaction.

### Assign licenses to users

1. Go to the [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx) and sign in with your admin account.

1. On the side pane, expand the **Users** menu, and then select **Active users**.

    :::image type="content" source="media/requirements-licensing/licensing-menu-users.png" alt-text="Expand Users, and then select Active users." border="false":::

1. Select a name, and then select **Manage product licenses**.

   :::image type="content" source="media/requirements-licensing/licensing-manage.png" alt-text="Select a user, and then manage product licenses." border="false":::

1. On the flyout pane, select the check box next to **Power Virtual Agent user license**, and then select **Save changes**.

Repeat these steps to add more users, or exit the Microsoft 365 admin center if you're finished.

  > [!NOTE]
  > To simplify user license management, you can assign licenses to an Microsoft Entra ID security group. More information: [Assign licenses to users by group membership in Microsoft Entra ID](/azure/active-directory/users-groups-roles/licensing-groups-assign)

The users can now sign in to the [Microsoft Copilot Studio portal](https://web.powerva.microsoft.com).

### How to differentiate between tenant and user licenses

If you are unsure whether you have both of the required licenses, on the [Microsoft 365 admin center](https://admin.microsoft.com) go to **Billing** and then **Subscriptions** to see the list of active licenses. For Microsoft Copilot Studio you should see two licenses:

- Power Virtual Agent
- Power Virtual Agent User License

You can only assign the "Power Virtual Agent User License" to specific users. You don't need to assign the "Power Virtual Agent" license.

# [Teams](#tab/teams)

To create and manage Microsoft Copilot Studio chatbots in Teams, you need:

- [A license to use Teams](/MicrosoftTeams/user-access)
- [Licenses to use Microsoft Copilot Studio](requirements-licensing.md)

In some instances you may see a diamond icon or other indicator when a particular feature requires a different type of license. You'll be prompted about upgrading if you try to use that feature. For example, you'll see diamond icons when publishing to additional channels:

:::image type="content" source="media/requirements-licensing/upgrade-channels.png" alt-text="You need an upgraded license to publish to channels other than Teams.":::

For more information about licenses, see the following topics:

- [Manage user access to Teams](/MicrosoftTeams/user-access)
- [Assign licenses and manage access to Microsoft Copilot Studio](requirements-licensing.md)

---

## Trial plans

Users in your organization can try Microsoft Copilot Studio for a limited time period.

You can [disable or enable the ability for users to sign up for a trial themselves](/azure/active-directory/users-groups-roles/directory-self-service-signup) by modifying the **AllowAdHocSubscriptions** flag in your organization settings.

## Subscription capacity

When you purchase a license, you gain capacity for the specified number of billed sessions. Microsoft Copilot Studio pools this capacity across the entire tenant.

The consumption of the capacity isn't reported at the tenant level, but [can be seen for each individual bot](analytics-billed-sessions.md).

See [Quotas and rate limit capacity considerations for Microsoft Copilot Studio](requirements-quotas.md) for more information.

## Using Power Automate with a Microsoft Copilot Studio license

- [See Quotas, limits, and configuration values](requirements-quotas.md)
- [See how to use Power Automate with Microsoft Copilot Studio](advanced-flow.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
