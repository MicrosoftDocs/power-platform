---
title: Use the Checklist App for Power Platform
description: Learn how you can use the Checklist App for Microsoft Power Platform to to create, complete, and review reports.
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 01/09/2025
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
# customer intent: As a Checklist app user, I want to understand how to create, complete, and review reports in the Checklist App for Power Platform.
---

# Get started using the Checklist App

You use the Checklist App to create inventory reports. The app can automatically generate a report based on the item you select and the template that's mapped to it.

This article gives you the steps to create, complete, and review reports.

:::image type="content" source="media/use/ca-start-new-report.png" alt-text="Screenshot of Checklist App's Start a new report screen.":::

## Create reports

Reports are created on the Checklist App's home screen.

Take these steps to create reports in the Checklist App:

1. On the *Home* screen, select **Start new report**.
1. On the *Start new report* screen, select an inventory item in the Inventory dropdown list to populate the Checklist category.
1. On the *Checklist item*, select an item in the dropdown list.
1. On the *Name*, type in the title of the report.
1. On the *Comment*, type in notes to provide users with more context.
1. Select **Continue** to create a report and move on to the *Reports* screen so you can complete the report.

## Learn about Reports screen sections

The Checklist App offers several capabilities to help you easily complete reports on the reports screen. For instance, you can skip and revisit steps as needed and save your work so you can complete your report at a later time. Take the time to learn what's on the Reports screen by taking note of key sections and their functions.

:::image type="content" source="media/use/ca-reports-screen.png" alt-text="Screenshot of the Checklist App's Reports screen.":::

### Report details section

The key report details you need to track each report are located at the top of the screen. This section displays:

- **Report title**
- **Report comments**
- **Creation date**
- **Checklist item**
- **Report number**
- **Submitter**

### Step section

The step navigation section is on the left of the Reports screen and lists all the steps needed to complete the report. This section features:

- **Step Number**: A link that shows each step number.
- **Step Name**: A field for adding the step description.
- **Step Status**: A read-only indicator that shows whether a step is *Not Started*, *In Progress*, *Skipped*, or *Completed*.

### Step attributes section

The *Step Attributes* section is on the top-right of the Reports screen and includes:

- **Step Status**: A dropdown menu to update or review the current status.
- **Comment**: A field for adding details or notes about the step.
- **Sub-step**: A type of step located at the bottom of the step section. A sub-step includes:

  - **Sub-step Navigation**: A dropdown menu to move between different sub-steps.
  - **Validation Details**: Controls for completing sub-steps, which vary by type:
    - **Attachment**: Attach images relevant to the sub-step.
    - **List**: Select from a list of options.
    - **Open Text**: Enter text as needed.
    - **Unit**: Input numerical values and select units for quantifiable sub-steps.

## Complete Reports

Once you review the Reports screen, you're ready to take these steps to complete reports:

1. In the *step navigation* section, select a step to work on and fill in the necessary step sections and sub-step sections. You're able to freely navigate through each of the steps and their sub-steps.
1. On each *step*, update the step status and the comment as needed.
1. On each *sub-step*, accomplish the required action depending on the validation type as follows:

    - **Attachment**: Select the **clip icon** and browse for an image to attach.
    - **List**: Select an item from the dropdown list.
    - **Open Text**: Type in the information required for the current sub-step.
    - **Unit**: Check sub-step instructions for what needs to be quantified and supply the value and the unit.

## Review steps

Before you submit your report it's important to take time to review it. Take these steps to complete the review process:

1. On the *Report* screen, select **Review steps**.
1. On the *Review steps* screen, there are two sections:

   - **Skipped** is the section that shows the list of steps with a *skipped* status. You can go to each step as needed.
   - **In Progress** is the section that provides a list of steps that have an *In Progress* or *Not Started* status. You can go to each step as needed.
1. If you need to, select **Go back and edit** to go back to your last step before going to the *Review steps* screen.
1. Select **Ready for review** once all the steps are complete and you are ready to submit your report for review.

### See also

[Manage the Checklist app](manage.md)
