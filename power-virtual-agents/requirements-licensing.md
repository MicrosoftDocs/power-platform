---
title: "Licensing for Power Virtual Agents"
description: "Learn the various license types for Power Virtual Agents and learn how to manage access to Power Virtual Agents in your organization"
keywords: "Administration, licensing"
ms.date: 12/02/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: mivakoc
ms.author: mivakoc
manager: mahesha
ms.custom: "VA"
ms.collection: virtualagent
---

# Licensing for Power Virtual Agents

To see the available subscriptions for Power Virtual Agents see the [pricing page](https://go.microsoft.com/fwlink/?linkid=2099502). This documentation focuses on how to purchase the available subscriptions and assign licenses for Power Virtual Agents to your users.

## Managing liceneses using Microsoft Admin Portal
You can pruchase Power Virtual Agents licenses for your organization from the [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx)

### Purchasing Base and USL SKUs
1. Navigate to [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx)
2. On the left navigation pane, select **Billing -> Purchase services**
3. Search for Power Virtual Agents
4. Select Power Virtual Agents and Power Virtual Agents user license
5. On the confirmation screen, select the number of licenses you would like to purchase
6. Complete the check out process

### Give indidvidual users access
1. Navigate to [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx)
2. On the left navigation pane, select **Users -> Active users**
3. Select users to whom you would like to give access and select **Manage product licenses**
4. Select **Power Virtual Agents user license** and click **Save changes**

  > [!NOTE]
  > To simplify User License management you can assign licenses to an AAD security group. [Learn more](https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/licensing-groups-assign)

## Trial plans
Users in your organization can trial Power Virtual Agents for limited time period.
You can choose to disable or enable the ability for users in your organization to sign up for a trial by modifying the **AllowAdHocSubscriptions** flag in your organization settings. [Learn more](https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/directory-self-service-signup). 

## Billing unit 
Currently, we only report the total number of sessions in the product. We do not report the number of billed sessions. The number of billed sessions will be always lower than the number of sessions. We are working on bringing the number of billed sessions into the product soon.

### Definition of billing unit
A billed session is an interaction between the customer and the bot and represents one unit of consumption. The billed session begins when an authored topic is triggered. A topic ends in one of the following scenarios: 
1. When all of the customer's questions are answered
2. When a customer intentionally ends or closes a chat session. For web this means when customer closes the tab with the chat open, for persistent channels such as Microsoft Teams or Facebook this means the customer didn't write any message for more than 30 minutes.
3. When a bot is unable to answer adequately and the interaction is escalated to a live agent. To see how to configure live agent hand off, read [Trigger hand-off to a live agent](how-to-handoff.md).


## Using Power Automate with Power Virtual Agents SKU
In order to use unlimited flow runs in Power Automate, you need to create a flow using the link from within the Power Virtual Agents app. Flow runs created using this template do not accrue to your overall Power Automate quotas. See [working with Power Automate article](how-to-flow.md) for more information.

## Licensing Terms
Visit [Microsoft Volume Licensing](http://www.microsoftvolumelicensing.com/Default.aspx) to quickly access licensing terms, conditions, and supplemental information relevant to the use of Power Virtual Agents
