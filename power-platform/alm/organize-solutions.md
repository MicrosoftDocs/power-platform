---
title: "Organize your solutions in Power Platform"
description: "This document lists down some strategies to organize your solutions in Power Platform."
author: marcelbf
ms.author: sabrinadi
ms.date: 10/30/2025
ms.reviewer: pehecke
ms.topic: how-to
ms.subservice: alm
search.audienceType: 
  - developer
---
# Organize your solutions

Before you create solutions, take some time to plan ahead your Environment Strategy and your Solution Strategy. Consider the following aspects:

**Application Scope:**

- Does your implementation span multiple applications such as Sales, Customer Service, Field Service, Finance, etc.?
  
**Release Cadence:** 

- How frequently do you plan to deploy updates to production?
- Is your delivery methodology based on agile practices like sprint cycles?

**Production Support:**

- How do you handle urgent fixes in production without introducing new features prematurely?

**Solution Architecture:** 

- How many solutions do you manage? Do these solutions share components or depend on each other?

**Environment Planning:** 

- How many Microsoft Dataverse environments do you require to support your development lifecycle?
- Do you need separate environments for development, testing, and production?
- Do developers work collaboratively in a shared environment, or do they require isolated environments to work independently? 
  



The following section outlines three strategies, arranged from the simplest to the most complex, and highlights their respective advantages and disadvantages.

## Single Solution Strategy 

**Overview:**

All customizations are grouped into one unmanaged solution during development, which is later exported as a single managed solution for deployment.

**Recommended for:**

- Small-medium scale implementations
- Scenarios where future modularization is unlikely

**Pros:**

- Simplified environment setup and management
- Simplified deployment. With only one solution to manage, exporting and importing across environments is straightforward and less error-prone.
- Easier to locate, audit, and manage changes

**Cons:**

- Requires more effort to scale or modularize later if required
- A single solution containing a large number of customizations may result in longer deployment times. To reduce the solution size, [use table segmentation](./segmented-solutions-alm.md). To reduce import times see [performance recommendations](./performance-recommendations.md).
- When multiple developers work in the same development environment, they risk overwriting each other’s changes. This risk can be reduced by implementing source code versioning, adopting a branching strategy, and using a dedicated development environment for each branch. Source code versioning and branching strategy provide change tracking, collaboration support, and conflict resolution mechanisms. See [Adopt a Git branching strategy](/azure/devops/repos/git/git-branching-guidance?view=azure-devops).

> [!NOTE]
> Recent improvements in Microsoft Power Platform have significantly reduced import times for managed solutions, including those using the Upgrade option. These optimizations include better handling of component dependencies and reduced overhead for unchanged components. To learn how to take full advantage of these improvements, see [performance recommendations](./performance-recommendations.md).

## Multiple Solutions in the Same Development Environment

**Overview:**

Multiple unmanaged solutions are maintained within a single development environment, each typically dedicated to unrelated features or modules.

**Recommended for:**

- Small-medium scale implementations with distinct and independent functional areas that don’t share components.

**Pros:**

- Simplified environment setup and management
- Functional areas can be deployed independently from each other

**Cons:**

- Maintaining multiple unmanaged solutions within the same development environment increases the likelihood of dependency conflicts. For example, you may encounter a situation where Solution A cannot be imported because it depends on Solution B, while Solution B cannot be imported because it depends on Solution A.
- Multiple developers working on the same development environment may overwrite each other’s changes. Working in an unmanaged solution does not provide isolation. Every modification is applied directly to the environment, regardless of which solution is being edited.

> [!NOTE]
> When you have multiple solutions in the same development environment, after importing the managed solutions into your target environment, you're often creating layers. More information: [Solution layers and merge behavior](./solution-layers-alm.md)
>
> It's important that you:
> 1. don’t include the same unmanaged component in more than one solution.
> 2. have only one solution that includes all your tables. Don't have two different solutions where both contain tables. This is because there are frequently risks of a single relationship between tables, which creates a cross-solution dependency and causes solution upgrade or delete issues in the target environment at a later point in time.
> 3. use only 1 publisher. The publisher owns the components of a managed solution and its association cannot be changed later. For example, if a custom table is imported managed through solution A with publisher X, you cannot later move that table to solution B with publisher Y. The only option is to delete the table, upgrade solution A to remove the table from the target system, then recreate the table in solution B with publisher Y and import solution B. This process results in loss of all data stored in the custom table unless it is migrated beforehand.
> 4. avoid creating dependencies between solutions. Dependencies enforce an import order and can cause issues. For example, if you have one solution for tables and another for cloud flows, and a flow relies on a custom column, it works in development because the column exists. However, if only the cloud flow solution is imported into the target environment, the process may not recognize the dependency on the custom column. As a result, the flow solution installs successfully, but the flow itself does not work.
>
>     Examples of dependecies:
>
>     **1. Application ribbons** – When multiple solutions modify the application ribbon or the site map of the same app.
>    
>     **2. Plugins or Cloud flows** – If they trigger on a custom column or update a custom table, they depend on those custom tables.
>    
>     **3. Security Roles** – When custom tables exist, security roles typically depend on those tables.
>    



## Multiple Solutions with Dedicated Development Environments

**Overview:**

This strategy involves developing each unmanaged solution in its own isolated Microsoft Dataverse development environment. It is commonly used in modular architectures where, for example, different applications—such as Sales, Customer Service, or Field Service—are built and maintained independently. A base solution containing common components (for example, account and contact tables) is created and deployed as a managed solution into each app-specific development environment. Each app then has its own unmanaged solution, layered on top of the base managed solution, allowing teams to extend functionality without altering the base foundation.

> [!NOTE]
> Build your solution layering using these steps.
> 1. Before you create the solutions in the following steps, use the same publisher for all your solutions across your environments. More information: [Solution publisher](solution-concepts-alm.md#solution-publisher)
> 1. In the "base" development environment, you have your base solution with the common unmanaged tables and no other tables. Then export this solution as managed.
> 1. You set up a second development environment for the extension or "app" layer that will later reside on top of the base layer.  
> 1. You import the managed base layer into the app layer development environment and create an unmanaged solution for the app layer.
:::image type="content" source="media/proper-solution-layering.png" alt-text="Proper solution layering using multiple solutions with multiple environments.":::
> 1. You can now extend the data model by adding additional tables, columns, table relationships, plugins, flows and so on, to the specific "app" solution. Then, export the app solution as managed. Notice that the app solution still depends on the base layer solution, but managing multiple solutions this way is a better approach. Consider the example mentioned before of the flow that relies on a custom column. In most cases, both the custom column and the flow reside in the same app solution. But even if the custom column is part of the base solution, you must complete and deploy that base solution as managed first, otherwise, the flow inside the app solution cannot even be created. 
> 1. In your production environment, you import the managed base layer and then import the managed app layer. This creates two managed layers in the environment with clear dependencies between the managed solutions. 
> 1. Repeat this pattern to have as many different solutions as you need to maintain. Although we recommend that you keep the number of solutions as small as possible to keep your solution layering manageable.


**Recommended for:**

- Large-scale enterprise projects
- Teams with multiple developers or partners
- Scenarios requiring strict governance and CI/CD pipelines

**Pros:**

- Easier to grow and evolve your system by adding or updating modules without affecting others.
- Multiple teams can work in parallel on different modules without stepping on each other’s changes
- Easier to implement automated testing and DevOps practices
- Smaller solutions are faster to deploy, especially in CI/CD pipelines if you have to deploy only a specific app.
- Bugs or regressions are easier to trace when changes are isolated to specific modules.

**Cons:**

- Higher infrastructure and maintenance overhead
- Requires robust environment strategy and governance
- More complex deployment

### See also

[Use table segmentation](./segmented-solutions-alm.md) <br />
[Scenario 5: Supporting team development](team-development-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
