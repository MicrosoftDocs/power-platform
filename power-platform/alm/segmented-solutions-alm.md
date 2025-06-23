---
title: "Use table segmentation in solutions in Power Apps"
description: "Learn how to use table segmentation in solutions when you distribute solution updates so that only updated entity components are included."
keywords: 
author: Mattp123
ms.subservice: alm
ms.author: matp
ms.custom: ""
ms.date: 02/04/2025
ms.reviewer: ""
ms.topic: how-to
search.audienceType: 
  - maker
---
# Use table segmentation in solutions

Use table segmentation in solutions so that you only include table components that are
updated when you distribute solution updates. By doing this, you
export solution updates with selected table assets, such as table columns,
forms, and views, rather than entire tables with all their assets. To use table segmentation in a solution, you use the **Solutions** area in Power Apps.

You can segment tables when you select from the following options when
you add an existing table to the solution:

1. **No objects selected**. When you don't select any objects or metadata, the minimal table information is added to the solution. Therefore, apart from the friendly name, table attributes (metadata), or components won't be included. This is the default option so no objects are added when you select **Add** without any other selections when adding an existing component.
2. **Edit objects**. You can segment your table by individually selecting **Edit objects**, and then select each component that's associated with the table, such as columns, relationships, business rules, views, forms, and charts. Use the select components option to select only the components that you added or changed with the table, such as a new custom column or adding a form.
3. **Include table metadata**. This option includes no components&mdash;such as columns, forms, views, or related tables&mdash;but does include all the metadata associated with the table. Metadata includes the table properties, such as auditing, duplicate detection, and change tracking.
4. **Include all objects**. This option includes all components and metadata associated with the table. It can include other tables or table components such as business process flows, reports, connections, and queues. You should only use this option when you're distributing an unmanaged table that doesn't exist in the target environment. Notice that after you select this option, you can't undo it. To segment the table, you must remove the table from the solution and readd it by selecting only the changed or new components.

:::image type="content" source="media/solution-segment-add-existing-table.png" alt-text="Options available for what to include with an existing solution component.":::

> [!WARNING]
> Don't add components to the solution that aren't new or changed components. When your update is imported to the target environment, a solution with unintended components can cause unexpected behavior to the existing components that now lay below the layer you introduced with your solution update. For example, if you add a view for a table that isn't updated and the view in the existing layer has customizations, the existing customizations might become inactive. More information: [Solution layers](solution-layers-alm.md)
>

### See also

[Update a solution](update-solutions-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
