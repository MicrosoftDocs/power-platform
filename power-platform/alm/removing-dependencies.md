---
title: "Removing dependencies overview in Microsoft Dataverse" 
description: "Learn how to identify, diagnose, and remove dependencies in Microsoft Dataverse to manage solution components effectively." 
ms.custom: ""
ms.date: 05/08/2025
ms.reviewer: ""
ms.topic: concept-article
author: "ccdietrich" 
ms.subservice: alm
ms.author: "cdietric" 
search.audienceType: 
  - developer
---
# Removing dependencies overview

Solution components often depend on other solution components. You can’t delete any solution component that has dependencies from another solution component. Dependencies are records created automatically by the solutions framework to prevent required components from being deleted while one or more dependent components still include references to them. 

Examples of a dependency is, given a field is required for a form to function, when you try to execute an action that results in the deletion of that field, the form will stop working.

Another example is when you try to delete the site map for a model-driven app. The system indicates that there's a dependency on the app. The app is the dependent component, and the site map is the required component. The system prevents you from deleting the site map until you remove the dependency.

:::image type="content" source="media/dependency-example.png" alt-text="System detects a dependency where the app is dependent on the site map." lightbox="media/dependency-example.png":::

> [!NOTE]
> *Delete* means that the component is completely removed from Microsoft Dataverse.

In this article, we discuss how to handle these dependencies and the strategies you can use to remove dependencies that you no longer need.

## Dependencies of unmanaged vs. managed components

First, it's important to understand that dependencies only prevent operations that delete a required component. The actions that can delete a component are different, depending on whether it's unmanaged or managed.

It's good to be familiar with the concept of solution and component layers when describing dependencies. If you aren't familiar, we recommend that you read this article before continuing: [Solution layers](/power-apps/maker/data-platform/solution-layers)

### Unmanaged components

These components are represented by a single layer in the active solution. Any **Delete** operation on such a component results in the complete removal of the component.

### Managed components

The deletion of managed components depends on multiple factors: the number of solution layers, the relative position of the layer that's being uninstalled, and the component publishers. For example, when a component is deleted, consider the following scenarios and what will be the expected behavior when you uninstall the various layers.

### Example scenarios

The following example scenarios illustrate what happens to solution layers when solutions are uninstalled.

#### Scenario 1: Uninstall a single solution layer

  ![Uninstall with a single layer.](media/solution-managed-uninstall-scenario-01.png "Uninstall with a single layer")

Uninstalling Solution 1 causes a component deletion because it's the only layer for the component.

#### Scenario 2: Uninstall solution layers from different publishers

![Uninstall with two layers - Different publisher.](media/solution-managed-uninstall-scenario-02.png "Uninstall with two layers - Different publisher")

- Uninstalling Solution 2 doesn't cause a component deletion. Only that layer is removed.
- Uninstalling Solution 1 causes a component deletion, because the action happens in the base layer. In fact, Solution 1 can't be uninstalled in this scenario, because a solution from a different publisher extends the component.

#### Scenario 3: Uninstall multiple solution layers from different publishers

![Uninstall with multiple layers - Different publisher.](media/solution-managed-uninstall-scenario-03.png "Uninstall with multiple layers - Different publisher")

- Uninstalling Solution 3 doesn't cause a component deletion. Only that layer is removed.
- Uninstalling Solution 2 doesn't cause a component deletion. Only that layer is removed.
- Uninstalling Solution 1 doesn't cause a component deletion, because in this case there's another solution from the same publisher (Publisher A). The platform removes the layer from Solution 1 and replaces it with the layer from Solution 3.

#### Scenario 4: Uninstall solution layers in an unmanaged customization

![Uninstall with two layers - Unmanaged customization.](media/solution-managed-uninstall-scenario-04.png "Uninstall with two layers - Unmanaged customization")

- Uninstalling the active (unmanaged) layer doesn't cause a component deletion. Only that layer is removed. Note that you can't uninstall the active solution, but you can remove components by using the **Remove Active Customization** feature.
- Uninstalling Solution 1 causes a component deletion. The action happens in the base layer. Unlike scenario 2, you can uninstall Solution 1. The Active solution isn't considered an extension, and both layers are removed.

## Show dependencies page

The **Show dependencies** command lists the dependencies for the selected solution or solution component. It can be invoked by:

- Selecting **Show dependencies** on the solution page.
- Selecting **Advanced** > **Show dependencies** within a solution when a solution component is selected.
- Trying to uninstall a solution, which causes the platform to detect that dependencies exist.

From the **Dependencies** page you can open, remove, or delete, the component. More information: [View dependencies for a component](/power-apps/maker/data-platform/view-component-dependencies)

## Diagnosing dependencies

Consider this scenario. The environment here has two solutions: **Solution - Workflow** and **Solution - Custom Entity**.

![Solution list with two solutions.](media/solution-list-custom-entity-workflow.png "Solution list with two solutions")

A maker of the environment decides that they no longer require **Solution - Custom Entity**. The maker tried to delete it, and was presented with the following page:

![Dependency Details after trying to delete a solution.](media/dependency-dialog-with-dependencies.png "Dependency Details after trying to delete a solution")

The uninstall of the solution is trying to delete a table named **Custom Entity** and three fields&mdash;**Custom Entity**, **Name**, and **Number Field**&mdash;and all four components have dependencies.

> [!NOTE]
> Uninstalling the solution might potentially delete more components, but because they don't have dependencies, they won't appear on the list.

The next step is to check the **Solution Layers** link (rightmost column) for each dependency. That helps you decide what to do to remove the dependency.

The following figure shows dependency details between the table (Custom Entity) and process (Test Workflow).

![Custom table dependency details.](media/solution-dependency-solution-history-02.png "Custom table dependency details")

Based on the data displayed, you can observe that the dependent component belongs to a solution named SolutionWorkflow. To remove this dependency, you can either:

- Update the definition of the workflow in SolutionWorkflow by removing any references to the table or its subcomponents. Then **Update** or **Upgrade** the solution.
- Uninstall the SolutionWorkflow solution.
- Remove the workflow from a new version of the SolutionWorkflow solution, and then perform an **Upgrade**.

Because any one dependent component can prevent the removal of the solution, we recommend that you check all the dependencies and make all the required changes in a single operation.

The following figure shows dependency details between the table (Custom Entity) and a model-driven app (MyApp).

![Dependency between table (Custom Entity) and App (My App).](media/solution-dependency-solution-history-01.png "Dependency between table (Custom Entity) and app (My App)")

Based on the data displayed, you can observe that the dependent component belongs to a solution named Active. This indicates that the dependency was created by importing an unmanaged solution, or through an unmanaged customization that was executed through the modern UI or API.

To remove this dependency, you can either:

- Edit the definition of the model-driven app to remove any reference to the entity or its subcomponents. Because model-driven apps support publishing, you must publish your changes.
- Delete the model-driven app.

> [!NOTE]
> Uninstalling an unmanaged solution isn't an option for removing this dependency, because unmanaged solutions are just a means to group components.

## Actions to remove a managed dependency

Managed dependencies are the ones where the dependent component is associated to a managed solution. To resolve this kind of the dependency, you must act on the solution where the component was added. That action can be different depending on what you're trying to do.

### If you're trying to uninstall a solution

Follow these steps:

1. In the target environment, inspect the **Solution Layers** link to find what is the topmost solution on the list of the dependent component.
1. In the source environment, prepare a new version of that solution where the solution either doesn't contain the dependent component, or has an updated version of the dependent component that doesn't contain references to the required component. Your goal is to remove any reference to the required components in the new version of the solution.
1. Export the new version of the solution.
1. In the target environment, **Upgrade** that solution.
1. Retry the uninstall.

### If you're trying to upgrade a solution

In this case, you must confirm that you wanted to delete the required component (remember that dependencies are enforced only on components that are being deleted).

If you didn't want to delete the component, you can fix the new version of the solution by adding the component back by doing the following:

1. In the target environment, uninstall the staged solution (the solution that ends in **_Upgrade**).
1. In the source environment, add the required components back to the solution.
1. Export the new version.
1. Retry the upgrade.

If the deletion is intentional, you must remove the dependency. Try the steps outlined in the preceding section, [If you're trying to uninstall a solution](#if-youre-trying-to-uninstall-a-solution).

### Layers and dependencies

The dependent components can be layered, so you might need to change more than one solution to completely remove a dependency. The dependency framework only calculates dependencies between the topmost layers for the required and dependent components. That means you need to work your way from the top to the bottom of the solutions of the dependent component.

Consider the following scenario:

![Choosing a solution to uninstall.](media/solution-dependency-multiple-layers.png "Choosing a solution to uninstall")

You try to uninstall **Solution - Custom Entity**, and the operation is blocked by dependencies.

![Dependencies blocking the uninstall of the solution.](media/solution-dependency-layers-and-dependencies-dependency-dialog-01.png "Dependencies blocking the uninstall of the solution")

You start diagnosing the dependency by selecting **Solution Layers** on the **new_numberfield** attribute. You observe the following screen:

![Dependency between the new_numberfield attribute and Test Workflow workflow.](media/solution-dependency-layers-and-dependencies-solution-history-01.png "Dependency between the new_numberfield attribute and Test Workflow workflow")

Because dependencies are created only between the topmost layers of each component, the first step is to deal with the dependency between the **new_numberfield** attribute in SolutionCustomEntity and the **Test Workflow** workflow in SolutionWorkflow3.

To remove the dependency, you decide to uninstall SolutionWorkflow3. You do so, but when you try to uninstall the solution once more, you're presented by the same page of dependencies:

![Dependencies blocking the uninstall of Solution - Custom Entity.](media/solution-dependency-layers-and-dependencies-dependency-dialog-02.png "Dependencies blocking the uninstall of Solution - Custom Entity")

However, the **new_numberfield** column is no longer listed, even if it existed in more layers.

## Actions to remove an unmanaged dependency

To remove unmanaged dependencies, you need to act directly on the components, not in the solutions they belong to. For example, if you want to remove the dependencies between a column and a form, you must edit it in the form designer and remove the column from the form. The dependency is removed after you select **Save** and **Publish**.

> [!NOTE]
>
> - The **Show dependencies** command lets you take action to view, remove the dependency, edit the component, or delete the component. More information: [View dependencies for a component](/power-apps/maker/data-platform/view-component-dependencies)
> - The **View Dependencies** button appears when you try to delete a component that has dependencies. Although this screen lets you view the dependency, it doesn't let you take action.
> - When you delete the dependent component, the action deletes *all dependencies*, along with the component.

To view the dependencies of a component, from the **Solutions** area, open the solution you want, select the vertical ellipses next to the component, and then select **Advanced** > **Show dependencies**.

The page of dependencies has two distinct parts:

- Dependent components: A list of components that depend on the selected column. In other words, these components have this column as their required component.
- Required components: A list of components that this column requires in order to work. In other words, these components have this column as their dependent component.

![Component dependencies.](media/solution-dependency-layers-and-dependencies-component-dependency-dialog.png "Show Component")

### Next steps

- [Remove dependencies between fields and workflows](remove-field-workflow.md)
- [Remove dependencies between fields and views](remove-field-view.md)
- [Remove dependencies between tables and model-driven apps](remove-table-app.md)
- [Solution layers](solution-layers-alm.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
