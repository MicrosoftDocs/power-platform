---
title: Microsoft Dataverse reference architectures and solution ideas
description: Discover Microsoft Dataverse reference architectures and solution ideas to create robust and maintainable solutions.
#customer intent: As a Power-Platform user, I want to understand Dataverse key concepts, reference architectures, and solution ideas so that I can create robust and maintainable solutions.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: architecture-center
ms.topic: article
ms.date: 04/03/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/01/2025
---

# Microsoft Dataverse reference architectures and solution ideas

Microsoft Dataverse is an easy-to-use, easy-to-manage, compliant, secure, scalable, and globally available SaaS data service. Dataverse empowers organizations to work with any type of data and any type of app, and use the data within it to gain insights and drive business action. As part of Microsoft Power Platform, Dataverse requires no or little code to be written, so it can easily be used by everyone from knowledge workers to professional developers. Knowing that it's built on Azure, organizations choosing Dataverse can be confident that it's globally available, compliant, scalable, and secure.

By understanding reference architectures and exploring solution ideas, you can unlock new opportunities for automation, optimization, and innovation within your organization.

In this article, we look at:

- **Key concepts:** Learn about architecture key concepts that help you build robust, efficient, and maintainable solutions with Dataverse.
- **Reference architectures:** Explore foundational reference architectures that support building well-architected solutions with Dataverse, including best practices for scalability, security, and performance.
- **Solution ideas:** Discover a range of solution ideas that demonstrate the versatility and power of Dataverse.

## Key concepts

| Title | Description |
| --- | --- |
| **[Dataverse auditing](../key-concepts/dataverse-auditing.md)** | Learn about both data auditing and business event auditing in Dataverse. |
| **[Distributed tracing across multiple services](../key-concepts/distributed-tracing.md)** | Learn how to achieve comprehensive observability across multiple services, including those within Power Platform, Azure, and Dynamics 365. |
| **[Best practices and guidance for developers using Microsoft Dataverse](/power-apps/developer/data-platform/best-practices/)** | Microsoft Dataverse provides an extensible framework that allows developers to build highly customized and tailored experiences. When you're customizing, extending, or integrating with Dataverse, be aware of the established guidance and best practices. |
| **[Apply business logic using code](/power-apps/developer/data-platform/apply-business-logic-with-code)** | When a declarative process doesn’t meet a requirement, you can write plug-ins and workflow extensions to apply business logic. |
| **[Work with data using code in Microsoft Dataverse](/power-apps/developer/data-platform/work-with-data)** | Learn about the various methods to access Dataverse data using code, including the Dataverse SDK for .NET or Web API, Dataverse search, and the Dataverse Tabular Data Stream (TDS) endpoint for SQL queries. |

## Reference architectures

| Title | Description |
| --- | --- |
| **[Streamline document processing with AI Builder](../reference-architectures/ai-document-processing.md)** | Streamline document processing and automate data extraction from various documents such as forms, invoices, and purchase orders. |
| **[Predictive data analysis with Dataverse, Fabric, and Azure AI](../reference-architectures/ai-predictive-data-analysis.md)** | Perform predictive data analysis using Dataverse, Microsoft Fabric, and Azure AI and learn best practices for data ingestion, model training, and visualization, enabling you to build robust predictive models and actionable insights. |
| **[Legacy data integration](../reference-architectures/app-legacy-data-integration.md)** | Streamline the process of integrating legacy data with modern platforms. |
| **[Dataverse background operations](../reference-architectures/dataverse-background-operations.md)** | Use custom APIs to define custom messages and implement business logic through plug-ins, allowing for background processing that eliminates the need for a persistent connection during execution. |
| **[Integrate Microsoft Fabric Lakehouse data using Microsoft Dataverse virtual tables](../reference-architectures/app-integrate-lakehouse.md)** | Gather data from multiple internal systems into a Microsoft Fabric Lakehouse, and consume the data in Power Platform apps and automations using Dataverse virtual tables. |
| **[Use the Dataverse connector with canvas apps](../reference-architectures/dataverse-canvas-app.md)** | Creating a Power Apps application that uses Dataverse as a data source can enable building a more custom user experience. |

## Solution ideas

| Title | Description |
| --- | --- |
| **[Healthcare Patient Support Agent architecture](../solution-ideas/agent-healthcare-patient-support.md)** | Streamline patient interactions and reduce administrative burdens for healthcare providers. |
| **[Property rental portal with AI-driven search and payment processing](../solution-ideas/agent-rental-portal.md)** | Build a comprehensive rental portal that uses AI-driven search capabilities and seamless payment processing. |
| **[Enterprise Visual Vehicle Inspection Engine](../solution-ideas/app-evvie.md)** | Inspect vehicles and assess damage using generative AI and Power Platform. |
| **[Custom contact center solution with Copilot Studio agent](../solution-ideas/agent-custom-contact-center.md)** | Enhance customer service efficiency through integrated platforms and technologies. |
| **[Travel concierge using generative AI with Copilot Studio](../solution-ideas/agent-travel-customer.md)** | Employ an AI-driven solution to enhance customer interactions and streamline information access. |
| **[Ticket management system with Copilot Studio agents](../solution-ideas/agent-ticket-and-refund.md)** | Improve ticket refund and management processes by deploying both a user-based and autonomous agent to integrate with legacy systems. |

## Resources

- [Dataverse documentation](/power-apps/maker/data-platform/)
- [Dataverse developer documentation](/power-apps/developer/data-platform/) 