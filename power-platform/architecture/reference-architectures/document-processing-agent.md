---  
title: Use an autonomous agent in Copilot Studio for document processing
description: Learn how to use an autonomous agent in Copilot Studio that uses generative AI for document processing.
#customer intent: As a Copilot Studio maker, I want to use an autonomous agent to process documents.
author: manuelap-msft 
ms.subservice: architecture-center  
ms.topic: example-scenario
ms.date: 06/05/2025
ms.author: jaganp
ms.reviewer: pankajsharma2087  
ms.contributors:  
  - cerenkiroglu
  - durgay
  - jdelimaruas
---  

# Use an autonomous agent in Copilot Studio for document processing

The [Document Processing agent](/microsoft-copilot-studio/template-managed-document-processor) is an autonomous agent in Copilot Studio that uses generative AI to process documents.

> [!TIP]
> The [Document Processor](/microsoft-copilot-studio/template-managed-document-processor) managed agent is a packaged solution for end-to-end document processing. It handles extraction, validation, human monitoring, and exporting to downstream apps. This article shows the reference architecture for using an autonomous agent in Copilot Studio to process documents. You can adapt the architecture example for different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/docprocessing-agent/docprocessing-agent.png" alt-text="Diagram that shows the workflow for using an autonomous agent in Copilot Studio for document processing." lightbox="media/docprocessing-agent/docprocessing-agent.png":::

### Agent instructions

The following instructions create the autonomous agent:

```copilot-prompt
You are a helpful, polite, document processing agent. You help users process documents and extract valuable information. If the user asks about any topic other than document processing, politely decline and offer to help with document-related queries.
When asked to process a document with a specific document processing event ID, extract the information from that document.
When told that a document processing event status of a document changes to Processed, validate the extracted information from the document.
When told that a document processing event status of a document changes to Validated, import the extracted information from the document into the system.
When told that a document processing event status of a document changes to Manual Review, submit the extracted information from the document to manual review.
Ignore other document processing event status changes.
```

## Workflows

There are two important workflows related to the agent:

- **Document processing**: This workflow explains how the agent processes documents.
- **Configuration**: This workflow details the steps to set up the agent for autonomous document processing.

### Document processing flow

The document processing flow works like a state machine. The agent acts as an orchestrator, and the current state is stored in the Data Processing Events table in Dataverse. Here’s how the process works:

1. A trigger identifies when a new document is ready for processing. This shows in the **Data sources** area in the architecture diagram. [Agent flows](/microsoft-copilot-studio/flows-overview) scan directories like Outlook mailboxes or SharePoint folders. When a document is added to any directory, the agent flow stores the document in the Data Processing Events table with status New and sends a message to the agent: `Process the document: {ID}.`
    - All attempts to add documents or update statuses in the Data Processing Events table follow the `Default` configuration in Power Automate. The flow retries up to four times with an exponential interval on requests that return statuses 408, 429, or 5xx, and on any connectivity exceptions.
    - If all retry attempts fail, debug and check the run history in Power Automate for the action that didn't run.

1. The agent instructions tell it to call the `Document Extraction` action when it’s asked to process a document. The action runs, and the message ID is passed through.
1. The `Document Extraction` action is an agent flow that receives a Data Processing Event ID as input and:
    - Gets the document stored in Dataverse.
    - Sends it to an AI prompt in AI Builder to process. This prompt uses GPT 4.o to:
        - Extract all relevant information from the document.
        - Format this information as a JSON document.
    - Stores the extracted information in the same Data Processing Event row.
    - Updates the status of the document to `Processed`.

1. A Dataverse trigger (agent flow) monitors the status of all documents in Data Processing Events and notifies the agent when a status changes with the message: `The status of document {ID} changed to {Status}`

1. The agent instructions tell it to call the `Document Validation` action when the status of a document changes to *Processed*. The action runs, and the message ID is passed through.

1. The `Document Validation` action is an agent flow that receives a Data Processing Event ID as input and:
    - Gets the extracted data stored in Dataverse.
    - Sends it to an AI prompt in AI Builder to validate. This prompt uses GPT 4.o to:
        - Check the extracted JSON against format rules like `dates must be in X format`.
        - Check the extracted JSON against business rules like `the author of the document must be in the Accounts table in Dataverse`.
    - If validation succeeds, it updates the status of the document to `Validated`.
    - Otherwise, it updates the status of the document to `Manual Review`.

1. If the status of the document changes to `Validated`, the instructions tell the agent to call the `Document Export` action. The action runs, and the message ID is passed through.

1. The Document Export action is an agent flow that receives a Data Processing Event ID as input and:
    - Gets the extracted data stored in Dataverse.
    - Exports this data to the target system, like the Invoices table in Dataverse.

1. If the status of the document changes to `Manual Review`, the instructions tell the agent to call the `Manual Review` action. The action runs, and the message ID is passed through.

1. The `Manual Review` action is an agent flow that receives a Data Processing Event ID as input and:
    - Gets the extracted data stored in Dataverse.
    - Creates an Approvals request for the agent admin, sharing a link to a Validation Station app where the user can edit extracted data and validate manually. This manual validation sets the status of the document to `Validated`.

1. After manual review, if the status of the document is `Validated`, step 7 runs.

Users can also manually submit documents for the agent to process using the chat page in Copilot Studio or any channel where they published the agent.

#### When you do this:

- The document is uploaded to the Data Processing Events table.
- The agent notifies itself that a new document was imported.
- The extraction prompt runs to give you a preview of what is exported in the chat pane.
- The document is processed as described in this flow, starting from step 2.

## Configuration workflow

The agent needs several configurations to operate autonomously. To make this easier, there's a comprehensive configuration experience. Here are the steps:

1. Install the Document Processing Agent in Copilot Studio. The agent solution has:
    - A Document Processing Configuration table.
    - A Validation Station Canvas App for monitoring.
    - Connection references used by the agent (Dataverse, Copilot Studio, PowerApps for Admins).
    - Connection references used by the triggers that start the agent workflow (Outlook, SharePoint).
    - Environment variables used by the triggers.
1. Launch the agent configuration wizard. This is the last step of the installation wizard in Copilot Studio. It guides you through this flow:
    1. Upload a sample document.
    1. The system sends the uploaded document to the agent's extraction prompt.
    1. The extracted content and document type appear. Select which parts of the extracted data you want to export into the system. This creates a schema that's stored in the Document Processing Configuration table and used during the document export action. You can enter advanced mode to change the AI prompt used in the document extraction action to customize it.
    1. Define validation rules using a simple UI that adds rules to the prompt used in the document validation action. You can also enter advanced mode to change the AI prompt directly.
    1. Enter the email address of the agent admin when prompted. This is used in the manual review action when creating the approval request. You can also add a custom message for the approver. This information is saved in the environment variables that come with the solution.
    1. Choose a document source from a list. These triggers start the document processing flow and usually need a connection reference and some environment variables (like mailbox name or folder address), depending on the document source you select.
    1. Finish the configuration. This creates a Dataverse table in the system with the columns you selected earlier and exports the document you used in the wizard into this table.

## Components  
Here are the key components involved in building and deploying an autonomous agent for document processing in Copilot Studio.

- [Copilot Studio](/microsoft-copilot-studio/) is part of Microsoft Power Platform no-code or low-code solutions. Copilot Studio is a graphical, low-code tool for creating an agent—including building automation with Agent Flows—and extending a Microsoft 365 Copilot with your enterprise data and scenarios.
- [Power Apps](/power-apps/) is part of Microsoft Power Platform no-code or low-code solutions. Power Apps is a suite of apps, services, connectors, and a data platform that gives you a rapid development environment to build custom apps for your business. With Power Apps, quickly build custom business apps that connect to your data in the underlying data platform ([Microsoft Dataverse](/powerapps/maker/data-platform/data-platform-intro)) or in many online and on-premises data sources, like SharePoint, Microsoft 365, Dynamics 365, and SQL Server.
- [Dataverse](/power-apps/maker/data-platform/data-platform-intro) is an operational database for multi-agent scenarios. It gives agents a secure, scalable platform to store status data, history, and conversation data. This centralized storage lets agents interact and share data, so they can perform tasks autonomously or semi-autonomously. Dataverse also lets agents connect to and update business data in different business apps, like CRM systems, so data stays consistent and up to date across the organization. With Dataverse, organizations manage and govern agent workflows for reliability, security, and operational excellence.

## Scenario details

Organizations work with structured documents, like forms, invoices, receipts, and identity documents, and unstructured documents, like memos, contracts, and customer feedback requests. One key challenge organizations face is automating document processing to optimize business processes. You can automate several steps, including document collection, classification, extraction, validation, transformation, and export. Using a Document Processing Agent offers many benefits over traditional document processing. The Document Processing Agent works out of the box as a packaged solution, so you don't need to do time-consuming data labeling during setup. Its interactive design lets you process large volumes of documents with human oversight.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

The Document Processing agent is designed for resilience, recovery, operations by using Power Platform components hosted in Azure.

### Security  

The Document Processing agent is designed to protect confidentiality, integrity, and data availability by using Power Platform components hosted in Azure. Documents imported in the Data Processing Events table are visible only to system admins. No additional data, like email body or subject, other than attached documents is stored in Dataverse. All customer-related information that's associated with a document is stored in the Processed Data column of the Data Processing Events table. You can handle GDPR requests by querying this column.

### Operational Excellence

The Document Processing agent is designed to improve operations with monitoring and insights, automate for efficiency by using Power Platform components hosted in Azure.

### Performance Efficiency

The Document Processing agent is designed to achieve performance through optimization by using Power Platform components hosted in Azure. The Document Processing agent supports processing documents of up to 20MB size. As of the most recent benchmark, it takes approximately 48 seconds to process a single document of 2 MB size. The agent is designed to sustain this processing duration for over 1,000 documents given the selected document source has sufficient storage. For other quotas and limitations, see [Limits - Power Automate](/power-automate/limits-and-config#power-platform-request-limits).

### Experience Optimization

The Document Processing agent is designed for document processing users by achieving simplicity and efficiency by using Power Platform components. The agent provides configurable experience to add document sources, allow extensibility to add additional document sources.

### Responsible AI

The Document Processing agent is designed to achieve responsible AI standards by using Power Platform components including Copilot Studio which is designed for generative AI features. Learn more: [Responsible AI FAQ for Copilot Studio](/microsoft-copilot-studio/responsible-ai-overview).

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Jaganmohan Naidu Penikalapati](https://www.linkedin.com/in/jaganmohan-naidu-penikalapati-4558b117/)**, principal software engineering manager
- **[Ceren Kiroglu](https://www.linkedin.com/in/cerenoneykiroglu/)**, senior product manager
- **[Durga Yelavarthi](https://www.linkedin.com/in/durga-yelavarthi/)**, principal architect
- **[Jo Ruas](https://www.linkedin.com/in/joao-otavio-de-lima-ruas/)**, software engineer

## Related resources

- [Install managed agents from Microsoft](/microsoft-copilot-studio/authoring-install-agent)
- [Agents in action: Document processing 2.0](https://build.microsoft.com/sessions/OD814)
- [How agent conversations work](/microsoft-copilot-studio/authoring-fundamentals#how-agent-conversations-work)

## Next steps

- Enhance the Configuration Flow to let users customize their export experience. For example, add prebuilt Power Platform connectors to export to systems like SAP or Salesforce, and let users customize the schema to fit SAP or Salesforce table entries.
- Enhance the Configuration Flow to let users connect to multiple document sources at the same time, like Outlook and SharePoint.
- Let the agent handle multiple document types at the same time by dynamically changing the schema used in exporting based on document type.
