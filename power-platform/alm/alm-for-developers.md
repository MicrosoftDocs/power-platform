---
title: "ALM for developers | Microsoft Docs"
description: "Learn what ALM tools, APIs, and services are available to developers when creating and publishing solutions for Common Data Service."
keywords: 
author: phecke
ms.author: pehecke
manager: kvivek
ms.custom: ""
ms.date: 04/08/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
  - "powerapps"
ms.assetid: 
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# ALM for developers

The articles in this section describe how you as a developer can use<!--Writing Style Guide.--> available APIs, tools, and other resources to implement application lifecycle management (ALM) using Power Apps and Common Data Service.

We'll start off talking a little about team development and then dive into Azure DevOps and available build tools.

To learn more about key ALM concepts and working with solutions, see [Overview of application lifecycle management with Power Apps](overview-alm.md).

## Team development

When we refer to *team development*, we're talking about multiple developers
collaborating in the same environment versus multiple developers working on the
same application and sharing source code. For team development, it's a good practice to use tooling or processes to achieve developer isolation.<!--Suggested. -->

More information: [Scenario 5: Supporting team development](team-development-alm.md)

### Conflict management

For team development, the goal is to avoid conflict when making changes to
shared code. With a source control system, branching and merging help to
avoid change conflicts and keep team members from affecting each other with partially completed
work in a shared repo.<!--Suggested, to cut down on the number of gerunds.-->

Another method is to use strategies to avoid conflict. For example, you can have only one person
at a time work on a complex component, to avoid a merge conflict that a
source control system might not automatically be able to resolve.

### Working with complex components

What are complex components? Examples include forms,
canvas apps, flows, and workflows.

Coordinate efforts with other team members to avoid having more than one developer
work on the same form or component at a time. If you do have multiple
developers working on the same canvas app, have them work on separate components
to avoid conflict.

### See also

[Power Apps build tools for Azure DevOps](devops-build-tools.md)

<!--note from editor: I notice that the articles that follow this one in the TOC all have "See also" headings followed by "Next topic," followed by a single link to the next topic in TOC order. I think the combination of "See also" and "Next topic" doesn't work, and actually for these topics, I think it would be good to provide the full list of related articles. So for these articles, I've added a block of links to these topics (minus the current one), for you to use if you'd like.-->

<!--
### See also

[Use Power Apps build tools with Azure DevOps](devops-build-tools.md)  
[Power Apps component framework](component-framework.md)  
[Plug-ins](plugin-component.md)  
[Web resources](web-resource-component.md)  
[Configuration Migration and Package Deployer tools](configure-and-deploy-tools.md)  
[Solution Packager tool](solution-packager-tool.md)  
[Online Management API (REST) to manage environments](online-management-api.md)  
[Work with solutions using the APIs](solution-api.md)  
-->