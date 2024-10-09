---
title: A1 Inteligencia em Viagens boosts team efficiency and customer experience with Power Automate and Copilot Studio
description: Learn how A1 Inteligencia em Viagens boosted team efficiency and customer experience with Power Automate and Copilot Studio.
author: robstand
ms.author: sashi
ms.topic: overview
ms.subservice: guidance
ms.date: 08/06/2024

---

# A1 Inteligencia em Viagens boosts team efficiency and customer experience with Power Automate and Copilot Studio

Brazil-based corporate travel agency, A1 Inteligência em Viagens, transformed the travel coordination process with their clients and team collaboration using the power of Power Automate and Microsoft Copilot Studio.

Established over 30 years ago, the agency specializes in coordinating international travel and luxury vacations for their executive client base. With a global partner network of airlines and hotels to personalize each traveler's experience, travel plans are rarely the same.

Daniel Schaurich de Oliveira is the company's Founder and CEO. Since clients traveled less frequently during the COVID-19 pandemic, Daniel utilized the time to work on improving business processes through automation. He started with time-consuming research and coordination for international travel, which required his travel agents to search multiple government websites and call embassies for the latest travel guidelines.

Accessing real-time information is vital for the agency as travel rules and border closures quickly and frequently changed during the pandemic.

The company developed *Fifi*—a copilot with the persona of a wise, older woman who knows everything about the company and the travel industry. Fifi is embedded in A1's website to provide immediate customer assistance. She's also in Microsoft Teams for easy access by staff who think of Fifi as a colleague not just a chat bot.

*"Power Platform changed our business in ways we never expected. Before Power Platform and Copilot Studio, we never thought it would be possible for us to create software. Power Platform gave us the power to put our ideas to work, easily, and in an affordable way for a small company."*

~ *Daniel Schaurich de Oliveira, CEO*

## Case study

In this technical case study, you learn how:

- A1 Inteligência em Viagens digitally transformed their travel booking process using Power Automate and Copilot Studio.
- Power Automate can replace time consuming and error-prone manual data collation tasks.
- To build upon an existing automation that creates more business solutions.
- To build a copilot with generative AI that improves customer experience.
- To establish a copilot as a core part of your team.

## The scenario

Daniel's team at A1 Inteligência em Viagens coordinates travel bookings with their corporate clients. These clients often travel to international destinations with diverse visa, documentation, and vaccination requirements that might change travel risk status. These travel requirements must be communicated to the client before departure to ensure their trip goes smoothly.

Daniel saw the potential in Power Automate to help travel agents on his team identify and collate travel requirements from various national authorities in real time.

When you automate routine, manual data checking and collation processes, it not only boosts team productivity but has the potential to improve the completeness, timeliness, and reliability of information provided.

For Daniel and his team, this automation measurably reduced the time required for travel coordination—boosting efficiency by 55%—and inspired many business improvements.

For example, this travel confirmation is automated:

:::image type="content" source="media/a1-travel/image2.png" alt-text="Screenshot of the travel booking example.":::

Daniel extended the travel booking process to automatically issue client invoices. Fifi assists team members and customers with complex questions, saving his travel agents significant time.

Since most of A1's blog traffic views travel policies, Daniel uses Power Automate and Copilot Studio together to help Fifi assist clients with creating a customized travel policy for their organization.

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

:::image type="content" source="media/a1-travel/image4.png" alt-text="A diagram that shows the travel booking process using Power Automate flow." lightbox="media/a1-travel/image4.png":::

### The Power Automate process

The Power Automate solution automatically analyzes the booking confirmation email and retrieves destination country and airport codes from Dataverse. This information is used to request the latest, real-time travel requirements through various authorities' APIs.

Manually collating data is no longer required. Information is automatically translated from English to the client's native Portuguese before being sent out.

The following steps are automated:

1. The booking system emails the booking confirmation to a shared Outlook mailbox.
1. Power Automate is triggered and searches for the travel destination in the PDF attached to the booking confirmation email.
1. Destination country and corresponding airport codes are retrieved from a [Dataverse](/power-apps/maker/data-platform/data-platform-intro) list.
1. The destination details are sent to various APIs, which use [Custom Connectors](/connectors/custom-connectors/) to retrieve travel requirements.
1. Information is translated from English to Portuguese, the national language of Brazil, using Microsoft Translator.
1. Data is formatted into an email and sent to the travel agent and client.

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
|![Condition icon](media/a1-travel/condition-icon.png)| 7. Check that the travel requirements are complete. | With a conditional, check that all received information is complete. If `yes`, get ready to send the email or if `no`, issue an error.|
|![Outlook icon](media/a1-travel/outlook-icon.png)| 8. Send the email to the travel agent and client. | With the Outlook connector, send the email to its recipients. |

### Technical considerations

- Data loss prevention (DLP) safeguards on your Power Platform environments determine the connectors available, such as custom connectors to external APIs.
- PDF analysis might require [AI Builder](/ai-builder/overview), which has licensing requirements to consider.
- Triggering the automation might require the configuration of associated systems or a new work instruction for team members. If necessary, the booking system is updated to send the travel confirmation to an email address.
- Dataverse, a part of Power Platform, makes change management simpler:

  - A Dataverse list can be contained in a Power Platform [solution](/power-apps/maker/data-platform/solutions-overview).
  - Package components can enable the use of [pipelines](/power-platform/alm/pipelines) to manage the application lifecycle.

## Automated invoicing

Each travel booking generates an invoice to be sent to the client, which is another routine, manual task. Daniel extended the design pattern for the travel coordination automation to manage invoicing with Power Automate.

The automated invoicing process:

1. Team members save invoice PDFs in a OneDrive folder.
1. Azure AI Document Intelligence extracts sales data.
1. Tax information comes in from a government API relating to the invoice.
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

*"Create a persona for the copilot. Fifi isn't only a bot, she's a work colleague, helping the team to accept and assimilate her contributions faster."*

~ *Daniel Schaurich de Oliveira, CEO*

Fifi uses [custom topics](/microsoft-copilot-studio/authoring-create-edit-topics) to generate human-like responses to frequently asked questions. Each topic is based on defined [knowledge sources](/microsoft-copilot-studio/knowledge-copilot-studio) used for [generative answers](/microsoft-copilot-studio/nlu-boost-conversations). As a copilot, Fifi gathers results from external websites using [Bing Custom Search](/microsoft-copilot-studio/guidance/optimize-prompts-bing-custom-search).

Previously, Daniel collated frequently asked questions from the team to create internal SharePoint Online content for Fifi to consume. Now, the team schedules and records their training sessions to make ongoing content development faster. The copilot creates a tutorial using the meeting transcript, which is uploaded to SharePoint Online for consumption through Copilot Studio.

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

Custom topics and associated knowledge sources are defined for each channel because questions commonly asked by travel agents are different than those asked by clients through the website.

:::image type="content" source="media/a1-travel/image11.png" alt-text="Diagram that explains how custom topics and associated knowledge sources are defined for each channel.":::

## Power Automate and Copilot Studio can create a travel policy

Fifi assists clients visiting the A1 website to generate a travel policy document for their organization.

Daniel noticed that travel arrangers are routinely looking for ways to improve their policy documentation. Therefore, Fifi is configured to provide best practice guidance. For example, how many days in advance a traveler needs to book a trip or how to handle travel expenses like meal or taxi charges are common concerns where Fifi can provide guidance.

This feature brings together Power Automate and Copilot Studio to populate a Word document template with answers provided through Fifi's interaction with the client.

Here's how the travel policy feature works:

1. A custom topic is triggered in Copilot Studio when a client makes a relevant request such as, "I want to create a Travel Policy."
1. Fifi prompts the client to answer the series of predefined questions used to populate the policy template. These questions include their name, company, the notice period that an employee is required to give for domestic or international travel, and any reimbursements paid by the company to an employee. The chat is configured to provide recommendations at each step to support data input.
1. Copilot Studio triggers Power Automate to populate placeholders in the Word document template with data provided in the client's chat responses.
1. Power Automate saves the new travel policy document and emails the file to the client.
1. Fifi completes the chat interaction with the client.

:::image type="content" source="media/a1-travel/image12.png" alt-text="Diagram that shows the steps of the solution of the automation as the chat box provides a travel policy.":::

## Build the travel policy template automation

Building the travel policy template automation requires three interrelated steps:

1. Create the Word template with placeholders using plain text [Content Controls](/office/client-developer/word/content-controls-in-word) and save the file in a SharePoint Online library.
1. Build the Power Automate workflow that populates the template file, saves it to SharePoint, and emails it to the client.
1. Set up the copilot with a custom topic that prompts the required inputs from the client and triggers the Power Automate flow.

> [!TIP]
>
> - You can enable developer features in Word to set up your [Content Controls](/office/client-developer/word/content-controls-in-word)—the placeholder fields to be populated with input from the copilot's chat with the user.
> - If you give each control a logical name, the control is easier to identify when you set up the automation.
> - Save your template into a SharePoint Online library to be used by the automation.

Building your travel template automation might look similar to this template:

:::image type="content" source="media/a1-travel/image13.png" alt-text="Screenshot that shows the building of the travel policy template automation." lightbox="media/a1-travel/image13.png":::

### Automation steps

Power Automate proceeds through several steps:

1. Use the *Run a flow from Copilot* trigger.
1. Use the *Populate a Word template* action to get the template you created.
1. Use the *Compose action to generate a unique file name* action each time a document is generated for a client
1. Save the document output.

   You can configure the SharePoint Online library to save the document output each time the flow runs.
1. Use the Outlook connector to email the new document to the user.
1. Use the *Respond to Copilot* action to indicate the document is completed and sent.

| App | Action | Description |
|-----|--------|-------------|
| ![Copilot icon](media/a1-travel/copilot-icon.png) | 1. Run a flow from Copilot Studio. | Select each input, coming from the copilot's interaction with the user, that populates the template placeholders. |
| ![Word icon](media/a1-travel/word-icon.png) | 2. Populate the Word document template. | Select the site, library, and file to use for the template. |
| ![Generate icon](media/a1-travel/generate-icon.png) | 3. Generate a unique file name. | Use a *Compose action to generate unique file name* action, for example prefixing the title with the client's company name. |
| ![SharePoint Online icon](media/a1-travel/sharepoint-online-icon.png) | 4. Create a travel policy file. | Select the folder path and file name where you want to save the new document output. |
| ![Outlook icon](media/a1-travel/outlook-icon.png) | 5. Email the policy document to the client. | Use the Outlook connector to email the customized document to the client. |
| ![Copilot icon](media/a1-travel/copilot-icon.png)| 6. Respond to the copilot. | After the document is sent through an email to the client, notify the copilot. |

### Build the copilot

You can build a copilot to set up the copilot component of this automation flow.

1. [Create a new copilot in Copilot Studio](/microsoft-copilot-studio/fundamentals-get-started?tabs=web).
1. Create a new [topic](/microsoft-copilot-studio/authoring-create-edit-topics?tabs=webApp). Describe what the topic does using keywords that the copilot can use to detect and trigger the next steps.
1. Add a series of questions. These questions are used by your copilot to ask the user to gather the inputs required to populate the content control placeholders in the Word template (one question per placeholder).
1. Select *Call an Action'* to trigger the Power Automate automation you created which generates, saves, and emails the new document.
1. Add a message at the end of the conversation so the copilot can close out the interaction with the user. For example, your last message can notify the user that the document was emailed to them.

This flow diagram shows how triggers, questions, actions, and a final message can work together in a topic:

:::image type="content" source="media/a1-travel/image15.png" alt-text="Diagram that shows the steps in a copilot toward building a new topic." lightbox="media/a1-travel/image15.png":::

> [!TIP]
> Daniel created a Copilot Studio topic with an associated Power Automate automation to enable clients to generate a customized travel policy document based on their answers to predefined questions. You can use the same solution architecture and design pattern for similar use cases in your organization, such as when you want to:
>
> - Enable website customers to generate a policy or a guideline document relevant to your industry.
> - Generate a customized conference program based on sessions or topics selected by the participant.
> - Personalize business event invitations with each attendee's name, position, title, and company.

## Related information

- [Power Platform Well-Architected](/power-platform/well-architected/)
- [Use an incoming email to trigger an automation](/power-automate/email-overview)
- [Popular scenarios for sending emails to end users](/power-automate/email-top-scenarios)
- [How to use Copilot to help build your automation](/power-automate/get-started-with-copilot)
- [Automate a business process using Power Automate training](/training/paths/automate-process-power-automate/)
- [Building your own copilot with Copilot Studio](https://www.microsoft.com/microsoft-copilot/blog/copilot-studio/building-your-own-copilot-with-copilot-studio/)
- [Quickstart guide for building copilots with generative AI](/microsoft-copilot-studio/nlu-gpt-quickstart)
- [Introduction to Generative AI - Exploring the basics](/training/modules/intro-generative-ai-explore-basics/)
