---
title: "Write, deploy, and debug X++ code across multiple environments"
description: "Learn how to work with multiple unified developer environments."
author: pathaku
ms.date: 06/06/2024
ms.topic: how-to
ms.reviewer: phecke
ms.author: pathaku
ms.subservice: developer
---


This article shows you how to:

1. Write and compile a runnable X++ class
2. Deploy the class to the cloud runtime
3. Debug the deployed X++ code
   
> [!IMPORTANT]
> You can learn more by watching presentation and demos done for the Dynamics 365 FastTrack Tech Talk series
> 
> [Unified Development Experience for Finance and Operations | Dynamics 365 FastTrack Tech Talk](https://www.youtube.com/watch?v=OuEZ1rXkpYY)
 
# A developer Machine and Multiple Unified Developer Environments 

A developer machine can be used to connect to multiple unified developer environments. 
An instance of Visual Studio can at any time be connected to only one environment.
An instance of Visual Studio can at any time have only one metadata configuration active. You can switch the active configuration using the menu **Extensions** > **Dynamics 365** > **Configure Metadata**.
Switching the active metadata configuration does not change the environment you are connected to. You can change it from the menu **Tools** > **Connect to Dataverse**.
The description, custom metadata folder, etc. should be used to ensure the appropriateness of the configuration for an environment. The same configuration may be valid for 2 environments with same F&O application and platform versions.It is still better to have a metadata configuration per environment though these configurations can have common values for custom and reference metdata folder, etc.
Different environments with the same F&O application and platform version could be used for different purposes with the active custom and reference metadata determining what gets developed, built and deployed. It is best to have a metadata configuration per environment.
Different environments with different F&O application and platform versions could be used for different purposes. It is recommended in this case that the F&O Visual studio extension versions match with the environment. Commonly, though if there are no breaking changes among the various targeted application and platform versions using the oldest version for the F&O Visual Studio extension version would ensure that the built artficats are compatible with higher runtime versions in the environments.


> [!IMPORTANT]
> **A Unified Developer Environment and multiple developer machines**

> Any developer machine can be used to connect to a unified developer environments.
> 
> Whether it is the same or a different developer if multiple developer machines are used it becomes more likely, but not inevitable, to unintentionally corrupt the common Unified Developer Environment, by deploying changes that did not account for what was already deployed to the same environment.
> 
> The situation described above can also happen from the same developer machine, in case the custom metadata code loses consistency, for example by switching git branches.
> 
> **We cannot emphasize enough the important role of version control to ensure good code hygiene and to act as a historical record, checkpoints and synchronization points.**


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

Learn more at [Independent software vendor (ISV) licensing](../../../dynamics365/fin-ops-core/dev-itpro/dev-tools/isv-licensing)


## Summary

As a recap, here's a summary and the points to take away from this exercise.

We started with using Visual Studio to create a simple runnable class. After the compilation, the package needed to be pushed to the cloud endpoint for execution. X++ code can only be executed in the cloud, so we performed a deployment operation. Once the deployment was complete, we executed the code by setting a breakpoint and running the debugger. We then started a form from the browser, and noticed that breakpoints were hit correctly as the form was used, and we did not have to restart the debugger for that to happen. In fact, the debugger can be started by using the **Launch debugger** option on the **Extension** menu. You can then enter a URL in the browser, execute the scenario to debug and the breakpoints will be hit.

### See also

[Unified Development Experience for Finance and Operations | Dynamics 365 FastTrack Tech Talk](https://www.youtube.com/watch?v=OuEZ1rXkpYY)  
[Unit testing in the unified developer experience](finance-operations-debug.md)
[Unit testing in the unified developer experience](finance-operations-testing.md) 
[Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)  
[Manage Dynamics 365 apps](../../admin/manage-apps.md)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
