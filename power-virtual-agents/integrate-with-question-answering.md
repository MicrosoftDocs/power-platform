---
title: "Integrate with question answering"
description: "Use an existing question answering knowledge base as content in your fallback topic."
keywords: "question answering, fallback, knowledge base, question, answer, faq"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "publication, authoring, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Integrate with question answering

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[Question answering](/azure/cognitive-services/language-service/question-answering/overview) provides cloud-based Natural Language Processing (NLP) that allows you to create a natural conversational layer over your data. It is used to find the most appropriate answer for any input from your custom knowledge base of information.

## Prerequisites

- [Configure a fallback topic](authoring-system-fallback-topic.md).
- [Automate chatbot actions with flows](advanced-flow.md).

## Use question answering in fallback topic

You can use an existing knowledge base in Microsoft Copilot Studio by using a Power Automate flow to connect it to any topic. However it's more useful to connect your knowledge base to your bot's system fallback topic. Questions users ask that aren't covered by other topics can _fallback_ to using content from your knowledge base.

To learn how to use the Question Answering Connector in a fallback topic, see [Language - Question Answering](https://aka.ms/QuestionAnsweringConnectorWithPowerVirtualAgents).

[!INCLUDE[footer-include](includes/footer-banner.md)]
