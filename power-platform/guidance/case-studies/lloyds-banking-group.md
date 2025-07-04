---
title: Lloyds Banking Group uses Power Apps for language access
description: "Power Apps language translation: Discover how Lloyds Banking Group uses Power Apps and Azure AI Services to deliver real-time, inclusive language support in banking."
#customer intent: As a Power Platform user,  I want to learn how Lloyds Banking Group built a real-time language translation app with Power Apps and Azure AI Services so that I can create inclusive solutions for my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.subservice: guidance
ms.topic: overview
ms.date: 07/04/2025
---

# Lloyds Banking Group uses Power Apps for language access

[Lloyds Banking Group](https://www.lloydsbank.com/), the UK’s largest digital bank, used Microsoft Power Apps and Azure AI Services to bridge language barriers by enabling real-time and seamless translation between English and the customer’s chosen language. The organization serves 28 million customers through a wide range of channels, including around 1,500 retail branches, online and digital channels, telephony, and mobile services. Lloyds Banking Group has made a significant strategic commitment to Microsoft Power Platform to modernize their application estate and create a more sustainable, inclusive, and accessible future for their customers and businesses.

## Challenges

According to the UK census, for 9% of the population, English isn't
their first language, and 161,000 people lack any English skills.

> We wanted to bring the group together and come up with a solution for customers to communicate with us in their preferred language.
> 
> - Georgette Loring, Assistant Manager of Group Customer Inclusion at Lloyds Banking Group.

Lloyds Banking Group understands that if they can use modern AI to make
an application where the language you spoke didn’t really matter, then
they would increase the diversity and equity of their business and open
many more banking opportunities for people in the UK.

> About four years ago, we were looking at automation tools.We came across Microsoft Power Platform and realized it perfectly suited our identified needs.
>
> - Vickie Evans, Engineering Lead for the Center of Excellence at Lloyds Banking Group

## Solution

After understanding the opportunity and importance of connecting and
communicating with customers in any language, Lloyds Banking Group used
Power Platform to build their Branch Translation App. This app was
created to improve communication with non-English speaking customers, by
using Microsoft Power Apps and [Azure AI
Services](https://azure.microsoft.com/products/ai-services). The app
enables bank employees to speak in English, where the tool translates
the conversation into the customer's preferred language.

Translation isn't a new problem to solve, but by creating a seamless
and flawless experience, this simple innovation has enhanced the company’s service delivery, and it has received positive
feedback from both employees and customers alike. The application’s
seamless integration into daily operations has improved
customer experiences, especially in multicultural areas where language
support is crucial.

By incorporating Power Apps, Azure AI Services, and custom PCF controls,
Lloyds showcases their commitment to innovation and customer-centric
solutions. The application was deployed across all branches of the bank.
The app's successful development, testing, and deployment highlights the
organization's agility in adopting cutting-edge technologies to improve
inclusivity, accessibility, and customer satisfaction.

### Center of Excellence

To support the widespread adoption and effective use of Power Platform,
Lloyds Banking Group established a Center of Excellence, using the
[Center of Excellence (CoE)
Kit](https://learn.microsoft.com/en-us/power-platform/guidance/coe/starter-kit)
for optimal governance. This center comprises over 12 specialists and 65
Power Hubs across various functions within the group. These hubs empower
over 1,400 business developers to work on the platform, which fosters a
culture of innovation and collaboration, while enabling the development
of numerous applications and automated solutions across the
organization.

The feedback from using Power Platform has been overwhelmingly positive.
Employees have expressed that they feel heard and supported, especially
with solutions like the Branch Translation App. Additionally, the
group's success stories highlight the platform's robustness and
scalability. These initiatives haven't only improved customer service
but also positioned Lloyds Banking Group among the leaders in using
technology to enhance banking experiences.

### Building the application

The functionality of the Branch Translation App is both simple and
powerful. Bank employees can speak in English, and the app translates
their speech into the customer's chosen language. This real-time
translation is facilitated by advanced AI algorithms powered by Azure AI
Services, which ensure accuracy and fluency in the translated text.

The impact of the Branch Translation App on customer service has been significant. It has enabled Lloyds Banking Group to cater to a broader range of customers. The app has been beneficial in branches located in multicultural areas, where the need for multilingual support is high. By offering this service, Lloyds Banking Group demonstrates its commitment to inclusivity and customer satisfaction, setting a new standard for customer service in the banking industry.

:::image type="content" source="media/lloyds-banking-group/translation-app.png" alt-text="Screenshot of the Branch Translation App interface in use at Lloyds Banking Group, showing multilingual support features." lightbox="media/lloyds-banking-group/translation-app.png":::

The Branch Translation App uses the following workflow:

- Spoken Text pane: The response from the speech service includes the spoken text, which is displayed in this Power Apps label component.

- Speaker icons: The speaker PCF components connect to the Speech SDK to enable speech synthesis of the spoken and translated text.

- Translated Text pane: The Speech SDK also returns the translated text, which is displayed in this Power Apps label component.

- Personal Data pane: The language API is called with the spoken text, to redact all the personal data. It then displays the extracted entities into this gallery.

- Our Services pane: The spoken text is sent to the OpenAI service to get a list of services for the customer, based on what they said.

- Microphone icon: Speech is captured by the PCF component, which uses the JavaScript Speech API to communicate with Azure Speech Services.

### Components

The architecture of the Branch Translation App consists of several key
components that work together to deliver seamless translation services:

- Power Apps: The app is built using Microsoft Power Apps, which
  provides a user-friendly interface for bank employees. Power Apps
  allows for rapid development and deployment, enabling the app to be
  quickly rolled out across multiple branches.

- Azure AI Services: The app utilizes Azure AI Services,
  specifically Azure AI Language, and Speech, to handle translation
  tasks. Language Studio provides tools for building and integrating
  language features, while Speech Studio offers speech-to-text and
  text-to-speech capabilities.

- Controls and Connectors: The app's core functionality is real-time
  translation, which is achieved through the integration of Azure AI
  Services using connectors and a custom PCF control.

### Implementation and deployment

The implementation of the Branch Translation App involved several steps
to ensure its success:

- Development and Testing: The app was developed and tested over an
  eight-week period, demonstrating the efficiency of using Power Apps
  for rapid application development. The development process included
  rigorous testing to ensure the app's accuracy and reliability.

- Deployment: The app was rolled out across multiple branches, with
  each branch employee having access to the app on their workstation.
  This widespread deployment ensures that all customers, regardless of
  their language, can receive the same high level of service.

The architecture of the Branch Translation App showcases the power of
combining Microsoft Power Apps with Azure AI Services to create
innovative solutions that address real-world challenges. By using
these technologies, Lloyds Banking Group has improved its
ability to serve a diverse customer base and enhance overall customer
satisfaction.

## Architecture

The following image shows the high-level app architecture and its components:

:::image type="content" source="media/lloyds-banking-group/arch.png" alt-text="Screenshot of the high-level app architecture and components for the Lloyds Banking Group Branch Translation App." lightbox="media/lloyds-banking-group/arch.png":::

- The team built the application using Power Apps.

- Power Automate flows communicate information from the PCF Component,
  the Connectors, and AI Builder to the Power Apps application.

- The PCF Component uses a JavaScript SDK to send a request and response
  through Azure API Management and to receive translation and
  personal-information extraction from the Azure AI Language service.

- The Connectors provide a custom REST request through API Management to
  receive OpenAI-powered banking service recommendations and AI Language
  translations, which are then sent back with a JSON response.

- AI Builder is a simple drag and drop interface that provides a
  document-processing request and response through API Management to
  Azure.

The user flow diagram below demonstrates the speech translation process:

:::image type="content" source="media/lloyds-banking-group/speech-translation.png" alt-text="Screenshot of the user flow diagram for the speech translation process in the Lloyds Banking Group Branch Translation App." lightbox="media/lloyds-banking-group/speech-translation.png":::

- The user pushes the microphone button to speak into the device.

- The Power Apps application initializes the PCF Component and passes
  the recorded audio.

- The PCF Component initializes the Speech JavaScript SDK and sends the
  voice file to Azure AI Services to analyze and translate the audio.

- Azure AI Services return the translated results to the Speech
  JavaScript SDK and to the PCF Component, which then updates the
  parameters around the data.

- The Power App application renders the results to the user. The entire
  process is seamless and accurate.

## Key takeaways

The case study of Lloyds Branch Translation App demonstrates the
potential of using Power Apps and Azure AI Services to build a seamless,
AI-driven translation and communication app, where you can communicate
in any language. Here are some key takeaways for IT professionals who
are looking to implement a similar solution in their own organizations:

- They used Power Apps to easily build the language translation app.

- They use Power Automate flows to integrate the various components with
  the application, including the PCF Component, custom REST Connectors,
  and AI Builder.

- AI Builder provides simple communication with the Azure AI Vision
  service for advanced camera-based visual document processing.

- Azure API Management simplifies the external calls to and from Azure
  AI Services.

- Azure AI Services provide language translation, personal information
  extraction, speech-to-text generation, text-to-speech generation,
  visual document processing, and OpenAI-based banking services
  recommendations.

- Their operational app was ready in eight weeks.

- They greatly enhanced customer communication and satisfaction.

> Colleagues have told us they feel like we have listened to them, when they asked for English-as-a-second-language solutions.
>
> - Georgette Loring

> Lloyds Banking Group has partnered with Microsoft on innovations that bring us closer to our customers and help us resolve their issues faster. 
>
> - Vickie Evans

Since building the Branch Translation App, Lloyds Banking Group has
greatly enhanced their customer experience. Customers and employees are
delighted that they can communicate much more freely.

## Looking ahead

Lloyds Banking Group is already working on expanding their capabilities
with Copilot Studio, advanced integrations with Power Automate data
flows, and use cases that cover mission-critical applications.

By using the right tools, Lloyds Banking Group continues to enhance
its operations while enabling employees to shape the future of the
financial industry.

> The advancement of AI, [Copilot in Power
Apps](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/ai-overview), and [Power
Automate](https://learn.microsoft.com/en-gb/power-platform/release-plan/2024wave1/power-automate/planned-features#copilot-for-power-automate) is becoming increasingly important in the banking industry. Looking
ahead, it will be important to provide the right technology and capabilities, ensuring all colleagues are included in the journey.
>
> - Jo Brown, Modern Workplace Director at Lloyds Banking Group

> This will enable the bank to innovate, help Britain prosper, and support the nation more effectively.
>
> - Vickie Evans

## Related information

- [What is Power Apps?](/power-apps/powerapps-overview)
- [Training for Power Apps](/training/powerplatform/power-apps)
- [Copilot in Power Apps overview](/power-apps/maker/canvas-apps/ai-overview)
- [Microsoft Power Platform Center of Excellence Kit](/power-platform/guidance/coe/starter-kit)
- [Overview of AI Builder](/ai-builder/overview)
- [What is Power Automate?](/power-automate/flow-types)
- [Get started with Power Automate](/training/modules/get-started-flows/)
- [What are Azure AI services?](/azure/ai-services/what-are-ai-services)
- [What is Azure AI Language?](/azure/ai-services/language-service/overview)
- [Develop natural language processing solutions with Azure AI Services](/training/paths/develop-language-solutions-azure-ai/)
- [What is the Speech service?](/azure/ai-services/speech-service/overview)
- [Speech Studio overview](/azure/ai-services/speech-service/speech-studio-overview)
