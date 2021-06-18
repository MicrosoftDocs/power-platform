---
title: "Move from unmanaged to managed solutions to support healthy ALM with Power Apps"
description: "Learn how to move from unmanaged to managed solutions in your organization to support healthy application lifecycle management (ALM) with Power Apps."
keywords: 
author: Mattp123
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 05/03/2021
ms.reviewer: ""
ms.service: power-platform
ms.topic: "article"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---
# Scenario 3: Moving from unmanaged to managed solutions in your organization

This scenario aims at a situation where your production environment
contains several unmanaged solutions or your customizations were done in the default solution.

With the exception of your development environment, the end result is to only have managed solutions in your environments. More information: [Managed and unmanaged solutions](solution-concepts-alm.md#managed-and-unmanaged-solutions).

## Prerequisites
- Separate development and production environments. Additionally, we recommend that you also maintain at least one test environment that's separate from your development and production environments.
- Use a single publisher for all your solutions across all your environments. More information: [Solution publisher](solution-concepts-alm.md#solution-publisher)

<!-- You can take either of the unmanaged to managed conversion approaches described here.

## Small project conversions

For smaller, less complex projects, you can consolidate all your unmanaged solutions into a single unmanaged solution. Then, export the unmanaged solution as managed to import into your test and production environments. 

## Large or complex project conversions

Larger, more complex projects require the following tasks. -->

## Convert an unmanaged solution to managed

1. Identify and remove unnecessary tables and components.
   1. Create a back up of your production environment. You can bring back components through solution export and import that might be inadvertently deleted in the next step.
   1. Remove tables and components that are not needed from your production environment. For example, tables with no records or very old records or tables and components that have no dependencies. More information: [View dependencies for a component](/powerapps/maker/data-platform/view-component-dependencies)

2. Create a solution to use to convert components from unmanaged to managed.
   - In your development environment, create a *single* unmanaged solution that will be used to contain *all* Dataverse model-driven apps, tables, and dependant components, such as forms, views, fields, charts, and dashboards. Incorporating all of these components together can help reduce the chances of cross-solution layering issues that might occur later when you update or introduce new model-driven apps and customizations. More information: [Create a solution](/maker/data-platform/create-solution)
      - For unmanaged components, such as custom unmanaged tables, you won't use segmentation but will select **Include all components** when adding those components to the solution.
      - If there are *managed* components that you've customized, use segmentation when adding those components to the solution. For example, if you've added custom columns or charts to a Power Apps standard table, such as **Account** and **Contact**, use segmentation so you only export the customized components your project needs and not additional components that you don't intend to service. To do this, choose **Select components**, and then add only your customized components to the solution.
        > [!TIP]
        > To see if a managed component has been customized, look for an unmanaged active layer. More information: [View solution layers for a component](/powerapps/maker/data-platform/solution-layers#view-the-solution-layers-for-a-component)
   - If you have canvas apps, flows, portals apps, or plug-ins to convert, you can add them to a separate unmanaged solution now, or at a later time.
   - Remember to use a single publisher for all your solutions. More information: [Solution publisher](solution-concepts-alm.md#solution-publisher)
3. Deploy the managed solution.
    1. Make a copy of your production environment to use as a test environment. More information: [Copy an environment](/power-platform/admin/copy-environment)
    1. Export the unmanaged solution(s) from your development environment as *managed*. More information: [Export solutions](/powerapps/maker/data-platform/export-solutions)
    1. Delete the unmanaged solution(s) in your test environment. To do this, go to [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc), select the test or production environment, select **Solutions**, select the unmanaged solution, and then on the command bar, select **Delete**. Notice that deleting the unmanaged solution doesn't delete the solution's components.
    1. Import the managed solution into your test environment. More information: [Import solutions](/powerapps/maker/data-platform/import-update-export-solutions)
    1. There are various types of tests you can use to check whether specific functions or features of your app are working correctly. Some of these tests include unit tests, end-to-end, and user acceptance tests (UAT).
    1. After testing is completed and validated, repeat steps c-e, but instead of performing the step in your test environment perform the step in your *production* environment.
    1. If you have canvas apps, flows, or portals apps, import the managed solution(s) first into your test and then into your production environments in a similar fashion.

## Next steps

Now that you’ve moved to managed solutions, we recommend that you understand solution and component layering. Moreover, with the exception of your development environments, there shouldn't be any unmanaged customizations or unmanaged solutions in your environments. More information: [Solution layers](solution-layers-alm.md)

<!-- 8. Repeat steps 5-7 for any modular solutions that extend the common components layer.

    -   Create a copy of the original development environment, and remove the unmanaged solutions that hold references to the common components.

    -   Next, import a copy of a managed solution exported from the isolated base solution development environment to convert the unmanaged common
        components to managed. Doing so prevents the creation of cyclical dependencies and prevents solutions from becoming bloated with duplicate references to components.

    -   Considerations when importing a managed solution to convert unmanaged components to managed: 
        -   If components are held in unmanaged solutions that still exist in the environment, all references will have to be removed before the managed solution can be imported.

        -   Removing unmanaged solutions causes the loss of the reference container. Without a good understanding of what has been customized, you risk that components become orphaned in the default solution and possibly become hard to track.

    -   Converting solutions to managed in a development environment that's completely unmanaged effectively creates a snapshot of the current
        behavior. To prune unnecessary components that were added when multiple unmanaged solutions were developed in one environment, you need to remove the unneeded components in an isolated development environment.

        For example, assume the Customer entity is created in an unmanaged solution named *base*, then extended in another unmanaged solution. Any new components added to the Customer entity in the extension solution are automatically added to the *base* solution. This is the expected outcome, because when an entity is created the behavior is to include all assets and entity metadata. -->

###  See also

[Considerations](alm-considerations.md)

[Scenario 4: Supporting team development](team-development-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
