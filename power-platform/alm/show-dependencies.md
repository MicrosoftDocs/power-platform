---
title: "View dependencies (Microsoft Dataverse) | Microsoft Docs" # Intent and product brand in a unique string of 43-59 chars including spaces
description: "Dependencies sometimes can block operations. This article describes how to view dependencies and take action on dependencies." # 115-145 characters including spaces. This abstract displays in the search result.
ms.custom: ""
ms.date: 03/18/2024
ms.reviewer: ""

ms.topic: "article"
author: "swatimadhukargit" # GitHub ID
ms.subservice: alm
ms.author: "swatim" # MSFT alias of Microsoft employees only
search.audienceType: 
  - developer
---

# Show component dependencies

Solution components often depend on other solution components. You can’t delete any solution component that has dependencies from another solution component. Dependencies are records created automatically by the solutions framework to prevent required components from being deleted while one or more dependent components still include references to them. An example of a dependency is as follows: given a field is required for a form to function, if you ever try to execute an action that will result in the deletion of that field, the form will stop working. The solution dependencies page for the component will help identify the dependencies and take appropriate actions.

In this article, we'll discuss what actions you can take while viewing the dependencies in the Show dependencies menu under Advanced.

## Delete block by/Used by/Uses

The Dependencies page has details about all the components taking dependency on the solution component. They are grouped by managed solution. There is one group which keeps track of all the dependencies the component has on unmanaged component.

The Dependencies page has 3 tabs covering Delete blocked by, Used by and Uses.

**Delete blocked by** - The **Delete blocked by** tab represents list of all the dependencies which blocks the delete of the solution component. Unless these dependencies are removed/deleted, the solution component delete will remain blocked.

**Used by** - The **Used by** tab represents list of all the dependencies which the solution component is used by.

**Uses** - The **Uses** tab represents list of all the dependencies which the given solution component uses.

## Show Dependencies Actions

The show dependencies page has multiple actions that can be taken in the page to get rid of dependencies not required.

  ![Solution dependencies action.](media/solution-component-dependencies.png "Solution dependencies action")

You can right click any component under any grouped solution to use one of the following actions

**Open** - This action will take you to the particular component in the Default solution. This will help you navigate to the component from the Solution dependencies page and edit it if needed.

**Delete** - This action will allow you to delete the component. Please ensure to use this action only if the component is no more required and must be deleted. This action is available only for the unmanaged component.

**Remove dependency** - This action will allow you to remove the dependency of the component on the solution component for which Show dependencies page is rendered. This is automatically removing dependency of the component, which is similar to the edit component which is done manually and is discussed in details in the [Removing dependencies](./removing-dependencies.md) page. This feature is available for certain component type today and we are working on onboarding more components soon.

**Open documentation** - This action will allow you to open documentations related to different kind of dependencies based on the dependency type. The documentation is available today for few component type dependencies and we are working on expanding it.

**Delete Solution** - If you need to delete the solution whose components have taken dependencies on the solution component rendering the show dependencies page, you can utilize the Delete button provided for the solution in the Show dependencies page.

### See also

 [Remove dependencies](./removing-dependencies.md)
 [Solution concepts](./solution-concepts-alm.md)  
 [Solution layers](./solution-layers-alm.md)  
 [Dependency tracking for solution components](dependency-tracking-solution-components.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
