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

The following sections describe how form merge works and how to maintain customizations. The basic development scenarios with recommendations for maintaining successful ALM for a model-driven app form are covered in detail within each section that follows. Every scenario includes steps to follow that can help you implement a proper ALM process when updating your solution or model-driven app.

## Creating a new form and maintaining customizations using multiple managed solutions

Follow these steps to implement healthy form ALM for this scenario.

1. Create a new form named *FormA* in your development environment and perform customizations on the form.
1. Create a new solution (named *Solution A* in the below diagram) in the development environment, which will be an unmanaged solution and add your new form. Export the solution as managed. Note that this step will export a [full FormXml](#full-formxml) for the form.
1. In your test environment, import the managed solution from step 2, which creates *FormA* in the test environment. In the below diagram, *FormA* gets created in the test environment and the UI for the form shows *Field1* and *Field2* that *Solution A* added to the form.
1. If you want to further customize the form you created in Step 1 using new managed solutions, then make sure the development instance has *FormA* in a managed state. As shown in the diagram below, managed *Solution A* is imported in the development environment and the form is customized creating active customizations.  Then, *FormA* can then be added to a new unmanaged solution (*Solution B* in the diagram) and exported as a managed solution from the development environment. Note that this step will export a [differential (diff) FormXml](#differential-diff-formxml) for the form.
1. In your test environment, import the managed solution (*Solution B*) from step 4. As shown in the below diagram *Solution B* is adding a new *Field3* to *FormA* and removing *Field2*, which was added by *Solution A*. The UI for the form in the test environment will now show *Field3* and *Field1* on the form but not *Field2* after the merge.

:::image type="content" source="media/scenario1-form-alm-diagram.png" alt-text="Scenario 1 form ALM diagram":::

### Unhealthy example for this scenario

As seen in the below diagram, it is not a healthy ALM practice to create multiple managed solutions from the development environment where the base solution (*Solution A*) is in an unmanaged state. This is because, when you create another unmanaged solution (*Solution B*) for the unmanaged form, the FormXml is exported as a full FormXml, instead of a diff FormXml as shown in the valid scenario above. Subsequently, changes like removing a field won't take effect.

:::image type="content" source="media/unhealthy-form-alm-scenario1.png" alt-text="Unhealthy form ALM example for this scenario":::

## Creating a new form and maintaining customizations using patches and upgrades

Follow these steps to implement healthy form ALM for this scenario.

1. Create a new for named *FormA* in your development environment and perform customizations on the form.
1. Create a solution (*Solution A* in the below diagram), which will be an unmanaged solution and add your new form. Export the solution as managed. Note that this step will export a [full FormXml](#full-formxml) for the form.
1. In your test environment, import the managed solution from step 2, thus creating the form in the test environment. In the below diagram *FormA* gets created in the test environment and the UI for the form shows *Field1* and *Field2* that *Solution A* added to the form.
1. If you want to further customize the form you created in Step 1 using patches, then using the same environment where *Solution A* is in an unmanaged state, create a patch for the solution and customize the form. Next, export the patch as a managed solution. Note that this step will export a [full formXml](#full-formxml) for the form.
1. In your test environment, import the managed patch solution from step 4. As shown in the below diagram, the *Solution A* patch is adding a new *Field3* to FormA and removing *Field2*, which was added by *Solution A*.

   > [!NOTE]
   > Patches are additive in nature and can't remove fields from the form, so *Field2* will not be removed from the form. The UI for the form in the test environment will now show *Field3*, *Field2*, and *Field1*.

1. If you want to further customize the form you created in Step 1 using upgrades, then using the same environment where *Solution A* is in an unmanaged state, clone *Solution A* to create the upgrade solution and customize the form. Then, export the *Solution A* upgrade as a managed solution. Note that this step will export a full FormXml for the form.
1. In your test environment, import the managed *Solution A* upgrade from step 6. As shown in the below diagram, the *Solution A* upgrade is adding a new *Field4* to *FormA* and removing *Field2*, which was added by *Solution A*. The UI for the form in the test environment will now show *Field1*, *Field3*, and *Field4* on the form, but *Field2* will be removed after the merge.

:::image type="content" source="media/scenario2-form-alm-diagram.png" alt-text="Scenario 2 form ALM diagram":::

## Customizing an existing managed form and maintaining customizations using multiple managed solutions

Follow these steps to implement healthy form ALM for this scenario.

1. Edit an existing managed, named *FormB* for this example, in your development environment and perform customizations on the form. Note that solution A is the managed solution already installed for the form in the development environment.
1. Create a new solution (*Solution B* in the below diagram), which is an unmanaged solution, and add *FormB*. Export the solution as managed. Note that this step will export a [differential (diff) FormXml](#differential-diff-formxml) for the form.
1. In your test environment, import the managed solution from step 2, thus creating a second solution layer for the form. In the above diagram *FormB* gets the merged changes from *Solution A* and *Solution B* in the test environment and the UI for the form shows *Field1* and *Field3* on the form but not *Field2* which was removed by *Solution B*.
1. If you want to further customize the form you customized in Step 1 using new managed solutions, then make sure the development environment has *FormB* in a managed state. As shown in the diagram below, *Solution A* and *Solution B* managed solutions are imported in the development environment. *FormB* is customized creating active customizations, which can then be added to a new solution (*Solution C* in the diagram) and exported as a managed solution. Note that this step will export a diff FormXml for the form.
1. In your test environment, import the managed *Solution C* from step 4. As shown in the below diagram, *Solution C* is adding a new *Field4* to the *FormB* and removing *Field3*, which was added by *Solution B*. The UI for the form in the test environment will now show *Field1* and *Field4* on the form, but not *Field2* and *Field3*.

:::image type="content" source="media/scenario3-form-alm-diagram.png" alt-text="Scenario 3 form ALM diagram":::

### Unhealthy example for this scenario

As shown in the below diagram, it is not a healthy ALM practice to create multiple managed solutions from the development environment that contains another unmanaged solution you created for the same form. Notice that *Solution B* is in unmanaged state. When you create another unmanaged solution (*Solution C*) for *FormB*, the FormXml is exported as a diff FormXml as shown in step 4 in the above scenario. But, *FormB* also contains the changes from *Solution B*, which will get overwritten by your new changes.

For example, as seen in the diagram below, *Field3* is added to *FormB* in *Solution B*, but now if you create a new *Solution C* in this environment, with Solution B in unmanaged state, and remove *Field3*, *Field3* will be removed in the development environment. *Field3* will not be tracked in the diff FormXml when the solution is exported, since the change of adding and removing this field was made in the same active layer. That means when managed *Solution C* is imported in the test environment, the form will still render the *Field3* because the diff FormXml never records it as removed (like it was removed in step 5 in the healthy form ALM scenario above). Performing your form customizations this way will lead to the development environment being inconsistent with the test environment.

:::image type="content" source="media/unhealthy-form-alm-scenario3.png" alt-text="Unhealthy form ALM example for this scenario":::

## Full and differential form XML

Every exported solution package includes a customizations.xml file. Whenever a form is included in a solution, the related form definition exists within the FormXml sections of the customizations.xml file.

### Full FormXml

The FormXml you get on exporting a solution for a form in an unmanaged state is called a *full* FormXml. Full means it contains the entire form definition. When you create a new form and export it, the form will always be a full FormXml because the form in the organization you are exporting from is in an unmanaged state and is in a create state. If you export any further solutions from this same organization – those will also include a full FormXml. Because the `solutionaction` attribute indicates a diff FormXml, the full FormXml in the customization.xml file in the solution you export will not contain any `solutionaction` attributes.

### Differential (diff) FormXml

The FormXml you get when exporting a solution for a form in a managed state is called a differential or *diff* FormXml. Diff means the FormXml contains only the changes does in the active customizations in that organization and not the entire form definition. When you customize an existing managed form and export it, the form will always be a diff FormXml because it will only contain the active changes done to it. Note that the diff FormXml in the customization.xml file in the solution you export will contain `solutionaction` attributes defining what the changes are, like **Added**, **Removed**, **Modified**.

Diff FormXml ensures that your solution will only express the changes your app needs and will be impacted less by changes from other layers. Diff FormXml also makes the solution less bulky and helps it import faster.

