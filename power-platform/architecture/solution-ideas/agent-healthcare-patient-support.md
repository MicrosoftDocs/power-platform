---
title: Healthcare Patient Support Agent
description: Learn how the Healthcare Patient Support Agent streamlines patient interactions and reduces administrative burdens for healthcare providers.
#customer intent: As a Power Platform user, I want to visualize the major components of the Healthcare Patient Support Agent architecture so that I can design a well-architected solution.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 04/17/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
ms.contributors:
  - pmohapatra
search.audienceType:
  - admin
  - flowmaker
---


# Healthcare Patient Support Agent

The Healthcare Patient Support Agent is designed to streamline patient interactions and reduce administrative burdens for healthcare providers. The solution architecture applies Microsoft technologies to create an efficient, integrated system that enhances patient satisfaction and operational efficiency. By incorporating components such as Microsoft Dataverse, Azure Data Lake, Azure Synapse Analytics, and AI-driven tools, the solution provides a comprehensive approach to managing patient data, automating workflows, and delivering personalized healthcare support.

This article outlines the key components and workflows of the architecture, offering a blueprint for implementing a robust patient support system in healthcare environments.

[!INCLUDE [pp-arch-solution-idea-tip](../../includes/pp-arch-solution-idea-tip.md)]

## Architecture diagram

:::image type="content" source="media/agent-healthcare/healthcare-patient.png" alt-text="Architecture diagram illustrating a Healthcare Patient Support Agent." border="true" lightbox="media/agent-healthcare/healthcare-patient.png":::

## Components

The following components are used in the Healthcare Patient Support Agent architecture.

### Data sources

[**Microsoft Dataverse**](/power-apps/maker/data-platform/): Serves as the central repository for healthcare data, including patients, appointments, and provider information. Chosen for its seamless integration with Power Platform and support for relational and nonrelational data models.

[**Azure Data Lake Storage**](/azure/storage/blobs/data-lake-storage-introduction): Stores and allows for advanced analytics on large datasets. Selected for its scalability and ability to handle structured and unstructured data.

[**Azure Synapse Analytics**](/azure/synapse-analytics/overview-what-is): Provides analytics capabilities for patient and operational data. Chosen for its ability to unify big data and data warehousing in a single platform.

### Processing

[**AI Builder**](/ai-builder/): Selected for its low-code AI capabilities, which allow business users to build and integrate AI models without coding expertise.

- Patient feedback sentiment model: Analyzes patient feedback to measure satisfaction.
- Symptom analysis model: Identifies and processes patient-reported symptoms for better diagnosis and query resolution.

[**Power Automate cloud flows**](/power-automate/overview-cloud): Automate appointment confirmation, reminders, and query escalation. Chosen for its integration with Dataverse and ability to create automated workflows without extensive development.

### User interface

**Patient access portal**: Provides a user-friendly interface for patients to manage their healthcare interactions. Built on [**Microsoft Power Pages**](/power-pages/), chosen for its rapid development capabilities and seamless integration with other Power Platform components.

**Patient interactions agent**: Uses AI-driven agents to assist with patient queries and appointment scheduling, providing real-time responses and reducing human intervention. Built on [**Microsoft Copilot Studio**](/microsoft-copilot-studio/), chosen for its rapid development and knowledge retrieval (Retrieval-Augmented Generation or RAG) capabilities, and seamless integration with other Power Platform components.

[**Power BI dashboards**](/power-bi/): Visualize operational and patient-centric data to provide actionable insights. Chosen for its integration with Dataverse and ability to create interactive, real-time dashboards.

### Platform governance, compliance, and fundamentals

[**Power Platform admin center**](/power-platform/admin/new-admin-center): Manages and monitors all Power Platform components for operational efficiency. Chosen for its ability to enforce governance and maintain compliance across solutions.

[**Microsoft Purview**](/purview/purview): Ensures data compliance and governance by monitoring and classifying data. Chosen to meet regulatory requirements in the healthcare industry.

[**Power Fx**](/power-platform/power-fx/overview): Applies custom logic for advanced functionality in apps and workflows. Chosen for its simplicity and integration with other Power Platform components.

[**Microsoft Entra ID**](/entra/fundamentals/whatis): Ensures that only authenticated users have access to data. Chosen for its integration with Microsoft services and ability to manage user identities and access.

[**Application Insights**](/microsoft-copilot-studio/advanced-bot-framework-composer-capture-telemetry): Monitors workload performance and health.

## Scenario details

The Healthcare Patient Support Agent aims to improve the delivery of efficient and personalized healthcare to patients, while reducing the administrative burden on healthcare providers.

### Business problem

Healthcare providers must contend with a high administrative burden due to the need to schedule appointments, send reminders, and respond to patient inquiries manually, resulting in inefficiencies and higher operational costs.

Patients face delays in responses to their inquiries and a negative experience due to disconnected communication channels with their healthcare providers.

## Considerations

[!INCLUDE [pp-arch-ppwa-link**](../../includes/pp-arch-ppwa-link.md)]

### Security

Apply [record-level security in Dataverse](/power-platform/admin/wp-security-cds#record-level-security-in-dataverse) to protect sensitive patient data.

Use [Dataverse auditing](../key-concepts/dataverse-auditing.md) to track changes and ensure accountability.

Follow [recommendations for monitoring and threat detection](/power-platform/well-architected/security/monitor-threats).

### Performance Efficiency

Power Automate flows with scalable parallelization handle peak patient interactions efficiently. Learn more in [Use an asynchronous flow pattern](/power-automate/guidance/coding-guidelines/asychronous-flow-pattern).

Azure Data Lake Storage Gen2 archives large datasets, ensuring cost-effective long-term storage and allowing for advanced analytics. Its scalability and support for diverse data types make it ideal for healthcare workloads.

Azure Synapse Analytics facilitates big data processing and data warehousing, and unifies patient records for advanced analytical insights and reporting.

### Experience Optimization

The patient access portal is designed with a responsive UI for easy use across devices.

The Patient interactions agent integrates natural language processing and knowledge source retrieval to improve the accuracy of responses to patients' inquiries. Personalized patient interactions use AI Builder models to enhance satisfaction. Learn more in [Introduction to conversational experiences](/microsoft-copilot-studio/guidance/cux-overview) and [Recommendations for designing conversational user experiences](/power-platform/well-architected/experience-optimization/conversation-design).

### Responsible AI

Privacy and security: Patient data is protected by encryption and complies with [Health Insurance Portability and Accountability Act (HIPAA)](/compliance/regulatory/offering-hipaa-hitech) requirements.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Pujarini Mohapatra](https://www.linkedin.com/in/biswapm/)**, Principal Engineering Manager

## Related resources

- [Power Platform Well-Architected](/power-platform/well-architected)
- [Azure Synapse Analytics](/azure/synapse-analytics/)
- [Microsoft Responsible AI practices](https://www.microsoft.com/en-in/ai/responsible-ai)
- [Set up and configure a patient access portal](/dynamics365/industry/healthcare/configure-portals?toc=%2Findustry%2Fhealthcare%2Ftoc.json&bc=%2Findustry%2Fbreadcrumb%2Ftoc.json)
- [Patient access: Provide access for personalized care | Microsoft Cloud for Healthcare](/dynamics365/industry/healthcare/use-patient-access#patient-portal)
- [Overview of Dataverse healthcare APIs](/dynamics365/industry/healthcare/dataverse-healthcare-apis-overview?toc=%2Findustry%2Fhealthcare%2Ftoc.json&bc=%2Findustry%2Fbreadcrumb%2Ftoc.json#dataverse-healthcare-apis)
