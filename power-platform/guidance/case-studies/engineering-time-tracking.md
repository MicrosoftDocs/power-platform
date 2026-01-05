---
title: John Cockerill streamlines enterprise business processes with Power Platform
description: Learn how international engineering company John Cockerill engages pro developers to build enterprise-wide apps with Power Platform.
author: robstand
ms.author: sashi
ms.topic: overview
ms.subservice: case-study
ms.date: 02/03/2025

---

# John Cockerill streamlines enterprise business processes with Power Platform

In this case study, you learn how John Cockerill, an international engineering company, uses Power Platform to develop enterprise apps that are used by more than 2,000 employees every day.

After a recent major digitization effort, which included rolling out Microsoft 365 to employees, leadership also wanted to build quick custom solutions to streamline business processes. Using Power Platform seemed like the next logical step. "Given the varied nature of our businesses, we needed a digital solution that was as versatile as our operations," says Denis Debroux, Chief Information Officer (CIO) of John Cockerill Group.

Today, more than 30 Power Platform solutions make processes like ordering company cars, creating customer contracts, and hiring temporary workers more efficient. "Power Platform enabled us to create bespoke applications that meet the specific demands of each business unit," says Debroux. "These applications are key to our successful digital transformation, ensuring that every part of our organization benefits from innovation, no matter how unique their needs."

## Delivering business value, not just lines of code

At John Cockerill, a team of 15 business analysts, product owners, UX/UI designers&mdash;and just four developers&mdash;builds enterprise solutions on Power Platform. The small development team's pro developer experience keeps build quality high. "We were early adopters of Azure DevOps services and automated deployments using the [ALM Accelerator for Power Platform](/power-platform/guidance/alm-accelerator/overview), and we're progressively transitioning to native pipelines," says Gilles Meyer, Lead Architect on John Cockerill's Power Platform development team.

Julien Bonsangue, Head of Digitalization, Business Intelligence, and Architecture, confirms the benefits of building solutions in a more agile, automated way. "Every solution we put in production using Power Platform has always performed exceptionally well over the long term. Even apps we built four years ago are still used today."

But Bonsangue acknowledges that getting professional developers to accept Power Platform's low-code approach wasn't easy. "During my first year at John Cockerill, I spent many evenings with a friend, a senior C# architect, over dinner explaining the advantages of developing with low code on Power Platform. It took a while to convince him but, at some point, something just clicked, and he said, 'Yeah, as a pro developer, I'm far more interested in delivering business value and not just lines of code.'"

He's had similar conversations with his own team. "I encourage my pro developers to get out of their comfort zone and move from a code set mentality, where apps can take weeks, even months, to a more agile, low-code mentality with Power Platform, where you can build something from scratch in three or four weeks and release it to thousands of people."

Although Bonsangue encourages his developers to use Power Platform wherever possible, he acknowledges that traditional code is sometimes necessary. That's where the team's pro developer experience again proves valuable. "By working with both low code and 'pro code' platforms, my developers are really good at knowing when to use what," he says. And if a low-code approach doesn't provide the most efficient solution, he adds, "I remind my team that Power Platform is part of a broad ecosystem under Azure that provides all the tools we need for the most complex applications."

## A streamlined time tracking solution

One of the company’s most successful Power Platform projects is a time tracking solution for employees. Previously, frontline workers at John Cockerill submitted their hours on paper forms that required manual input into SAP. To streamline the process, the development team created two apps: a mobile app for employees to enter their time, and another one for supervisors to review their entries. They also set up read-only integration into SAP to give managers insight into data for reporting purposes without requiring them to sign in to SAP.

After a successful six-month trial period to build confidence in the new solution, the team moved to read/write access to SAP using a custom connector. SAP access removed the need to input data manually and resulted in fewer errors and missed deadlines. A related time tracking app for engineers followed, and both solutions are now being rolled out across other divisions in the company.

Microsoft Dataverse makes it easier to display timesheet data in Power BI so that managers can quickly review worker activity on a daily, real-time basis.

As reporting needs grew, so did the solution. For example, to align time tracking information with specific business units, cost centers, and employees, the team integrated data from SAP SuccessFactors. Employee data moves daily from SuccessFactors through Azure Synapse Analytics pipelines into Azure Data Lake Storage, where it's made available to Dataverse in virtual tables that are based on the serverless SQL pool in Azure Synapse Analytics. The result is a more complete record for easier reporting and review.

:::image type="content" source="media/solution-flow-diagram.png" alt-text="Diagram that shows the flow of data in John Cockerill's time tracking solution.":::

## Supporting citizen developers

The company is eager to expand on the success of its professionally developed solutions by supporting a growing community of citizen developers with opportunities, guidance, and training. Employees present business cases to IT partners who are assigned to each business unit. These partners route development to a central team or guide citizen developers in building the solutions themselves. An internal portal provides extensive training materials on Power Platform, and every business unit has a dedicated dev and test environment. The central team evaluates each app for quality and security before moving it to production.

Successful apps are showcased in community meetings every two to three weeks. "Most attendees want to build apps, but I try to push them to think bigger and also explore opportunities to automate processes using Power Automate," says Bonsangue. He also sees opportunities to promote the AI capabilities of Power Platform by integrating a growing Dataverse repository of company data to build highly effective chatbots.

"With Power Platform," he says, "it's all about enabling an end-to-end digitization journey and using data to really benefit the business."

## Related information

- [Power Platform guidance documentation](/power-platform/guidance/)
- [Power Automate guidance documentation](/power-automate/guidance/)
- [Best practices and guidance when using Dataverse](/power-apps/developer/data-platform/best-practices/)
