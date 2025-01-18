---
title: "Workflow to write, deploy, debug, and troubleshoot X++ code across multiple environments"
description: "Learn how to work over time with multiple unified development environments, ISV modules, and troubleshooting as you go."
author: pathaku
ms.date: 06/11/2024
ms.topic: how-to
ms.reviewer: pehecke
ms.author: pathaku
ms.subservice: developer
---

# Workflow to write, deploy, debug, and troubleshoot X++ code across multiple environments

This article describes a workflow to write, deploy, debug, and troubleshoot X++ code across multiple environments.

> [!NOTE]
> You can learn more by watching the presentation and demos for the Dynamics 365 FastTrack Tech Talk series.
> [Unified Development Experience for Finance and Operations | Dynamics 365 FastTrack Tech Talk](https://www.youtube.com/watch?v=OuEZ1rXkpYY)

Let's start by talking about a development machine with multiple unified developer environments.

## Multiple unified development environments

A developer machine can be used to connect to multiple unified development environments. However, an instance of Visual Studio can at any time be connected to only one environment and have only one metadata configuration active. You can switch the active configuration using the menu item **Extensions** > **Dynamics 365** > **Configure Metadata**.

Switching the active metadata configuration doesn't change the environment you're connected to. You can change it from the Visual Studio menu item **Tools** > **Connect to Dataverse**.

The same configuration may be valid for multiple environments with same finance and operation application and platform versions. It's still better to have a metadata configuration per environment. These configurations can have common values for custom and reference metadata folder, and more. The current configuration and the current connection together determine what gets deployed and to which environment.

Different environments with different finance and operation application and platform versions could be used for different purposes. It is recommended that the finance and operation Visual studio extension version matches with the environment.

The X++ compiler, label compiler, and other tools invoked by any version of the Visual Studio extension corresponds to the application version of the active configuration you have set as current.

If there are no breaking changes among the various targeted application and platform versions using the oldest version for the finance and operation, the Visual Studio extension version would ensure that the built artifacts are compatible with higher runtime versions in the environments.

## A unified developer environment and multiple developer machines

Whether talking about the same or a different developer, if multiple development machines are used it becomes more likely, but not inevitable, to unintentionally corrupt the common unified development environment. This could happen when deploying a change that does not account for what is already deployed to the same environment.

The situation described above could also arise from the same development machine, in case the custom metadata code loses consistency, for example by switching Git branches.

The way to keep things consistent and prevent unintended changes to the unified development environments is to use version control, for example Azure DevOps with Git, to ensure a referenced record of what is deployed to any environment.

> [!IMPORTANT]
> We cannot emphasize enough the important role of version control to ensure good code hygiene and to provide historical records, checkpoints, and synchronization points.

## Deploy code and synchronize the database

Let's look at your options when deploying code and synchronizing the database on a unified development environment.

| Scenario | Deployment method | Notes |
|---|---|---|
|Deploy one or many modules that are already built | Use the **Dynamics 365** > **Deploy** > **Deploy models ...** dialog.|You can optionally synchronize the database for the modules.|
|Deploy one or many modules as part of a full build | Initiate via the **Dynamics 365** > **Build models** dialog after setting the option to **Deploy to connected online environment** .|You can optionally synchronize the database for the modules using the **synchronize database** setting on the same **Options** tab.|
|Deploy one or many modules as part of a build/rebuild of X++ projects from Solution Explorer | Initiate via build/rebuild of the project(s) or solution after setting the option to **Deploy changes to online environment** . This only deploys changes since the last successful deployment and is faster |You can optionally synchronize the database for the included changes|
|Deploy one module for a given X++ project from the Solution Explorer | Initiate via right-clicking the project and choosing **Deploy model for project ...**.| This will only deploy changes since last successful deployment but won't synchronize the database for the module.|
|No deploying any module but synchronize the database for all modules in the environment | Initiate via **Dynamics 365** > **Synchronize database...** dialog.|This is a long running operation since DBSync is run for all modules.|

> [!NOTE]
>
> - Continuous incremental build and deployment could be much faster than full deployment for large modules.
> - For binary only modules received from ISVs or other third parties, do a full deployment and DB sync.
> - Do not change and try to deploy system modules.

## Add modules received from ISVs or others

You can receive X++ modules in many different ways. It could be shared with you as zip files or fully deployable packages, individually or a collection of modules, with code or binary only, including ISV licenses or not.

In all these cases you would want to version them by checking them into some version control system. You would then want to update the active metadata configuration to refer to them.  

Proceed by adding a new reference in **Folders for reference metadata** by clicking the **Add** button and navigating to the common parent folder for all the reference modules. As an example, if you want to add Module01 and Module02, place them in a common folder (for example E:\ISVModules) and then refer the latter parent folder.

## When to include a license for modules

Licenses can be directly included and deployed by placing them in the __License (with _two_ underscores) folder in the model, at the same level as your bin folder. This license is verified and applied when you deploy the package.

As an example, if you want to add a license file **licenseFile01** for Module01 present at E:\ISVModules\Module01, create a child folder E:\ISVModules\Module01\__License and place the file in it as E:\ISVModules\Module01\__License\licenseFile01. Additionally, a **Full DB Sync** from the Dynamics 365 menu in **Extensions** is required for the applied license to take effect.

Learn more at [Independent software vendor (ISV) licensing](/dynamics365/fin-ops-core/dev-itpro/dev-tools/isv-licensing)

## Convert a fully deployable package (Lifecycle Services legacy package) into the new format

Let's describe how to convert a fully deployable package (Lifecycle Services legacy package) into the new format to be compatible for deployment to environments.

Locate ModelUtil.exe inside the bin folder and run it from the command line to see usage. Next, choose the `-convertToUnifiedPackage` option and provide the package zip and output location as parameters.

> [!NOTE]
> The conversion to a unified package may fail with message ending with - The file 'temp path\modelName\bin\fileName' already exists. This occurs if multiple versions of the model are identified in the original package.
>
> Solution: Ensure/recreate the original package making sure that only one version of each model is present in the package at location  <OriginalPackage.zip>/AOSService/Packages/files/<model.version>.

## Troubleshoot deployment or DBSync failures

The package deployment could fail in various stages including DB sync, for various reasons including developer bugs. A link to download operation logs is available in the Visual Studio output pane. It's downloaded if there were failures, or if you enable the setting in **Tools> Options> Power Platform Tools**.

You can also download the logs from your Dataverse organization by following these steps.

1. Sign in to the Dataverse organization
1. Find **Finance and Operation Package Manager App** on the main page
1. Select the app, and then from left pane, select **Operation History**
1. Open the respective record by selecting the **Operation Name** and download the operation logs (`operationlogs.zip` file)

## Deployment and DBSync succeeded but need to investigate my changes

If deployment and DB Sync are successful, you should execute your scenario and contrast expected and actual behavior for clues. Infolog is often very helpful in this case.

If above issn't enough, you should attach the debugger to the running AOS process in the unified environment using the menu **Dynamics 365** > **Launch debugger**. Executing the scenario this time with a few breakpoints set will give you better insight.

We recommend writing X++ unit tests for your code to ensure regressions are easily and quickly detected. You could also use Application Insights to monitor and diagnose the application executing in the unified developer environment.

Learn more about observability: [Monitoring and telemetry using Application Insights](/dynamics365/fin-ops-core/dev-itpro/sysadmin/monitoring-and-telemetry-appinsights)

## What information to provide Microsoft Support?

The correlation ID, client machine name, and timestamp are required for Microsoft to investigate. The correlation ID is in the Visual Studio output pane.

The logs are also written to Microsoft.PowerPlatformVSExtension*.log files in C:\Users\<user>\AppData\Local\Microsoft\Dynamics365\Logs. Additionally, a log file named VisualStudioD365Extension*.log is generated at a path similar to C:\Users\AppData\Roaming\Microsoft Corporation\Microsoft&reg; Visual Studio&reg;\<version>\VisualStudioD365Extension-*.log.

### See also

[Unified Development Experience for Finance and Operations | Dynamics 365 FastTrack Tech Talk](https://www.youtube.com/watch?v=OuEZ1rXkpYY)  
[Write, deploy, and debug X++ code](finance-operations-debug.md)  
[Unit testing in the unified developer experience](finance-operations-testing.md)  
[Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)  
[Manage Dynamics 365 apps](../../admin/manage-apps.md)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
