---
title: Healthcare Patient Support Agent Architecture
description: Discover how the Healthcare Patient Support Agent architecture streamlines patient interactions and reduces administrative burdens for healthcare providers.
#customer intent: As a cloud architect, I want to visualize the major components of the Healthcare Patient Support Agent architecture so that I can design a well-architected solution.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: solution-idea
ms.date: 03/11/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---


# Healthcare Patient Support Agent architecture

The Healthcare Patient Support Agent architecture is designed to streamline patient interactions and reduce administrative burdens for healthcare providers. This architecture applies various Microsoft technologies to create an efficient, integrated system that enhances patient satisfaction and operational efficiency. By incorporating components such as Microsoft Dataverse, Azure Data Lake, Azure Synapse Analytics, and AI-driven tools, this solution provides a comprehensive approach to managing patient data, automating workflows, and delivering personalized healthcare support. This article outlines the key components and workflows of the architecture, offering a blueprint for implementing a robust patient support system in healthcare environments.

> [!TIP]
> This article describes a solution idea. Your cloud architect can use this guidance to help visualize the major components for a typical implementation of this architecture. Use this article as a starting point to design a well-architected solution that aligns with your workload's specific requirements.

## Architecture diagram

:::image type="content" source="../media/image5.png" alt-text="Architecture diagram illustrating Healthcare Patient Support Agent." border="true" lightbox="../media/image5.png":::

## Workflow

### Data Sources

Data sources include Microsoft Dataverse, Azure Data Lake, and Azure Synapse Analytics.

- [Microsoft Dataverse](/power-apps/maker/data-platform/): Microsoft Dataverse serves as the central repository for healthcare data, including patients, appointments, and provider information. Chosen for its seamless integration with Power Platform and support for relational and nonrelational data models.
- [Azure Data Lake Store Gen2](/azure/storage/blobs/data-lake-storage-introduction): Azure Data Lake Store Gen2 stores large datasets, enabling advanced analytics on patient data. Selected for its scalability and ability to handle structured and unstructured data.
- [Azure Synapse Analytics](/azure/synapse-analytics/overview-what-is): Azure Synapse Analytics provides analytics capabilities for patient and operational data. Chosen for its ability to unify big data and data warehousing in a single platform.

## Processing

### AI Builder models

- Patient feedback sentiment model: Analyzes patient feedback to measure satisfaction
- Symptom analysis model: Identifies and processes patient-reported symptoms for better diagnosis and query resolution

[AI Builder](/ai-builder/overview) is chosen for its low-code AI capabilities, which enable business users to build and integrate AI models without coding expertise.

### Power Automate cloud flows

Automates workflows like appointment confirmation, reminders, and query escalation. Chosen for its integration with Dataverse and ability to create automated workflows without extensive development.

## User Interface

### Patient access portal

Provides a user-friendly interface for patients to manage their healthcare interactions. Built on Power Pages for its rapid development capabilities and seamless integration with other Power Platform components.

### Patient interactions agent

Uses AI-driven agents to assist with patient queries and appointment scheduling. Chosen for its ability to provide real-time responses and reduce human intervention. Built on Microsoft Copilot Studio for rapid development, knowledge retrieval (RAG) capabilities, and seamless integration with other Power Platform components.

### Power BI dashboards

Visualizes operational and patient-centric data to provide actionable insights. Chosen for its integration with Dataverse and ability to create interactive, real-time dashboards.

## Platform governance and compliance

### Power Platform admin center

Manages and monitors all Power Platform components for operational efficiency. Chosen for its ability to enforce governance and maintain compliance across solutions.

### Purview

Ensures data compliance and governance by monitoring and classifying data. Chosen to meet regulatory requirements in the healthcare industry.

### Power Fx

Enables custom logic for advanced functionality in apps and workflows. Selected for its simplicity and integration with other Power Platform components.

## Application insights

### Use case details

The Healthcare Patient Support Agent architecture aims to improve the delivery of efficient and personalized healthcare support to patients, while also reducing the administrative burden on healthcare providers.

**Business problem**:

- The significant manual effort required for appointment scheduling, reminders, and query resolution affects operational efficiency.
- Disconnected patient communication channels cause delays in responses and negatively impact patient experiences.

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, a set of guiding tenets that can improve the quality of a workload. Learn more in [Microsoft Power Platform Well-Architected](https://aka.ms/powa).

### Security

- Enforced [record-level security](/power-platform/admin/wp-security-cds#record-level-security-in-dataverse) in Dataverse to protect patient-sensitive data.
- [Dataverse auditing](../reference-architectures/dataverse-auditing.md) to track changes and ensure accountability.
- [Centralized error logging and monitoring](/power-platform/well-architected/security/monitor-threats) for quick issue resolution.

### Performance efficiency

- Power Automate flows with scalable parallelization to handle peak patient interactions efficiently.
- Azure Data Lake Store Gen2 archives large datasets, ensuring cost-effective long-term storage and enabling advanced analytics. Its scalability and support for diverse data types make it ideal for healthcare workloads.
- Azure Synapse Analytics facilitates big data processing and data warehousing, unifies patient records for advanced analytical insights and reporting.

### Experience optimization

- Designed the Patient Access Portal with a responsive UI for seamless use across devices.
- Integrated natural language processing and knowledge source retrieval in the Patient Interactions Agent to improve query resolution accuracy.
- Personalized patient interactions using AI Builder models to enhance satisfaction.

### Responsible AI

- Privacy and security: Protected patient data using encryption and ensured compliance with [Health Insurance Portability and Accountability Act (HIPAA)](/compliance/regulatory/offering-hipaa-hitech).

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Pujarini Mohapatra](https://www.linkedin.com/in/biswapm/)**, Principal Engineering Manager

## Related resources

- [Power Platform Well-Architected](/power-platform/well-architected)
- [Azure Synapse Analytics overview](/azure/synapse-analytics/)
- [Microsoft Responsible AI](https://www.microsoft.com/en-in/ai/responsible-ai)
- [Set up and configure a patient access portal](/dynamics365/industry/healthcare/configure-portals?toc=%2Findustry%2Fhealthcare%2Ftoc.json&bc=%2Findustry%2Fbreadcrumb%2Ftoc.json)
- [Use patient access - Microsoft Cloud for Healthcare](/dynamics365/industry/healthcare/use-patient-access#patient-portal)
- [Use patient access - Dataverse healthcare APIs](/dynamics365/industry/healthcare/dataverse-healthcare-apis-overview?toc=%2Findustry%2Fhealthcare%2Ftoc.json&bc=%2Findustry%2Fbreadcrumb%2Ftoc.json#dataverse-healthcare-apis)
