---
title: "Create and manage duplicate detection rules using solutions"
description: "Learn about how you can create and manage duplicate detection rules using solutions."
author: KumarVivek
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/26/2023
ms.subservice: admin
ms.author: gned
ms.reviewer: kvivek
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
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

- When a rule condition is added through active layer customizations and if for existing condition, two fields,"no of characters" and "ignore blank values" have changed through solution import, then the system will overwrite the existing row. However, if any fields other than these two fields have been changed in the existing condition then new rule condition will be added instead of overwriting the existing row.  

- If rule conditions are inserted through the previous versions of the same solution, then the system will overwrite the existing condition.

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

[!INCLUDE[footer-include](../includes/footer-banner.md)]
