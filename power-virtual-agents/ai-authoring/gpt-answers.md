---
title: Use GPT AI to generate a bot's responses (preview)
description: Provide answers and information for your bot users, even if you haven't created a topic for their issue.
keywords: "PVA"
ms.date: 2/8/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: 
manager: shellyha
ms.collection: virtual-agent
ms.service: power-virtual-agents
searchScope:
  - "Power Virtual Agents"
---

# Use GPT AI to generate a bot's responses (preview)

[!INCLUDE [Preview disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

When designing and creating a chatbot, you'll likely encounter situations where your bot users ask questions that your bot doesn't have an answer for. However, by utilizing the GPT-based AI in Power Virtual Agents, your bot can find and present information from an external source - even if you haven't created a topic for it.

## Prerequisites
- Review the [GPT AI response generation training, model, and usage FAQ](gpt-answers-faq.md).
- You must be using the preview version of Power Virtual Agents, and the bot type must be **Preview**. Preview chatbots have **(preview)** added to their name. When you create a new bot, select **Try the unified canvas (preview)**.
- You must enable the **Boost conversations** option for each bot.

## Use GPT AI to provide answers

1. Create a preview bot. Select **Try the unified canvas (preview)**. Preview chatbots have **(preview)** added to their name in the list of bots.

    :::image type="content" source="media/responses-create-preview-bot.png" alt-text="Screenshot of the Power Virtual Agents AI capabilities page with Boost conversations enabled and highlighted.":::
    
1. Enter a name for the bot.

3. Provide a website you'd like the bot to use for generating answers.

3. Click **Create**.

3. After the bot is created, expand the **Settings** tab on left pane, then select **AI Capabilities**.

1. Under **Boost conversational coverage (preview)**, ensure that you've selected the checkbox for **Boost conversations**.

1. In the field under the checkbox, add a publicly available URL, if one is not there. You can't use websites or URLs that require authentication or that aren't indexed by Bing, and aren't publicly viewable.

    :::image type="content" source="media/responses-enable.png" alt-text="Screenshot of the Power Virtual Agents AI capabilities page with Boost conversations enabled and highlighted.":::

1. Select **Save** at the top of the **AI capabilities**.

> [!TIP]
>
> The AI works best when you specify a top-level domain as the URL. 
> 
> If the URL you specify is more than two levels deep into the domain (it has more than two forward slashes (`/`)), you'll see an error and won't be able to select **Save**. 
>
> Your URL can have a trailing forward slash, and this won't be included in the limit of two slashes. For example, the URLs `www.contoso.com`, `www.fabrikam.com/engines/rotary`, or `www.fabrikam.com/engines/rotary/` are valid. The URL `www.fabrikam.com/engines/rotary/dual-shaft` is not.

## Test the bot with AI-generated responses enabled

1. Click on **Test your bot** at the bottom of the the left pane. 
1. In the **Test bot** panel ask bot questions that take advantage of the AI capability you enabled.

During the Preview of this feature you'll need to contact Microsoft Support if you want to publish a bot that has **Boost conversations** enabled.


> [!TIP]
>  
> You can provide feedback on how well the AI does by selecting the "thumbs up" or "thumbs down" icon at the bottom of the **Describe it** panel.  
> If you select the thumbs down icon, you can also include more verbose feedback. We'll use this feedback will to improve the quality of the AI.

### Limitations during the preview

#### Publishing

During Power Virtual Agents preview, you won't be able to publish bots that have **Boost conversations** enabled. <!-- we need to call this out in the publishing topic, and the preview limitations topic -->

If you'd like to publish a bot that has **Boost conversations** enabled, you'll need to ask your admin to start a support request. We'll review your request and get in touch with your admin. 

#### Quotas

Quotas are default constraints applied to chatbots that limit how often messages can be sent to the chatbot. The purpose of quotas is to throttle the client's service load, which protects a service from being overloaded and the client from unexpected resource usage. During preview, bots with "Boost conversations" enabled will have a limit on the amount of queries they can make that reach out to the URL you specified.

During preview, bots with "Boost conversations" enabled will have a limit on the amount of queries they can make that reach out to the URL you specified. Normal conversations that use bot topics follow the [usual quotas and limitations](../requirements-quotas#quotas)

[!INCLUDE[footer-include](includes/footer-banner.md)]
