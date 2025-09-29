---
title: "Organize your solutions in Power Platform"
description: "This document lists down some strategies to organize your solutions in Power Platform."
author: marcelbf
ms.author: marcelbf, sabrinadi
ms.date: 02/04/2025
ms.reviewer: pehecke
ms.topic: how-to
ms.subservice: alm
search.audienceType: 
  - developer
---
# Organize your solutions

Before you create solutions, take some time to plan ahead your Environment Strategy and your Solution Strategy. Consider the following aspects:

**Application Scope:**

- Will your implementation span multiple applications such as Sales, Customer Service, Field Service, Finance, etc.?

**Release Cadence:** 

- How frequently do you plan to deploy updates to production?
- Is your delivery methodology based on agile practices like sprint cycles?

**Production Support:**

- How will you handle urgent fixes in production without introducing new features prematurely?

**Solution Architecture:** 

- How many solutions will you be managing? Will these solutions share components or dependencies?

**Environment Planning:** 

- How many Microsoft Dataverse environments will be required to support your development lifecycle?
- Will you need separate environments for development, testing, and production?
- Will developers work collaboratively in a shared environment, or will they require isolated environments to work independently?

If you decide to have only one development environment and later realize that you need more, it can be challenging to change the solutions if people have already installed them. When you have multiple environments, although introducing more complexity, can provide better flexibility.  
  
The following sections describe different strategies for managing solutions listed in order from simple to more complex, along with their advantages and disadvantages.


## Single Solution Strategy

**Overview:**

All customizations are grouped into one unmanaged solution during development, which is later exported as a single managed solution for deployment.

**Recommended for:**

- Small-scale implementations
- Projects with limited scope and relative few customizations
- Scenarios where future modularization is unlikely

**Pros:**

- Simplified management and deployment
- Easier to locate and track customizations
- Lower overhead in environment setup

**Cons:**

- Difficult to scale or modularize later
- Risk of component conflicts if reused across other projects
- Limited flexibility for parallel development or team collaboration


## Multiple Solutions in the Same Development Environment

**Overview:**

Separate unmanaged solutions are created within a single development environment, typically for unrelated features or modules.

**Recommended for:**

- Projects with distinct functional areas that don’t share components
- Teams working on independent features

**Pros:**

- Simple environment strategy and maintance
- Simple deployment and integration planning 

**Cons:**

- Shared environment may lead to dependency issues
- Potential for overlapping changes if coordination is lacking
- Harder to isolate bugs or regressions

> [!NOTE]
> When you import different solutions into your target environment, you're often creating layers where the existing solution lies underneath the one being imported. When it comes to solution layering, it's important that you don't have cross-solution dependencies.
>
> Having multiple solutions in the same development environment containing the same unmanaged component should be avoided. This cross-solution dependency issue is especially true with tables.
>
> Don't have two different solutions in an environment where both contain tables. This is because there are frequently risks of a single relationship between tables, which creates a cross-solution dependency and causes solution upgrade or delete issues in the target environment at a later point in time
> 
> Examples of dependecies:
>
> **1. Application ribbons** It's very common in solutions to modify the application ribbons or the site map. If both of your solutions modify these solution components, they're shared components. 
>
> **2. Plugins or Cloud flows that triggers on a custom column or updates a custom table** In this case the plugins or the cloud flows have dependencies on the custom tables.
>
> **3. Security Roles** If you have custom tables, security roles have most probably dependencies on the custom tables.
>    
> See the following section to see how to work with shared components.

## Multiple Solutions with Dedicated Development Environments

**Overview:**

This strategy involves developing each solution in its own isolated Microsoft Dataverse development environment. It is commonly used in modular architectures where, for example, different applications—such as Sales, Customer Service, or Field Service—are built and maintained independently. A base solution containing common components (e.g., account and contact tables) is created and deployed as a managed solution into each app-specific development environment. Each app then has its own unmanaged solution, layered on top of the base managed solution, allowing teams to extend functionality without altering the base foundation.

> [!NOTE]
> Build your solution layering using these steps.
> 1. Before you create the solutions in the following steps, use a single publisher for all your solutions across your environments. More > information: [Solution publisher](solution-concepts-alm.md#solution-publisher)
> 1. In the "base" environment, you have your base solution with the unmanaged tables from that environment and no other tables. You then > export this solution as managed.
> 1. You set up a second environment for the extension or "app" layer that will later reside on top of the base layer.  
> 1. You import the managed base layer into the app layer environment and create an unmanaged solution for the app layer.
:::image type="content" source="media/proper-solution-layering.png" alt-text="Proper solution layering using multiple solutions with > multiple environments.":::
> You can now extend the data model by adding additional tables, columns, table relationships, and so on, into the specific "app" solution. Then, export the app solution as managed. Notice that the app solution will have dependencies on the base layer solution.
> In your production environment, you import the managed base layer and then import the managed app layer. This creates two managed layers in the environment with clear dependencies between the two managed solutions. Managing multiple solutions this way doesn't create cross-solution dependencies, which can cause solution maintenance issues, such as removing the top layer if needed.  
> Repeat this pattern to have as many different solutions as you need to maintain. Although we recommend that you keep the number of solutions as small as possible to keep your solution layering manageable.


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
- More complex deployment and integration planning 

### See also

[Use table segmentation](./segmented-solutions-alm.md) <br />
[Scenario 5: Supporting team development](team-development-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
