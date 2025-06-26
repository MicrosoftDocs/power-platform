---
title: Data migration approaches
description: Learn how to plan and execute simple, medium, and complex data migrations in Power Platform. Discover tools, best practices, and next steps.
#customer intent: As a data migration specialist, I want to understand different data migration approaches so that I can choose the best method for my organization's needs.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 06/26/2025
---

# Data migration approaches

The right approach for migrating data from an external CRM system to Microsoft Dataverse depends on your data’s size and complexity. This guide outlines simple, medium, and complex migration strategies, recommends tools for each scenario, and shares best practices to help you plan and execute a successful migration.

## Simple data migration

Definition:

- **Data volume**: Up to 1 GB or fewer than 50,000 records.
- **Data complexity**: Minimal complexity with flat data structures and no intricate relationships between tables.

Approach:

- **Data assessment**: Identify relevant tables and columns for migration; perform basic data quality checks.
- **Export and transform**: Use tools like Excel or CSV exports; apply basic transformations with Power Query.
- **Import to Dataverse**: Use Dataverse’s built-in import wizard.
- **Verification**: Perform spot checks to confirm data integrity and functionality.

## Medium data migration

Definition:

- **Data volume**: Between 1 GB and 50 GB or 50,000 to 500,000 records.
- **Data complexity**: Moderate complexity with hierarchical or relational data (for example, accounts with associated contacts and opportunities).

Approach:

- **Detailed data assessment**: Review schema, validate relationships, and identify data quality issues.
- **Transform**: Use Extract, Transform, Load (ETL) tools such as Azure Data Factory for transformations and mappings.
- **Batch migration**: Run migration in batches to reduce downtime and system strain.
- **Testing and validation**: Run test migrations in a staging environment to validate accuracy and relationships.
- **Monitoring**: Use telemetry to track performance and resolve issues quickly.

## Complex data migration

Definition:

- **Data volume**: More than 50 GB or more than 500,000 records.
- **Data complexity**: High—includes custom tables, complex relationships, and interdependent workflows.

Approach:

- **Comprehensive analysis**: Review source schema, dependencies, and customizations thoroughly.
- **Specialized tools**: Use scalable solutions like Azure Data Factory, SSIS (SQL Server Integration Services), Azure Synapse Analytics, Microsoft Fabric, or custom migration solutions for scalable data handling.
- **Custom development**: Build scripts or apps to handle APIs, complex relationships, and workflow logic.
- **Phased migration**: Break migration into stages; run pilots before full rollout to reduce risk.
- **Continuous validation**: Test at each phase to ensure data accuracy and business continuity.
- **Post-migration optimization**: Optimize Dataverse configurations, workflows, and relationships after migration to achieve improved performance.

## Next step

The next article outlines the strategic role of a staging database in large-scale and complex data migrations. Rather than transferring data directly from the source system to the target environment, the process introduces an intermediate staging layer. This pattern enhances data quality, ensures integrity, and reduces the likelihood of errors during the migration process.

> [!div class="nextstepaction"]
> [Use a staging database for data migration](staging-database-approach.md)

## Related information

- [Ingest exported Dataverse data with Azure Data Factory](/power-apps/maker/data-platform/export-to-data-lake-data-adf)
- [Link your Dataverse environment to Microsoft Fabric and unlock deep insights](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric)


