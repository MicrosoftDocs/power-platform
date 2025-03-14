---
title: Remove dependencies between tables and model-driven apps
description: "Dependencies sometimes can block operations. This article describes how table and model-driven app dependencies can be removed in Power Platform."
author: ccdietrich
ms.author: cdietric
ms.reviewer: matp
ms.subservice: alm
ms.topic: how-to
ms.date: 03/13/2025
---
# Remove dependencies between tables and model-driven apps

To remove dependencies between tables and model-driven apps, open the app in the app designer, remove the component, such as a table, from the app navigation, and then remove the component from the app.

1. Sign into Power Apps (make.powerapps.com), go to in the **Solutions** on the left navigation pane, and then open the solution that has the model-driven app.
1. Open the model-driven app in the app designer, then find the component you no longer want the app to depend on. In this example, you observe the table **Custom table** in the **Pages** left pane. Select **...** next to the item, and then select **Remove from navigation**.

   :::image type="content" source="media/remove-from-navigation.png" alt-text="Remove the custom table from the navigation" lightbox="media/remove-from-navigation.png":::
1. The component appears under the **All other pages** area near the bottom of the **Pages** left pane. Select **...** next to the item, and then select **Remove from app**.
   :::image type="content" source="media/remove-from-app.png" alt-text="Remove the custom table from the app":::

1. Save and publish the app.

> [!NOTE]
> After you remove the component from app designer in your developer environment, the component can be added to an unmanaged solution and then exported as a managed solution to other environments, such as production, to remove the managed dependency.

## See also

- [Removing dependencies overview](removing-dependencies.md)
- [Remove dependencies between fields and workflows](remove-field-workflow.md)
- [Remove dependencies between fields and views](remove-field-view.md)
