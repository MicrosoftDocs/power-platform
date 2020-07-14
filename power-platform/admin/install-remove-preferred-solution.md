---
title: "Install, update, or remove a preferred solution  | MicrosoftDocs"
description: Install, update, or remove a preferred solution
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/23/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Install, update, or remove a preferred solution

> [!NOTE]
> You can now manage your solutions in the Power Platform admin center. See [Environment-level view of apps](manage-apps.md#environment-level-view-of-apps).

Install preferred solutions to gain added features and functionality.  
  
 ![List of preferred solutions](media/PreferredSolutions65.png "List of preferred solutions")
  
 The list of available solutions varies. Some solutions like Microsoft 365 groups for model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, are freely available and visible by default. Trials for some solutions are gated and will only be visible if you go through **Settings** > **Dynamics Marketplace** or [appsource.microsoft.com](https://appsource.microsoft.com/marketplace?product=dynamics-crm) and sign up for the solutions. If you buy a new service subscription through Office Commerce, any associated solution installer  also becomes visible in the **Solutions** tab after that purchase is recognized by the provisioning system.  
  
<a name="BKMK_InstallInsights"></a>   

## Install a preferred solution  
  
1. Sign in to the Dynamics 365 admin center.
  
2. Select the **Instances** tab, and then select the instance to add the solution to.  
  
3. Select **Manage your solutions** ![Manage your solutions](media/manage-solution.png "Manage your solutions").  
  
4. Select the solution you want to install and select **Install**.  
  
    Proceed through **Terms of service** to accept the terms.  
  
   The status for the solution changes to **Installation pending**.  
  
   The status for the solution will change to **Installed** when the solution is ready.  

## Update a preferred solution

1. Sign in to the Dynamics 365 admin center.
  
2. Select the **Instances** tab.  
  
3. Select the instance with the solution to update, and then select **Manage your solutions** ![Manage your solutions](media/manage-solution.png "Manage your solutions").  
  
   ![Select an instance and Manage your solutions](media/select-instance-solution.png "Select an instance and Manage your solutions")

4. Select the solution you want to update, and then select **Upgrade**.  
  
   ![Select solution and upgrade](media/select-solution-upgrade.png "Select solution and upgrade")

5. Proceed through **Terms of service** to accept the terms and start the upgrade. 

  
## Delete a preferred solution  
  
1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  
  
2. Sign in to your model-driven app in Dynamics 365.  
  
3. Select **Settings** > **Solutions**.  
  
4. Select a solution and select **Delete**.  
  
### See also  
