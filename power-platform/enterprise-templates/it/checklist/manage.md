---
title: Get started managing the Checklist program
description: Learn how to manage the Checklist apps.
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 10/28/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---
# Get started managing checklists

As an administrator, go to the *Checklist Administrator* model-driven app to create custom checklist templates and configure the reference data for use in the canvas application. You'll also be able to monitor the data in the model-driven app.

## Create custom templates

The templates you create can be associated with items in your inventory and used in checklist reports. You can add templates directly in the application.

1. Start the *Checklist Administrator* model-driven app and select **Templates**.
1. Select **+ New** and assign a name for the new template.
1. Select **Save**.
1. Repeat the process every time you need to create a new custom template.

## Create custom steps

Each checklist template requires steps to guide users in creating effective reports. You can add steps directly to existing templates.

1. Start the Checklist Administrator model-driven app and select **Templates**.
1. Select a template to add a step to.
1. Select **+ New Template Step** to go to the *New Template Step* form.
1. Fill up the Name and the Step Number for the step.
1. Select **Save**.

## Create custom sub steps

Each checklist template allows you to create multiple sub-steps for each step, enabling users to provide necessary validation information. You can add sub-steps directly within any created step.

1. Start the *Checklist Administrator* model-driven app and select **Templates**.
1. If there are no steps yet, follow the *Create custom Template Steps* section.
1. Select **+ New Template Sub Step** to go to the *New Template Sub Step* form.
1. Fill out *Name*, *Validation Type*, and the *Sub Step Order* for the step. You can create Validation Types ahead of time so you can just select them during the Sub Step creation process.
1. Select **Save**.
1. Repeat the steps to create as many templates and sub steps you need under a template step.

## Set up categories

Categories classify inventory items and can be added or managed directly in the app.

1. Start the *Checklist Administrator* model-driven app and select **Categories**.
1. Select **+ New** to go to the *New Category* form.
1. Select **Save**.
1. Repeat the steps as necessary.

## Set up inventories

Inventories are categories of items you have on hand. Take these steps to add and manage inventories:

1. Start the *Checklist Administrator* model-driven app and select **Inventories**.
1. Select **+ New** to go to the *New Inventory* form.
1. Fill out the *Name*, this is a required field and select Category from the list of already set up categories. It's recommended you have already set up categories before setting up the inventory.
1. Select **Save**.
1. Repeat the steps as necessary.

## Set up items

Items are specific entries in your inventory that can be mapped to a specific checklist template, allowing for report creation within the Checklist application. You can add and manage items directly in the app.

1. Start the *Checklist Administrator* model-driven app and select **Items**.
1. Select **+ New** to go to the *New Item* form.
1. Fill out *Name* and select the requried *Checklist Category*. It's recommended that you set up Categories before setting up Items.
1. Select **Save**.
1. Repeat the steps as necessary.

### Next step

[Get started using the Checklist app](use.md)
