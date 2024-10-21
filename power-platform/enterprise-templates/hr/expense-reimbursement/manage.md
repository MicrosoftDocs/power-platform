---
title: Get started managing the Expense Reimbursement program
description: Learn how to manage expense reimbursements in the Expense Reimbursement Admin model-driven app for Microsoft Power Platform.
author: tverhasselt
contributors:
  - microsoft-george
  - nghiemdoan-msft
  - EllenWehrle
ms.author: thoverh
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 06/13/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Get started managing the Expense Reimbursement program

As a program administrator, you can use the Expense Reimbursement Admin app to manage your organization's Expense Reimbursement program. You can:

- Create custom refund programs
- Create custom categories and subcategories
- Set expense and reimbursement request limits
- Support more languages
- View error logs
- Use Microsoft Teams to approve requests

## Create custom refund programs

Create as many refund programs as you need for your organization's Expense Reimbursement program. Users select the applicable refund program from a dropdown on the _New Request_ screen.

:::image type="content" source="media/manage/exre-admin-programs.png" alt-text="Screenshot showing Expense Reimbursement program administration screen.":::

Take these steps to create types of refund programs:

1. Start the Expense Reimbursement Admin model-driven app.
1. Under _Administration_, select **Refund Programs**.
1. Select **+New**.
1. Fill out these fields for the new refund program:

    - Refund Program name
    - Approvers (admins who review and approve reimbursement requests)
    - Description
1. Select **Save**.
1. Repeat the process until all the refund programs you want are set up.

> [!NOTE]
>
> For the _Approvers_ field, you can also specify a team of approvers. Go to [Microsoft Dataverse teams management](/power-platform/admin/manage-teams) for more details on managing teams in your organization.

## Create custom categories and subcategories

Create as many categories and subcategories you need within each refund program you set up for your organization's Expense Reimbursement program. Users select the applicable categories and subcategories from dropdowns on the _New Request_ screen.

### Create categories

Take these steps to create categories for each refund program you set up:

1. Go to the Expense Reimbursement Admin model-driven app.
1. Under _Administration_, select **Categories**.
1. Select **+New**.
1. Fill out the _Category Name_.
1. Select **Save**.

### Create subcategories

Take these steps to create subcategories that fit into refund program categories:

1. Go to the Expense Reimbursement Admin model-driven app.
1. Under _Administration_, select **Subcategories**.
1. Select **+New**.
1. Fill out _Subcategory Name_.
1. Select **Save**.

## Set expense and reimbursement limits

Set expense and reimbursement request limits in App Settings. Take these steps:

1. Go to the Expense Reimbursement Admin model-driven app.
1. Under _System_, select **App Settings**.
1. Select **+New**.
1. Fill out the settings name and enter the expense and reimbursement amount limits.
1. Select **Save**.

## Support more languages

You can localize all strings in the Expense Reimbursement app to support the diverse set of languages that may be spoken at your organization. The app contains default strings for all text, but checks to see if there's a localized version in the Employee Experience Base Localization table that's installed alongside the Expense Reimbursement solution. The Employee Experience Base solution and the Expense Reimbursement solution are accessed together from AppSource.

To localize app strings, users must have the **Employee Experience Template Admin** security role assigned to them by a Power Platform admin. Once assigned, a user can take these steps:

1. Go to the **Employee Experience Template Administrator app**.
1. Select **Localizations** on the left pane.
1. Select **+New**.
1. Fill out the form:

    - **English Value**. The text (value) in the app that you replace
    - **Language**. The language you are translating into
    - **Localized Value**. The translated string you set up
    - **String Type**. The type of string you're replacing or filter you can apply. This field is optional

1. Select **Save & Close**.

## View error logs

You can view errors in the Expense Reimbursement Administrator model-driven app.

Take these steps to view errors:

1. Go to the Expense Reimbursement Admin model-driven app.
1. Under _Administration_, select **Errors**.
1. Select an item in the _Name_ column to view the error details.

### Next step

[Get started using the Expense Reimbursement app](use.md)
