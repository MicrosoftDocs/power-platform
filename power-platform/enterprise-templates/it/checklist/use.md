---
title: Use the Checklist template for Power Platform
description: Learn how you can use the Checklist app for Microsoft Power Platform to streamline and automate managing your appointments.
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 01/07/2025
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
# customer intent: As a Checklist app user, I want to understand how to use the Checklist template for Power Platform.
---

# Get started using the Checklist app

There are two kinds of users who interact with the Checklist app:

- Checklist App – User
- Checklist App - Administrator

As an administrator, you use the Checklist app to:

- Create reports against the inventory and items you set up. The application automatically creates a report template based on the selected items and the template mapped to it in the reference data.

- Create a report template through the checklist form. The form provides access to each step and their sub-steps. You can selectively fill them in based on your reporting needs.

## Create reports

As an administrator, you create reports in the Checklist app.

1. On the *Home* screen, select **Start new report**.
1. On the *Start new report* screen, select an **inventory item** in the Inventory dropdown list to populate the Checklist category.
1. On the *Checklist item*, select an item in the dropdown list.
1. On the *Name*, type in the **title of the report**.
1. On the *Comment*, type in notes to provide users with more context on what the reports are intended to accomplish.
1. Select **Continue** to create a report based on the custom template that's mapped to the item you selected. Next, you're on the *Checklists Steps* screen to complete the report.

## Complete reports

As an administrator, you complete report details in the Checklist app. You can also save your work and go back later to the home screen to complete your report. On the *Report* screen, you complete each step of the report, taking note of key sections and their functions. Report details are located at the top of the screen. This section displays:

- **Report title**
- **Report comments**
- **Creation date**
- **Checklist item**
- **Report number**
- **Submitter**

It also shows you:

The *Navigation-Stepper* feature that appears on the left and lists all the steps needed to complete the report:

- **Step Number**: Step numbers look like, *Step 1* or *Step 2*.
- **Step Name**: Description located beneath the step number.
- **Step Status**: A read-only indicator that shows whether a step is *Not Started*, *In Progress*, *Skipped*, or *Completed*.

The *Step Attributes* that are located on the top right and include:

- **Step Status**: A dropdown menu to update or review the current status.
- **Comment**: A field for adding details or notes about the step.
- **Sub-Step**: A type of step located at the bottom of the step section, this includes:

  - **Sub-Step Navigation**: A dropdown menu to move between different sub-steps.
  - **Validation Details**: Controls for completing sub-steps, which vary by type:
    - **Attachment**: Attach images relevant to the sub-step.
    - **List**: Select from a list of options.
    - **Open Text**: Enter text as needed.
    - **Unit**: Input numerical values and select units for quantifiable sub-steps.

Take these steps to complete reports:

1. On the *Stepper*, select a step to work on and fill in the necessary step sections and sub-step sections. You are able to freely navigate through each of the steps and their sub-steps.
1. On each *step*, update the step status and the comment as needed.
1. On each *sub-step*, accomplish the required action depending on the validation type as follows:

    - **Attachment**: Select the **clip icon** and browse for an image to attach.
    - **List**: Select an item from the dropdown list.
    - **Open Text**: Type in the information required for the current sub-step.
    - **Unit**: Check sub-step instructions for what needs to be quantified and supply the value and the unit.

## Review the steps

Administrators review the steps. Take these steps:

1. On the *Report* screen, select **Review steps**.
1. On the *Review steps* screen, there are two sections:

   - **Skipped** is the section that shows the list of steps that have *skipped* status. You can navigate to each step as needed.
   - **In Progress** is the section that provides a list of steps that have an *In Progress* or *Not Started* status. You can navigate to each step as needed.
1. If you need to, select **Go back and edit** to go back to your last step before going to the *Review steps* screen.
1. When you are ready, select **Ready for review** to submit your report for review. Only select this if all the *In Progress* steps are complete.

### See also

[Manage the Checklist app](manage.md)
