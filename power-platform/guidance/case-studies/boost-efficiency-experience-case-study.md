---
title: Boost team efficiency and customer experience with Power Automate and generative AI
description: Learn about how A1 Inteligencia em Viagens boosted team efficiency and customer experience with Power Automate and generative AI.
author: robstand
ms.author: sashi
ms.topic: overview
ms.subservice: guidance
ms.date: 07/18/2024
---
<!-- Looks like Daniel's last name is misspelled. I'm changing it from "Oliviera" to "Oliveira," which matches the image and also is what I find on the A1 website. -->
<!-- In line 120, does "Data Loss Prevention" mean "Purview Data Loss Prevention," or the generic industry term, which would be lowercase? https://styleguides.azurewebsites.net/Styleguide/Read?id=2696&topicid=56620 -->


# Boost team efficiency and customer experience with Power Automate and generative AI

Brazil-based corporate travel agency, A1 Inteligência em Viagens, transformed the travel coordination process with their clients and team collaboration using the power of Power Automate and Microsoft Copilot Studio.

Established over 30 years ago, the agency specializes in coordinating international travel and luxury vacations for their executive client base. With a global partner network of airlines and hotels to personalize each traveler's experience, travel plans are rarely the same.

Daniel Schaurich de Oliveira is the company's founder and CEO. Since clients traveled less during the Covid pandemic, Daniel used the time to work on improving business processes through automation. He started with time-consuming research and coordination for international travel, which required his travel agents to search multiple government websites and call embassies for the latest travel guidelines.

Accessing real-time information is vital for the agency as travel rules and border closures quickly and frequently changed during the pandemic.

The company developed *Fifi*—a copilot with the persona of a wise, older woman who knows everything about the company and the travel industry. Fifi is embedded in A1's website to provide immediate customer assistance. She's also in Microsoft Teams for easy access by staff who think of Fifi as a colleague not just a chat bot.

*"Power Platform changed our business in ways we never expected. Before Power Platform and Copilot Studio, we never thought it would be possible for us to create software. Power Platform gave us the power to put our ideas to work easily and in an affordable way for a small company."*

~ *Daniel Schaurich de Oliveira, CEO*

## Case study

In this technical case study, you'll learn:

- How the corporate travel agency A1 Inteligência em Viagens in Brazil digitally transformed their travel booking process using Power Automate and Copilot Studio.
- How Power Automate can replace time-consuming and error-prone manual data collation tasks.
- How to build upon an existing automation to create more business solutions.
- How to build a copilot with generative AI to improve the customer experience.
- How to establish a copilot as a core part of your team.

## The scenario

Daniel's team at A1 Inteligência em Viagens coordinates travel bookings with their corporate clients. These clients often travel to international destinations with diverse visa, documentation, and vaccination requirements that might change travel risk status. These travel requirements must be communicated to the client before departure to ensure their trip goes smoothly.

Daniel saw the potential for Power Automate to support the travel agents on his team to identify and collate travel requirements from various national authorities in real time.

When you automate routine, manual data checking and collation processes, it not only boosts team productivity but has the potential to improve the completeness, timeliness, and reliability of information provided.

For Daniel and his team, this automation measurably reduced the time required for travel coordination—boosting efficiency by 55%—and inspired many business improvements.

For example, this travel confirmation is automated:

:::image type="content" source="media/a1-travel/image2.png" alt-text="Screenshot of the travel booking example" border="true":::

Daniel extended the travel booking process automation to automatically issue client invoices.

Daniel's copilot Fifi assists team members and customers with complex questions, saving his travel agents significant time.

Since most of A1's website blog traffic focuses on travel policy content, Daniel uses Power Automate and Copilot Studio together to help Fifi assist clients with creating a customized travel policy for their organization.

:::image type="content" source="media/a1-travel/image3.png" alt-text="Screenshot of the Fifi bot on A1's website.":::

### What works well

Power Automate and Copilot Studio help A1 to:

- Schedule time each week for business improvements with Power Platform and AI.
- Inspire and advocate new ideas from leadership team members.
- Identify a well-defined, repeatable process to automate.
- Focus on how automation improves the customer or end-user experience.
- Create a persona to establish the copilot as a valuable team member.

## Streamline travel bookings with Power Automate

Daniel identified the frequently used travel booking process to automate and maximize time savings for travel agents on his team. The team previously needed to collate and check travel information manually and from multiple sources.

The travel booking process consistently needs to:

1. Get the booking confirmation, containing flight and destination details confirmed by the client.
1. Retrieve the latest predeparture travel requirements from relevant authorities and government websites.
1. Identify the latest travel risk status for the destination country.
1. Collate all information into an email and send it to the client.

:::image type="content" source="media/a1-travel/image4.png" alt-text="A diagram that shows the travel booking process using a Power Automate flow.":::

### The Power Automate process

The Power Automate solution automatically analyzes the booking confirmation email and retrieves destination country and airport codes from Dataverse. This information is used to request the latest travel requirements in real time through various authorities' APIs.

Manual data collation is no longer required and information is automatically translated from English into the client's native Portuguese before being sent out.

The following steps are automated:

1. The booking system emails the booking confirmation to a shared Outlook mailbox.
1. Power Automate is triggered and searches for the travel destination in the PDF attached to the booking confirmation email.
1. Destination country and corresponding airport codes are retrieved from a [Dataverse](/power-apps/maker/data-platform/data-platform-intro) list.
1. The destination details are sent to various APIs, which use [Custom Connectors](/connectors/custom-connectors/), to retrieve travel requirements.
1. Information is translated from English to Portuguese, the national language of Brazil, using Microsoft Translator.
1. The data is formatted into an email and sent to the travel agent and client.

:::image type="content" source="media/a1-travel/image5.png" alt-text="A diagram that shows the automation process step by step." lightbox="media/a1-travel/image5.png":::

## Build the travel booking process automation

An email being received acts as the workflow trigger—a [text function](https://community.dynamics.com/blogs/post/?postid=c009f06c-4f94-4aa4-a0ea-c19c6f33b917) to identify relevant details in the email. Next, an HTTP action retrieves information from external sources through APIs. Finally, a join action collates and formats the content collected.

| App | Action | Description |
|-|--------|---------|
|![Outlook icon](media/a1-travel/outlook-icon.png)| 1. A new email arrives in a shared mailbox. | With the Outlook connector, select a shared mailbox that triggers the workflow. |
|![Text function icon](media/a1-travel/text-function-icon.png)| 2. Find the travel destination. | With a text function, identify details (parameters) in the email to be automatically read. |
|![Variables icon](media/a1-travel/variables-icon.png)| 3. Identify the travel requirements for collection. | Variables act as placeholders to collect data during the workflow. |
|![Dataverse icon](media/a1-travel/dataverse-icon.png)| 4. Find the destination country and airport code. | With the Dataverse or SQL connector, look up destination details from a list. |
|![Http icon](media/a1-travel/http-icon.png)| 5. Collect the travel requirements. | Connect to APIs to retrieve information from external sources. A custom connector populates data—for example, credentials—for the API.|
|![Join icon](media/a1-travel/join-icon.png)| 6. Collate the travel requirements. | With the join action, collate information from various sources and formats to serve as inputs for an email. |
|![Condition icon](media/a1-travel/condition-icon.png)| 7. Check that the travel requirements are complete. | With a condition, check that all received information is complete. If `yes`, get ready to send the email or if `no`, issue an error.|
|![Outlook icon](media/a1-travel/outlook-icon.png)| 8. Send the email to the travel agent and client. | With the Outlook connector, send the email to its recipients. |

### Technical considerations

- Data Loss Prevention (DLP) safeguards on your Power Platform environments determine the connectors available, such as custom connectors to external APIs.
- PDF analysis might require [AI Builder](/ai-builder/overview), which has more licensing requirements to consider.
- Triggering the automation might require configuration of associated systems or a new work instruction for team members. If necessary, the booking system is updated to send the travel confirmation to an email address.
- Dataverse, a part of Power Platform, makes change management simpler:

  - A Dataverse list can be contained in a Power Platform [solution](/power-apps/maker/data-platform/solutions-overview).
  - Package components can enable the use of [pipelines](/power-platform/alm/pipelines) to manage the application lifecycle.

## Automated invoicing

Each travel booking generates an invoice to be sent to the client—another routine, manual task. Daniel extended the design pattern for the travel coordination automation to manage invoicing with Power Automate.

1. Team members save invoice PDFs in a OneDrive folder.
1. Azure AI Document Intelligence extracts sales data.
1. A government API sends out tax information relating to the invoice.
1. The invoice is emailed to the customer.

:::image type="content" source="media/a1-travel/image7.png" alt-text="Diagram that shows the automated invoicing process." lightbox="media/a1-travel/image7.png":::

> [!TIP]
> Daniel creates an automation to retrieve, collate, and send the latest travel requirements to his clients. You can use the same solution architecture and design pattern for similar use cases in your organization, such as:
>
> - Automatically collate your organization's travel policy and documentation requirements into an email when a team member submits a travel request.
> - Assess inspection or audit results against an external standard and send the results to a shared Microsoft Teams workspace.
> - Identify a test score that compares with a target score, then send the results to a team member for review.

*"Creativity is the main thing—to have ideas—then [automating] is easy to do."*

~ *Daniel Schaurich de Oliveira, CEO*

## Answer customer questions with Copilot Studio

Daniel created a copilot to help travel agents answer complex questions and enable customers to find information themselves on the agency's website. Automating these time-intensive tasks provides travel agents with much information.

Naming the copilot Fifi helps it become an integral and accepted part of the team.

*Create a persona for the copilot. Fifi isn't only a bot, she's a work colleague, helping the team to accept and assimilate her contributions faster.*

~ *Daniel Schaurich de Oliveira, CEO*

Fifi uses [custom topics](/microsoft-copilot-studio/authoring-create-edit-topics) to generate human-like responses to frequently asked questions. Each topic is based on defined [knowledge sources](/microsoft-copilot-studio/knowledge-copilot-studio) used for [generative answers](/microsoft-copilot-studio/nlu-boost-conversations). As a copilot, Fifi gathers results from external websites using [Bing Custom Search](/microsoft-copilot-studio/guidance/optimize-prompts-bing-custom-search).

Daniel first collated frequently asked questions from the team to create internal SharePoint Online content for Fifi to consume. Now, to make ongoing content development faster, the team schedules and records their training sessions. The copilot creates a tutorial using the meeting transcript, which is uploaded to SharePoint Online for consumption through Copilot Studio.

## Boost your copilot's conversation with knowledge sources and Bing Custom Search

The [generative answers](/microsoft-copilot-studio/nlu-boost-conversations) capability in Copilot Studio allows Fifi to find information across multiple internal and external [knowledge sources](/microsoft-copilot-studio/knowledge-copilot-studio). Fifi can provide immediate answers to diverse and often unpredictable customer questions.

Daniel configured Fifi to generate a response from selected partner airline and hotel websites using a [Bing Custom Search](/microsoft-copilot-studio/guidance/optimize-prompts-bing-custom-search), which ensures the information retrieved is authoritative and reliable.

:::image type="content" source="media/a1-travel/image8.png" alt-text="A diagram that explains the Fifi bot experience when a user asks a question.":::

As a result, Fifi provides answers that might be hard to find through a manual search:

- Perks of first-class travel
- Closest airport to a conference location
- Highest-rated hotel in a specific neighborhood

Customer experience improves through Fifi's quick responses and her ability to make recommendations.

:::image type="content" source="media/a1-travel/image9.png" alt-text="Screenshot of the Fifi bot making a recommendation for a customer's question.":::

## Enable your copilot to engage with users across different channels

Daniel designed Fifi to [interact with users across different channels](/microsoft-copilot-studio/publication-fundamentals-publish-channels). She can provide instant support for customers on A1's website and for staff members in Microsoft Teams.

:::image type="content" source="media/a1-travel/image10.png" alt-text="Screenshot that shows how a bot can be embedded in Teams.":::

Custom topics and associated knowledge sources are defined for each channel, as questions commonly asked by travel agents are different than those asked by clients through the website.

:::image type="content" source="media/a1-travel/image11.png" alt-text="Diagram that explains how custom topics and associated knowledge sources are defined for each channel.":::

## Power Automate and Copilot Studio can create a travel policy

Fifi assists clients visiting the A1 website to generate a travel policy document for their organization.

Daniel noticed that travel arrangers are routinely looking for ways to improve their policy documentation. Therefore, Fifi is configured to provide best practice guidance. For example, guidance like how many days in advance a traveler needs to book a trip or how to handle travel expenses like meal or taxi charges are common concerns.

This feature brings together Power Automate and Copilot Studio to populate a Word document template with answers provided through Fifi's interaction with the client.

Here's how this feature works:

1. A custom topic is triggered in Copilot Studio when a client makes a relevant request such as, "I want to create a Travel Policy."
1. Fifi prompts the client to answer the series of predefined questions used to populate the policy template. These questions include their name, company, the notice period that an employee is required to give for domestic or international travel, and any reimbursements paid by the company to an employee. The chat is configured to provide recommendations at each step to support data input.
1. Copilot Studio triggers Power Automate to populate placeholders in the Word document template with data provided in the client's chat responses.
1. Power Automate saves the new travel policy document and emails the file to the client.
1. Fifi completes the chat interaction with the client.

:::image type="content" source="media/a1-travel/image12.png" alt-text="Diagram that shows the steps of the solution of the automation as the chat box provides a travel policy.":::

## Build the travel policy template automation

Building the travel policy template automation requires three interrelated steps:

1. Create the Word template with placeholders using plain text [Content Controls](/office/client-developer/word/content-controls-in-word) and save the file in a SharePoint Online library.
1. Build the Power Automate workflow that picks up and populates the template file, then save it to SharePoint and email it to the client.
1. Set up the copilot with a custom topic that prompts the required inputs from the client and triggers the Power Automate flow.

Enable Developer features in Word to set up your [Content Controls](/office/client-developer/word/content-controls-in-word)—the placeholder fields to be populated with input from the copilot's chat with the user.

Give each control a logical name to make it easier to identify when you set up the automation. Save your template into a SharePoint Online library to be used by the automation.

:::image type="content" source="media/a1-travel/image13.png" alt-text="Screenshot that shows the building of the travel policy template automation." lightbox="media/a1-travel/image13.png":::

Power Automate starts with the *Run a flow from Copilot* trigger followed by a *Populate a Word template* action to pick up the template you created. Power Automate adds a *Compose action to generate a unique file name* action each time a document is generated for a client.

You can configure the SharePoint Online library to save the document output each time the flow runs, then use the Outlook connector to email the new document to the user.

Finalize the automation with the *Respond to Copilot* action to indicate the document is completed and sent.

| App | Action | Description |
|-|--------|-------------|
| ![Copilot icon](media/a1-travel/copilot-icon.png) | Run a flow from Copilot Studio. | Select each input, coming from the copilot's interaction with the user, that populates the template placeholders. |
| ![Word icon](media/a1-travel/word-icon.png) | Populate the Word document template. | Select the site, library, and file to use for the template. |
| ![Generate icon](media/a1-travel/generate-icon.png) | Generate a unique file name. | Use a *Compose action to generate unique file name* action—for example, prefixing the title with the client's company name. |
| ![SharePoint Online icon](media/a1-travel/sharepoint-online-icon.png) | Create a travel policy file. | Select the folder path and file name where you want to save the new document output. |
| ![Outlook icon](media/a1-travel/outlook-icon.png) | Email the policy document to the client. | Use the Outlook connector to email the customized document to the client. |
| ![Copilot icon](media/a1-travel/copilot-icon.png)| Respond to the copilot. | After the document is sent through an email to the client, notify the copilot. |

### Build the copilot

To set up the copilot component of this automation flow, [create a new copilot in Copilot Studio](/microsoft-copilot-studio/fundamentals-get-started?tabs=web) and then create a new [topic](/microsoft-copilot-studio/authoring-create-edit-topics?tabs=webApp). Describe what the topic does using keywords that copilot can use to detect and trigger the next steps.

Add a series of questions. These questions are used by your copilot to ask the user to gather the inputs required to populate the content control placeholders in the Word template (one question per placeholder). Then select *Call an Action* to trigger the Power Automate automation you created, which generates, saves, and emails the new document.

Adding another message at the end of the conversation enables the copilot to close out the interaction with the user, such as notifying them that the document was emailed to them.

This flow diagram shows how triggers, questions, actions, and a final message can work together in a topic:

:::image type="content" source="media/a1-travel/image15.png" alt-text="Diagram that shows the steps in a copilot toward building a new topic." lightbox="media/a1-travel/image15.png":::

> [!TIP]
> Daniel created a Copilot Studio topic with an associated Power Automate automation to enable clients to generate a customized travel policy document based on their answers to predefined questions. You can use the same solution architecture and design pattern for similar use cases in your organization, such as when you want to:
>
> - Enable website customers to generate a policy or a guideline document relevant to your industry.
> - Generate a customized conference program based on sessions or topics selected by the participant.
> - Personalize business event invitations with each attendee's name, position, title, and company.

## Learn more

- Find best practice architecture guidance with [Power Platform Well-Architected](/power-platform/well-architected/)
- [Use an incoming email to trigger an automation](/power-automate/email-overview)
- [Popular scenarios for sending emails to end users](/power-automate/email-top-scenarios)
- [How to use Copilot to help build your automation](/power-automate/get-started-with-copilot)
- [Automate a business process using Power Automate training](/training/paths/automate-process-power-automate/)
- [Building your own copilot with Copilot Studio](https://www.microsoft.com/microsoft-copilot/blog/copilot-studio/building-your-own-copilot-with-copilot-studio/)
- [Quickstart guide for building copilots with generative AI](/microsoft-copilot-studio/nlu-gpt-quickstart)
- [Introduction to Generative AI - Exploring the basics](/training/modules/intro-generative-ai-explore-basics/)
