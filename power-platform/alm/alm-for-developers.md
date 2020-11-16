---
title: "ALM for developers | Microsoft Docs"
description: "Learn what ALM tools, APIs, and services are available to developers when creating and publishing solutions for Microsoft Dataverse."
keywords: 
author: mikkelsen2000
ms.author: pemikkel
manager: kvivek
ms.custom: ""
ms.date: 05/05/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.topic: "article"
ms.assetid: 
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# ALM for developers

The articles in this section describe how you as a developer can use available APIs, tools, and other resources to implement application lifecycle management (ALM) using Microsoft Power Platform.

We'll start off talking a little about team development and then dive into Azure DevOps and available build tools.

To learn more about key ALM concepts and working with solutions, see [Overview of application lifecycle management](overview-alm.md).

## Team development

When we refer to *team development*, we're talking about multiple developers
collaborating in the same environment versus multiple developers working on the
same application and sharing source code. For team development, it's a good practice to use tooling or processes to achieve developer isolation.

More information: [Scenario 5: Supporting team development](team-development-alm.md)

## Conflict management

For team development, the goal is to avoid conflict when making changes to
shared code. With a source control system, branching and merging help to
avoid change conflicts and keep team members from affecting each other with partially completed
work in a shared repo.

Another method is to use strategies to avoid conflict. For example, you can have only one person
at a time work on a complex component, to avoid a merge conflict that a
source control system might not automatically be able to resolve.

## Working with complex components

What are complex components? Examples include forms,
canvas apps, flows, and workflows.

Coordinate efforts with other team members to avoid having more than one developer
work on the same form or component at a time. If you do have multiple
developers working on the same canvas app, have them work on separate components
to avoid conflict.

### See also

[Microsoft Power Platform Build Tools for Azure DevOps](devops-build-tools.md)  
[Power Apps for developers](https://docs.microsoft.com/powerapps/#pivot=home&panel=developer)
