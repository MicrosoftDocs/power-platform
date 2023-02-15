---
title: Answers
description: Desc for answers
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

# How to use GPT AI to generate a bot's responses (Preview)



[!INCLUDE [Preview disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

When designing and creating a chatbot, you'll likely encounter situations where your bot users ask questions that your bot doesn't have an answer for. However, by utilizing the GPT-based AI in Power Virtual Agents, your bot can find and present information from an external source - even if you haven't created a topic for it.

## Prerequisites
- You must enable the **Boost conversations** option for each bot.
- You must be using the preview version of Power Virtual Agents, and the bot type must be **Preview**. Preview chatbots have **(preview)** added to their name. When you create a new bot, select **Try the unified canvas (preview)**.
- Review the [GPT AI response generation training, model, and usage FAQ](gpt-answers-faq.md).

## Use GPT AI to provide answers


1. Open or create a preview bot that you want to configure. Preview chatbots have **(preview)** added to their name in the list of bots. If you're creating a new bot, ensure you select **Try the unified canvas (preview)**.


    :::image type="content" source="media/responses-create-preview-bot.png" alt-text="Screenshot of the Power Virtual Agents AI capabilities page with Boost conversations enabled and highlighted.":::

1. Click **Create**.

3. Expand the **Settings** tab, then select **AI capabilities**.

1. Under **Boost conversational coverage (preview)**, select the checkbox for **Boost conversations**.

1. In the field under the checkbox, add a publicly available URL. You can't use websites or URLs that require authentication or that aren't indexed by Bing, and aren't publicly viewable.

    :::image type="content" source="media/responses-enable.png" alt-text="Screenshot of the Power Virtual Agents AI capabilities page with Boost conversations enabled and highlighted.":::

> [!TIP]
>
> The AI works best when you specify a top-level domain as the URL. 
> 
> If the URL you specify is more than two levels deep into the domain (it has more than two forward slashes (`/`)), you'll see an error and won't be able to select **Save**. 
>
> Your URL can have a trailing forward slash, and this won't be included in the limit of two slashes. For example, the URLs `www.contoso.com`, `www.fabrikam.com/engines/rotary`, or `www.fabrikam.com/engines/rotary/` are valid. The URL `www.fabrikam.com/engines/rotary/dual-shaft` is not.

1. Select **Save** at the top of the **AI capabilities**.

You can test the AI-generated responses in the **Test bot** panel.

> [!TIP]
>  
> You can provide feedback on how well the AI does by selecting the "thumbs up" or "thumbs down" icon at the bottom of the **Describe it** panel.  
> If you select the thumbs down icon, you can also include more verbose feedback. We'll use this feedback will to improve the quality of the AI.
>  
> 

### Publish a bot with AI-generated responses enabled

During the Preview of this feature you'll need to contact Microsoft Support if you want to publish a bot that has **Boost conversations** enabled.





[!INCLUDE[footer-include](includes/footer-banner.md)]
