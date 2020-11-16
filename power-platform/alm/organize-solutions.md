---
title: "Organize your solutions (Microsoft Dataverse) | Microsoft Docs" # Intent and product brand in a unique string of 43-59 chars including spaces
description: "This document lists down some strategies to organize your solutions" # 115-145 characters including spaces. This abstract displays in the search result.
ms.custom: ""
ms.date: 06/29/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.topic: "article"
author: mikkelsen2000
ms.author: pemikkel
manager: kvivek
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Organize your solutions

Before you create solutions, take some time to plan ahead. For example, think about how many solutions you want to release and whether the solutions will share components.  
  
 Also, determine how many Microsoft Dataverse environments you’ll need to develop your line of solutions. You can use a single environment for most strategies described in this topic. However, if you decide to have only one environment and later realize that you need more, it can be challenging to change the solutions if people have already installed them. Using multiple environments, although introducing more complexity, can provide better flexibility.  
  
## Strategies to organize your solutions

 The following are some strategies for creating solutions listed in order from simplest to most complex:  
  
- [Single solution](#single-solution)  
  
- [Multiple solutions](#multiple-solutions)  
  
- [Multiple solutions with shared components](#multiple-solutions-with-shared-components)
  
### Single solution

 By creating a solution, you establish a working set of customizations. This makes it easier to find items that you have customized.  
  
 This approach is recommended when you only want to create a single managed solution. If you think you may have to split up the solution in the future, consider using multiple solutions.  

### Multiple solutions

 If you have two unrelated solutions that don’t share components, the most direct approach is to create two unmanaged solutions.  
  
> [!NOTE]
> It is very common in solutions to modify the application ribbons or the Sitemap. If both of your solutions modify these solution components, they are shared components. See the following section to see how to work with shared components.

### Multiple solutions with shared components

 You may have multiple solutions that share components. You may have a certain set of common functionality within multiple solutions and that common functionality is compatible with any of the other functionality unique to each solution. For example, you may have a set of utility plug-ins that each solution uses yet each of the separate solutions do not share any other components.  
  
 In this case, each solution can be developed in a single environment. Some components can be included in more than one solution as long as any changes that were made to them are compatible with all other solutions that use them. It is important that all the solutions share the same solution publisher. If the solution publisher is not identical, you will not be able to install more than one of your solutions.
  
### See also  

[Use segmented solutions](/power-platform/alm/segmented-solutions-alm)
[Scenario 5: Supporting team development](team-development-alm.md)
