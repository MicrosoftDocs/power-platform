---
title: SLB enhances productivity with Power Platform and AI
description: "Power Platform productivity: Discover how SLB uses Power Apps, AI Builder, and Power Automate to boost efficiency, automate workflows, and drive innovation."
#customer intent: As a Power Platform user,  I want to learn how SLB increased productivity with Power Apps, AI Builder, and Power Automate so that I can apply similar solutions in my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.subservice: guidance
ms.topic: overview
ms.date: 05/13/2025
---


# SLB enhances productivity with Power Platform and AI

SLB, one of the world’s largest oilfield services and equipment suppliers, significantly boosted process and employee productivity by using Microsoft Power Platform tools such as Power Apps, AI Builder, Power Automate, and Dataverse, together with SharePoint and key Microsoft Azure services.

This article highlights four unique solutions developed by SLB employees to increase global productivity and impact.

- First, Mitanshu Garg, a Digital Cell Lead at SLB, used Power Apps and Power Automate to enable AI-powered project discovery. The solution connects global teams to scale innovation across SLB. This solution streamlines the project lifecycle from validation to review. However, the greatest transformative impact is that the system unites the global
SLB workforce for project discovery, to find and collaborate on similar projects. This helps SLB employees increase their productivity in project consolidation, collaboration, and implementation.

- Second, Dipankar Sutradhar, a Software Architect at SLB used AI Builder and Power Automate to revolutionize document processing, by extracting shipment details and then associating the information with existing orders and entities. This solution creates a seamless, automated
workflow to handle shipping documents that are stored in SharePoint. SLB automated the entire process without the need for extensive coding.

- Third, Rushi Patel, a Lead Architect at SLB, used Power Automate and AI Builder to create the Flight Airline Automation Bot. This chat bot optimizes the extraction of flight invoice details and associated tax information for the tax team, which replaced a time-intensive, manual
process where employees had to read and extract data from each invoice. The new solution saves the team valuable time every month.

- Fourth, Teena Bindal, a Solution Architect at SLB, used Power Apps and Power Automate flows to create a canvas app called SAHL, which is a data mapper from the Drilling and Workover Integrated Logistics & Invoicing Platform (DILIP) system to the Field Delivery Platform (FDP) system. The
solution extracts data from PDF files to streamline the process by eliminating the need for double data entry.

## Introduction

In this technical case study, you learn how to do the following:

- Increase global productivity using Power Apps and Power Automate.
- Use Power Apps, AI Builder, and Power Automate to unify a global workforce around project recommendations and collaboration.
- Automate documentation processing and link the extracted data to orders and entities.
- Create a chat bot that extracts invoice details and associated tax information.
- Avoid double data entry by extracting and mapping data from one data system to another.

> By combining the strengths of Power Apps, Power Automate, Dataverse, and Azure Functions, we created a tightly integrated solution where AI works behind the scenes.”*
>
> - Mitanshu Garg, SLB Digital Cell Lead

## Scenarios

The following sections explore four different scenarios where SLB leveraged Power Platform solutions to drive productivity and innovation.

### AI-powered project discovery

As part of SLB’s 2024 internal strategy initiative, its globally
distributed facilities consolidated their project records into a single
spreadsheet. Financial controllers then validated the results to ensure
accuracy and compliance. Then these projects were reviewed by the
management team.

#### Challenges

- Cumbersome user experience: Submitting projects, validating
  financial results, and reviewing initiatives lacked structure and automation, leading to delays and errors.

- Limited visibility and missed synergies:

  - A spreadsheet made it nearly impossible to identify synergies or discover opportunities for cross-facility collaboration.

  - Facilities working on similar problems remained isolated. The team was unable to combine their efforts into larger, more impactful centrally-driven projects.

  - Facilities could not easily find successful projects at other locations to replicate or adapt innovative ideas. This stifled creativity and prevented knowledge sharing.

#### Solution

To address these challenges, Power Apps was used to build an application and streamline the project lifecycle from submission to validation and review. The most impactful element was the development and integration of AI-powered project discovery. This workflow allows for smart project
discovery where users and management can find similar projects for consolidation and implementation.

The following diagram illustrates the data flow for AI-powered project discovery at SLB:

:::image type="content" source="media/slb/ai-project-discovery.png" alt-text="Screenshot of a diagram showing the data flow for AI-powered project discovery at SLB using Power Platform tools." lightbox="media/slb/ai-project-discovery.png":::

The above diagram uses the following data flow:

- As a new project is created or edited in Power Apps, the project data within Dataverse is automatically synchronized to Azure Blob storage.

- When a user views a project, a Power Automate flow sends an HTTP call to Azure Functions, which uses Python functions to retrieve similar projects from data within Azure Blob storage. This excludes the user's own projects from discovery. This similar project information is returned to Power Apps for the user to review.

The system uses advanced AI algorithms to analyze the text of submitted projects and generate highly accurate similarity matches.

By identifying overlapping efforts across geographically distributed teams, the tool fosters collaboration and enables the creation of unified, centrally driven projects.

The AI intelligently excludes users' own submissions from
recommendations, which ensures the meaningful discovery of external opportunities.

#### Takeaways

SLB used Power Apps, Azure Functions, and Power Automate to build a new AI-powered project recommendation tool that revolutionizes how their globally distributed workforce discovers relevant projects across the organization.

By intelligently analyzing and suggesting similar initiatives, the project recommendation tool helps teams uncover important projects they may not have come across. The system is aware of user context and excludes their own submissions to promote meaningful discovery.

This empowers employees from different regions and facilities to connect, share knowledge, and build on ideas. It fosters cross-facility collaboration and drives innovation globally.

> By combining the strengths of Power Apps, Power Automate, Dataverse, and Azure Functions, we created a tightly integrated solution where AI works behind the scenes—surfacing insights at the right moment without
disrupting the user experience. “Each of these tools is powerful on its own, but together they form a seamless, unified platform. This tight integration not only amplified the capabilities of our AI-powered solution but also significantly accelerated our development timeline.
>
> - Mitanshu Garg
### 

The recommendations have transformed how users think about projects, providing the following benefits:

- Inspiration for new ideas: Facilities can explore a repository of innovative initiatives and adapt them for local implementation.

- Scalable innovation: Employees now have access to a global
  knowledge base, empowering them to replicate successful initiatives with minimal effort.

The AI-powered project discovery tool has redefined how SLB’s globally distributed workforce collaborates. By connecting employees to relevant projects and fostering a culture of innovation, the solution not only improves operational efficiency but also drives transformational change across the organization.

Within the first 28 days of launch:

- 800+ AI-powered matches were generated: Users actively utilized the system, discovering previously hidden synergies.

- 150 similar projects were inspired: Facilities worldwide initiated projects inspired by matches, leading to a wave of cross-facility innovation.


### Document processing to associate data

In the ever-evolving world of oilfield services, SLB faced the challenge of tracking a large volume of shipping Duty data and documents for tools and parts across multiple countries. To streamline this process, SLB leveraged AI Builder, a powerful component of the Microsoft Power
Platform, in combination with Power Automate. This innovative approach resulted in a low-code solution that not only automated document processing but also significantly boosted efficiency and financial recovery.

#### Challenges

SLB required an efficient method to process shipping documents from various partners and to seamlessly integrate the extracted data with SAP orders and entities. The manual handling of these documents was not only time-consuming but also prone to errors, which affected the company's ability to accurately recover export duties.

#### Solution

By integrating AI Builder with Power Automate, SLB created a seamless, automated workflow for handling shipping documents stored in repositories like SharePoint. The AI Builder module was trained to accurately extract shipment details, which were then associated with the relevant SAP orders. This low-code solution allowed SLB to automate the entire process without the need for extensive coding skills.

The following diagram shows the automated document processing workflow at SLB using AI Builder and Power Automate:

:::image type="content" source="media/slb/document-processing.png" alt-text="Screenshot of a diagram showing the automated document processing workflow at SLB using AI Builder and Power Automate." lightbox="media/slb/document-processing.png":::

The above diagram demonstrates the following workflow:

1.  Microsoft Entra ID provides user authentication to the softwarecomponents.

2.  An SLB user shares a shipment document or invoice in the SharePoint document library.

3.  A Power Automate flow runs every week to look for a new batch of documents that were uploaded to the SharePoint document library. When a new set of files are uploaded, it calls the AI Builder module to extract information and metadata from the document. It updates the database and the logs with that information.

4.  AI Builder template models are trained based on sample data files that have been received in the past. These documents have been classified into templates based on their layout and data point placements.

5.  The data extracted by Power Automate is updated into a SharePoint list.

6.  The extracted data and document access is visualized in a Power BI dashboard.

7.  Azure App Insights monitors the completed solution and reports the results in the Azure portal.

8.  A failure report is also compiled and sent to the process owner team, who then choose to either manually process the unprocessed documents (which could be due to issues with the file itself) or assign them to a new template that was not identified earlier. Once there are a sizable number of documents of the new template, this information is trained into the AI Builder model so that further documents matching the new template can be read successfully.

The data points to be extracted from these documents have been extensively researched and finalized. The models would need to be completely retrained if new fields were added.

#### Takeaways

This success story demonstrates how AI Builder can revolutionize document processing, showcasing SLB's financial and operational benefits. By leveraging low-code development, SLB achieved remarkable results, setting a benchmark for efficiency and innovation in the
oilfield services industry.

Here are some key takeaways for IT and product-testing professionals who are looking to implement a similar solution in their own organizations:

- AI Builder and Power Automate:

  - Easily add AI features to apps with AI Builder.
  - Simplify and scale automation using Power Automate.
  - Seamless integration between AI Builder and Power Automate.
  - Create custom solutions with low-code techniques.

- Document processing workflow:

  - Automate the handling of shipping documents from SharePoint.
  - Train AI Builder to recognize and process these documents.

- Shipment data extraction:

  - Extract shipping data from various documents.
  - Link extracted data to ERP systems for tax claims.
  - Improve accuracy and efficiency with AI Builder.

- Real-world impact:

  - Successfully process all received documents.
  - Recover multi-million dollars in export duties.
  - Achieve quick results by combining expertise with low-code development.

The implementation of AI Builder and Power Automate revolutionized SLB's document processing workflow. The company not only recovered a substantial sum in export duties, but they also achieved significant
improvements in efficiency and accuracy.

### Chat bot to associate tax information

The Flight Airline Automation Bot has been successfully implemented to optimize the extraction of flight invoice details and associated tax information for the tax team. This process, previously manual and labor-intensive, involved individuals reading and extracting data from
each invoice manually. The new automated solution streamlines this workflow by retrieving invoices from emails, extracting essential details, and compiling them into an Excel sheet for efficient processing by the tax team. This automation enhances operational efficiency,
reduces manual labor, and minimizes data handling errors.

#### Challenges

The manual process was not only time-consuming but also prone to errors, such as incorrect tax amounts, missing details, and misclassification of invoices, all of which could impact financial reporting. As the volume
of invoices increased, managing the process became increasingly challenging without additional resources. The lack of standardization across airline invoices further complicated data extraction, making the process inefficient and inconsistent.

#### Solution

The implemented solution employs a Power Automate flow to automate the extraction and processing of flight invoices. The automation process initiates by retrieving emails from the bot’s inbox and filtering vendor emails to identify relevant invoices. It then utilizes AI Builder to
extract 22 key fields from each invoice, ensuring precise data capture. Business validations are performed to verify the extracted details, thereby reducing errors and inconsistencies. Finally, the system generates an Airline GST Report, which is shared with the business for seamless tax processing and compliance.

The following diagram illustrates the automated extraction and processing of flight invoices at SLB using Power Automate and AI Builder:

:::image type="content" source="media/slb/automated-extration.png" alt-text="Screenshot of a diagram showing the automated extraction and processing of flight invoices at SLB using Power Automate and AI Builder." lightbox="media/slb/automated-extration.png":::

#### Takeaways

Here are some key takeaways for IT and product-testing professionals who are looking to implement a similar solution in their own organizations:

- Data extraction: Use Power Automate and AI Builder to extract relevant information from invoice PDFs.

- Data validation: Automatically validate airline data for tax processing.

- New vendor identification: Detect and verify new vendor emails and information for inclusion in the system.

The backend infrastructure is built on Microsoft Dataverse, with automation facilitated by Power Automate. Security is ensured through Azure Key Vault for secure secret management.

> The integration of Power Apps and AI Builder has revolutionized our Flight Airline Automation Bot, transforming a labor-intensive manual process into a streamlined and efficient workflow. By leveraging AI Builder's powerful capabilities, we've automated the extraction of key details from flight invoices, significantly reducing errors and enhancing data accuracy. Power Apps has enabled seamless processing and validation, ensuring compliance and consistency across over 1,000 emails and 200 vendor invoices each month. This solution not only saves the equivalent of one full-time employee's workload but also empowers our tax team to focus on strategic tasks, driving productivity and scalability in our operations.
>
> - Rushi Patel, an SLB Lead Architect

The tax-association chat bot provides SLB with the following benefits:

- Reduction in manual effort: Eliminates the dependency on human processing.

- Enhanced scalability: Processes over 1,000 emails per month.

- Consistency and accuracy: Extracts key details from over 200 vendor emails.

- Error reduction: Performs business validations, generating
  accurate airline GST reports.

- Efficiency savings: Saves manual effort equivalent to one
  full-time employee (FTE).

### Extracting and mapping data between systems

SAHL (which means “*ease”* in Arabic) is an application built with Power Apps that uses Power Automate and Dataverse to integrate Drilling and Workover Integrated Logistic & Invoicing Platform (DILIP) eTickets with Field Delivery Platform (FDP), which streamlines the process and
eliminates the need for double data entry and manual effort, while still ensuring data consistency across both systems.

The current billing system in Kingdom of Saudi Arabia (KSA) requires redundant data entry and manual effort to record financial costs in both DILIP and FDP. The new solution aims to automate this process, ensuring data integrity between the internal business system and the client's external business system.

#### Challenges

The current KSA billing system requires redundant data entry and manual efforts to synchronize financial information between DILIP and FDP. This raises operational costs, increases the possibility of errors, and causes financial reporting delays.

#### Solution

By developing a canvas app that automates the data extraction and mapping process between DILIP and FDP, SLB eliminated the need for manual double-entry by Product and Service Delivery (PSD) personnel.

The following high-level tasks are performed by the SAHL app:

- The user uploads the DILIP e-Ticket.

- Power Automate flows read the ticket in the background.

- Data is integrated with Siebel to extract the Price Book details

- from the Price Book Module (PBM).

- Once the mappings are validated, the ticket is moved into FDP.

- This process provides a digital solution.

The following diagram shows the detailed architecture of the
technologies used to build SLB’s SAHL application.

:::image type="content" source="media/slb/sahl.png" alt-text="Screenshot of a diagram showing the detailed architecture of the SAHL application at SLB, integrating DILIP and FDP systems using Power Platform tools." lightbox="media/slb/sahl.png":::

1.  An engineer uploads the e-Ticket into DILIP, which is then uploaded into the Power Apps SAHL application.

2.  Power Automate extracts the client contract number and the linked Price Book details from the uploaded ticket. It validates the data and surfaces it in the SAHL app.

3.  Power Automate extracts the Price Book information from Price Book Management (PBM) and validates the data. The DILIP Supplier Part Numbers (SPNs) and PBM SPNs mapping is done, and the data is brought into the SAHL app.

4.  The SAHL application validates this SPN mapping and the uploaded, consolidated PDF. The app then confirms whether it able to pull this data into SLB’s FDP system.

Overall, all the data used by the SAHL application is stored in Microsoft Dataverse.

#### Takeaways

> Our collaboration has led to the development and implementation of a robust integration platform (SAHL) between our internal system (FDP) and our customers' billing systems (DILIP). This initiative has significantly improved user experience, enhanced data integrity, and unlocked performance across our operations.
>
> - Teena Bindal, SLB Solution Architect

Here are some key takeaways for IT and product-testing professionals who are looking to implement a similar solution in their own organizations:

- Data extraction: Extract data from PDFs.
- Data mapping: Automated mapping to SLB master data IDs: SPNs, Rig, Well.
- Data transmission: Auto-entry into the FDP system.

The backend utilizes Microsoft Dataverse, and the front-end is built with Power Platform’s canvas apps. Security is managed through Azure Key Vault for secret management, and Role-Based Access Control (RBAC) ensures proper permissions within the system.

> This automation eliminates the need for double entry, streamlines the billing process, and ensures a
smoother, more intuitive experience for all users involved.
>
> - Teena Bindal

The canvas app provides SLB with the following benefits:

- Eliminates double entry: Increases productivity by two times, when reducing duplication of data entry between DlLIP and FDP systems.

- Streamlines financial cost recording: Ensures accurate and
  efficient tracking for KSA.

- Instant approval notifications: Facilitates faster decisions with real-time updates.

- Simplified discount management: Makes discount handling easier and error-free.

- Automated SPN & header mapping: Enhances seamless data flow by automating processes.

- Automated price book retrieval: Provides the latest pricing
  information at your fingertips.

- Easy upload to FDP: With just a few clicks, SLB employees upload SAHL data curated from Siebel CRM, Price Book Management (PBM), and master data management (MDM) into FDP, and that gets the ticket moving forward.

- Significant cost savings: Aims to save 11 FTEs (PSD assistants).

## Technologies used

The development and implementation of the various SLB solutions uses the following Microsoft technologies:

- Power Apps: Used to build the project discovery application and to integrate multiple data-entry platforms.

- AI Builder: Used to build project recommendations and to
  accurately extract shipment details.

- Power Automate: The flows move information and files between the tools and solutions.

- Dataverse: Stores the data that’s used by the apps and chatbot.

- SharePoint: Stores the files with the shipping information.

- Microsoft Azure: Azure Functions processes HTTP requests. Azure Blob Storage stores the information from the Python code and from Dataverse. Azure Key Vault provides secure secret management.

- Microsoft Excel: Power Automate flows compile information into Excel files for the tax team to process.

## Key takeaways

The case study of SLB’s productivity apps and tools demonstrates the potential of using Power Apps, AI Builder, and Power Automate to set up a project-discovery and collaboration application, as well as a variety
of data extraction workflows. Here are some key takeaways for IT professionals who are looking to implement similar solutions in their own organizations:

- Share project information: Use Power Apps, AI Builder, and Power Automate to build an app that collects project information from a globally distributed team.

- Store the information in Dataverse and SharePoint.

- Enable the employees to find projects that they can join or learn from to build and contribute similar projects.

- Extract data: Use Power Automate and AI Builder to extract data from online documents, such as invoices and shipping logs.

- Compare and validate data: Automatically compare and validate data from multiple sources, such as emails, an online system, PDFs on SharePoint, or data in Dataverse that was entered through a Power Apps application.

- Update systems of record: Use Power Automate Automatically update systems of records and report any issues, for tax identification, accounting records, shipping and supply-chain management, invoice validation, or similar tasks.

- Secure credentials: Use Azure Key Vault to secure secret
  management, which includes securing sensitive data such as passwords, encryption keys, and API tokens.

Since building solutions with Microsoft Power Platform, SLB has received the following key benefits:

- 800+ AI-powered matches were generated: Users actively utilized the system, discovering previously hidden synergies.

- 150 similar projects were inspired: Facilities worldwide initiated projects inspired by matches, leading to a wave of cross-facility innovation.

- $10 million recovered in export duties: The implementation of AI Builder and Power Automate revolutionized SLB's document processing workflow. The company also achieved significant improvements in efficiency and accuracy.

- Automatically processed 1,000 emails per month: Enhanced
  scalability with significant time savings, equivalent of one full-time employee.

- Error reduction: Performed business validations, generating
  accurate airline GST reports.

- Eliminated double entry: Increases productivity by 2x when
  reducing duplication of data entry between DlLIP & FDP systems.

- Simplified discount management: Makes discount handling easier and error-free.

- Significant cost savings: Aims to save 11 FTEs (PSD assistants), which results in an annual cost saving of approximately \$500,000.

## Looking ahead

SLB continues to benefit from the project discovery application, which results in global employee collaboration and leads to creating similar projects every month. Many of these projects include automation solutions built on Power Platform like the examples above. SLB plans to focus on scaling their adoption of Power Platform to impact all aspects of their business.

SLB continues to revolutionize employee productivity with Power Platform in the oilfield services and equipment industry.

## Related information

- [What is Power Apps?](/power-apps/powerapps-overview)
- [Training for Power Apps](/training/powerplatform/power-apps)
- [Overview of building canvas apps](/power-apps/maker/canvas-apps/getting-started)
- [Build apps through conversation with Copilot](/power-apps/maker/canvas-apps/ai-conversations-create-app)
- [Edit your app with Copilot in Power Apps Studio](/power-apps/maker/canvas-apps/ai-edit-app)
- [What is Power Automate?](/power-automate/flow-types)
- [Overview of AI Builder](/ai-builder/overview)
- [Use an AI Builder custom entity extraction AI model in Power Automate](/ai-builder/entity-extraction-pwr-automate)
- [Create a document processing custom model in AI Builder](/ai-builder/create-form-processing-model)
- [Train and publish your document processing model in AI Builder](/ai-builder/form-processing-train)
- [Use the document processing model in Power Automate](/ai-builder/form-processing-model-in-flow)
- [Use entity extraction model in Power Automate](/ai-builder/prebuilt-entity-extraction-pwr-automate)
- [Use the key phrase extraction prebuilt model in Power Automate](/ai-builder/flow-key-phrase-extraction)
- [Use the invoice processing prebuilt model in Power Automate](/ai-builder/flow-invoice-processing)
