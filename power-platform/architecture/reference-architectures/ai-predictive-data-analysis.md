---
title: Predictive Data Analysis with Dataverse and Azure AI
description: Learn how to perform predictive data analysis using Dataverse, Fabric, and Azure AI. Discover best practices for data ingestion, model training, and visualization.
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 02/04/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---


# Predictive data analysis with Dataverse, Fabric, and Azure AI

> [!TIP]
> This article describes a solution idea. Your cloud architect can use this guidance to help visualize the major components for a typical implementation of this architecture. Use this article as a starting point to design a well-architected solution that aligns with your workload's specific requirements.

In today's data-driven world, applying predictive analytics can significantly enhance decision-making processes and operational efficiency. This guide provides a comprehensive overview of how to perform predictive data analysis using Dataverse, Microsoft Fabric, and Azure AI. It covers best practices for data ingestion, model training, and visualization, enabling you to build robust predictive models and actionable insights. Whether you're an administrator or a flow maker, this article helps you design a well-architected solution tailored to your specific workload requirements.

## Architecture diagram

:::image type="content" source="../media/image4.png" alt-text="architecture diagram" border="true":::

## Workflow

1. **Data ingestion:** Use Dataflows to collect and transform raw data from multiple sources.
Store cleaned and prepared data in Dataverse.

2. **Data engineering and model training:** Sync data from Dataverse to Microsoft Fabric using the Fabric shortcut. Use Fabric's OneLake and Synapse environment to train machine learning models.

3. **Prediction storage:** Save model predictions back into Dataverse or Delta Lake in Fabric.

4. **Visualization:** Build real-time dashboards in Power BI to visualize predictions and insights.

5. **Actionable insights:** Develop PowerApps to provide frontline teams with predictive insights.

## Use case details

### Example scenario: Predicting customer churn
Learn how to use machine learning models to predict which customers are likely to stop using your service.

- **Data collection:** Use Dataflows to aggregate customer data (transactions, complaints, engagement scores) into Dataverse.

- **Model development:** Sync Dataverse data with Fabric. Train a churn prediction model using historical data in Fabric's Spark pool. Use Azure Machine Learning to train and deploy predictive models.

- **Prediction deployment:** Save predictions (for example, churn probability) into Dataverse.

- **Visualization:** Build Power BI dashboards showing churn risk distribution by region or product category.

- **User action:** Create a PowerApp to view and act on high-risk accounts.

## Considerations

### Performance 

- **Dataflows for efficient data ingestion:** Optimize Power Platform dataflows for ETL processes by applying incremental refresh where applicable to minimize data processing times.

- **Link to Microsoft Fabric for compute:** Use Azure Synapse Link for Dataverse to offload heavy data computation and analytics tasks to Microsoft Fabric to ensure minimal performance impact on operational Dataverse environments

#### Performance recommendation

Use OneLake in Microsoft Fabric to manage large datasets with efficient query capabilities.

### Security

-  **Data source security integration:** Secure access to semi-structured, relational, and nonrelational data (for example, SharePoint, Amazon Redshift, Snowflake) by using Microsoft Entra ID for authentication and role-based access controls.

- **Governance of data in Fabric and Dataverse:** Enforce data classification, encryption at rest, and data loss prevention policies.

#### Security recommendation

Implement row-level security in Power BI for role-specific insights while maintaining secure data access.

### Operational excellence
Achieve high performance and efficiency by optimizing processes and using best practices.

- **CI/CD for power platform solutions:** Use Azure DevOps or GitHub Actions to manage the lifecycle of Dataverse, Power BI, and AI Builder solutions.

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
