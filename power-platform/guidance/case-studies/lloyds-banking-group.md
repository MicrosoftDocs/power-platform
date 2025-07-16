---
title: Lloyds Banking Group bridges language barriers with Power Apps and Azure AI Services 
description: Learn how Lloyds Banking Group uses Power Apps and Azure AI services to deliver real-time, inclusive language support in banking.
#customer intent: As a Power Platform user, I want to learn how Lloyds Banking Group built a real-time language translation app with Power Apps and Azure AI services so that I can create inclusive solutions for my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.subservice: guidance
ms.topic: overview
ms.date: 07/16/2025
---

# Lloyds Banking Group bridges language barriers with Power Apps and Azure AI Services 

In this article, you learn how [Lloyds Banking Group](https://www.lloydsbank.com/), the UK's largest digital bank, uses Microsoft Power Apps and Azure AI services to bridge language barriers by enabling real-time and seamless translation between English and the customer's chosen language. 

The organization serves 28 million customers through a wide range of channels, including about 1,500 retail branches, online and digital channels, telephony, and mobile services. Lloyds Banking Group has made a strategic commitment to Microsoft Power Platform to modernize its apps and create a more sustainable, inclusive, and accessible future for customers and businesses.

## Business challenges

According to the UK census, 9 percent of the population doesn't speak English as their first language, and 161,000 people lack English skills.

"We wanted to bring the group together and come up with a solution for customers to communicate with us in their preferred language," explained Georgette Loring, Assistant Manager of Group Customer Inclusion at Lloyds Banking Group.

Lloyds Banking Group understands that using modern AI to create an app where language doesn't matter increases diversity and equity, and opens many more banking opportunities for people in the UK.

> About four years ago, we were looking at automation tools. We came across Microsoft Power Platform and realized it perfectly suited our identified needs."
>
> — *Vickie Evans, Engineering Lead for the Center of Excellence at Lloyds Banking Group*

## Solution

Lloyds Banking Group saw the opportunity and importance of connecting and communicating with customers in any language, so they used Power Platform to build the Branch Translation App. This app improves communication with customers who don't speak English, by using Microsoft Power Apps and [Azure AI Services](https://azure.microsoft.com/products/ai-services). The app lets bank employees speak in English, and the tool translates the conversation into the customer's preferred language.

Translation isn't a new problem, but creating a seamless experience with this simple innovation enhances the company's service delivery. Employees and customers give positive feedback. The app's integration into daily operations improves customer experiences, especially in multicultural areas where language support is crucial.

By using Power Apps, Azure AI services, and custom PCF controls, Lloyds shows its commitment to innovation and customer-focused solutions. The app is deployed across all branches of the bank.
The app's successful development, testing, and deployment show the organization's agility in adopting new technologies to improve inclusivity, accessibility, and customer satisfaction.

### Center of Excellence

To support widespread adoption and effective use of Power Platform, Lloyds Banking Group set up a Center of Excellence, using the [Center of Excellence (CoE)Kit](/power-platform/guidance/coe/starter-kit) for optimal governance. This center has over 12 specialists and 65 Power Hubs across different functions within the group. These hubs let over 1,400 business developers work on the platform, which fosters a culture of innovation and collaboration, and enables the development
of many applications and automated solutions across the organization.

Feedback from using Power Platform is overwhelmingly positive. Employees say they feel heard and supported, especially with solutions like the Branch Translation App. The group's success stories show the platform's robustness and scalability. These initiatives not only improve customer service but also position Lloyds Banking Group among the leaders in using technology to enhance banking experiences.

### Building the application

The Branch Translation App is simple and powerful. Bank employees speak in English, and the app translates their speech into the customer's chosen language. Advanced AI algorithms powered by Azure AI services ensure accuracy and fluency in the translated text.

The Branch Translation App significantly improves customer service. It lets Lloyds Banking Group serve a broader range of customers. The app is especially helpful in branches in multicultural areas, where the need for multilingual support is high. By offering this service, Lloyds Banking Group shows its commitment to inclusivity and customer satisfaction, setting a new standard for customer service in the banking industry.

:::image type="content" source="media/lloyds-banking-group/translation-app.png" alt-text="Annotated screenshot of the Branch Translation App interface in use at Lloyds Banking Group, showing multilingual support features." lightbox="media/lloyds-banking-group/translation-app.png":::

The Branch Translation App uses the following workflow:

- **Spoken Text pane**: The response from the speech service includes the spoken text, which shows in this Power Apps label component.

- **Speaker icons**: The speaker PCF components connect to the Speech SDK to enable speech synthesis of the spoken and translated text.

- **Translated Text pane**: The Speech SDK also returns the translated text, which shows in this Power Apps label component.

- **Personal Data pane**: The language API gets the spoken text to redact all personal data. It then shows the extracted entities in this gallery.

- **Our Services pane**: The spoken text goes to the OpenAI service to get a list of services for the customer, based on what they said.

- **Microphone icon**: Speech is captured by the PCF component, which uses the JavaScript Speech API to communicate with Azure Speech Services.

### Components

The architecture of the Branch Translation App consists of several key components that work together to deliver seamless translation services:

- **Power Apps**: The app uses Microsoft Power Apps, which gives a user-friendly interface for bank employees. Power Apps lets teams develop and deploy apps quickly, so the app rolls out fast across multiple branches.

- **Azure AI services**: The app uses Azure AI services, specifically Azure AI Language and Speech, to handle translation tasks. Language Studio has tools for building and integrating language features, while Speech Studio offers speech-to-text and text-to-speech capabilities.

- **Controls and connectors**: The app's core function is real-time translation, which works through the integration of Azure AI Services using connectors and a custom PCF control.

### Implementation and deployment

The implementation of the Branch Translation App includes these steps:

- **Development and testing**: The team developed and tested the app over an eight-week period, showing the efficiency of using Power Apps for rapid app development. The team tested the app to check its accuracy and reliability.

- **Deployment**: The team rolled out the app across multiple branches, and each branch employee has access to the app on their workstation. This wide deployment means all customers, regardless of their language, get the same high level of service.

The architecture of the Branch Translation App shows the power of combining Microsoft Power Apps with Azure AI services to create innovative solutions that solve real-world challenges. By using these technologies, Lloyds Banking Group improves its ability to serve a diverse customer base and enhance overall customer satisfaction.

## Architecture

The following image shows the high-level app architecture and its components.

:::image type="content" source="media/lloyds-banking-group/arch.png" alt-text="Diagram illustrating the high-level app architecture and components for the Lloyds Banking Group Branch Translation App." lightbox="media/lloyds-banking-group/arch.png":::

The workflow of the Branch Translation App is as follows:

1. The team builds the application using Power Apps.

1. Power Automate flows send information from the PCF Component, the Connectors, and AI Builder to the Power Apps application.

1. The PCF Component uses a JavaScript SDK to send a request and response through Azure API Management and to get translation and personal information extraction from the Azure AI Language service.

1. The Connectors send a custom REST request through API Management to get OpenAI-powered banking service recommendations and AI Language translations, which are then sent back with a JSON response.

1. AI Builder is a simple drag and drop interface that sends a document processing request and response through API Management to Azure.

The following user flow diagram shows the speech translation process.

:::image type="content" source="media/lloyds-banking-group/speech-translation.png" alt-text="Flow diagram illustrating the speech translation process in the Lloyds Banking Group Branch Translation App." lightbox="media/lloyds-banking-group/speech-translation.png":::

The user flow is as follows:

1. The user selects the microphone button to speak into the device.
1. The Power Apps application starts the PCF Component and sends the recorded audio.
1. The PCF Component starts the Speech JavaScript SDK and sends the voice file to Azure AI services to analyze and translate the audio.
1. Azure AI services send the translated results to the Speech JavaScript SDK and to the PCF Component, which then updates the parameters around the data.
1. The Power Apps application shows the results to the user. The process is seamless and accurate.

## Key takeaways

The Lloyds Branch Translation App case study shows how Power Apps and Azure AI services help you build a seamless, AI-driven translation and communication app. You can communicate in any language. 

Here are key takeaways for IT professionals who want to build a similar solution:

- Power Apps lets you easily build the language translation app.

- Power Automate flows integrate the components with the app, including the PCF component, custom REST connectors, and AI Builder.

- AI Builder connects with Azure AI Vision for advanced camera-based visual document processing.

- Azure API Management simplifies the external calls to and from Azure AI Services.

- Azure AI services provide language translation, personal information extraction, speech-to-text generation, text-to-speech generation, visual document processing, and OpenAI-based banking services recommendations.

- Their operational app was ready in eight weeks.

- They greatly enhanced customer communication and satisfaction.

"Colleagues have told us they feel like we have listened to them, when they asked for English-as-a-second-language solutions," Georgette Loring explained.

"Lloyds Banking Group has partnered with Microsoft on innovations that bring us closer to our customers and help us resolve their issues faster," added Vickie Evans.

Since building the Branch Translation App, Lloyds Banking Group has greatly enhanced their customer experience. Customers and employees are delighted that they can communicate much more freely.

## Looking ahead

Lloyds Banking Group is already working on expanding their capabilities with Copilot Studio, advanced integrations with Power Automate data flows, and use cases that cover mission-critical applications.

By using the right tools, Lloyds Banking Group continues to enhance its operations while enabling employees to shape the future of the financial industry.

"The advancement of AI, Copilot in Power Apps, and Power Automate is becoming increasingly important in the banking industry," shared Jo Brown, Modern Workplace Director at Lloyds Banking Group. "Looking ahead, it will be important to provide the right technology and capabilities, ensuring all colleagues are included in the journey." 

"This will enable the bank to innovate, help Britain prosper, and support the nation more effectively," added Vickie Evans.

## Related information

- [What is Power Apps?](/power-apps/powerapps-overview)
    - [Training for Power Apps](/training/powerplatform/power-apps)
    - [Copilot in Power Apps overview](/power-apps/maker/canvas-apps/ai-overview)
    - [Microsoft Power Platform Center of Excellence (coE) Starter Kit](/power-platform/guidance/coe/starter-kit)
- [Overview of AI Builder](/ai-builder/overview)
- [What is Power Automate?](/power-automate/flow-types)
    - [Get started with Power Automate](/training/modules/get-started-flows/) (training module)
- [What are Azure AI services?](/azure/ai-services/what-are-ai-services)
    - [What is Azure AI Language?](/azure/ai-services/language-service/overview)
    - [Develop natural language processing solutions in Azure](/training/paths/develop-language-solutions-azure-ai/) (training path)
    - [What is the Speech service?](/azure/ai-services/speech-service/overview)
    - [What is Speech Studio?](/azure/ai-services/speech-service/speech-studio-overview)
