---
title: John Cockerill engages pro developers to build enterprise-wide apps with Power Platform
description: Learn how John Cockerill engages pro developers to build enterprise-wide apps with Power Platform.
author: robstand
ms.author: sashi
ms.topic: overview
ms.subservice: guidance
ms.date: 11/19/2024

---

# John Cockerill streamlines enterprise business processes with Power Platform

In this case study, you learn how John Cockerill, an international engineering company, developed more than 30 advanced enterprise-wide apps that are used daily by more than 2,000 employees. The apps cover a wide range of business processes, from time tracking to hiring of temporary workers, and feature integration with back-end systems like SAP.

A few years ago, the company launched a major digitization strategy. Along with making system updates like Dynamics 365, leadership also wanted to build quick custom solutions to streamline business processes.

*"Back then, we didn't have an internal development team. Instead, employees would do their best with SharePoint and Excel."*

&mdash;Julien Bonsangue, Head of Digitalization, Business Intelligence, and Architecture

After John Cockerill released Microsoft 365 to employees, using Power Platform seemed like the logical next step. "Given the varied nature of our businesses, we needed a digital solution that was as versatile as our operations," says Denis Debroux, CIO of John Cockerill Group. Bonsangue got straight to work building a Power Platform practice, starting with just one developer and one UI designer. Their first project enabled employees to reserve desk space during the COVID crisis. With a well-designed user experience built on Power Apps, the app was an instant success and is still used today by more than 1,000 employees.

Several more quick wins followed with digitalization of small team processes. These wins set up an opportunity to make an even greater impact.

## Business challenges

Frontline workers submitted their hours by using paper forms. This was a long process that also required manual input into SAP. To streamline the process, the team created two apps: a mobile app for employees to input time and another for supervisor reviews. They also set up read-only integration into SAP, giving managers insight into the data fields required for reporting purposes without requiring them to log in to SAP separately.

After a successful six-month trial period to build confidence in the new solution, the team moved to read/write SAP access using a custom connector. SAP access removed the need to input data manually. It also resulted in fewer errors and missed deadlines. A related time tracking app for engineers followed, and both solutions are now being rolled out across other divisions in the company.

## Time tracking use case

As reporting needs grew, so did the solution. For example, to align time tracking information with specific business units, cost centers, and employee data, the team integrated data from SAP SuccessFactors. Employee data is moved daily from SuccessFactors into Azure Data Lake via Azure Synapse Analytics pipelines. Data is then made available to Dataverse via virtual tables that are based on the serverless SQL pool in Azure Synapse Analytics. The result is a more complete record for easier reporting and review.

Dataverse makes it easier to display data in Power BI, enabling managers to quickly review worker activity on a daily, real-time basis. In fact, almost all of the apps at John Cockerill are run on Dataverse and include a Power BI dashboard. As Bonsangue explains, "Our digitalization strategy isn't just about building apps but using these apps to gather quality data that is easily analyzed by managers." His ultimate strategy is to use this data to drive CRM activities and continuous improvement.

:::image type="content" source="media/solution-flow-diagram.png" alt-text="Diagram showing the flow of the time tracking solution." lightbox="media/solution-flow-diagram.png":::

Today, there are more than 30 Power Platform solutions deployed at John Cockerill, with more than 2,000 daily users. Other enterprise-wide solutions include more efficient processes for ordering company cars, creating customer contracts, and hiring temporary workers. "Power Platform enabled us to create bespoke applications that meet the specific demands of each business unit. These applications are key to our successful digital transformation, ensuring that every part of our organization benefits from innovation, no matter how unique their needs," says Debroux.

## Empower fusion teams for collaborative success

All enterprise solutions built on Power Platform at John Cockerill were created by a team that includes just four professional developers. This group works closely with the rest of the 15-person team, which includes business analysts, product owners, and UX/UI designers.

Professional development experience and the ALM experience that goes with it helped the team maintain quality. Maintaining quality is especially important as the need for enterprise-grade apps quickly accelerated. "Every solution we put in production using Power Platform always performed exceptionally well over the long term. Even apps we built four years ago are still used today," says Bonsangue.

The ALM Accelerator for Power Platform made the job even easier, providing a simplified interface to Azure Pipelines and Git source control for ALM in Power Platform. With the ALM Accelerator, developers can perform source control, enable version history, and deploy their solutions in Power Platform. "We were early adopters of Azure DevOps services and automated deployments using the ALM Accelerator for Power Platform, and we're progressively transitioning to native pipelines," says Gilles Meyer, Lead Architect at John Cockerill on the Power Platform development team.

Bonsangue acknowledges that moving professional developers to low code wasn't easy. He tells the story of a friend who's a senior C# architect. "During my first year at John Cockerill, I spent many evenings with a friend over dinner explaining the advantages of developing with low code on Power Platform. It took a while to convince him but, at some point, something just clicked, and he said, "Yeah, as a pro developer, I'm far more interested in delivering business value and not just lines of code."

He's had similar conversations with his own team. "I encourage my pro developer team to get out of their comfort zone and move from a code set mentality where apps can take weeks, even months, to a more agile, low-code mentality with Power Platform where you can build something from scratch in three or four weeks and release it to thousands of people."

Although Bonsangue encourages his team to use Power Platform wherever possible, he also acknowledges that traditional code is sometimes necessary. And that's where his pro developer experience again proves valuable. "By working with both low code and pro dev code platforms, my developers are really good at knowing when to use what." And if low code doesn't provide the most efficient solution? "I remind my team that Power Platform is part of a broad ecosystem under Azure that provides all the tools we need for the most complex applications. I consider being a part of the broader ecosystem a powerful advantage over other low-code platforms."

## Support the citizen developer community

Although the company is enjoying great success with Power Platform and its small team of pro developers, the company is also eager to expand on this success with a growing community of citizen developers. 

To help support that objective, IT business partners are assigned to each business unit at John Cockerill. Employees regularly present business cases to these partners, who route development to a central team or guide citizen developers to build themselves. An internal portal provides extensive training materials on Power Platform, and every business unit has a dedicated dev and test environment. The central team evaluates each app for quality and security before moving it to production.

Additionally, a community meeting is held every 2-3 weeks to showcase successful apps. "Most attendees want to build apps, but I try to push them to think bigger and also explore opportunities to automate processes using Power Automate," says Bonsangue. He also sees opportunities to promote the AI capabilities of Power Platform while also using integration with a growing Dataverse repository of company data to build highly effective chatbots. "With Power Platform, it's all about enabling an end-to-end digitization journey and using data to really benefit the business."

## Related information

- [Power Platform guidance documentation](/power-platform/guidance/)
- [Power Automate guidance documentation](/power-automate/guidance/)
- [Best practices and guidance when using Dataverse](/power-apps/developer/data-platform/best-practices/) 
