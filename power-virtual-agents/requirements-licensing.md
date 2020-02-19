---
title: "Assign user licenses and manage access to Power Virtual Agents"
description: "Assign licenses and manage access to Power Virtual Agents for your organization"
keywords: "Administration, licensing"
ms.date: 2/20/2020
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "licensing, admin"
ms.collection: virtual-agent
---

# Assign licenses and manage access to Power Virtual Agents

To create and manage bots with Power Virtual Agents, you need:

- A license for each user, also known as a "per user license."
- A license for your organization, also known as a "tenant license." 

>[!NOTE]
>Users of your bot don't need a special license. After you publish your bot, anyone who can access where you published the bot can interact with the bot.

More information: [Licensing guide](https://go.microsoft.com/fwlink/?linkid=2085130)

> [!NOTE]
> To acquire a Power Virtual Agents user license, you need to use the non-preview version of the admin center. Ensure the **Try the new admin center** setting is turned off.
  
## Buy a tenant license

Purchase licenses for your organization by going to the [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx). You'll need to sign in with an admin account to buy licenses.

1. Go to the [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx) and sign in with your admin account.

2. On the navigation pane, expand the **Billing** menu, and then select **Purchase services**.

3. Search for **Power Virtual Agents license**, and complete the checkout process.

## Acquire user licenses

1. After you've purchased a Power Virtual Agent license, you need to purchase user licenses to give users access to the product. In the Microsoft 365 admin center, go to **Billing**, and then select **Purchase services**.

2. Scroll down to the **Add-ons** section.

3. Look for **Power Virtual Agent User License**. Select the number of licenses you need, and complete the checkout process.

## Assign licenses to users

1. Go to the [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx) and sign in with your admin account.

2. On the navigation pane, expand the **Users** menu, and then select **Active users**.

    ![Expand Users, and then select Active users](media/licensing-menu-users.png "Expand Users, and then select Active users")

3. Select a name, and then select **Manage product licenses**.

   ![Select a user, and then manage product licenses](media/licensing-manage.png "Select a user, and then manage product licenses")

4. On the flyout panel, select the check box next to **Power Virtual Agents user license**, and then select **Save changes**. 

Repeat these steps to add more users, or exit the Microsoft 365 admin center if you're finished.

  > [!NOTE]
  > To simplify user license management, you can assign licenses to an Azure Active Directory (Azure AD)<!--from editor: Via Cloud Style Guide--> security group. More information: [Assign licenses to users by group membership in Azure Active Directory](/azure/active-directory/users-groups-roles/licensing-groups-assign)

The users can now sign in to the [Power Virtual Agents portal](https://powerva.microsoft.com).

## Trial plans

Users in your organization can try Power Virtual Agents for a limited time period.

You can [disable or enable the ability for users to sign up for a trial themselves](/azure/active-directory/users-groups-roles/directory-self-service-signup) by modifying the **AllowAdHocSubscriptions** flag in your organization settings. 

## Subscription capacity

When you purchase a license, you gain capacity for the specified number of billed sessions. Power Virtual Agents pools this capacity across the entire tenant. 

The consumption of the capacity isn't reported at the tenant level, but [can be seen for each individual bot](analytics-billed-sessions.md).

## Using Power Automate with a Power Virtual Agents license

[See how to use Power Automate with Power Virtual Agents](advanced-flow.md). 

