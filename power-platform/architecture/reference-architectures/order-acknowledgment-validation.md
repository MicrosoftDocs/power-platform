---
title: Automate procurement order acknowledgment matching with Copilot Studio and SAP
description: Learn how to automate procurement order acknowledgment validation by using a multi-agent architecture in Copilot Studio to compare supplier acknowledgments with purchase orders and escalate exceptions for review.
#customer intent: As a Power Platform user, I want to design a solution that automates procurement order acknowledgment validation so that only exceptions require human review.
author: PetrosFeleskouras
ms.author: pefelesk
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 09/03/2026
ms.reviewer: jhaskett-msft
---

# Automate procurement order acknowledgment matching with Copilot Studio and SAP

Use Microsoft Copilot Studio agents to automate the end-to-end matching of supplier order acknowledgments against open purchase orders in an enterprise resource planning (ERP) system such as SAP.

This approach enables a procurement organization to confirm the large majority of incoming order acknowledgments automatically, while routing only genuine discrepancies to a procurement specialist for review. A multi-agent system extracts the acknowledgment data, compares it with the purchase order of record, applies tolerance rules, and writes confirmed results back to the ERP system with minimal manual intervention.

> [!TIP]
> This article provides an example scenario and a visual representation of how to automate procurement order acknowledgment matching by using Microsoft Copilot Studio and SAP. This solution is a generalized example architecture that you can use for many different scenarios and industries. This article is limited to best practices.

## Architecture diagram

:::image type="content" source="media/order-acknowledgment-validation/architecture.png" alt-text="Diagram of a multi-agent architecture with intake, orchestration, validation gate, and outcomes for automated order acknowledgment matching." lightbox="media/order-acknowledgment-validation/architecture.png":::

## Workflow

This architecture automates the order acknowledgment matching workflow:

1. **Acknowledgment intake**: Suppliers send order acknowledgments (order confirmations) that arrive through a monitored channel, such as a shared mailbox or an electronic data interchange (EDI) feed, with the confirmation details for one or more purchase orders. Power Automate cloud flows trigger to capture order acknowledgments.

1. **Acknowledgment storage**: Power Automate cloud flows save the incoming order acknowledgments to Dataverse.

1. **Trigger**: A Power Automate cloud flow that uses a Dataverse trigger starts the orchestrator agent. The flow runs when an order acknowledgment is saved to Dataverse.

1. **Field extraction**: An extraction agent built in Copilot Studio reads the acknowledgment and normalizes the key fields (purchase order number, line items, quantities, prices, unit of measure, and confirmed delivery dates) into a consistent internal schema.

1. **Purchase order retrieval**: The orchestrator agent retrieves the corresponding purchase order from SAP through the SAP connector, using the purchase order number as the key.

1. **Matching and validation**: A matching agent compares the acknowledgment against the purchase order line by line, across quantities, prices, dates, and other configured fields. The agent then applies the organization's matching criteria, which can include exact-match requirements, business-defined tolerances, or a combination of both, to determine whether the order can be confirmed automatically.

1. **Automatic confirmation**: When the acknowledgment matches within tolerance, the agent confirms the order and writes the result back to SAP automatically, with no human involvement.

1. **Exception escalation**: When a discrepancy is detected, the agent escalates to a procurement specialist through Microsoft Teams. The agent provides the acknowledgment, the purchase order, and the specific differences so the person can resolve the exception quickly.

1. **Logging and audit**: Microsoft Dataverse records every outcome, whether a confirmation or an escalation, and provides a unified audit trail and exception-tracking layer for reporting and continuous improvement.

## Components

These services and technologies ingest order acknowledgments, extract acknowledgment data, match it against purchase orders in SAP, confirm matching orders, and escalate and track exceptions.

| **Component** | **Role in the architecture** |
|----|----|
| [Copilot Studio](/microsoft-copilot-studio/) | Hosts the multi-agent system. An orchestrator agent coordinates a specialized extraction agent and a matching agent, manages tolerance rules, and decides between autonomous confirmation and human escalation. |
| [SAP ERP](/connectors/saperp/) | Serves as the system of record for purchase orders. The agents retrieve purchase order data and write back confirmed orders through the SAP connector. |
| [Power Automate cloud flows](/power-automate/overview-cloud) | Detect new acknowledgments in the intake channels and trigger the agent network. Connectors provide the integration points to email or EDI sources and to SAP. |
| [Dataverse](/power-apps/maker/data-platform/) | Used as the source of truth for incoming order acknowledgment and enables status-based orchestration. Provides the state, audit log, and exception-tracking layer, giving a unified record of every confirmation and escalation for reporting and governance. |
| [Microsoft Teams](/microsoftteams/teams-overview) | Delivers exception escalations and notifications to procurement specialists, presenting the acknowledgment, the purchase order, and the specific discrepancies for fast resolution. |
| [Microsoft Entra ID](/entra/identity/) | Provides identity and access control, including least-privilege service accounts for the agents' read and write operations against SAP and Dataverse. |

## Scenario details

This use case is based on an enterprise approach to building a reliable, automated, and auditable process for confirming supplier order acknowledgments against an ERP system while minimizing manual effort.

### Business challenge

Organizations that purchase at scale receive large volumes of supplier order acknowledgments. Historically, a significant share of these confirmations are checked and keyed manually: procurement staff open each acknowledgment, locate the matching purchase order in SAP, and compare quantities, prices, and dates by hand.

This manual process is slow, costly, and error-prone. It scales poorly with growth, ties skilled procurement staff to repetitive checking rather than exception handling, and makes it difficult to apply matching and tolerance rules consistently across regions and supplier formats.

### Solution

Implement a multi-agent architecture in Copilot Studio that automates procurement order acknowledgment processing. The solution uses specialized agents to extract acknowledgment data, retrieve purchase orders from SAP, apply business-defined matching criteria, and determine whether acknowledgments can be confirmed automatically or require human review.

The architecture combines agent orchestration, SAP integration, Power Automate cloud flows, and Dataverse-based tracking to create a reliable and auditable process. Procurement specialists focus on exceptions while routine acknowledgments are processed automatically.

**Key capabilities**:

- Automate acknowledgment intake and processing.
- Normalize supplier acknowledgments across formats.
- Validate acknowledgments against purchase orders by applying organizational matching criteria, such as exact-match requirements or configurable tolerances.
- Escalate exceptions to procurement specialists.
- Maintain an audit trail for governance and reporting.

**Outcome**: With this pattern, an organization can move most order confirmations from manual handling to straight-through processing, which frees procurement specialists to focus on exceptions rather than routine checking. The approach provides a reusable blueprint for other high-volume, document-driven processes in domains such as finance and sales.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

- **Error isolation**: Handle extraction failures, matching errors, and SAP integration issues separately so that one failed acknowledgment never blocks the rest of the batch.

- **Idempotent processing**: Use the purchase order number and acknowledgment identifier to detect and skip duplicates, preventing repeated confirmations if a message is redelivered.

- **Fallback mechanisms**: Route acknowledgments that can't be processed automatically to a human exception queue so that no confirmation is lost.

- **Dual-layer logging**: Record outcomes in Dataverse and send a secondary notification on failure, so exceptions remain visible even if a logging step fails.

### Security

- **Access control**: Restrict the intake channels, Dataverse tables, and SAP service account to authorized identities only.

- **Least privilege**: Grant the agents read access to purchase orders and write access only to the order confirmation operations they require.

- **Data protection**: Process acknowledgment data, which can include commercially sensitive pricing, securely, and protect sensitive fields in transit and at rest.

- **Compliance**: Align validation and audit rules with the organization's financial controls and records retention requirements.

### Operational Excellence

- **Standardization**: Normalize varied supplier acknowledgment formats into a single internal schema to keep matching logic simple and consistent.

- **Documentation**: Maintain runbooks for common exception types, supplier-format issues, and SAP configuration changes. Document the matching criteria, including any exact-match requirements, tolerances, and escalation conditions.

- **Support process**: Train procurement and IT support teams to interpret agent run history, diagnose failures, and perform manual recovery.

- **Change management**: Validate changes to extraction, matching, and SAP mappings in a non-production environment before release, and use source control for agent and flow definitions.

### Performance Efficiency

- **Throughput**: Size the solution for high daily volumes, and process acknowledgments in parallel where the connectors allow.

- **Optimization**: Cache frequently used reference data, such as vendor and purchase order lookups, to avoid redundant SAP queries.

- **Connector throttling**: Account for platform and SAP connector limits, and introduce queuing through Dataverse for peak loads.

- **Scalability**: Extend the same orchestrator pattern to new domains and document types without redesigning the core matching flow.

### Experience Optimization

- **Self-service**: Enable procurement specialists to resolve and reprocess escalated acknowledgments directly, with no IT dependency.

- **Transparency**: Surface processing status and exception queues through Dataverse, with analytics in Power BI for trend and performance reporting.

- **Clear escalations**: Present each escalation with a structured summary: the acknowledgment, the purchase order, the specific differences, and a recommended action.

- **Target service level**: Set a straight-through target, such as confirming most acknowledgments automatically, and monitor against it.

## Responsible AI

- **Reliability and safety**: Continuously monitor agent outputs for accuracy, and keep a human in the loop to review anomalies and exceptions before they affect the ERP system.

- **Privacy and security**: Ensure that the data the agents process complies with applicable privacy and data-handling policies.

- **Transparency**: Make agent decisions traceable, with logs available for audit of every confirmation and escalation.

- **Accountability**: Use human-in-the-loop review to keep accountability for exceptions and edge cases with the procurement team.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Petros Feleskouras](https://www.linkedin.com/in/petros-feleskouras-111644138/)**, Senior Program Manager

## Related resources

- [SAP ERP connector documentation](/connectors/saperp/)
- [Connector reference overview](/connectors/connector-reference/)
- [Power Platform and SAP documentation](../../sap/index.yml)
