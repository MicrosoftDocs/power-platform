---
title: T-Mobile empowers customer service representatives using Power Apps and Copilot Studio
description: Learn how T-Mobile empowers customer service representatives to answer questions faster and improve the customer experience.
#customer intent: As a Power Platform user, I want to learn how T-Mobile uses Power Apps and Copilot Studio to empower customer service representatives so that I can apply similar solutions in my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: case-study
ms.topic: overview
ms.date: 08/08/2025
---

# T-Mobile empowers customer service representatives using Power Apps and Copilot Studio

In this case study, you learn how [T-Mobile](https://www.t-mobile.com/our-story) empowers customer service representatives (CSRs) with the PromoGenius app, built using Power Apps, and Copilot Studio. T-Mobile leads the U.S. wireless industry and operates the second largest network in the country. The company serves more than 130 million customers. The PromoGenius app brings information from different sources together in one place, so CSRs can use natural language queries to get answers quickly.

## Challenges

T-Mobile frontline retail employees need instant access to promotional offers and other key sales information. They need data about new devices, discounts, trade-in offers, and technical details about devices.

While some information is available in internal data sources, technical details about devices are spread across device manufacturers' websites. Finding the right information on these sites takes time, especially if the customer wants to compare products across multiple sites.

To address this challenge, CSRs receive a daily report in PDF format with the latest updates on devices and available offers. Over time, the document became more complex and harder to search. CSRs printed the document for quick reference and accessed multiple systems to find technical details, switching between several applications on an iPad. This way of working wasn't efficient or environmentally friendly. It was time to move away from this paper-heavy and time-consuming process.

Brian Hodel, Solution Architect and Developer at T-Mobile in Bellevue, Washington, built the solution. With a professional developer background, Brian streamlines business operations and automates processes across the organization using tools in Power Platform. After his success with the [Orbit app](https://www.microsoft.com/en-us/power-platform/blog/power-apps/tmobile/), T-mobile consulted Brian to build this solution to help make the retail department more efficient.

## Solution

The PromoGenius app is a Power Apps canvas app with an embedded Copilot Studio agent. It is designed with a series of drop-down menus to minimize the time that a CSR spends entering a query. CSRs can access the app on iPads on the retail floor, and call center representatives can also access the app online. The app displays results from a query in a presentation format that can be shared directly with customers.

The Copilot Studio agent connects to over 20 device manufacturers' websites and assembles product information instantly and automatically. It uses generative answers, enabling a CSR to ask deep technical questions using natural language queries in the context of a customer's question. The agent can also understand a question in the context of previous questions.

The agent is useful for product comparisons, as it not only gathers the data but also formats it into clear comparison tables that can be presented to a customer.

In the following image of the PromoGenius app, notice how filters can be applied (on the top). Using natural language, users can ask questions about devices and compare the technical details.

:::image type="content" source="media/t-mobile/app-promotions.png" alt-text="Screenshot of the PromoGenius app interface with filters and device comparison options visible." lightbox="media/t-mobile/app-promotions.png":::

For instance, users can ask to compare connectivity.

:::image type="content" source="media/t-mobile/connectivity.png" alt-text="Screenshot of device connectivity comparison in the PromoGenius app.":::

The app presents comparison details instantly, without navigating to the manufacturers' websites for manual comparisons.

:::image type="content" source="media/t-mobile/details.png" alt-text="Screenshot of instant device comparison results in the PromoGenius app." lightbox="media/t-mobile/details.png":::

Users often start by using the filters to get information about promotions, then use the agent to make more detailed comparisons. Sometimes users start the other way around, by asking the agent what device to recommend for a given case.

The PromoGenius app not only supports CSRs but also highlights how AI can improve business processes.

"The solution has been highly successful," Brian explains. "I intentionally designed it to leverage generative AI capabilities, aiming for a more conversational approach to obtaining answers. As a result, the organization has started to rethink how information can be consolidated, gaining new insights into the potential of generative AI."

### Implementation approach

T-Mobile initially considered a pro dev option. After reviewing the requirements, they realized that Power Platform could deliver a comparable solution in less time. What was originally estimated to take 9–12 months instead launched in an initial iteration within just a few weeks.

Key factors for success included 100% uptime, a scalable knowledge source such as Dataverse, and reliability.

The PromoGenius app is built as a Power Apps canvas app, with an embedded Copilot Studio agent. As shown in the following image, the agent is embedded using the fly-out option, a configuration done in the canvas app under **Settings**.

:::image type="content" source="media/t-mobile/select-agent.png" alt-text="Screenshot of embedding the Copilot Studio agent in the PromoGenius Power Apps canvas app using the Settings option." lightbox="media/t-mobile/select-agent.png":::

This image shows the PromoGenius app including filters and the Copilot fly-out menu:

:::image type="content" source="media/t-mobile/app-filters-device-model.png" alt-text="Screenshot of the PromoGenius app interface showing the Copilot fly-out menu." lightbox="media/t-mobile/app-filters-device-model.png":::

This image shows how filters can be set to show available promotions:

:::image type="content" source="media/t-mobile/set-filters.png" alt-text="Screenshot of filter settings for available promotions in the PromoGenius app." lightbox="media/t-mobile/set-filters.png":::

### The embedded Copilot Studio agent

The process of creating the agent involved trying out different approaches for fetching data from multiple sources. The team placed general instructions in the agent settings, and used generative orchestration. They set up custom topics to match user queries. 

There are plans to move from having multiple topics to multiple agents.

The following image illustrates the general instructions and generative AI orchestration enabled for the agent:

:::image type="content" source="media/t-mobile/general-instructions.png" alt-text="Screenshot of Copilot Studio agent settings showing general instructions including the use of generative AI orchestration." lightbox="media/t-mobile/general-instructions.png":::

This image illustrates the generative AI settings in Copilot Studio:

:::image type="content" source="media/t-mobile/ai-settings.png" alt-text="Screenshot of generative AI settings in Copilot Studio agent configuration.":::

The initial idea was to obtain data from websites by adding the websites as knowledge sources in the agent and to use Dataverse for promotional data. This agent journey covered exploring different ways of having the agent leverage external website data.

The following image shows some of the knowledge sources used, including public websites and specific device documents, as well as Dataverse for promotions. The team updates the Dataverse information nightly from other sources via Microsoft Fabric pipelines.

:::image type="content" source="media/t-mobile/knowledge-source.png" alt-text="Screenshot of knowledge sources including public websites, device documents, and Dataverse for promotions.":::

To get precise and reliable results for website knowledge sources, the team explored alternative methods. One successful method involved using Bing Custom Search within topics. This approach enabled the team to prioritize data sources and exclude parts by configuring blocked pages within Bing Custom Search.

### Bing Custom Search within topics

Using Bing Custom Search for generative answer nodes in a topic lets you prioritize websites and restrict certain parts, which isn't possible when adding a website as a knowledge source for the agent. In this case, websites as knowledge sources are used as a fallback.

T-Mobile uses Bing Custom Search in the PromoGenius app both for device technical information from manufacturers' websites and for promotional data from their own website. The following image shows some of the active listed pages in the Bing Custom Search web portal.

:::image type="content" source="media/t-mobile/bing-portal.png" alt-text="Screenshot of Bing Custom Search Web Portal with active listed web pages for device data." lightbox="media/t-mobile/bing-portal.png":::

Certain website pages are blocked, so answers come from sources other than the blocked pages. For example, T-Mobile needs to retain information about promotions that are no longer available for compliance reasons. These promotions aren't included in the search when the agent uses the specified website as a knowledge source. This image shows several T-Mobile pages listed as Blocked.

:::image type="content" source="media/t-mobile/blocked-pages.png" alt-text="Screenshot of Bing Custom Search Web Portal showing blocked T-Mobile web pages." lightbox="media/t-mobile/blocked-pages.png":::

This image shows details of a Copilot Studio topic related to comparing two devices, with the **Test your agent** preview demonstrating a comparison of the iPhone 16 Pro and the Pixel 9 Pro:

:::image type="content" source="media/t-mobile/config-topic.png" alt-text="Screenshot of configuration of a Copilot Studio topic named Compare Devices.":::

### Results presented in tabular format

To improve the user experience when comparing devices, T-Mobile decided to present the output in a table. To achieve this goal, they instructed the agent to structure the information in a tabular format (as shown in general instructions to [the embedded Copilot Studio agent](#the-embedded-copilot-studio-agent)):

```copilot-prompt
When providing device details, format the information into a bullet-point list for clarity. 
When comparing devices, format the features and specifications in a well-organized, side-by-side comparison using tabular format.
```

The following image illustrates the agent's response when a user requests a comparison between two devices, the iPhone 16 Pro and Pixel 9 Pro:

:::image type="content" source="media/t-mobile/agent-response.png" alt-text="Screenshot of Copilot Studio agent response with device comparison in tabular format.":::

### AI model options for the agent

You can choose an AI model for your agent in Copilot Studio and extend it with Azure AI Foundry models. T-Mobile tried different models, like GTP-4-1, and noticed improved answers in agent conversations for some use cases but not all. Based on this conclusion, T-Mobile plans to shift from multiple custom topics to exploring a multi-agent architecture. This approach involves several agents, each dedicated to specific tasks and using specialized models, allowing each use case to have a dedicated model.  

Under the Generative AI options, you can choose a primary response model, as shown in the following image. Note that options may change as Copilot Studio evolves.

:::image type="content" source="media/t-mobile/primary-response-model.png" alt-text="Screenshot of Copilot Studio generative AI model selection options." lightbox="media/t-mobile/primary-response-model.png":::

### ALM with Power Platform Pipelines

Application lifecycle management (ALM) routines support the PromoGenius app and Copilot Studio agent. The team set up three environments: development, test, and production. Power Platform Pipelines manage deployments. Environment variables point to different services with values specific to each environment.

## Technologies used

A Copilot Studio agent is embedded in a Power Apps canvas app, which is launched from an iPad or the web. The latest promotional data for devices, offers, and services is stored in various data sources. Microsoft Fabric loads the data into Microsoft Dataverse. The agent uses Dataverse as a knowledge source, as well as external websites to obtain device details from manufacturers.

## Architecture

Microsoft Fabric pipelines run nightly to transform data and load promotional data into Dataverse. Sources include Oracle, SAP, and an Excel spreadsheet with trading values from a third-party system.

The Copilot Studio agent uses external websites as additional data sources, and Bing Custom Search within topics for more precise answers.

The following image shows the components that make up the solution.

:::image type="content" source="media/t-mobile/arch.png" alt-text="Solution architecture diagram showing the components of the PromoGenius app including Power Apps, Dataverse, Fabric, Copilot Studio, and data sources including external websites." lightbox="media/t-mobile/arch.png":::

The workflow is as follows:

1. An employee (CSR) wishes to use promotional data and detailed product information to help customers.
1. A Power Apps canvas app is available to the CSR on an iPad on the retail floor and on the web in the call center.
1. Microsoft Dataverse is the knowledge source for promotional data from data pipelines and transformations.
1. The Copilot Studio agent embedded in the canvas app is available along with filtering options. Users start by filtering data or by using natural language to query the agent.
1. Various external websites are registered as additional knowledge sources. Custom Bing Search is also used.
1. Promotional data and trading values come from different sources, like SAP, Oracle database, and Excel.
1. Data moves nightly into Dataverse using Microsoft Fabric. Data is also used for reporting purposes and viewed using Power BI and Power Apps.

## Key takeaways

This case study demonstrates the benefits of using Power Apps and Copilot Studio to create a solution that provides natural language assistance for a process that previously required multiple applications to find answers. 

Here are key takeaways for IT professionals who want to set up a similar solution in their organization:

- Use Custom Bing Search to prioritize data sources and exclude data.
- Use Microsoft Fabric pipelines to add data from other sources to Dataverse when heavy data transformations are required.
- Optimize the presentation layer by providing clear instructions and specifying how the agent should respond.

Since releasing the PromoGenius app, T-Mobile has realized the following benefits:

- Enhanced customer shopping experience. Answers are available instantly.
- Increased customer satisfaction because customers get help faster.
- More effective sales experiences overall. CSRs don't need to leave a customer conversation to check data resources.

As the second most popular app at T-Mobile, PromoGenius supports all T-Mobile retail outlets and call centers, with more than 83,000 unique users and 500,000 launches a month.

Brian highlights that key lessons from this project include the importance of involving end users in developing the solution and getting users onboard early:

> One of the key lessons is the importance of engaging directly with the people who use the solution. Talking with them about the user interface and functionality helps create a better experience. This platform makes that possible, offering speed and efficiency. Unlike traditional development tools, which don't let you collaborate on interface design in real time, this platform lets you sit with users and refine the experience together.
>
>  — *Brian Hodel, Solutions Architect and Developer at T-Mobile*

## Looking ahead

T-Mobile plans to improve PromoGenius by adding features like the [PDF function in Power Apps](/power-apps/maker/canvas-apps/how-to/pdf-function), to let CSRs generate a PDF report of customer data and automatically email it to the customer using a Power Automate flow. Adding voice capabilities to the AI agent will enable even faster access to data.

Continually refining and improving the consolidation of data is another area of interest. For instance, T-Mobile is looking into creating a direct connection between Dataverse and the source systems using the [prebuilt connectors](/connectors/connector-reference/) available with Power Platform.

More AI agents are planned for both new and existing Power Platform solutions across the company. For instance, an AI agent for the Orbit app will be used for a wide range of functions, including summarizing long text fields within the app, providing faster, more contextual search, and more.

A multi-agent architecture is being planned. Instead of having many different topics, T-Mobile plans to have different agents, each dedicated to one specific task. They even plan on having the application use its own AI model.

## Related information

- [Microsoft Copilot Studio guidance documentation](/microsoft-copilot-studio/guidance/)
- [Building your own copilot with Copilot Studio](https://www.microsoft.com/microsoft-copilot/blog/copilot-studio/building-your-own-copilot-with-copilot-studio/)
- [Quickstart: Create and deploy an agent](/microsoft-copilot-studio/nlu-gpt-quickstart)
- [Introduction to Generative AI - Exploring the basics](/training/modules/intro-generative-ai-explore-basics/)
- [Copilot Studio Implementation Guide](https://aka.ms/CopilotStudioImplementationGuide)
- [Add a custom Copilot to a canvas app](/power-apps/maker/canvas-apps/add-custom-copilot)
- [Search public data or use a Bing Custom Search for generative answers nodes](/microsoft-copilot-studio/nlu-generative-answers-bing)
- [Optimize prompts using Bing Custom Search](/microsoft-copilot-studio/guidance/optimize-prompts-bing-custom-search)
- [Bing Custom Search web portal](https://www.customsearch.ai/)
- [Overview of pipelines in Power Platform](/power-platform/alm/pipelines)
