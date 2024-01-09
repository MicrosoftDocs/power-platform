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

<!-- This article needs to be revised to use the modern app designer since the classic app designer is deprecated-->

To remove dependencies between tables (entities) and model-driven apps (app module), locate the app in the **Apps** list in Power Apps (make.powerapps.com).

![Apps list.](media/solution-dependency-component-appmodule-01.png "Apps list")

In the app designer, find the reference to the component you no longer want the app to depend on. In this example, you see the entity **Custom Entity** under **Entity View**.

![App designer.](media/solution-dependency-component-appmodule-02.png "App designer")

Also, inspect the site map associated with the app, because it's likely that you'll find references there.

![Sitemap designer.](media/solution-dependency-component-appmodule-03.png "Sitemap designer")

Remove all references, and then save and publish both the app and the site map.

> [!NOTE]
> After being edited, components can be added to managed solutions and transported to other organizations to remove managed dependencies.

- [Removing dependencies overview](removing-dependencies.md)
- [Remove dependencies between fields and workflows](remove-field-workflow.md)
- [Remove dependencies between fields and views](remove-field-view.md)
