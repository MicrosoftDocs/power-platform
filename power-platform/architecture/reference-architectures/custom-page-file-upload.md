---
title: Upload files to SharePoint with metadata from model‑driven apps
description: Learn how to use a custom page in a model-driven app for SharePoint file uploads with metadata to improve user experience and governance.
#customer intent: As a Power Platform user, I want to learn how to build a solution that lets users upload documents from a model‑driven app to SharePoint by using a custom page, including adding metadata, so that I can improve user experience and governance.
author: carcla
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
ms.date: 04/29/2026
ms.subservice: architecture-center
ms.topic: example-scenario
---

# Upload files to SharePoint with metadata from model‑driven apps

This reference architecture describes how to use a custom page in a model‑driven app to capture metadata while uploading documents to SharePoint. This approach improves user experience in model‑driven apps and supports document governance and searchability in SharePoint by enforcing metadata at upload time.

> [!TIP]
> The article provides an example scenario and visual representation that illustrate how custom pages can be used for metadata‑aware document uploads from model‑driven apps to SharePoint. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/custom-page-file-upload/custom-page-file-upload.png" alt-text="Diagram of Power Apps model-driven app launching a custom page, triggering a Power Automate cloud flow to upload files to SharePoint and create records in Dataverse." lightbox="media/custom-page-file-upload/custom-page-file-upload.png":::

## Workflow

1. A user opens a model-driven app and navigates to a record that requires document upload (for example, a Case, Contact, or Application).

1. The user selects an **Upload document** action (command bar button), which launches a custom page as a dialog within the model-driven app.

1. The custom page provides:

    1. File selection (single or multiple files).
    1. Metadata fields aligned to SharePoint document library columns.
    1. Validation and guidance based on business rules.
    1. Context of the originating record via the record ID in the model-driven app URL.

1. When the user submits the form, the custom page invokes a Power Automate cloud flow.

1. Power Automate:

    1. Uploads the files to the target SharePoint document library and/or folder based on desired location logic within the flow.

    1. Sets SharePoint metadata using values provided in the custom page.

    1. Creates or updates the corresponding Document Location record in Dataverse to maintain backward compatibility with the built-in Dataverse and SharePoint integration.

1. The uploaded documents are:

    - Associated with the originating Dataverse record.
    - Searchable and filterable in SharePoint using metadata.

## Scenario details

Organizations frequently use SharePoint document management with model‑driven apps to store documents related to business records. However, the built-in SharePoint integration doesn't allow users to populate required metadata during upload, leading to:

- Incomplete or inconsistent metadata
- Reduced searchability and compliance
- Manual rework to classify documents after upload

This architecture addresses these limitations by introducing a custom page–based upload experience that captures metadata at the point of upload. This approach improves data quality, user experience, and compliance while remaining fully within the Power Platform and Microsoft 365 ecosystem.

Key business value includes:

- Improved document governance and metadata quality
- Consistent user experience embedded in model‑driven apps
- Reduced manual intervention and reclassification
- Extensibility for complex workflows without custom code

## Components

[**Power Apps (model‑driven app)**](/power-apps): Hosts the core business experience and provides the context for document upload.

[**Power Apps custom page**](/power-apps/maker/model-driven-apps/add-page-to-model-app): Provides a flexible, low‑code UI for file upload and metadata capture, displayed as a modal dialog within the model‑driven app.

[**Power Automate**](/power-automate/): Orchestrates file upload, metadata assignment, and optional downstream processes using native SharePoint and Dataverse connectors.

[**SharePoint**](/sharepoint/): Acts as the document repository, providing document management, metadata, versioning, and security.

[**Microsoft Dataverse**](/power-apps/maker/data-platform/): Stores business data and document location records that link SharePoint documents to model‑driven app records.

Alternatives considered (higher development and maintenance effort):

- Custom [web resources](/power-apps/developer/model-driven-apps/web-resources)
- Power Apps Component Framework (PCF) [code components](/power-apps/developer/component-framework/custom-controls-overview)

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

This architecture ensures reliable document upload and metadata persistence across platform components.

- **Decoupled UI and storage**: The custom page handles user interaction and data capture. SharePoint manages file storage and metadata persistence, and Dataverse links between SharePoint and model-driven app records.

- **Transactional document handling**: Document upload and metadata assignment are a single logical operation. If metadata application fails, the process retries or rolls back the upload, so you don't get orphaned or partially classified documents.

- **Platform-native durability**: SharePoint provides built-in durability, versioning, and redundancy for document storage. Dataverse ensures reliable persistence of document location and business data.

- **Retry and failure handling**: Power Automate uses native retry policies and error handling to manage transient failures when interacting with SharePoint or Dataverse. This approach improves resilience without introducing custom infrastructure.

### Security

Security is consistently enforced across the user experience, orchestration, and storage layers.

- **Identity‑based access control**: Users authenticate through Microsoft Entra ID. Role‑based security and SharePoint permissions govern access to the model‑driven app, custom page, and SharePoint documents.

- **Least‑privilege design**: Users can upload and view documents only for records they're authorized to access in Dataverse.

- **No direct SharePoint exposure**: Users never interact directly with SharePoint libraries. All uploads occur through the custom page within the model‑driven app, reducing the risk of bypassing business rules or metadata requirements.

- **Secure connector usage**: Power Automate connections use managed identities or service principals where required.

- **Data boundary consistency**: Metadata captured in the custom page is validated against Dataverse and SharePoint schemas, preventing injection of unauthorized or malformed values.

### Operational Excellence

The architecture emphasizes maintainability, observability, and ease of change.

- **Low-code extensibility**: By using custom pages and Power Automate, you can change metadata requirements, validation rules, or upload behavior without redeploying custom code.

- **Clear separation of concerns**:

  - **Model-driven app**: Business context and navigation  
  - **Custom page**: Document upload and metadata capture  
  - **Power Automate**: Orchestration and integration  
  - **SharePoint**: Document management and compliance

- **Monitoring and diagnostics**: Power Automate run history and Dataverse auditing provide visibility into upload failures, metadata problems, and user behavior. You can extend this monitoring for use with Azure Application Insights if needed.

- **Environment strategy alignment**: The solution supports standard Power Platform environment strategies (development, test, production) by using managed solutions and environment variables for SharePoint targets.

- **Change isolation**: You can reflect metadata schema changes in SharePoint in the Custom Page UI without affecting the underlying model-driven app structure.

### Performance Efficiency

Performance considerations focus on minimizing user wait time and unnecessary processing.

- **Single interaction upload**: The initial upload captures and applies metadata, so you avoid secondary manual updates or background reprocessing.

- **Modal, in‑context UI**: The custom page runs as a modal dialog within the model‑driven app. This approach reduces page navigation and improves perceived responsiveness.

- **Asynchronous processing**: Noncritical post‑upload actions, such as notifications or classification, are handled asynchronously, ensuring the user isn't blocked.

- **Optimized data transfer**: Files are transferred directly to SharePoint by using native connectors instead of temporarily storing them in Dataverse.

- **Scalable platform services**: SharePoint and Power Automate automatically scale to support varying document volumes without manual capacity planning.

### Experience Optimization

This architecture provides a consistent, intuitive user experience.

- **Context‑aware document upload**: Users upload documents directly from the relevant business record, so the system automatically associates the document correctly.

- **Guided metadata capture**: The custom page enforces required metadata, provides validation, and can dynamically adjust fields based on document type or record context.

- **Reduced cognitive load**: Modal interaction keeps users focused on the task without navigating away from the model‑driven app.

- **Consistency with Power Platform UX**: The solution uses native Power Apps controls and patterns, ensuring accessibility, responsiveness, and familiarity.

- **Immediate feedback**: Users receive confirmation that documents and metadata are successfully saved, which increases confidence and trust in the system.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Kevin McDonald](https://www.linkedin.com/in/kevin-mcdonald-071555116/)**, Enterprise Architect
