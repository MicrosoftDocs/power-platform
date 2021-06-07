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

## Unmanaged to managed conversion tasks

1. Identify and remove unnecessary tables and components.
   - Look for tables that can be disabled in the environment. Tables can be disabled by removing all privileges on the table for all security roles except the system administrator security role. More information: [Security roles and privileges](/power-platform/admin/security-roles-privileges)
   - Here's some examples of tables that should be considered for removal:
      - Tables with no new records created within the last 18 months.
      - Tables and components that have no dependencies. More information: [View dependencies for a component](/powerapps/maker/data-platform/view-component-dependencies)
      - Components, such as forms, views, and charts, that are associated with deleted or unused tables and don't contain any data.

2. Create a solution to use to convert components from unmanaged to managed.
   - Use a single unmanaged solution that contains all Dataverse model-driven apps, tables, and dependant components, such as forms, views, fields, charts, and dashboards. More information: [Create a solution](/maker/data-platform/create-solution)
   - If you have canvas apps or portals to convert, add them to a separate unmanaged solution.
3. Add unmanaged and managed tables from production into the development environment.
   - If there are components in the production environment that aren't in the development environment, add the components into an unmanaged solution created in the production environment.
   - Select **All components** when exporting custom tables that don't exist in the development environment.
   - For most other components, use the **Select components** option during export to select only those components that don't already exist in the development environment. More information: [Use segmented solutions](/power-platform/alm/segmented-solutions-alm)  <!-- not sure about this step -->
   - Import the unmanaged solution into the development environment.

4. Export the unmanaged solution(s) as managed. More information: [Export solutions](/powerapps/maker/data-platform/export-solutions)
5. Delete the unmanaged solution in your test and production environments. To do this, go to [Power Apps](https://make.powerapps.com/?utm_source=padocs&utm_medium=linkinadoc&utm_campaign=referralsfromdoc) > **Solutions** > select the unmanaged solution, and then on the command bar, select **Delete**.
6. Test the managed solution. 
    - The test environment should be as similar to the production environment as possible. A sandbox copy of the production environment is usually best. More information: [Copy an environment](/power-platform/admin/copy-environment)
   - Import the managed solution into your test environment. More information: [Import solutions](/powerapps/maker/data-platform/import-update-export-solutions)
   - There are various types of tests you can use to check whether specific functions or features of your app are working correctly. Some of these tests include unit tests, end-to-end, and user acceptance tests (UAT). For canvas apps, consider using [Test Studio](/powerapps/maker/canvas-apps/test-studio).

7. After testing is completed and validated, import the managed solution into your production environment.

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

## Limitations
 
-   In the second approach, it can be very time-consuming to remove components
    to isolate the base solution or modular solutions. It can be a challenge to determine where dependencies reside and how best to remove them.

-   It's difficult to migrate to a managed solution and
    develop a final solution architecture at the same time. Consider breaking the migration into phases such as moving to managed solutions, then establishing a new solution architecture. Isolated development is needed first to effectively create layered solutions.


###  See also

[Considerations](alm-considerations.md)

[Scenario 4: Supporting team development](team-development-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
