---
title: "Use table segmentation in solutions in Power Apps"
description: "Learn how to use table segmentation in solutions when you distribute solution updates so that only updated entity components are included."
keywords: 
author: Mattp123
ms.subservice: alm
ms.author: matp
ms.custom: ""
ms.date: 01/26/2026
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
4. **Include all objects**. This option includes all components and metadata associated with the table. It can include other tables or table components such as business process flows, reports, connections, and queues.
   > [!IMPORTANT]
   > You should only use the **Include all objects** option when you're distributing an unmanaged table that *doesn't exist in the target environment*. Notice that after you select this option, you can't undo it. To segment the table, you must remove the table from the solution and readd it by selecting only the changed or new components. More information: [Why table segmentation in a solution is important](#why-table-segmentation-in-a-solution-is-important)

:::image type="content" source="media/solution-segment-add-existing-table.png" alt-text="Options available for what to include with an existing solution component.":::

> [!WARNING]
> Don't add components to the solution that aren't new or changed components. When your update is imported to the target environment, a solution with unintended components can cause unexpected behavior to the existing components that now lay below the layer you introduced with your solution update. For example, if you add a view for a table that isn't updated and the view in the existing layer has customizations, the existing customizations might become inactive. More information: [Solution layers](solution-layers-alm.md)
>

## Why table segmentation in a solution is important

When you add an existing system table, such as account or contact, or a custom table to a solution for a table that's already been imported into your downstream environments, the best practice is to *only add the table objects that were updated* in your solution. With solution segmentation, you export solution updates with selected table assets, such as table columns, forms, and views, rather than entire tables with all the assets. This avoids unnecessary layers that hinder other solutions from being effective and unnecessary dependencies on other solutions. The system automatically selects **Include all objects** if the table is unmanaged, and **Include table metadata** if there's an unmanaged layer on the table. The system also preselects the table assets that are unmanaged or have unmanaged customizations automatically. You can select the **Edit objects** link to review that selection before you select **Add** to complete the process.

> [!IMPORTANT]
> Don't segment tables that don't exist in the target environment. Notice that if a table has never been imported or doesn't already exist in the target environment you must select **Include all objects** when you add the table to the solution, such as when adding a new custom table that you recently created. Otherwise you receive a missing dependency error message when you try to import the solution.

## See also

[Update a solution](update-solutions-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
