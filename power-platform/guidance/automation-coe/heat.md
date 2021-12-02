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

Read this page for a brief description of HEAT. For more complete details, [read the blog post](<https://aka.ms/rpapnp>) and [watch the video series](<https://aka.ms/rpapnpvideo>). Learn how to apply the HEAT techniques in your Automation COE with the [Administering a Low-Code Intelligent Automation Platform whitepaper](<https://aka.ms/autocoeadminwhitepaper>).

## Empower

The start of any successful automation project is to ensure that the key stakeholders understand the automation capabilities of the platform. In this stage, users new to Power Automate can learn about the automation capabilities in Power Automate.

## Discover & Plan

In this stage, the CoE and business collaborate on what processes to automate based on the intended ROI, organize the development team, and set up the Power Automate environment.

While automation enables organizations to become more efficient, the decision about which processes to automate is often a challenge. It’s impossible to automate every process, so COEs can use the Automation Project app in the Automation COE Starter Kit (preview) to manage the backlog and pick an automation project based on ROI.

[Process Advisor](https://docs.microsoft.com/power-automate/process-advisor-overview) enables organizations to gain deep insight on a variety of tasks.

Power Automate provides environments of different types (production, sandbox, trial) that can be created.  Each environment has a defined set of users with role-based permissions. Admins can bring their own compute infrastructure to install Power Automate for desktop and the necessary software.

## Design

Building robust automation solutions requires well-defined design principles that will build the foundation for scale, security, and compliance!

## Build & Test

This is the heart of the automation lifecycle where a developer builds the automation.

In the [Robotic process automation (RPA) with SAP series](https://docs.microsoft.com/power-automate/guidance/rpa-sap-playbook/introduction), we build an enterprise grade Invoice Processing automation solution. This intelligent automation solution processes invoices in SAP and showcases some of the key enterprise concerns around logging, auditing, tracking each invoice processing, human in the loop, ROI calculation, and more.

## Deploy, Monitor, & Manage

Power Automate provides a rich set of capabilities for admins and developers throughout the deployment cycle.
Developers can set up CI/CD with test integration to deploy automation and prevent against accidental changes that would break the automation in production.

Power Automate also helps users manage their automations, including detailed information about the success or failure of each individual run, as well as the ability to schedule, queue, and prioritize an automation.

All execution data is available in Dataverse, with included reports and views that visualize this data. Power Automate provides real-time information on individual bots and the machines/clusters these run on. This allows more detailed visibility into the full automation health, bot health, and infrastructure health.

## Secure & Govern

In this stage, the Automation COE can leverage the built-in security controls in Power Automate and Azure to establish guard rails to scale RPA across their organization. They can leverage Azure Active Directory, a key foundation that allows admins to create and manage access controls on users and resources centrally. Power Automate provides rich governance and security controls to ensure you can run your business-critical processes in a trusted and compliant manner.

The platform provides a rich set of audit logs that help admins keep track of what happened in the system. The deep integration of Power Platform with Azure and Microsoft 365 allows IT admins to define reactive and proactive policies and procedures to track automation activity.

## Nurture

An Automation CoE can create a community of champions, train them, run events, and evangelize success stories. Power Automate provides a rich set of [learning resources](https://powerapps.microsoft.com/blog/microsoft-powerapps-learning-resources/) (documentation, videos, tutorials, labs, courses, certifications, whitepapers, etc.).

## Additional resources

- [HEAT blog post](<https://aka.ms/rpapnp>)
- [HEAT video series](<https://aka.ms/rpapnpvideo>)
- [*Administering a Low-Code Intelligent Automation Platform* whitepaper](<https://aka.ms/autocoeadminwhitepaper>) (applies HEAT techniques) 
- [TC Energy Bot Wars](<https://aka.ms/Bot-Wars>)
- [Inter Pipeline Botwars](<https://youtu.be/bzN3CkOt_go?t=1773>)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
