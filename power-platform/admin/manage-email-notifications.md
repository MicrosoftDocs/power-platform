---
title: "Manage email notifications  | MicrosoftDocs"
description: Manage email notifications
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/17/24
ms.subservice: admin
ms.author: kacortez
ms.reviewer: kacortez
search.audienceType: 
  - admin
---
# Manage email notifications to admins

> [!IMPORTANT]
>Starting <b>December 1, 2024</b>, only users assigned a <b>Dynamics 365 administrator</b> or <b>Power Platform administrator</b> role in the Microsoft 365 admin center, or Microsoft Entra admin center, will receive email notifications. To assign a service admin role to a user, follow refer to: <a href="https://learn.microsoft.com/en-us/power-platform/admin/use-service-admin-role-manage-tenant#assign-a-service-admin-role-to-a-user">Use service admin roles to manage your tenant</a>

The service team regularly sends email notifications to the System Administrators of an organization. As an admin, you can set up a list of additional recipients to receive notifications using a cmdlet. For example, you can add to the list of recipients: 
- People outside of your organization, such as your partners.  
- People or distribution lists inside your company responsible for Power Platform services.

For a complete overview of Cmdlets, see [PowerShell support for Power Apps](powerapps-powershell.md).

## Send email notifications to additional recipients 

By default, admins will receive email notifications. You can add additional recipients to the list using the [Set-AdminPowerAppCdsAdditionalNotificationEmails cmdlet](/powershell/module/microsoft.powerapps.administration.powershell/set-adminpowerappcdsadditionalnotificationemails?view=pa-ps-latest). This will allow you to add email addresses, other than users with the System Administrator role to receive email notifications 

> [!NOTE]
> If you were added as a recipient and want to stop receiving email notifications, contact your organizations’ admin. If you’re not sure who your admin is, see: [Find your administrator or support person](/powerapps/user/find-admin). 

## Obtain a list of Additional Notification email addresses 

To view the full list of email addresses that are receiving notifications, you can use the [Get-AdminPowerAppCdsAdditionalNotificationEmails cmdlet](/powershell/module/microsoft.powerapps.administration.powershell/get-adminpowerappcdsadditionalnotificationemails?view=pa-ps-latest). This will return the list of email addresses of users who are receiving notifications.  





[!INCLUDE[footer-include](../includes/footer-banner.md)]
