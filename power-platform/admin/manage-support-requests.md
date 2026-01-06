---
title: Manage support requests
description: To obtain support and resolve issues, you can submit, view, and manage your support requests in the Power Platform admin center.
author: johnehart
ms.component: pa-admin
ms.topic: how-to
ms.date: 01/06/2026
ms.subservice: admin
ms.author: johhar 
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Manage support requests

To obtain support and resolve issues, you can submit, view, and manage your support requests in the Power Platform admin center. You can see active and resolved requests, details about each request, communications history, and manage advanced diagnostic consent.

> [!NOTE]
> Resolved support requests are retained for up to 18 months.

## View support requests in the Power Platform admin center

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Select **Support** in the navigation pane.

1. Search, sort, and filter the list of support requests by **Status**, **Created by**, among other data.

    - **Status:** Show either open, closed, or all service requests.

    - **Created by:** Show tickets created by you or others for your tenant.

    - **Limit:** Govern how many service requests are shown in the list.

    - **Search:** Filter by keyword to find the support request you are looking for.

      > [!NOTE]
      > This doesn't search the contents of support requests.

    - **Export to Excel:** Download the list of service requests for offline use.
    
    - **Actions menu:** If needed, select the "**…**" after the **Issue title** column to open the menu and choose an available action:

      - **Edit:** Launches the edit panel to quickly manage support request attributes. See [Edit support requests](#editing-support-requests) for details.
          
      - **Close support request:** Select to close the support request. Select a reason for closure and confirm the request. Once closed, requests can't be reopened. If a request is closed but the issue remains, create a new support request.

1.  Select the **Issue title** link to view the details page for the selected support request.

## Support request details

A support request's details page contains information about the support request, such as tile and description, current state and consent status, severity, categorization, contact details, attachments, and communication history. The actions ribbon at the top of the details page list available actions such as **Edit**, **Close support request**, and **Open chat** (see [Live chat with persistence](/power-platform/admin/live-chat-support) for details).

:::image type="content" source="media/support-request-details.png" alt-text="Screenshot of the support request details page showing metadata, communications history, and available actions.":::

### Support request metadata

A subset of details about the support request is made available in the support request details page, some of which can be edited, such as consent status and contact details.

- **State:** Current state of the support request. As Microsoft support triages and acts on your request, this state will update.

- **Consent:** Sets consent state for advanced diagnostics. This setting governs whether Microsoft support can access your data to troubleshoot your issue. This state can be updated by editing the support request. A Microsoft representative may ask you to update this state as part of troubleshooting the support request. See [Support environments and consent to access customer data](/power-platform/admin/support-environment) for details.

- **Created on:** When the case was created.

- **Created by:** The username who created the case.

- **Issue description:** The details about the issue, as provided by the creator on submission.

- **Additional details:** Shows severity and categorization details, as well as any attachments.

  - **Service level:** The level of support plan governing the support request.

  - **Service:** The application or service for the support request.

    > [!NOTE]
    > Microsoft support may update this value as root cause of the issue is better understood.

  - **Problem type and subtype:** Categorization which helps Microsoft route and triage the request and provides visibility to responsible engineering teams.

  - **Severity:** This value governs and sets SLA and expectations for both Microsoft and the submitting customer. See "[Severity and responsiveness](support-overview.md#severity-and-responsiveness)" for details.

  - **Attachments:** Any file submitted as part of the case. It's not possible to update attachments from the admin center. To manage attachments, contact Microsoft support as part of the support request engagement.

- **Communications history:** Contains all email communications history between the submitting user and Microsoft for the support request.

- **Contact information:** Contact details and preferences. This value can be updated by editing the support request.

## Editing support requests

Some details about a support request can be edited in the Power Platform admin center, such as [advanced diagnostic consent](support-environment.md) and contact details. To edit a support request:

- **Support request list:** Select the “**…**” after the **Issue title** column to open the menu and choose **Edit**. The **Edit support request** pane is displayed on the right side of the page.

- **Support request details page:** Choose **Edit** from the actions ribbon at the top of the support request details page.

When you have made your changes, select **Save** at the bottom of the pane. To cancel any changes or close the pane, either select the **X** at the top-right of the pane, or select **Cancel** at the bottom of the pane.

:::image type="content" source="media/edit-support-request.png" alt-text="Screenshot of the Edit support request panel showing editable fields and Save and Cancel buttons.":::

