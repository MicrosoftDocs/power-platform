---
title: Notifications for Business & Industry Copilot services
description: Learn about the different ways that you can receive notifications for Business & Industry Copilot services. 
ms.component: pa-admin
ms.topic: concept-article
ms.date: 06/24/2025
ms.subservice: admin
ms.author: kacortez
author: kacortez
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Notifications for Business & Industry Copilot services

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Microsoft regularly sends communications about upcoming changes, including new and changed features, planned maintenance, or other important announcements. These communications primarily go through the Microsoft 365 Service health dashboard and Message center. Occasionally, we send direct email communications to admins.

## Message center
Admins can use the Microsoft 365 [Message center](/office365/admin/manage/message-center?view=o365-worldwide&preserve-view=true) to keep track of upcoming changes, including new and changed features, planned maintenance, or other important announcements. Admins can set [email preferences](/microsoft-365/admin/manage/message-center?view=o365-worldwide&preserve-view=true#preferences) for Message center posts.

### Prerequisites
Before you begin, be sure that you have sufficient permissions. Most users who have been assigned any admin role in Microsoft 365 can view Message center posts. Here's [a list](/microsoft-365/admin/manage/message-center?view=o365-worldwide&preserve-view=true#admin-roles-that-dont-have-access-to-the-message-center) of admin roles that **don't** have access to the Message center. The **Message center reader role** can be assigned to users who should be able to read and share Message center posts without having any other admin privileges.

### Set up a weekly digest email for Message center notifications
1. Log in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. In the navigation pane, select **Admin centers**.
3. Select **Microsoft 365**.
4. Expand **Health** and select **Message Center**.
5. On the page that loads, select **Preferences**.
6. A flyout appears on the right, select the **Email** tab.
7. Make sure the email notification settings are as expected. You can select **Other e-mail addresses** if you want the digest to be sent to different users or a shared mailbox.
8. Select the **Send me a weekly digest about services I select** box, and select the services you wish to receive information about.
9. Press **Save**.

## Service health dashboard

The [Service health dashboard](/office365/enterprise/view-service-health) shows the health status of your Microsoft cloud services. Learn how to open the Service health dashboard in the [Microsoft 365 admin center](check-online-service-health.md#view-service-health-information-in-the-microsoft-365-admin-center).

Service health communications in the Microsoft 365 admin center are limited to specific admin roles. [Assign admin roles](/microsoft-365/admin/add-users/assign-admin-roles?view=o365-worldwide&preserve-view=true) that have permission to view service health, and review them regularly to stay current about the latest service health information.

Sometimes, Microsoft might have to notify you about issues that're occurring in your Managed Environment, when action by an admin or user in your organization is required to fix those issues. These communications appear in the **Issues in your environment that require action** section of the **Service health** page. [Learn about Microsoft 365 monitoring](/microsoft-365/enterprise/microsoft-365-monitoring?view=o365-worldwide&preserve-view=true).

## Service health in the Power Platform admin center

You can view service health information for Dynamics 365 and Power Platform products in the Power Platform admin center.

## [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a Dynamics 365 admin or Power Platform admin.
1. In the navigation pane, select **Support**. 
1. In the **Support** pane, select **Service health**. 

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a Dynamics 365 admin or Power Platform admin.
1. In the navigation pane, select **Help + support**. 
1. Select the **Service health** tab.
---

Learn more in [View service health](view-service-health.md).

## Ad-hoc email service notifications

The following table lists the services that the Business & Industry Copilot communications team sends ad-hoc notifications for. The table lists the email address that is used to send email notifications for each service. Be sure to check your spam folder for these messages.

| Service | Email address that notifications are sent from |
|---|---|
| Microsoft Dynamics 365 apps | `msdynamics365@microsoft.com` |
| Microsoft Dynamics 365 finance and operations apps | `msdyn365finops@microsoft.com` |
| Microsoft Power Platform | `mspowerplatform@microsoft.com` |

> [!IMPORTANT]
Only users who are assigned to the Dynamics 365 administrator or Power Platform administrator role in the Microsoft 365 admin center or Microsoft Entra admin center receive these email notifications. To assign a service admin role to a user, follow the instructions in [Assign a service admin role to a user](use-service-admin-role-manage-tenant.md#assign-a-service-admin-role-to-a-user).
