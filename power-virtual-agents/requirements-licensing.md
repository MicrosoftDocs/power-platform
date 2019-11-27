---
title: "Assign user licenses and manage access to Power Virtual Agents"
description: "Assign licenses and manage access to Power Virtual Agents for your organization"
keywords: "Administration, licensing"
ms.date: 12/02/2019
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

To use Power Virtual Agents, you need a license for each user, as well as a license for your organization. 

For more information about Power Virtual Agents licensing, see the [pricing page](https://go.microsoft.com/fwlink/?linkid=2099502). 

This article focuses on how to assign licenses for Power Virtual Agents to your users.

## Buy base and user licenses from the Microsoft 365 admin center
You can purchase Power Virtual Agents licenses for your organization from the [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx).

  > ![Note]
  > If you're not using the new Microsoft 365 admin center, you can turn it on by selecting **Try the new admin center** located at the top of the Home page.

1. Go to the [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx).

2. On the navigation pane, expand the **Billing** menu and then select **Purchase services**.

3. Search for and select the subscriptions you want to purchase. On the confirmation screen, select the number of licenses to purchase.

4. Complete the check out process.

**Assign licenses to users:**

1. Go to the [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx).

2. On the navigation pane, expand the **Users** menu and then select **Active users**.

    ![Expand Users, then select Active users](media/licensing-menu-users.png)

3. Select the name, and then select **Manage product licenses**.

   ![Select a user and then manage product licenses](media/licensing-manage.png)

4. On the flyout panel, select the checkbox next to **Power Virtual Agents user license**. Select **Save changes**. 

5. Repeat these steps to add more users, or exit the Microsoft 365 admin center if you're finished.

  > [!NOTE]
  > To simplify user license management you can assign licenses to an Azure Active Directory (AAD) security group. More information: [Assign licenses to users by group membership in Azure Active Directory](/azure/active-directory/users-groups-roles/licensing-groups-assign)

The users can now sign in to the [Power Virtual Agents portal](https://powerva.microsoft.com).

## Trial plans
Users in your organization can try Power Virtual Agents for a limited time period.

You can disable or enable the ability for users to sign up for a trial themselves by modifying the **AllowAdHocSubscriptions** flag in your organization settings. More information: [What is self-service sign-up for Azure Active Directory?](/azure/active-directory/users-groups-roles/directory-self-service-signup). 


## Billing unit and billing sessions
Currently, we only report the total number of sessions within the product. We do not report the number of billed sessions. 

The number of billed sessions will be always lower than the number of sessions. We are working on bringing the number of billed sessions into the product soon.

A billed session is an interaction between the customer and the bot and represents one unit of consumption. The billed session begins when an authored topic is triggered. A topic ends in one of the following scenarios: 

- When all of the user's questions are answered.

- When a user intentionally ends or closes a chat session. For web this means when the user closes the tab with the chat open. For persistent channels such as Microsoft Teams or Facebook, this means the user didn't write any message for more than 30 minutes.

- When a bot is unable to answer the question adequately and the interaction is [handed off to a live agent](advanced-hand-off.md).

There are two additional limitations:

- One billed session can last 60 minutes at its longest.
- One billed session can contain a maximum of 100 conversational turns (one turn is defined as one exchange between the user and the bot).

Note that you will be billed even if you chat with the bot in the embedded test chat. 

## Using Power Automate with a Power Virtual Agents license
In order to have unlimited flow runs in Power Automate, you need to create a flow [using the link from within the Power Virtual Agents app](advanced-flow.md). 

Flow runs created using this template do not accrue to your overall Power Automate quotas. 


