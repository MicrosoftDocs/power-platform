---
title: AECOM simplifies project onboarding with Power Platform, Azure, and Microsoft Fabric
description: Learn how AECOM streamlined project onboarding using Power Platform, Azure, and Microsoft Fabric to enhance efficiency and simplify user access management.
#customer intent: As a Power Platform user, I want to understand how AECOM streamlined project onboarding with Power Platform, Azure, and Microsoft Fabric so that I can evaluate similar solutions for my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.subservice: guidance
ms.topic: overview
ms.date: 04/29/2025
---

# AECOM simplifies project onboarding with Power Platform, Azure, and Microsoft Fabric

In this article, you learn from a real-world example how [AECOM](https://aecom.com/), a global leader in infrastructure development, simplified project onboarding with Power Platform, Microsoft Azure, and Microsoft Fabric. AECOM manages a wide range of projects, including transportation systems, water supply, waste management, energy systems, and public buildings. These projects are significant in scale and complexity, which requires effective coordination across various disciplines and stakeholders.

Steve Harrison, Vice President of AECOM MEA's Building Engineering Team, said, "I've seen firsthand how the integration of cutting-edge-technology with engineering excellence transform the solutions we deliver to clients." 

To automate the process of adding project team members to multiple platforms, AECOM developed the Project Connect application that integrates with SharePoint, Autodesk Construction Cloud (ACC), and Revizto. The application ensures that all necessary permissions and access rights are set up correctly from the start, which allows users to avoid interacting with complex data and data sources.

## Challenges

AECOM needed to manage onboarding project members across multiple technology platforms for their complex engineering projects in the Middle East and Africa (MEA) region. As projects grew in scope and complexity, information managers needed to ensure that all team members were properly onboarded to the right technology platform, to reduce delays and enable engineering teams to start work seamlessly and efficiently. A streamlined, centralized solution became critical, especially as more projects came online. Key roles included information managers, designers, and the digital team.

AECOM Digital Director of MEA, Martin Angus, said, "As a company deeply committed to leveraging Microsoft products, we believe that Microsoft technologies are instrumental in driving our digital transformation journey."

With the implementation of the Project Connect application, AECOM addressed several challenges that hindered efficiency and productivity:

- **Permission governance:** The dynamic nature of their teams resulted in individuals spread across various locations and roles. The challenge was to ensure that everyone had the right access at the right time.

- **Technological diversity:** Managing permissions for many technologies required continuous learning and implementation. Each technology has its unique rules and protocols for access and permissions, which adds complexity.

- **Integration deficit:** Operations involve using standard business technologies like Workday and Oracle, as well as platforms like Autodesk, Revizto, and Bluebeam. The lack of integration between these technologies and the team's permission governance systems added challenges.

- **Decentralized and inefficient technology setup tracking:** Before AECOM implemented Power Platform, tracking technology setups across projects was fragmented and inefficient. Teams relied on various manual processes, spreadsheets, and communication channels, which led to gaps in tracking and oversight. 

> We needed a solution that would enable our information managers to efficiently onboard project members across various technologies and multiple projects. With Microsoft Power Platform, integrated with Azure and Microsoft Fabric, we discovered the perfect solution to streamline and optimize the entire process.
>
> — *Abdullah Tanvir, AECOM*

## Solution

The Project Connect application was created using canvas apps. It is now production and is used by all information managers across the MEA region.

Due to its simplicity and the positive feedback from users in the MEA region, the application has also been deployed in the AECOM Canada region. Further expansion to other regions is expected. 

With the Project Connect application, information managers can onboard members to Microsoft Teams and SharePoint through the Project Onboarding Teams screen.

They select the user icon next to the Teams icon to view the user's permissions analytically. The Teams icon accesses the project's SharePoint site.

:::image type="content" source="media/aecom-streamlined-onboarding/project-onboarding.png" alt-text="Screenshot of the Project Connect application showing the Teams and SharePoint onboarding process." lightbox ="media/aecom-streamlined-onboarding/project-onboarding.png":::

1. Information managers start by selecting the desired project, which shows a gallery of current members in the middle pane. 

1. The information manager searches for a member to see if they already exist in Teams and SharePoint.

1. If the member isn't found, the information manager can click the **Add** icon to add the member to the AECOM User Directory.

    If the member needs to be included in the Project Management (PM) security group, the administrator can toggle the **PM Security Group** button.

1. For adding members in bulk, users can download the Bulk Import Excel sheet template. They receive an email with the Excel sheet attached. See the following example email.

:::image type="content" source="media/aecom-streamlined-onboarding/email.png" alt-text="Screenshot of an example email with the Bulk Import Excel sheet template attached.":::

After filling out the Excel sheet, information managers upload it to the location specified in the email. A Power Automate flow runs in the background to add each member to the project's SharePoint site.

> [!NOTE]  
> Project Connect includes similar screens for adding users to ACC and Revizto. 

### Project View

The Project View enables information managers to see which technologies a user has access to, such as Teams/SharePoint, ACC, and Revizto. Information managers can:

1. Select a project, including:
    - Select the $ icon for the project cost report.
    - Select a platform logo to access the project on that platform.

1. Search for a user in the directory to quickly view their technology access.


1. (Administrators) Assign relevant technologies simultaneously by assigning a role to the user.
1. (Administrators) Click the **Add** icon to add the role to the user.

:::image type="content" source="media/aecom-streamlined-onboarding/projecr-view.png" alt-text="Screenshot of the Project View interface showing details such as project selection, cost report icon, platform logos, and user directory search." lightbox = "media/aecom-streamlined-onboarding/projecr-view.png":::

### User View

The User View is the counterpart to the Project View. It allows information managers to:

- Search for a specific user in the AECOM user directory.
- See which technologies they have access to across all projects.

:::image type="content" source="media/aecom-streamlined-onboarding/user-view.png" alt-text="Screenshot of the User View interface showing a search for a specific user and their access to technologies across projects." lightbox="media/aecom-streamlined-onboarding/user-view.png":::

If an icon appears next to a project name, it indicates that the user has access to that specific technology. A checkmark shows that the user completed onboarding. 

### Admin screen (model-driven app)

The Project Connect Admin screen was created using the Power Apps model-driven app design. The Admin screen lets information managers set up projects for the Project Connect app, including relevant details like the Revizto Project ID and Autodesk Project ID. Then the project is ready for onboarding through the app. To ensure the project is visible in the projects list, the *Project_Onboarding _Setup* field is set to **Yes**.

:::image type="content" source="media/aecom-streamlined-onboarding/admin-screen.png" alt-text="Screenshot of the Project Connect Admin screen showing fields for Revizto Project ID and Autodesk Project ID." lightbox = "media/aecom-streamlined-onboarding/admin-screen.png":::

### Project Connect Onboarding dashboard

AECOM displays the information in Power BI. The Project Connect Onboarding Access Report, shown in the image, helps track the team's onboarding progress over time.

:::image type="content" source="media/aecom-streamlined-onboarding/project-connect-onboarding.png" alt-text="Screenshot of the Project Connect Onboarding Access Report." lightbox = "media/aecom-streamlined-onboarding/project-connect-onboarding.png":::

## Technologies used

The development and implementation of the Project Connect application use a variety of Microsoft and Power Platform technologies. These tools create a seamless and efficient onboarding process. Here are the key technologies:

- **Power Apps:** Serves as the main application interface that end users use to onboard users to different technology platforms. AECOM used [canvas apps](/power-apps/maker/canvas-apps/getting-started) for Project Connect and [model-driven apps](/power-apps/maker/model-driven-apps/model-driven-app-overview) for the Admin screen.

- **Power Automate:** Power Automate flows retrieve and consolidate information on users assigned to a project across both platforms. Flows are [Power Automate workflows](/power-automate/flow-types). The flows use the APIs of Autodesk Construction Cloud (ACC) and Revizto to onboard members into the respective technology platforms.

- **Power BI:** Provides analytical reports to end users, offering insights into permissions and access levels across different technology platforms for better decision-making and management.

- **Microsoft Fabric:** Facilitates data engineering by consolidating data from multiple sources and storing it in a data warehouse for comprehensive reporting and analysis.
  
- **Azure Blob Storage:** Stores the Workbench financial reports and Workday HR data, to be ingested by Microsoft Fabric Data Factory.

- **Azure SQL Database:** Houses human resource management (HRM) data from Workday, which is leveraged in Power Apps and the Power Automate flows.

- **Dataverse:** Serves as the backend database for the Project Connect app, storing user information from Microsoft Teams, ACC, and Revizto.

- **Copilot:** Accelerates development by using Copilot capabilities for Dataverse, Power Apps, and Power Automate to streamline workflows and boost productivity.

## Key capabilities

Here are the key capabilities:

- Onboard users of third-party software, such as ACC and Revizto.
- Bulk onboard users to Microsoft Teams, SharePoint, ACC, and Revizto by using an Excel template.
- Onboard users to three different technology platforms with a single click.
- Use a dashboard to understand permissions analytics across Teams, SharePoint, ACC, and Revizto.

## Architecture

To better understand the technical foundation of the Project Connect application, let's examine the solution architecture. The following diagrams show the components and how they interact to deliver an effective onboarding experience.

The first part of the architecture shows how data is automatically extracted from Workday and Workbench platforms to be displayed in Power BI and in Project Connect, which was built using Power Apps.

:::image type="content" source="media/aecom-streamlined-onboarding/architecture.png" alt-text="Diagram showing data flow from Workday and Workbench platforms to Power BI and Project Connect.":::

1.  Copilot capabilities in Power Automate and Power Apps streamline workflows and increase productivity.
2.  Workday sends weekly human resource management (HRM) data to a shared mailbox in Microsoft Outlook.
3.  A Power Automate flow automatically uploads the HR reports into an instance of Azure Blob Storage.
4.  Meanwhile, the Project Cost Control System (from Workbench) sends weekly scheduled project cost reports to the shared Outlook mailbox for all the team's active projects.
5.  A Power Automate flow also uploads those cost reports to the Azure Blob Storage instance.
6.  Microsoft Fabric Data Factory then ingests the project cost data and HR data into a Fabric Data Warehouse.
7.  Power BI analyzes and visualizes the cost information in a dashboard.
8.  Microsoft Fabric Data Factory ingests the HR data into Azure SQL Database.
9.  The information is then sent from Azure SQL Database to be displayed in the Project Connect application, which was built using Power Apps.
10. The data is then sent to Power BI to be visualized in the dashboard.

Next, let's take a deeper look at the architecture of the Project Connect application, built using Power Apps.

:::image type="content" source="media/aecom-streamlined-onboarding/architecture-power-apps.png" alt-text="Diagram showing the Project Connect application architecture built using Power Apps.":::

1. Copilot capabilities in Power Automate, Dataverse, and Power Apps streamline workflows and increase productivity.

1. From the last workflow, the HR data is sent from Azure SQL Database to be displayed in the Project Connect application that was built with Power Apps.

1. The Project Connect Admin model-driven app directly manages Project Connect.

1. The access data from the platforms is sent to the Project Connect application:

    1. A daily Power Automate flow fetches project user details for all the active Autodesk Construction Cloud (ACC) projects, using the ACC API. The data is stored in the AAC Users Dataverse table and sent to the Project Connect application.
    
    1. A second daily Power Automate flow fetches project user details for all the active Revizto projects, using the Revizto API. The data is stored in the Revizto Users Dataverse table and sent to Project Connect.
    
    1. A third daily Power Automate flow fetches user details for all the active Teams projects, using the Microsoft Graph API. The data is stored in the Teams Users Dataverse table and sent to Project Connect.

1. Bulk import options let administrators trigger Power Automate flows to send emails to an Outlook inbox with the Excel template, which is then uploaded to SharePoint. When an Excel file is uploaded to SharePoint, another Power Automate flow is triggered to add the users to the specific platform, using the Graph API (for SharePoint and Teams access), the ACC API, or the Revizto API.

1. Users are added to Teams or SharePoint Group using the Office 365 Groups function.

1. When adding users to ACC or Revizto, a Power Automate flow stores the user information into the ACC and Revizto Onboarding Tracking tables in Dataverse.

1. The Project Connect usage data is passed directly into the App Usage Dataverse table.

1. The table data is analyzed by Fabric Data Factory and ingested into Fabric Data Warehouse.

1. Project information is sent to the Power BI dashboard with the cost information to analyze and visualize project onboarding data.

## Key takeaways

The implementation of the Project Connect application had led to significant improvements across various platforms. Here are the key impacts:

- **Simplified onboarding process**: The single-view Project Connect application streamlines the onboarding process across multiple platforms, including SharePoint, Autodesk Construction Cloud (ACC), and Revizto. Users only need to familiarize themselves with the Power Apps application designed by AECOM, which is simple and easy to use. This change eliminates the need for team members to learn the different user interfaces of the current platforms.

- **Enhanced efficiency and reduced learning curve**: The streamlined process has significantly enhanced efficiency and reduced the learning curve. This strategic shift lets the administrative team take on the responsibility of onboarding, freeing the designers to focus on their core project tasks. With the new automation and tool integration, the administrative team increased their responsibilities and impact.

- **Integration with core business software**: The Project Connect application integrates with the organization's core business software, such as Workday and the Project Cost Tool. This integration increased user management productivity and provides AECOM with profound insights into the complexity of permissions and access rights across the various technology stacks for their project teams.

- **Centralized tracking of technology setups**: The solution offers an easy, centralized way to track technology setups across all their projects. Centralized tracking ensures nothing is overlooked and project teams have all the tools they need from the start. 

### Key benefits

AECOM experienced the following benefits after implementing Power Platform:

- **50% reduction in SharePoint access request emails:** The solution significantly reduced administrative overhead by cutting project-related SharePoint access request emails by 50%.

- **Simplified onboarding for information managers:** Project Connect greatly reduced the learning curve for information managers. Instead of learning multiple technology platforms, they can now onboard project members to various platforms through a single application, which improves efficiency and reduces time spent on training and troubleshooting software issues.

- **Centralized technology setup tracking:** The solution provides an easy, centralized way to track technology setups across all projects, which ensures that nothing is overlooked and that project teams have all the tools they need from the beginning.

- **One-click access to platforms:** Users can access different technology platforms with a single click.

- **Streamlined user access management:** Managing user access across different projects and technology platforms is much easier. Administrators benefit from better control and reduced complexity without having to manage multiple platforms.

## Looking ahead

As AECOM continues to innovate and enhance their solutions, several exciting developments are on the horizon. The following key initiatives aim to further streamline processes, improve the user experience, and integrate advanced technologies into the workflows:

- **Enhanced user interactivity with Copilot control in Power Apps Canvas**: AECOM plans to use Power Apps to integrate Copilot functionality within canvas apps, which empowers users to interact directly with their data sources through natural language queries.

- **Adoption of Fluent UI-based design**: The team plans to leverage Fluent UI for app design across the Project Connect application to ensure a consistent and cohesive user experience.

- **Development of custom connectors for industry-specific APIs**: To meet specialized business needs, their strategic focus is to build custom connectors for APIs such as Autodesk Construction Cloud and Revizto. These connectors will enable seamless integration between Power Platform and critical industry tools, allowing for the automation of workflows and real-time data synchronization.

- **Copilot Studio**: AECOM plans to set up prompts that allow their business administrators to onboard individuals onto various technologies.

## Related information

- [What is Power Apps?](/power-apps/powerapps-overview)
  - [Overview of building canvas apps](/power-apps/maker/canvas-apps/getting-started)  
  - [Copilot in Power Apps overview](/power-apps/maker/canvas-apps/ai-overview)  
- [What is Power Automate?](/power-automate/flow-types)
  - [Automation adoption best practices](/power-automate/guidance/automation-coe/overview?branch=main)  
  - [Use SharePoint and Power Automate to build workflows](/power-automate/sharepoint-overview)  
  - [Overview of how to integrate flows with Dataverse](/power-automate/dataverse/overview)  
  - [Use Copilot in Power Automate](/training/modules/use-copilot-power-automate/)  
  - [Adopt automation with Copilot in Power Automate](/power-automate/copilot-overview)  
  - [Get started with Copilot in cloud flows](/power-automate/get-started-with-copilot)  
- [What is Microsoft Dataverse?](/power-apps/maker/data-platform/data-platform-intro) 
- [What is Microsoft Fabric?](/fabric/fundamentals/microsoft-fabric-overview)
  - [What is Data Factory in Microsoft Fabric?](/fabric/data-factory/data-factory-overview)  
  - [What is data warehousing in Microsoft Fabric?](/fabric/data-warehouse/data-warehousing)  
- [Introduction to Azure Blob Storage](/azure/storage/blobs/storage-blobs-introduction)  
- [What is Azure SQL Database?](/azure/azure-sql/database/sql-database-paas-overview?view=azuresql)  
- [Fluent UI Web Components overview](/fluent-ui/web-components/)  
- [Copilot Studio overview](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio)  
