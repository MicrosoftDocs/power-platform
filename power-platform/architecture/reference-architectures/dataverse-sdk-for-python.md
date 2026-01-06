---
title: "Work with business data by using the Dataverse SDK for Python"
description: Learn how the Dataverse SDK for Python empowers developers and data scientists to analyze, automate, and innovate with enterprise-grade data.
#customer intent: As a data scientist, I want to extract and analyze Dataverse data using Python tools like Pandas and Jupyter so that I can create predictive models and generate actionable insights.
author: manuelap-msft
ms.author: paulliew
ms.date: 01/06/2026
ms.subservice: architecture-center
ms.topic: example-scenario
ms.reviewer: jhaskett-msft
---

# Work with business data by using the Dataverse SDK for Python

## Introduction

The Dataverse SDK for Python is a comprehensive toolkit that empowers both professional developers (pro-devs) and data scientists to unlock advanced analytics, automation, and innovation within Microsoft Dataverse. Pro-devs can use the SDK to build scalable, secure business applications, and orchestrate agentic workflows. Data scientists and analysts can use familiar Python tools—such as Pandas, Jupyter notebooks, and machine learning libraries—to create analysis models, simulation models, and operationalize AI-driven insights. This SDK bridges the gap between enterprise-grade data management and the flexibility of Python, accelerating time-to-value and fostering a vibrant developer ecosystem.

## Architecture diagram

The following conceptual architecture diagram illustrates how Dataverse SDK for Python integrates with key components:

:::image type="content" source="media/dataverse-sdk-for-python/dataverse-sdk-python-architecture.png" alt-text="Diagram of Dataverse SDK workflow showing data extraction to Pandas, LLM tasks, Jupyter Notebook, and output visualization." lightbox="media/dataverse-sdk-for-python/dataverse-sdk-python-architecture.png":::

## Workflow

The typical workflow for harnessing Dataverse business data by using Python includes:

1. **Connect to Dataverse:** Securely access enterprise data by using the SDK.
1. **Extract & Transform:** Load tables into Pandas DataFrames for cleaning, feature engineering, and exploratory analysis.
1. **Assessment Modeling:** Apply ML algorithms (for example, classification, regression) to evaluate business scenarios, predict outcomes, and identify trends.
1. **Write-back to Dataverse:** Post AI-generated assessments to Dataverse tables for dashboards and reporting.
1. **Governance:** Ensure all workflows comply with enterprise security and governance standards.

## Scenario details

### Pro-dev scenario

A Python developer builds an employee onboarding system for Fabrikam Enterprises by creating tables for Employee Details, Department Reference, and Onboarding Request Status. By using the SDK, they define schemas, add columns and relationships, and use create, read, and update APIs to seed and modify records - all while upholding enterprise-level security and governance.

### Data Scientist Scenario

A data scientist uses Python tools such as Jupyter notebooks and Visual Studio Code to extract business data from Dataverse and shape it into Pandas DataFrames. The data scientist can then use the extracted business data with advanced analytics and machine learning models for risk assessment, SLA monitoring, or compliance reporting. The data scientist visualizes and shares outputs for fast decision-making.

### Generative AI Use Case

Use Python analytics and LLMs to summarize customer trends or classify segments, such as high-value or churn risk. Write the results back to Dataverse, enabling operational dashboards and compliance workflows. This approach ensures AI outputs are securely stored and governed within the enterprise data platform.

## Considerations

- **Prerequisites:** Access to a Dataverse environment, appropriate security roles (system customizer or admin), Python 3.13 or later, and network access to PyPI for SDK installation.

- **Integration:** Ensure compatibility with existing *Extract, Transform, Load* (ETL) pipelines, automation tools, and enterprise governance policies.

- **Scalability:** Design workflows to handle large datasets and concurrent analytics tasks.

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

## Reliability

- **Robust Data Access:** The SDK supports reliable *Create, Read, Update, and Delete* (CRUD) operations and schema management.

- **Automation:** Enables repeatable, automated workflows for data extraction, transformation, and analysis.

- **Operational Efficiency:** Reduces manual effort and accelerates analytics modernization.

## Security

- **Role-Based Access Control:** Enforce Dataverse security roles and policies for all data operations.

- **Data Governance:** Ensure compliance with enterprise standards for data privacy, audit logging, and encryption.

### Contributors

*Microsoft maintains this article. The following contributors wrote this article.*

**Principal authors:**

- **[Paul Liew](https://www.linkedin.com/in/paul-liew-/)**, Principal Product Manager
- **[Jeff Anderson](https://www.linkedin.com/in/jeff-and/)**, Partner Software Engineer
- **[Peter Hecke](https://www.linkedin.com/in/peter-hecke/)**, Senior Developer Writer

### Related Resources

- [Dataverse SDK for Python documentation](/power-apps/developer/data-platform/sdk-python/)
- [Dataverse SDK Python reference](/python/api/dataverse-sdk-docs-python/dataverse-overview?view=dataverse-sdk-python-latest)
- [PowerPlatform-Dataverse-Client](https://pypi.org/project/PowerPlatform-Dataverse-Client/) download on PyPI.org
- [Unleashing the power of business data with Dataverse SDK for Python (video)](https://www.youtube.com/watch?v=3wb2i1iDtso)

### Next steps

- Download and install the SDK from PyPI. Explore the GitHub [source repository](https://github.com/microsoft/PowerPlatform-DataverseClient-Python) for documentation, sample projects, and community contributions.

- Start building Python-powered analytics and AI workflows with Dataverse data.

- Share feedback and join the community to help shape the future of Dataverse for Python.
