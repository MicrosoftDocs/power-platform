---
title: "Automate topic creation (contains video)"
description: "Automate the creation of topics in Power Virtual Agents bots by using support topics discovered by Dynamics 365 Customer Service Insights."
keywords: "Customer Service Insights, PVA, CSI"
ms.date: 9/22/2020

ms.topic: article
author: iaanw
ms.author: iawilt
ms.custom: "advanced-authoring, CSI, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Create bot topics from Customer Service Insights

If you use [Dynamics 365 Customer Service Insights](/dynamics365/ai/customer-service-insights/overview), you can automatically create new [topics](authoring-create-edit-topics.md) in Power Virtual Agents based on your existing [Customer Service Insights support topics](/dynamics365/ai/customer-service-insights/topics-page).

You should review [recommendations for identifying topics for automation](/dynamics365/ai/customer-service-insights/automate-topics#identify-topics-for-automation) in the Customer Service Insights documentation before you begin.

>
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4n7pD]
>

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).
- A valid license to access Power Virtual Agents. Go to [https://aka.ms/TryPVA](https://aka.ms/TryPVA) for more information and to sign up for a trial.
- A [bot created in Power Virtual Agents](authoring-first-bot.md).

## Automate topics from the topic details page

After reviewing topic details and identifying a candidate for automation, you can automate the topic from the topic details page:

1. In the topic details page, select **Automate** at the top.

    :::image type="content" source="media/advanced-create-topics-from-csi/automate-topic-details.png" alt-text="Automate topics from topic details page." border="false":::

1. Customer Service Insights opens a new browser tab and goes to the [Power Virtual Agents web app](https://web.powerva.microsoft.com), where it creates a new topic in the currently active bot.

    The **Name** and **Trigger phrases** are prefilled from the topic you selected for automation.

    Customer Service Insights prefills **Trigger phrases** with non-duplicated case titles from the most relevant cases (up to three cases).

1. Review the topic name and trigger phrases, and follow the other steps in the [Create custom topics for your bot](authoring-create-edit-topics.md) article to complete the creation of your bot topic.

## Automate topics from the Topics page

You can also automate topics from the Topics page by hovering over the topic you want to automate in the topic list, then selecting the **Automate** icon.

:::image type="content" source="media/advanced-create-topics-from-csi/automate-topic-list.png" alt-text="Automate topics from Topics page." border="false":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
