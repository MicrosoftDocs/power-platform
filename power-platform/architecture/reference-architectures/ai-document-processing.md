---
title: Streamline document processing with AI Builder
description: Learn how to streamline document processing with AI Builder and Power Automate to automate data extraction and enhance workflow efficiency.
#customer intent: As a flow maker, I want to integrate AI Builder with Power Automate so that I can process documents automatically.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/17/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Streamline document processing with AI Builder

Processing documents is often a manual, time-consuming task. With Power Automate and AI Builder, you can streamline document processing and automate data extraction from documents such as forms, invoices, and purchase orders.

> [!TIP]
> The article provides an example scenario and visual representation of how to process documents with AI Builder. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/ai-doc-processing/ai-doc-processing.png" alt-text="Architecture diagram illustrating document processing with AI Builder, Power Automate, Dataverse, Power Apps, and Power BI." border="true" lightbox="media/ai-doc-processing/ai-doc-processing.png":::

## Workflow

The following steps describe the workflow that's shown in the example architecture diagram:

1. **Inbound document submission**: A user or system submits a document, such as an invoice, purchase order, or rebate form, through email.

1. **Document processing with Power Automate and AI Builder**: On receiving the email, a Power Automate cloud flow triggers AI Builder to extract key information from the document and store it in a Dataverse table for structured processing.

1. **Automated review**: Another Power Automate flow validates the extracted data. If approval or further validation is required, the flow queues the data for review by a human.

1. **Human review**: A human reviews the extracted data in a canvas or model-driven app, which allows the reviewer to approve, reject, or correct data as needed. The review process can include providing feedback to the sender on what's needed for future approval on resubmission.

1. **Feedback to sender**: After the review, a Power Automate workflow sends an email to the sender with the approval or rejection status of the submitted document.

1. **Reporting and analytics**: Power BI dashboards provide insights into the document processing workflow, including metrics such as processing time, number of documents reviewed, and approval rates.

## Components

[**AI Builder**](/ai-builder/overview): Extracts key data from documents using prebuilt or custom models.

[**Power Automate**](/power-automate/): Orchestrates workflows for document processing.

[**Microsoft Dataverse**](/power-apps/maker/data-platform/): Serves as the central data store for extracted document data and tracks document progress through the business process.

[**Power Apps**](/power-apps/): Facilitates human review and data corrections.

[**Power BI**](/power-bi/): Delivers analytics and insights into the document processing workflow.

## Scenario details

This architecture streamlines and automates document-intensive business processes, using AI Builder to reduce manual data entry, minimize errors, and accelerate decision-making workflows. Use cases include automating invoice processing, purchase order approvals, and rebate form processing.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

- **Retry policies**: Policies configured in Power Automate handle temporary failures in document processing with AI Builder or SharePoint, including Dataverse connections.

- **Monitoring and alerts**: [Application Insights](/power-platform/admin/app-insights-cloud-flow) is configured to monitor workflow health and alert on failures.

- **Document resilience**: Users can send any document. The workflow that runs the data extract must handle exceptions due to invalid or unexpected documents.

### Security

- **Data access control**: [Role-based access](/power-platform/admin/database-security) ensures that only authorized users can access the extracted data in Dataverse.

- **Encryption**: Data in transit through Power Automate and at rest in Dataverse is [encrypted](/power-platform/admin/about-encryption).

- **Principle of least privilege**: Permissions are restricted to minimize exposure. Power Automate flows access systems using the least privileged accounts or a service principal where possible. App users should have access only to the data tables that support the app.

### Operational Excellence

**Application lifecycle management**: Solution assets are stored in source control, and Dataverse solutions are used to promote assets from development to test to production.

### Performance Efficiency

**Use prebuilt models**: Consider using prebuilt models when they match your document scenario. For example, for invoice processing use the [invoice processing prebuilt AI model](/ai-builder/prebuilt-invoice-processing). Prebuilt models save you time by eliminating the need to gather data to train and test your own model.

### Experience Optimization

**Efficient handling of document review**: The app that's built with Power Apps should be a single-purpose application that lets users select documents that need review and quickly identify what review is needed. Actions available to the user should be easy to understand and complete without the potential for introducing human error by accidentally selecting the wrong outcome.

### Responsible AI

- **Fairness**: Document extraction models are trained with diverse data to minimize bias.

- **Reliability and safety**: Continuous monitoring ensures that AI outputs are accurate and actionable. A human in the loop reviews anomalies and exceptions.

- **Privacy and security**: Data that AI Builder processes complies with applicable privacy regulations.

- **Inclusiveness**: The system supports processing documents in multiple languages. A human can review the document if AI Builder has problems interpreting the information.

- **Transparency**: All AI outputs are traceable, with logs available for audit.

- **Accountability**: Human-in-the-loop review ensures accountability for critical decisions.

## Related resources

- [Introduction to desktop flows](/power-automate/desktop-flows/introduction)
- [Power BI documentation](/power-bi)
- [Power Platform Well-Architected Security recommendations](/power-platform/well-architected/security/)
