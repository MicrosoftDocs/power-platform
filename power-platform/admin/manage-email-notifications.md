---
title: "Manage email notifications  | MicrosoftDocs"
description: Manage email notifications
author: astockli
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/17/2020
ms.author: astockli
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Manage email notifications to admins
The service team regularly sends email notifications to the administrators in your organization. Now, using a new cmdlets for Power Platform Admin Center, you have control over who should receive these email communications. As an administrator, you can set up a list of additional recipients that you choose. For example, you can add to the list of recipients:  
- People outside of your organization, such as your partners.  
- People inside and outside of your company.  
 If you have been added as an additional recipient, and you want to stop receiving email notifications, please contact your admin. If you’re not sure who your admin is, see: [Find your administrator or support person](https://docs.microsoft.com/powerapps/user/find-admin).  

For a complete overview of Cmdlets, see [PowerShell support for Power Apps](powerapps-powershell.md).

## Obtain a list of email to be notified
If you need to pull a list of email addresses that will receive admin notification use the [Get-AdminPowerAppCdsAdditionalNotificationEmails cmdlet](https://docs.microsoft.com/powershell/module/microsoft.powerapps.administration.powershell/get-adminpowerappcdsadditionalnotificationemails?view=pa-ps-latest).  It will return email addresses of users, other than default admins, linked to an environment that receive notifications.

## Send email notifications to multiple recipients  

By default, admins will receive update notifications. You can add others to receive update notifications using the [Set-AdminPowerAppCdsAdditionalNotificationEmails cmdlet](https://docs.microsoft.com/powershell/module/microsoft.powerapps.administration.powershell/set-adminpowerappcdsadditionalnotificationemails?view=pa-ps-latest).  It will allow you to set email addresses of users linked to an environment, other than default admins, that should receive notifications.
