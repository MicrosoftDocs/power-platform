---
title: "Solution layers in Power Apps | Microsoft Docs"
description: "Learn about solution layers in Power Apps"
keywords: 
author: Mattp123
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 05/05/2020
ms.reviewer: ""
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---

# Solution layers

Solution layering is implemented at a component level. Managed and
unmanaged solutions exist at different layers within a Microsoft Dataverse
environment. In Dataverse, there are two distinct layers:

-   **Unmanaged layer** All imported unmanaged solutions and ad-hoc customizations
    exist at this layer. All unmanaged solutions share a single unmanaged layer.

-   **Managed layers** All imported, managed solutions and the system solution exist
    at this level. When multiple managed solutions are installed, the last one
    installed is above the managed solution installed previously. This means
    that the second solution installed can customize the one installed before
    it. When two managed solutions have conflicting definitions, the runtime
    behavior is either "Last one wins" or a merge logic is implemented. If you
    uninstall a managed solution, the managed solution below it takes effect. If
    you uninstall all managed solutions, the default behavior defined within the
    system solution is applied. At the base of the managed layers level is the
    system layer. The system layer contains the entities and components that are
    required for the platform to function.<!--Very nice explanation! -->

![Example solution layering for a component, such as a form or view](media/solution-layers-alm.png "Example solution layering for a component, such as a form or view")


## Layering within a managed solution 

For each managed component, there are layers within a solution, which&mdash;depending
on whether one or more patches or a pending upgrade to the solution has been
imported&mdash;can include the following layers:

-   **Base** Located at the bottom of the solution layer "stack" is the base layer.
    This layer includes the solution publisher, which identifies the owner of
    the component and the managed properties associated with it.

-   **Top** The top layer is considered the current layer and defines the runtime behavior of the component. The top layer can be an upgrade or a patch, or if no patches or upgrades have been applied to the solution, the base solution determines the component runtime behavior.

-   Layers added from updates:

    -   **Patches** If the component has one or more solution patches imported,
        they're stacked on top of the base layer, with the most recent patch
        residing above the previous patch.

    -   **Pending upgrade** If a staged upgrade (named \_Upgrade) is imported, it
        resides on top of the base and patch (if any) layers.

   <img src="media/layering-within-solution-alm.png" alt="Layering example within a solution" title="Layering example within a solution" width="472" height="288">

> [!IMPORTANT]
> Using patches isn't recommended. More information: [Create solution patches](/powerapps/maker/common-data-service/solution-patches)

The following image shows an example of solution layers for a custom field that displays the base
solution, a patch, and a pending upgrade.<!--Edit okay? I didn't know how this fit into the flow of the article. -->

> [!div class="mx-imgBorder"] 
> ![Solution layers](media/solution-layers-example.png "Solution layers")

For information about how to view layers for a component within a solution, see
[Solution layers](/powerapps/maker/common-data-service/solution-layers).

### Merge behavior 

Solution makers should understand the merge behavior when a solution is updated
or when multiple solutions are installed that affect the same component. Notice
that only model-driven app, form, and site map component types will be merged. All other
components use "top level wins" behavior.

### Solution update and upgrade merge behavior

As described in the previous section, patches and a staged upgrade are stacked
on top of the base solution. These can be merged by selecting **Apply upgrade**
from the **Solutions** area in Power Apps, which flattens the layers and creates
a new base solution.

### Multiple solutions merge behavior

When you prepare your managed solution for distribution, remember that an
environment might have multiple solutions installed or that other solutions might be
installed in the future. Construct a solution that follows best practices so
that your solution won't interfere with other solutions. More information: [Use segmented solutions](segmented-solutions-alm.md)

The processes that Dataverse uses to merge customizations emphasize
maintaining the functionality of the solution. Although every effort is made to
preserve the presentation, some incompatibilities between customizations might
require that the computed resolution change some presentation details in
favor of maintaining the customization functionality. 

### See also

[Understand how managed solutions are merged](how-managed-solutions-merged.md)
