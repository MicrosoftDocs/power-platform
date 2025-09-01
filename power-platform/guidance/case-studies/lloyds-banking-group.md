---
title: Lloyds Banking Group bridges language barriers with Power Apps and Azure AI services 
description: Learn how Lloyds Banking Group uses Power Apps and Azure AI services to deliver real-time, inclusive language support in banking.
#customer intent: As a Power Platform user, I want to learn how Lloyds Banking Group built a real-time language translation app with Power Apps and Azure AI services so that I can create inclusive solutions for my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: guidance
ms.topic: overview
ms.date: 08/29/2025
---

# Lloyds Banking Group bridges language barriers with Power Apps and Azure AI services 

In this article, you learn how [Lloyds Banking Group](https://www.lloydsbank.com/), the UK's largest digital bank, uses Microsoft Power Apps and Azure AI services to bridge language barriers by enabling real-time, seamless translation between English and the customer's preferred language.

The organization serves 28 million customers through a wide range of channels, including approximately 1,500 retail branches, online and digital channels, telephony, and mobile services. Lloyds Banking Group has made a strategic commitment to Microsoft Power Platform, to modernize its applications and create a more sustainable, inclusive, and accessible future for customers and businesses.

> About four years ago, we were looking at automation tools. We came across Microsoft Power Platform and realized it perfectly suited our identified needs.
>
> — *Vickie Evans, Engineering Lead for the Center of Excellence at Lloyds Banking Group*

## Challenges

According to the UK census, 9 percent of the population doesn't speak English as their first language, and 161,000 people lack English skills.

"We wanted to bring the group together and come up with a solution for customers to communicate with us in their preferred language," explained Georgette Loring, Assistant Manager of Group Customer Inclusion at Lloyds Banking Group.

Lloyds Banking Group recognizes that modern AI can help create apps where language is no longer a barrier. This approach promotes diversity and equity, while opening up many more banking opportunities for people across the UK.

## Solution

Lloyds Banking Group saw the opportunity and importance of connecting and communicating with customers in any language, and turned to Power Platform to build its Branch Translation App. The app improves communication with customers who don't speak English by using Microsoft Power Apps and Azure AI services. It enables bank employees to speak in English, and the tool translates the conversation into the customer's preferred language.

Translation isn't a new problem, but creating a seamless experience with this simple innovation has enhanced the company's service delivery. Both employees and customers have provided positive feedback. The application's seamless integration into daily operations has improved customer experiences, especially in multicultural areas where language support is crucial.

By using Power Apps, Azure AI services, and [code components](/power-apps/developer/component-framework/overview), Lloyds is showcasing its commitment to innovation and customer-focused solutions. The app is deployed across all branches of the bank. The app's successful development, testing, and deployment highlights the organization's agility in adopting cutting-edge technologies to improve inclusivity, accessibility, and customer satisfaction.

### Center of Excellence

To support widespread adoption and effective use of Power Platform, Lloyds Banking Group set up a Center of Excellence, using the [Center of Excellence (CoE) Starter Kit](/power-platform/guidance/coe/starter-kit) for optimal governance. This center includes over 12 specialists and 65 Power Hubs across various functions within the group. These hubs empower over 1,400 business developers to work on the platform, which fosters a culture of innovation and collaboration, and enables the development of multiple applications and automated solutions across the organization.

Feedback from using Power Platform is overwhelmingly positive. Employees say they feel heard and supported, especially with solutions like the Branch Translation App. Additionally, the group's success stories underscore the platform's robustness and scalability. These initiatives haven't only improved customer service but also positioned Lloyds Banking Group among the leaders in using technology to enhance banking experiences.

### Building the application

The Branch Translation App is simple and powerful. Bank employees speak in English, and the app translates their speech into the customer's chosen language. Advanced AI algorithms powered by Azure AI services facilitate real-time translation, ensuring accuracy and fluency in the translated text.

The impact of the Branch Translation App on customer service has been significant. It has enabled Lloyds Banking Group to cater to a broader range of customers. The app is especially helpful in branches in multicultural areas, where the need for multilingual support is high. By offering this service, Lloyds Banking Group demonstrates its commitment to inclusivity and customer satisfaction, setting a new standard for customer service in the banking industry.

:::image type="content" source="media/lloyds-banking-group/translation-app.png" alt-text="Annotated screenshot of the Branch Translation App interface in use at Lloyds Banking Group, showing multilingual support features." lightbox="media/lloyds-banking-group/translation-app.png":::

The Branch Translation App is composed of four panes, together with speaker and microphone buttons, that work together to facilitate multilingual customer interactions:

- **Spoken Text pane**: Displays the original English input from the speech service.

- **Speaker icons**: Power Apps component framework connected to the Speech JavaScript SDK enable speech synthesis of both spoken and translated text.

- **Translated Text pane**: Shows the translation of the spoken input, returned by the Speech JavaScript SDK.

- **Personal Data pane**: Uses the Language API to redact personal data from the spoken text and display extracted entities.

- **Our Services pane**: Sends spoken text to the OpenAI service to retrieve a list of relevant banking services for the customer, based on the input.

- **Microphone icon**: Captures speech via the code component, which uses the JavaScript Speech API to communicate with Azure Speech Services.

## Components

The architecture of the Branch Translation App consists of several key components that work together to deliver seamless translation services:

- **Power Apps**: Provides a user-friendly interface for bank employees. Power Apps enables rapid development and deployment, enabling quick rollout across multiple branches.

- **Azure AI services**: Uses Azure AI Language and Speech, to handle translation tasks. Language Studio supports language feature integration, while Speech Studio offers speech-to-text and text-to-speech capabilities.

- **Controls and connectors**: Real-time translation is achieved through integration with Azure AI services using connectors and a code component.

## Implementation and deployment

The implementation of the Branch Translation App involved several steps to ensure its success:

- **Development and testing**: The team developed and tested the app over an eight-week period, demonstrating the efficiency of using Power Apps for rapid app development. The development process included rigorous testing to ensure the app's accuracy and reliability.

- **Deployment**: The team rolled out the app across multiple branches, with each employee having access to the app on their workstation. This widespread deployment ensures consistent, high-level service for all customers, regardless of language.
  
## Architecture

The architecture of the Branch Translation App showcases the power of combining Microsoft Power Apps with Azure AI services to create innovative solutions that solve real-world challenges. By using these technologies, Lloyds Banking Group has improved its ability to serve a diverse customer base and enhance overall customer satisfaction.

:::image type="content" source="media/lloyds-banking-group/arch.png" alt-text="Diagram illustrating the high-level app architecture and components for the Lloyds Branch Translation App, with the left side representing the app's front-end and orchestration, and the right side illustrating the AI services that power its functionality." lightbox="media/lloyds-banking-group/arch.png":::

### High-level flow

The high-level flow of the Branch Translation App is as follows:

1. Power Apps provides a user-friendly interface. 

1. Power Automate flows send information from the code component, the connectors, and AI Builder to the Power Apps application.

1. The code component uses a JavaScript SDK to send a request and response through Azure API Management and to receive translation and personal information (PII) extraction from the Azure AI Language service.

1. The connectors send a custom REST request through API Management to receive OpenAI-powered banking service recommendations and AI Language translations, returned as a JSON response.

1. AI Builder provides a simple drag and drop interface that sends a document processing request and response through API Management to Azure.

The following flow diagram illustrates the speech translation process.

:::image type="content" source="media/lloyds-banking-group/speech-translation.png" alt-text="Flow diagram illustrating the speech translation process in the Lloyds Branch Translation App." lightbox="media/lloyds-banking-group/speech-translation.png":::

### User flow

The user flow is seamless, intuitive, and emphasizes accuracy:

1. The user selects the microphone button to speak into the device.
1. The Power Apps application initializes the code component and sends the recorded audio.
1. The code component initializes the Speech JavaScript SDK and sends the voice file to Azure AI services to analyze and translate the audio.
1. Azure AI services return the translated results to the Speech JavaScript SDK and to the code component, which then updates the data parameters.
1. The Power Apps application renders the results to the user.

## Key takeaways

The Lloyds Branch Translation App case study demonstrates the potential of using Power Apps and Azure AI services to build a seamless, AI-driven translation and communication app. Here are some key takeaways for IT professionals who are considering implementing a similar solution in their organizations:

- Power Apps simplified the process of building apps, in this case a language translation app.

- Power Automate flows integrate the various components with the app, including the code component, custom REST connectors, and AI Builder.

- AI Builder provides simple communication with the Azure AI Vision service for advanced camera-based visual document processing.

- Azure API Management simplifies the external calls to and from Azure AI services.

- Azure AI services provide language translation, personal information extraction, speech-to-text generation, text-to-speech generation, visual document processing, and OpenAI-based banking services recommendations.

The app became operational in just eight weeks, improving customer communication and satisfaction in record time. 

"Colleagues have told us they feel like we have listened to them, when they asked for English-as-a-second-language solutions," Georgette Loring explained.

"Lloyds Banking Group has partnered with Microsoft on innovations that bring us closer to our customers and help us resolve their issues faster," added Vickie Evans.

Since building the Branch Translation App, Lloyds Banking Group has greatly enhanced their customer experience. Both customers and employees are delighted that they can communicate much more freely.

## Looking ahead

Lloyds Banking Group is already working on expanding their capabilities with Copilot Studio, advanced integrations with Power Automate data flows, and use cases that cover mission-critical applications.

By using the right tools, the organization plans to continue enhancing its operations while enabling employees to shape the future of the financial industry.

"The advancement of AI, Copilot in Power Apps, and Power Automate is becoming increasingly important in the banking industry," shared Jo Brown, Modern Workplace Director at Lloyds Banking Group. "Looking ahead, it will be important to provide the right technology and capabilities, ensuring all colleagues are included in the journey." 

"This will enable the bank to innovate, help Britain prosper, and support the nation more effectively," added Vickie Evans.

## Related information

- [What is Power Apps?](/power-apps/powerapps-overview)
    - [Training for Power Apps](/training/powerplatform/power-apps)
    - [Copilot in Power Apps overview](/power-apps/maker/canvas-apps/ai-overview)
    - [Microsoft Power Platform Center of Excellence (coE) Starter Kit](/power-platform/guidance/coe/starter-kit)
    - [Code components](/power-apps/developer/component-framework/custom-controls-overview)
- [Overview of AI Builder](/ai-builder/overview)
- [What is Power Automate?](/power-automate/flow-types)
    - [Get started with Power Automate](/training/modules/get-started-flows/) (training module)
- [What are Azure AI services?](/azure/ai-services/what-are-ai-services)
    - [What is Azure AI Language?](/azure/ai-services/language-service/overview)
    - [Develop natural language processing solutions in Azure](/training/paths/develop-language-solutions-azure-ai/) (training path)
    - [What is the Speech service?](/azure/ai-services/speech-service/overview)
    - [What is Speech Studio?](/azure/ai-services/speech-service/speech-studio-overview)
