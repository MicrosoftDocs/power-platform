---
title: Predictive data analysis with Dataverse, Fabric, and Azure AI
description: Learn how to perform predictive data analysis using Dataverse, Fabric, and Azure AI to enhance decision-making processes and operational efficiency.
#customer intent: As a data analyst, I want to learn how to perform predictive data analysis using Dataverse, Fabric, and Azure AI so that I can enhance decision-making processes.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 03/11/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:03/11/2025
---

# Predictive data analysis with Dataverse, Fabric, and Azure AI

In today's data-driven world, applying predictive analytics can enhance the decision-making processes and operational efficiency. This article provides an overview of how to perform predictive data analysis using Dataverse, Microsoft Fabric, and Azure AI to design a well-architected solution. It covers best practices for data ingestion, model training, and visualization, enabling you to build robust predictive models and actionable insights.

> [!TIP]
> The article provides an example scenario and visual representation of how to perform predictive data analysis with Dataverse, Fabric, and Azure AI. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="../media/image4.png" alt-text="Predictive data analysis with Dataverse, Fabric, and Azure AI architecture diagram." border="true" lightbox="../media/image4.png":::

## Workflow

1. **Data ingestion:** Use dataflows to collect and transform raw data from multiple sources. Store cleaned and prepared data in Dataverse.
2. **Data engineering and model training:** Sync data from Dataverse to Microsoft Fabric using the Fabric shortcut. Use Fabric's OneLake and Synapse environment to train machine learning models.
3. **Prediction storage:** Save model predictions back into Dataverse or Delta Lake in Fabric.
4. **Visualization:** Build real-time dashboards in Power BI to visualize predictions and insights.
5. **Actionable insights:** Develop a Power Apps app to provide frontline teams with predictive insights.

## Components

- **[AI Builder](/ai-builder/overview):** Extracts key data from documents using prebuilt or custom models.
- **[Microsoft Dataverse](/power-apps/maker/data-platform/):** Serves as the central data store for extracted document data and tracks document progress as the business process is applied.
- **[Power Platform dataflows](/power-query/dataflows/create-use)**: Collects and transforms raw data from multiple sources.
- **[Link Dataverse to Microsoft Fabric](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric)**: Syncs data from Dataverse to Microsoft Fabric using the Fabric shortcut.
- **[Azure Machine Learning](/azure/machine-learning/)**: Trains machine learning models.
- **[Power Apps](/power-apps/):** Facilitates human review and data corrections.
- **[Power BI](/power-bi/):** Delivers analytics and insights into the document processing workflow.

### Alternatives

- **[Azure Data Factory](/azure/data-factory/)**: Use Azure Data Factory instead of Power Platform dataflows for collecting and transforming raw data from multiple sources.

## Scenario details

### Potential use case: Predicting customer churn

Learn how to use machine learning models to predict which customers are likely to stop using your service.

- **Data collection:** Use dataflows to aggregate customer data (transactions, complaints, engagement scores) into Dataverse.
- **Model development:** Sync Dataverse data with Fabric. Train a churn prediction model using historical data in Fabric's Spark pool. Use Azure Machine Learning to train and deploy predictive models.
- **Prediction deployment:** Save predictions (for example, churn probability) into Dataverse.
- **Visualization:** Build Power BI dashboards showing churn risk distribution by region or product category.
- **User action:** Create a PowerApp to view and act on high-risk accounts.

## Considerations

These considerations implement the pillars of Power Platform Well-Architected, a set of guiding tenets that can improve the quality of a workload. Learn more in [Microsoft Power Platform Well-Architected](https://aka.ms/powa).

### Performance

- **Dataflows for efficient data ingestion:** Optimize Power Platform dataflows for ETL processes by applying incremental refresh where applicable to minimize data processing times.
- **Link to Microsoft Fabric for compute:** Use Azure Synapse Link for Dataverse to offload heavy data computation and analytics tasks to Microsoft Fabric to ensure minimal performance impact on operational Dataverse environments.

#### Performance recommendation

Use OneLake in Microsoft Fabric to manage large datasets with efficient query capabilities.

### Security

- **Data source security integration:** Secure access to semi-structured, relational, and nonrelational data (for example, SharePoint, Amazon Redshift, Snowflake) by using Microsoft Entra ID for authentication and role-based access controls.

- **Governance of data in Fabric and Dataverse:** Enforce data classification, encryption at rest, and data loss prevention policies.

#### Security recommendation

Implement row-level security in Power BI for role-specific insights while maintaining secure data access.

### Operational excellence

Achieve high performance and efficiency by optimizing processes and using best practices.

- **Continuous integration and continuous delivery for Power Platform solutions:** Use Azure DevOps or GitHub Actions to manage the lifecycle of Dataverse, Power BI, and AI Builder solutions.
- **Versioning of data models:** Track and document changes to machine learning models and transformations within Fabric and Dataverse.

#### Operational excellence recommendation

Apply Purview for comprehensive data lineage and metadata management to ensure model explainability and traceability.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Pujarini Mohapatra](https://www.linkedin.com/in/biswapm/)**, Principal Engineering Manager

## Related resources

- [Encryption strategy recommendation for Power Platform workloads](/power-platform/well-architected/security/encryption#encryption-scenarios)
- [Protect application secrets recommendation for Power Platform workloads](/power-platform/well-architected/security/application-secrets#use-azure-key-vault-secrets)
- [Recommendations for continuous integration](/power-platform/well-architected/operational-excellence/release-engineering-continuous-integration)
