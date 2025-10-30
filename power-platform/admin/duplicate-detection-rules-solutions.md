---
title: "Create and manage duplicate detection rules using solutions"
description: "Learn about how you can create and manage duplicate detection rules using solutions."
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 03/28/2023
ms.subservice: admin
ms.author: gned
ms.reviewer: sericks
---
# Create and manage duplicate detection rules using solutions

Users can create duplicate detection rules in a solution in a Power Platform environment, export the solution, and import the solution into another environment to create the same rules in the target environment instead of manually creating it in the target environment.

More information about solutions: [Solution concepts](/power-platform/alm/solution-concepts-alm)

## Guidelines for using solutions for duplicate detection rules  

- When a rule is imported as part of a solution, the rule will be in the unpublished state where it's imported. You must publish the rule after the import.

- Use the same solution to import and export rules across environments, and use the [solution upgrade](/power-apps/maker/data-platform/update-solutions) feature while importing the solution.

- Don't import a rule that doesn't have any changes (edits) because it will unnecessarily unpublish the rule in the target environment and you'll need to manually publish it. Publishing is an expensive activity.

- We recommend using the [Overwrite customizations](/power-apps/maker/data-platform/update-solutions#overwrite-customizations-option) option while doing solution upgrades.

- Introduce new conditions on existing rules through solution import only.  

- When a rule condition is added through active layer customizations and if for existing condition, two fields, **No of characters** and **Ignore blank values** have changed through solution import, then the system will overwrite the existing row. However, if any fields other than these two fields have been changed in the existing condition then new rule condition will be added instead of overwriting the existing row.  

- If rule conditions are inserted through the previous versions of the same solution, the system will overwrite the existing condition.

- We recommend publishing and unpublishing rules only on the target environment.

- Remove active customization feature isn't supported for duplicate detection table.

- Always use one type of solution (managed or unmanaged) on one environment. This is because if, for example, you install managed solutions on top of unmanaged solution, instead of overwriting the rules conditions introduced through unmanaged solution, the solution import will create new rows.

- Always verify rule conditions before publishing it. If at all the conditions aren't as expected after solution import, contact [Microsoft Support](/power-platform/admin/get-help-support).

- Select **Add Required components** after editing the rule directly through solution explorer itself.

- Removing the rule from solution isn't supported. If you want to delete the rule, you should first delete the rule through duplicate detection rules section from source environment itself, export the solution, and then import the solution using solution upgrade. Only then the rule can be deleted.

- Updating the base and matching table isn't supported out of box once created. Similarly, it isn't supported in solution framework. If you want to update base and matching table for existing rule, recommendation is to create new rule with new name.

- Add or insert rule conditions only through managed solution.

- As per solution framework design, deletion isn't possible through unmanaged solution.

- The solution export and import is possible only across environments having the same language.

## Create a duplicate detection rule using solution

To create a duplicate detection rule, you must create a separate solution for the rule and maintain the solution for the rule related changes.

1. Create a duplicate detection rule in your environment.

    1. Sign in to the [Power Platform admin center](https://aka.ms/ppac).

    1. Select your environment where you want to create the rule, and select **Settings** > **Data management** > **Duplicate detection rules**.

        :::image type="content" source="media/dup-detection-rule.png" alt-text="Create or manage duplicate detection rule":::

    1. Follow steps 4-7 in the [Set up duplicate detection rules to keep your data clean](set-up-duplicate-detection-rules-keep-data-clean.md) article to create a duplicate detection rule.

1. Create a solution and add the rule to the solution.

    1. Sign in to [Power Apps](https://make.powerapps.com/) and select the environment from the environment picker in the top-right where you created your duplicate detection rule.

    1. In the left navigation pane, select **Solutions**, and then select **New solution**. For details about creating a solution, go to [Create a solution](/power-apps/maker/data-platform/create-solution).

    1. After you’ve created your solution, add the duplicate detection rule you created earlier to the solution. With the solution open, select **Add existing** > **More** > **Other** > **Duplicate Detection Rule**.

    1. From the list of available rules, select the rule you want to add to the solution, and select **Add**.

    1. Select the rule you added, and then select **Advanced** > **Add required objects**.

        :::image type="content" source="media/add-req-obj.png" alt-text="Add required objects for the rule":::

    1. Select **Publish all customizations** to publish the solution.

1. Select the solution and export it as a **managed** solution. More information: [Export solutions](/power-apps/maker/data-platform/export-solutions).

1. In Power Apps, select the target environment from the environment picker on the top right where you want to import the solution to create the duplicate detection rule.

1. In the left navigation pane, select **Solutions**, and then select **Import solution**. More information: [Import solutions](/power-apps/maker/data-platform/import-update-export-solutions).

1. Verify that the rules are created in the target environment.

    1. Sign in to the [Power Platform admin center](https://aka.ms/ppac).

    1. Select your environment where you imported the solution, and select **Settings** > **Data management** > **Duplicate detection rules**.

    1. You'll see your rule in unpublished state. Open the rule definition to verify if it contains all the configurations and conditions that you defined earlier. Publish the rule to use it.

## Add or delete existing rule conditions using solution

To add new rule conditions or delete existing rule conditions by importing a solution, you must use the same solution that was used for creating the duplicate detection rule.

1. Sign in to the [Power Platform admin center](https://aka.ms/ppac).

1. Select your source environment where you originally created the rule, and select **Settings** > **Data management** > **Duplicate detection rules**.

1. Open the duplicate detection rule, and add new rule conditions or delete existing rule conditions as required. Save the rule.

1. Sign in to [Power Apps](https://make.powerapps.com/) and select the source environment from the environment picker in the top-right.

1. In the left navigation pane, select **Solutions**, and then select your solution that contains the duplicate detection rule you edited.

1. Select the rule you edited, and then select **Advanced** > **Add required objects**.

1. Increment the solution version number (for example, change from 1.0 to 1.1) and save the solution.

1. Select **Publish all customizations** to publish the solution.

1. Select the solution and export it as a **managed** solution. More information: [Export solutions](/power-apps/maker/data-platform/export-solutions).

1. Import the solution in the target environment and select **Overwrite customizations** under **Import Options**. More information: [Import solutions](/power-apps/maker/data-platform/import-update-export-solutions)

1. Verify that the rule is updated in the target environment.

    1. Sign in to the [Power Platform admin center](https://aka.ms/ppac).

    1. Select your environment where you imported the solution, and select **Settings** > **Data management** > **Duplicate detection rules**.

    1. You'll see your rule in unpublished state. Open the rule definition to verify if it contains all the rule condition changes you made earlier. Publish the rule to use it.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
