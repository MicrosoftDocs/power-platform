---
title: Remove dependencies between columns and views
description: "Dependencies sometimes can block operations. This article describes how column and view dependencies can be removed in Power Platform."
author: ccdietrich
ms.author: cdietric
ms.reviewer: matp
ms.subservice: alm
ms.topic: how-to
ms.date: 03/13/2025
---
# Remove dependencies between columns and views

To remove dependencies between columns (formerly fields and also known as attributes) and views (saved queries), locate the view in the table and open it.

In the view editor, find the reference to the component you no longer want the view to depend on. In this example, you observe the column named **Number column** being used as a view column and a filter.

![Edit view.](media/solution-dependency-component-view.png "Edit view")

Remove both the filter and column, save, and then publish the view.

## Related articles

- [Removing dependencies overview](removing-dependencies.md)
- [Remove dependencies between fields and workflows](remove-field-workflow.md)
- [Remove dependencies between tables and model-driven apps](remove-table-app.md)