---
title: "Automation of tasks with PowerShell  | MicrosoftDocs"
description: Automate tasks with PowerShell
author: laneswenka
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/26/2020
ms.subservice: admin
ms.author: laswenka
ms.reviewer: jimholtz
search.audienceType: 
  - admin
---

# Automation of tasks with PowerShell 

The PowerShell cmdlets enable admins to complete admin portal task using script commands. With PowerShell you can sequentially execute multiple commands at once or pipe output commands to automate common tasks. 

Using PowerShell cmdlets and management connectors, admins can build flows and apps that help implement governance policies. You can use these example PowerShell cmdlets:

|PowerShell cmdlet library  |Common tasks  |
|---------|---------|
|Power Apps cmdlets <br/>[PowerShell support for Power Apps](powerapps-powershell.md)  |Designed for app makers and administrators to automate tasks with environments and associated apps, flows, and connectors.      |
|Microsoft 365 cmdlets<br/> [Get started with PowerShell for Microsoft 365](/microsoft-365/enterprise/getting-started-with-microsoft-365-powershell?view=o365-worldwide)   |Use for Microsoft 365 related tasks to automate user-related actions and tasks. For example, the assignment of licenses.         |
|Dynamics 365 cmdlets<br/> [Overview of Dynamics 365 Customer Engagement (on-premises) PowerShell](/powershell/dynamics365/customer-engagement/overview?view=dynamics365ce-ps)    |Use for environments with Microsoft Dataverse databases. Modules include support for the Dataverse online admin API, and automating solution deployment to the environments.         |
|Microsoft Azure cmdlets <br/> [Azure PowerShell documentation](/powershell/azure/?view=azps-4.8.0)    |Use for including any Azure components in your overall solution. You can use for scripting setup of the on-prem application gateway.        |

You can use a combination of all the above cmdlets to build PowerShell scripts to do bulk operations on users, environments, or their resources.

> [!TIP]
> Examples can also be found when installing and testing the [Center of Excellence Starter Kit](../guidance/coe/starter-kit.md) or using the Admin-in-a-Day hands-on labs that can be found on GitHub ([Admin in a day](https://github.com/microsoft/powerapps-tools/tree/master/Administration/AdminInADay)).

## Common PowerShell tasks

**Displaying a list of environments**

```powershell
Get-AdminPowerAppEnvironment
```

Tasks give you key information, such as the Display Name and GUID of the environment. This task is often what is needed for follow-on operations.

Adding parameters, such as -Default, allows admins to generically find the default environment in the tenant.

```powershell
Get-AdminPowerAppEnvironment -Default
```

Use the GUID to return a non-display name for the environment. Then you can drill into details of that specific environment. For example:

Get-AdminPowerAppEnvironment -Environment 'EnvironmentName'.

This returns the following:

> [!div class="mx-imgBorder"] 
> ![User PowerShell to get environment details.](media/powershell-get-environment-details.png "User PowerShell to get environment details")


This example returns a list of connections in an environment, including all the connections in a tenant's default environment.

```powershell
Get-AdminPowerAppEnvironment -Default | Get-AdminPowerAppConnection
```

This example pipes output from one cmdlet to another. It presents a list of number apps in each tenant environment.

```powershell
    Get-AdminPowerApp | select -ExpandProperty EnvironmentName | Group | %{ New-Object -TypeName PSObject -Property @{ DisplayName = (Get-AdminPowerAppEnvironment -EnvironmentName $_.Name | select -ExpandProperty displayName); Count = $_.Count } }
```

That would produce the following detailed information:

> [!div class="mx-imgBorder"] 
> ![User PowerShell to get environment app number details.](media/powershell-get-environment-details-number-apps.png "User PowerShell to get environment app number details")


[!INCLUDE[footer-include](../includes/footer-banner.md)]
