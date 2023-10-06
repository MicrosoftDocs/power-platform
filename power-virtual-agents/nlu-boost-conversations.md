---
title: Generative answers
description: Provide answers and information for your bot users, even if you haven't created a topic for their issue.
keywords: "PVA"
ms.date: 7/30/2023
ms.topic: how-to
author: KendalBond007
ms.author: iawilt
ms.reviewer: 
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope:
  - "Power Virtual Agents"
---

# Generative answers

Generative answers in Power Virtual Agents allow your bot to find and present information from multiple sources (which may be internal or external) without requiring creation of topics. Generative answers can be used as primary information sources in your chatbot, or as fallback when authored topics are unable to address a user's query. As a result you can quickly create and deploy a functional bot, without having to manually author multiple topics that may not address your customer's questions.

In the past, when a bot couldn't determine a user's intent, it asked the user to rephrase their question. If, after two prompts, the bot still couldn't determine the user's intent, the bot escalated to a live agent by using the [system **Escalate** topic](authoring-system-fallback-topic.md). This document covers how to configure generative answers as a fallback topic when a user intent cannot be addressed by existing bot topics. [Generative answers with search and summarize](nlu-boost-node.md) discusses how your bot can query information sources by introducing generative answers in a node.

Now, before involving a live agent, the bot uses natural language processing (NLP) to:
- Parse what a user types to determine what they're asking
- Find, collate, and parse relevant information from a specified source (for example, your company's website) or from multiple sources, including Sharepoint and OneDrive for Business.
- Summarize search results into plain language that is delivered to the bot user

Your workflow might be like this:

1. You create a bot and enable this capability. You test it thoroughly.

1. After testing it, you publish your bot so you can instantly provide answers, help, and guidance to your customers or bot users.

1. You create individual topics for the most important or most often-asked questions from your customers (which you might have developed based on [analytics from previous bots](analytics-overview.md) or existing support issues).

This workflow could take a while and some specialized knowledge - but with generative answers enabled you're up and running from day one.

## Generative answers as a fallback

When a user sends an input to a bot, the bot first looks for topics to run which match the intent of the user prompt. If a matching intent isn't found in the topics, the bot can use generative answers to attempt answering the query. This behavior is called "Generative Answers for fallback".
Finally, if the user's intent isn't matched by topics or generative answers, the Fallback [system topic](authoring-system-topics.md) is called.

This document is focused on _getting you started_ using generative answers to augment your bot's ability to help customers.

While generative answers serves as a fallback in this situation, it isn't limited to fallback scenarios. Your bot's ability to answer user questions can also use other web sites, external or internal web sources, and knowledge sources such as SharePoint or OneDrive for Business. 

Details and examples on how you can expand your bot's ability to use generative answers can be found in [Generative Answers with Search and Summarize](nlu-boost-node.md). These sources can be used by generative answers:

- External resources include:
  - Bing Search
  - [Bing Custom Search](https://www.customsearch.ai/)
- Internal resources include:
  - SharePoint
  - OneDrive for Business
  - Documents uploaded to Dataverse
  - Custom data (internal or external): supply your own content from any source; for instance, from a Power Automate Flow, Skill, or other source


### Source authentication

In addition to [URL considerations](nlu-boost-conversations.md#url-considerations), you'll also need to consider authentication for your sources (should there be any). For example, you may choose an internal SharePoint site or OneNote as a source for **generative answers**. More details can be found in [Information sources](nlu-boost-node.md#information-sources).

## Prerequisites

> [!CAUTION] 
>  
> Your bot must be created in the US region. 
>  
> Other regions, and languages other than English, aren't supported.

- An account for Power Virtual Agents.

    > [!NOTE]
    >
    > If you don't have a Power Virtual Agents account, or you haven't created chatbots with Power Virtual Agents before, see the [Quickstart guide for building bots with GPT](nlu-gpt-quickstart.md).

- You must enable the **generative answers** option for each bot.

- [Review AI response generation training, model, and usage FAQ](faqs-generative-answers.md) and [Learn more about Azure OpenAI](/legal/cognitive-services/openai/transparency-note).

- Your bot must be created in the US region. Other regions, and languages other than English, aren't supported.

- This capability may be subject to usage limits or capacity throttling.

## Increasing your bot's reach

1. Go to the [Power Virtual Agents home page](https://web.powerva.microsoft.com/). 

1. In the side navigation menu, select **Create**. You can also select **Create a bot** on the **Home** page or **New chatbot** from the **Chatbots** page.

1. Enter a name for the bot.

1. Select the language you want your bot to speak from the menu.

3. Provide a website you'd like the bot to use for generating answers, and click **Create**. See the [URL considerations](#url-considerations) section for what types of URLs you can use. 

    :::image type="content" source="media/nlu-gpt/create-bot-highlight-22May23.png" alt-text="Screenshot of the bot creation screen with the option highlighted.":::


After your bot is created and ready for you to use, it'll open to the bot's **Overview** page. From here, you can confirm that generative answers is enabled. From the **Overview** page, you can navigate to the **AI Capabilities** page if you want to change the URL you want to use.

You can also change the URL, disable generative answers, or change the level of content moderation in the settings for the bot:

1. With a bot open, expand **Settings** on the side navigation pane, and select **AI Capabilities**.

    1. Under **Boost conversational coverage**, use the checkbox for generative answers to enable or disable the capability.

    1. In the field under the checkbox, add or change the URL. The [same requirements apply for the URL](#url-considerations) as when enabling the capability when you create a bot.

    :::image type="content" source="media/nlu-gpt/ai-capabilities-highlight-22May23.png" alt-text="Screenshot of the Power Virtual Agents AI capabilities page with Generative Answers enabled and highlighted.":::

    1. Under **Bot content moderation**, select the level you want for your bot. A higher level of moderation means that the bot’s answers are more relevant. A lower level of moderation means that the bot generates more answers, but the answers may be irrelevant or undesirable.

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-content-moderation.png" alt-text="Screenshot of the bot content moderation menu.":::    

1. Select **Save** at the top of the **AI capabilities** page.

You can now test your bot to see how well it responds to questions related to the content on the URL you specified.

### URL considerations

The URL you provide represents the scope of content that is used for generating responses. 

There are some requirements on the type and structure of the URL you use:

The URL can have up to two levels of depth (or "subpaths", indicated by forward slashes (/)). Your URL can have a trailing forward slash, which isn't included in the limit of two slashes: 
- The URLs *<span>www</span>.contoso.com*, *<span>www</span>.fabrikam.com/engines/rotary*, or *<span>www</span>.fabrikam.com/engines/rotary/* would be valid. 
    The URL *<span>www</span>.fabrikam.com/engines/rotary/dual-shaft* wouldn't.

If the URL you specify redirects to another top-level site, that content isn't included in results:
- If, when visited in a browser, *<span>www</span>.fabrikam.com* redirected to *<span>www</span>.contoso.fabrikam.com*, then the bot wouldn't generate responses from content on either of those URLs.  
  

The capability won't generate responses from a URL that points to a website that requires authentication or that isn't indexed by Bing:
- Wikis, SharePoint sites, and other types of websites that require authentication, for example *<span>fabrikam</span>.visualstudio.com/project/_wiki* or *<span>fabrikam</span>.sharepoint.com*, can't be used.  
  

You should also be aware of the following characteristics of the capability:
  
The bot generates responses from any publicly viewable content under the URL you specify, including subdomains under a top-level domain:
- If you were to use the URL *<span>www</span>.fabrikam.com/engines/rotary*, the content on *<span>www</span>.fabrikam.com/engines/rotary/dual-shaft* would also be used by the bot to generate responses.  
Content from *<span>www</span>.fabrikam.com/tools* wouldn't be used.  

- If you were to use *<span>www</span>.fabrikam.com*, the bot wouldn't generate responses from content on *<span>news</spam>.fabrikam.com*, as *news.* is a subdomain under the top-level domain *<span>fabrikam</span>.com*.  
 
- If you were to use *<span>fabrikam</span>.com*, then content from *<span>www</span>.fabrikam.com* and *<span>news</span>.fabrikam.com* would be used, as they sit "under" the top-level domain *<span>fabrikam</span>.com*.  

The bot may generate nonsensical, irrelevant, or inappropriate answers if you use a forum or social network site as your URL:  
- Community content on social networks can often increase the risk of more answers being rejected due to inappropriate, offensive, and malicious content that is more common on those sites.  
For more information, see the [AI response generation training, model, and usage FAQ](faqs-generative-answers.md) for more information on how the AI is trained to avoid generating malicious and offensive responses.

The URL you specify should host the content you want the bot to generate answers from; it shouldn't be the URL for a search engine:
-  Using *<span>bing</span>.com* or other search engines in the URL won't provide useful responses.

## Test your bot's generative answers reach

1. Click on **Test your bot** at the bottom of the side navigation pane. 

1. In the **Test bot** panel, ask the bot questions that take advantage of generative answers capability.

**Generative answers** works well with a large variety of question types. However, there are certain types of questions that may produce less-helpful responses, including:

- personal questions 
- questions that require authenticated access to content
- questions for each there's no related content at the specified URL
 
You should also be aware of some of the characteristics of the AI, and how to get the most out of the questions you ask:

- The bot can have difficulty answering questions that require calculations, comparisons, or form submissions to provide answers. This includes questions that use comparative and superlative terms such as better or best, latest, or cheapest.

- If the bot can't generate an answer to a question, it will ask you to rephrase the question. After two of these prompts, the bot will initiate the [system **Escalate** topic](authoring-system-fallback-topic.md).

- To learn more about how the question is interpreted by Bing against the URL you specify, add "site: \<your URL here>" to the end of your question to see the top Bing results for the question.  

- You may need to disable the [sample topics that are created automatically](authoring-template-topics.md) when you create a bot. 

> [!TIP]
>  
> You can provide feedback on how well the AI does by selecting the "thumbs up" or "thumbs down" icon underneath the generated response.
>  
> If you encounter irrelevant or inappropriate generated response, select the thumbs down icon to let us know. You can also include more verbose feedback. 
>  
> We'll use this feedback to improve the quality of the AI.



## What's supported

### Quotas

Quotas are default constraints applied to chatbots that limit how often messages can be sent to the chatbot. The purpose of quotas is to throttle the client's service load, which protects a service from being overloaded and the client from unexpected resource usage. 

Bots with generative answers enabled have a limit on the number of queries they can make that reach out to the URL you specified. Normal conversations that use bot topics follow the [usual quotas and limitations](requirements-quotas.md#quotas)


### Pricing

The use of the boosted conversations capability isn't billable and follows the [usual quotas and limitations](requirements-quotas.md#quotas).

