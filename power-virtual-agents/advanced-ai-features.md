---
title: "AI features for Teams and Classic bots (contains video)"
description: "Use advanced AI features in Microsoft Copilot Studio to improve how your bots interact with your bot users. These features are available in the Teams app for Microsoft Copilot Studio and for Classic bots."
keywords: "PVA, AI, advanced, topic intent, intent triggering"
ms.date: 07/25/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: peterswimm
ms.custom: "advanced-authoring, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# AI features for Teams and Classic bots

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

With bots in the Microsoft Copilot Studio app in Teams or **Classic** bots in the Copilot Studio web app, you can enable extra features that improve the core AI.

Copilots include next-generation AI features that supersede or replace the features listed in this article.

You can use these AI features for backwards compatibility with older bots and support some scenarios. In most cases, you should [create or convert your bots with the unified authoring canvas](unified-authoring-conversion.md) to get the best implementation of multiple AI technologies.

> [!IMPORTANT]
> [Generative AI features](nlu-gpt-overview.md), such as [generative answers](nlu-boost-conversations.md) and [natural language understanding](nlu-authoring.md), are only available if you create or convert a bot [using the unified authoring canvas](unified-authoring-conversion.md#what-is-new-or-has-been-updated-in-the-latest-microsoft-copilot-studio) in the Copilot Studio web app.

## Prerequisites

You can use the AI features if:

- Your bot is marked **Classic**.
- Or, a bot you created in the Teams app.
- You created your bot before May 23, 2023.

[Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

## AI models in Microsoft Copilot Studio - background

:::image type="content" source="media/advanced-ai-features/nlu-models.png" alt-text="Screenshot showing how conversational AI is infused in each step of the bot building journey." lightbox="media/advanced-ai-features/nlu-models.png":::

Copilot Studio hosts multiple AI models and AI capabilities on a single service. The core feature is a transformer-based natural language understanding (NLU) model.

Traditionally, intent triggering—how an AI model determines the intent of a question  by using NLU—is formalized as a multi-class classification problem. The model is highly associated with known categories. But any change in these categories means you need to build a new AI model.

Copilot Studio, however, employs a language understanding model that uses an example-based approach, powered by a deep neural model. This type of large-scale model only needs to be trained once, with large amounts of data, using AI supercomputing. The AI is then used with a few examples without further training.

This model is part of the [AI at Scale](https://innovation.microsoft.com/ai-at-scale) initiative by Microsoft. The way AI is developed and used is changing. In Copilot Studio, this model allows for an intuitive way for copilot makers to create content confidently, without having to involve AI experts.

With the Copilot Studio model, you provide a few examples when you craft trigger phrases for a topic. The examples for a single topic are usually 5 to 10 phrases.

Shorter trigger phrases are better, and you should aim for 2 to 10 words per phrase. Trigger phrases should be semantically different. For example, changing a single verb or noun could be enough to expand a topic's coverage.

Other changes or additions between phrases can be:

- Articles such as _the_, _a_, or _an_
- Capitalization
- Contractions such as _you're_ or _don't_

Plurals don't improve the triggering because contractions are already accounted for in the AI model.

Entities used in related topics automatically identify in user intents when matched with their trigger phrases. For example, the user intent "I want to book a ticket to Boston" matches with the trigger phrase "I want to book a ticket to Paris."

### Topic overlap detection

Topic overlap detection helps improve topic triggering accuracy by finding overlaps between topics. Resolving topic overlaps reduces the copilot's need to ask clarifying questions before triggering a topic.

> [!TIP]
> Topic overlap detection is in general availability and supports [all languages supported in Microsoft Copilot Studio](authoring-language-support.md).

[After you enable advanced AI capabilities](#enable-or-disable-generative-ai), you can view a list of overlapped topics. In the navigation menu, select **Analytics**, then select the **Topic triggering** tab.

:::image type="content" source="media/advanced-ai-features/overlapped-topics.png" alt-text="Screenshot showing the overlapping topics with their similarity scores.":::

The list shows each overlapping topic along with a similarity score. This score represents the overall overlapped status for a topic and the number of topics that overlap with the listed one. The AI determines the similarity score as it evaluates how semantically similar the overlapping trigger phrases are to each other. A higher score means a topic has one or more trigger phrases close to another topic's trigger phrases.

You can sort the list by its similarity score, topic name, or number of trigger phrase overlaps.

If you select an item in the list, the **Topic overlap details** pane opens.

:::image type="content" source="media/advanced-ai-features/topic-overlap-details.png" alt-text="Screenshot of the Topic overlap details pane showing overlaps related to Microsoft 365 language topics.":::

In this example, there's one trigger phrase in the "Languages supported in Microsoft 365" topic (_For which languages is Microsoft 365 available?_) that semantically overlaps with a trigger phrase in the "Use Microsoft 365 in other languages?" topic (_Can I use Microsoft 365 in languages other than the one I originally purchased?_). Here, the AI determines that both trigger phrases are semantically similar. The phrases have similar sentence structure, words, and grammar.

Using semantically similar trigger phrases for two different topics can lead to confusion. The bot might not know which topic to open and asks follow-up questions to the bot user.

Identifying semantically similar trigger phrases can also help you consolidate _topics_ if they're too similar. You can edit the topics to make them more distinct.

On the **Topic overlap details** pane, you can select the link to go directly to a topic. You can also make changes to the trigger phrase or delete it. Select **Save** to apply any changes.

After you save your changes, the overlapping status automatically refreshes. You can manually refresh the topic overlap status, using the refresh icon in the **Overlapping topics** section.

:::image type="content" source="media/advanced-ai-features/refresh-overlaps.png" alt-text="Screenshot of the refresh icon, which looks like an arrow bent into a circle.":::

### Topic suggestion from chat transcripts (preview)

This feature analyzes sessions between your bot and users and gives suggestions based on unmatched user input.

[Once enabled](#enable-or-disable-generative-ai), go to **Analytics** > **Topic triggering (preview)**. A list of potential topics are shown with the number of times a query about this topic was made by users of the bot. The top 200 suggestions are shown.

:::image type="content" source="media/advanced-ai-features/topic-suggestions.png" alt-text="Screenshot of the Topic suggestions tile showing a list of suggestions.":::

The topic suggestion analyzer automatically runs once every one to two hours. The analyzer scans all new queries made since the analyzer last ran. The analyzer groups together queries that don't match an existing topic and shows them in the list. Your bot needs at least 100 new conversations from the last time any suggestion was generated to trigger the process. Suggestions with more than three user sessions are shown.

When you select an item in the suggestion list, a topic suggestion window appears, showing the topic with some suggested trigger phrases. The suggested trigger phrases are based on queries made by bot users that aren't matched to an existing topic.

You can choose to delete the entire suggested topic, for example if the topic is irrelevant to the bot, or add it to your list of topics by selecting **Add to topics**.

:::image type="content" source="media/advanced-ai-features/topic-editing.png" alt-text="Screenshot of the topic editing window.":::

<!-- 
### Conversation personalization (preview)

> [!IMPORTANT]
> The conversation personalization (preview) capability will be **retired on 28 September 2023**. From that date onwards, you won't be able to enable this capability in any new or existing bots. The capability will also be disabled for any existing bots that have it enabled.
>  
> The unified authoring canvas includes a raft of improvements to the types of AI used by Microsoft Copilot Studio. Wherever possible, we recommend you [create and convert your bots with the unified authoring canvas](unified-authoring-conversion.md).

For this capability, the bot reuses information from Microsoft Graph and Microsoft Entra ID throughout the conversation. This feature allows the bot to use already existing information to enhance and personalize future conversations. For example, if a user mentions a name, email, or zip code these properties are stored and used in later conversations without having to reprompt the user.

Specifically, with this feature enabled, when the bot asks questions such as those in the following table, the corresponding user information is pulled from Microsoft Graph and Microsoft Entra ID (for authenticated users) and provided as prompts for the user to choose as an option.

:::image type="content" source="media/advanced-ai-features/improvements-authoring.png" alt-text="Screenshot of the triggering improvements highlighted as part of topic authoring.":::

| Sample bot questions | User property automatically filled from Microsoft Graph or Microsoft Entra ID |
| -------------------- | ------------------- |
| - `Where do you live?`</br>- `For assistance with this matter you'll need to provide your address.`</br>- `Thank you for that. Please give me 2-3 minutes to review your previous case. May I know your address?` | Address |
| - `OK. I'll need you to enter your annual income in order to assist.`</br>- `OK. Can I get your annual income so I can help with that?` | Annual income  |
| - `I'll help if I can. Would you tell me when you were born please (day/month/year)?`</br>- `What is your date of birth?`</br>- `Could you give me your date of birth, please?` | Date of birth |
| - `I can help you out with that. What's your business phone number so I can go ahead?`</br>- `Will proceed if you please provide your work phone number to contact you?` | Business phone number |
| - `Can you supply your city of residence?`</br>- `Please provide your city of residence.`</br>- `I agree. I'd like to know your city of residence to continue. Please tell me what city you're in.`</br> | City of residence |
| - `OK, no problem. Can you tell me the country where you live?`</br> - `Let me assist you with your concern regarding your DVD. Before we proceed, please provide me with the country you are in.`</br> | Country of residence |
| - `For assistance with this matter you'll need to provide your email address.`</br>- `Tell me the e-mail address where I can contact you.` | Email address |
| - `Please tell me: what is your fax number?`</br>- `Alright. Go ahead and enter your telefax number for me please.` | Fax number |
| - `I'd be glad to help you with that. By the way, may I ask for your first name so that I can address you properly?`</br>- `Please enter your name for me.`</br>- `What's your first name?` | First name  |
| - `For assistance with this matter you'll need to provide your gender.`</br>- `Sure, I can assist with that. What is your gender?`</br>- `Please enter your gender.`</br> | Gender |
| - `What is your home phone number?`</br>- `Please provide your home phone number.`</br> | Home phone number |
| - `I'll help if I can. Would you tell me your job title please?`</br>- `Sure, I'd be glad to help. Please enter your career title to proceed. | Job title |
| - `Might I know your last name in order to proceed?`</br>- `I see. Allow me to review this case number. Can you also tell me your last name for me to address you properly?` | Last name |
| - `I'll see if I can help. Could you please enter your director's name?`</br>- `I'll help you if I can. could you tell me your principal's name, please?`</br>- `What is your manager's name?`</br>- `Please share the name of your supervisor.` | Manager's name |
| - `Wondering if you would please provide your conjugal status?`</br>- `To assist you I'll need you to enter your marital status.` | Marital status |
| - `Wondering if you would please provide your middle name?`</br>- `I'd be glad to help you with that. By the way, may I ask for your middle name so that I can address you properly?` | Middle name |
| - `Could you please provide me with your mobile phone number?`</br>- `It's not a problem. I'll just need your cell phone number please.` | Mobile phone number |
| - `I'll need your nickname please?`</br>- `It's my pleasure to assist. Can you inform me of your nickname?` | Nick name |
| - `Sure. To help with that, I'll need you to specify how many children you have please.`</br>- `Please indicate the number of children you have.` | Number of children |
| - `I'll see if I can help. Will you be able to enter your partner's full name?`</br>- `Please tell me your spouse's first name.`</br>- `Can you give me the first name of your husband or wife, please?` | Spouse/partner name |
| - `Can you please tell me what your state of residence is?`</br>- `I can help you out with that. What's your state of residence so I can go ahead?` | State/province of residence                                         |
| - `Wondering if you would please provide your zip code?`</br>- `I can help you out with that. What's your zip code so I can go ahead?` | Zip code |
-->

### Enable or disable Generative AI

> [!IMPORTANT]
> You can't enable these features for bots _not_ marked **Classic**. This includes any bots created (or converted) in the web app after May 23, 2023, or any bots that aren't created with the unified authoring canvas.
>  
> The unified authoring canvas includes improvements to the types of AI used by Microsoft Copilot Studio. We recommend you [create and convert your bots with the unified authoring canvas](unified-authoring-conversion.md).

To enable these older AI capabilities in Microsoft Copilot Studio:

1. Open your bot:
   - In the web app, the bot must be marked with **Classic**.
   - In the Teams app, the bot can be any bot.
1. From the navigation menu, select **Generative AI**.
1. For each feature, select the checkbox to turn it on or off.
1. Select **Save** at the top of the tab.

:::image type="content" source="media/advanced-ai-features/enable-disable-ai.png" alt-text="Screenshot showing where to enable or disable Generative AI." lightbox="media/advanced-ai-features/enable-disable-ai.png":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
