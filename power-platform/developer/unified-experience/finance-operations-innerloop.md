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


# How to deploy to and synchronize database on the Unified Developer Environment 
   
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

## Prerequisites

You should have access to a unified developer environment, the Visual Studio tools extensions installed and configured on your developer machine and connected to the same environment. It's important to keep the metadata changes on your developer machine deployed to the connected environment .
More information: [Install and configure development tools](finance-operations-install-config-tools.md)

## Create a model

We start by creating a model in Visual Studio.

1. Launch Visual Studio and choose **Continue without code**.
1. Choose the menu option **Extensions** > **Dynamics 365** > **Model management** > **Create model...**. If you don't see this menu option, you don't have the required Visual Studio extension installed.
1. Enter a model name of "MyTestModel" when prompted by the form, providing relevant information for the rest of the required information.

    :::image type="content" source="../media/unified-experience/devexp-debug-create_model1.png" alt-text="Add parameters":::

1. On the next step of the form, choose **Create new package**.

    :::image type="content" source="../media/unified-experience/devexp-debug-create_model2.png" alt-text="Select package":::

1. Choose all referenced models. You only need to specify dependencies on the Application Platform and Application Foundation packages in this trivial example.

    :::image type="content" source="../media/unified-experience/devexp-debug-create_model3.png" alt-text="Select referenced packages":::

1. Select **Next** multiple times until the package has been created.

## Add and compile the runnable X++ class

Create a project and X++ class in Visual Studio by following these steps.

1. Create a project in Visual Studio that contains the runnable class. The name of the class isn't important here. For this exercise, keep the default name that is FinanceOperations3.
1. Add a runnable class to the project in **Solution Explorer** by right-clicking the project and choosing **Add** > **New item**.
1. Select a **Runnable Class** in the **Code** menu under **Dynamics 365 items**, and call it "MyRunnableClass". Visual Studio opens a window with the template for a runnable class providing a static `main` method that is called as the runnable class runs.
1. Add the following X++ code to the `main` method. Since we're only providing a token implementation here, add a call to log a string message in the Infolog:

  ```xpp
  internal final class MyRunnableClass
  {
      public static void main(Args _args)
      {
          Info('Hello World from the Server Side');
      }
  }
  ```

Compile the class to make sure you didn't introduce any errors to this code. The compilation is done by selecting **Build** from the context menu on the project.

## Deploy the class

All the work that we have done up until now has happened on the client side. The X++ compiler and the related tools are all installed locally, along with the metadata that defines the application you're developing against. In Visual Studio, you can use the **Configure Metadata** menu item to manage the configuration that you're working with.

Now the time has come to execute the code, and for code execution you need to deploy the code to the server (cloud) tier. For this operation, use the **Extension** > **Dynamics 365** > **Deploy** > **Deploy Models to Online Environment** menu item. The dialog that appears allows you to select the packages to deploy. In this case, you need to select "MyTestModel". You can easily find that model by using the search field at the top of the list of packages. At the bottom of the dialog, see the packages that are referenced. Since these packages are part of the code that Microsoft ships, you don't need to deploy them as they're already installed on the server tier.

:::image type="content" source="../media/unified-experience/D365FinOpsDeployDialog.png" alt-text="The deploy modules dialog":::

At this point you're accessing the endpoint in the cloud, so unless you are already logged in you likely need to authenticate and connect to the environment. Use your Microsoft Dataverse credentials to connect to Dataverse and select the solution to work against. After a short wait, the authentication will complete.

> [!IMPORTANT]
> There are different ways to deploy your changes to the unified development environment.
>
> 1. Deploy the full model via the **Dynamics 365** > **Deploy** > **Deploy models ...** dialog. You can choose to synchronize the database if so desired.
>
> 2. As part of a full build, deploy the full model. This deployment is initiated via the **Dynamics 365** > **Build models** dialog if the option to **Deploy to connected online environment** is turned on. The tool will synchronize database or not based on the **synchronize database** setting on the same **Options** tab.
>
> 3. As part of an incremental build from Solution Explorer, setting **Deploy changes to online environment** to true will only deploy changes since the last successful deployment or those made as part of this build. It will honor the project settings for **Synchronize database**.
>
> 4. Right-click a project and choose to **Deploy model for project ...**. This will only deploy changes since last successful deployment but will not synchronize the database for the module.
>
> 5. Synchronize the database for all models without deploying anything new via **Dynamics 365** > **Synchronize database...**.

You can follow the progress of the deployment by navigating  to the "FinOps Cloud Runtime" drop down in the Visual Studio output window. Once that deployment is complete, you can see log information by following the link displayed in the output window.

## Debug the deployed code

After you have compiled the project code and uploaded it to the cloud endpoint, the binary is ready to be executed. To verify that all is well with the compiled class code, debug it.

1. In Visual Studio, set the debugging options to load the symbols for your package and also for ApplicationPlatform and ApplicationFoundation packages.

    To set the options, start by opening the options from the **Extensions** menu, and go to the debugging tab. The **Debugging** page shows options for loading symbols. Make sure you indicate that you want to load the items in your solution and also the ApplicationFoundation and ApplicationPlatform packages.

1. Set a breakpoint in the line where we call the `Info` method and then press the green arrow in the toolbar, or use the F5 keyboard shortcut, to start debugging.

    A browser window opens with a URL that designates the runnable class. After a little while the browser loads the form that shows that the class runner is active, and is executing the MyRunnableClass class. Next, the debugger loads the symbols for your project and execution stops at the breakpoint.

1. Press F5 to continue execution and then see that the Infolog pane in Visual Studio shows the message we entered into the Infolog using the call to the `Info` method.

1. Refresh the browser window, which reloads the URL.

    You'll see that the breakpoint loads immediately. The debugger is still running, and the output message appears a second time in the Infolog without restarting the debugger. This technique is especially useful when running forms. You can always refresh the browser, and the form is loaded again without any delay caused by loading the symbols.

Let's now try that. Instead of tediously writing our own form all over again, use a form that already exists. Start by using the SysUserSetup form that allows you to set the colorization (theme) used to render forms. We'll change the URL to open the SysUserSetup form instead of running the class by changing the menuitem (mi) - that part that designates the menu item to start the class runner. The URL will end up with something like this:

`https://<environment>?prt=initial&debug=vs&activityid=\<unchanged>&cmp=DAT&mi=SysUserSetup`

You'll now see the form that allows you to choose the colors.

Now let's set a breakpoint in the form.

1. Open the **Application Explorer** from the **View** menu.
1. Enter the string `SysUserSetup type:"form"` in the search bar in the Application Explorer window.
1. Select the form, and select **View code** to open the editor with the source code for this form.
1. In that form, set a breakpoint in the `selectionChange` method in the ThemeChooser control. This code is triggered when the user selects a new color theme.
1. In the browser window, select one of the colored squares, let's say the red one. You'll hit the breakpoint.
1. Continue the execution by pressing F10 or F5. Another colored square is hit and the breakpoint is triggered again.
1. You can watch the locals, set new breakpoints and do various debugging tasks. 

> [!IMPORTANT]
> If you want to attach the debugger to the running AOS process in the unified environment use **Dynamics 365** > **Launch debugger**.
>
> To detach the debugger from the runtime without restarting the AOS, use **Detach in place of Stop**.
>
> Use Application Insights to monitor and diagnose the application executing in the unified development environment. Learn more about observability: [Monitoring and telemetry using Application Insights](/dynamics365/fin-ops-core/dev-itpro/sysadmin/monitoring-and-telemetry-appinsights)

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
