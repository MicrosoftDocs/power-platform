---
title: A1 Inteligência em Viagens boosts team efficiency and customer experience with Power Automate and Copilot Studio
description: Learn how A1 Inteligência em Viagens boosted team efficiency and the customer experience with Power Automate and Copilot Studio.
author: robstand
ms.author: sashi
ms.topic: overview
ms.subservice: guidance
ms.date: 03/04/2025

---

# A1 Inteligência em Viagens boosts team efficiency and customer experience with Power Automate and Copilot Studio

A1 Inteligência em Viagens, a Brazil-based corporate travel agency, used the power of Microsoft Power Automate and Microsoft Copilot Studio to transform both travel coordination with its clients and team collaboration.

A1 was founded over 30 years ago by Daniel Schaurich de Oliveira, who currently serves as the company's chief executive officer (CEO). It specializes in coordinating international travel and luxury vacations for its executive client base. Because it has a global partner network of airlines and hotels that it can draw on to personalize each traveler's experience, travel plans are rarely the same.

During the COVID-19 pandemic, A1's clients traveled less. Therefore, Daniel used the time to work on improving business processes through automation. He started with the research and coordination that are required for international travel. Access to real-time information is vital for a travel agency. Even in normal circumstances, the research and coordination process is time-consuming, because travel agents must search multiple government websites and call embassies for the latest travel guidelines. The quick and frequent changes to travel rules and border closures during the pandemic made this process more challenging.

The company developed *Fifi*, a custom agent that has the persona of a wise older woman who knows everything about the company and the travel industry. Fifi is embedded in A1's website to provide immediate customer assistance. Fifi is also available in Microsoft Teams, for easy access by staff members who think of her as a colleague, not just as a chatbot.

> Power Platform changed our business in ways we never expected. Before Power Platform and Copilot Studio, we never thought it would be possible for us to create software. Power Platform gave us the power to put our ideas to work, easily, and in an affordable way for a small company.
>
> — *Daniel Schaurich de Oliveira, CEO*

## Case study

In this technical case study, you learn how:

- A1 Inteligência em Viagens digitally transformed its travel booking process by using Power Automate and Copilot Studio.
- Power Automate can replace time-consuming and error-prone manual data collation tasks.
- You can build upon an existing automation to create more business solutions.
- You can build a custom agent that uses generative AI to improve the customer experience.
- You can establish a custom agent as a core part of your team.

## The scenario

Daniel's team at A1 Inteligência em Viagens coordinates travel bookings with the company's corporate clients. These clients often travel to international destinations that have diverse visa, documentation, and vaccination requirements. In addition, the travel risk status of those destinations might change. All this information must be communicated to clients before their departure, to ensure that the trip goes smoothly.

Daniel recognized the potential of Power Automate to help travel agents on his team identify and collate travel requirements from various national authorities in real time. For example, the following travel confirmation is automated:

:::image type="content" source="media/a1-travel/image2.png" alt-text="Screenshot of an automated confirmation for a travel booking.":::

Such automation of routine, manual data checking and collation processes doesn't just boost team productivity. It also has the potential to improve the completeness, timeliness, and reliability of the information that is provided. For Daniel and his team, the automation measurably reduced the time that is required for travel coordination. The result was a 55% boost in efficiency. The automation also inspired many business improvements.

In addition, Daniel extended the travel booking process to automatically issue client invoices. Fifi helps team members and customers with complex questions, and therefore saves travel agents significant time.

Most of the traffic on A1's blog is from clients who view travel policies. Therefore, Daniel also uses Power Automate and Copilot Studio together to help Fifi assist clients with the creation of customized travel policies for their organizations.

:::image type="content" source="media/a1-travel/image3.png" alt-text="Screenshot of the Fifi bot on A1's website.":::

### What works well

Power Automate and Copilot Studio help A1:

- Schedule time each week for business improvements through Microsoft Power Platform and AI.
- Inspire and advocate for new ideas from leadership team members.
- Identify a well-defined, repeatable process that can be automated.
- Focus on how automation improves the customer or user experience.
- Create a persona that helps establish the custom agent as a valuable team member.

## Streamline travel bookings with Power Automate

Daniel identified the frequently used travel booking process as one that could be automated to maximize time savings for travel agents on his team. The team previously had to manually check and collate travel information from multiple sources.

For the travel booking process, the following steps must be completed consistently:

1. Get the booking confirmation, which contains flight and destination details that were confirmed by the client.
1. Retrieve the latest predeparture travel requirements from relevant authorities and government websites.
1. Identify the latest travel risk status for the destination country/region.
1. Collate all the information into an email and send it to the client.

:::image type="content" source="media/a1-travel/image4.png" alt-text="Diagram that shows the manual travel booking process." lightbox="media/a1-travel/image4.png":::

### The Power Automate process

The Power Automate solution automatically analyzes the booking confirmation email and retrieves destination country/region and airport codes from Dataverse. It then uses this information to request the latest, real-time travel requirements through the APIs of various authorities.

Manual collation of data is no longer required. In addition, information is automatically translated from English to the client's native Portuguese before it's sent out.

The automated travel booking process has the following steps:

1. The booking system emails the booking confirmation to a shared Outlook mailbox.
1. Power Automate is triggered and searches for the travel destination in the PDF that is attached to the booking confirmation email.
1. Destination country/region and corresponding airport codes are retrieved from a [Dataverse](/power-apps/maker/data-platform/data-platform-intro) list.
1. The destination details are sent to various APIs, which use [custom connectors](/connectors/custom-connectors/) to retrieve travel requirements.
1. Microsoft Translator is used to translate information from English to Portuguese, the national language of Brazil.
1. Data is formatted into an email and sent to the travel agent and client.

:::image type="content" source="media/a1-travel/image5.png" alt-text="Diagram that shows the steps in the automated travel booking process." lightbox="media/a1-travel/image5.png":::

### Build the travel booking process automation

Receipt of an email acts as the workflow trigger. A [text function](https://community.dynamics.com/blogs/post/?postid=c009f06c-4f94-4aa4-a0ea-c19c6f33b917) is run to identify relevant details in the email. Next, an HTTP action retrieves information from external sources through APIs. Finally, a join action collates and formats the collected content.

| App | Action | Description |
|---|--------|---------|
| ![Outlook icon.](media/a1-travel/outlook-icon.png) | 1. A new email arrives in a shared mailbox. | The Outlook connector is used to select a shared mailbox that triggers the workflow. |
| ![Text function icon.](media/a1-travel/text-function-icon.png) | 2. Find the travel destination. | A text function is used to identify details (parameters) in the email to be automatically read. |
| ![Variables icon.](media/a1-travel/variables-icon.png) | 3. Identify the travel requirements for collection. | Variables act as placeholders to collect data during the workflow. |
| ![Dataverse icon.](media/a1-travel/dataverse-icon.png) | 4. Find the destination country/region and airport codes. | The Dataverse or SQL connector is used to look up destination details in a list. |
| ![Http icon.](media/a1-travel/http-icon.png) | 5. Collect the travel requirements. | Connect to APIs to retrieve information from external sources. A custom connector populates data (for example, credentials) for the API. |
| ![Join icon.](media/a1-travel/join-icon.png) | 6. Collate the travel requirements. | The join action is used to collate information from various sources and formats to serve as inputs for an email. |
| ![Condition icon.](media/a1-travel/condition-icon.png) | 7. Confirm that the travel requirements are complete. | A conditional is used to confirm that all the received information is complete. If `yes`, prepare to send the email. If `no`, issue an error. |
| ![Outlook icon.](media/a1-travel/outlook-icon.png) | 8. Send the email to the travel agent and client. | The Outlook connector is used to send the email to its recipients. |

### Technical considerations

- Data loss prevention (DLP) safeguards on your Microsoft Power Platform environments determine the connectors that are available, such as custom connectors to external APIs.
- PDF analysis might require [AI Builder](/ai-builder/overview), which has licensing requirements that must be considered.
- Triggering the automation might require the configuration of associated systems or a new work instruction for team members. As necessary, the booking system is updated to send the travel confirmation to an email address.
- Dataverse, which is part of Microsoft Power Platform, simplifies change management:

    - A Microsoft Power Platform [solution](/power-apps/maker/data-platform/solutions-overview) can contain a Dataverse list.
    - Package components can allow for the use of [pipelines](/power-platform/alm/pipelines) to manage the application lifecycle.

### Other possible uses of the solution architecture and design pattern

Daniel created an automation to retrieve, collate, and send the latest travel requirements to clients. You can use the same solution architecture and design pattern for similar use cases in your organization. Here are some examples:

- Automatically collate your organization's travel policy and documentation requirements into an email when a team member submits a travel request.
- Assess inspection or audit results against an external standard, and send the results to a shared Teams workspace.
- Identify a test score that compares with a target score, and send the results to a team member for review.

> Creativity is the main thing—to have ideas—then \[automating\] is easy to do.
>
> — *Daniel Schaurich de Oliveira, CEO*

## Automated invoicing

Each travel booking generates an invoice that must be sent to the client. Invoicing is another routine, manual task. Therefore, Daniel extended the design pattern for the travel coordination automation so that Power Automate is used to manage invoicing.

The automated invoicing process has the following steps:

1. Team members save invoice PDFs in a OneDrive folder.
1. Azure AI Document Intelligence extracts sales data.
1. Tax information that is related to the invoice comes in from a government API.
1. The invoice is emailed to the customer.

:::image type="content" source="media/a1-travel/image7.png" alt-text="Diagram that shows the steps in the automated invoicing process." lightbox="media/a1-travel/image7.png":::

## Answer customer questions with Copilot Studio

Daniel created a custom agent to help travel agents answer complex questions, and to help customers to find information by themselves on the company's website. Automation of these tasks saves travel agents time and provides lots of information to them.

By naming the custom agent Fifi, Daniel helped it become an integral and accepted part of the team.

> Create a persona for the \[custom agent\]. Fifi isn't only a bot, she's a work colleague, helping the team to accept and assimilate her contributions faster.
>
> — *Daniel Schaurich de Oliveira, CEO*

Fifi uses [custom topics](/microsoft-copilot-studio/authoring-create-edit-topics) to generate human-like responses to frequently asked questions. Each topic is based on defined [knowledge sources](/microsoft-copilot-studio/knowledge-copilot-studio) that are used for generative answers. Fifi uses [Bing Custom Search](/microsoft-copilot-studio/guidance/optimize-prompts-bing-custom-search) to gather results from external websites.

Previously, Daniel collated frequently asked questions from the team to create internal SharePoint Online content that Fifi could consume. Now, the team schedules and records training sessions to make ongoing content development faster. Fifi uses the meeting transcript to create a tutorial. This tutorial is then uploaded to SharePoint Online for consumption through Copilot Studio.

## Boost your custom agent's conversation with knowledge sources and Bing Custom Search

Fifi uses the [generative answers](/microsoft-copilot-studio/nlu-boost-conversations) capability in Copilot Studio to find information across multiple internal and external knowledge sources. Therefore, Fifi can provide immediate answers to diverse and, often, unpredictable customer questions.

Daniel configured Fifi to use [Bing Custom Search](/microsoft-copilot-studio/guidance/optimize-prompts-bing-custom-search) to generate responses based on information from selected partner airline and hotel websites. This approach ensures that the retrieved information is authoritative and reliable.

:::image type="content" source="media/a1-travel/image8.png" alt-text="Diagram that shows the Fifi bot experience when a user asks a question.":::

As a result, Fifi provides answers that might be hard to find through a manual search:

- The perks of first-class travel
- The closest airport to a conference location
- The highest-rated hotel in a specific neighborhood

:::image type="content" source="media/a1-travel/image9.png" alt-text="Screenshot that shows the Fifi bot answering a customer's question about first-class travel.":::

Fifi's quick responses and ability to make recommendations help improve the customer experience.

## Design your custom agent to engage with users across different channels

Daniel designed Fifi to [interact with users across different channels](/microsoft-copilot-studio/publication-fundamentals-publish-channels). Fifi can provide instant support to customers on the A1 Inteligência em Viagens website and to staff members in Teams.

:::image type="content" source="media/a1-travel/image10.png" alt-text="Screenshot that shows the Fifi bot embedded in Teams.":::

Because the questions that travel agents typically ask differ from the questions that clients ask through the website, custom topics and associated knowledge sources are defined for each channel.

:::image type="content" source="media/a1-travel/image11.png" alt-text="Diagram that shows how the Fifi bot engages with users in different channels by using custom topics and associated knowledge sources that are defined for each channel.":::

## Use Power Automate and Copilot Studio to create a travel policy

Fifi helps clients who visit the A1 Inteligência em Viagens website generate a travel policy document for their organization.

Daniel noticed that travel arrangers routinely seek ways to improve their policy documentation. Therefore, Fifi is configured to provide guidance about best practices. Examples include guidance about the number of days in advance that a traveler should book a trip or the best way to handle travel expenses such as meal and taxi charges.

This feature brings together Power Automate and Copilot Studio to create a Word document template from answers that are provided through Fifi's interaction with the client.

Here is how the travel policy feature works:

1. A custom topic is triggered in Copilot Studio when a client makes a relevant request, such as, "I want to create a Travel Policy."
1. Fifi prompts the client to answer a series of predefined questions that are used to populate the policy template. For example, the client is asked for their name, their company, the amount of notice that employees must give for domestic or international travel, and any reimbursements that the company pays to employees. At each step, the chat is configured to provide recommendations to support data input.
1. Copilot Studio triggers Power Automate to populate placeholders in the Word document template with data that is provided in the client's chat responses.
1. Power Automate saves the new travel policy document and emails the file to the client.
1. Fifi completes the chat interaction with the client.

:::image type="content" source="media/a1-travel/image12.png" alt-text="Diagram that shows the steps in the automated travel policy creation process.":::

### Build the travel policy template automation

The process of building the travel policy template automation has three interrelated steps:

1. Create a Word template that contains placeholders. Use Plain Text [content controls](/office/client-developer/word/content-controls-in-word) to insert the fields for placeholders. Save the completed template file in a SharePoint Online library.
1. Build a Power Automate flow that populates the template file, saves it to SharePoint, and emails it to the client.
1. Set up the custom agent with a custom topic that prompts the client for the required inputs and triggers the Power Automate flow.

> [!TIP]
> - Turn on the developer features in Word. In this way, you can set up [content controls](/office/client-developer/word/content-controls-in-word) as the placeholder fields that will be populated with input from the custom agent's chat with a user.
> - Give each content control a logical name, to make it easier to identify when you set up the automation.
> - Save your template in a SharePoint Online library that the automation can use.

The following screenshot shows an example of a travel policy template that is being created for this automation. The heading at the top of the first page includes a Plain Text content control that serves as a placeholder for the company name.

:::image type="content" source="media/a1-travel/image13.png" alt-text="Screenshot that shows a travel policy template being created." lightbox="media/a1-travel/image13.png":::

### Automation steps

Power Automate proceeds through several steps:

1. Use the *Run a flow from Copilot* trigger.
1. Use the *Populate a Word template* action to get the template that was created.
1. Use the *Compose action to generate a unique file name* action each time that a document is generated for a client.
1. Save the document output.

    You can configure the SharePoint Online library to save the document output each time that the flow runs.

1. Use the Outlook connector to email the new document to the user.
1. Use the *Respond to Copilot* action to indicate that the document was completed and sent.

| App | Action | Description |
|-----|--------|-------------|
| ![Copilot icon.](media/a1-travel/copilot-icon.png) | 1. Run a flow from Copilot Studio. | Select each input that will come from the custom agent's interaction with the user and populate the template placeholders. |
| ![Word icon.](media/a1-travel/word-icon.png) | 2. Populate the Word document template. | Select the site, library, and file to use for the template. |
| ![Generate icon.](media/a1-travel/generate-icon.png) | 3. Generate a unique file name. | Use a *Compose action to generate unique file name* action that, for example, prefixes the title with the name of the client's company. |
| ![SharePoint Online icon.](media/a1-travel/sharepoint-online-icon.png) | 4. Create a travel policy file. | Select the folder path and file name where you want to save the new document output. |
| ![Outlook icon.](media/a1-travel/outlook-icon.png) | 5. Email the policy document to the client. | Use the Outlook connector to email the customized document to the client. |
| ![Copilot icon.](media/a1-travel/copilot-icon.png)| 6. Respond to the custom agent. | After the document is sent through email to the client, notify the custom agent. |

### Build the custom agent

You can build a custom agent to set up the Copilot component of the automation flow.

1. [Create a new custom agent in Copilot Studio](/microsoft-copilot-studio/fundamentals-get-started?tabs=web).
1. Create a new [topic](/microsoft-copilot-studio/authoring-create-edit-topics?tabs=webApp). In your description of what the topic does, include keywords that the custom agent can use to detect and trigger the next steps.
1. Add a series of questions that. The custom agent will ask the user these questions to gather the inputs that are required to populate the content control placeholders in the Word template. (There should be one question per placeholder.)
1. Select **Call an Action** to trigger the Power Automate automation that you created to generate, save, and email the new document.
1. Add a message at the end of the conversation, so that the custom agent can close the interaction with the user. For example, the agent's last message can notify the user that the document was emailed to them.

The following flow diagram shows how triggers, questions, actions, and a final message can work together in a topic.

:::image type="content" source="media/a1-travel/image15.png" alt-text="Diagram that shows the steps in the flow for creating a new topic." lightbox="media/a1-travel/image15.png":::

### Other possible uses of the solution architecture and design pattern

Daniel created a Copilot Studio topic and an associated Power Automate automation so that clients can generate a customized travel policy document based on their answers to predefined questions. You can use the same solution architecture and design pattern for similar use cases in your organization. Here are some examples:

- Website customers generate a policy or a guideline document that is relevant to your industry.
- A customized conference program is generated based on sessions or topics that a participant selects.
- Invitations to a business event are personalized with each attendee's name, position, title, and company.

## Related information

- [Power Platform Well-Architected](/power-platform/well-architected/)
- [Use an incoming email to trigger an automation](/power-automate/email-overview)
- [Popular scenarios for sending emails to end users](/power-automate/email-top-scenarios)
- [How to use Copilot to help build your automation](/power-automate/get-started-with-copilot)
- [Automate a business process using Power Automate training](/training/paths/automate-process-power-automate/)
- [Building your own copilot with Copilot Studio](https://www.microsoft.com/microsoft-copilot/blog/copilot-studio/building-your-own-copilot-with-copilot-studio/)
- [Introduction to Generative AI - Exploring the basics](/training/modules/intro-generative-ai-explore-basics/)
