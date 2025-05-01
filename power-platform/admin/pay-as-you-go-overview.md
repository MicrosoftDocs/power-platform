---
title: Pay-as-you-go plan overview 
description: The pay-as-you-go plan is a new way to pay for Power Apps using an Azure subscription, which allows you to get started without any license commitment.
author: amiyapatr-zz
ms.component: pa-admin
ms.topic: overview
ms.date: 12/01/2024
ms.subservice: admin
ms.author: ampatra
ms.reviewer: sericks 
contributors:
  - ShawnNandiMSFT
search.audienceType: 
  - admin
---
# Pay-as-you-go plan

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

<!-- https://go.microsoft.com/fwlink/?linkid=2173947 -->

Pay-as-you-go is a new way to pay for Power Apps and Power Automate using an Azure subscription, which allows you to get started building and sharing apps without any license commitment or upfront purchasing.

Pay-as-you-go allows you to share apps and Power Automate flows with any user in your organization and then only pay if and when they're used. The pay-as-you-go plan also includes Microsoft Dataverse storage capacity and provides the flexibility to pay for more storage as you need it.

This plan reduces the overhead of license procurement and lets you manage and split costs across business units by using the cost management reporting capabilities of Azure subscriptions. Pricing information for this plan is available [here.](https://go.microsoft.com/fwlink/?linkid=2169167)

Starting December 1, 2024, pay-as-you go is supported for Copilot Studio messages. This allows customers flexibility to only pay for the message capacity they consume at the end of their monthly billing period after use. This new pay-as-you-go meter requires no upfront license commitment, allowing customers to scale usage and ensure business continuity for mission critical business processes.

> [!TIP]
> Check out how T-Mobile is innovating with Power Apps and pay-as-you-go: [T-Mobile adopts Microsoft Power Platform for fast and powerful low-code development](https://customers.microsoft.com/story/1435340411391867976-t-mobile-telecommunications-power-platform).

## Common use cases

- **Widely distributed apps:** Use the pay-as-you-go plan for apps that need to be shared with a large user base with infrequent and/or unpredictable use.

- **Establish usage patterns:** Understand adoption patterns for new apps to determine whether prepaid licenses make financial sense for your business.

- **Flexible purchasing:** Use an Azure subscription for Power Apps and Power Automate to reduce license procurement overhead and consolidate with other service purchases. This is especially helpful if you already have an Azure subscription that you use for other Microsoft services.

## How does it work?

In Power Apps, Power Automate, or the Power Platform admin center, you can link environments to an Azure subscription using a billing policy.

Once an environment is linked to an Azure subscription, the usage of apps and any Dataverse or Microsoft Power Platform request usage that goes above the included amounts are billed against the Azure subscription using [Azure meters](pay-as-you-go-meters.md).

You can [unlink your environment from the Azure subscription](pay-as-you-go-set-up.md#turn-off-pay-as-you-go) at any time and usage will no longer be billed.

:::image type="content" source="media/pay-as-you-go-azure-relationship.png" alt-text="Relationship between Power Platform admin center and Azure Portal":::

## What is a billing plan?

A billing plan creates a link between one or more environments and an Azure subscription. It contains:

- Details of the Azure subscription
- A list of environments that are linked to the Azure subscription

Billing policies can be created in either the Power Platform admin center or within Power Apps and Power Automate. When a billing plan is created, a corresponding Azure resource (called a Power Platform account resource) is created in the Azure subscription associated with that billing plan. Any usage charges for Power Apps, Power Automate, Dataverse, and Microsoft Power Platform requests will appear under the Power Platform account resource on the Azure subscription's bill.

When an environment is linked to Azure via a billing plan, it becomes a *pay-as-you-go environment*. An environment can only be linked to one billing plan at a time. You can change the plan an environment is linked to, or [remove it from a billing plan](pay-as-you-go-set-up.md#turn-off-pay-as-you-go), at any time. When you remove an environment from a billing plan, it goes back to functioning as a regular environment. Usage of Microsoft Power Platform products in that environment will no longer be billed to Azure. 

:::image type="content" source="media/pay-as-you-go-billing-policy-azure-subscription.png" alt-text="Billing policy linked to Azure subscription":::

Billing policies provide flexible options for organizations that are looking to allocate Microsoft Power Platform meter costs across teams and departments. In the example below, the customer has decided to set up Power Platform meter usage for the Marketing team's two environments to be billed to that team's Azure subscription. However, for the Finance team, the customer has decided to set up individual billing policies for the environments of two different subteams (Accounting and Auditing), each of which will be connected to a separate Power Platform account resource. This allows the costs for each subteam to be easily broken out, even though they're both billed to the same Azure subscription. Customers can also use [Azure resource groups](/azure/azure-resource-manager/management/manage-resource-groups-portal) and [Azure tags](/azure/azure-resource-manager/management/tag-resources?tabs=json) to organize their Power Platform account resources and track and allocate spending.

:::image type="content" source="media/pay-as-you-go-billing-policy-azure-subscription-examples.png" alt-text="Billing policy linked to Azure subscription example":::

## Next step

[Pay-as-you-go meters](pay-as-you-go-meters.md)





[!INCLUDE[footer-include](../includes/footer-banner.md)]
