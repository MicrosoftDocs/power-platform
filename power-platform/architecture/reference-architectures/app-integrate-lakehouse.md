---
title: ​​Integrate Microsoft Fabric Lakehouse data using Dataverse virtual tables
description: Learn how to unify data from multiple internal systems in Microsoft Fabric Lakehouse and access it in Power Platform solutions using Dataverse virtual tables.
#customer intent: As a Power Platform user, I want to integrate Microsoft Fabric Lakehouse data using Microsoft Dataverse virtual tables so that I can gather data from multiple internal systems for use in Power Apps or Power Automate.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/17/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/10/2025
---

# ​​Integrate Microsoft Fabric Lakehouse data using Dataverse virtual tables

Gather data from multiple internal systems into a single source of truth in Microsoft Fabric Lakehouse, then use Dataverse virtual tables to consume the unified data in your Power Platform apps and flows. 

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how to integrate Microsoft Fabric Lakehouse data in your solutions using Microsoft Dataverse virtual tables. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/app-integrate-lakehouse/app-integrate-lakehouse.png" alt-text="Architecture diagram illustrating how to integrate Microsoft Fabric Lakehouse data using Microsoft Dataverse virtual tables." border="true":::

## Workflow

The following steps describe the workflow that's shown in the example architecture diagram:

1. **Source preparation**: Dataflows identify available data sources from across the organization, then push the data into a Fabric Lakehouse where ETL operations extract and transform it for further use.

1. **Virtual tables**: The Fabric virtual connector provider creates virtual tables to represent the data in the Fabric Lakehouse.

1. **Account executive 360 view**: A canvas or model-driven app displays data from the virtual tables in a user-friendly interface, allowing account executives to quickly view all interactions with their accounts.

1. **Account executive monthly interaction summary**: A scheduled Power Automate flow runs every month, generating a summary of customer interactions for each account executive based on the data in the same virtual tables.

## Components

[**Power Platform environment**](/power-platform/admin/environments-overview): Contains the Power Platform resources that implement the user experience. The virtual tables that connect to the Fabric Lakehouse data are created in a Power Platform environment in the associated Dataverse instance.

[**Microsoft Fabric**](/fabric/fundamentals/microsoft-fabric-overview): Ingests, transforms, and stores structured and unstructured data from across the organization. Similar to a Power Platform environment, Fabric uses the concept of a *workspace* to create a container for the Lakehouse, data flows, and other Fabric resources used in the solution.

[**Virtual connector provider**](/power-apps/maker/data-platform/create-virtual-tables-using-connectors?tabs=fabric): Streamlines the creation of virtual tables. Virtual tables represent data that's integrated from external sources as tables in Microsoft Dataverse, without replicating the data. For each data source, a data provider must handle the interaction between Dataverse and the source and define the behavior of the virtual table. When you create a virtual table for Fabric Lakehouse data, the prebuilt Fabric virtual connector provider is the data provider. This approach uses a typical Power Platform connection and connection reference to manage the specifics of the Fabric workspace and Power Platform environment, allowing makers to build apps without the complexity of working with multiple systems.

:::image type="content" source="media/app-integrate-lakehouse/app-integrate-lakehouse-vt.png" alt-text="Screenshot of connecting data source to Dataverse" border="true" lightbox="media/app-integrate-lakehouse/app-integrate-lakehouse-vt.png":::

[**Power Apps**](/power-apps/): Implements the user experience of the solution. Makers can build a canvas or model-driven app using the virtual tables that represent Fabric data, adding them as a data source just like other Dataverse tables.

[**Power Automate**](/power-automate/): Automates production of the monthly summary. The flow can be scheduled to run monthly and can use the same virtual tables as the app. The flow can also be triggered by events in the Fabric Lakehouse data, such as when a record is created or updated.

[**Power BI**](/power-bi/): Visualizes the data in the Fabric Lakehouse. Power BI can connect to the Fabric Lakehouse directly or through a virtual table, allowing you to create reports and dashboards that combine data from multiple sources, including the Fabric Lakehouse and other Dataverse tables.

## Scenario details

Your organization likely has data stored in silos. Use this architectural pattern to keep your data stream in place while making it available to Power Platform as virtual tables in Dataverse.

### Potential use cases

In this example, customer interaction data from multiple internal systems is centralized in Fabric. A "customer 360" app gives account executives a complete view of all their organization's interactions with their customers. Because the app uses virtual tables to access the data in the Fabric Lakehouse, the account executives can view and analyze the data without needing to know where it came from or how it was transformed.

Here are other common use cases:

- Combine financial data from Dynamics 365 or Dataverse with financial data from other systems to derive consolidated insights.
- Merge historical data ingested into OneLake from legacy systems with current business data from Dynamics 365 and Dataverse.
- Combine weblogs and telemetry data from your website with product and order details from Dynamics 365.
- Apply machine learning and detect anomalies and exceptions in your data.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

- **Design for resilience**: The Power Apps and Power Automate components of the solution increase resilience by depending only on the Fabric Lakehouse data, and aren't directly affected by the internal systems.

### Security

- **Design to protect confidentiality**: Virtual tables are owned by your organization. They don't support row-level or field-level Dataverse security concepts. Evaluate the sensitivity of the data in virtual tables and consider whether you need to implement your own security model for the external data source.

- **Protect application secrets**: Virtual tables that are created by the Fabric virtual connector provider use connections and connection references to manage and secure credentials for accessing the Fabric Lakehouse.

### Performance Efficiency

- **Optimize data usage**: Building the solution from the Fabric Lakehouse can make it easier to optimize the data for use by Power Platform components. For example, instead of requiring account executives to wade through interaction details, Fabric ETL operations can transform them into more insightful data that's easier to understand.

### Experience Optimization

- **Implement a consistent information architecture**: Data that comes from multiple systems often has inconsistent metadata. For example, one system might mark an interaction as "Successful," while another system stores it as "Completed." An app that presents this inconsistent data to a user could provide a poor experience. During the ingestion process, use the dataflow to unify and harmonize the data to present a consistent experience for users.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Ravi Chada](https://www.linkedin.com/in/ravi-chada/)**, Principal Program Manager

## Next steps

Review how to [build apps and automations, and drive action with insights from Microsoft Fabric](/power-apps/maker/data-platform/azure-synapse-link-build-apps-with-fabric).

Follow these high-level steps to set up a solution architecture that uses virtual tables to access data from Microsoft Fabric:

1. [Create a Fabric workspace](/fabric/data-engineering/tutorial-lakehouse-get-started) that contains the Lakehouse that you ingest your data into.

1. [Create a Lakehouse and ingest data](/fabric/data-engineering/tutorial-build-lakehouse).

1. [Create a virtual table](/power-apps/maker/data-platform/azure-synapse-link-build-apps-with-fabric#create-a-virtual-table-with-fabric-data) for one or more of the tables in your Fabric lakehouse.

1. Create a canvas or model-driven app. [Connect to Microsoft Dataverse](/power-apps/maker/canvas-apps/connections/connection-common-data-service) to add your virtual table as a data source for the app.

## Related resources

- [Get started with virtual tables](/power-apps/developer/data-platform/virtual-entities/get-started-ve)
- [Limitations of virtual tables](/power-apps/developer/data-platform/virtual-entities/get-started-ve#limitations-of-virtual-tables)
- [Considerations when you use virtual tables](/power-apps/maker/data-platform/create-edit-virtual-entities#considerations-when-you-use-virtual-tables)
