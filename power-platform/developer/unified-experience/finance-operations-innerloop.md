---
title: "Dev workflow to Write, deploy, debug and troubleshoot X++ code across multiple environments"
description: "Learn how to work over time with multiple unified developer environments, ISV modules, troubleshooting as you go along."
author: pathaku
ms.date: 06/06/2024
ms.topic: how-to
ms.reviewer: phecke
ms.author: pathaku
ms.subservice: developer
---
   
> [!IMPORTANT]
> You can learn more by watching presentation and demos done for the Dynamics 365 FastTrack Tech Talk series
> 
> [Unified Development Experience for Finance and Operations | Dynamics 365 FastTrack Tech Talk](https://www.youtube.com/watch?v=OuEZ1rXkpYY)
 
# A developer machine and multiple unified developer environments 

A developer machine can be used to connect to multiple unified developer environments. 

An instance of Visual Studio can at any time be connected to only one environment.

An instance of Visual Studio can at any time have only one metadata configuration active. You can switch the active configuration using the menu **Extensions** > **Dynamics 365** > **Configure Metadata**.

Switching the active metadata configuration does not change the environment you are connected to. You can change it from the menu **Tools** > **Connect to Dataverse**.

The same configuration may be valid for multiple environments with same F&O application and platform versions. It is still better to have a metadata configuration per environment. These configurations can have common values for custom and reference metdata folder, etc. The current configuration and the current connection together determine what gets deployed and to which environment.

Different environments with different F&O application and platform versions could be used for different purposes. It is recommended in this case that the F&O Visual studio extension version match with the environment. 

The X++ compiler, label compiler and other tools invoked by any version of the VS extension, corresponds to the application version of the active configuration you ahave set as current. 

Commonly, though if there are no breaking changes among the various targeted application and platform versions using the oldest version for the F&O Visual Studio extension version would ensure that the built artifacts are compatible with higher runtime versions in the environments.

# A unified developer environment and multiple developer machines 

Whether it is the same or a different developer if multiple developer machines are used it becomes more likely, but not inevitable, to unintentionally corrupt the common Unified Developer Environment.

This could happen when deploying a change that does not account for what is already deployed to the same environment.
 
The situation described above could also arise from the same developer machine, in case the custom metadata code loses consistency, for example by switching git branches.

The way to keep things consistent and prevent unintended changes to the UDEs is to use version control, example Azure DevOps with git, to ensure a referenced record of what is deployed to any environment.
 
**We cannot emphasize enough the important role of version control to ensure good code hygiene and to provide historical records, checkpoints and synchronization points.**


# How to deploy code and synchronize database on the Unified Developer Environment 
   
| # | I want to | Deployment method | Notes |
|---|---|---|---|
|1|Deploy one or many modules that are already built | Use the **Dynamics 365** > **Deploy** > **Deploy models ...** dialog.|You can optionally synchronize the database for the modules.|
|2|Deploy one or many modules as part of a full build | Initiate via the **Dynamics 365** > **Build models** dialog after setting the option to **Deploy to connected online environment** .|You can optionally synchronize the database for the modules using the **synchronize database** setting on the same **Options** tab.|
|3|Deploy one or many modules as part of a build/rebuild of X++ projects from Solution Explorer | Initiate via build/rebuild of the project(s) or solution after setting the option to **Deploy changes to online environment** . This only deploys changes since the last successful deployment and is faster |You can optionally synchronize the database for the included changes|
|4|Deploy one module for a given X++ project from the Solution Explorer | Initiate via Right-clicking the project and choosing **Deploy model for project ...**.| This will only deploy changes since last successful deployment but will not synchronize the database for the module.|
|5|Not deploy any module but Synchronize the database for all modules in the environment | Initiate via **Dynamics 365** > **Synchronize database...** dialog.|Is a long running operation since DBSync is run for all modules|

> [!NOTE]
> Continuous incremental build and deployment could be much faster than full deployment for large modules.
> For binary only modules received from ISVs or other third parties do a full deployment and DB sync.
> Do not change and try to deploy system modules.

## How to add modules received from ISVs or others

You can receive X++ modules in many different ways. It could be shared with you as zip files or fully deployable packages, individually or a collection of modules, with code or binary only, including ISBV licenses or not.

In all these cases you would want to version them by checking them into some version control system. You would then want to update the active metadata configuration to refer to them.  

Proceed by adding a new reference in **Folders for reference metadata** by clicking the **Add** button and navigating to the common parent folder for all the reference modules.
As an example if you want to add Module01 and Module02, place them in a common folder example E:\ISVModules and then refer the latter parent folder.


## How do I include a license for my modules?

Licenses can be directly included and deployed by placing them in the __License (with _two_ underscores) folder in the model, at the same level as your bin folder. This license is verified and applied when you deploy the package.

As an example if you want to add a license file __licenseFile01__ for for Module01 present at E:\ISVModules\Module01, create a child folder E:\ISVModules\Module01\__License and place the file in it as E:\ISVModules\Module01\__License\licenseFile01.

Additionally, a **Full DB Sync** from the Dynamics 365 menu in **Extensions** is required for the applied license to take effect.

Learn more at [Independent software vendor (ISV) licensing](/dynamics365/fin-ops-core/dev-itpro/dev-tools/isv-licensing)


## How can I convert a fully deployable package (Lifecycle Services legacy package) into the new format to be compatible for deployment to environments?

Locate ModelUtil.exe inside the bin folder and run it from the command line to see usage. 

Choose the -convertToUnifiedPackage option and provide the package zip and output location as parameters.


## How to troubleshoot deployment or DBSync failures?

The package deployment could fail in various stages including DB sync, for various reasons including developer bugs. A link to download operation logs is available in the Visual Studio output pane. It's downloaded if there were failures, or if you enable the setting in **Tools> Options> Power Platform Tools**.

You can also download the logs from your Dataverse organization:

- Login to the Dataverse organization
- Find **Finance and Operation Package Manager App** on the main page
- Select the app and then from left pane, select **Operation History**
- Open the respective record by selecting the **Operation Name** and download the operation logs (`operationlogs.zip` file)


## Deployment and DBSync succeeded but I want to troubleshoot my changes?

If deployment and DB Sync are successful, you should execute your scenario and contrast expected and actual behavior for clues. Infolog is often very helpful in this case.

If above is not enought you should attach the debugger to the running AOS process in the unified environment using the menu **Dynamics 365** > **Launch debugger**.

Executing the scenario this time with a few breakpponts set will give you better insight.

We recommend writing X++ unit tests for your code to ensure regressions are easily and quickly detected.

You could also use Application Insights to monitor and diagnose the application executing in the unified developer environment.

Learn more about observability: [Monitoring and telemetry using Application Insights](/dynamics365/fin-ops-core/dev-itpro/sysadmin/monitoring-and-telemetry-appinsights)


## What information do I provide to Microsoft Support?

The correlation ID, client machine name, and timestamp are required for Microsoft to investigate. The correlation ID is in the Visual Studio output pane. 

The logs are also written to Microsoft.PowerPlatformVSExtension*.log files in C:\Users\<user>\AppData\Local\Microsoft\Dynamics365\Logs.

Additionally, a log file named VisualStudioD365Extension*.log is generated at a path similar to C:\Users\AppData\Roaming\Microsoft Corporation\Microsoft® Visual Studio®\<version>\VisualStudioD365Extension-*.log.

### See also

[Unified Development Experience for Finance and Operations | Dynamics 365 FastTrack Tech Talk](https://www.youtube.com/watch?v=OuEZ1rXkpYY)  
[Write, deploy, and debug X++ code](finance-operations-debug.md)
[Unit testing in the unified developer experience](finance-operations-testing.md) 
[Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)  
[Manage Dynamics 365 apps](../../admin/manage-apps.md)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
