---
title: Programmability and Extensibility - PowerShell - Installation | Microsoft Docs
description: PowerShell for Power Platform Administrators installation
author: laneswenka
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 03/19/2021
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Installing PowerShell for Power Platform Administrators
PowerShell in this article requires PowerShell version 5.x.  This will be updated to use a newer version in the future. To check the version of PowerShell running on your machine, run the following command:

> ```powershell
> $PSVersionTable.PSVersion
> ```

If you have an outdated version, see [Upgrading existing Windows PowerShell](/powershell/scripting/windows-powershell/install/installing-windows-powershell#upgrading-existing-windows-powershell).  

> [!IMPORTANT]
> The modules described in this document use .NET Framework. This makes it incompatible with PowerShell 6.0 and later, which use .NET Core. 

## Requirements
To run the PowerShell cmdlets for app creators, do the following:

1. Run PowerShell as an administrator.

   > [!div class="mx-imgBorder"] 
   > ![Run PowerShell as an administrator](media/open-powershell-as-admin75.png "Run PowerShell as an administrator")

2. Import the necessary module using the following command:

    ```powershell
    Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
    ```

    Alternatively, if you don't have admin rights on your computer, you can use the following to use these modules:

    ```powershell
    Save-Module -Name Microsoft.PowerApps.Administration.PowerShell -Path
    Import-Module -Name Microsoft.PowerApps.Administration.PowerShell
    ```

3. If you are prompted to accept the change to the *InstallationPolicy* value of the repository, accept [A] Yes to All modules by typing **A** and pressing **Enter** for each module.

   ![Accept InstallationPolicy value](media/accept-installationpolicy-value75.png "Accept InstallationPolicy value")
