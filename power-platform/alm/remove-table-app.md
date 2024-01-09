---
title: Remove dependencies between tables and model-driven apps
description: "Dependencies sometimes can block operations. This article describes how table and model-driven app dependencies can be removed."
author: ccdietrich
ms.author: cdietric
ms.subservice: alm
ms.topic: how-to
ms.date: 06/17/2020
---
# Remove dependencies between tables and model-driven apps

To remove dependencies between tables (entities) and model-driven apps (app module), locate the app in the **Apps** list in Power Apps (make.powerapps.com).

Open the model-driven app in the app designer, then find the the component you no longer want the app to depend on. In this example, you see the table **Custom table** in the **Pages** left pane. Select **...** next to the item, and then select **Remove from navigation**.

:::image type="content" source="media/remove-custom-table-from-app.png" alt-text="Remove the custom table from the app":::

Save and publish the app.

> [!NOTE]
> After being edited, components can be added to managed solutions and transported to other organizations to remove managed dependencies.

- [Removing dependencies overview](removing-dependencies.md)
- [Remove dependencies between fields and workflows](remove-field-workflow.md)
- [Remove dependencies between fields and views](remove-field-view.md)
