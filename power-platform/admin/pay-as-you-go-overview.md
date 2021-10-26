---
title: "Preview: Pay-as-you-go plan| MicrosoftDocs"
description: About the pay-as-you-go plan which is a new way to pay for Power Apps using an Azure subscription which allows you to get started with building and sharing apps without any license commitment or up-front purchasing.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/26/2021
ms.subservice: admin
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Preview: Pay-as-you-go plan

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

<!-- https://go.microsoft.com/fwlink/?linkid=2173947 -->

Pay-as-you-go is a new way to pay for Power Apps using an Azure subscription which allows you to get started with building and sharing apps without any license commitment or up-front purchasing.

Pay-as-you-go allows you to share a Power Apps app with any user in your organization and then only pay if and when users use that app. The pay-as-you-go plan also includes Dataverse storage capacity and provides the flexibility to pay for additional storage as you need it.

This plan reduces the overhead of license procurement and provides ability to manage and split costs across business units by leveraging the cost management reporting capabilities of Azure subscriptions. Pricing information for this plan is available [here.](https://go.microsoft.com/fwlink/?linkid=2169167)

> [!TIP]
> Check out how T-Mobile is innovating with Power Apps pay-as-you-go: [T-Mobile adopts Microsoft Power Platform for fast and powerful low-code development](https://customers.microsoft.com/story/843531-t-mobile-telecommunications-power-platform).

## Common use cases

1. **Widely distributed apps:** Use for apps that need to be shared with a large user base with infrequent and/or unpredictable use.

2. **Establish usage patterns:** Understand adoption patterns for new apps to determine whether pre-paid licenses make sense.

3. **Flexible purchasing:** Use an Azure subscription for Power Apps to reduce the license procurement overhead and consolidate with other service purchases. This is especially helpful in case you already have an Azure subscription that use for other Microsoft services.

## How does this work?

In Power Apps or the Power Platform admin center you can link environments to an Azure subscription using a billing policy.

Once an environment is linked to an Azure subscription, usage of apps as well as any Dataverse or Power Platform request usage above included amounts is billed against the Azure subscription using [Azure meters](pay-as-you-go-meters.md).

You can [unlink your environment from the Azure subscription](pay-as-you-go-set-up.md#turning-off-pay-as-you-go) at any time and usage will no longer be billed.

:::image type="content" source="media/pay-as-you-go-azure-relationship.png" alt-text="Relationship between Power Platform admin center and Azure Portal":::

## What is a billing policy?

A billing policy creates a link between one or more environments and an Azure subscription. It contains:

- Details of the Azure subscription
- A list of environments that are linked to the Azure subscription

Billing policies can be created in either the Power Platform admin center or within Power Apps. When a billing policy is created, a corresponding Azure resource (called a Power Platform Account resource) is created in the Azure subscription associated with that billing policy. Any usage charges for Power Apps, Dataverse, and Power Platform Requests will appear under the Power Platform Account resource on the Azure subscription's bill.

When an environment is linked to Azure via a billing policy it becomes a *pay-as-you-go environment*. An environment can only be linked to one billing policy at a time. You can change the billing policy an environment is linked to, or [remove it from a billing policy](pay-as-you-go-set-up.md#turning-off-pay-as-you-go), at any time. When you remove an environment from a billing policy it goes back to functioning as a regular environment, and usage of Power Platform products in that environment will no longer be billed to Azure. 

:::image type="content" source="media/pay-as-you-go-billing-policy-azure-subscription.png" alt-text="Billing policy linked to Azure subscription":::

Billing policies provide flexible options for organizations looking to allocate Power Platform meter costs across teams and departments. In the example below, the customer has decided to set up Power Platform meter usage for the marketing team's environments to be billed to the marketing team's Azure subscription. For the finance team, the customer has decided to setup two different billing policies (each of which will be connected to a separate Power Platform account resource) so that the costs for each sub team within the Finance team (Accounting and Auditing) can be easily broken out even though they are both billed to the same Azure subscription. Customers can also leverage [Azure resource groups](/azure/azure-resource-manager/management/manage-resource-groups-portal) and [Azure tags](/azure/azure-resource-manager/management/tag-resources?tabs=json) to organize their Power Platform account resources and track and allocate spending.

:::image type="content" source="media/pay-as-you-go-billing-policy-azure-subscription-examples.png" alt-text="Billing policy linked to Azure subscription example":::

## Next step

[Preview: Pay-as-you-go meters](pay-as-you-go-meters.md)


### See also  





[!INCLUDE[footer-include](../includes/footer-banner.md)]
