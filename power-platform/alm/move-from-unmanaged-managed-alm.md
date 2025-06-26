---
title: "Move from unmanaged to managed solutions to support healthy ALM with Power Platform"
description: "Learn how to move from unmanaged to managed solutions in your organization to support healthy application lifecycle management (ALM) with Power Platform."
keywords: 
author: Mattp123
ms.subservice: alm
ms.author: matp
ms.custom: ""
ms.date: 02/04/2025
ms.reviewer: "sabrina.dibartolomeo"
ms.topic: how-to
search.audienceType: 
  - maker
---
# Scenario 3: Moving from unmanaged to managed solutions in your organization

This scenario addresses a situation where your production environment contains only unmanaged solutions for your customizations or your customizations were made in the default solution. The tasks described here show you how to convert all of your unmanaged components to managed using a single solution that is used to create a single managed layer in your test and production environments. Later, you might want to create additional solutions to develop different layering strategies and dependencies between solutions.

Except for your development environment, the end result is to only have managed solutions in your environments. More information: [Managed and unmanaged solutions](solution-concepts-alm.md#managed-and-unmanaged-solutions).

## Prerequisites

- Separate development and production environments. Additionally, we recommend that you also maintain at least one test environment that's separate from your development and production environments.
- Use a single publisher for all your solutions across all your environments. More information: [Solution publisher](solution-concepts-alm.md#solution-publisher)

## Convert an unmanaged solution to managed

1. Identify and remove unnecessary tables and components.
   1. Create a backup of your production environment. You can bring back components that might be inadvertently deleted through solution export and import in the next step.
   1. Remove tables and components that aren't needed from your production environment. For example, consider deleting tables with no records or very old records, or tables and components that have no dependencies. More information: [View dependencies for a component](/powerapps/maker/data-platform/view-component-dependencies)

2. Create a *single* solution to use to convert components from unmanaged to managed.
   > [!WARNING]
        > It's important to carefully select the publisher for this unmanaged solution. Ideally, you should have created a single publisher in your development environment (avoid using the default one!). If you have multiple publishers, now is the time to decide which one you will use moving forward. Once a component is imported using a managed solution with a specific publisher, you cannot change the publisher for that component. Therefore, it's best to use only one publisher to allow for flexibility in changing the layering model across solutions later on. Keep in mind, this advice is only applicable if you are still working only with unmanaged solutions in your production environment when you started this process.
   - In your development environment, create a *single* unmanaged solution that is used to contain *all* customizated components. That includes tables, model-driven apps, forms, views, columns, charts, and dashboards you might have created, but also Microsoft components you might have changed. Incorporating all these components together in one solution can help reduce the chances of cross-solution layering issues that might occur using multiple solutions. More information: [Create a solution](/power-apps/maker/data-platform/create-solution)
      - For *unmanaged* tables, such as custom tables, you won't use table segmentation when you add the table to the solution. Instead, select **Include all objects** when adding those tables to the solution.
      - If there are *managed* tables, such as Microsoft tables that you've customized, [use table segmentation](/power-platform/alm/segmented-solutions-alm) when adding those tables to the solution. For example, if you've changed the display name for an existing column of a standard table, such as **Account** and **Contact**, use segmentation so you only export the customized components your project needs and not additional components that you don't need because already present in your target environment. To do this, choose **Edit object**, and then add only the components you have customized to the solution. More information: [Use table segmentation in solutions](/power-platform/alm/segmented-solutions-alm)
        > [!TIP]
        > To see if a managed component has been customized, look for an unmanaged layer that appears above the base managed layer of the component. More information: [View solution layers for a component](/powerapps/maker/data-platform/solution-layers#view-the-solution-layers-for-a-component)
4. Deploy the *single* managed solution in your target environment.
    1. We recommend that you first make this deploy in a copy of your production environment to use as validation. More information: [Copy an environment](../admin/copy-environment.md)
    1. Export the *single* solution from your development environment as *managed*. More information: [Export solutions](/powerapps/maker/data-platform/export-solutions)
    1. If there's an unmanaged solution in your target environment that has the same name as the managed solution you want to import, delete the unmanaged solution record in the target environment. To delete the unmanaged solution record, go to [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc), select the test or production environment, select **Solutions**, select the unmanaged solution, and then on the command bar, select **Delete**. Notice that deleting the unmanaged solution doesn't delete the solution's unmanaged components.
    1. Import the *single* managed solution into your target environment. More information: [Export solutions](/powerapps/maker/data-platform/import-solutions). 
5. Validate the target environment.
    1. There are various types of tests you can use to check whether specific functions or features of your app are working correctly. Some of these tests include unit tests, end-to-end, and user acceptance tests (UAT).
    2. Upon importing the managed solution, all unmanaged components have been converted to managed. The objective is to eliminate active layers in your target environment. Check if there are any components with an active layer. If you find any, it may be because you forgot to include them in the unmanaged solution in your development environment. In that case, return to your development environment, add the missing components, and redeploy the managed solution.

## Next steps

Now that you’ve moved to managed solutions, we recommend that you understand solution and component layering. Moreover, except for your development environments, there shouldn't be any unmanaged customizations or unmanaged solutions in your environments. More information: [Solution layers](solution-layers-alm.md)

### See also

[Scenario 5: Supporting team development](team-development-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
