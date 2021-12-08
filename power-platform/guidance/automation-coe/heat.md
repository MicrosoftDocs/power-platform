---
title: Holistic enterprise automation techniques (HEAT) | Microsoft Docs
description: HEAT is guidance to help you deploy the automation platform and manage the lifecycle of an automation project. Use these best practices and tools to achieve your automation goals. 
author: kathyos
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/8/2021
ms.subservice: guidance
ms.author: kathyos
ms.reviewer: deonhe
search.audienceType: 
  - admin
search.app: 
  - Flow
  - Powerplatform
---
# Holistic enterprise automation techniques (HEAT)

HEAT is guidance that's designed to help you deploy the automation platform and manage the entire lifecycle of an automation project. Cloud architects, RPA developers, IT professionals, and business decision makers use these best practices, documentation, and tools to achieve their cloud adoption goals.

By using HEAT, organizations can better align their business and technical strategies to ensure success.

HEAT includes these stages:

- Empower
- Discover & plan
- Design
- Build & test
- Deploy & manage
- Secure & govern
- Nurture

We have recorded [a special series on our video channel Automate It](https://aka.ms/rpapnp) where we go into each of these stages in detail.

Begin with this video: [Introducing HEAT](https://youtu.be/OmQpIjC2Vlc)

:::image type="content" source="media/heat-overview-large.png" alt-text="A slide from the video Introduce HEAT showing an overview of the stages of HEAT" link="https://youtu.be/OmQpIjC2Vlc":::

Learn how to apply the HEAT techniques in your Automation Center fo Excellence (CoE) with the [Administering a Low-Code Intelligent Automation Platform whitepaper](<https://aka.ms/autocoeadminwhitepaper>).

Each stage of the HEAT technique is described below, with additional resources.

## Empower

The start of any successful automation project is to ensure that the key stakeholders understand the automation capabilities of the platform. In this stage, users new to Microsoft Power Automate can learn about the automation capabilities in Power Automate.

Watch the video: [Power Automate & Power Platform](https://youtu.be/OmQpIjC2Vlc?t=410)

:::image type="content" source="media/pp-overview-large.jpg" alt-text="A slide from the video Power Automate & Microsoft Power Platform showing an infographic about the Microsoft Azure and Microsoft Power Platform apps and services for developer" link="https://youtu.be/OmQpIjC2Vlc":::

## Discover & plan

In this stage, CoEs and business collaborate on what processes to automate based on the expected ROI, form the development team, and set up the Power Automate environment.

While automation enables organizations to become more efficient, deciding which processes to automate is still often a challenge. It is impossible to automate every process, so CoEs can use the [Automation Project app](automation-coe-starter-kit.md) to manage the backlog and pick an automation based on ROI.

Power Automate provides environments of different types (for example, production, sandbox, and trial).  Each environment has a defined set of users and roles. Admins can bring their own compute infrastructure to install Power Automate for desktop and the necessary software.

Watch the video: [Empower, discover, & plan"](https://youtu.be/94Lq15PNDDg)

:::image type="content" source="media/m365admin-large.png" alt-text="Slide from Empower, discover, and plan video showing a screenshot of M365 Admin Center, showing Active Groups area" link="https://youtu.be/94Lq15PNDDg":::

Resources for determining ROI, process discovery, and setting up Power Automate environment:

- Discover which process to automate using [process advisor](https://flow.microsoft.com/process-advisor/)
- Use the [Automation Project app](automation-coe-starter-kit.md) for curating and managing ideas
- [Power Automate for desktop](/power-automate/desktop-flows/introduction)
- [Power Automate IP address configuration](/power-automate/limits-and-config)
- [Service administrator roles (Microsoft 365 Global / Power Platform/ Dynamics 365/ Azure/ Power BI admin)](/power-platform/admin/use-service-admin-role-manage-tenant)
- [Assign Power Automate RPA attended user plan through Microsoft 365 admin center](/power-automate/organization-q-and-a#power-automate-rpa-license)
- [Manage unattended RPA add-on capacity](/power-platform/admin/capacity-add-on) in [Power Platform admin center](https://aka.ms/ppac)

## Design

Building robust automation solutions require well-defined design principles that will build the foundation for scale, security, and compliance.

Watch the video: [Design phase](https://youtu.be/ur1-y0lrexU)

:::image type="content" source="media/rpadesign.png" alt-text="Slide from the Design phase video, showing core design principles of intuitive user experience, intelligent process automation, and accessible to everybody" link="https://youtu.be/ur1-y0lrexU":::

Some other design principles (not a comprehensive list) to consider are:

- Design for scale, throughput, and resiliency
- Fundamentals – logging and credential management and testing
- Error handling and retries strategy
- Using API vs UI for automation

## Build & test

Building is the heart of the automation lifecycle.

Watch the video: [Build & test](https://youtu.be/qvzBNfnjbpA)

:::image type="content" source="media/pad-implement-large.png" alt-text="Slide from the Build & test video, showing a desktop flow being built in Power Automate for desktop" link="https://youtu.be/qvzBNfnjbpA":::

More resources for building automations:

- [RPA playbook for SAP GUI automation](https://flow.microsoft.com/blog/rpa-playbook-for-sap-gui-automation-with-power-automate-api-flows-ui-flows-and-power-automate-desktop)
​- [Microsoft AI Builder](https://flow.microsoft.com/ai-builder/)
- Automate It video series: ["Power Automate for desktop and SAP"](https://www.youtube.com/watch?v=u1-8oKytJAU)
- [Use sensitive text in Power Automate for desktop + Azure Key Vault](https://powerusers.microsoft.com/t5/Webinars-and-Video-Gallery/Using-Sensitive-Text-In-Power-Automate-Desktop-Azure-Key-Vault/td-p/790556)

In [Robotic process automation (RPA) with SAP](/power-automate/guidance/rpa-sap-playbook/introduction), shows how to build an enterprise grade Invoice Processing automation solution. This intelligent automation solution processes invoices in SAP and showcases some of the key enterprise scenarios such as logging, auditing, tracking each invoice processing, human in the loop, ROI calculation, and more.

Watch the video series: [SAP GUI based RPA in Power Automate for desktop](https://youtu.be/7u9TYcDShNA)

:::image type="content" source="media/invoice-processing-large.png" alt-text="Slide from the Robotic process automation (RPA) with SAP video series, showing a flowchart for processing an invoice" link="https://youtu.be/7u9TYcDShNA":::

## Deploy & manage

Power Automate provides a rich set of capabilities for admins and developers throughout the deployment cycle for a given automation, including detailed information on the success or failure of each individual run and the ability to schedule, queue, and prioritize an automation.

Developers can set up CI/CD with test integration to deploy automation and avoid accidental changes that would break the automation in production.

Power Automate also helps users manage their automations. All execution data is available in Dataverse, with reports and views that visualize this data. Power Automate provides real-time information on individual bots and the machines and clusters they run on, giving more-detailed visibility into the full automation health, bot health, and infrastructure health.

Watch the video: [Deploy & manage](https://youtu.be/VukO0gHj7YU)

:::image type="content" source="media/livemonitor-large.png" alt-text="Slide from the Deploy & Manage video, showing a screenshot of the desktop flow runs screen" link="https://youtu.be/VukO0gHj7YU":::

Some resources for deploying, monitoring, and managing automations:

- [ALM with Microsoft Power Platform using Azure DevOps or GitHub](/power-platform/alm/)
- [Run desktop flows as attended/unattended](/power-automate/desktop-flows/run-desktop-flow)
- [Monitor desktop flow runs](/power-automate/desktop-flows/monitor-desktop-flow-runs)
- [Prioritize desktop flow using queues](/power-automate/desktop-flows/monitor-desktop-flow-queues)
- [Sharing desktop flows](/power-automate/desktop-flows/manage#share-desktop-flows)
- [Microsoft Dataverse auditing](/powerapps/developer/data-platform/auditing-overview)
- Video: [On-premises data gateway monitoring status](https://www.youtube.com/watch?v=963KPiL2PZk&amp;t=1053s)
- Video: [Automate on-premises data gateway installs](https://www.youtube.com/watch?v=WJ_AJxUSiYU)
- Video: [Clustering your gateways](https://youtu.be/2SOXPUsJfb0)
- Video: [ALM with RPA in Power Automate](https://youtu.be/eOrYit9rWMo)
- Video: ["Power Automate desktop monitoring dashboard"](https://youtu.be/zME5ZaKx2bk)

## Secure & govern

In this stage, the Automation CoE can use security controls to establish guard rails to scale RPA across their organization. They can leverage Azure Active Directory, a key foundation that allows admins to create and manage access controls on users and resources centrally. Power Automate provides rich governance and security controls to ensure that you can run your business-critical processes in a trusted and compliant manner.

The platform provides a rich set of auditing logs that help admins keep track of what happened in the system. The deep integration of Microsoft Power Platform with Azure and Microsoft 365 allows IT admins to define reactive and proactive policies and procedures to track automation activity.

Some helpful resources for security, governance, and adoption nurturing:

- [Power Platform compliance and data privacy](/power-platform/admin/wp-compliance-data-privacy)
- [Microsoft Trust Center](https://www.microsoft.com/trustcenter)
- [Establishing a data loss prevention (DLP) strategy](/power-platform/guidance/adoption/dlp-strategy)
- [Audit Power Automate flow events through Microsoft 365 Security & Compliance Center](https://flow.microsoft.com/blog/security-and-compliance-center/)

## Nurture

CoEs should establish their strategy to nurture and upskill their employees. They can create a community of champions, train them, run bot wars, and evangelize success stories. Power Automate provides a rich set of [learning resources](https://powerapps.microsoft.com/blog/microsoft-powerapps-learning-resources/) (documentation, videos, tutorials, labs, courses, certifications, whitepapers, etc.). [Microsoft Power Platform Adoption Center](https://adoption.microsoft.com/powerplatform/) provides guidance, workbooks, and tools to accelerate adoption within your enterprise.

## Apply HEAT techniques

 Learn how to apply the HEAT techniques in your Automation CoE with the [Administering a low-code intelligent automation platform whitepaper](<https://aka.ms/autocoeadminwhitepaper>).

## More resources to start automating

- [Download Power Automate for desktop](https://flow.microsoft.com/desktop/)
- [Power Automate documentation](/power-automate/)
- [Get help with Power Automate for desktop on Forums](https://powerusers.microsoft.com/t5/Power-Automate-Desktop/bd-p/MPADesktop)
- [Watch and subscribe to the Automate It series](https://aka.ms/automateit)
- [Follow us on Twitter: @MSPowerAutomate](https://twitter.com/MSPowerAutomate)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
