---
title: Generative answers
description: Provide answers and information for your copilot users, even if you have no  topic for their issue.
keywords: "PVA"
ms.date: 12/13/2023
ms.topic: how-to
author: KendalBond007
ms.author: iawilt
ms.reviewer: 
ms.collection: virtual-agent
ms.service: power-virtual-agents
ms.search.region: USA
searchScope: "Power Virtual Agents"
---

# Generative answers

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Generative answers in Microsoft Copilot Studio allow your copilot to find and present information from multiple sources, internal or external, without created topics. Generative answers can be used as primary information sources or as a fallback source when authored topics can't answer a user's query. As a result, you can quickly create and deploy a functional copilot. You don't need to manually author multiple topics that might not address all customer questions.

In the past, when a copilot can't determine a user's intent, it asks the user to rephrase their question. If after two prompts, the copilot still can't determine the user's intent, the copilot escalates to a live agent, using the [system **Escalate** topic](authoring-system-fallback-topic.md).

Today, before involving a live agent, the copilot uses natural language processing (NLP) to:

- Parse what a user types to determine what they're asking.
- Find, collate, and parse relevant information from a specified source. This source can be your company's website, or from multiple sources, including Sharepoint and OneDrive for Business.
- Summarize search results into plain language delivered to the copilot user.

This article helps you get started, using generative answers as a fallback topic, when a user's intent can't be addressed by existing copilot topics.

> [!NOTE]
> [Generative answers with search and summarize](nlu-boost-node.md) discuss how your copilot can query information sources, using generative answers in a single topic node.

Your workflow might look like:

1. You create a copilot and enable generative answers. You test it thoroughly.

1. After testing, you publish your copilot to instantly provide answers, help, and guidance to your copilot users.

1. You create individual topics for frequently asked questions. These topics might develop from [analytics from previous copilots](analytics-overview.md) or existing support issues.

## Generative answers as a fallback

When a copilot can't find a matching intent (topic) for the user's query, it uses generative answers and tries to answer a question. This behavior is called "Generative Answers for fallback." If the user's intent isn't matched to topics or generative answers, the fallback [system topic](authoring-system-topics.md) is used. System topics can escalate a query for the copilot.

Generative answers aren't limited to fallback scenarios. Your copilot can also use other web sites, external or internal web sources, and knowledge sources such as SharePoint or OneDrive for Business.

Generative answers can use these sources:

- External resources:
  - [Bing Web Search](/bing/search-apis/bing-web-search/overview)—doesn't require external configuration
  - [Bing Custom Search](https://www.customsearch.ai/)—requires external configuration
- Internal resources:
  - SharePoint
  - OneDrive for Business
  - Documents uploaded to Dataverse
  - Custom data (internal or external): supply your own source, such as a Power Automate Flow or from Skill.

> [!NOTE]
> You can expand your copilot's use of generative answers in [Generative Answers with Search and Summarize](nlu-boost-node.md).

### Source authentication

In addition to [URL considerations](nlu-boost-conversations.md#url-considerations), you might need to authentication for your sources. For example, if you use an internal SharePoint site or OneNote as a source for **generative answers**.

For more information, see [Information sources](nlu-boost-node.md#information-sources).

## Prerequisites

- An account for Microsoft Copilot Studio.

  > [!NOTE]
  > If you don't have a Microsoft Copilot Studio account, or you haven't created copilots before, see the [Quickstart guide for building copilots with generative AI](nlu-gpt-quickstart.md).

- If you already have a copilot created, enable the **generative answers** option in the **Generative AI** page.

- Review AI response generation training, model, and usage in the [FAQ for generative answers](faqs-generative-answers.md) and [Learn more about Azure OpenAI](/legal/cognitive-services/openai/transparency-note).

- Generative answers might be subject to usage limits or capacity throttling.

- [!INCLUDE[prereq-lote](includes/prereq-lote.md)]

## Increasing your copilot's reach

1. Go to the [Microsoft Copilot Studio home page](https://copilotstudio.microsoft.com/).

1. Select **Create a copilot** on the **Home** page or **New copilot** from the **Copilots** page.

1. Enter a name for your copilot.

1. Select a language for your copilot.

1. Provide a website you'd like the copilot to use for generating answers.

   See the [URL considerations](#url-considerations) section for the types of URLs you can use.

   :::image type="content" source="media/nlu-gpt/nlu-quickstart-boost-copilot-create.png" alt-text="Screenshot of the bot creation screen with the option highlighted.":::

1. Select **Create**.

   You now see your copilot's **Overview** page.

### Change your URL or toggle generative answers

You can customize further, after your copilot is created, from the **Generative AI** page.

- To enable or disable generative answers, toggle the option in the **Boost conversational coverage with generative answers** section.
- To change the URL, add more websites or remove them in the **Websites** section.

:::image type="content" source="media/nlu-gpt/nlu-boost-gen-ai-change-url.png" alt-text="Screenshot of the Microsoft Copilot Studio AI capabilities page with Generative Answers enabled and highlighted." lightbox="media/nlu-gpt/nlu-boost-gen-ai-change-url.png":::

### Content moderation

Adjust the content moderation settings from the **Generative AI** page.

1. Under **Copilot content moderation**, select the level you want for your copilot.

   | High | Medium | Low |
   | -------------- | ------ | --- |
   | Copilot’s answers are more relevant. (default)  | Copilot generates more answers, but might be irrelevant or undesirable. | Copilot generates the most answers, but might be inaccurate. |

    :::image type="content" source="media/nlu-gpt/nlu-generative-ans-content-moderation.png" alt-text="Screenshot of the copilot's content moderation menu, showing high (default), medium, and low options." lightbox="media/nlu-gpt/nlu-generative-ans-content-moderation.png":::

1. Select **Save** at the top of the page.

Test your copilot to see how well it responds to questions related to the content from your website. You might want to test edge case questions to decide if you need a lower moderation to be more inclusive.

### URL considerations

The URL used in your copilot represents the scope of content for generating responses. There are requirements and restrictions on some URLs.

#### URL type and structure

- The URL can have up to two levels of depth—subpaths indicated by a forward slash `/`. A trailing forward slash, however, is allowed.

  | Valid | Not valid |
  | ----- | --------- |
  | www.contoso.com <br> www.fabrikam.com/engines/rotary <br> www.fabrikam.com/engines/rotary/ | www.fabrikam.com/engines/rotary/dual-shaft

- If the URL redirects to another top-level site, the content isn't included in results:

  For example, if _www.fabrikam.com_ redirects to _www.contoso.fabrikam.com_, your copilot doesn't generate responses from content on either of those URLs.  
  
- URLs that point to a website, requiring authentication or ones not indexed by Bing.

  For example, wikis and SharePoint sites require authentication, therefore can't be used:

  - fabrikam.visualstudio.com/project/_wiki
  - fabrikam.sharepoint.com
  
#### URL domain structure
  
Any publicly viewable content in the URL you specify, including subdomains under a top-level domain, generate content for your copilot.

Examples of useful or unuseful domains:

- If you use _www.fabrikam.com/engines/rotary_, the content on _www.fabrikam.com/engines/rotary/dual-shaft_ is also used by the copilot to generate responses.  

  Content on _www.fabrikam.com/tools_ isn't used, since _tools_ isn't a subdomain of _rotary_.  

- If you use _www.fabrikam.com_ (the _www_ exists), the content on _news.fabrikam.com_ (the _www_ doesn't exist) isn't used, since _news._ is a subdomain under the top-level domain _fabrikam.com_.  

- If you use _fabrikam.com_, then content on _www.fabrikam.com_ and _news.fabrikam.com_ is used, since they sit under the top-level domain _fabrikam.com_.  

#### Social network & forum URLs

Your copilot might generate nonsensical, irrelevant, or inappropriate answers if you use a forum or social network site as your URL. Therefore, community content on social networks often increases the risk of more answers being rejected.  

For more information, see the [FAQ for generative answers](faqs-generative-answers.md). AI is trained to avoid generating malicious and offensive responses.

#### Search engine URLs

Don't include URLs of search engines like _bing.com_, as they don't provide useful responses.

## Test your copilot's generative answers reach

1. Select **Test your copilot** at the bottom of the navigation pane.

1. In the **Test copilot** pane, ask your copilot questions that take advantage of the generative answers capability.

**Generative answers** works well with a large variety of question types.

However, some types might produce less helpful responses, including:

- Personal questions.
- Questions that require authenticated access to content.
- Questions that have no related content at a specified URL.

### Forming questions

- Your copilot has difficulty answering questions that require calculations, comparisons, or form submissions. Your copilot might not understand comparative and superlative terms such as better or best, latest, or cheapest in a question.

- If the copilot can't generate an answer to a question, it prompts you to rephrase the question. After two of these prompts, the copilot initiates the [system **Escalate** topic](authoring-system-fallback-topic.md). System topics are topics automatically included with each copilot.

- To learn more about how Bing interprets the question against the URL you specify, add `site: \<your URL here>` to the end of your question to see the top Bing results for the question.  

- You might need to disable the sample topics, lessons 1-3, that automatically come with a new copilot. They're used before any URLs are accessed.

  Select the `...` next to a sample topic on your **Topics** page and toggle the **Status** to enable or disable.

  :::image type="content" source="media/nlu-gpt/nlu-boost-disable-sample-topics.png" alt-text="Location of the sample topic toggle where you can enable or disable a sample topic.":::

For more information, see [Use lesson topics in Microsoft Copilot Studio](authoring-template-topics.md).

> [!TIP]
> In your chat window, you can provide feedback on how well the AI does by selecting the "thumbs up" or "thumbs down" icon underneath the generated answer.
>  
> If you see an irrelevant or inappropriate generated response, select the thumbs down icon to let us know. You can also include more detailed feedback.
>  
> We'll use this feedback to improve the quality of the AI.

## What's supported

### Quotas

Quotas are default constraints applied to copilots that limit how often messages can be sent to a copilot. The purpose of quotas is to throttle the client's service load, which protects a service from being overloaded and the client from unexpected resource usage.

Copilots with generative answers enabled have a limit on the number of queries they can make derive answers from the URL you specified. Normal conversations that use copilot topics follow the [usual quotas and limitations](requirements-quotas.md#quotas).

### Pricing

The use of the boosted conversations capability isn't billable and follows the [usual quotas and limitations](requirements-quotas.md#quotas).
