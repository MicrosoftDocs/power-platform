---
title: Legacy data integration solution
description: Learn how to integrate legacy data with modern platforms using Power Automate, SharePoint, Dataverse, Power BI, and Microsoft Teams
author: manuelap-msft
ms.subservice: guidance
ms.topic: example-scenario
ms.date: 02/04/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Legacy data integration solution

Integrating legacy data with modern platforms can be a complex and challenging task. This guide provides a comprehensive solution using Power Automate, SharePoint, Dataverse, Power BI, and Microsoft Teams to streamline the process. By using these tools, you can automate data retrieval, centralize storage, and enhance analytics, ultimately improving business agility and decision-making. This article outlines the architecture, workflow, components, and key considerations to help you design a robust and efficient legacy data integration solution.

[!TIP]
> The article provides an example scenario and visual representation of how to integrate Power Platform solutions with legacy data. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="../media/image3.png" alt-text="Legacy data integration solution architecture diagram" border="true":::

## Workflow

1. **Trigger RPA automation:** A Power Automate unattended desktop RPA flow is triggered to access the legacy system and extract data and reports when API isn't available.
2. **Data extraction from legacy system:** The RPA process logs into the legacy application, navigates through menus, and extracts the required reports or data sets.
3. **Data transfer to SharePoint or Dataverse:** Extracted data is securely transferred and stored in a designated SharePoint document library or list for centralized accessibility or Dataverse tables.
4. **Data transformation and processing:** Power Automate processes and organizes the data to ensure it aligns with reporting requirements or downstream systems.
5. **Visualization in Power BI:** Power BI consolidates and visualizes the data stored in SharePoint. Dashboards and reports are created for enhanced insights.
6. **Access via Microsoft Teams:** Reports and dashboards are integrated into Microsoft Teams, providing real-time access for decision-makers within their collaboration environment.

## Use case details

Legacy systems often present challenges, such as lack of integration with modern platforms, manual data extraction, and limited reporting capabilities. These hurdles lead to inefficiencies, delayed decision-making, and high operational overhead. This architecture modernizes legacy workflows by automating data retrieval, centralizing storage, and enhancing analytics. Decision-makers gain real-time insights through Power BI dashboards accessible via Microsoft Teams, reducing manual effort and improving business agility.

## Components

- **[Power Automate unattended desktop flows](/power-automate/desktop-flows/run-unattended-desktop-flows):** Automates data extraction from legacy systems.
- **SharePoint or Dataverse:** Central repository for data and reports, ensuring easy accessibility and version control. Dataverse is the preferred choice if more complex relational data is needed.
- ***[Power BI](/power-bi/)** Visualizes and consolidates data into interactive dashboards.  
*Alternative*: Third-party BI tools, though integration may be less seamless.
- **Microsoft Teams:** Provides access to insights and dashboards within a collaborative environment.

## Considerations

These considerations implement the pillars of Power Platform well-architected, which is a set of guiding tenets that can be used to improve the quality of a workload. For more information, see [Microsoft Power Platform Well-Architected](https://aka.ms/powa).

### Reliability

- **Retry policies:** Configured in Power Automate to handle temporary failures in RPA or SharePoint and Dataverse connections.

- **Redundancy:** SharePoint and Dataverse ensures high availability, while Power Automate provides failover options for workflows.
- **Monitoring and alerts:** Application Insights is configured to monitor workflow health and alert on failures.

### Security

- **Data access control:** Role-based access ensures only authorized users can access SharePoint libraries, Dataverse tables, and Power BI dashboards.
- **Encryption:** Data in transit (via Power Automate) and at rest (in SharePoint, Dataverse and Power BI) is encrypted.
- **Principle of least privilege:** Permissions are restricted to minimize exposure. Power Automate flows access systems using least privileged accounts or a service principal where possible.

### Operational excellence

**Application lifecycle management (ALM):** Solution assets are stored in source control, and Dataverse solutions are used to promote assets from development, to test and then to production.

### Performance efficiency

Consider which design strategies and recommendations of the [Performance Efficiency pillar](/power-platform/well-architected/performance-efficiency/checklist) are applicable to this workload, and document how they were achieved for this architecture.

### Experience optimization

**Integration with Microsoft Teams:** Users have access to dashboards from where they spend time in Microsoft Teams to ensure easy discovery and use of the insights.

## Related resources

- [Power Automate RPA Documentation](/power-automate/desktop-flows/introduction)
- [Power BI Documentation](/power-bi)
- [Power Platform Security Best Practices](/power-platform/well-architected/security/)
