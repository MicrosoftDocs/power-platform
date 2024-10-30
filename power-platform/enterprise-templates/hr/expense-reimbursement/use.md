---
title: Get started using the Expense Reimbursement apps
description: Learn how to use the Reimbursement Request app and the Expense Reimbursement Admin app on Microsoft Power Platform.
author: microsoft-george
contributors:
  - tverhasselt
  - nghiemdoan-msft
  - EllenWehrle
ms.author: georgenewton
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 06/13/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Use the Expense Reimbursement apps

Two apps are part of the Expense Reimbursement solution:

- Reimbursement Request canvas app for employees
- Expense Reimbursement Admin model-driven app for program managers or admins

Once the install and setup steps are complete, the apps are ready to share and use.

## Use the Reimbursement Request app

As an employee, you can submit and view your expense reimbursement requests to your organization in the Reimbursement Request
canvas app.

Take these steps to submit an expense reimbursement request:

1. Sign in to the Expense Reimbursement canvas app.
1. On the _My requests_ screen, select **New request**.
1. On the _New request_ screen, complete these fields:
    1. Request Name
    1. Program
    1. Category
    1. Subcategory
    1. Currency

:::image type="content" source="media/use/exre-new-request.png" alt-text="Screenshot of the New request screen in the Reimbursement Request app.":::

### Add image of expense receipt

Expense requests require documentation of the expense. Take these steps to add an image of the expense receipt and update any file information.

1. On the _My requests_ screen, select **Add expense**.
1. On the first _Add expense_ screen, select how you will share an image of your receipt. These are your options:
    1. **Capture** enables you to open up your device's camera to allow you to take a picture of the receipt.
    1. **Scan** obtains the receipt details from an image you select on your device using the app's built-in scanner.
    1. **Attach** opens your device's file system so you can browse for the image of your expense.
1. On the second _Add expense_ screen, attach a file or capture a picture, depending on your selection on the first _Add expense_ screen.
:::image type="content" source="media/use/exre-attach.png" alt-text="Screenshot showing selection of Badges.":::
1. On the third _Add expense_ screen, add any necessary information. These are the fields:
    1. Attachment file name
    1. Expense date
    1. Merchant name
    1. Amount
    1. Description
1. Select **Done** to complete the _Add expense_ step.
1. Select **Submit**. This triggers the _New Request for Refund Notification_ flow that sends an email to the approver and to you stating that the expense reimbursement request has been submitted and is ready for review.

### View Expense Reimbursement requests

Once you have submitted an expense request, you can view the status of the request in the Reimbursement Request canvas app.

On the _My requests_ screen, select the _number_ of the reimbursement request you want to view. This takes you to the _View request_ screen.

:::image type="content" source="media/use/exre-underreview-ed.png" alt-text="Screenshot of the Reimbursement Request app's View request screen. It shows the request number, request name, program name, category, subcategory, currency, created-on date and expense details.":::

## Use the Expense Reimbursement Administrator app

As an expense reimbursement program manager, you can access the Expense Reimbursement Administrator model-driven app to review and process requests.

### Process expense requests

In the Expense Reimbursement Administrator app, take these steps to view expense reimbursement request details and process the requests:

1. Select **Requests** on the left pane to view a list of all reimbursement requests.
1. Select a _request number link_ to view more details about a specific request. On this page many links, such as the request's receipt, are available to select and review.

    :::image type="content" source="media/use/exre-admin-view.png" alt-text="Screenshot of the Reimbursement Request Administrator app's request number detail screen. It shows the request number and expense details to a program manager.":::

1. Select **Review** to mark the approval status and make a comment about the status of the expense reimbursement request.
1. Select **Payment** to record the payment status of the expense reimbursement request.
1. Select **Complete** to record the date the expense reimbursement request process is complete.
1. Select **Save** or **Save & Close** after you make updates.

### View the dashboard

The Expense Reimbursement Administrator model-driven app provides a dashboard viewing experience to help you easily manage the expense reimbursement program.

:::image type="content" source="media/use/exre-admin-dashboard.png" alt-text="Screenshot of the Reimbursement Request Administrator app's dashboard screen. It shows many different details to the program manager.":::

You can view reimbursement requests by date and status. You can also see the dollar amounts by programs and program categories to help you track expenses.

### See also

[Manage the Expense Reimbursement app](manage.md)
