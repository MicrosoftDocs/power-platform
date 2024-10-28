---
title: Use the Checklist template for Power Platform
description: Learn how you can use the Checklist app for Microsoft Power Platform to streamline and automate managing your appointments.
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 10/28/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Get started using the Checklist app

There are two kinds of users who interact with the Checklist app:

- Checklist App – User
- Checklist App - Administrator

As an administrator, you use the Checklist app to:

- Create reports against the inventory and item you set up. The application will automatically create a report template based on the selected item and the template mapped to it in the reference data.

- The created report template can then be accomplished through the checklist form, providing you access to each step(s) and their sub step(s) and selectively fill them in base on your reporting needs.

## Create reports

As an administrator, you can create reports in the Checklist app.

1. On the *Home* screen, select **Start new report**.
1. On the *Start new report* screen, select an item in the Inventory dropdown list to populate the Checklist category.
1. On the *Checklist item*, select an item in the dropdown list.
1. On the *Name*, type in the title of the report.
1. On the *Comment*, type in notes to provide users with more context on what the reports are intended to accomplish.
1. Select **Continue** to create a report based on the custom template that's mapped to the item you selected. Next, you are on the *Checklists Steps* screen to complete the report.

## Complete reports

As an administrator, you can complete report details. You can also save your work and go back later to the home screen to complete your report. On the *Report* screen, you complete each step of the report, taking note of key sections and their functions. Report Details are located at the top of the screen. This section displays:

- Report title
- Report comments
- Creation date
- Checklist item
- Report number
- Submitter

It also shows you:

- Navigation/Stepper: Positioned on the left, this feature lists all the steps needed to complete the report:
  - Step Number: Labeled as *Step 1*, *Step 2*, etc.
  - Step Name: Description located beneath the step number.
  - Step Status: A read-only indicator showing whether a step is Not Started, In Progress, Skipped, or Completed.

- Step Attributes: Found in the top right section, these include:
  - Step Status: A dropdown menu to update or review the current status.
  - Comment: A field for adding details or notes about the step.

- Sub Step: Located at the bottom of the step section, this includes:
  - Sub Step Navigation: A dropdown menu to move between different sub-steps.
  - Validation Details: Controls for completing sub-steps, which vary by type:
    - Attachment: Attach images relevant to the sub-step.
    - List: Select from a list of options.
    - Open Text: Enter text as needed.
    - Unit: Input numerical values and select units for quantifiable sub-steps.

Take these steps to complete reports:

1. On the Stepper, select a step you will work on and fill in the step section and sub-step section as required. You may freely navigate through each of the steps and their sub-steps.
1. On each Step, update the Step Status and the Comment as needed.
1. On each Sub-Step, accomplish the required action depending on the validation type as follows:

    - Attachment: Select the clip icon and browse for an image to attach.
    - List: Select an item from the dropdown list.
    - Open Text: Type in the information required for the current sub-step.
    - Unit: Check sub-step instruction for what needs to be quantified and supply the value and the unit.

## Review the steps

As an administrator, you will often need to review steps. Take these steps:

1. On the *Report* screen, select **Review steps**.
1. On the *Review steps* screen, you'll see two sections:

   - *Skipped* is the section that shows the list of steps that have *skipped* status. You can navigate to each step as needed.
   - *In Progress* is the section that provides a list of steps that have an *In Progress* or *Not Started* status. You can navigate to each step as needed.
1. If you need to, you can select **Go back and edit** to back to the last step you were at before going to the *Review steps* screen.
1. When you are ready, select **Ready for review** to submit your report for review. You can only select this if all the *In Progress* are complete.

### See also

[Manage the Checklist app](manage.md)
