---
title: Remove dependencies between fields and workflows
description: "Dependencies sometimes can block operations. This article describes how field and workflow dependencies can be removed."
author: ccdietrich
ms.author: cdietric
ms.subservice: alm
ms.topic: how-to
ms.date: 06/17/2020
---
# Remove dependencies between fields and workflows

To remove dependencies between fields (attributes) and workflows (processes), locate the workflow in the customizations page.

When viewing the workflow details, find the reference to the component you no longer want the workflow to depend on. In this example, you can see the field **Number Field** being referenced in a process step.

![Finding the workflow dependency.](media/solution-dependency-component-workflow.png "Finding the workflow dependency")

Delete (or change) the step, and then save the workflow.

## Related content

- [Removing dependencies overview](removing-dependencies.md)
- [Remove dependencies between fields and views](remove-field-view.md)
- [Remove dependencies between tables and model-driven apps](remove-table-app.md)