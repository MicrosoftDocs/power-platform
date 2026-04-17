---
title: ​Automate vendor invoice processing with Power Automate and AI Builder
description: Learn how to automate vendor invoice ingestion by extracting and validating XML invoice data using Power Automate and AI Builder.
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

# Automate vendor invoice processing with Power Automate and AI Builder

Power Automate and AI Builder can be used to automate end-to-end vendor invoice processing from Extensible Markup Language (XML) based e‑invoicing formats. This approach enables organizations to validate and integrate invoice data into Dynamics 365 Finance or other enterprise resource planning (ERP) systems with minimal manual intervention.

> [!TIP]
> This article provides an example scenario and a visual representation of how to automate vendor invoice processing using Power Automate and AI Builder. This solution is a generalized example architecture, which can be used for many different scenarios and industries. This article is limited to best practices.

## Architecture diagram

:::image type="content" source="media/vendor-invoice-integration/vendor-invoice-processing.png" alt-text="Diagram of vendor invoice workflow showing Power Automate trigger, XML processing, logging in SharePoint, Dynamics 365 Finance and Operations, and Outlook steps." lightbox="media/vendor-invoice-integration/vendor-invoice-processing.png":::

## Workflow

This architecture automates the end-to-end invoice processing workflow:

1. **Email trigger**: A new email arrives in the designated shared inbox with an XML attachment containing invoice details (vendor ID, invoice number, date, amount, line items).

1. **XML data extraction**: Power Automate extracts the XML attachment and parses it by using XML expressions to retrieve invoice fields.

1. **Data validation**: The workflow validates the extracted data against multiple criteria:

    - Vendor existence verification in Dynamics 365
    - Invoice number format validation
    - Document type detection
    - Amount calculation verification
    - Unit of measure validation (based on country/region)
    - Date format validation

1. **Data transformation**: The workflow maps extracted XML fields to the Dynamics 365 entity schema, converts dates to International Organization for Standardization (ISO) 8601 format, converts amounts to decimal, and prepares line items as arrays.

1. **Dynamics 365 integration**: The workflow creates the validated invoice data as a pending vendor invoice record in Dynamics 365 Finance and Operations by using either the Dataverse connector or Dynamics 365 connector.

1. **Error handling**: If any step fails, the flow logs the error, sends a notification to the finance team, moves the email to a failed folder, and prevents incomplete invoices from entering Dynamics 365.

**Success notification**: Upon successful creation, the workflow sends Teams messages to the finance channel, updates the tracking list, and moves the processed email to an archive folder with the Dynamics 365 invoice reference number.

## Scenario details

This use case is based on a company's approach to establishing a robust, secure, and maintainable process for integrating vendor invoices into an ERP system while minimizing manual effort.

> [!NOTE]
> A similar architectural pattern is used by Concentrix, which built a vendor invoice processing solution using Power Automate, Power Apps, AI Builder custom models, and AI prompts. Learn more in [Concentrix modernizes invoice processing with Power Platform and AI](/power-platform/guidance/case-studies/concentrix-invoice-processing).

### Business challenge

A multinational company receives large volumes of supplier invoices in XML format from Peru (SUNAT CPE/UBL - Superintendencia Nacional de Aduanas y de Administración Tributaria Comprobante de Pago Electrónico/Universal Business Language), Chile (SII DTE - Servicio de Impuestos Internos Documento Tributario Electrónico), and Mexico (SAT CFDI - Servicio de Administración Tributaria Comprobante Fiscal Digital por Internet).

Manually downloading, interpreting, and keying these XML files into Dynamics 365 (or any ERP) is slow, error‑prone, and doesn't consistently enforce local e‑invoicing rules. Teams must also reconcile XML data with PDFs and validate vendor reference data and tax identification number (TIN).

### Solution

Implement a Power Automate–based XML invoice ingestion pattern that:

- Monitors shared accounts payable (AP) mailboxes per country/region, extracts XML and PDF attachments, and routes them into an automation.

- Parses each country’s/region's XML into a normalized internal schema, including header, lines, taxes, parties, keys like universally unique identifier (UUID) or folio.

- Applies country/region‑aware validation, such as tax ID formats, document type, totals, taxes, and mandatory tags, before creating pending vendor invoices in Dynamics 365.

- Creates a unified audit log in SharePoint or Dataverse, and attaches original XML and PDF to the ERP document for long‑term retention.

## Components

### Email and workflow services

- [Power Automate cloud flow](https://azure.microsoft.com/services/developer-tools/power-automate) is a low-code workflow automation platform that orchestrates the entire invoice processing pipeline. Cloud flows execute on demand when emails arrive with attachments, making it an ideal trigger mechanism for automated invoice ingestion.

### Data extraction and processing

- [AI Builder custom prompt](/ai-builder/form-processing-model-overview) Extracts purchase order (PO) reference and UUID from PDF invoices if not present in XML; classifies invoice type in some scenarios.

### ERP integration

- [Dynamics 365 Finance and Operations](/dynamics365/finance) is the target system where pending vendor invoices are created. The architecture uses the native Dynamics 365 connector (VendorInvoiceHeaderEntity).

### Data integration and validation

- SharePoint online lists serve as a foundational data layer for invoice logging and exception tracking.

- [Microsoft Dataverse](/power-apps/maker/data-platform/data-platform-intro) virtual tables enable seamless validation with Dynamics 365 Finance and Operations.

### Notification and monitoring

- [Microsoft Teams](/microsoftteams) provides real-time notifications to finance personnel upon invoice processing results.

- [Outlook/Exchange online](/exchange/exchange-online) triggers the workflow and failure notifications. Also provides email organization through folder management.

## Considerations

These considerations implement the pillars of the Power Platform Well-Architected Framework, ensuring the invoice processing solution is robust, secure, maintainable, and optimized.

### Reliability

- **Error isolation**: Use try-catch scopes in Power Automate to handle parsing failures, validation errors, and Dynamics 365 integration issues separately. This approach prevents one failure from blocking the entire batch.

- **Idempotent detection**: Use the invoice number and vendor RFC combination to prevent duplicate Dynamics 365 submissions if an email is redelivered.

- **Fallback mechanisms**: Use backup email folders and manual queue systems for invoices that fail automated processing. This approach ensures no invoices are lost.

- **Dual-layer logging**: Use primary SharePoint and secondary email notification to ensure exception visibility even if logging fails.

- **Retry policies**: Use default timeout handling (5-minute action timeout) with catch scope routing to exception handling.

### Security

- **Access control**: Restrict email inbox, SharePoint library, and Dynamics 365 service account to authorized personnel.

- **Data protection**: Ensure XML attachments that contain sensitive vendor data are processed securely. Implement encryption for sensitive fields like bank account information if present in invoices.

- **Compliance**: Ensure all invoice processing adheres to financial regulations, such as the Sarbanes‑Oxley Act (SOX) compliance, Goods and Services Tax (GST)/Harmonized Sales Tax (HST) requirements, and other local tax regulations, by implementing validation rules aligned with regulatory requirements.

- **Service account**: Use minimal permissions (READ on VendorsV2/UnitsOfMeasure; CREATE on invoice tables only).

### Operational Excellence

- **Standardization**: Require all vendors to use consistent XML schema formats to simplify parsing logic. Give vendors XML templates to ensure compatibility.

- **Documentation**: Create runbooks for common error scenarios, XML format troubleshooting, and Dynamics 365 configuration changes. Document all expressions and validation rules used.

- **Support process**: Train finance and IT support teams on how to diagnose flow failures by using Power Automate run history, find errors in logs, and execute manual recovery procedures.

- **Change management**: Evaluate all changes to parsing logic, validation rules, and Dynamics 365 mappings in a dev environment before production deployment. Use version control for Power Automate flow exports.

### Performance Efficiency

- **Batch mode**: When more than 200 invoices needs to be processed per day, switch to a scheduled flow that runs every 15 minutes instead of using a per-email trigger.

- **Optimization**: Monitor flow run duration and parsing time. For complex XML structures, optimize expressions to minimize processing overhead. Implement caching for vendor lookups to avoid redundant Dynamics 365 queries.

- **Connector throttling**: Be aware of [Power Automate limits](/power-automate/limits-and-config). For high volumes, implement queuing mechanisms by using Dataverse tables.

- **Scalability**: As invoice volume grows, transition from per-email triggers to batch processing by using scheduled flows that process multiple invoices in parallel by using an apply to each loop with concurrency settings.

### Experience Optimization

- **Self-service**: Finance users can manually retry failed invoices by using a Power Apps button (no IT dependency).

- **Transparency**: SharePoint dashboard shows processing queue status; Power BI provides detailed analytics.

- **Clear notifications**: Structured email format with sections: Summary, Attachments, Error details, Recommended action.

- **Target SLA**: 95 percent automated invoices processed within 2 hours from email receipt.

## Responsible AI

- **Fairness**: Train custom prompt models with diverse data to minimize bias.

- **Reliability and safety**: Continuously monitor AI outputs to ensure they're accurate and actionable. A human in the loop reviews anomalies and exceptions.

- **Privacy and security**: Ensure data that AI prompt processes complies with applicable privacy regulations.

- **Inclusiveness**: Support processing documents in multiple languages. A human can review the document if AI Builder has problems interpreting the information.

- **Transparency**: All AI outputs are traceable, with logs available for audit.

- **Accountability**: Use human-in-the-loop review to ensure accountability for critical decisions.

## Next steps

- Review and adapt the XML schema requirements with vendor community.
- Plan pilot deployment with two to three major vendors.
- Configure test environment for user acceptance tests (UAT) and validation.
- Schedule knowledge transfer sessions with AP team.
- Establish service level agreement (SLA) targets for invoice processing (target: 95 percent automated within two hours).
- Plan Phase 2 to include other document types (POs, receipts, credit notes).

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
