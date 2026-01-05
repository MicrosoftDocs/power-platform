---
title: Degrees of Change automates nonprofit operations with Power Apps, Power Pages, and AI Builder
description: Learn from nonprofit Degrees of Change how to automate nonprofit operations with Power Apps, Power Pages, and AI Builder.
author: shellyhaverkamp
ms.author: sashi
ms.topic: overview
ms.subservice: case-study
ms.date: 08/28/2024
---

# Degrees of Change automates nonprofit operations with Power Pages, Power Apps, and AI Builder

In this article, you learn how [Degrees of Change](https://www.degreesofchange.org/), a nonprofit dedicated to helping underrepresented students succeed in college and their careers, used Power Apps, Power Pages, and AI Builder to streamline its operations.

Through its Act Six and Seed Internships programs, Degrees of Change provides access to college education and graduate employment opportunities for exceptional students from underrepresented backgrounds. The team consists of 20 staff, more than 100 community volunteers, and one full-time IT resource.

Since Degrees of Change transformed the application and selection process with Power Platform and generative AI, it's able to deliver services to more students. This shift also streamlined operations and improved data tracking and analysis.

*“Part of our work is how we empower and give the tools to local, grassroots community nonprofits. We provide the technology, training, and curriculum assistance to be able to deliver the Act Six program in their community.”*&mdash;Tim Herron, Founder & Chief Innovation Officer

Read the full story: [Nonprofit organization expands career programs by using Power Pages and generative AI](https://customers.microsoft.com/story/1703120647074644538-degreesofchange-nonprofit-power-platform)

## Business challenges

The team works with seven communities, 17 partner colleges, and a growing number of employers in the northwestern United States. Each community recruits volunteers to run the Act Six and Seed Internships programs locally, with centralized support from Degrees of Change staff.

Before building its Act Six and Seed Internships solutions with Power Platform tools, the Degrees of Change team faced some operational challenges:

- **Manual and time-consuming processes** for managing program applications and selections, limiting their ability to scale and serve more students.
- **Lack of integration between different systems**, leading to data silos and making it difficult to track and analyze student progress and outcomes effectively.
- **Resource constraints** with only one full-time IT resource, hindering their ability to implement and maintain efficient technology solutions.

## Implementation approach

Degrees of Change automated its application processes by using Power Platform tools to:


- **Build an Application Scoring app in Power Apps**: Community volunteers use this app to assess and score program applications. This automation ensures that applications are evaluated consistently and efficiently.

- **Create a Power Pages portal**: Candidates apply for programs through a user-friendly portal. This portal streamlines the application submission process, making it easier for students to provide necessary information.

- **Build a matching app in Power Apps**: Degrees of Change staff manage the selection process and assign placements with the app. The app helps automate the matching of candidates to programs, reducing manual effort and increasing accuracy.

- **Add an employer-specific section in the Power Pages portal**: For the Seed Internships program, employers enter organizational information and get a list of available internships. The employer-specific section automates the collection and organization of internship opportunities.

- **Create a hiring managers portal**: Hiring managers submit internship position requirements and review candidates through the Power Pages portal. This automation streamlines the hiring process, making it easier to match candidates with suitable internships.

## Identify key tasks to automate

Before implementing its Power Platform solutions, Degrees of Change faced several technology challenges with the Act Six and Seed Internships programs. The team needed a secure way to share more than 1,000 applications per year with 150 volunteer assessors. Initially, the team sent printed copies, and then digital PDFs to the volunteers, which limited scalability and risked the security of students’ personal information.

Each community group selects local volunteers who reflect the diverse backgrounds of students in their area. These volunteers are assigned applications to review and score. The scores are then used to make program placement decisions, ensuring an equitable selection process. A significant investment was made in a custom web application, built and maintained by a vendor, but this approach soon became cost prohibitive.

*“What’s been so compelling to us is that the integration, extensibility, and flexibility of Power Platform means that we can do way more than we should be able to with the resources that we have.”*&mdash;Tim Herron, Founder & Chief Innovation Officer

:::image type="content" source="media/nonprofit/manual-task-flow.png" alt-text="Diagram showing manual tasks completed for Degrees of Change nonprofit." lightbox="media/nonprofit/manual-task-flow.png":::

## Build an app to automate the program application process


In 2019, the organization's IT resource, Tommy Kim, suggested a Power Platform solution to reduce the ongoing maintenance costs associated with the custom web application. A Power Platform solution would also enable greater control over solution functionality. The team used Power Apps to build an Application Scoring app in a few weeks, enabling secure access and improving ease of use for the community volunteers engaged in assessing program applications. Power Platform enabled the Degrees of Change team to design, develop, and maintain the tools needed to deliver its Act Six and Seed Internships programs with local community groups.

The team created an ecosystem of tools to meet the needs of different people involved in the application and selection process.

The solution supports three key personas:

1. **Candidates** (students) applying for programs via the Power Pages portal.

1. **Community volunteers** who assess and score program applications in the Power Apps Application Scoring app.


1. **Degrees of Change staff** who manage the selection process and assign placements in the Power Apps Matching app.


The Seed Internships solution supports two more personas:

1. **Employers** who enter their organization information and list available internships in the employer-specific section of the Power Pages portal.

1. **Hiring managers** who submit internship position requirements and review candidates through the Power Pages portal.

:::image type="content" source="media/nonprofit/automated-task-flow.png" alt-text="Screenshot showing automated application workflow." lightbox="media/nonprofit/automated-task-flow.png":::

The program application experience for candidates involves a series of Power Pages forms, Power Automate flows, and authentication steps:


1. The experience begins when a candidate fills out an interest form. The form is a public, nonauthenticated Power Pages form for collecting basic information from interested students.

1. When the interest form is submitted, Power Pages creates a record in Dataverse, and then triggers a Power Automate flow that checks the information against existing contacts. If the flow determines a student is qualified to apply, the flow then sends an email to the candidate with an invitation code that allows them to register in the portal.

1. When the candidate selects the link in their email, they come to a registration page in the portal. Authentication settings can be configured to disable account creation without an invitation, which ensures only qualified candidates can create an account and start an application.

1. After they register, candidates create an account and sign in.

1. After they sign in, candidates are guided through a series of pages to complete their application. The Degrees of Change team took advantage of out-of-the-box validation options in Power Pages to ensure valid and consistent data entry, including standardizing phone number formatting, and setting conditional visibility on questions.

:::image type="content" source="media/nonprofit/candidate-portal3.png" alt-text="Screenshot showing program application process flow." lightbox="media/nonprofit/candidate-portal3.png":::

This combination of Power Platform tools enables Degrees of Change to tackle the external access, security, and scalability challenges associated with growing its Act Six and Seed Internships programs:


- **Enabling authenticated, external access** to candidates and employers through the Power Pages portal.

- **Selectively displaying program data** appropriate for different users through the Power Pages portal and the Power Apps Matching and Application Scoring apps.


- **Securing and maintaining program data centrally** in Dataverse, which integrates with the Power Pages sites and apps in Power Apps.


The solution also helps with matching candidates to internship positions, a difficult and time-consuming part of the Seed Internships program. A prebuilt AI model in AI Builder performs two important functions in reducing bias and enabling scalability in the selection process:


- **Anonymize and extract key details** from candidate r&eacute;sum&eacute;s.

- **Synthesize large quantities of structured and unstructured program data** to generate candidate-to-internship match recommendations used by staff to support placement decisions.

## Build a candidate portal in Power Pages Design Studio

The team expanded the solution to include a Power Pages portal for candidates to submit program applications. Power Pages Design Studio allows you to build and deploy external-facing websites, such as a portal for program applications. With Power Pages, you can build sites that use the same shared business data stored in Microsoft Dataverse that you use for building apps and automations.

:::image type="content" source="media/nonprofit/candidate-portal.png" alt-text="Screenshot showing candidate portal created with Power Pages." lightbox="media/nonprofit/candidate-portal.png":::

Understanding your user personas is important to inform Power Pages site architectural decisions. For the Seed Internships portal, the team set up different pages for employers and candidates in the Power Pages site.

In the employer section of the portal, employers and hiring managers have access to set up and maintain their employer profile and add and monitor internship positions.


For a seamless user experience, the Degrees of Change team also styled its Power Pages portal to match its corporate brand colors and public website.


:::image type="content" source="media/nonprofit/candidate-portal2.png" alt-text="Screenshot showing internship application portal created with Power Pages." lightbox="media/nonprofit/candidate-portal2.png":::

## Improve application security and quality

The Degrees of Change team uses an Application Scoring app in Power Apps to share and monitor the progress of more than 1,000 applications with 150 community volunteer assessors. The Application Scoring app reads and writes program data to Dataverse, mitigating the privacy risk associated with sharing unsecured copies of candidate information.


:::image type="content" source="media/nonprofit/application-scoring-task-flow.png" alt-text="Screenshot showing application scoring task flow." lightbox="media/nonprofit/application-scoring-task-flow.png":::

The app interface improves the readability of the applications by laying out candidate information in sections on-screen to highlight the most important details.


The flexibility of the Power Apps user interface allowed the team to be self-sufficient when adding functionality to assist volunteers with the application assessment process. They created:

- A **tutorial video** to outline the app functionality.

- **Help text** with a scoring rubric to support consistency among assessors.

- **Task progress and schedule tracking** for each volunteer to complete their assessments in the required timeframe.

- **A built-in support request** integrated with Power Automate to automatically route the email to the right support person. The team collects feedback from app users to curate a backlog of improvement ideas.

*“The enhancements we added in a couple of weeks of internal time would have probably cost $50,000&ndash;$100,000 in custom development.”*&mdash;Tim Herron, Founder & Chief Innovation Officer


:::image type="content" source="media/nonprofit/form-example.png" alt-text="Screenshot showing example of application scoring form." lightbox="media/nonprofit/form-example.png":::

## Support decision-making with AI Builder

The team uses prebuilt AI models in AI Builder to reduce bias and help accelerate matching of candidates to available placements in the Seed Internships Program. AI Builder performs two important functions that support the fairness and scalability of the application matching process for the Seed Internships program:


- **Anonymize and extract key details** from candidate r&eacute;sum&eacute;s to reduce bias in decision-making.

- **Generate candidate-to-internship match recommendations** by combining candidate and role information, the candidate quality score captured by volunteer assessors in the Application Scoring app, and a candidate fit score generated by Microsoft Fabric.

Match recommendations from AI Builder are displayed in the Matching app for staff to review. The Degrees of Change team also set up AI Builder to generate an explanation for each match recommendation.


The AI Builder match recommendations significantly increase the speed and quantity of internship placements that staff are able to process.

*“Using the prebuilt models in AI Builder is helping our staff make faster, more effective recruitment decisions without having to burn hours processing the raw data.”*&mdash;Tim Herron, Founder & Chief Innovation Officer


:::image type="content" source="media/nonprofit/matching-system-task-flow.png" alt-text="Screenshot showing matching system task flow." lightbox="media/nonprofit/matching-system-task-flow.png":::

### Accelerate candidate matching with AI models

AI Builder provides a selection of prebuilt models and the ability to create custom models for different business scenarios. To streamline the candidate matching process, the Degrees of Change team uses these models and tools:


- **Entity extraction**: The team uses the prebuilt entity extraction model in AI Builder to identify key elements of structured data from candidate applications and unstructured data from candidate r&eacute;sum&eacute;s. The data is used to match with the internship position requirements outlined by employers and hiring managers.


- **Match recommendation**: A second AI model then combines these elements to generate a match recommendation that is displayed to staff in the Matching app.


- **Power Automate**: Power Automate orchestrates the processing of information by providing AI Builder with the data it needs from Dataverse, and then storing the results back in Dataverse.

:::image type="content" source="media/nonprofit/entity-extraction-model-flow.png" alt-text="Screenshot showing entity extraction task flow." lightbox="media/nonprofit/entity-extraction-model-flow.png":::

*“Augmenting our selection process with AI Builder allows us to scale and make the most use of our human assessments.”*&mdash;Tim Herron, Founder & Chief Innovation Officer


## Related information

- [Power Platform Well-Architected](/power-platform/well-architected/)
- [Overview of AI Builder](/ai-builder/overview)
- [AI models and business scenarios](/ai-builder/model-types)
- [Design and build sites in Power Pages Design Studio](/power-pages/configure/design-build-overview)
- [Style your Power Pages site](/power-pages/getting-started/style-site)
