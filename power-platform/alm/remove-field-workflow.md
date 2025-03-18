---
title: Remove dependencies between fields and workflows
description: "Dependencies sometimes can block operations. This article describes how field and workflow dependencies can be removed with Power Platform."
author: ccdietrich
ms.author: cdietric
ms.reviewer: matp
ms.subservice: alm
ms.topic: how-to
ms.date: 06/17/2020
---
# Remove dependencies between fields and workflows

To remove dependencies between fields (attributes) and classic workflows (processes), locate the workflow in the customizations page.

When open the workflow to view the workflow details, and then find the reference to the component you no longer want the workflow to depend on. In this example, you observe the field **Number Field** that's referenced in a process step.

:::image type="content" source="media/solution-dependency-component-workflow.png" alt-text="Finding the workflow dependency" lightbox="media/solution-dependency-component-workflow.png":::

Delete (or change) the step, and then save the workflow.

## Related articles

- [Removing dependencies overview](removing-dependencies.md)
- [Remove dependencies between fields and views](remove-field-view.md)
- [Remove dependencies between tables and model-driven apps](remove-table-app.md)