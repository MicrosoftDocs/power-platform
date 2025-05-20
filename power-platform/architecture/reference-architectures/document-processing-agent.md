---  
title: Use an autonomous agent in Copilot Studio for document processing
description: Learn how to use an autonomous agent in Copilot Studio that leverages large language models for document processing.
#customer intent: As a Copilot Studio maker, I want to use an autonomous agent to process documents.
author: mapichle  
ms.subservice: architecture-center  
ms.topic: example-scenario
ms.date: 05/16/2025
ms.author: jaganp
ms.reviewer: pankajsharma2087  
ms.contributors:  
  - cerenkiroglu
  - durgay
  - jdelimaruas
---  

# Use an autonomous agent in Copilot Studio for document processing

The Document Processing Agent is an autonomous agent in Copilot Studio that uses Large Language Models for document processing.

> [!TIP]  
> This article provides an example scenario and a generalized example architecture to illustrate how to use an autonomous agent in Copilot Studio for document processing. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram  

:::image type="content" source="media/docprocessing-agent/docprocessing-agent.png" alt-text="Architecture diagram illustrating the workflow for using an autonomous agent in Copilot Studio for document processing." lightbox="media/docprocessing-agent/docprocessing-agent.png":::  

### Agent instructions

The following instructions were provided to create the autonomous agent:

```copilot-prompt
You are a helpful, polite, Document Processing Agent. You assist users in processing documents and extracting valuable information. If the user asks about any topic other than document processing, politely decline and offer to assist with document-related queries.
When requested to process a document with a certain document processing event ID, extract the information from that document. 
When told that a document processing event status of a document changed to Processed, validate the extracted information from the document.
When told that a document processing event status of a document changed to Validated, import the extracted information from the document into the system. 
When told that a document processing event status of a document changed to Manual Review, submit the extracted information from the document to manual review.
Ignore other document processing event status changes."
```

## Workflows

There are two important workflows related to the agent:

- **Document processing**: This workflow explains how the agent processes documents.
- **Configuration**: This workflow details the steps required to configure the agent for autonomous document processing.

### Document processing flow

The document processing flow functions like a state machine, where the agent works as an orchestrator and the current state is persisted in the Data Processing Events table in Dataverse. The process happens as follows:

1. A trigger identifies a new document is ready for processing. This is displayed on the **Data sources** area in the architecture diagram, and they are [agent flows](/microsoft-copilot-studio/flows-overview) that scan certain directories (such as Outlook Mailboxes, SharePoint folders, etc). Once a document is added in any directory, the agent flow will store the document in the *Data Processing Events* table with status *New* and send a message to the agent with the following content: `Process the document: {ID}.`
    1. All attempts to add documents or update statuses on the *Data Processing Events* table follow the *Default* configuration in Power Automate, retrying up to 4 times with an exponential interval on requests that return statuses 408, 429 or 5xx and on any connectivity exceptions.
    1. In case all retry attempts fail, it is possible to debug and check the run history in Power Automate for the particular action that could not be executed.

1. The agent instructions tell it to call the *Document Extraction* action whenever it’s requested to process a document. This action is then called, and the ID of the message is passed through.
1. The *Document Extraction* action is an agent flow that receives a Data Processing Event ID as input and:
    1. Fetches the document that was stored in Dataverse.
    1. Sends it to an AI Prompt in AI Builder to process. This prompt uses GPT 4.o to:
        1. Extract all relevant information from the document.
        1. Format this information as a JSON document.
    1. Stores extracted information in the same Data Processing Event row
    1. Updates the status of the document to “Processed”.

1. A Dataverse trigger (agent flow) monitors the status of all documents in Data Processing Events and notifies the agent whenever a status changes with the following message: `The status of document {ID} changed to {Status}`

1. The agent instructions tell it to call the *Document Validation* action whenever the status of a document is changed to *Processed*. This action is then called, and the ID of the message is passed through.

1. The *Document Validation* action is an agent flow that receives a Data Processing Event ID as input and:
    1. Fetches the extracted data that was stored in Dataverse.
    1. Sends it to an AI Prompt in AI Builder to validate. This prompt uses GPT 4.o to:
        1. Validate the extracted JSON against format rules such as “dates must be in X format”.
        1. Validate the extracted JSON against business rules such as “the author of the document must be in the *Accounts* table in Dataverse”. 
    1. If the validation succeeds, it updates the status of the document to “Validated”.
    1. Otherwise, it updates the status of the document to “Manual Review”.

1. If the status of the document changed to “Validated”, the instructions tell the agent to call the “Document Export” action. This action is then called, and the ID of the message is passed through.

1. The Document Export action is an Agent Flow that receives a Data Processing Event ID as input and:
    1. Fetches the extracted data that was stored in Dataverse.
    1. Exports this data to the target system (e.g. Invoices table in Dataverse).

1. If the status of the document changed to “Manual Review”, the instructions tell the agent to call the “Manual Review” action. This action is then called, and the ID of the message is passed through.

1. The Manual Review action is an Agent Flow that receives a Data Processing Event ID as input and:
    1. Fetches the extracted data that was stored in Dataverse.
    1. Creates an Approvals request for the agent administrator sharing a link to a Validation Station app, where the user can edit extracted data and validate manually. This manual validation sets the status of the document to “Validated”.

1. After manual review, if the status of the document is “Validated”, step 7 runs.

Lastly, users can manually submit documents for the agent to process using the chat page in Copilot Studio or in any channel they published the agent to. 

When doing so:

1. The document is uploaded to the Data Processing Events table.
1. The agent notifies itself that a new document was imported.
1. The extraction prompt is run to give the user a preview of what will be exported on the chat pane.
1. The processing of the document happens as described in this flow starting from step 2.

## Configuration workflow

To operate autonomously, the agent needs multiple configurations. To simplify this process for users, a comprehensive configuration experience has been developed. The steps are as follows:

1. A maker installs the Document Processing Agent in Copilot Studio. The solution of the agent contains:
    1. Document Processing Configuration table.
    1. Validation Station Canvas App for monitoring.
    1. Connection References used by the agent (Dataverse, Copilot Studio, PowerApps for Admins).
    1. Connection References used by the triggers that will initiate the agent workflow (Outlook, SharePoint).
    1. Environment Variables used by the triggers.
1. Maker launches agent configuration wizard. This happens as the last step of the installation wizard in Copilot Studio. It guides the user through the following flow: 1. A Maker uploads a sample document.
    1. The system sends the uploaded document to the agent’s Extraction Prompt.
    1. Extracted content is surfaced to the Maker along with Document type, where the maker can select which parts of the extracted data they want exported into the system. This will create a schema that will be stored in the Document Processing Configuration table and leveraged during the Document Export action. A maker can enter Advanced mode to make changes to the AI Prompt used in the Document Extraction action to customize it.     
    1. The Maker can then define validation rules using a simple UI interface that will append rules to the prompt used in the Document Validation action. Additionally, the Maker can enter Advanced mode to make changes directly into the AI Prompt.
    1. The Maker then is prompted to enter the email address of the agent administrator. This will be used in the Manual Review action when creating the Approval request. They can also add a customized message for the approver. This information is then persisted in Environment Variables that come with the solution.
    1. A Maker can configure document source from a list. These are the triggers that initiate the document processing flow, and they usually require the configuration of a Connection Reference and some Environment Variables (e.g. Mailbox name, Folder address) depending on which document source is selected.
    1. A Maker completes the configuration. This creates a Dataverse table in the system that has the columns the user selected in step C, and exports the document used in the wizard into this table.

## Components  

- [Copilot Studio](/microsoft-copilot-studio/) is a part of Microsoft Power Platform no-code or low-code intuitive solutions. Copilot Studio is a graphical, low-code tool for both creating an agent — including building automation with Agent Flows — and extending a Microsoft 365 Copilot with your own enterprise data and scenarios.
- [Power Apps](/power-apps/) is a part of Microsoft Power Platform no-code or low-code intuitive solutions. Power Apps is a suite of apps, services, and connectors, as well as a data platform, that provides a rapid development environment to build custom apps for your business needs. Using Power Apps, you can quickly build custom business apps that connect to your data stored either in the underlying data platform ([Microsoft Dataverse](/powerapps/maker/data-platform/data-platform-intro)) or in many online and on-premises data sources (such as SharePoint, Microsoft 365, Dynamics 365, SQL Server, and so on).
- [Dataverse](/power-apps/maker/data-platform/data-platform-intro)   plays a crucial role as an operational database in multi-agent scenarios. It provides a secure and scalable platform where agents can store their status data, history, and conversation data. This centralized storage enables seamless interaction and data sharing among agents, enhancing their ability to perform tasks autonomously or semi-autonomously. Additionally, Dataverse allows agents to connect and update business data in various business applications, such as CRM systems, ensuring that the data remains consistent and up-to-date across the organization. By leveraging Dataverse, organizations can effectively manage and govern their agentic workflows, ensuring reliability, security, and operational excellence.

## Scenario details

Organizations deal with structured documents (forms, invoices, receipts, identity documents etc.) and unstructured documents (memos, contracts, customer feedback requests etc.). One of the key challenge organisations face is automate processing of these documents to optimise business processes. There are multiple steps to be automated starting document collection, classification, extraction, validation, transform, export. Using a Document Processing Agent has many benefits compared to traditional document processing. The Document Processing Agent works out of the box as a packaged solution, eliminating the need for cumbersome data labeling during setup. Its interactive nature ensures that large-scale document processing can be executed with human oversight.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

## Reliability

Document Processing Agent is designed for resilience, recovery, operations by leveraging Power Platform components hosted in Azure.

## Security  

Document Processing Agent is designed to protect confidentiality, integrity, data availability by leveraging Power Platform components hosted in Azure. Documents imported in the Data Processing Events table are visible only by System Admins. No additional data (such as email body/subject) other than attached documents is persisted in Dataverse. All customer related information that is associated to a document is persisted in the Processed Data column of the Data Processing Events table. GDPR requests can be handled by querying this column.

## Operational Excellence

Document Processing Agent is designed to Improve operations with monitoring and insights, automate for efficiency by leveraging Power Platform components hosted in Azure.

## Performance Efficiency

Document Processing Agent is designed to achieve and sustain performance, improve efficiency through optimization by leveraging Power Platform components hosted in Azure. As of the most recent benchmark, the Document Processing Agent takes approximately 42 minutes to handle 1000 PDF documents of up to 18MB of size.  

## Experience Optimization

Document Processing Agent is designed for document processing users by achieving simplicity and efficiency by leveraging Power Platform components. Agent provides configurable experience to add document sources, allow extensibility to add additional document sources.

## Responsible AI

Document Processing Agent is designed to achieve responsible AI standards by leveraging Power Platform components including Copilot Studio which is designed for generative AI features.

## Contributors  

_Microsoft maintains this article. The following contributors wrote this article._  

Principal authors:  

- **[Jaganmohan Naidu Penikalapati](https://www.linkedin.com/in/jaganmohan-naidu-penikalapati-4558b117/)**, Principal Software Engineering Manager  
- **[Ceren Kiroglu](https://www.linkedin.com/in/cerenoneykiroglu/)**, Senior Product Manager
- **[Durga Yelavarthi](https://www.linkedin.com/in/durga-yelavarthi/)**, Principal Architect

## Next steps

- Enhancement of the Configuration Flow to allow users to further customize their export experience. That would include adding the ability of adding pre-built Power Platform Connectors to integrate exporting to different systems like SAP or Salesforce and customizing the schema to fit SAP/Salesforce table entries.
- Enhancement of the Configuration Flow to allow users to connect to multiple document sources at the same time (e.g. Outlook and SharePoint).
- Allowing Agent to handle multiple document types at the same time through dynamically changing the schema used in Exporting based on document type.
