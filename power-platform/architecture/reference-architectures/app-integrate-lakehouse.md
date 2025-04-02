---
title: ​​Integrate Microsoft Fabric Lakehouse data using Microsoft Dataverse virtual tables
description: Integrate Microsoft Fabric Lakehouse data using Dataverse virtual tables to gather data from multiple internal systems for Power Platform apps and flows.
#customer intent: As a Power Platform user, I want to integrate Microsoft Fabric Lakehouse data using Microsoft Dataverse virtual tables so that I can gather data from multiple internal systems for use in Power Apps or Power Automate.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 03/21/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# ​​Integrate Microsoft Fabric Lakehouse data using Microsoft Dataverse virtual tables

> [!TIP]
> This article provides an example scenario and visual representation of how to integrate Microsoft Fabric Lakehouse data using Microsoft Dataverse virtual tables. This solution is a generalized example scenario architecture that can be used for many different scenarios and industries.

Using the Dataverse virtual tables feature, organizations can integrate data from Microsoft Fabric. This feature enables gathering data from multiple internal systems into a Fabric Lakehouse. Once in Fabric, Dataverse virtual tables can be created to allow Power Platform apps and automations to use the data. For example, customer interaction data from multiple internal systems can be centralized in Fabric, and then using Power Apps, a customer 360 application can allow users to have a complete view of all their organization's interactions with the customer.



## Architecture diagram

:::image type="content" source="media/app-integrate-lakehouse/app-integrate-lakehouse.png" alt-text="Architecture diagram illustrating how to integrate Microsoft Fabric Lakehouse data using Microsoft Dataverse virtual tables." border="true" lightbox="media/app-integrate-lakehouse/app-integrate-lakehouse.png":::

## Workflow

1. **Source preparation**: After identifying available data sources from across the organization's, different systems the data is pushed into a Fabric Lakehouse using dataflows. As part of the dataflows, ETL can be applied to extract and transform the data.  
1. **Virtual tables**: From the Power Apps maker portal, virtual tables are created using the Fabric virtual table connector. This connector allows virtual tables to be created for tables in the Fabric Lakehouse.  
1. **Account executive 360 view**: Account executives can quickly see all the interactions with their accounts using a Power Apps application. This application surfaces the Fabric Lakehouse data by accessing the virtual table just like any standard Dataverse table. Makers can build applications without the complexity of working with multiple systems across the organization.
1. **Account executive monthly interaction summary**: Monthly, a scheduled Power Automate flow runs and generates a summary of customer interactions for each account executive. This feature allows the executives to stay up to date. The Power Automate flows access the data from the different systems using the same virtual tables used by the Power Apps application.

## Components

- **[Power Platform environment](/power-platform/admin/environments-overview)**: Contains the Power Platform resources such as the Power Apps that implement the Account Executive user experience. The Dataverse virtual tables that connect to the Fabric Lakehouse data are created in a Power Platform environment in the associated Dataverse instance. These resources are moved from one environment to another (for example, Dev to Test) using Dataverse solutions.
- **[Microsoft Fabric](/fabric/fundamentals/microsoft-fabric-overview)**: Microsoft Fabric is used to ingest, transform, and store structured and unstructured data from across the organization.  Similar to the Power Platform environment, Fabric uses a concept of workspace to create a container for the related solution resources like the Lakehouse, data flows and other Fabric resources used in the solution.
- **[Virtual connector provider](/power-apps/maker/data-platform/create-virtual-tables-using-connectors?tabs=fabric)**: Virtual tables enable integrating data from external data sources by representing that data as tables in Microsoft Dataverse, without data replication. For each data source, a data provider must handle the interaction between Dataverse and the data source and define the behavior of the virtual table. When creating a virtual table for Fabric Lakehouse data, the prebuilt Fabric virtual connector provider is used as the data provider. This approach uses a typical Power Platform connection and connection reference to handle the Fabric workspace and Power Platform environment specifics. The following diagram illustrates how these components fit together.

:::image type="content" source="media/app-integrate-lakehouse/app-integrate-lakehouse-vt.png" alt-text="Screenshot of connecting data source to Dataverse" border="true" lightbox="media/app-integrate-lakehouse/app-integrate-lakehouse-vt.png":::

- **[Power Apps](/power-apps/)**: Power Apps is used to implement the user experience of the solution. Makers can build the application using the virtual tables that represent the Fabric data by adding them as an application data source just like other Dataverse tables.
- **[Power Automate](/power-automate/)**: Power Automate is used to implement the scheduled run and automation of producing the monthly account executive summary for each of their customers. Power Automate uses the virtual tables that surface Fabric data with the Dataverse connector.

## Scenario details

Organizations that have data stored in separate data silos across the organization can use this architectural pattern to make the data available to Power Platform as Dataverse virtual tables. This approach allows anyone with unstructured or structured data stored in a data lake to continue to keep that data stream in place while making it available as virtual tables in Dataverse.

The following are some example use cases:

- Combine financial data from Dynamics 365 or Dataverse with financial data from other systems to derive consolidated insights.
- Merge historical data ingested into OneLake from legacy systems with current business data from Dynamics 365 and Dataverse.
- Combine weblogs and telemetry data from your website with product and order details from Dynamics 365.
- Apply machine learning and detect anomalies and exceptions within your data.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

- **Design for resilience**: The Power Apps and Power Automate solution components increase resilience by depending only on the Fabric Lakehouse data and aren't directly impacted by each of the internal systems.

### Security

- **Design to protect confidentiality**: Virtual tables are organization owned and don't support the row-level or field-level Dataverse security concepts. Evaluate the sensitivity of the data surfaced using the virtual tables capability and consider if you need to implement your own security model for the external data source.
- **Protect application secrets**: Virtual tables using the Fabric virtual connector provider use connections and connection references to manage and secure credentials used by virtual tables to access the Fabric Lakehouse.

### Performance Efficiency

- **Optimize data usage**: Building the solution from the Fabric Lakehouse can make it easier to optimize the data for use by the Power Platform components. For example, instead of consuming the detail interactions, as part of the Fabric ETL, the detail data could be transformed into more insightful data for the account executive.

### Experience Optimization

- **Implement a consistent information architecture**: When integrating data from multiple systems, it's often the case that each has its own metadata. For example, when tracking interactions one system might mark an interaction as “Successful” while another system stores it as “Completed”. An application presenting this to a user could expose the user to the differences and provide a poor experience. During the ingestion process, the data flow can be used to unify and harmonize this type of data to present a consistent experience for the user consuming the different interaction data.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Ravi Chada](https://www.linkedin.com/in/ravi-chada/)**, Principal Program Manager

## Next steps

First, review how to [build apps and automations, and drive action with insights from Microsoft Fabric](/power-apps/maker/data-platform/azure-synapse-link-build-apps-with-fabric).

The following steps are the high-level steps involved in setting up a solution architecture that uses virtual tables to access data from Microsoft Fabric:

1. [Create a Fabric workspace](/fabric/data-engineering/tutorial-lakehouse-get-started) that contains the Lakehouse that you ingest your data into.
1. [Create a Lakehouse and ingest data](/fabric/data-engineering/tutorial-build-lakehouse). The Lakehouse contains the data you ingest into your Fabric workspace. 
1. [Configure a virtual table](/power-apps/maker/data-platform/azure-synapse-link-build-apps-with-fabric#create-a-virtual-table-with-fabric-data) for one or more of your tables in your Fabric lakehouse.
1. Create your Power Apps application that uses the data from your Fabric workspace. [Connect to Microsoft Dataverse](/power-apps/maker/canvas-apps/connections/connection-common-data-service) to setup your virtual table as a data source for the application.

## Related resources

- [Get started with virtual tables](/power-apps/developer/data-platform/virtual-entities/get-started-ve)
- [Limitations of virtual tables](/power-apps/developer/data-platform/virtual-entities/get-started-ve#limitations-of-virtual-tables)
- [Considerations of using virtual tables](/power-apps/maker/data-platform/create-edit-virtual-entities#considerations-when-you-use-virtual-tables)
