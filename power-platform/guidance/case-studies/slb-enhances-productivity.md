---
title: SLB enhances productivity with Power Platform and AI
description: Learn how Schlumberger (SLB) uses Power Apps, AI Builder, and Power Automate to boost efficiency, automate workflows, and drive innovation.
#customer intent: As a Power Platform user,  I want to learn how SLB increased productivity with Power Apps, AI Builder, and Power Automate so that I can apply similar solutions in my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.subservice: guidance
ms.topic: overview
ms.date: 07/07/2025
---

# SLB enhances productivity with Power Platform and AI

In this case study, you learn how [SLB](https://www.slb.com/), one of the world's largest oilfield services and equipment suppliers, increased their process and employee productivity by using Microsoft Power Platform tools like Power Apps, AI Builder, Power Automate, and Dataverse, along with SharePoint and Microsoft Azure services.

This article highlights four solutions developed by SLB employees to increase global productivity and impact:

- [AI-powered project discovery](#ai-powered-project-discovery): Mitanshu Garg, a Digital Cell Lead at SLB, used Power Apps and Power Automate to connect global teams and scale innovation across SLB. The solution streamlines the project lifecycle from validation to review, and helps the global SLB workforce with project discovery. Enabling employees to find and collaborate on similar projects has increased their productivity in areas such as project consolidation, collaboration, and implementation.

- [Automated document processing](#automated-document-processing): Dipankar Sutradhar, a Software Architect at SLB, used AI Builder and Power Automate to automate document processing by extracting shipment details and associating the information with existing orders and entities. The solution creates an automated workflow to handle shipping documents stored in SharePoint. SLB automated the entire process without extensive coding.

- [Chatbot to streamline processes](#chatbot-to-streamline-processes): Rushi Patel, a Lead Architect at SLB, used Power Automate and AI Builder to create the Flight Airline Automation Bot. This chatbot extracts flight invoice details and associated tax information for the tax team, replacing a time-consuming manual process. The new solution saves the team valuable time.

- [Canvas app to extract and map data between systems](#canvas-app-to-extract-and-map-data-between-systems): Teena Bindal, a Solution Architect at SLB, used Power Apps and Power Automate flows to create a canvas app called SAHL. This app maps data from the Drilling and Workover Integrated Logistics & Invoicing Platform (DILIP) system to the Field Delivery Platform system. The solution extracts data from PDF files and streamlines the process by eliminating double data entry.

## Case study

In this technical case study, you learn how:

- SLB increased global productivity with Power Apps and Power Automate.
- SLB used Power Apps, AI Builder, and Power Automate to unify a global workforce for project recommendations and collaboration.
- You can automate documentation processing and link extracted data to orders and entities.
- You can create a chatbot that extracts invoice details and tax information.
- You can avoid double data entry by extracting and mapping data from one system to another.

> By combining the strengths of Power Apps, Power Automate, Dataverse, and Azure Functions, our team created a tightly integrated solution where AI works behind the scenes.
>
> — *Mitanshu Garg, SLB Digital Cell Lead*

## Scenarios

The following section explores four different scenarios where SLB leveraged Power Platform solutions to drive productivity and innovation.

### AI-powered project discovery

As part of SLB's 2024 internal strategy initiative, its globally distributed facilities consolidated their project records into a single spreadsheet. Financial controllers then validated the results to ensure accuracy and compliance. The management team then reviewed these projects.

#### Challenges

- **Cumbersome user experience**: Submitting projects, validating financial results, and reviewing initiatives lacked structure and automation, leading to delays and errors.

- **Limited visibility and missed synergies**:

  - A spreadsheet made it nearly impossible to identify synergies or discover opportunities for cross-facility collaboration.

  - Facilities working on similar problems remained isolated. The team was unable to combine their efforts into larger, more impactful centrally-driven projects.

  - Facilities couldn't easily find successful projects at other locations to replicate or adapt innovative ideas. This obstacle stifled creativity and prevented knowledge sharing.

#### Solution

To address these challenges, the team used Power Apps to build an application and streamline the project lifecycle from submission to validation and review. AI-powered project discovery enabled smart project discovery, helping users and management to quickly identify similar projects for consolidation and implementation.

The following diagram illustrates the data flow for AI-powered project discovery at SLB:

:::image type="content" source="media/slb/ai-project-discovery.png" alt-text="Diagram showing the data flow for AI-powered project discovery at SLB using Power Platform products like Power Automate, Power Apps, and Dataverse." lightbox="media/slb/ai-project-discovery.png":::

The process uses the following data flow:

- As a new project is created or edited in Power Apps, the project data within Dataverse is automatically synchronized to Azure Blob storage.
- When a user views a project, a Power Automate flow sends an HTTP call to Azure Functions, which uses Python functions to retrieve similar projects from data within Azure Blob storage. The process excludes the user's own projects from discovery. This similar project information is returned to Power Apps for the user to review.

The system uses advanced AI algorithms to analyze the text of submitted projects and generate highly accurate similarity matches.

By identifying overlapping efforts across geographically distributed teams, the tool fosters collaboration and enables the creation of unified, centrally driven projects.

The AI intelligently excludes users' own submissions from recommendations, which ensures the meaningful discovery of external opportunities.

#### Takeaways

SLB used Power Apps, Azure Functions, and Power Automate to build a new AI-powered project recommendation tool that revolutionizes how their globally distributed workforce discovers relevant projects across the organization.

By intelligently analyzing and suggesting similar initiatives, the project recommendation tool helps teams uncover important projects that they might not have discovered otherwise. The system is aware of user context and excludes a user's own submissions to promote meaningful discovery.

The tool empowers employees from different regions and facilities to connect, share knowledge, and build on ideas. It fosters cross-facility collaboration and drives innovation globally.

"By combining the strengths of Power Apps, Power Automate, Dataverse, and Azure Functions, we created a tightly integrated solution where AI works behind the scenes—surfacing insights at the right moment without disrupting the user experience," explains Mitanshu Garg. "Each of these tools is powerful on its own, but together they form a seamless, unified platform. This tight integration not only amplified the capabilities of our AI-powered solution but also significantly accelerated our development timeline."

The recommendations have transformed how users think about projects, providing the following benefits:

- **Inspiration for new ideas**: Facilities can explore a repository of innovative initiatives and adapt them for local implementation.
- **Scalable innovation**: Employees have access to a global knowledge base, empowering them to replicate successful initiatives with minimal effort.

The AI-powered project discovery tool has redefined how SLB's globally distributed workforce collaborates. By connecting employees to relevant projects and fostering a culture of innovation, the solution not only improves operational efficiency but also drives transformational change across the organization.

Within the first 28 days of launch:

- **800+ AI-powered matches generated**: Users actively used the system, discovering previously hidden synergies.
- **150 similar projects inspired**: Facilities worldwide initiated projects inspired by matches, leading to a wave of cross-facility innovation.

### Automated document processing

In the ever-evolving world of oilfield services, SLB faced the challenge of tracking a large volume of shipping duty data and documents for tools and parts across multiple countries. To streamline this process, SLB used AI Builder, a powerful component of Microsoft Power Platform, in combination with Power Automate. This innovative approach resulted in a low-code solution that not only automated document processing but also boosted efficiency and financial recovery.

#### Challenges

SLB required an efficient method to process shipping documents from various partners and to seamlessly integrate the extracted data with SAP orders and entities. The manual handling of these documents was time-consuming and prone to errors, which affected the company's ability to accurately recover export duties.

#### Solution

By integrating AI Builder with Power Automate, SLB created a seamless, automated workflow for handling shipping documents stored in repositories like SharePoint. The AI Builder module was trained to accurately extract shipment details, which were then associated with the relevant SAP orders. This low-code solution allowed SLB to automate the entire process without the need for extensive coding skills.

The following diagram shows the automated document processing workflow at SLB:

:::image type="content" source="media/slb/document-processing.png" alt-text="Diagram showing the automated document processing workflow at SLB using AI Builder and Power Automate." lightbox="media/slb/document-processing.png":::

The diagram demonstrates the workflow:

1. Microsoft Entra ID provides user authentication to the software components.

1. An SLB user shares a shipment document or invoice in the SharePoint document library.

1. A Power Automate flow runs weekly to find new documents that were uploaded to the SharePoint document library. When the new set of files is uploaded, the flow calls the AI Builder module to extract information and metadata from the document. The Power Automate flow updates the database and the logs with the information.

1. AI Builder template models are trained based on sample data files that have been received in the past. These documents have been classified into templates based on their layout and data point placements.

1. The data extracted by Power Automate is updated into a SharePoint list.

1. The extracted data and document access is visualized in a Power BI dashboard.

1. Azure App Insights monitors the completed solution and reports the results in the Azure portal.

1. A failure report is compiled and sent to the process owner team. The team then chooses to either manually process the unprocessed documents (which could be due to issues with the file itself) or assign them to a new template that wasn't identified earlier. Once there is a sizable number of documents of the new template, this information is trained into the AI Builder model so that further documents matching the new template can be read successfully.

The data points to be extracted from these documents have been extensively researched and finalized. The models would need to be retrained if new fields were added.

#### Takeaways

This success story demonstrates how AI Builder can revolutionize document processing and showcases the financial and operational benefits. Dipankar Sutradhar played a key role in designing and implementing a low-code solution that transformed SLB’s approach to document processing, highlighting the power of individual expertise in reshaping business processes. SLB achieved remarkable results, setting a benchmark for efficiency and innovation in the oilfield services industry.

Here are some key takeaways for IT and product-testing professionals who want to implement a similar solution in their own organizations:

- **AI Builder and Power Automate**:
  - Easily add AI features to apps with AI Builder.
  - Simplify and scale automation using Power Automate.
  - Seamlessly integrate processes between AI Builder and Power Automate.
  - Create custom solutions with low-code techniques.

- **Document processing workflow**:
  - Automate the handling of shipping documents from SharePoint.
  - Train AI Builder to recognize and process these documents.

- **Shipment data extraction**:
  - Extract shipping data from various documents.
  - Link extracted data to ERP systems for tax claims.
  - Improve accuracy and efficiency with AI Builder.

- **Real-world impact**:
  - Successfully process all received documents.
  - Recover multi-million dollars in export duties.
  - Achieve quick results by combining expertise with low-code development.

The implementation of AI Builder and Power Automate revolutionized SLB's document processing workflow. The company not only recovered a substantial sum in export duties, but they also achieved significant improvements in efficiency and accuracy.

### Chatbot to streamline processes

SLB implemented the Flight Airline Automation Bot to optimize the extraction of flight invoice details and associated tax information for the tax team. The previous process was  manual, labor-intensive, and required individuals to read and extract data from each invoice manually. The new automated solution streamlines this workflow by retrieving invoices from emails, extracting essential details, and compiling them into an Excel spreadsheet for efficient processing by the tax team. This automation enhances operational efficiency, reduces manual labor, and minimizes data handling errors.

#### Challenges

The manual process wasn't only time-consuming but also prone to errors—incorrect tax amounts, missing details, and misclassification of invoices—all of which impacted financial reporting. As the volume of invoices increased, managing the process became increasingly challenging without additional resources. Lack of standardization across airline invoices further complicated data extraction, making the process inefficient and inconsistent.

#### Solution

The solution implemented employs a Power Automate flow to automate the extraction and processing of flight invoices. The automation process starts by retrieving emails from the bot's inbox and filtering vendor emails to identify relevant invoices. It then uses AI Builder to extract 22 key fields from each invoice, ensuring precise data capture. Business validations are performed to verify the extracted details, reducing errors and inconsistencies. Finally, the system generates an Airline  (Goods and Services Tax) Report, which is shared with the business for seamless tax processing and compliance.

The following diagram illustrates the automated extraction and processing of flight invoices at SLB:

:::image type="content" source="media/slb/automated-extraction.png" alt-text="Diagram showing the automated extraction and processing of flight invoices at SLB using Power Automate and AI Builder." lightbox="media/slb/automated-extraction.png":::

#### Takeaways

Here are some key takeaways for IT and product-testing professionals who are looking to implement a similar solution in their own organizations:

- **Data extraction**: Use Power Automate and AI Builder to extract relevant information from invoice PDFs.
- **Data validation**: Automatically validate airline data for tax processing.
- **New vendor identification**: Detect and verify new vendor emails and information for inclusion in the system.

The back-end infrastructure is built on Microsoft Dataverse, with automation facilitated by Power Automate. Security is ensured through Azure Key Vault for secure secret management.

"The integration of Power Apps and AI Builder has revolutionized our Flight Airline Automation Bot, transforming a labor-intensive manual process into a streamlined and efficient workflow," explained Rushi Patel, an SLB Lead Architect. "By leveraging AI Builder's powerful capabilities, we've automated the extraction of key details from flight invoices, significantly reducing errors and enhancing data accuracy. Power Apps has enabled seamless processing and validation, ensuring compliance and consistency across over 1,000 emails and 200 vendor invoices each month. This solution not only saves the equivalent of one full-time employee's workload but also empowers our tax team to focus on strategic tasks, driving productivity and scalability in our operations."

The tax-association chatbot provides SLB with the following benefits:

- **Reduction in manual effort**: Eliminates the dependency on human processing.
- **Enhanced scalability**: Processes over 1,000 emails per month.
- **Consistency and accuracy**: Extracts key details from over 200 vendor emails.
- **Error reduction**: Performs business validations, generating accurate airline GST reports.
- **Efficiency savings**: Saves manual effort equivalent to one full-time employee.

### Canvas app to extract and map data between systems

SAHL (which means "ease" in Arabic) is an application built with Power Apps that uses Power Automate and Dataverse to integrate Drilling and Workover Integrated Logistic & Invoicing Platform (DILIP) eTickets with the Field Delivery Platform (FDP). The app streamlines the process and eliminates the need for double data entry and manual effort, while ensuring data consistency across both systems.

The current billing system in the Kingdom of Saudi Arabia (KSA) requires redundant data entry and manual effort to record financial costs in both DILIP and FDP. The new solution aims to automate this process, ensuring data integrity between the internal business system and the client's external business system.

#### Challenges

The current KSA billing system requires redundant data entry and manual effort to synchronize financial information between DILIP and FDP. The current process raises operational costs, increases the possibility of errors, and causes financial reporting delays.

#### Solution

By developing a canvas app that automates the data extraction and mapping process between DILIP and FDP, SLB eliminated the need for manual double-entry by Product and Service Delivery (PSD) personnel.

The following diagram shows the detailed architecture of the technologies used to build SLB's SAHL application:

:::image type="content" source="media/slb/canvas-app-workflow.png" alt-text="Diagram showing the architecture of the SAHL application, which integrates DILIP and FDP systems using Power Platform tools such as Power Automate, Power Apps, and Dataverse." lightbox="media/slb/canvas-app-workflow.png":::

The following high-level tasks are performed by the SAHL app:

1.  An engineer uploads the eTicket into DILIP, which is then uploaded into the Power Apps SAHL application.
2.  Power Automate extracts the client contract number and the linked Price Book details from the uploaded ticket. It validates the data and surfaces it in the SAHL app.
3.  Power Automate extracts the Price Book information from Price Book Management (PBM) and validates the data. The DILIP Supplier Part Numbers (SPNs) and PBM SPNs mapping is done, and the data is brought into the SAHL app.
4.  The SAHL application validates this SPN mapping and the uploaded, consolidated PDF. The app then confirms whether it's able to pull this data into SLB's FDP system.

All data used by the SAHL application is stored in Microsoft Dataverse.

#### Takeaways

"Our collaboration has led to the development and implementation of a robust integration platform (SAHL) between our internal system (FDP) and our customers' billing systems (DILIP)," explained Teena Bindal, an SLB Solution Architect. "This initiative has significantly improved user experience, enhanced data integrity, and unlocked performance across our operations."

Here are some key takeaways for IT and product-testing professionals who are looking to implement a similar solution in their own organizations:

- **Data extraction**: Extract data from PDFs.
- **Data mapping**: Automate mapping to master data IDs: SPNs, Rig, Well.
- **Data transmission**: Automate entry into the target (FDP) system.

The back end uses Microsoft Dataverse, while the front end is built with Power Platform's canvas apps. Security is managed through Azure Key Vault for secret management and role-based access control (RBAC) ensures proper permissions within the system.

Teena Bindal explains the benefits: "This automation eliminates the need for double entry, streamlines the billing process, and ensures a smoother, more intuitive experience for all users involved."

The canvas app provides SLB with the following benefits:

- **Eliminates double entry**: Increases productivity by two times, reducing duplication of data entry between DlLIP and FDP systems.
- **Streamlines financial cost recording**: Ensures accurate and efficient tracking for KSA.
- **Instant approval notifications**: Facilitates faster decisions with real-time updates.
- **Simplified discount management**: Makes discount handling easier and error-free.
- **Automated SPN and header mapping**: Enhances seamless data flow by automating processes.
- **Automated price book retrieval**: Provides the latest pricing information.
- **Easy upload to FDP**: With just a few clicks, SLB employees upload SAHL data curated from Siebel CRM, Price Book Management (PBM), and master data management (MDM) into FDP, which gets the ticket moving forward.
- **Significant cost savings**: Aims to save 11 full-time employees (PSD assistants).

## Technologies used

The SLB team used a variety of Microsoft technologies to develop and implement these solutions:

- **Power Apps**: Used to build the project discovery app and to  integrate multiple data entry platforms.
- **AI Builder**: Used to build project recommendations and to accurately extract shipment details.
- **Power Automate**: Flows move information and files between tools and solutions.
- **Dataverse**: Stores data used by the apps and chatbot.
- **SharePoint**: Stores the files with shipping information.
- **Microsoft Azure**: Azure Functions process HTTP requests. Azure Blob Storage stores the information from the Python code and from Dataverse. Azure Key Vault provides secure secret management.
- **Microsoft Excel**: Power Automate flows compile information into Excel files for the tax team to process.

## Key takeaways

This case study shows how SLB used Power Platform—Power Apps, AI Builder, and Power Automate—to set up a project discovery and collaboration application and streamline data extraction workflows.

Here are some key takeaways for IT professionals who want to implement similar solutions in their organization:

- **Share project information**: Use Power Apps, AI Builder, and Power Automate to build an app that collects project information from a global team.
- **Store information in Dataverse and SharePoint**.
    - Empower employees to find projects they can join or learn from so that they can build and contribute to similar projects.
    - Use Power Automate and AI Builder to extract data from online documents like invoices and shipping logs.
- **Compare and validate data**: Automatically compare and validate data from multiple sources, such as emails, an online system, PDFs on SharePoint, or data in Dataverse entered through a Power Apps app.
- **Update systems of record**: Use Power Automate to update systems of record and report any issues, for tax identification, accounting records, shipping and supply chain management, invoice validation, or similar tasks.
- **Secure credentials**: Use Azure Key Vault for secure secret management, including sensitive data like passwords, encryption keys, and API tokens.

Since building solutions with Microsoft Power Platform, SLB has obtained the following key benefits:

- **800+ AI-powered matches**: Users actively used the system and discovered previously hidden synergies.
- **150 similar projects**: Facilities worldwide initiated projects inspired by matches, leading to cross-facility innovation.
- **$10 million recovered in export duties**: AI Builder and Power Automate revolutionized SLB's document processing workflow and improved efficiency and accuracy.
- **1,000 emails processed automatically each month**: Improved scalability saved time and effort, equivalent to one full-time employee.
- **Fewer errors**: Business validations generated accurate airline GST reports.
- **No double entry**: Doubled productivity by reducing duplicate data entry between DILIP and FDP systems.
- **Easier discount management**: Made discount handling easier and error-free.
- **Significant cost savings**: Aims to save 11 full-time employees (PSD assistants), for an annual cost saving of about $500,000.

## Looking ahead

SLB has revolutionized employee productivity with Power Platform in the oilfield services and equipment industry. 

SLB continues to benefit from the project discovery application, which drives global employee collaboration and innovation. Many of these projects include automation solutions built on Power Platform like the examples described in this article. SLB plans to focus on scaling their adoption of Power Platform to improve other aspects of its business.

## Related information

- [What is Power Apps?](/power-apps/powerapps-overview)
    - [Training for Power Apps](/training/powerplatform/power-apps)
    - [What are canvas apps?](/power-apps/maker/canvas-apps/getting-started)
    - [Build apps through conversation with Copilot](/power-apps/maker/canvas-apps/ai-conversations-create-app)
    - [Edit your app with Copilot in Power Apps Studio](/power-apps/maker/canvas-apps/ai-edit-app)
- [What is Power Automate?](/power-automate/flow-types)
- [Overview of AI Builder](/ai-builder/overview)
    - [Use an AI Builder custom entity extraction AI model in Power Automate](/ai-builder/entity-extraction-pwr-automate)
    - [Create a document processing custom model](/ai-builder/create-form-processing-model)
    - [Train and publish your document processing model](/ai-builder/form-processing-train)
    - [Use the document processing model in Power Automate](/ai-builder/form-processing-model-in-flow)
    - [Use the entity extraction prebuilt model in Power Automate](/ai-builder/prebuilt-entity-extraction-pwr-automate)
    - [Use the key phrase extraction prebuilt model in Power Automate](/ai-builder/flow-key-phrase-extraction)
    - [Use the invoice processing prebuilt model in Power Automate](/ai-builder/flow-invoice-processing)
