---
title: "Copy a Lifecycle Services environment"
description: "Learn how to copy from an LCS managed environment to a Power Platform admin center (PPAC) online development environment (ODE)"
author: pvillads
ms.date: 08/21/2023
ms.topic: article
audience: Developer, IT Pro
ms.reviewer: phecke
ms.search.region: Global
ms.author: pvillads
ms.collection: get-started
---

# Copy a Lifecycle Services environment (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This guide provides step-by-step instructions on performing a copy from a Lifecycle Services (LCS) managed production/sandbox environment to a Power Platform admin center (PPAC) managed online development environment (ODE).

Unlike the current LCS copy experience, PPAC based copy copies over your databases, any customizations and the ISV solutions. In simple terms, it produces a replica of the source environment that includes both code and data.

## Prerequisites

1. An LCS production/sandbox environment (source)
1. Online development environment (target)

> [!IMPORTANT]
> Ensure that both source and target are provisioned in the same geographic region. Provisioning is now available in all regions.

## Step by step instructions

> [!NOTE]
> To copy from one ODE to another, skip to step 4.

### Step 1: Connect finance and operations apps with a new Microsoft Dataverse instance

For instructions on performing this step, use [Connect finance and operations apps with a new Microsoft Dataverse instance](/dynamics365/fin-ops-core/dev-itpro/power-platform/environment-lifecycle-connect-finops-new-dv).

### Step 2: Install/update the latest Dynamics 365 Finance and Operations Platform Tools app

> [!NOTE]
> This application/solution is needed to connect the Visual Studio extension to the finance and operations environment.

1. In the Power Platform admin center select **Environments**.
1. Select the environment you wish to copy. From the **Resources** menu, select **Dynamics 365 apps**.

:::image type="content" source="../media/unified-experience/copy-to-ode-view-apps.png" alt-text="Viewing Dynamics 365 apps from the environment resources menu.":::

You should see Dynamics 365 Finance and Operations Platform Tools in the list of available apps.

If you see "Update Available" in the **Status** for Dynamics 365 Finance and Operations Platform Tools, click on the link, agree to the terms and click **Update**

:::image type="content" source="../media/unified-experience/copy-to-ode-platform-tools.png" alt-text="Dynamics 365 Finance and Operations platform tools showing an Update available status.":::

If Dynamics 365 Finance and Operations Platform Tools is not listed, click on **Install App** to add this app to your organization.
From the list on right side, find and select “Dynamics 365 Finance and Operations Platform Tools” app, click on **Next** and follow the instructions to install.

:::image type="content" source="../media/unified-experience/copy-to-ode-install-apps.png" alt-text="Install Dynamics 365 apps menu.":::

### Step 3: Convert LCS packages to the new unified format

This step is needed to convert the existing LCS package into a new unified deployment package (UDP) format. The package format is changed to align with other Dynamics applications.

Run the following command using ModelUtil.exe from Windows Powershell. You can find the .exe in PackagesLocalDirectoryDev/bin.

```
.\ModelUtil.exe -convertToUnifiedPackage -file=<PathToYourPackage>.zip -outputpath=<OutputPath>
```

### Step 4: Upload/Deploy unified deployable package

This deploy command doesn’t make any changes to the finance and operations LCS environment, nor does it require any downtime to apply this package. This is done to upload and save the customizations into Dataverse storage. During a copy from a source environment, these artifacts are used to apply customizations on the target environment.

1. Install [PAC CLI](https://aka.ms/PowerAppsCLI)
1. [Authenticate and connect to source Dataverse](../cli/reference/auth.md#pac-auth-create)
1. Run the following:

```
pac auth list
pac auth select --index 1
pac package deploy --logConsole --package <OutputPath>\<Package>.dll
```

### Step 5: Initiate Copy

1. Go to the source environment in [PPAC](https://aka.ms/PPAC)
1. Click on **Copy**
1. Select the target environment from dropdown
1. Select the target online development environment
1. After selecting the target from dropdown, click on **Copy** to start the copy operation

:::image type="content" source="../media/unified-experience/copy-to-ode-copy-environment.png" alt-text="Copy environment menu":::

You can monitor the copy progress from the *target environment page* (not the PPAC page).

:::image type="content" source="../media/unified-experience/copy-to-ode-copy-progress2.png" alt-text="Copy progress from the target environment page":::

If you click on target environment in PPAC, you will see something like the image from step 5 above ("After selecting...") while the copy operation is ongoing.

#### See also

[Deploy packages](deploy-packages.md)  
[Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)  
[Manage Dynamics 365 apps](/power-platform/admin/manage-apps)
