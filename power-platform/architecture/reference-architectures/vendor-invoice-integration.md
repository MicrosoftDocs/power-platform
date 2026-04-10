---
title: ​Dynamics 365 Finance – vendor invoice (XML) integration
description: Learn how to automate vendor invoice ingestion by extracting, validating, and integrating XML invoice data from country‑specific e‑invoicing formats into Dynamics 365 Finance using Power Automate and AI Builder.
#customer intent: As a Power Platform user, I want to explore an example implementation of automated XML‑based vendor invoice integration so that I can design a well‑architected solution for automated invoice processing.
author: carcla
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 04/10/2026
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
search.audienceType:
- admin
- flowmaker
---

# ​Dynamics 365 Finance – vendor invoice (XML) integration

> [!TIP]
> This article provides an example scenario and a visual representation of how to automate vendor invoice processing useing Power Automate and AI Builder. This solution is a generalized example architecture, which can be used for many different scenarios and industries. This article is limited to best practices.  

## Architecture diagram

:::image type="content" source="media/vendor-invoice-integration/vendor-invoice-processing.png" alt-text="Diagram of vendor invoice workflow showing Power Automate trigger, XML processing, logging in SharePoint, Dynamics 365 Finance and Operations, and Outlook steps." lightbox="media/vendor-invoice-integration/vendor-invoice-processing.png":::

## Workflow

This architecture automates the end-to-end invoice processing workflow:

1. **Email Trigger**: A new email arrives in the designated shared inbox with XML attachment containing invoice details (Vendor ID, Invoice Number, Date, Amount, Line Items).

1. **XML Data Extraction**: Power Automate extracts the XML attachment and parses it using XML expressions to retrieve invoice fields.

1. **Data Validation**: The extracted data is validated against multiple criteria:

    - Vendor existence verification in D365

    - Invoice number format validation

    - Document Type Detection

    - Amount calculation verification

    - Unit of Measure Validation (Based on Country)

    - Date format validation

1. **Data Transformation**: Extracted XML fields are mapped to D365 entity schema, dates converted to ISO 8601 format, amounts converted to decimal, and line items prepared as arrays.

1. **D365 Integration**: The validated invoice data is created as a pending vendor invoice record in Dynamics 365 Finance & Operations using either the Dataverse connector or D365 F&O connector.

1. **Error Handling**: If any step fails, the flow logs the error, sends notification to the finance team, moves the email to a failed folder, and prevents incomplete invoices from entering D365.

**Success Notification**: Upon successful creation, Teams messages are sent to the finance channel, the tracking list is updated, and the processed email is moved to an archive folder with the D365 invoice reference number.

## Use case details

### Business Problem

Multinational company receive large volumes of supplier invoices in XML from Peru (SUNAT CPE/UBL), Chile (SII DTE), and Mexico (SAT CFDI). Manual download, interpretation, and keying of these XMLs into Dynamics 365 (or any ERP) is slow, error‑prone, and does not consistently enforce local e‑invoicing rules. Teams must also reconcile XML data with PDFs and validate vendor master/tax IDs.

### Solution

Implement a Power Automate–based XML invoice ingestion pattern that:

- Monitors shared AP mailboxes per country, extracts XML/PDF attachments, and routes them into an automation.​

- Parses each country’s XML into a normalized internal schema (header, lines, taxes, parties, keys like UUID/folio).

- Applies country‑aware validation (tax ID formats, document type, totals/taxes, mandatory tags) before creating pending vendor invoices in D365.

- Creates a unified audit log (SharePoint/Dataverse) and attaches original XML/PDF to the ERP document for long‑term retention

## Components

**Email and Workflow Services**

- [Power Automate Cloud Flow](https://azure.microsoft.com/services/developer-tools/power-automate) is a low-code workflow automation platform that orchestrates the entire invoice processing pipeline. Cloud flows execute on demand when emails arrive with attachments, making it an ideal trigger mechanism for automated invoice ingestion.

**Data Extraction and Processing**

- [AI Builder Custom Prompt](https://learn.microsoft.com/ai-builder/form-processing-model-overview) Extracts PO reference and UUID from PDF invoices if not present in XML; classifies invoice type in some scenarios

**ERP Integration**

- [Dynamics 365 Finance & Operations](https://learn.microsoft.com/dynamics365/finance/finance-insights/overview-finance-insights) is the target system where pending vendor invoices are created. The architecture uses the native D365 F&O connector (VendorInvoiceHeaderEntity).

**Data Integration and Validation**

- SharePoint Online Lists serves foundational data layer for invoice logging and exception tracking.

- [Microsoft Dataverse](https://learn.microsoft.com/power-apps/maker/data-platform/data-platform-intro) virtual tables enable seamless validation with D365 Finance & Operations.

**Notification and Monitoring**

- [Microsoft Teams](https://www.microsoft.com/microsoft-teams/group-chat-software) provides real-time notifications to finance personnel upon invoice processing results.

- [Outlook/Exchange Online](https://learn.microsoft.com/exchange/exchange-online) triggers the workflow and failure notifications. Also provides email organization through folder management.

## Considerations

These considerations implement the pillars of the Power Platform Well-Architected Framework, ensuring the invoice processing solution is robust, secure, maintainable, and optimized

### Reliability

- **Error Isolation**: Implemented Try-Catch scopes in Power Automate to handle parsing failures, validation errors, and D365 integration issues separately, preventing one failure from blocking the entire batch.

- **Idempotent Detection**: Invoice number + vendor RFC combination prevents duplicate D365 submissions if email redelivered.

- **Fallback Mechanisms**: Backup email folders and manual queue systems for invoices that fail automated processing, ensuring no invoices are lost.

- **Dual-Layer Logging**: Primary SharePoint + secondary email notification ensure exception visibility even if logging fails.

- **Retry Policies**: Default timeout handling (5-minute action timeout) with catch scope routing to exception handling

### Security

- **Access Control**: Email inbox, SharePoint library, D365 service account all restricted to authorized personnel.

- **Data Protection**: Ensure XML attachments having sensitive vendor data are processed securely. Implement encryption for sensitive fields like bank account information if present in invoices.

- **Compliance**: Ensure all invoice processing adheres to financial regulations (SOX compliance, GST/HST requirements, local tax regulations) by implementing validation rules aligned with regulatory requirements.

- **Service Account**: Minimal permissions (READ on VendorsV2/UnitsOfMeasure; CREATE on invoice tables only)

### Operational Excellence

- **Standardization**: Mandate consistent XML schema formats from all vendors to simplify parsing logic. Provide vendors with XML templates to ensure compatibility.

- **Documentation**: Create runbooks for common error scenarios, XML format troubleshooting, and D365 configuration changes. Document all expressions and validation rules used.

- **Support Process**: Train finance and IT support teams on how to diagnose flow failures using Power Automate run history, find errors in logs, and execute manual recovery procedures.

- **Change Management**: Evaluate all changes to parsing logic, validation rules, and D365 mappings in a dev environment before production deployment. Use version control for Power Automate flow exports.

### Performance Efficiency

- **Batch Mode**: At 200+ invoices/day, switch to scheduled flow every 15 minutes instead of per-email trigger.

- **Optimization**: Monitor flow run duration and parsing time. For complex XML structures, optimize expressions to minimize processing overhead. Implement caching for vendor lookups to avoid redundant D365 queries.

- **Connector Throttling**: Be aware of Power Automate connector rate limits (2,000 requests per 60 seconds for cloud connectors). For very high volumes, implement queuing mechanisms using Dataverse tables.

- **Scalability**: As invoice volume grows, transition from per-email triggers to batch processing using scheduled flows that process multiple invoices in parallel using apply-to-each loop with concurrency settings.

### Experience Optimization

- **Self-Service**: Finance users can manually retry failed invoices via Power Apps button (no IT dependency).

- **Transparency**: SharePoint dashboard shows processing queue status; Power BI provides detailed analytics.

- **Clear Notifications**: Structured email format with sections: Summary, Attachments, Error Details, Recommended Action.

- **Target SLA**: 95% automated invoices processed within 2 hours from email receipt.

## Responsible AI

- **Fairness**: Custom prompt models are trained with diverse data to minimize bias.

- **Reliability and safety**: Continuous monitoring ensures that AI outputs are accurate and actionable. A human in the loop reviews anomalies and exceptions.

- **Privacy and security**: Data that AI prompt processes comply with applicable privacy regulations.

- **Inclusiveness**: The system supports processing documents in multiple languages. A human can review the document if AI Builder has problems interpreting the information.

- **Transparency**: All AI outputs are traceable, with logs available for audit.

- **Accountability**: Human-in-the-loop review ensures accountability for critical decisions.

## Next steps

- Review and adapt the XML schema requirements with vendor community.

- Plan pilot deployment with 2-3 major vendors.

- Configure test environment for UAT and validation.

- Schedule knowledge transfer sessions with AP team.

- Establish SLA targets for invoice processing (target: 95% automated within 2 hours).

- Plan Phase 2 to include additional document types (POs, receipts, credit notes).

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Pratik Kasat](https://www.linkedin.com/in/pratik-kasat-97631a40/)**, Technical Architect

## Related resources

Power Platform:

- [Power Automate cloud flows](/power-automate/overview-cloud)
- [Create custom prompt](/microsoft-copilot-studio/create-custom-prompt)

Dynamics 365:

- [Finance and Operation data entities](/dynamics365/fin-ops-core/dev-itpro/data-entities/data-entities)
- [Dynamics 365 Connector](/connectors/dynamicsax/)

Compliance:

- [CFDI Specifications](https://www.sat.gob.mx/tramitesauditoriales)
- [SUNAT Peru](https://www.sunat.gob.pe/)
- [Well-Architected Framework](https://aka.ms/powa)
