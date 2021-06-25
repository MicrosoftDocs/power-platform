---
title: "Maintaining healthy model-driven app form ALM with Power Apps"
description: "Learn best practices for form customization and lifecycle management with Power Apps."
keywords: 
author: Mattp123
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 06/25/2021
ms.reviewer: ""
ms.service: power-platform
ms.topic: "conceptual"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
---
# Maintaining healthy model-driven app form ALM

This article provides you with information about the various scenarios on how to implement and practice healthy application lifecycle management (ALM) for customizing forms in your model-driven app solutions.

## How form merge works and how to maintain customizations

Below are the basic development scenarios with recommendations for maintaining successful ALM for a model-driven app form. Each scenario includes steps to follow that can help you implement a proper ALM process when updating your solution or model-driven app.

### Scenario 1: Creating a new form and maintaining customizations using multiple managed solutions

1. Create a new form named *FormA* in your development environment and perform customizations on the form.
1. Create a new solution (named *Solution A* in the below diagram) in the development environment, which will be an unmanaged solution and add your new form. Export the solution as managed. Note that this step will export a [full FormXml](#full-formxml) for the form.
1. In your test environment, import the managed solution from step 2, which creates FormA in the test environment. In the below diagram, FormA gets created in the test environment and the UI for the form shows **Field1** and **Field2** that Solution A added to the form.
1. If you want to further customize the form you created in Step 1 using new managed solutions, then make sure the development instance has FormA in a managed state. As shown in the diagram below, managed Solution A is imported in the development environment and the form is customized creating active customizations.  Then, FormA can then be added to a new unmanaged solution (Solution B in the diagram) and exported as a managed solution from the development environment. Note that this step will export a [differential (diff) FormXml](#differential-diff-formxml) for the form.
1. In your test environment, import the managed solution (Solution B) from step 4. As shown in the below diagram Solution B is adding a new **Field3** to FormA and removing **Field2**, which was added by Solution A. The UI for the form in the test environment will now show **Field3** and **Field1** on the form but not **Field2** after the merge.

:::image type="content" source="media/scenario1-diagram.png" alt-text="Scenario 1 diagram":::

### Unhealthy scenario 1

As seen in the below diagram, it is not a healthy ALM practice to create multiple managed solutions from the development environment where the base solution (Solution A) is in an unmanaged state. This is because, when you create another unmanaged solution (solution B) for the unmanaged form, the FormXml is exported as a full FormXml, instead of a diff FormXml as shown in the valid scenario above. Subsequently, changes like removing a field won't take effect.

## Full and differential form XML

Every exported solution package includes a customizations.xml file. Whenever a form is included in a solution, the related form definition exists within the FormXml sections of the customizations.xml file.

### Full FormXml

The FormXml you get on exporting a solution for a form in an unmanaged state is called a *full* FormXml. Full means it contains the entire form definition. When you create a new form and export it, the form will always be a full FormXml because the form in the organization you are exporting from is in an unmanaged state and is in a create state. If you export any further solutions from this same organization – those will also include a full FormXml. Because the `solutionaction` attribute indicates a diff FormXml, the full FormXml in the customization.xml file in the solution you export will not contain any `solutionaction` attributes.

### Differential (diff) FormXml

The FormXml you get when exporting a solution for a form in a managed state is called a differential or *diff* FormXml. Diff means the FormXml contains only the changes does in the active customizations in that organization and not the entire form definition. When you customize an existing managed form and export it, the form will always be a diff FormXml because it will only contain the active changes done to it. Note that the diff FormXml in the customization.xml file in the solution you export will contain `solutionaction` attributes defining what the changes are, like **Added**, **Removed**, **Modified**.

Diff FormXml ensures that your solution will only express the changes your app needs and will be impacted less by changes from other layers. Diff FormXml also makes the solution less bulky and helps it import faster.

