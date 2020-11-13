---
title: "Use a solution to customize Power Apps | MicrosoftDocs"
description: "Learn how to customize Power Apps"
ms.custom: ""
ms.date: 05/05/2020
ms.reviewer: ""
ms.service: powerapps
ms.topic: "article"
author: "Mattp123"
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
- **Common Data Service Default Solution**. This solution is available for makers to use by default for their customizations in an environment. The Common Data Service Default Solution is useful when you want to evaluate or learn Power Apps. However, we recommend that app makers work in their own unmanaged solutions. More information: [Common Data Service Default Solution](#common-data-service-default-solution) 
- **Default Solution**. This is a special solution that contains all components in the system. The default solution is useful for discovering all the components and configurations in your system.  

## Why you shouldn't use the default solutions to manage customizations
There are a few reasons why you shouldn't create apps and make customizations in either of the default solutions:  
- The default solution contains all components and customizations from all solutions in the environment. 
- By default, all enabled users can create apps and customize components in the Common Data Services Default Solution. 
- It's difficult to locate or identify the customizations you've made in the environment by using either default solution. 
- When you use either default solution to create components, you'll also use the default publisher assigned to the solution. This often results in the wrong publisher prefix being applied to some components. 
- The default solution can't be exported; therefore, you can't distribute the default solution to another environment. 

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

<!-- Notice that if you have installed or imported other applications or solutions, additional solutions may be available in the solutions list. 

By default,  when you build or customize a model-driven app, you work with the solution called Common Data Services Default Solution. You can open the Common Data Services Default Solution to view and edit the components that are contained in it. To do this, follow these steps.
 
1.  On the left navigation pane select **Solutions**.

2.  In the list of solutions, select **Common Data Services Default Solution**.
  
> [!TIP]
>  If you plan to distribute the applications your make, consider changing the publisher customization prefix. More information: [Solution publisher prefix](change-solution-publisher-prefix.md).  
  
<a name="BKMK_PrivacyNotice"></a>   

## Privacy notices  
 [!INCLUDE[cc_privacy_crm_gcc_solution_import](../../includes/cc-privacy-crm-gcc-solution-import.md)]  
  
 [!INCLUDE[cc_privacy_crm_customizations](../../includes/cc-privacy-crm-customizations.md)]  -->
  
### See also  
[Managed properties](managed-properties-alm.md)


