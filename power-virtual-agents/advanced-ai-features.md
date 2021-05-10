---
title: "Advanced AI features"
description: "Use advanced AI features in Power Virtual Agents to improve how your bots interact with your bot users."
keywords: "PVA, AI, advanced, topic intent, intent triggering"
ms.date: 3/1/2021
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "advanced-authoring, ceX"
ms.collection: virtual-agent
---
# AI capabilities in Power Virtual Agents

## AI models in Power Virtual Agents - background

![In Power Virtual Agents conversational AI is infused in each step of the bot building journey wrapped in an experience friendly to business users.](media/advanced-ai-features/nlu-models.png)

Power Virtual Agents hosts multiple AI models and AI capabilities on a single service, the core of which is a transformer-based natural language understanding (NLU) model.

Traditionally, intent triggering (how an AI model determines the intent of a question posed to it, by using NLU to understand what a user is asking) is formalized as a multi-class classification problem, in which the model is highly associated with known categories; any change to these categories will result in the need to build a new AI model. 

Power Virtual Agents, however, employs a language understanding model that uses an example-based approach, powered by a deep neural model. This type of large-scale model only needs to be trained once with large amounts of data using AI supercomputing, and can then be used for specific tasks with few examples without further training. The use of this model is part of the [AI at Scale](https://innovation.microsoft.com/en-us/ai-at-scale) initiative by Microsoft, and means the way AI is developed and used is changing. Specifically for Power Virtual Agents, the use of this model allows for an intuitive way for bot makers to work on their bot content confidently, without having to involve AI experts. 

The use of this type of model means that in Power Virtual Agents, when you craft trigger phrases for a topic, you only need to provide a few examples, usually in the range of five to 10 phrases for a single topic. 
Shorter trigger phrases are better, and you should aim for two to 10 words. You just need to make sure trigger phrases are semantically different: changing a single verb or noun could be enough to expand a topic's coverage. Adding things like new articles (changing or adding 'the' or 'a' or 'an'), changing capitalization, adding contractions (you're or don't), or adding plurals won't improve the triggering because contractions are already accounted for in the AI model.

These tips for creating tooltips are described in the tooltip associated with the **Trigger phrases** section on a topic's **Details** page.

![Screenshot of the trigger phrase section in the topic details page.](media/advanced-ai-features/trigger-phrase-tooltip.png)

There are some specific features that further improve how the AI in Power Virtual Agents understands what your bot users are asking, and how the AI provides answers.


>[!NOTE]
>The AI capabilities listed in this topic are in preview, available to bots created with English as the set language.


## Topic overlap detection (preview)

Topic overlap detection helps improve topic triggering accuracy by finding overlaps between topics. Resolving topic overlaps can help reduce the need for the bot to ask clarifying questions before triggering a topic.

[Once enabled](#enable-or-disable-ai-capabilities), go to **Analytics** on the side navigation pane, then go to the **Topic triggering (preview)**, where a list of overlapped topics will be displayed.

:::image type="content" source="media/advanced-ai-features/overlapped-topics.png" alt-text="Screenshot showing the overlapping topics tile lists topics with their similarity score.":::

The list shows each overlapping topic along with a similarity score, which represents the overall overlapped status for a topic, and the number of topics that overlap with the listed one.

You can sort the list by its similarity score, topic name, or number of trigger phrase overlaps.

If you click on an item in the list, the **Topic overlap details** pane will open.

:::image type="content" source="media/advanced-ai-features/topic-overlap-details.png" alt-text="Screenshot of the Topic overlap details pane showing overlaps related to Microsoft 365 language topics.":::

In this example, there's one trigger phrase in the "Languages support in Microsoft 365?" topic (*For which languages is Microsoft 365 available?*) that semantically overlaps with a trigger phrase in the "Use Microsoft 365 in other languages?" topic (*Can I use Microsoft 365 in languages other than the one I originally purchased?*). Here, the AI has determined that both trigger phrases are semantically similar (they contain similar phrases, words, and grammar).

Using semantically similar trigger phrases for two different topics can lead to confusion as the bot may not know which topic to open, and will need to ask follow-up questions to the bot user.

Identifying semantically similar trigger phrases can also help you determine if you have topics that themselves are similar and could be consolidated to simplify the bot authoring process, or edited to make the topics more distinct.

On the **Topic overlap details** pane, you can select the link to go directly to the specific topic. You can also make changes to the trigger phrase (or delete it) directly on the **Topic overlap details** pane. Select **Save** to apply any changes.

After you save the changes in the **Topic overlap details** pane, the overlapping status will automatically be refreshed. You can always manually refresh the topic overlap status by selecting the refresh button on the topic overlap UI.

:::image type="content" source="media/advanced-ai-features/refresh-overlays.png" alt-text="Screenshot of the refresh icon, which looks like an arrow bent into a circle.":::

## Topic suggestion from chat transcripts (preview)

This feature analyzes sessions between your bot and users and surfaces suggestions for you based on unmatched user input.

[Once enabled](#enable-or-disable-ai-capabilities), go to **Analytics** on the side navigation pane, then go to the **Topic triggering (preview)**. A list of potential topics will be shown, with the number of times a query about this topic was made by users of the bot.

:::image type="content" source="media/advanced-ai-features/topic-suggestions.png" alt-text="Screenshot of the Topic suggestions tile showing a list of suggestions.":::

The topic suggestion analyzer automatically runs once every one to two hours. It scans through all new queries made since the analyzer last ran, groups together queries to which it couldn't match an existing topic, and presents them in the list. Your bot will need at least 100 new conversations (from the last time any suggestion was generated) to trigger the process, and only those suggestions with more than three user sessions will be shown.

When you click on an item in the suggestion list, a topic suggestion window will appear, showing the topic with some suggested trigger phrases. The suggested trigger phrases are based on the queries made by the bot users that couldn't be matched to an existing topic.

After reviewing the suggested trigger phrases, you can choose to delete the entire suggested topic (for example, if it's irrelevant to the bot) or add it to your list of topics by selecting **Add to topics**.

:::image type="content" source="media/advanced-ai-features/topic-editing.png" alt-text="Screenshot of the topic editing window.":::














## Automatic triggering improvements (Preview)

[Once enabled](#enable-or-disable-ai-capabilities), the automatic triggering feature improves intent triggering by using AI to automatically generate new trigger phrases by analyzing previous bot traffic. 

With the continuous learning in Power Virtual Agents provided by this feature, each conversation will make the next one better - using reinforcement learning and signals from responses to "Did you mean" questions: when the bot is unsure of the bot user's response it will ask a clarifying question. The bot then learns automatically from the bot user's responses and will not have to ask again. 

Over time, as users interact and talk to the bot, it will get better and better.

In the following screenshot, the first time the bot comes across a question it doesn't understand, it asks for clarification. 

On the left side of the image, a bot user asks "I'd like to purchase somethign", to which the bot says "Sorry, I didn't get that. Did you mean:" and then provides a few options such as "Buy items" and "Buy service". In this case, the bot user selected "Buy items".

The next time someone asks the same question, the bot doesn't ask for clarification – it knows from previous interactions what the bot user is likely asking to buy items, so it goes straight into the purchasing topic, replying to the question "I'd like to purchase somethign" with "I am happy to help you place your order. To what state will you be shipping?".
In this example, it also understands the misspelling of "somethign" to mean "something", so it's able to carry over the improved intent triggering even though the bot user's question is spelled differently.


![Screenshot of a bot conversation showing the improvements to auto triggering.](media/advanced-ai-features/triggering-improvements.png)

## Conversation personalization (Preview)

[When this feature is enabled](#enable-or-disable-ai-capabilities), the bot will reuse information from Microsoft Graph and Azure Active Directory (Azure AD) throughout the course of a conversation. This feature allows the bot to use already existing information to enhance and personalize future conversations. For example, if a user mentions a name, email, or zip code these properties are stored and used in later conversations without having to reprompt the user. 

Specifically, with this feature enabled, when the bot asks questions such as those in the following table, the corresponding user information will be pulled from Microsoft Graph and Azure AD (for authenticated users) and provided as prompts for the user to choose as an option. 


![Screenshot of the triggering improvements highlighted as part of topic authoring.](media/advanced-ai-features/improvements-authoring.png)

| Sample bot questions | User property automatically filled from Microsoft Graph or Azure AD |
|-------------------------|-------------------------|
| <ul></br><li>`Where do you live?`</li></br><li>`For assistance with this matter you'll need to provide your address.`</li></br><li>`Thank you for that. Please give me 2-3 minutes to review your previous case. May I know your address?`</li></br></ul> | Address |
| <ul></br><li>`OK. I'll need you to enter your annual income in order to assist.`</li></br><li>`OK. Can I get your annual income so I can help with that?`</li></br></ul> | Annual income |
| <ul></br><li>`I'll help if I can. Would you tell me when you were born please (day/month/year)?`</li></br><li>`What is your date of birth?`</li></br><li>`Could you give me your date of birth, please?`</li></br></ul> | Date of birth |
| <ul></br><li>`I can help you out with that. What's your business phone number so I can go ahead?`</li></br><li>`Will proceed if you please provide your work phone number to contact you?`</li></br></ul> | Business phone number |
| <ul></br><li>`Can you supply your city of residence?`</li></br><li>`Please provide your city of residence.`</li></br><li>`I agree. I'd like to know your city of residence to continue. Please tell me what city you're in.`</li></br></ul> | City of residence |
| <ul></br><li>`OK, no problem. Can you tell me the country where you live?`</li></br><li>`Let me assist you with your concern regarding your DVD. Before we proceed, please provide me with the country you are in.`</li></br></ul> | Country of residence |
| <ul></br><li>`For assistance with this matter you'll need to provide your email address.`</li></br><li>`Tell me the e-mail address where I can contact you.`</li></br></ul> | Email address |
| <ul></br><li>`Please tell me: what is your fax number?`</li></br><li>`Alright. Go ahead and enter your telefax number for me please.`</li></br></ul> | Fax number |
| <ul></br><li>`I'd be glad to help you with that. By the way, may I ask for your first name so that I can address you properly?`</li></br><li>`Please enter your name for me.`</li></br><li>`What's your first name?`</li></br></ul> | First name |
| <ul></br><li>`For assistance with this matter you'll need to provide your gender.`</li></br><li>`Sure, I can assist with that. What is your gender?`</li></br><li>`Please enter your gender.`</li></br></ul> | Gender |
| <ul></br><li>`What is your home phone number?`</li></br><li>`Please provide your home phone number.`</li></br></ul> | Home phone number |
| <ul></br><li>`I'll help if I can. Would you tell me your job title please?`</li></br><li>`Sure, I'd be glad to help. Please enter your career title to proceed.`</li></br></ul> | Job title |
| <ul></br><li>`Might I know your last name in order to proceed?`</li></br><li>`I see. Allow me to review this case number. Can you also tell me your last name for me to address you properly?`</li></br></ul> | Last name |
| <ul></br><li>`I'll see if I can help. Could you please enter your director's name?`</li></br><li>`I'll help you if I can. could you tell me your principal's name, please?`</li></br><li>`What is your manager's name?`</li></br><li>`Please share the name of your supervisor.`</li></br></ul> | Manager's name |
| <ul></br><li>`Wondering if you would please provide your conjugal status?`</li></br><li>`To assist you I'll need you to enter your marital status.`</li></br></ul> | Marital status |
| <ul></br><li>`Wondering if you would please provide your middle name?`</li></br><li>`I'd be glad to help you with that. By the way, may I ask for your middle name so that I can address you properly?`</li></br></ul> | Middle name |
| <ul></br><li>`Could you please provide me with your mobile phone number?`</li></br><li>`It's not a problem. I'll just need your cell phone number please.`</li></br></ul> | Mobile phone number |
| <ul></br><li>`I'll need your nickname please?`</li></br><li>`It's my pleasure to assist. Can you inform me of your nickname?`</li></br></ul> | Nick name |
| <ul></br><li>`Sure. To help with that, I'll need you to specify how many children you have please.`</li></br><li>`Please indicate the number of children you have.`</li></br></ul> | Number of children |
| <ul></br><li>`I'll see if I can help. Will you be able to enter your partner's full name?`</li></br><li>`Please tell me your spouse's first name.`</li></br><li>`Can you give me the first name of your husband or wife, please?`</li></br></ul> | Spouse/partner name |
| <ul></br><li>`Can you please tell me what your state of residence is?`</li></br><li>`I can help you out with that. What's your state of residence so I can go ahead?`</li></br></ul> | State/province of residence |
| <ul></br><li>`Wondering if you would please provide your zip code?`</li></br><li>`I can help you out with that. What's your zip code so I can go ahead?`</li></br></ul> | Zip code |


## Enable or disable AI capabilities

To use these advanced AI capabilities in Power Virtual Agents:

1.  Open a bot you want to enable or disable the features for.

2.  Expand **Manage** on the side navigation pane, then go to the **AI
    capabilities** tab.

3.  For each feature, select the checkbox to turn the feature on or off.

4.  Select **Save** at the top of the tab.

:::image type="content" source="media/advanced-ai-features/enable-features.png" alt-text="Screenshot showing the new AI capabilities section under the Manage tab.":::


[!INCLUDE[footer-include](includes/footer-banner.md)]
