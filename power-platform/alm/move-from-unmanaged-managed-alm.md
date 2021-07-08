---
title: "Move from unmanaged to managed solutions to support healthy ALM with Power Apps"
description: "Learn how to move from unmanaged to managed solutions in your organization to support healthy application lifecycle management (ALM) with Power Apps."
keywords: 
author: Mattp123
ms.subservice: alm
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

This scenario addresses a situation where your production environment contains several unmanaged solutions or your customizations were made in the default solution. The tasks described here show you how to convert all of your unmanaged model-driven app components to managed using a single solution that will be used to create a single managed layer in your test and production environments. Later, you may want create additional solutions to develop different layering strategies and dependencies between solutions.

With the exception of your development environment, the end result is to only have managed solutions in your environments. More information: [Managed and unmanaged solutions](solution-concepts-alm.md#managed-and-unmanaged-solutions).

## Prerequisites
- Separate development and production environments. Additionally, we recommend that you also maintain at least one test environment that's separate from your development and production environments.
- Use a single publisher for all your solutions across all your environments. More information: [Solution publisher](solution-concepts-alm.md#solution-publisher)

## Convert an unmanaged solution to managed

1. Identify and remove unnecessary tables and components.
   1. Create a back up of your production environment. You can bring back components that might be inadvertently deleted through solution export and import in the next step.
   1. Remove tables and components that are not needed from your production environment. For example, consider deleting tables with no records or very old records, or tables and components that have no dependencies. More information: [View dependencies for a component](/powerapps/maker/data-platform/view-component-dependencies)

2. Create a solution to use to convert components from unmanaged to managed.
   - In your development environment, create a *single* unmanaged solution that will be used to contain *all* Microsoft Dataverse model-driven apps, tables, and dependant components, such as forms, views, fields, charts, and dashboards. Incorporating all of these components together can help reduce the chances of cross-solution layering issues that might occur later when you update or introduce new model-driven apps and customizations. More information: [Create a solution](/maker/data-platform/create-solution)
      - For *unmanaged* components, such as custom unmanaged tables, you won't use segmentation but will select **Include all components** when adding those components to the solution.
      - If there are *managed* components that you've customized, use segmentation when adding those components to the solution. For example, if you've added a custom column or changed the display name for an existing column to a Power Apps standard table, such as **Account** and **Contact**, use segmentation so you only export the customized components your project needs and not additional components that you don't intend to service. To do this, choose **Select components**, and then add only your customized components to the solution.
        > [!TIP]
        > To see if a managed component has been customized, look for an unmanaged layer that will be above the the base managed layer of the component. More information: [View solution layers for a component](/powerapps/maker/data-platform/solution-layers#view-the-solution-layers-for-a-component)
   - If you have canvas apps, flows, portals apps, or plug-ins to convert, you can add them to a separate unmanaged solution now, or at a later time.
   - Remember to use a single publisher for all your solutions. More information: [Solution publisher](solution-concepts-alm.md#solution-publisher)
3. Deploy the managed solution.
    1. If you have an existing test environment you can go to the next step. However, we recommend that you make a copy of your production environment to use as the test environment. More information: [Copy an environment](/power-platform/admin/copy-environment)
    1. Export the unmanaged solution(s) from your development environment as *managed*. More information: [Export solutions](/powerapps/maker/data-platform/export-solutions)
    1. If there's an unmanaged solution in your test environment that has the same name as the managed solution you want to import, delete the unmanaged solution record in the test environment. To delete the unmanaged solution record, go to [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc), select the test or production environment, select **Solutions**, select the unmanaged solution, and then on the command bar, select **Delete**. Notice that deleting the managed unmanaged solution doesn't delete the solution's unmanaged components.
    1. Import the solution into your test environment using [Power Platform CLI](/powerapps/developer/data-platform/powerapps-cli#solution) solution import commanding with the *convert-to-managed* parameter or the [DevOps tooling](devops-build-tool-tasks.md#solution-tasks) solution import task. Currently, you can't successfully import the solution and convert all components to managed using the Power Apps portal.
    1. There are various types of tests you can use to check whether specific functions or features of your app are working correctly. Some of these tests include unit tests, end-to-end, and user acceptance tests (UAT).
    1. After testing is completed and validated, repeat steps c-e, but instead of performing the step in your test environment perform the step in your *production* environment.
    1. If you have canvas apps, flows, or portals apps, import the managed solution(s) first into your test and then into your production environments in a similar fashion as described above.

## Next steps

Now that you’ve moved to managed solutions, we recommend that you understand solution and component layering. Moreover, with the exception of your development environments, there shouldn't be any unmanaged customizations or unmanaged solutions in your environments. More information: [Solution layers](solution-layers-alm.md)

### See also

[Scenario 4: Supporting team development](team-development-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
