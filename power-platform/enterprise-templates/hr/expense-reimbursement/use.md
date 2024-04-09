---
title: Use the Expense Reimbursement template for Power Platform
description: Learn how to use the Expense Reimbursement app for Microsoft Power Platform.
author: microsoft-george
ms.author: georgenewton
contributors:
  - tverhasselt
  - nghiemdoan-msft
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 01/08/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Use the Expense Reimbursement app

You can submit and view your expense reimbursement requests to your organization in the Expense Reimbursement canvas app.

## Submit a new expense reimbursement request

Take these steps to submit an expense reimbursement request:

1. Go to the Expense Reimbursement canvas app.
1. On the _My requests_ screen, select **New request**.
1. On the _New request_ screen, complete these fields:
    1. Request Name
    1. Program
    1. Category
    1. Subcategory
    1. Currency

## Add image of expense receipt

Take these steps to add an image of the expense receipt and update any file information.

1. Select **Add expense**.
1. On the first _Add expense_ screen, select how you will share an image of your receipt. These are your options:
    1. Capture. The app opens up your device's camera to allow you to take a picture of the receipt.
    1. Scan. The app's built-in receipt scanner obtains the receipt details from an image you select on your device.
    1. Attach. The app opens your device's file system so you can browse for the image of your expense.
1. On the second _Add expense_ screen, attach a file or capture a picture, depending on your selection on the first _Add expense_ screen.
1. On the third _Add expense_ screen, add any necessary information. These are the fields:
    1. Attachment file name
    1. Expense date
    1. Merchant name
    1. Amount
    1. Description
1. Select **Done** to complete the _Add expense_ step.
1. Select **Submit**. This triggers the _New Request for Refund Notification_ flow that sends an email to the approver and to you stating that the expense reimbursement request has been submitted and is ready for review.
