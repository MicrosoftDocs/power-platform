---
title: "Organize your solutions (Microsoft Dataverse) | Microsoft Docs" # Intent and product brand in a unique string of 43-59 chars including spaces
description: "This document lists down some strategies to organize your solutions" # 115-145 characters including spaces. This abstract displays in the search result.
ms.custom: ""
ms.date: 07/09/2021
ms.reviewer: "pehecke"
ms.service: power-platform
ms.topic: "article"
author: mikkelsen2000
ms.subservice: alm
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
  
The following sections describe different strategies for managing solutions listed in order from simple to more complex.  
  
## Single solution

 By creating a solution, you establish a working set of customizations. This makes it easier to find items that you have customized.  
  
 This approach is recommended when you only want to create a single managed solution. If you think you may have to split up the solution in the future, consider using multiple solutions.  

## Multiple solutions

 If you have two unrelated solutions that don’t share components, the most direct approach is to create two unmanaged solutions.  
  
> [!NOTE]
> It is very common in solutions to modify the application ribbons or the site map. If both of your solutions modify these solution components, they are shared components. See the following section to see how to work with shared components.

## Multiple solutions with shared components

 You may have multiple solutions that share components. You may have a certain set of common functionality within multiple solutions and that common functionality is compatible with any of the other functionality unique to each solution. For example, you may have a set of utility plug-ins that each solution uses yet each of the separate solutions do not share any other components.  
  
 In this case, each solution can be developed in a single environment. Some components can be included in more than one solution as long as any changes that were made to them are compatible with all other solutions that use them. It is important that all the solutions share the same solution publisher. If the solution publisher is not identical, you will not be able to install more than one of your solutions.
 
## Multiple solution layering and dependencies

When you import different solutions into your target environment you are often creating layers where the existing solution lies underneath the one being imported. When it comes to solution layering, it is important that you don’t have cross-solution dependencies. Having multiple solutions in the same environment using the same unmanaged component should be avoided. This is especially true with tables.

Segment your solutions by component type when there are no cross-dependency risks.  For example, have one solution that includes all of your tables, another solution that has all of your plug-ins, and a third  solution that has all of your flows. These different components don’t have risks of cross-solution dependencies. Therefore, it is safe to have multiple solutions formed this way in the same environment.

Don’t have two different solutions in an environment where both contain tables. This is because there are frequently risks of a single relationship between tables, which creates a cross-solution dependency and causes solution upgrade or delete issues in the target environment at a later point in time.

When you are designing your solution layers and you want to have a structured approach for apps you should start with a base layer. Later, you import additional solutions that will reside on top of the base layer. Subsequently, you have a base layer and extension layers on top that extend that base layer.

When you manage your projects this way, we recommend that you use a separate environment for each layer. Build your solution layering using these steps.

1. Before you create the solutions in the following steps, use a single publisher for all your solutions across your environments. More information: [Solution publisher](solution-concepts-alm.md#solution-publisher)
1. In the "base" environment you have your base solution with the unmanaged tables from that environment and no other tables.  You then export this solution as managed. 
1. You set up a second environment for the extension or "app" layer that will later reside on top of the base layer.  
1. You import the managed base layer into the app layer environment and create an unmanaged solution for the app layer.  

   :::image type="content" source="media/proper-solution-layering.png" alt-text="Proper solution layering using multiple solutions with multiple environments":::

You can now extend the data model by adding additional tables, columns, table relationships, and so on into the app solution. Then, export the app solution as managed. Notice that the app solution will have dependencies on the base layer solution.

In your production environment, you import the managed base layer and then import the managed app layer. This creates two managed layers in the environment with clear dependencies between the two managed solutions.  Managing multiple solutions this way won’t create cross-solution dependencies, which can cause solution maintenance issues, such as removing the top layer if needed.  

Repeat this segmentation pattern to have as many different solutions as you need to maintain. Although, we recommend that you keep the number of solutions as small as possible to keep your solution layering manageable.

### See also  

[Use segmented solutions](./segmented-solutions-alm.md) <br />
[Scenario 5: Supporting team development](team-development-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]