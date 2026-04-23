---
title: Use custom page as modal dialog for SharePoint file upload with metadata
description: Learn how to use a custom page as a modal dialog for SharePoint file uploads with metadata to improve user experience and governance.
#customer intent: As a Power Platform user, I want to learn how to build a solution that lets users upload documents from a model‑driven app to SharePoint by using a custom page, including adding metadata, so that I can improve user experience and governance.
author: carcla
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
ms.date: 04/23/2026
ms.subservice: architecture-center
ms.topic: example-scenario
---

# Use custom page as modal dialog for SharePoint file upload with metadata

## Architecture diagram

:::image type="content" source="media/custom-page-file-upload/custom-page-file-upload.png" alt-text="Diagram of Power Apps model-driven app launching a custom page, triggering a Power Automate cloud flow to upload files to SharePoint and create records in Dataverse." lightbox="media/custom-page-file-upload/custom-page-file-upload.png":::

## Workflow

1. A user opens a model‑driven app and navigates to a record that requires document upload (for example, a Case, Contact, or Application).

1. The user selects an Upload Document action (command bar button), which launches a Custom Page as a modal dialog within the model‑driven app.

1. The Custom Page provides:

    1. File selection (single or multiple files).

    1. Metadata fields aligned to SharePoint document library columns.

    1. Validation and guidance based on business rules.

    1. Has context of the originating record via the record id in the model-driven app URL.

1. When the user submits the form:

    1. The Custom Page invokes a Power Automate cloud flow.

1. Power Automate:

    1. Uploads the file(s) to the target SharePoint document library and/or folder based on desired location logic within the flow.

    1. Sets SharePoint metadata using values provided in the Custom Page

    1. Creates or updates the corresponding Document Location record in Dataverse to maintain backwards compatibility with the out-the-box Dataverse and SharePoint integration.

1. The uploaded documents are:

    1. Associated with the originating Dataverse record

    1. Searchable and filterable in SharePoint using metadata

## Use case details

Organisations frequently use SharePoint document management with model‑driven apps to store documents related to business records. However, the standard SharePoint integration does not allow users to populate required metadata during upload, leading to:

- Incomplete or inconsistent metadata

- Reduced searchability and compliance

- Manual rework to classify documents after upload

This architecture addresses these limitations by introducing a Custom Page–based upload experience that captures metadata at the point of upload. The approach improves data quality, user experience, and compliance while remaining fully within the Power Platform and Microsoft 365 ecosystem.

Key business value includes:

- Improved document governance and metadata quality

- Consistent user experience embedded in model‑driven apps

- Reduced manual intervention and reclassification

- Extensibility for complex workflows without custom code

## Components

- [**Power Apps (Model‑driven app)**](https://learn.microsoft.com/en-us/power-apps)  
  Hosts the core business experience and provides the context for document upload.

- [**Power Apps Custom Page**](https://learn.microsoft.com/en-us/power-apps/maker/model-driven-apps/add-page-to-model-app)  
  Provides a flexible, low‑code UI for file upload and metadata capture, displayed as a modal dialog within the model‑driven app.

- [**Power Automate**](https://learn.microsoft.com/en-us/power-automate/)  
  Orchestrates file upload, metadata assignment, and optional downstream processes using native SharePoint and Dataverse connectors.

- [**SharePoint Online**](https://learn.microsoft.com/en-us/sharepoint/)  
  Acts as the document repository, providing document management, metadata, versioning, and security.

- [**Microsoft Dataverse**](https://learn.microsoft.com/en-us/power-apps/maker/data-platform/)  
  Stores business data and document location records that link SharePoint documents to model‑driven app records.

### Alternatives Considered

- Custom web resources or PCF controls (higher development and maintenance effort)

## Considerations

This architecture aligns with the Power Platform Well‑Architected pillars.

### Reliability

This architecture is designed to ensure reliable document upload and metadata persistence across platform components.

- Decoupled UI and storage:  
  The Custom Page is responsible only for user interaction and data capture. File storage and metadata persistence are handled by SharePoint and linked through Dataverse.

- Transactional document handling:  
  Document upload and metadata assignment are treated as a single logical operation. If metadata application fails, the upload can be retried or rolled back, preventing orphaned or partially classified documents.

- Platform-native durability:  
  SharePoint Online provides built‑in durability, versioning, and redundancy for document storage, while Dataverse ensures reliable persistence of document location and business data.

- Retry and failure handling:  
  Power Automate uses native retry policies and error handling to manage transient failures when interacting with SharePoint or Dataverse, improving resilience without introducing custom infrastructure.

### Security

Security is enforced consistently across user experience, orchestration, and storage layers.

- Identity‑based access control:  
  Users authenticate through Microsoft Entra ID, and access to the model‑driven app, Custom Page, and SharePoint documents is governed by role‑based security and SharePoint permissions.

- Least‑privilege design:  
  Users can upload and view documents only for records they are authorised to access in Dataverse.

- No direct SharePoint exposure:  
  Users never interact directly with SharePoint libraries. All uploads occur through the Custom Page within the model‑driven app, reducing the risk of bypassing business rules or metadata requirements.

- Secure connector usage:  
  Power Automate connections use managed identities or service principals where required.

- Data boundary consistency:  
  Metadata captured in the Custom Page is validated against Dataverse and SharePoint schemas, preventing injection of unauthorised or malformed values.

### Operational Excellence

The architecture emphasises maintainability, observability, and ease of change.

- Low‑code extensibility:  
  The use of Custom Pages and Power Automate allows changes to metadata requirements, validation rules, or upload behaviour without redeploying custom code.

- Clear separation of concerns:

  - Model‑driven app: business context and navigation

  - Custom Page: document upload and metadata capture

  - Power Automate: orchestration and integration

  - SharePoint: document management and compliance

- Monitoring and diagnostics:  
  Power Automate run history and Dataverse auditing provide visibility into upload failures, metadata issues, and user behaviour. Where required, this can be extended for use with Application Insights.

- Environment strategy alignment:  
  The solution supports standard Power Platform environment strategies (development, test, production) using managed solutions and environment variables for SharePoint targets.

- Change isolation:  
  Metadata schema changes in SharePoint can be reflected in the Custom Page UI without impacting the underlying model‑driven app structure.

### Performance Efficiency

Performance considerations focus on minimising user wait time and unnecessary processing.

- Single interaction upload:  
  Metadata is captured and applied during the initial upload, avoiding secondary manual updates or background reprocessing.

- Modal, in‑context UI:  
  The Custom Page runs as a modal dialog within the model‑driven app, reducing page navigation and improving perceived responsiveness.

- Asynchronous processing:  
  Non‑critical post‑upload actions (such as notifications or classification) can be handled asynchronously, ensuring the user is not blocked.

- Optimised data transfer:  
  Files are transferred directly to SharePoint using native connectors rather than being stored temporarily in Dataverse.

- Scalable platform services:  
  SharePoint and Power Automate scale automatically to support varying document volumes without manual capacity planning.

### Experience Optimisation

The architecture is designed around a consistent, intuitive user experience.

- Context‑aware document upload:  
  Users upload documents directly from the relevant business record, ensuring correct association without manual linking.

- Guided metadata capture:  
  The Custom Page enforces required metadata, provides validation, and can dynamically adjust fields based on document type or record context.

- Reduced cognitive load:  
  Modal interaction keeps users focused on the task without navigating away from the model‑driven app.

- Consistency with Power Platform UX:  
  The solution uses native Power Apps controls and patterns, ensuring accessibility, responsiveness, and familiarity.

- Immediate feedback:  
  Users receive confirmation that documents and metadata have been successfully saved, increasing confidence and trust in the system.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Kevin McDonald](https://www.linkedin.com/in/kevin-mcdonald-071555116/)**, Enterprise Architect
