---
title: Boost conversations (preview)
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



# Boost conversations (preview)

[!INCLUDE [AI tech disclosure with Bing Search](includes/disclosure-ai-preview-bing-addendum.md)]

When designing and creating a chatbot, you'll likely encounter situations where your bot users ask questions that your bot doesn't have an answer for. However, by utilizing the boosted conversations in Power Virtual Agents, your bot can find and present information from an external source - even if you haven't created a topic for it.

In the past, when a bot couldn't determine a user's intent, it asked the user to rephrase their question. If, after two prompts, the bot still couldn't determine the user's intent, the bot escalated to a live agent by using the [system **Escalate** topic](authoring-system-fallback-topic.md).

Now, before involving a live agent, the bot uses natural language processing to:
- Parse what a user types to determine what they're asking
- Find, collate, and parse relevant information from a specified URL (for example, your company's website) with Bing Search
- Create a plain language response and then deliver that to the bot user





## Prerequisites
- You must be using the [preview version of Power Virtual Agents](preview/overview.md), and the bot type must be **Preview**. Preview chatbots have **(preview)** added to their name. When you create a new bot, select **Try the unified canvas (preview)**.  

    :::image type="content" source="media/nlu-authoring/nlu-boost-preview-bots.png" alt-text="Screenshot of the list of chatbots showing bots with preview added to their names.":::

- You must enable the **Boost conversations** option for each bot.

- Review the [AI response generation training, model, and usage notes](#ai-response-generation-training-model-and-usage-notes) and [Learn more about Azure OpenAI](/legal/cognitive-services/openai/transparency-note)

## Boost your bot's reach

> [!NOTE]
> If you don't have a Power Virtual Agents account, you can go to the [Power Virtual Agents introduction website](https://aka.ms/TryPVA), select **Start free**, and then sign in with your work email address. Also see the [Quickstart guide for creating a Power Virtual Agents bot](fundamentals-get-started.md).
>  
> Personal Microsoft accounts aren't supported. 
>  
> Supported browsers include Microsoft Edge, Chrome, and Firefox.

1. Go to the [Power Virtual Agents home page](https://web.powerva.microsoft.com/). 

1. In the side navigation menu select **Create**. You can also select **Create a bot** on the **Home** page or **New chatbot** from the **Chatbots** page.

1. Select **Try the unified canvas (preview)**. Preview chatbots have **(preview)** added to their name in the list of bots.
    
1. Enter a name for the bot.

3. Provide a website you'd like the bot to use for generating answers. You can't use websites or URLs that require authentication or that aren't indexed by Bing, and that aren't publicly viewable.

    > [!WARNING]
    >
    > The AI works best when you specify a top-level domain as the URL. Entering the URL for a search engine, such as *www.bing.com*, can return unexpected or undesirable responses.
    > 
    > If the URL you specify is more than two levels deep into the domain (it has more than two forward slashes (/), you'll see an error and won't be able to continue.
    >
    > Your URL can have a trailing forward slash, and this won't be included in the limit of two slashes. For example, the URLs *www.contoso.com*, *www.fabrikam.com/engines/rotary*, or *www.fabrikam.com/engines/rotary/* are valid. The URL *www.fabrikam.com/engines/rotary/dual-shaft* is not.
    >
    > You'll also see an error if you include non-standard characters in the URL, such as a period (.).
    >  
    > 

    :::image type="content" source="media/nlu-authoring/responses-create-preview-bot.png" alt-text="Screenshot of the bot creation screen with the preview option highlighted.":::

3. Click **Create**.

After your bot is created and ready for you to use, it'll open to the bot's **Overview** page. From here, you can confirm that **Boost conversations** is enabled, or choose to change the URL you want to use.

You can also change the URL, disable **Boost conversations**, or change the level of content moderation in the settings for the bot:

1. With a bot open, expand **Settings** on the side navigation pane and select **AI Capabilities**.

    1. Under **Boost conversational coverage (preview)**, use the checkbox for **Boost conversations** to enable or disable the capability.

    1. In the field under the checkbox, add or change the URL. The same limits apply for the URL as when enabling the capability when you create a bot.

    :::image type="content" source="media/nlu-authoring/responses-enable.png" alt-text="Screenshot of the Power Virtual Agents AI capabilities page with Boost conversations enabled and highlighted.":::

    1. Under **Bot content moderation**, select the level you want for your bot.

1. Select **Save** at the top of the **AI capabilities** page.



## Test your bot's boosted conversational reach 

1. Click on **Test your bot** at the bottom of the side navigation pane. 
1. In the **Test bot** panel, ask the bot questions that take advantage of **Boost conversations** capability.

During the Preview of this feature you'll need to contact Microsoft Support if you want to publish a bot that has **Boost conversations** enabled.


> [!TIP]
>  
> You can provide feedback on how well the AI does by selecting the "thumbs up" or "thumbs down" icon at the bottom of the **Describe it** panel.  
> If you select the thumbs down icon, you can also include more verbose feedback. We'll use this feedback will to improve the quality of the AI.

## Limitations during the preview

### Publishing

During this preview, you won't be able to publish bots that have **Boost conversations** enabled. 

If you'd like to publish a bot that has **Boost conversations** enabled, you'll need to ask your admin to start a support request. We'll review your request and get in touch with your admin. 

### Quotas

Quotas are default constraints applied to chatbots that limit how often messages can be sent to the chatbot. The purpose of quotas is to throttle the client's service load, which protects a service from being overloaded and the client from unexpected resource usage. During preview, bots with "Boost conversations" enabled will have a limit on the amount of queries they can make that reach out to the URL you specified.

During the preview, bots with **Boost conversations** enabled will have a limit on the amount of queries they can make that reach out to the URL you specified. Normal conversations that use bot topics follow the [usual quotas and limitations](requirements-quotas.md#quotas)

### Pricing

During the preview, the use of the boosted conversations capability is not billable and will follow the [usual quotas and limitations](requirements-quotas.md#quotas).

## Internal document search preview

Early access to the internal document search capability preview will open shortly.

The internal document search capability will allow your chatbot to return answers generated from your internal knowledge sources.

When early access is open, a link to apply will be published here. You'll also be able to sign up from within the **AI Capabilities** page.

As part of your application, you'll need to confirm that you can provide regular feedback on the feature, and that you are willing to sign a marketing and PR agreement. You should only apply if you have a use case for how you would use the feature in a production scenario.




## AI response generation training, model, and usage notes

This FAQ answers common questions about the AI that is used when creating new topics, or modifying existing topics, in Power Virtual Agents.


### Does the capability produce perfect responses?   
Responses generated by the **Boost conversations** capability are not always perfect and can contain mistakes. 

The system is designed to query knowledge from the website of your choosing and to package relevant findings into an easily consumable response. However, it's important to keep in mind some characteristics of the AI that may lead to unexpected responses:

- The corpus upon which the model has been trained doesn't include data created after 2021.  
  We have implemented mitigations to prevent the model from using its training corpus as a source for answers, however it is possible for answers to include content from websites other than the one you selected. 

- The system does not perform an accuracy check, so if the selected website contains inaccurate information this could be shown to your chatbot users. We have implemented mitigations to filter out irrelevant and offensive responses, and the feature is designed not to respond when offensive language is detected. These filters and mitigations are not foolproof.  
  You should always test and review your bots before publishing them. During the preview, your admin will need to contact Microsoft support to enable publication.


### How was the capability evaluated? What metrics are used to measure performance?   

The capability was evaluated on a collection of manually curated question-and-answer datasets, covering multiple industries. 

Additional evaluation was performed over custom datasets for offensive and malicious prompts and responses.

## Fairness and broader impact

### Will the capability work as well using languages other than  English?

The system only supports English. Inaccurate responses may be returned when users converse with the system in languages other than English.

## Privacy

### What data does the capability collect? How is the data used?
The capability collects user prompts, the responses returned by the system, and any feedback you provide. 

We use this data to evaluate and improve the quality of the capability. More information on what data is collected is available in the [preview terms](https://go.microsoft.com/fwlink/?linkid=2224133). 

[!INCLUDE[footer-include](includes/footer-banner.md)]