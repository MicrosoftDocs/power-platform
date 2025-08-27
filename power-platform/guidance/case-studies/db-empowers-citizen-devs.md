---
title: Deutsche Bahn empowers citizen developers with Power Platform
description: Learn how Deutsche Bahn empowers 4,000 citizen developers to build over 500 low-code apps using Microsoft Power Platform, saving time and reducing costs.
#customer intent: As a business owner, I want to understand how Deutsche Bahn uses Power Platform so that I can evaluate its potential for my organization.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.subservice: guidance
ms.topic: overview
ms.date: 04/10/2025
---

# Deutsche Bahn empowers citizen developers with Power Platform

In this article, you learn how Deutsche Bahn (DB) Group, the operator of the largest rail infrastructure in Europe, accelerated innovation by empowering every employee to build low-code business applications by using Microsoft Power Platform.

DB serves millions of passengers daily, including through its high-speed InterCity Express (ICE) trains that connect major cities across Europe. In freight and logistics, DB Cargo and DB Schenker manage extensive operations, efficiently moving goods worldwide.

DB empowers every employee through a premium Power Platform license. Therefore, DB employees can collaborate to build and maintain low-code business applications at scale. This policy created a vibrant and fast-growing community of 4,000 citizen developers who have over 500 applications in production. Their apps are saving time and reducing costs across all of DB's areas of business.

For example, a mobile app targets 8,440 track repairs, saving three minutes per target compared to manual recording and giving 56 days back to the team.

"Before we used Power Platform, it was very expensive to develop new apps," said Thomas Czierpke, Head of Microsoft 365 Adoption and Change Management, DB Group. "Now, we no longer require a professional developer and a lot of time."

> Each of our coworkers has a Power Platform license to create, to solve problems for his or her team, or even for the whole company. It's very easy to make your own app, and very fast.
>
> — *Thomas Czierpke, Head of Adoption and Change Management*

## Case study

In this technical case study, you learn how:

- DB Group saved time and costs through a citizen developer model that uses Microsoft Power Platform.
- DB's shift log mobile app, built in Power Apps, uses Power Automate flows to schedule emails and visualizes data on a Power BI dashboard.
- DB's rail maintenance app, also built in Power Apps, transfers data to a Dataverse table and images to a SharePoint folder to make data collection easy, regardless of whether a device is online or offline.

## The scenario

DB's approach to building a citizen developer program operates with a Center of Excellence (CoE) on two levels: centralized and localized.

"We have a centralized Center of Excellence, which defines guidelines and standardizes common components and services across the company," said Sakibou Tchagbele, who leads the Low-Code/No-Code Topic Team at DB Systel Architecture Guild and DB CoE Integration Area. "The local Center of Excellence is really focusing on implementation at the subsidiary level and includes the subsidiary CIO."

This approach ensures that governance is implemented all the way through to the local level. It also ensures that the citizen developer program can scale without overwhelming Tchagbele and his team. "I don't have to review every question from every citizen developer," he explained, "only the ones that can't be solved by the local experts."

The following image illustrates DB's Microsoft Power Platform governance model.

:::image type="content" source="media/db-case-study/db-model.png" alt-text="Diagram illustrating Deutsche Bahn's Power Platform governance model, showcasing roles, processes, and environments.":::

The primary two roles in governance are:

- **Platform users**, who create and maintain the Power Platform applications.
- **Platform producers**, who prepare and deploy Power Platform to the users.

The Platform users consist of citizen developers, who build the apps, and the local expert teams, who evaluate the apps and provide feedback and improvements. The local expert teams coach the citizen developers and approve the apps when they are ready for release.

The citizen developers build the apps in Managed Environments. The process involves generating ideas in the development-test environments, staging the apps during evaluation and refinement, and then deploying the apps in the production environment. The environments are prepared and delivered by the Platform producers, who define the services and ensure scalability in a CoE.

## Governance strategy

To create its citizen developer governance model, DB Group completed the following steps:

- **Form a CoE** to define, deliver, and scale Microsoft Power Platform governance.
- **Create Managed Environments at scale**, so that citizen developers can generate their ideas in development-test environments, refine their apps in staging, and deploy their apps in production environments.
- **Train citizen developers** and the additional roles at scale.

### Form a CoE

DB formed a CoE to define, deliver, and scale Power Platform governance.

The Platform producers build the connectors for the various technologies and data, define specific components and features, build the functional blueprints, and design the templates. When the app environments are fully prepared, the Platform producers deliver the service to the Managed Environments, where the citizen developers can build their apps at scale.

The CoE team uses the [Power Platform Center of Excellence starter kit](/power-platform/guidance/coe/starter-kit) as the foundation to develop its own governance features. To ensure consistency across apps, the team provisioned various [Power Apps](https://www.microsoft.com/power-platform/products/power-apps) templates with DB user experience (UX) style guides. Both citizen developers and professional developers use these templates as a starting point for their DB Power Apps development.

### Create Managed Environments at scale

The citizen developers generate ideas and build the apps in their development-test environments. When a concept is proven, they stage the app while it's evaluated by the local expert teams for business criticality and value, risk management, data protection, security, and so on. After the app is approved, it's deployed in a production environment.

To drive its strategy for governance at scale, DB has used Managed Environments since the capabilities were introduced in 2022. These capabilities include customized [welcome content](/power-platform/admin/welcome-content) that greets makers as soon as they sign in to Power Apps. This welcome content includes the latest internal policies for each environment. Additionally, admins can organize large numbers of environments into [environment groups](/power-platform/admin/environment-groups) and then apply specific rules across those groups.

### Train citizen developers

DB employees enthusiastically embraced the opportunity to build better solutions faster and drive innovation.

When Czierpke made over 2,000 training sessions available last year, they were fully booked within just seven hours. He credits DB's community approach for driving these levels of excitement. "I think that's the key factor," Czierpke asserts. "We have 11,000 people in the community attending workshops and showcases and other learning events, and now they all inspire and excite each other." This Power Platform community is the third-largest community within DB Group.

DB also launched a groundbreaking training app to organize employee training across the company by using the capabilities of Power Platform, including Power Apps, Power Automate, and Power BI. This initiative represents the first organization-wide Power Platform use case that the Worker Council approved. Therefore, it represented a significant milestone for DB's IT department in fostering broader adoption of the platform.

As a result of this training, makers across the company are building apps that drive significant business results.

## Example applications

Let's look at some successful example applications that the citizen developers have built. These examples can be useful to any organization, helping it understand both the types of applications to build and the steps that are required to build them. The following example applications are described in detail:

- **App that digitizes the shift log reporting process** for teams that clean passenger trains
- **App that streamlines processes** that are related to track maintenance

### Build an app that digitizes the shift log reporting process

Stephanie Schneider at DB Services GmbH built an app that digitizes the reporting process for the teams that clean passenger trains. Shift log data that was previously recorded on paper can now be entered directly into a mobile app that was built by using Power Apps. The data is automatically compiled, sent via email to managers through a scheduled [Power Automate](https://www.microsoft.com/power-platform/products/power-automate) flow, and shown on a [Power BI](https://www.microsoft.com/power-platform/products/power-bi) dashboard that provides instant insights into performance.

The following image shows the user experience. An employee selects **Start** and fills in the reporting information, as shown on the left. The data is then visualized for business intelligence on the Power BI dashboard, as shown on the right.

:::image type="content" source="media/db-case-study/shift-digitize.png" alt-text="Diagram showing a representation of the app built to digitize shift log reporting and of the corresponding Power BI data." lightbox="media/db-case-study/shift-digitize.png":::

The app reduces errors that are caused by poor handwriting from 20% to 2% and saves shift managers approximately 70 minutes per shift. Therefore, because there are three shifts per day, the app saves shift managers 24 hours over the course of a week—time that they can spend on important, onsite issues. The success of the app in one group quickly led to interest from managers in other business areas. "My counterparts in other regions are testing the app now," said Schneider. "The potential impact across the company is enormous."

### Build an app that streamlines maintenance processes

Christoph Schmitz at DB InfraGO built an app to streamline processes that are related to track maintenance. Track maintenance is a complex process that includes gathering and analyzing photographic evidence and measurement data. In the past, DB completed this process by sending out workers who were equipped with cameras and paper notebooks. Images and data were then manually moved into folders and Excel files.

"This was necessary work, but not the main work of those employees," said Schmitz, whose mobile app digitized the entire process.

As the following image shows, an employee just has to fill out a form in the app with information about the track maintenance and then select the save button.

:::image type="content" source="media/db-case-study/track-maintenance.png" alt-text="Diagram showing the DB rail maintenance app, including a detailed explanation of the form for recording track maintenance.":::

Data is then transferred to a [Dataverse](https://www.microsoft.com/power-platform/dataverse) table, and the images that were captured on the phone are transferred to a SharePoint folder. Thanks to the offline mode in Power Apps, data can also be collected without network reception and uploaded when the device is back online.

Schmitz's app drastically reduces errors and saves enormous amounts of time. "So far, we have recorded 8,440 targets and saved three minutes each," he said proudly. "That's 56 days we've given back to the team."

## Takeaways

The case study of DB's citizen developer community demonstrates the potential of using Power Apps, Power Automate, Dataverse, and Power BI to set up a system that enables a large organization to empower its employees at scale.

Here are some key takeaways for IT professionals who are seeking to implement a similar solution in their own organization:

- **Identify the use case** that affects business productivity and customer success.
- **Build the CoE** to ensure quality deployments and also nurture and educate employees as part of the citizen developer community.
- **Create and scale Managed Environments** to design, build, test, and release the applications. As part of this effort:

  - [Customize welcome content](/power-platform/admin/welcome-content).
  - [Add environment groups and rules](/power-platform/admin/environment-groups).

- **Run pipelines** to optimize your deployment process. Add security and efficiency to the approval process to ensure compliance in your deployments. Learn more in [Run pipelines in Power Platform](/power-platform/alm/run-pipeline).
- **Use Microsoft Power Platform to build unique and powerful applications** by employing:

  - **Power Apps** to create the apps.
  - **Power Automate** to schedule flows and automate tasks such as email, notifications, data collection, and file synchronization.
  - **Microsoft Copilot Studio** to create AI companion agents.
  - **Dataverse** to securely store and manage data.
  - **SharePoint** to store and manage files that users upload.
  - **Power BI** to visualize insights from data collection.

## Looking ahead

DB's citizen developer program continues to expand as interest and enthusiasm increase daily. As Tchagbele said, "With our Center of Excellence and local teams of experts, we're enabling both citizen developers and professional developers across the company to build effective, enterprise-level applications with Power Platform."

## Related information

- [Microsoft Power Platform Center of Excellence (CoE) Starter Kit](/power-platform/guidance/coe/starter-kit)
- [Managed Environments overview](/power-platform/admin/managed-environment-overview)

  - [Environment groups](/power-platform/admin/environment-groups)
  - [Enable maker welcome content](/power-platform/admin/welcome-content)

- [Overview of creating apps in Power Apps](/power-apps/maker/)
- [Get started with Power Automate](/power-automate/getting-started)

  - [Create a cloud flow in Power Automate](/power-automate/get-started-logic-flow)
  - [Run flows on a schedule](/power-automate/run-scheduled-tasks)

- [What is Microsoft Dataverse?](/power-apps/maker/data-platform/data-platform-intro)
- [Reports in Power BI](/power-bi/consumer/end-user-reports)
