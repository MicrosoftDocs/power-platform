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

Power Virtual Agents are licensed using a capacity model. You can purchase capacity (Conversations) for Power Virtual Agents which will give your organization  number of conversations to use. To give users access to the product, you will need to assign them Power Virtual Agents USL. 

When you purchase Virtual Agents license, you also get entitlements for Microsoft Flow to extend your bot and for CDS to host the content of your bot.

## List of Power Virtual Agents licenses

| Plan          | Number of conversations  | Microsoft Flow           | CDS entitlement                |
| ------------- |:------------------------:| ------------------------:| ------------------------------:|
| Base SKU* **  | 2,000                    | Unlimited to extend bots | 10 GB DB, 20 GB File, 2 GB log |
| USL*          | N/A                      |                      N/A |            1 trial environment |
| Add on SKU**  | 1,000                    |                      N/A |                            N/A |
| Viral trial   | N/A                      |                Flow free |           2 trial environments |

* Users need to have both licenses to access Power Virtual Agents
** Entitlements are pooled across the entire organization. Any user who has a USL can use the entitlements


## Managing liceneses using Microsoft Admin Portal
You can pruchase Power Virtual Agents licenses for your organization from the [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx)

### Purchasing Base and USL SKUs
1. Navigate to [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx)
2. On the left navigation pane, select **Billing -> Purchase services**
3. Search for Power Virtual Agents
4. Select Power Virtual Agents Base and Power Virtual Agents USL
5. On the confirmation screen, select the number of licenses you would like to purchase
6. Complete the check out process

### Give indidvidual users access
1. Navigate to [Microsoft 365 admin center](https://admin.microsoft.com/admin/default.aspx)
2. On the left navigation pane, select **Users -> Active users**
3. Select users you would like to give access to and select **Manage product licenses**
4. Select **Power Virtual Agents User License** and click **Save changes**

!NOTE To simplify User License management you can assign licenses to an AAD security group. [Learn more](https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/licensing-groups-assign)

## Trial plans
Users in your organization can trial Power Virtual Agents for 60 days.
You can choose to disable or enable the ability for users in your organization to sign up for a trial by modifying the **AllowAdHocSubscriptions** flag in your organization settings. [Learn more](https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/directory-self-service-signup). 
