---
title: "Show dependencies (Microsoft Dataverse) | Microsoft Docs" # Intent and product brand in a unique string of 43-59 chars including spaces
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

# Show dependencies for component

The show dependencies page for a component helps identify the dependencies and take appropriate actions.

In this article, we discuss what actions you can take while viewing the dependencies in the Show dependencies menu under Advanced.

## Delete block by/Used by/Uses

The Dependencies page has details about all the components taking dependency on the solution component. They're grouped by solution's name.

The Dependencies page has tabs covering reports for Delete blocked by, Used by and Uses.

**Delete blocked by**: The report lists all the dependencies that block the delete of the solution component. Unless these dependencies are removed/deleted, the solution component delete remains blocked.

**Used by**: The report lists all the dependencies of other components that are using this solution component.

**Uses**: This report lists all the dependencies that the given solution component uses.

## Show Dependencies Actions

The show dependencies page has multiple actions for each dependency. The actions could be used to inspect and work with the listed dependencies.

  ![Solution dependencies action.](media/solution-component-dependencies.png "Solution dependencies action")

You can select any component under any grouped solution to use one of the following actions.

**Open**: This action takes you to the particular component using the Default solution. The open action helps you to navigate to the component where you can inspect or edit it.

**Delete**: This action allows you to delete the component. Ensure to use this action only if the component is no longer required and can be deleted. This action is available only for the unmanaged components.

**Remove dependency**: This action allows you to remove the dependency of the component on the solution component. The system attempts to edit the component to remove the dependency. In the event, when the system is unsuccessful in removing the dependency you might have to consider doing manual edit. This feature is available for certain components today and we're working on onboarding more components soon.

**Open documentation** - This action allows you to open documentation where you can learn about the dependencies on that component type.

You can also select a grouped solution and perform Delete solution action:

**Delete Solution** - If you need to delete/uninstall a solution that has dependencies on the solution component, you can utilize the Delete button provided for the solution.

### See also

 [Remove dependencies](./removing-dependencies.md)
 [Solution concepts](./solution-concepts-alm.md)  
 [Solution layers](./solution-layers-alm.md)  
 [Dependency tracking for solution components.](dependency-tracking-solution-components.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
