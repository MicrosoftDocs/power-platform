---
title: "CoE Starter Kit explained | MicrosoftDocs"
description: 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/18/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# CoE Starter Kit explained

The CoE Starter Kit is a collection of components and tools that are designed to
help get started with developing a strategy for adopting and supporting the
Power Platform, with a focus on Power Apps and Power Automate. It contains
solutions that **help** manage resources and information about those resources.

The kit **does not represent the entire Center of Excellence**, because
**managing a CoE requires more** than the tools alone; the Center of Excellence
also requires people, communication, defined requirements and processes. The
tools provided here are just a means to get to the end goal, but the Center of
Excellence itself must be thoughtfully designed by each organization based on
their needs and preferences.

Download the most updated assets from the GitHub repository
[aka.ms/coestarterkitrepo](https://aka.ms/coestarterkitrepo).

The kit provides some automation and tooling to help teams build monitoring and
automation necessary to support a CoE. The foundation of the kit is a Common
Data Service (CDS) data model and workflows to collect resource information
across the environments in the tenant. The kit includes multiple Power Apps and
Power BI analytics to view and interact with the data collected, as well as
flows to collect data across environments, and help with workflows for your
Compliance needs. The kit also provides several assets that provide templates
and suggested patterns and practices for implementing CoE efforts.

The CoE Starter Kit is shipped in multiple modules:

1. **Center of Excellence – Core Components**  
    These components provide the core to get started with setting up a CoE –
    they sync all your resources into entities and build admin apps on top of
    that to help you get more visibility of what apps, flows and makers are in
    your environment. Additionally, apps like the DLP Editor and Set New App
    Owner help with daily admin tasks.  
    The Core Components solution only contains assets relevant to admins.

1. **Center of Excellence – Governance Components**  
    Once you are familiar with your environments and resources, you might start
    thinking about audit and compliance processes for your apps. You might want
    to gather additional information about your apps from your makers, you might
    want to audit specific connectors or app usage - the apps and flows part of
    this solution help you get started.  
    The Audit and Report Components solution contains assets relevant to admins
    and makers.

1. **Center of Excellence – Nurture Components**  
    An essential part of establishing a CoE is nurturing your makers and an
    internal community. You will want to share best practices and templates and
    onboard new makers – the assets part of this solution can help develop a
    strategy for this motion.  
    The Nurture Components solution contains assets relevant to everyone in the
    organization, admins, makers as well as end users of apps and flows.

We recommend getting started and familiar with the **Center of Excellence – Core
Components** before adding the Audit&Report and Nurture components.
