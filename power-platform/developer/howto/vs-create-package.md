---
title: Create and register a plug-in package using Visual Studio
description: Create and register a plug-in package containing a dependent assembly using Visual Studio.
author: marcelbf
ms.author: marcelbf
ms.reviewer: pehecke
ms.date: 10/03/2023
ms.subservice: developer
ms.topic: how-to
search.audienceType: 
  - developer
contributors:
- phecke
ms.custom: bap-template
---

# Create and register a plug-in package using Visual Studio

In this article you'll learn how to create a plug-in package, and then upload and register it on the Dataverse server. You'll be using Visual Studio with the Power Platform Tools extension to create the plug-in package, upload and register the package, and perform some other package management tasks.

This article helps you:

> [!div class="checklist"]
>
> * Create a Visual Studio plug-in project
> * Add a dependent assembly to the project and build
> * Use Visual Studio to upload and register your package
> * Use Visual Studio to update and delete a package

More information: [Build and package plug-in code](/power-apps/developer/data-platform/build-and-package).

## Prerequisites

* Access to a Dataverse environment
* A system user account, with System Administrator or System Customizer role, in the target environment
* Visual Studio 2019 with Power Platform Tools extension installed

Review these articles related to installing and using Power Platform Tools for Visual Studio.

* [What is Power Platform Tools for Visual Studio](../devtools-vs.md)
* [Create a Power Platform Tools project](../devtools-vs-create-project.md)
* [Create a plug-in using Power Platform Tools](/power-apps/developer/data-platform/tools/devtools-create-plugin)

## Enable plug-in packages for Power Platform Tools

Power Platform Tools for Visual Studio provides several configuration options as described in [Power Platform Tools options](../devtools-vs.md#power-platform-tools-options).

1. In Visual Studio, go to **Tools** > **Options** and search for **Power Platform tools**.
1. Select **Use NuGet package for deploying plug-ins to Dataverse**.

   :::image type="content" source="../media/tools/power-platform-tools-options.png" alt-text="Select Use NuGet package for deploying plug-ins to Dataverse.":::

> [!NOTE]
> When this option is selected, all your plug-in projects will be deployed as plug-in packages.

## Add a dependent assembly to your project

You can add a NuGet package for satisfying required references to your Visual Studio project as you normally do. After you build the project, you should find your plug-in assembly in the generated NuGet package located in the `bin\outputPackages` folder.

You can use [NuGet Package Explorer](https://www.microsoft.com/p/nuget-package-explorer/9wzdncrdmdm3) to examine the generated NuGet package.

### Add a dependent assembly without using NuGet

If you have an assembly that isn't distributed as a NuGet package, you can add it to your project as you normally do. In **Solution Explorer**, right-click **Dependencies** and choose **Add Assembly Reference...**. Select the assembly you want to add.

## Deploy plug-in packages

To deploy (upload and register) your plug-in package, in **Solution Explorer** right-click the plug-in project and select **Deploy** from the context menu.

:::image type="content" source="../media/tools/power-platform-deploy-pluginpackage.png" alt-text="foo":::

When you deploy for the first time, you should see a message in the output window that informs you that the plug-in package was created:

```
6/22/2022 3:03:17 PM : registration of Plugin Package sample_PowerPlatformVSSolution.ExamplePlugins, 
at E:\projects\PowerPlatformVSSolution\ExamplePlugins\bin\outputPackages\PowerPlatformVSSolution.ExamplePlugins.1.0.0.nupkg was successful. 
ID allotted was 06a20e15-77f2-ec11-bb3c-000d3a892245.
```

Each time you deploy after that, you'll see a message in the output window that informs you that the plug-in package was updated.

```
6/22/2022 3:20:14 PM : update of Plugin Package sample_PowerPlatformVSSolution.ExamplePlugins, at
E:\projects\PowerPlatformVSSolution\ExamplePlugins\bin\outputPackages\PowerPlatformVSSolution.ExamplePlugins.1.0.0.nupkg was successful.
```

> [!IMPORTANT]
> If your update removes any plug-in assemblies, or types which are used in plug-in step registrations, the update will be rejected. You must manually remove any step registrations that use plug-in assemblies or plug-in types that you want to remove with your update.
>
> The version of the plug-in package or plug-in assembly is not a factor in any upgrade behaviors. You can update the versions of these items as you need.

## Plug-in package management

Within Visual Studio, you can perform additional operations on plug-in packages as described in the next sections.

### View plug-in packages with Power Platform Tools

Within the Power Platform Explorer, you can view available plug-in packages.

:::image type="content" source="../media/tools/power-platform-explorer-plug-in-packages.png" alt-text="Within the Power Platform Explorer, you can view available plug-in packages":::

### Create a plug-in package, alternate method

As mentioned in [Deploy plug-in packages](#deploy-plug-in-packages), you will not typically have to create a plug-in package in the usual flow of creating a plug-in. It will be created automatically the first time you deploy the plug-in while the **Use NuGet package for deploying plug-ins to Dataverse** option is set in Visual Studio. However, you can create a new plug-in package from a NuGet package using the following steps.

1. Within the Power Platform Explorer, select **Plug-in Packages** and select **Create** from the context menu.

   :::image type="content" source="../media/tools/power-platform-create-pluginpackage.png" alt-text="Within the Power Platform Explorer, select Plug-in Packages and select Create from the context menu.":::

1. This command opens the **Import new plug-in package** dialog.

   :::image type="content" source="../media/tools/power-platform-create-pluginpackage-dialog.png" alt-text="The **Import new plug-in package dialog":::

1. Select the NuGet package and choose which solution it should be added to, or create a new solution.

### Delete a plug-in package

Within the Power Platform Explorer, select a plug-in package and then select **Delete** from the context menu.

:::image type="content" source="../media/tools/power-platform-delete-pluginpackage.png" alt-text="Select a plug-in package and select Delete from the context menu":::

> [!IMPORTANT]
> Deleting a package will delete the package, all assemblies within it, all plug-ins within the assembly, and any plug-in step registrations for the plug-ins.

### Update a plug-in package, alternate method

As mentioned in [Deploy plug-in packages](#deploy-plug-in-packages), you will not typically have to update a plug-in package in the usual flow of creating a plug-in. It will be updated automatically each time you deploy the plug-in while the **Use nuget package for deploying plug-ins to Dataverse** option is set in Visual Studio. However, you can update a new plug-in package from a Nuget package using the steps below.

Within the **Power Platform Explorer**, select a plug-in package and select **Update** from the context menu.

:::image type="content" source="../media/tools/power-platform-update-pluginpackage.png" alt-text="Select a plug-in package and select Update from the context menu":::

This command opens a dialog so you can select a NuGet package to update the plug-in package.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]