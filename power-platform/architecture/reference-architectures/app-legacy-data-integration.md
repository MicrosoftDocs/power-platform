---
title: Integrate legacy data with Power Automate and SharePoint
description: Learn how to integrate legacy data with modern platforms using Power Automate, SharePoint, Dataverse, Power BI, and Microsoft Teams.
#customer intent: As a Power Platform user, I want to integrate legacy data with modern platforms so that I can streamline data retrieval and enhance analytics.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 07/09/2025
ms.author: mapichle
ms.reviewer: jhaskett-msft
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Integrate legacy data with Power Automate and SharePoint

Integrating data from your legacy systems with modern platforms can be complex and challenging. 

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how to automate retrieval, centralize storage, and enhance analytics of your legacy data using Power Automate, SharePoint, Dataverse, Power BI, and Microsoft Teams. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/app-legacy-data/app-legacy-data.png" alt-text="Architecture diagram illustrating a legacy data integration solution." border="true" lightbox="media/app-legacy-data/app-legacy-data.png":::

## Workflow

The following steps describe the integration workflow that's shown in the example architecture diagram:

1. **Trigger RPA automation**: A Power Automate desktop unattended robotics process automation (RPA) flow accesses the legacy system through an API. It sends a notification if the API isn't available.

1. **Data extraction from legacy system**: The RPA workflow signs in to the legacy application, navigates through menus, and extracts the required reports or data sets.

1. **Data transfer to SharePoint or Dataverse**: The workflow securely transfers and stores the extracted data in a designated SharePoint document library or list or Dataverse tables.

1. **Data transformation and processing**: Another Power Automate flow processes and organizes the data to ensure that it aligns with reporting requirements or downstream systems.

1. **Visualization in Power BI**: Power BI consolidates and visualizes the data in dashboards and reports.

1. **Access in Microsoft Teams**: Reports and dashboards are integrated into Microsoft Teams, providing real-time access for decision-makers in their collaboration environment.

## Components

[**Unattended desktop flows in Power Automate**](/power-automate/desktop-flows/run-unattended-desktop-flows): Automate data extraction from legacy systems.

**SharePoint or Dataverse**: Central repository for data and reports, ensuring easy accessibility and version control. Dataverse is the preferred choice if you need more complex relational data.

[**Power BI**](/power-bi/): Visualizes and consolidates data in interactive dashboards.

**Microsoft Teams**: Provides access to insights and dashboards in a collaborative environment.

## Scenario details

Legacy systems often present challenges such as lack of integration with modern platforms, the need to extract data manually, and limited reporting capabilities. These hurdles lead to inefficiencies, delayed decision-making, and high operational overhead. This example architecture modernizes legacy workflows by automating data retrieval, centralizing storage, and enhancing analytics. Decision-makers gain real-time insights through Power BI dashboards that are accessible in Microsoft Teams, reducing manual effort and improving business agility.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

- **Retry policies**: Configure policies in Power Automate to handle temporary failures in RPA or SharePoint and Dataverse connections.

- **Redundancy**: SharePoint and Dataverse ensure high availability. Power Automate provides failover options for workflows.

- **Monitoring and alerts**: Application Insights monitors workflow health and alerts on failures.

### Security

- **Data access control**: Role-based access ensures that only authorized users can access SharePoint libraries, Dataverse tables, and Power BI dashboards.

- **Encryption**: Data in transit in Power Automate and at rest in SharePoint, Dataverse, and Power BI is encrypted.

- **Principle of least privilege**: Permissions are restricted to minimize exposure. Power Automate flows access systems using least privileged accounts or a service principal where possible.

### Operational Excellence

**Application lifecycle management**: Solution assets are stored in source control, and Dataverse solutions are used to promote assets from development to test to production.

### Performance Efficiency

Consider which design strategies and recommendations of the [Performance Efficiency pillar](/power-platform/well-architected/performance-efficiency/checklist) are applicable to this workload, and document how they were achieved for this architecture.

### Experience Optimization

**Integration with Microsoft Teams**: Users have access to dashboards that show where they spend time in Microsoft Teams to ensure easy discovery and insights.

## Related resources

- [Introduction to desktop flows](/power-automate/desktop-flows/introduction)
- [Power BI documentation](/power-bi)
- [Power Platform Well-Architected Security recommendations](/power-platform/well-architected/security/)
