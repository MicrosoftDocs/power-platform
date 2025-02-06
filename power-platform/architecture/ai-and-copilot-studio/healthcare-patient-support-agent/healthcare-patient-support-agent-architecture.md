---
title: Healthcare Patient Support Agent Architecture
description: Discover how the Healthcare Patient Support Agent architecture streamlines patient interactions and reduces administrative burdens for healthcare providers.
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 02/06/2025
ms.author: manuelap
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---


# Healthcare patient support agent architecture

> [!TIP]
> This article describes a solution idea. Your cloud architect can use this guidance to help visualize the major components for a typical implementation of this architecture. Use this article as a starting point to design a well-architected solution that aligns with your workload's specific requirements.


The Healthcare patient support agent architecture is designed to streamline patient interactions and reduce administrative burdens for healthcare providers. This architecture leverages various Microsoft technologies to create an efficient, integrated system that enhances patient satisfaction and operational efficiency. By utilizing components such as Microsoft Dataverse, Azure Data Lake, Azure Synapse Analytics, and AI-driven tools, this solution provides a comprehensive approach to managing patient data, automating workflows, and delivering personalized healthcare support. This document outlines the key components and workflows of the architecture, offering a blueprint for implementing a robust patient support system in healthcare environments.

## Architecture diagram
:::image type="content" source="../../media/image5.png" alt-text="Healthcare patient support agent architecture diagram" border="true":::

[Healthcare Patient Support Agent.vsdx](https://microsoftapc-my.sharepoint.com/:u:/g/personal/pmohapatra_microsoft_com/EdwejSUYZSlBqumqQkH3Hy0B_kmmdW3jEaPkElTzrB60gg?e=hgwfDl)

## Workflow 

### Data Sources
Data sources include Microsoft Dataverse, Azure Data Lake, and Azure Synapse Analytics.

- **Microsoft Dataverse:** Microsoft Dataverse serves as the central repository for healthcare data, including patients, appointments, and provider information. It's chosen for its seamless integration with Power Platform and support for relational and nonrelational data models.

- **Azure Data Lake Store Gen2:** Azure Data Lake Store Gen2 stores large datasets, enabling advanced analytics on patient data.
It's selected for its scalability and ability to handle structured and unstructured data.

- **Azure Synapse Analytics:** Azure Synapse Analytics provides analytics capabilities for patient and operational data. It's chosen for its ability to unify big data and data warehousing in a single platform.

## Processing

### AI builder models

- Patient feedback sentiment model: Analyzes patient feedback to measure satisfaction

- Symptom analysis model: Identifies and processes patient-reported symptoms for better diagnosis and query resolution

AI Builder is chosen for its low-code AI capabilities, enabling business users to build and integrate AI models without coding expertise.

### Power Automate cloud flows

Automates workflows like appointment confirmation, reminders, and query escalation. Chosen for its integration with Dataverse and ability to create automated workflows without extensive development.

## User Interface

### Patient access portal

Provides a user-friendly interface for patients to manage their healthcare interactions. Built on Power Pages for its rapid development capabilities and seamless integration with other Power Platform components.

### Patient interactions agent

Uses AI-driven agents to assist with patient queries and appointment scheduling. Chosen for its ability to provide real-time responses and reduce human intervention. Built on Copilot studio for its rapid development, knowledge retrieval (RAG) capabilities and seamless integration with other Power Platform components.

### Power BI dashboards

Visualizes operational and patient-centric data to provide actionable insights. Chosen for its integration with Dataverse and ability to create interactive, real-time dashboards.

## Platform Governance and Compliance

### Power platform admin center

Manages and monitors all Power Platform components for operational efficiency. Chosen for its ability to enforce governance and maintain compliance across solutions.

### Purview

Ensures data compliance and governance by monitoring and classifying data. Chosen to meet regulatory requirements in the healthcare industry.

### Power Fx

Enables custom logic for advanced functionality in apps and workflows. Selected for its simplicity and integration with other Power Platform components.

## Application insights

### Use case details

The Healthcare Patient Support Agent architecture aims to improve the delivery of efficient and personalized healthcare support to patients, while also reducing the administrative burden on healthcare providers.

**Business problem**

-   The significant manual effort required for appointment scheduling, reminders, and query resolution affects operational efficiency.

-   Disconnected patient communication channels cause delays in responses and negatively impact patient experiences.

## Considerations

### Security

-  Enforced row-level security in Dataverse to protect patient-sensitive data.

-   Dataverse auditing to track changes and ensure accountability.

-   Centralized error logging and monitoring for quick issue resolution. </power-platform/well-architected/security/monitor-threats>

### Performance efficiency

- Power Automate flows with scalable parallelization to handle peak patient interactions efficiently.

- Azure Data Lake Store Gen2 archives large datasets, ensuring cost-effective long-term storage and enabling advanced analytics. Its scalability and support for diverse data types make it ideal for healthcare workloads.

- Azure Synapse Analytics facilitates big data processing and data warehousing, unifies patient records for advanced analytical insights and reporting.

### Experience optimization

- Designed the Patient Access Portal with a responsive UI for seamless use across devices.

- Integrated natural language processing and knowledge source retrieval in the Patient Interactions Agent to improve query resolution accuracy.

- Personalized patient interactions using AI Builder models to enhance satisfaction.

### Responsible AI

-   Privacy and security: Protected patient data using encryption and ensured compliance with HIPAA standards. </compliance/regulatory/offering-hipaa-hitech>


## Related resources

-   [Power Platform Well-Architected Framework](/power-platform/well-architected)

-   [Azure Synapse Analytics Overview](/azure/synapse-analytics/)

-   [AI Builder Documentation](/ai-builder/)

-   [Power Automate Documentation](/power-automate/)

-   [Microsoft Responsible AI Principles](/responsible-ai/)

-   [Set up and configure patient access portal](/dynamics365/industry/healthcare/configure-portals?toc=%2Findustry%2Fhealthcare%2Ftoc.json&bc=%2Findustry%2Fbreadcrumb%2Ftoc.json)

-   [Use patient access - Microsoft Cloud for Healthcare](/dynamics365/industry/healthcare/use-patient-access#patient-portal)

-  [Use patient access - API overview](/dynamics365/industry/healthcare/dataverse-healthcare-apis-overview?toc=%2Findustry%2Fhealthcare%2Ftoc.json&bc=%2Findustry%2Fbreadcrumb%2Ftoc.json#dataverse-healthcare-apis)
