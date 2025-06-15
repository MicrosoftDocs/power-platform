---
title: Notifications for Business & Industry Copilot services
description: Learn about the different ways that you can receive notifications for Business & Industry Copilot services. 
ms.component: pa-admin
ms.topic: concept-article
ms.date: 04/08/2025
ms.subservice: admin
ms.author: kacortez
author: kacortez
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Notifications for Business & Industry Copilot services

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Microsoft regularly sends communications about service changes, maintenance, retirement, and customer action that is required. These communications primarily take the form of posts to the Microsoft 365 Service health dashboard and the Message center. Occasionally, we also use direct email communications to provide status, updates, or information about the service.

## Message center
Admins can use the [Microsoft 365 Message center](/office365/admin/manage/message-center?view=o365-worldwide&preserve-view=true) to learn about official service announcements and feature changes. Email notifications can be sent for Message center posts.

### Prerequisites
Before you begin, be sure that you have sufficient permissions. Most users who have been assigned any admin role in Microsoft 365 can view Message center posts. Here's [a list](/microsoft-365/admin/manage/message-center?view=o365-worldwide&preserve-view=true#admin-roles-that-dont-have-access-to-the-message-center) of admin roles that **don't** have access to the Message center. The **Message center reader role** can be assigned to users who should be able to read and share Message center posts without having any other admin privileges.

### Set up a weekly digest mail of Message center changes and notifications
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

The [Service health dashboard](/office365/enterprise/view-service-health) shows the health status of your Microsoft services. Learn how to open the Microsoft 365 Service health dashboard in [How do I check my online service health?](check-online-service-health.md)

Service health communications in the Microsoft 365 admin center are limited to specific admin roles. [Assign admin roles](/microsoft-365/admin/add-users/assign-admin-roles?view=o365-worldwide&preserve-view=true) that have permission to view service health, and review them regularly to stay current about the latest service health information.

Sometimes, Microsoft might have to notify you about issues that are occurring in your Managed Environment, when action by an admin or user in your organization is required to fix those issues. These communications appear in the **Issues in your environment that require action** section of the **Service health** page. Learn more about this section in [Learn about Microsoft 365 monitoring](/microsoft-365/enterprise/microsoft-365-monitoring?view=o365-worldwide&preserve-view=true).

## Service health in the Power Platform admin center

In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), admins can view service health issues for the last 30 days from the **Service health** tab of the **Support** page. Learn more in [View service health](view-service-health.md).

## Ad-hoc email service notifications

The following table lists the services that the Business & Industry Copilot communications team sends ad-hoc notifications for. The table lists the email address that is used to send email notifications for each service. Be sure to check your spam folder for these messages.

| Service | Email address that notifications are sent from |
|---|---|
| Microsoft Dynamics 365 apps | `msdynamics365@microsoft.com` |
| Microsoft Dynamics 365 finance and operations apps | `msdyn365finops@microsoft.com` |
| Microsoft Power Platform | `mspowerplatform@microsoft.com` |

> [!IMPORTANT]
Only users who are assigned to the Dynamics 365 administrator or Power Platform administrator role in the Microsoft 365 admin center or Microsoft Entra admin center receive these email notifications. To assign a service admin role to a user, follow the instructions in [Assign a service admin role to a user](use-service-admin-role-manage-tenant.md#assign-a-service-admin-role-to-a-user).
