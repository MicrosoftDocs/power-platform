---
title: Data migration approaches
description: Learn how to plan and execute simple, medium, and complex data migrations in Power Platform. Discover tools, best practices, and next steps.
#customer intent: As a Power Platform user, I want to understand different data migration approaches so that I can choose the best method for my scenario.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 05/20/2025
---

# Data migration approaches

Data migration is a critical step when you move to Microsoft Power Platform. The right migration approach depends on your data’s size and complexity. This article outlines simple, medium, and complex data migration strategies, highlights recommended tools, and shares best practices to help you plan and run a successful migration. Whether you’re handling a small dataset or a large, complex environment, use this article to choose the best method for your scenario and make your move to Dataverse smooth.

## Simple data migration

**Definition**:

- **Data volume**: Up to 1 GB or fewer than 50,000 records.
- **Data complexity**: Minimal complexity with flat data structures and no intricate relationships between entities.

**Approach**:

- **Data assessment**: Identify entities and fields for migration, and do basic data quality checks.
- **Export and transform**: Use simple tools like Excel or CSV exports for data extraction. Do basic transformations using Power Query.
- **Import to Dataverse**: Use Dataverse's built-in data import wizards for small-scale data imports.
- **Verification**: Do spot checks to make sure data integrity and functionality are maintained.

## Medium data migration

**Definition**:

- **Data volume**: Between 1GB and 50GB or 50,000 to 500,000 records.

- **Data complexity**: Moderate complexity with hierarchical or relational data (for example, accounts with associated contacts and opportunities).

**Approach**:

- **Detailed data assessment**: Check source system schemas, validate relationships, and find data quality issues.

- **ETL tools**: Use Extract, Transform, Load (ETL) tools like Azure Data Factory or Kingsway Soft to handle transformations and mapping.

- **Batch migration**: Run migration in batches to reduce downtime and system strain.

- **Testing and validation**: Run test migrations in a staging environment to check data accuracy and confirm relational integrity.

- **Monitoring**: Use telemetry to track migration performance and fix errors quickly.

## Complex data migration

**Definition**:

- **Data volume**: More than 50 GB or more than 500,000 records.
- **Data complexity**: High complexity with intricate relationships, custom entities, and interdependent workflows.

**Approach**:

- **Comprehensive analysis**: Analyze schema, dependencies, and customizations in the source CRM.
- **Specialized tools**: Use advanced tools like Azure Data Factory, SSIS (SQL Server Integration Services), Azure Synapse Analytics, Microsoft Fabric, or custom migration solutions for scalable data handling.
- **Custom development**: Create custom scripts or apps to manage unique migration needs, including APIs for complex relationships and workflows.
- **Phased migration**: Break the migration into logical phases to minimize disruption. Run pilot migrations before full-scale execution.
- **Continuous validation**: Test at each stage of migration to ensure data fidelity and business functionality.
- **Post-migration optimization**: Optimize Dataverse configurations, workflows, and relationships after migration for better performance.

This article focuses on the approach for large, complex data migration scenarios. It introduces a proven methodology for handling complex data migrations. The biggest challenge with large data migrations is managing errors, retries, and tracking what's loaded and what's not loaded. Migration often takes significant time—sometimes from a few days to a few weeks. Use a phased migration strategy so you only migrate delta data during production cutover.


## Architecture diagram

This diagram shows why a staging database is important for large and complex data migrations.

:::image type="content" source="media/data-migration-approaches/architecture.svg" alt-text="Screenshot of a data migration workflow architecture diagram showing the importance of a staging database for large and complex data migrations." lightbox="media/data-migration-approaches/architecture.svg":::


## Next steps

- [Workflow for complex data migration](workflow-for-complex-data-migration.md)


## Related information


- [Export to data lake](https://learn.microsoft.com/en-us/power-apps/maker/data-platform/export-to-data-lake-data-adf)
- [Azure synapse link view in fabric](https://learn.microsoft.com/en-us/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric)