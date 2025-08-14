---
title: "Use a solution to customize in Power Platform"
description: "Using a custom solution in Power Platform is highly recommended. Discover why a custom solution is better than using a default solution to manage your apps, flows, and customizations."
ms.custom: ""
ms.date: 02/06/2025
ms.reviewer: ""
ms.topic: concept-article
author: "Mattp123"
ms.subservice: alm
ms.author: "matp"
search.audienceType: 
  - maker
---
# Use a solution to customize

We recommend that you create a solution to manage your customizations. By using a custom solution, you can easily find just the solution components you customize, consistently applying your solution publisher prefix, and exporting your solution with the right prefix for distribution to other environments.  

If you don't use a custom solution, you're working in one of these default solutions in the unmanaged layer:

- **Common Data Service Default Solution**. This solution is available for all makers to use by default for their customizations in an environment. The Common Data Service Default Solution is useful when you want to evaluate or learn Power Platform. However, if you're planning on deploying your apps or flows to other environments, we recommend that makers work in their own unmanaged solutions. Additionally, you can set your preferred solution so that, by default, all your solution components are included in the preferred solution that you specify that's used when you create or add solution components outside a solution context.
- **Default Solution**. This is a special solution that contains all components in the system. The default solution is useful for discovering all the components and configurations in your system.  

More information:

- [Common Data Service Default Solution](#common-data-service-default-solution)
- [Set the preferred solution](/power-apps/maker/data-platform/preferred-solution)

## Why you shouldn't use the default solutions to manage customizations

There are a few reasons why you shouldn't create apps/flows and make customizations in either of the default solutions:

- When you use either default solution to create components, you'll also use the default publisher assigned to the solution. This often results in the wrong publisher prefix being applied to some components. More information: [Solution publisher](solution-concepts-alm.md#solution-publisher)
- The default solution can't be exported; therefore, you can't distribute the default solution to another environment.
- If you aren't consistently using the same solution while you're configuring the environment, you might accidentally leave components behind that are necessary to deploy your application to another environment.

## Common Data Service Default Solution

The default solution in the Power Platform is the Common Data Service Default Solution, which is associated with the Microsoft Dataverse Default Publisher. The default
publisher prefix is randomly assigned for this publisher, for example it might be `cr8a3`. This means that the name of every new item of metadata created in the default solution has this prepended to the names used to uniquely identify the items. If you create a new table named *Animal*, the unique name used by Dataverse is `cr8a3_animal`. The same is true for any new columns (attributes), relationships, or choice columns. If you're customizing using this special solution, consider changing the publisher prefix.

### See also

[Managed properties](managed-properties-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
