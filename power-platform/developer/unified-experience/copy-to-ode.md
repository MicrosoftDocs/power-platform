---
title: "Copy an LCS environment to ODE"
description: "Learn how to copy from an LCS managed environment to a Power Platform admin center ODE"
author: pvillads
ms.date: 08/21/2023
ms.topic: article
audience: Developer, IT Pro
ms.reviewer: phecke
ms.search.region: Global
ms.author: pvillads
ms.collection: get-started
---

# Copy an LCS environment to ODE (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This guide provides step-by-step instructions on performing a Copy from an LCS managed Production/Sandbox environment to a Power Platform admin center (PPAC)) managed online development environment (ODE).

Unlike the current LCS copy experience, PPAC based copy copies over your AxDB, MrDB, any customizations and the ISV solutions. In simple terms, it produces a replica of the source environment that includes both code and data.

> [!NOTE]
> To copy from one ODE to another, skip to step 4.

## Prerequisites

1. An LCS Production/Sandbox environment (source)
1. Online development environment (target)

> [!IMPORTANT]
> Ensure that both source and target environments should be in the same geo or region. (Provisioning is now available in all regions).

> [!NOTE]
> Copying across geo is not supported in PPAC.

## Step by step instructions

### Step 1: Connect finance and operations apps with a new Microsoft Dataverse instance

For instructions on performing this step, use [Connect finance and operations apps with a new Microsoft Dataverse instance](https://learn.microsoft.com/dynamics365/fin-ops-core/dev-itpro/power-platform/environment-lifecycle-connect-finops-new-dv).

### Step 2: Install/update the latest Dynamics 365 Finance and Operation Platform tools app

> [!NOTE]
> This application/solution is needed to connect Visual studio extension to the Finance and Operations environment.

1. In the Power Platform admin center and select **Environments**.
1. Select the environment you wish to copy. From the **Resources** menu, select **Dynamics 365 apps**.

:::image type="content" source="../media/unified-experience/copy-to-ode-view-apps.png" alt-text="Viewing Dynamics 365 apps from the environment resources menu.":::

You should see Dynamics 365 Finance and Operations platform tools in the list of available apps.

If you see "Update Available" in the Status for Dynamics 365 Finance and Operations platform tools, click on the link, agree to the terms and click **Update**

:::image type="content" source="../media/unified-experience/copy-to-ode-platform-tools.png" alt-text="Dynamics 365 Finance and Operations platform tools showing an Update available status.":::

If Dynamics 365 Finance and Operations platform tools is not listed, click on **Install App** to add this app to your organization.
From the list on right side, find and select “Dynamics 365 Finance and Operations platform tools” app, click on next and follow the instructions to install.

:::image type="content" source="../media/unified-experience/copy-to-ode-install-apps.png" alt-text="Install Dynamics 365 apps menu.":::

### Step 3: Convert LCS packages to the new unified format

> [!NOTE]
> This step is needed to convert the existing LCS package into a new unified deployment package (aka UDP) format. The package format is changed to align with other Dynamics applications.

Run the following command using ModelUtil.exe from Windows Powershell. You can find the .exe in PackagesLocalDirectoryDev/bin.

```
.\ModelUtil.exe -convertToUnifiedPackage -file=<PathToYourPackage>.zip -outputpath=<OutputPath>
```

### Step 4: Upload/Deploy unified deployable package

This deploy command doesn’t make any changes to the Finance and Operations LCS environment, nor does it require any downtime to apply this package. This is done to upload and save the customizations into Dataverse storage. During a copy from a source environment, these artifacts are used to apply customizations on target environment.

1. Install [PAC CLI](https://aka.ms/PowerAppsCLI)
1. [Authenticate and connect to source Dataverse](../cli/reference/auth.md#pac-auth-create)
1. Run: pac auth list
1. Run: pac auth select --index 1
1. Run: pac package deploy --logConsole --package <OutputPath>\<Package>.dll

### Step 5: Initiate Copy

1. Go to the source environment in [PPAC](https://aka.ms/PPAC)
1. Click on **Copy**. This will open a fly out menu, such as in [Step 1 above](#step-1-connect-finance-and-operations-apps-with-a-new-Microsoft-Dataverse-instance)
1. Select the target environment from dropdown
1. Select the target online development environment
1. After selecting the target from dropdown, click on copy to start the copy operation

:::image type="content" source="../media/unified-experience/copy-to-ode-copy-environment.png" alt-text="Copy environment menu":::

You can monitor the copy progress from the *target environment page* (Not the PPAC page).

:::image type="content" source="../media/unified-experience/copy-to-ode-copy-progress.png" alt-text="Copy progress from the target environment page":::

If you click on target environment in PPAC, you will see something like the image from step 5 above ("After selecting...") while copy operation is ongoing.

#### See also

[Deploy packages](deploy-packages.md)  
[Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)  
[Manage Dynamics 365 apps](/power-platform/admin/manage-apps)
