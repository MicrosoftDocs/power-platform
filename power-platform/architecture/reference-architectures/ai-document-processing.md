---
title: Streamline document processing with AI Builder
description: Streamline document processing with AI Builder and Power Automate to automate data extraction and enhance workflow efficiency.
#customer intent: As a flowmaker, I want to integrate AI Builder with Power Automate so that I can process documents automatically.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/22/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Streamline document processing with AI Builder

> [!TIP]
> The article provides an example scenario and visual representation of how to process documents with AI Builder. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.



Processing documents is often a manual, time-consuming task. With Power Automate and AI Builder, you can streamline document processing and automate data extraction from various documents, such as forms, invoices, and purchase orders. 

This article provides best practices, architecture diagrams, and workflows to help you design a well-architected solution tailored to your specific requirements. Using AI Builder, you can reduce manual data entry, minimize errors, and enhance your workflow efficiency.



## Architecture diagram

:::image type="content" source="media/ai-doc-processing/ai-doc-processing.png" alt-text="Architecture diagram illustrating document processing with AI Builder, Power Automate, Dataverse, Power Apps, and Power BI." border="true" lightbox="media/ai-doc-processing/ai-doc-processing.png":::

## Workflow

1. **Inbound document submission:** A user or system submits a document (for example, invoice, purchase order, or rebate form) via email.
1. **Document processing with Power Automate and AI Builder:** A Power Automate cloud flow triggers upon receiving the email. AI Builder processes the document to extract key information (for example, invoice number, total amount, and customer details). The extracted data is stored in a Dataverse table for structured processing.
1. **Automated workflow document data review:** Based on the extracted data, a Power Automate flow handles approvals, rejection logic, or further analysis. If approval or further validation is required, the flow queues the data for review by a human via a Power App.
1. **Human review in Power Apps:** A Power App facilitates human review of the extracted data, allowing reviewers to approve, reject, or correct data as needed. This process can include providing feedback to the sender on what is needed for future approval upon resubmission.
1. **Feedback to sender:** After the review process, an automated email is sent to the sender with the approval or rejection status of the document.
1. **Reporting and analytics:** Power BI dashboards provide insights into the document processing workflow, including metrics such as processing time,  number of documents reviewed, and approval rates.

## Components

- **[AI Builder](/ai-builder/overview):** Used for extracting key data from documents using prebuilt or custom models.
- **[Power Automate](/power-automate/):** Orchestrates workflows for document processing and integrates AI Builder to process the documents.
- **[Microsoft Dataverse](/power-apps/maker/data-platform/):** Serves as the central data store for extracted document data and tracks document progress as the business process is applied.
- **[Power Apps](/power-apps/):** Facilitates human review and data corrections.
- **[Power BI](/power-bi/):** Delivers analytics and insights into the document processing workflow.

## Scenario details

This architecture streamlines and automates document-intensive business processes. By using AI Builder, organizations reduce manual data entry, minimize errors, and accelerate decision-making workflows. Use cases include the following:

- Automating invoice processing.
- Streamlining purchase order approvals.
- Simplifying rebate form processing.

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, a set of guiding tenets that improve the quality of a workload. Learn more in [Microsoft Power Platform Well-Architected](/power-platform/well-architected/).

### Reliability

- **Retry policies:** Policies configured in Power Automate handle temporary failures in document processing with AI Builder or SharePoint including Dataverse connections.

- **Monitoring and alerts:** [Application Insights](/power-platform/admin/app-insights-cloud-flow) is configured to monitor workflow health and alert on failures.

- **Document resilience:** Users can send any document. The workflow that runs the data extract must handle exceptions from the document extraction due to invalid or unexpected documents.

### Security

- **Data access control:** [Role-based access](/power-platform/admin/database-security) ensures only authorized users can access the extracted data in Dataverse.

- **Encryption:** Data in transit (via Power Automate) and at rest in Dataverse is [encrypted](/power-platform/admin/about-encryption).

- **Principle of least privilege:** Permissions are restricted to minimize exposure. Power Automate flows access systems using the least privileged accounts or a service principal where possible. Application users should only have access to the data tables that support the application.

### Operational excellence

**Application lifecycle management (ALM):** Solution assets are stored in source control, and Dataverse solutions are used to promote assets from development, to test, and then to production.

### Performance efficiency

**Use pre-built models:** Consider using prebuilt models when they match your document scenario. For example, for invoice processing use the prebuilt [invoice processing AI model](/ai-builder/prebuilt-invoice-processing). Prebuilt models save you time by eliminating the need to gather data to train and test your own model.

### Experience optimization

**Efficient handling of document review:** The app built with Power Apps should be a single-purpose application that lets users select documents that need review and quickly identify what review is needed. Actions available to the user should be easy to understand and complete without the potential for introducing human error by accidentally selecting the wrong outcome.

### Responsible AI

- **Fairness:** Document extraction models are trained with diverse data to minimize bias.

- **Reliability and safety:** Continuous monitoring ensures AI outputs are accurate and actionable. A human in the loop reviews anomalies and exceptions.

- **Privacy and security:** Data processed by AI Builder complies with GDPR (General Data Protection Regulation) and other regulations.

- **Inclusiveness:** The system supports processing documents in multiple languages and can involve a human to review the document if there are problems interpreting the provided information.

- **Transparency:** All AI outputs are traceable, with logs available for audit.

- **Accountability:** Human-in-the-loop review ensures accountability for critical decisions.

## Related resources

- [Power Automate robotic process automation documentation](/power-automate/desktop-flows/introduction)
- [Power BI documentation](/power-bi)
- [Power Platform Well-Architected Security recommendations](/power-platform/well-architected/security/)
