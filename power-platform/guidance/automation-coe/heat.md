---
title: "Holistic Enterprise Automation Techniques (HEAT) | Microsoft Docs"
description: HEAT is guidance to help you deploy the automation platform and manage the lifecycle of an automation project. Use these best practices and tools to achieve your automation goals. 
author: kathyos
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/6/2021
ms.subservice: guidance
ms.author: kathyos
ms.reviewer: deonhe
search.audienceType: 
  - admin
search.app: 
  - Flow
  - Powerplatform
---
# Holistic Enterprise Automation Techniques (HEAT)

HEAT is guidance that's designed to help you deploy the automation platform and manage the entire lifecycle of an automation project. Cloud architects, RPA developers, IT professionals, and business decision makers use these best practices, documentation, and tools to achieve their cloud adoption goals.

By using HEAT, organizations can better align their business and technical strategies to ensure success.

We have recorded [a special series on our video channel “Automate It”](https://aka.ms/rpapnp) where we go into each of these stages in more detail. Learn how to apply the HEAT techniques in your Automation COE with the [Administering a Low-Code Intelligent Automation Platform whitepaper](<https://aka.ms/autocoeadminwhitepaper>).

Begin with this video: ["Introducing HEAT"](https://youtu.be/OmQpIjC2Vlc)

:::image type="content" source="media/heat-overview-large.png" alt-text="A slide from the video "Introduce HEAT" showing an overview of the stages of HEAT" link="https://youtu.be/OmQpIjC2Vlc":::

## Empower

The start of any successful automation project it to ensure that the key stakeholders understand the automation capabilities of the platform. In this stage, users new to Power Automate can learn about the automation capabilities in Power Automate.

Watch the video: ["Power Automate & Power Platform"](https://youtu.be/OmQpIjC2Vlc?t=410)

:::image type="content" source="media/pp-overview-large.jpg" alt-text="A slide from the video Power Automate & Power Platform showing an infographic about the Microsoft Azure and Power Platform apps and services for developer" link="https://youtu.be/OmQpIjC2Vlc":::

Here are some resources for getting started with RPA in Power Automate.

- [Power Automate product information overview](https://flow.microsoft.com/)
- Learn RPA in a day: [Video overview](https://www.youtube.com/watch?v=7LhJ36ioeyY&amp;list=PLi9EhCY4z99UlSA7ykeZtSLraL8qlhFeq&amp;index=9) | [Download materials](https://aka.ms/rpainadaypackage)
- Automate It video series: [Where to use RPA](https://www.youtube.com/watch?v=QybEIbqZVQg)
- Microsoft Learn: [Step-by-step modules about Power Automate on desktop](https://docs.microsoft.com/learn/browse/?expanded=power-platform&amp;products=power-automate&amp;terms=%22power%20automate%20desktop%22)

## Discover & Plan

In this stage, COE’s/ Business collaborate on what processes to automate based on the ROI, setup the development team & the Power Automate environment.

While automation enables organizations to become more efficient, the decision on which processes to automate is still often a challenge. It is impossible to automate every process, so COEs can use the [Automation Project app](automation-coe-starter-kit.md) to manage the backlog and pick an automation based on ROI. [Process Advisor](https://flow.microsoft.com/process-advisor/) enables organizations to gain deep insight on a variety of tasks.

Power Automate provides environments of different types (production, sandbox, trial) that can be created.  Each environment has a defined set of users who are role-based. Admins can bring their own compute infrastructure to install Power Automate Desktop and the necessary software.

Watch the video: ["Empower, Discover & Plan"](https://youtu.be/94Lq15PNDDg)

:::image type="content" source="media/m365admin-large.png" alt-text="Slide from Empower, Discover, and Plan video showing a screenshot of M365 Admin Center, showing Active Groups area" link="https://youtu.be/94Lq15PNDDg":::

Resources for ROI, process discovery and setting up Power Automate environment:

- Discover which process to automate using [Process Advisor](https://flow.microsoft.com/process-advisor/)
- Use the [Automation Project app](automation-coe-starter-kit.md) for curating and managing ideas
- [Power Automate for desktop](https://docs.microsoft.com/power-automate/desktop-flows/introduction)
- [Power Automate IP address configuration](https://docs.microsoft.com/power-automate/limits-and-config)
- [Service administrator roles (Microsoft 365 Global / Power Platform/ Dynamics 365/ Azure/ Power BI admin)](/power-platform/admin/use-service-admin-role-manage-tenant)
- [Assign Power Automate RPA attended user plan through Microsoft 365 admin center](/power-automate/organization-q-and-a#power-automate-rpa-license)
- [Manage unattended RPA add-on capacity](/power-platform/admin/capacity-add-on) in [Power Platform admin center](https://aka.ms/ppac)

## Design

Building robust automation solutions require well-defined design principles that will build the foundation for scale, security, and compliance!

Watch the video: ["Design Phase"](https://youtu.be/ur1-y0lrexU)

:::image type="content" source="media/rpadesign.png" alt-text="Slide from the Design Phase video, showing Core Design Principles of Intuitive User Experience, Intelligent Process Automation, and Accessible to Everybody" link="https://youtu.be/ur1-y0lrexU":::

Some other design principles (not a comprehensive list) to consider are:

- Design for scale, throughput, and resiliency
- Core fundamentals – logging and credential management and testing
- Error handling and retries strategy
- Using API vs UI for automation

## Build & Test

Building is the heart of the automation lifecycle.

Watch the video: ["Build & Test"](https://youtu.be/qvzBNfnjbpA)

:::image type="content" source="media/pad-implement-large.png" alt-text="Slide from the Build & Test video, showing a desktop flow being built in Power Automate for desktop" link="https://youtu.be/qvzBNfnjbpA":::

Some key concepts covered in this video are:

- [RPA Playbook for SAP GUI Automation](https://flow.microsoft.com/blog/rpa-playbook-for-sap-gui-automation-with-power-automate-api-flows-ui-flows-and-power-automate-desktop)
- [Microsoft Dataverse Auditing](/powerapps/developer/data-platform/auditing-overview)
​- [Microsoft AI Builder](https://flow.microsoft.com/ai-builder/)
- Automate It video series: ["Power Automate for desktop and SAP"](https://www.youtube.com/watch?v=u1-8oKytJAU)
- [Using Sensitive Text in Power Automate Desktop + Azure Key Vault](https://powerusers.microsoft.com/t5/Webinars-and-Video-Gallery/Using-Sensitive-Text-In-Power-Automate-Desktop-Azure-Key-Vault/td-p/790556)
- [Sharing desktop flows](/power-automate/desktop-flows/manage#share-desktop-flows)
- Automate It video series: ["Power Automate Desktop Monitoring Dashboard"](https://youtu.be/zME5ZaKx2bk)
- Central logging
- Human in the loop (Handle Business exceptions from SAP, AI Builder and more)
- Calculate ROI at the item level (each invoice)
- Monitoring/ auditing/ alerting at the item level (each invoice)

In the [Robotic process automation (RPA) with SAP series](/power-automate/guidance/rpa-sap-playbook/introduction), we build an enterprise grade Invoice Processing automation solution. This intelligent automation solution processes invoices in SAP and showcases some of the key enterprise concerns around logging, auditing, tracking each invoice processing, human in the loop, ROI calculation, and more.

:::image type="content" source="media/invoice-processing-large.png" alt-text="Slide from the Robotic process automation (RPA) with SAP video series, showing a flowchart for processing an invoice" link="https://docs.microsoft.com/power-automate/guidance/rpa-sap-playbook/introduction":::

## Deploy, Monitor & Manage

Power Automate provides a rich set of capabilities enabling admins and developers throughout the deployment cycle for a given automation, detailed information on the success/failure of each individual run, and the ability to schedule, queue, and prioritize an automation.

Developers can set up CI/ CD with test integration to deploy automation and prevent against accidental changes that would break the automation in production.

Power Automate also helps users manage their automations. All execution data is available in Dataverse, with out of the box reports and views that visualize this data. Power Automate provides real-time information on individual bots and the machines/clusters these run on. This allows more detailed visibility into the full automation health, bot health, and the infrastructure health.

Watch the video: ["Deploy & Manage"](https://youtu.be/VukO0gHj7YU)

:::image type="content" source="media/livemonitor-large.png" alt-text="Slide from the Deploy & Manage video , showing a screenshot of the "Desktop flow runs" screen" link="https://youtu.be/VukO0gHj7YU":::

Some resources for deploying, monitoring, and managing automations:

- Video: [ALM with RPA in Power Automate](https://youtu.be/eOrYit9rWMo)
- [ALM with Power Platform using Azure DevOps or GitHub](/power-platform/alm/)
- [Run Desktop flows as attended/ unattended](/power-automate/desktop-flows/run-desktop-flow)
- [Monitor desktop flow runs](/power-automate/desktop-flows/monitor-desktop-flow-runs)
- [Prioritize desktop flow using queues](/power-automate/desktop-flows/monitor-desktop-flow-queues)
- Video: [On Premises Data Gateway Monitoring Status](https://www.youtube.com/watch?v=963KPiL2PZk&amp;t=1053s)
- Video: [Automating on Premises Data Gateway Installs](https://www.youtube.com/watch?v=WJ_AJxUSiYU)
- Video: [Clustering your Gateways](https://youtu.be/2SOXPUsJfb0)

## Secure, Govern & Nurture

In this stage, the Automation COE can use the in-built security controls to establish guard rails to scale RPA across their organization. They can leverage Azure Active Directory a key foundation that allows admins to create and manage access controls on users/ resources centrally. Power Automate provides rich governance and security controls to ensure you can run your business-critical processes in a trusted & compliant manner.

The platform provides a rich set of auditing logs that help admins keep track of what happened in the system. The deep integration with Azure, Microsoft 365 allows IT admins to define reactive and proactive policies and procedures to track the users / automation activity.

COEs should establish their strategy to nurture and upskill their employees. They can create a community of champions, train them, run hackathons and evangelize their success stories. Power Automate provides a rich set of [learning resources](https://powerapps.microsoft.com/blog/microsoft-powerapps-learning-resources/) (documentation, videos, tutorials, labs, courses, certifications, whitepapers, etc.). [Microsoft Power Platform Adoption Center](https://adoption.microsoft.com/powerplatform/) provides guidance, workbooks, and tools to accelerate adoption within your enterprise.

Watch the video: ["Secure, Govern & Nurture"](https://youtu.be/5_3s8floInk)

:::image type="content" source="media/coe-large.png" alt-text="A slide from the Secure, Govern, & Nurture video showing an infographic" link="https://youtu.be/5_3s8floInk":::

Some helpful resources for security, governance, and adoption nurturing:

- [Microsoft Power Platform Adoption Center](https://adoption.microsoft.com/powerplatform/)
- [Admin and governance best practices - Microsoft Power Platform](/power-platform/guidance/adoption/admin-best-practices)
- [Governance considerations - Power Platform | Microsoft Docs](/power-platform/admin/governance-considerations)
- [Power Platform Compliance and data privacy](/power-platform/admin/wp-compliance-data-privacy)
- [Microsoft Trust Center](https://www.microsoft.com/trustcenter)
- [Establishing a Data loss prevention (DLP) strategy](/power-platform/guidance/adoption/dlp-strategy)
- [Audit Power Automate flow events through Microsoft 365 Security & Compliance Center](https://flow.microsoft.com/blog/security-and-compliance-center/)
- [Microsoft Power Platform nurture best practices](/power-platform/guidance/adoption/nurture-best-practices)
- [Microsoft Power Platform Center of Excellence (CoE) Starter Kit](/power-platform/guidance/coe/starter-kit)
- [Microsoft Automation Center of Excellence (CoE) Starter Kit](automation-coe-starter-kit.md)
- Video: [Automate It - The CoE Starter Kit & Managing your RPA](https://youtu.be/ed9hRtL38Kg)

## Applying HEAT techniques

 Learn how to apply the HEAT techniques in your Automation COE with the [Administering a Low-Code Intelligent Automation Platform whitepaper](<https://aka.ms/autocoeadminwhitepaper>).

## More resources to start automating

- [Download Power Automate for desktop](https://flow.microsoft.com/desktop/)
- [Power Automate documentation](/power-automate/)
- [Get help with Power Automate for desktop on Forums](https://powerusers.microsoft.com/t5/Power-Automate-Desktop/bd-p/MPADesktop)
- [Watch and subscribe to the Automate It series](https://aka.ms/automateit)
- [Follow us on Twitter: @MSPowerAutomate](https://twitter.com/MSPowerAutomate)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
