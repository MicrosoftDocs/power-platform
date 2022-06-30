---
title: "Integrate with QnA Maker"
description: "Use an existing QnA Maker knowledge base as content in your fallback topic."
keywords: ""
ms.date: 06/30/2022

ms.topic: article
author: v-alarioza
ms.author: v-alarioza
manager: shellyha
ms.custom: "publication, authoring, ceX"
ms.collection: virtual-agent
---

# Integrate with QnA Maker

[QnA Maker](https://www.qnamaker.ai/) is a cloud-based Natural Language Processing service that allows you to create a natural conversational layer over your data. It imports your content into a knowledge base of question and answer pairs. The import process extracts information about the relationship between the parts of your structured and semi-structured content to imply relationships between the question and answer pairs.

## Prerequisites

- [A Power Virtual Agents bot](authoring-first-bot.md)
- [Configure a fallback topic](authoring-system-fallback-topic.md)
- [A QnA Maker knowledge base](/azure/cognitive-services/qnamaker/quickstarts/create-publish-knowledge-base)
- [Automate chatbot actions with flows](advanced-flow.md)

## Use QnA Maker in fallback topic

You can leverage an existing QnA Maker knowledge base in Power Virtual Agents by using a Power Automate flow to connect it to any topic. However it's usually more useful to connect your knowledge base to your bot's system fallback topic. Questions users ask that are not covered by other topics can _fallback_ to using content from your knowledge base.

To learn how to add use QnA maker in a fallback topic, see [Add your knowledge base to Power Virtual Agents](/azure/cognitive-services/qnamaker/tutorials/integrate-with-power-virtual-assistant-fallback-topic).

[!INCLUDE[footer-include](includes/footer-banner.md)]
