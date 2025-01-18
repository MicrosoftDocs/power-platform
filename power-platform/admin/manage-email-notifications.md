---
title: Manage email notifications 
description: Manage email notifications
author: karacortez
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/22/2024
ms.subservice: admin
ms.author: kacortez
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Manage email notifications to admins

> [!IMPORTANT]
> Starting January 17, 2025, only users assigned to the Dynamics 365 administrator or Power Platform administrator role in the Microsoft 365 admin center or Microsoft Entra admin center will receive email service notifications. To assign a service admin role to a user, follow the instructions in [Assign a service admin role to a user](use-service-admin-role-manage-tenant.md#assign-a-service-admin-role-to-a-user). This change doesn't impact Message Center email notifications. 

The service team regularly sends email notifications to the System Administrators of an organization. As an admin, you can set up a list of more recipients to receive notifications using a cmdlet. For example, you can add to the list of recipients: 
- People outside of your organization, such as your partners.  
- People or distribution lists inside your company responsible for Power Platform services.

For a complete overview of Cmdlets, see [PowerShell support for Power Apps](powerapps-powershell.md).

## Send email notifications to more recipients 

By default, admins receive email notifications. You can add more recipients to the list using the [Set-AdminPowerAppCdsAdditionalNotificationEmails cmdlet](/powershell/module/microsoft.powerapps.administration.powershell/set-adminpowerappcdsadditionalnotificationemails?view=pa-ps-latest). This allows you to add email addresses, other than users with the System Administrator role to receive email notifications 

> [!NOTE]
> If you were added as a recipient and want to stop receiving email notifications, contact your organizations’ admin. If you’re not sure who your admin is, see: [Find your administrator or support person](/powerapps/user/find-admin). 

## Obtain a list of email addresses that recieve notificationa

To view the full list of email addresses that receieve notifications, you can use the [Get-AdminPowerAppCdsAdditionalNotificationEmails cmdlet](/powershell/module/microsoft.powerapps.administration.powershell/get-adminpowerappcdsadditionalnotificationemails?view=pa-ps-latest). This returns the list of email addresses of users who are receiving notifications.  





[!INCLUDE[footer-include](../includes/footer-banner.md)]
