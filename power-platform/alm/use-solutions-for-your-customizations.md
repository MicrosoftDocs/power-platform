---
title: "Default solution vs. custom solution"
description: "Using a custom solution in Power Apps is highly recommended. Discover why a custom solution is better than using a default solution to manage your apps and customizations."
ms.custom: ""
ms.date: 11/11/2021
ms.reviewer: ""
ms.service: power-platform
ms.topic: "article"
author: "Mattp123"
ms.subservice: alm
ms.author: "matp"
manager: "kvivek"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---

# Use a solution to customize

We recommend that you create a solution to manage your customizations. By using a custom solution, you can easily find just the solution components you've customized, consistently apply your solution publisher prefix, and export your solution for distribution to other environments.  

If you don't use a custom solution, you'll be working in one of these default solutions in the unmanaged layer:  
- **Common Data Service Default Solution**. This solution is available for makers to use by default for their customizations in an environment. The Common Data Service Default Solution is useful when you want to evaluate or learn Power Apps. However, if you are planning on deploying your apps to other environments, we recommend that app makers work in their own unmanaged solutions. More information: [Common Data Service Default Solution](#common-data-service-default-solution) 
- **Default Solution**. This is a special solution that contains all components in the system. The default solution is useful for discovering all the components and configurations in your system.  

## Why you shouldn't use the default solutions to manage customizations

There are a few reasons why you shouldn't create apps and make customizations in either of the default solutions:  
- When you use either default solution to create components, you'll also use the default publisher assigned to the solution. This often results in the wrong publisher prefix being applied to some components. More information: [Solution publisher](solution-concepts-alm.md#solution-publisher)
- The default solution can't be exported; therefore, you can't distribute the default solution to another environment.
- If you aren't consistently using the same solution while you're configuring the environment, you may accidentally leave components behind that are necessary to deploy your application to another environment.

## Common Data Service Default Solution

The default solution in Power Apps is the Common Data Service Default Solution,
which is associated with the Microsoft Dataverse Default Publisher. The default
publisher prefix will be randomly assigned for this publisher, for example it
might be *cr8a3*. This means that the name of every new item of metadata created
in the default solution will have this prepended to the names used to uniquely
identify the items. If you create a new entity named Animal, the unique name
used by Dataverse will be cr8a3_animal. The same is true for any new
fields (attributes), relationships, or option-set options. If you'll be
customizing this special solution, consider changing the publisher prefix.

### See also

[Managed properties](managed-properties-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
