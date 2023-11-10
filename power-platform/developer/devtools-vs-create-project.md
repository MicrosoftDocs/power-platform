---
title: "Quickstart: Create a Power Platform Tools project | Microsoft Docs"
description: "Learn how to start a new Visual Studio project for plug-in or custom workflow assembly development using Power Platform Tools."
ms.custom: ""
ms.date: 10/05/2023
ms.reviewer: "pehecke"
ms.topic: "how-to"
author: "phecke" # GitHub ID
ms.subservice: developer
ms.author: "pehecke" # MSFT alias of Microsoft employees only
---

# Quickstart: Create a Power Platform Tools project

Like any Visual Studio solution, you begin by creating a new project. In the new project dialog, enter "Power Platform" in the search box. A list of available Power Platform Tools project C# templates is described in section [Available project templates](#available-project-templates).

## Prerequisites

- Visual Studio 2019 or 2022
- Power Platform Tools for Visual Studio
- C# language
- .NET Framework 4.6.2 or later; plug-in and custom workflow activity development requires v4.6.2
- Power Apps subscription or a trial environment
- Windows Workflow Foundation (only for custom workflow activity development)

If you haven't installed Power Platform Tools for Visual Studio, install it by following instructions here: [Power Platform Tools](devtools-vs.md)

You can install Windows Workflow Foundation from the Visual Studio Installer application by selecting **Modify** and choosing the individual component as shown in the next figure. An alternate approach is to install a workload that contains that component.

:::image type="content" source="media/tools/devtools-wwf-install.png" alt-text="Add the WIndows Workflow Foundation component":::

## Available project templates

The following table introduces the available Power Platform Tools project templates.

| C# project template | Description |
| --- | --- |
| Power Platform Solution Template | Solution template for creating a Power Platform solution. This template is for a  Visual Studio solution and not a Microsoft Dataverse solution. |
| Power Platform Plug-in Library | Project template for creating a Power Platform plug-in class library and assembly (DLL).|
| Power Platform Package | Project template for creating a Power Platform package (CrmPackage). The package is used to deploy the solution and custom code libraries to a Dataverse environment.|
| Power Platform Workflow Activity Library | Project template for creating a Power Platform custom workflow activity class library and assembly (DLL).|
| Customizations Project | Project template for all customizations of a Power Platform (Dataverse) solution. |

## Use the Power Platform solution template

The Power Platform solution template is a good starting point for any new solution. You can add and remove projects to and from the solution. However, you shouldn't remove the CrmPackage project. Doing so causes deployment of the Power Platform solution to the target environment to fail.

> [!IMPORTANT]
> A Power Platform solution must contain one and only one CrmPackage project. Otherwise, the Dataverse solution deployment will fail.

The plug-in library and workflow library project templates are typically used for more advanced scenarios. For example, where you may want to add multiple custom code assemblies to a Power Platform solution or if you're only interested in developing that specific custom code component. Before you can deploy a solution that contains only a project of these types, you must add a CrmPackage project to the Visual Studio solution.

The easy way to create a Power Platform solution containing a CrmPackage project and optionally a plug-in and/or workflow activity project is to use the Power Platform Solution Template. To create that solution, follow these next steps.

1. In the Visual Studio new project dialog, search for and choose **Power Platform Solution Template** and then select **Next**.

1. Enter the requested project information, choose a .NET Framework version, and select **Create**. <p/>At this point, you should see either a Dataverse sign in dialog or a dialog to reuse your last Dataverse connection. Do whatever is appropriate to connect to your Dataverse development environment. Never develop code in a production environment.

1. At the **Configure Microsoft Power Platform Solution** dialog, choose either to use an existing Dataverse solution or create a new solution. <p/>Depending on what you have chosen, you're prompted to enter information about the new solution or select the existing solution from a drop-down list. **Step #3 Select Solution** is displayed but not active until you're logged in and choose **Next** in step #2.

1. Once the target Power Platform solution has been identified or created, you specify existing items or create new projects (step #1) using one of the above Power Platform project templates. <p/>After you choose a new item, the dialog will expand to show step #2 where you can choose (only) one of each available project to add to your solution. Choose (check) one or more projects from the list and select **Next**. Step #3 is displayed but not active until you're done with step #2 and choose **Next**.

1. In step #3 of the dialog, enter names for your chosen projects and select **Done**. <p/>Choose names that you want to see as project names in Visual Studio Solution Explorer.

1. You're prompted to save the solution file. Select **Save** to save the Visual Studio solution.

In **Solution Explorer**, you should now see a solution containing a single **CrmPackage** project and one or more projects based of the project templates that you chose. Each plug-in or custom workflow activity class library project builds an assembly. You can add more classes to each class library by adding a new or existing item as desired, and you can add other projects to the solution using the Power Platform project templates.

## Managing projects

The following procedures describe some common operations for your Visual Studio solution.

### Add a new project to a Power Platform solution

Only projects created with a Power Platform Tools template should be added to a solution created using the Power Platform Tools Solution Template. To add a new project to a solution, follow these steps.

1. Right-click the solution in **Solution Explorer**, select **Add**, and then choose **New Project**.

1. Select one of the installed Power Platform Tools templates and select **Next**.

1. Fill in any required information and select **Create**. For a plug-in or workflow activity library, be sure to choose .NET Framework 4.6.2.

### Add an existing project to a Power Platform solution

Only projects created from Power Platform Tools templates should be added to a solution that was created using the Power Platform Tools Solution Template.

1. Right-click the solution in **Solution Explorer**, select **Add**, and then choose **Existing Project**.

1. Navigate to the .csprog file of the target project, select it, and choose **Open**.

1. In **Solution Explorer**, under the CrmPackage project, right-click **References** and select **Add Reference**.

1. In the **Projects** tab of the **Add Reference** dialog, select the (to be added) projects from the list and then select **Add** to add them to the list of selected projects and components.

1. Select **OK** to add the projects to the solution and close the **Add Reference** dialog box.

### Remove a project from a Power Platform solution

1. In **Solution Explorer**, right-click the project and select **Remove**. The project is automatically removed from the CrmPackage references.

1. Edit the RegisterFile.crmregister XML file in the CrmPackage project and remove any XML registration code related to the removed project.

1. Remove any deployed assembly and steps of your project from the Dataverse environment and solution. <p/>If you removed a plug-in or workflow activity library project from the Visual Studio solution, you may want to also remove any related assembly and steps from the Dataverse environment and solution. You can remove these components in **Power Platform Explorer** by expanding the Plug-in Assemblies node of your environment tree, right-click the target assembly, and choose **Delete Assembly**. doing so deletes the assembly and any registered steps.

    > [!IMPORTANT]
    > Your Dataverse logon account must own or have delete access to the deployed assembly in order for you to delete it from the environment.

### See Also

[Quickstart: Create a plug-in using Power Platform Tools](/power-apps/developer/data-platform/tools/devtools-create-plugin)
