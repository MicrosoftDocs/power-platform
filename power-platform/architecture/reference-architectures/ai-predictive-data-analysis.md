---
title: Perform predictive data analysis using Dataverse, Fabric, and Azure AI services
description: Learn how to perform predictive data analysis using Dataverse, Fabric, and Azure AI services to enhance decision-making processes and operational efficiency.
#customer intent: As a Power Platform user, I want to learn how to perform predictive data analysis using Dataverse, Fabric, and Azure AI so that I can enhance decision-making processes.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
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
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:03/11/2025
---

# Perform predictive data analysis using Dataverse, Fabric, and Azure AI services

In today's data-driven world, applying predictive analytics enhances decision-making processes and operational efficiency.

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how to perform predictive data analysis with Microsoft Dataverse, Microsoft Fabric, and Azure AI services. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/ai-predictive-data/ai-predictive-data.png" alt-text="Architecture diagram illustrating predictive data analysis with Dataverse, Fabric, and Azure AI services." border="true" lightbox="media/ai-predictive-data/ai-predictive-data.png":::

## Workflow

The following steps describe the workflow that's shown in the example architecture diagram:

1. **Data ingestion**: Use dataflows to collect and transform raw data from multiple sources. Store cleaned and prepared data in Dataverse.

1. **Data engineering and model training**: Sync data from Dataverse to Fabric using the Fabric shortcut. Use Fabric's OneLake and Synapse environment to train machine learning models.

1. **Prediction storage**: Save model predictions back into Dataverse or Delta Lake in Fabric.

1. **Visualization**: Build real-time dashboards in Power BI to visualize predictions and insights.

1. **Actionable insights**: Develop a Power Apps canvas or model-driven app to provide frontline teams with predictive insights.

## Components

[**AI Builder**](/ai-builder/overview): Extracts key data from documents using prebuilt or custom models.

[**Microsoft Dataverse**](/power-apps/maker/data-platform/): Serves as the central data store for extracted document data and tracks document progress as the business process is applied.

[**Power Platform**](/power-query/dataflows/create-use): Automated workflows collect and transform raw data from multiple sources.

[**Link Dataverse to Microsoft Fabric**](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric): Syncs data from Dataverse to Fabric using the Fabric shortcut.

[**Azure Machine Learning**](/azure/machine-learning/): Trains machine learning models.

[**Power Apps**](/power-apps/): Facilitates human review and data corrections.

[**Power BI**](/power-bi/): Delivers analytics and insights into the document processing workflow.

### Alternatives

**[Azure Data Factory](/azure/data-factory/)**: Use Azure Data Factory instead of Power Platform dataflows for collecting and transforming raw data from multiple sources.

## Scenario details

**The scenario**: A company wants to predict customer churn to prevent user dissatisfaction.

### Potential use case: Predicting customer churn

In this scenario, the specific steps include:

- **Data collection**: Use dataflows to aggregate customer data such as transactions, complaints, and engagement scores into Dataverse.

- **Model development**: Sync Dataverse data with Fabric. Use historical data in Fabric's Spark pool to train a churn prediction model. Use Azure Machine Learning to train and deploy predictive models.

- **Prediction deployment**: Save predictions such as churn probability into Dataverse.

- **Visualization**: Build Power BI dashboards that show churn risk distribution by region or product category.

- **User action**: Create a canvas or model-driven app to view and act on high-risk accounts.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Performance

- **Dataflows for efficient data ingestion**: Optimize Power Platform dataflows for ETL (Extract, Transform, Load) processes by applying incremental refresh where applicable to minimize data processing times.

- **Link to Microsoft Fabric for compute**: Use Azure Synapse Link for Dataverse to offload heavy data computation and analytics tasks to Microsoft Fabric to ensure minimal performance impact on operational Dataverse environments. Use OneLake in Fabric to manage large datasets with efficient query capabilities.

### Security

- **Data source security integration**: Secure access to semi-structured, relational, and nonrelational data by using Microsoft Entra ID for authentication and role-based access controls.

- **Governance of data in Fabric and Dataverse**: Enforce data classification, encryption at rest, and data loss prevention policies. Implement row-level security in Power BI for role-specific insights while maintaining secure data access.

### Operational Excellence

- **Continuous integration and continuous delivery for Power Platform solutions**: Use Azure DevOps or GitHub Actions to manage the life cycle of Dataverse, Power BI, and AI Builder solutions.

- **Versioning of data models**: Track and document changes to machine learning models and transformations in Fabric and Dataverse. Use Purview for comprehensive data lineage and metadata management to ensure model explainability and traceability.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Pujarini Mohapatra](https://www.linkedin.com/in/biswapm/)**, Principal Engineering Manager

## Related resources

- [Encryption scenarios](/power-platform/well-architected/security/encryption#encryption-scenarios)
- [Use Azure Key Vault secrets](/power-platform/well-architected/security/application-secrets#use-azure-key-vault-secrets)
- [Recommendations for continuous integration](/power-platform/well-architected/operational-excellence/release-engineering-continuous-integration)
