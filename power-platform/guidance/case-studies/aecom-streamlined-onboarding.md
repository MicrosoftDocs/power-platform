---
title: AECOM simplifies project onboarding with Power Platform, Azure, and Microsoft Fabric
description: Learn how AECOM streamlined project onboarding using Power Platform, Azure, and Microsoft Fabric to enhance efficiency and simplify user access management.
#customer intent: As a Power Platform user, I want to understand how AECOM streamlined project onboarding with Power Platform, Azure, and Microsoft Fabric so that I can evaluate similar solutions for my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.subservice: guidance
ms.topic: overview
ms.date: 05/13/2025
---

# AECOM simplifies project onboarding with Power Platform, Azure, and Microsoft Fabric

In this article, you learn how [AECOM](https://aecom.com/), a global leader in infrastructure development, simplified project onboarding with Microsoft Power Platform, Microsoft Azure, and Microsoft Fabric. AECOM manages a wide range of projects, including transportation systems, water supply, waste management, energy systems, and public buildings. These projects are significant in scale and complexity, which requires effective coordination across multiple disciplines and stakeholders.

To automate the process of adding project team members to multiple platforms, AECOM developed the Project Connect application, which integrates Microsoft SharePoint, Autodesk Construction Cloud, and Revizto. Project Connect ensures that all necessary permissions and access rights are set up correctly from the start, which allows users to avoid interacting with complex data and data sources. Steve Harrison, Vice President of the Building Engineering Team at AECOM MEA, says, "I've seen firsthand how the integration of cutting-edge technology with engineering excellence transforms the solutions we deliver to clients."

## Challenges

AECOM needed to improve the way project team members were onboarded to the many technology platforms its engineering projects in the Middle East and Africa (MEA) region rely on. Onboarding team members to the right platform became more challenging as projects grew in scope and complexity. Engineering teams couldn't start work seamlessly and efficiently, which sometimes caused delays. A streamlined, centralized solution became critical, especially as more projects came online.

To meet the challenge, AECOM built Project Connect around Microsoft technology, including Power Platform, Microsoft Fabric, Dataverse, Azure, and Copilot. Key roles in the development of the application included information managers, designers, and the digital team. AECOM Digital Director of MEA, Martin Angus, says, "As a company deeply committed to leveraging Microsoft products, we believe that Microsoft technologies are instrumental in driving our digital transformation journey."

With the implementation of the Project Connect application, AECOM addressed several challenges that hindered the efficiency and productivity of its project teams:

- **Permission governance**: The dynamic nature of project teams meant that individuals were spread across multiple locations and roles. The challenge was to ensure that everyone had the right access at the right time.

- **Technological diversity**: Managing permissions for many technologies required continuous learning and implementation. Each technology has its unique rules and protocols for access and permissions, which adds complexity.

- **Integration deficit**: AECOM operations involve standard business technologies, like Workday and Oracle, and platforms like Autodesk, Revizto, and Bluebeam. The lack of integration between these technologies and project teams' permission governance systems added challenges.

- **Decentralized and inefficient technology setup tracking**: Tracking technology setups across projects was fragmented and inefficient. Teams relied on manual processes, spreadsheets, and communication channels, which led to gaps in tracking and oversight.

> We needed a solution that would enable our information managers to efficiently onboard project members across various technologies and multiple projects. With Microsoft Power Platform, integrated with Azure and Microsoft Fabric, we discovered the perfect solution to streamline and optimize the entire process.
>
> — *Abdullah Tanvir, AECOM*

## Solution

The company created the Project Connect application using canvas apps in Microsoft Power Apps. It's in production and is used by all information managers across the MEA region. Due to its simplicity and the positive feedback from users in the MEA region, the application was also deployed to AECOM Canada. Expansion to other regions is expected.

### Project Onboarding - Teams

Information managers easily onboard project team members to Microsoft Teams and SharePoint using the **Project Onboarding - Teams** screen. As shown in the following screenshot, the screen displays a list of projects in the left pane. The middle pane shows the current members of the selected project, and the right pane shows the user directory.

:::image type="content" source="media/aecom-streamlined-onboarding/project-onboarding.png" alt-text="Screenshot of the Project Connect application showing the Teams and SharePoint onboarding process, with numbered callouts." lightbox="media/aecom-streamlined-onboarding/project-onboarding.png":::

The following workflow follows the numbered callouts in the screenshot:

1. Information managers select a project in the left pane. Project team members appear in the middle pane.

1. The information manager searches the user directory in the right pane to check if the new team member exists in Teams and SharePoint.

1. If the team member isn't found, the information manager selects the **Add** icon to add the individual to the AECOM user directory.

1. If the team member also needs to be added to the Project Management (PM) security group, the information manager selects the **Add to PM SG** option.

1. Information managers can also add team members in bulk using the Bulk Import Excel worksheet template. The template is attached to an email that looks like the following example:

    :::image type="content" source="media/aecom-streamlined-onboarding/email.png" alt-text="Screenshot of an example email with the Bulk Import Excel worksheet template attached.":::

    The information manager uploads the completed template to the location linked in the email. A Power Automate flow, running in the background, adds each member in the worksheet to the project's SharePoint site.

Project Connect provides similar screens to add team members to Autodesk Construction Cloud and Revizto.

### Project View

Information managers use the **Project View** screen to check and adjust which technologies a team member has access to. As shown in the following screenshot, the screen is divided into two main sections:

- The left side lists projects and includes a search box to find specific projects. Icons indicate which tools are integrated with each project, including the Project Management security group, Revizto clash report, the project cost report, Teams/SharePoint, Autodesk Construction Cloud, Revizto, and UNIFI.

- The right side is the user workspace. It includes a user search box and icons to onboard users and assign Autodesk Construction Cloud roles.

:::image type="content" source="media/aecom-streamlined-onboarding/project-view.png" alt-text="Screenshot of the 'Project View' in the Project Connection application showing project listings with tool icons on the left and a user directory for onboarding and role assignment on the right, with numbered callouts." lightbox="media/aecom-streamlined-onboarding/project-view.png":::

Legend:

1. Select the icons to view the Project Management security group, Revizto clash report, and project cost report. Select a platform icon to access the project records on that platform.
1. Search for a user in the directory to quickly view their technology access.
1. (Administrators) Assign relevant technologies simultaneously by assigning a role to the user.
1. (Administrators) Select the **Add** icon to add the role to the user.

### User View

The **User View** screen is the counterpart to the **Project View** screen. It allows information managers to search for a specific user in the AECOM user directory and view their access to different technologies across all projects. As shown in the following screenshot, the screen is divided into two main sections. The left side shows a user directory with a search box. The right side displays a list of projects the selected team member is assigned to and a search box to find specific projects. Icons indicate which technologies the team member has access to for each project. A check mark indicates that the team member has completed onboarding.

:::image type="content" source="media/aecom-streamlined-onboarding/user-view.png" alt-text="Screenshot of the 'User View' screen in Project Connect showing a search for a specific user and their access to technologies across projects." lightbox="media/aecom-streamlined-onboarding/user-view.png":::

### Project Connect Admin

The **Project Connect Admin** screen is a model-driven app created in Power Apps. Information managers use this screen to set up projects for onboarding in the Project Connect application. As shown in the following screenshot, the screen displays a list of projects with columns such as the project name, project manager, project ID, and other identifying information. Buttons along the top of the screen allow information managers to perform actions such as delete a project, refresh the list of projects, visualize the view, send a link to the list by email, run a report, and export to or from Excel.

:::image type="content" source="media/aecom-streamlined-onboarding/admin-screen.png" alt-text="Screenshot of 'Project Connect Admin' screen showing a project list with data columns and toolbar actions like export, report, and visualization." lightbox="media/aecom-streamlined-onboarding/admin-screen.png":::

### Onboarding Access Report

Information managers use the **Onboarding Access Report** dashboard to track the team's onboarding progress over time for a project. As shown in the following screenshot, the dashboard displays several data visualizations for the selected project:

- The number of team members not onboarded
- Bar charts showing the number of team members onboarded by job family and country/region
- A time series chart of onboarding counts by date
- A table of team member names and hours worked

:::image type="content" source="media/aecom-streamlined-onboarding/project-connect-onboarding.png" alt-text="Screenshot of the Project Connect 'Onboarding Access Report' dashboard showing onboarding stats for a project, including counts by role, date, job family, and country/region, with a table of team member names and hours." lightbox="media/aecom-streamlined-onboarding/project-connect-onboarding.png":::

## Technologies used

The AECOM team used a variety of Microsoft technologies in the development and implementation of the Project Connect application:

- **Power Apps**: Served as the main development interface for Project Connect [canvas apps](/power-apps/maker/canvas-apps/getting-started) and [model-driven apps](/power-apps/maker/model-driven-apps/model-driven-app-overview).

- **Power Automate**: [Power Automate workflows](/power-automate/flow-types) retrieve and consolidate information from all platforms about team members assigned to a project. The flows use Autodesk Construction Cloud and Revizto APIs to onboard members to those technology platforms.

- **Power BI**: Provides analytical reports that offer insights into permissions and access levels across different technology platforms for informed decision-making and management.

- **Microsoft Fabric**: Facilitates data engineering by consolidating data from multiple sources and storing it in a data warehouse for comprehensive reporting and analysis.
  
- **Azure Blob Storage**: Stores the Workbench financial reports and Workday HR data, to be ingested by Microsoft Fabric Data Factory.

- **Azure SQL Database**: Houses human resource management (HRM) data from Workday, which is used in the canvas and model-driven apps and the Power Automate flows.

- **Dataverse**: Serves as the back-end database for the Project Connect application, storing user information from Microsoft Teams, Autodesk Construction Cloud, and Revizto.

- **Copilot**: Accelerates development by using AI-enhanced capabilities for Dataverse, Power Apps, and Power Automate to streamline workflows and boost productivity.

## Key capabilities

Here are the key capabilities of the Project Connect application:

- Onboard users of non-Microsoft software, such as Autodesk Construction Cloud and Revizto.
- Onboard users in bulk to Microsoft Teams, SharePoint, Autodesk Construction Cloud, and Revizto using an Excel template.
- Onboard users to three different technology platforms with a single click.
- Use a dashboard to understand permissions analytics across Teams, SharePoint, Autodesk Construction Cloud, and Revizto.

## Architecture

To better understand the technical foundation of the Project Connect application, let's examine the solution architecture. The following diagrams show the components and how they interact to deliver an effective onboarding experience.

The first diagram is a flowchart that illustrates the integration of various software systems and tools. Outlook is linked to the Workday HRM system, Workbench, and Power Automate. Power Automate is connected to Azure Blob Storage. From there, two separate Fabric Data Factory instances process the data: one routes it to Fabric Data Warehouse and Power BI, while the other routes it to Azure SQL Database. Project Connect is also part of the ecosystem, indicating a comprehensive data and workflow integration pipeline.

:::image type="content" source="media/aecom-streamlined-onboarding/architecture.png" alt-text="Flowchart showing integration of Copilot, Workday, Outlook, Power Automate, Azure services, and Power Apps in a data and workflow pipeline, with numbered callouts.":::

Legend:

1. Copilot capabilities in Power Automate and Power Apps streamline workflows and increase productivity.
1. Workday sends weekly human resource management (HRM) data to a shared mailbox in Microsoft Outlook.
1. A Power Automate flow automatically uploads the HR reports into an instance of Azure Blob Storage.
1. Meanwhile, the Project Cost Control System (from Workbench) sends weekly scheduled project cost reports to the shared Outlook mailbox for all the team's active projects.
1. A Power Automate flow also uploads those cost reports to the Azure Blob Storage instance.
1. Microsoft Fabric Data Factory then ingests the project cost data and HR data into a Fabric Data Warehouse.
1. Power BI analyzes and visualizes the cost information in a dashboard.
1. Microsoft Fabric Data Factory ingests the HR data into Azure SQL Database.
1. The information is then sent from Azure SQL Database to be displayed in the Project Connect application, which was built using Power Apps.
1. The data is then sent to Power BI to be visualized in the dashboard.

Next, let's take a deeper look at the architecture of the Project Connect application, built using Power Apps.

:::image type="content" source="media/aecom-streamlined-onboarding/architecture-power-apps.png" alt-text="Flowchart showing how Project Connect uses Power Automate to link tools like Copilot, Power Apps, SQL, and Power BI for AECOM project onboarding, with numbered callouts.":::

Legend:

1. Copilot capabilities in Power Automate, Dataverse, and Power Apps streamline workflows and increase productivity.
1. From the previous workflow, the HR data is sent from Azure SQL Database to be displayed in the Project Connect application, which was built with Power Apps.
1. The Project Connect Admin model-driven app directly manages Project Connect.
1. Data from the platforms is sent to the Project Connect application:

    - A daily Power Automate flow uses the Autodesk Construction Cloud API to fetch project user details for all active Autodesk Construction Cloud projects. The data is stored in the Autodesk Construction Cloud Users Dataverse table and sent to Project Connect.

    - A second daily Power Automate flow uses the Revizto API to fetch project user details for all active Revizto projects. The data is stored in the Revizto Users Dataverse table and sent to Project Connect.

    - A third daily Power Automate flow uses the Microsoft Graph API to fetch user details for all active Teams projects. The data is stored in the Teams Users Dataverse table and sent to Project Connect.

1. Bulk import options let administrators trigger Power Automate flows to send emails to an Outlook mailbox with the Excel template attached. When an Excel file is uploaded to SharePoint, another Power Automate flow triggers, using the relevant API to add the users to SharePoint and Teams, Autodesk Construction Cloud, or Revizto.

1. Users are added to Teams or SharePoint Group using the Office 365 Groups function.

1. When users are added to Autodesk Construction Cloud or Revizto, a Power Automate flow stores the user information in the Autodesk Construction Cloud or Revizto Onboarding Tracking tables in Dataverse.

1. The Project Connect usage data is passed directly into the App Usage Dataverse table.

1. The table data is analyzed by Fabric Data Factory and ingested into Fabric Data Warehouse.

1. Project information is sent to the Power BI dashboard with the cost information to analyze and visualize project onboarding data.

## Key takeaways

AECOM's implementation of the Project Connect application led to significant improvements. Here are the key effects of the solution:

- **Simplified onboarding process**: The single-view Project Connect application streamlines the onboarding process across SharePoint, Autodesk Construction Cloud, and Revizto. Users only need to become familiar with the Power Apps application, which is simple and easy to use. Team members no longer need to learn the user interfaces of the individual platforms.

- **Enhanced efficiency and reduced learning curve**: The streamlined process significantly enhanced efficiency and reduced the learning curve. This strategic shift lets information managers take on the responsibility of onboarding, increasing their impact and freeing the designers to focus on their core project tasks.

- **Integration with core business software**: The Project Connect application integrates with the organization's core business software, such as Workday and the Project Cost tool. This integration increased user management productivity and provides AECOM with profound insights into the complexity of permissions and access rights across the various technology stacks for its project teams.

- **Centralized tracking of technology setups**: The solution offers an easy, centralized way to track technology setups across all the company's projects. Centralized tracking ensures nothing is overlooked and project teams have all the tools they need from the start.

- **50% reduction in SharePoint access request emails**: The solution reduced administrative overhead by cutting project-related SharePoint access request emails by half.

- **One-click access to platforms**: Users can access different technology platforms with a single click.

- **Streamlined user access management**: Managing user access across different projects and technology platforms is much easier. Administrators benefit from better control and reduced complexity without having to manage multiple platforms.

## Looking ahead

As AECOM continues to innovate and enhance its solutions, several exciting developments are on the horizon. The following key initiatives aim to further streamline processes, improve the user experience, and integrate advanced technologies into the workflows:

- **Enhanced user interactivity with Copilot control in the Power Apps canvas**: AECOM plans to use Power Apps to integrate Copilot functionality within canvas apps, which empowers users to interact directly with their data sources through natural language queries.

- **Adoption of Fluent UI-based design**: The team plans to use Fluent UI for app design across the Project Connect application to ensure a consistent and cohesive user experience.

- **Development of custom connectors for industry-specific APIs**: To meet specialized business needs, the strategic focus is on building custom connectors for APIs such as Autodesk Construction Cloud and Revizto. These connectors will enable seamless integration between Power Platform and critical industry tools, allowing for the automation of workflows and real-time data synchronization.

- **Copilot Studio**: AECOM plans to set up prompts that allow its business administrators to onboard individuals to various technologies.

## Related information

- [What is Power Apps?](/power-apps/powerapps-overview)
  - [What are canvas apps?](/power-apps/maker/canvas-apps/getting-started)  
  - [Copilot in Power Apps overview](/power-apps/maker/canvas-apps/ai-overview)  
- [What is Power Automate?](/power-automate/flow-types)
  - [Automation adoption best practices overview](/power-automate/guidance/automation-coe/overview?branch=main)  
  - [Use SharePoint and Power Automate to build workflows](/power-automate/sharepoint-overview)  
  - [Overview of how to integrate Power Automate flows with Dataverse](/power-automate/dataverse/overview)  
  - [Use Copilot in Power Automate](/training/modules/use-copilot-power-automate/)  
  - [Adopt automation with Copilot in Power Automate](/power-automate/copilot-overview)  
  - [Get started with Copilot in cloud flows](/power-automate/get-started-with-copilot)  
- [What is Microsoft Dataverse?](/power-apps/maker/data-platform/data-platform-intro)
- [What is Microsoft Fabric?](/fabric/fundamentals/microsoft-fabric-overview)
  - [What is Data Factory in Microsoft Fabric?](/fabric/data-factory/data-factory-overview)  
  - [What is data warehousing in Microsoft Fabric?](/fabric/data-warehouse/data-warehousing)  
- [What is Azure Blob Storage?](/azure/storage/blobs/storage-blobs-overview)  
- [What is Azure SQL Database?](/azure/azure-sql/database/sql-database-paas-overview)  
- [Fluent UI Web Components overview](/fluent-ui/web-components/)  
- [Copilot Studio overview](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio)  
