---
title: FAQ for use Copilot to generate deployment notes in pipelines
description: FAQ that discusses using Copilot to generate deployment notes in pipelines and the key considerations for making use of this technology responsibly.
ms.date: 7/31/2023
ms.custom: 
  - responsible-ai-faqs
ms.topic: article
author: ASheehi1
ms.author: matp
---

# FAQ for use Copilot to generate deployment notes in pipelines

These frequently asked questions (FAQ) describe the AI impact of use Copilot to generate deployment notes in pipelines.

## What is use Copilot to generate deployment notes in pipelines? 

AI-generated deployment notes is a feature in pipelines for Power Platform that allows you to seamlessly generate deployment notes to provide more context to your deployment record. The only steps are to review what AI has generated for you, and click **Apply** at the last summary page of the deployment configuration.
 
## What are the system’s capabilities? 

This capability is powered by [Azure OpenAI Service](/azure/cognitive-services/openai/overview), which uses powerful language models. These language models generate new text in English that looks and sounds like text written by humans.  

Using Azure OpenAI service as a foundation, deployment notes will be generated in the form of a solution overview, providing a concise solution description and an overview of its components. These notes are based on component metadata such as name, description, and type.

## What is the system’s intended use? 

AI-generated deployment notes help admins approve and manage deployments in their organization, providing insight into what a solution contains and its purpose. AI-generated content may have mistakes. Make sure it's accurate and appropriate before using it. For more information, read the full [preview terms](https://powerplatform.microsoft.com/en-us/legaldocs/supp-powerplatform-preview).


## How was use Copilot to generate deployment notes in pipelines evaluated? What metrics are used to measure performance? 

Use Copilot to generate deployment notes in pipelines underwent substantial testing before the feature was released in preview. If you encounter issues with the content being generated, please submit feedback. Your feedback will be used to improve Microsoft products and services. IT admins for your organization will be able to view and manage your feedback data. 

For more information, see: [Data, privacy, and security for Azure OpenAI Service](/legal/cognitive-services/openai/data-privacy)

## What are the limitations of use Copilot to generate deployment notes in pipelines? How can users minimize the impact of the AI-generated deployment notes in pipelines limitations when using the system? 

Preview features aren’t meant for production use and may have restricted functionality.These features are available before an official release so that customers can get early access and provide feedback. 

This capability is in the process of rolling out, and may not be available in your region yet. 

This capability may be subject to usage limits or capacity throttling. 

The following are requirements to access the waitlist for this preview: 

- Your pipeline environments must be in the United States region. 

- Your account must have English (United States) as the browser language.

- AI deployment notes must be enabled for your pipeline to use the Copilot leveraging AI models: 

    1. Go to your pipelines Host environment > run **Deployment Pipeline Configuration** > **Pipelines** > select desired pipeline. 

    3. On the **General** settings page, under **Pipeline Details**, enable or disable **AI deployment notes**. 

For more information, see [Use Copilot to generate deployment notes in pipelines (preview)](copilot-deployment-notes-pipelines.md). 

## What operational factors and settings allow for effective and responsible use of the system? 

Follow these procedures to make the most of the feature: 

- Name your solution components accurately.
- Add descriptions to your solution components to give them more context.

## See also 
- [Use Copilot to generate deployment notes in pipelines (preview)](copilot-deployment-notes-pipelines.md)

