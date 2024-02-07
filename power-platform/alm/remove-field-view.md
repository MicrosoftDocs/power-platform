---
title: Remove dependencies between fields and views
description: "Dependencies sometimes can block operations. This article describes how field and view dependencies can be removed."
author: ccdietrich
ms.author: cdietric
ms.subservice: alm
ms.topic: how-to
ms.date: 06/17/2020
---
# Remove dependencies between fields and views

To remove dependencies between fields (attributes) and views (saved queries), locate the view in the customizations page.

In the field editor, find the reference to the component you no longer want the view to depend on. In this example, you see the field **Number Field** being used as a select column and a filter.

![Edit view.](media/solution-dependency-component-view.png "Edit view")

Remove both, save, and then publish the view.

## Related content

- [Removing dependencies overview](removing-dependencies.md)
- [Remove dependencies between fields and workflows](remove-field-workflow.md)
- [Remove dependencies between tables and model-driven apps](remove-table-app.md)