---
title: "Use segmented solutions in Power Apps | Microsoft Docs"
description: "Learn about segmented solutions in Power Apps"
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

# Use segmented solutions
Use solution segmentation so that you only include entity components that are
updated when you distribute solution updates. With solution segmentation, you
export solution updates with selected entity assets, such as entity fields,
forms, and views, rather than entire entities with all the assets. To create a
segmented solution, you use the Solutions area in Power Apps.

You can segment a solution when you select from the following options when
adding an existing entity to the solution:

-   **Include no components or metadata**  When you don't select any components or
    metadata, the minimal entity information is added to the solution.
    Therefore, apart from the friendly name, entity attributes (metadata) or
    components won't be included.

-   **Select components**  You can segment your solution by individually selecting
    each component that's associated with the entity, such as fields,
    relationships, business rules, views, forms, and charts. Use this option to
    select only the components that you've added or changed with the entity,
    such as a new custom field or adding a form.

-   **Include entity metadata**  This option includes no components&mdash;such as fields,
    forms, views, or related entities&mdash;but does include all the metadata
    associated with the entity. Metadata includes the entity properties, such as
    auditing, duplicate detection, and change tracking.

-   **Include all components**  This option includes all components and metadata
    associated with the entity. It can include other entities or entity
    components such as business process flows, reports, connections, and queues.
    You should only use this option when you're distributing an unmanaged
    entity that doesn't exist in the target environment. Notice that after you
    select this option, you can't undo it. To segment the solution, you must
    remove the entity from the solution and re-add it by selecting only the
    changed or new components.

> [!WARNING]
>   Don't add components to the solution that aren't new or changed components.
>   When your update is imported to the target environment, a solution with
>   unintended components can cause unexpected behavior to the existing
>   components that now lay below the layer you introduced with your solution
>   update. For example, if you add a view for an entity that isn't updated and
>   the view in the existing layer has customizations, the existing
>   customizations might become inactive. More information: [Solution layers](solution-layers-alm.md)

More information: [Create segmented solutions](/powerapps/maker/common-data-service/use-segmented-solutions-patches-simplify-updates)

### See also
[Update a solution](update-solutions-alm.md)
