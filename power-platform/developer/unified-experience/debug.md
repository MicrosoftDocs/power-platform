---
title: "Debug in the unified developer experience"
description: "Learn how to write an X++ class, deploy, and debug it in the unified developer experience."
author: pvillads
ms.date: 08/21/2023
ms.topic: article
audience: Developer, IT Pro
ms.reviewer: phecke
ms.search.region: Global
ms.author: pvillads
ms.collection: get-started
---

# Debug in the unified developer experience (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

The unified developer experience for Dynamics 365 Finance and Operation apps enables you to write code on your local development computer and run it inside a cloud service. There exists a separation of functionality between these two tiers (local and cloud).

 - Development tier - contains the finance and operations metadata and any X++ source code on your local development computer
 - Execution tier - cloud hosted site that stores the business data and executes X++ code

This article we will show you how to:
1. Build a small runnable class in X++
2. Deploy the class to the cloud runtime
3. Start the debugger and debug the X++ code

Let's begin by developing a runnable X++ class to use as an example. The classes only task is to log a message into the infolog<!--what is this?-->. The important thing here is not what the runnable class does, rather it is how we compile, run, and debug it.

As a prerequisite, you will need access to have a working Power Platform developer environment with the Finance and Operations apps installed. You will also need to install the Power Platform tools extension for Visual Studio. <!--Add link-->

More information: <!--Link to PPAC article-->

## Create a model

We will start by creating a model in Visual Studio.

1. Launch Visual Studio and choose **Continue without code**.
1. Choose the menu option **Extensions** > **Dynamics 365** > **Model management** > **Create model...**. If you do not see this menu option, you don't have the required Visual Studio extension installed.
1. Use the example model name "MyTestModel" when prompted by the wizard, providing relevant information for the rest of the required information.

    :::image type="content" source="../media/unified-experience/devexp-debug-create_model1.png" alt-text="Add parameters":::

1. On the next page of the wizard make sure you are creating a new package.

    :::image type="content" source="../media/unified-experience/devexp-debug-create_model2.png" alt-text="Select package":::

1. Fill in the referenced models. You only need to specify dependencies on the Application Platform and Application Foundation packages in this trivial example.

    :::image type="content" source="../media/unified-experience/devexp-debug-create_model3.png" alt-text="Select referenced packages":::

1. Click **Next** multiple times until the package has been created.

## Add and compile the runnable X++ class

Now create the project that will contain the runnable class. The name is not important here - In this case we will keep the default name, i.e. FinanceOperations3. Now add a runnable class to the project in the Solution explorer by right clicking the project, selecting the Add menu | New Item. Select a Runnable Class in the Code menu in Dynamics 365 Items, and call it MyRunnableClass. Visual Studio will open a window with the template for a runnable class providing a static main method that will be called as the runnable class runs. Since we are only providing a token implementation here, we will simply add a call to log a string message in the infolog:

internal final class MyRunnableClass
{
    public static void main(Args _args)
    {
        Info('Hello World from the Server Side');
    }
}

Now we will compile that class, to make sure we did not introduce any errors to this very simple code: The compilation is done by selecting Build from the context menu on the project. 

## Deploy the class

All the work that we have done uptil now has happened on the client side. The X++ compiler and the related tools are all intalled here, along with the metadata that defines the application you are developing against. You can use the Configure Metadata menu item to manage the configuration that you are working with. Now the time has come to execute the code, and for this we will need to deploy the code to the server tier. For this, you can use the Extension | Dynamics 365 | Deploy | Deploy Models to Online Environment. The dialog that appears will allow select the packages to deploy. In this case, you will need to select the MyTestModel. You can easily find that model by using the search field at the top of the list of packages. At the bottom of the dialog you will see the packages that are referenced. Since these are part of the code that Microsoft ships, you do not need to deploy them - They are already installed on the server tier.

At this point you are accessing the endpoint in the cloud, so you will likely need to authenticate. Use your Dataverse credentials to connect to Dataverse and select the solution to work against. After a little while, the authentication has been completed.

You can follow the progress of the deployment by going to the "FinOps Cloud Runtinme" channel in the Visual Studio Output window. Once that is complete, you can see log information by following the link in the output window. 

## Debug the code

Now we have compiled the code, and we have uploaded it to the cloud endpoint. Now the bits are ready to be executed. To check that all is well with our extraordinarily complex code, we will now debug it. Before we do, set the debugging options to load the symbols for your package, and also for applicationplatform and applicationfoundation. Do this by opening the options from the Extensions menu, and go to the debugging tab. Here you will find the Debugging page that shows options for loading symvols. Make sure you indicate that you want to load the items in your solution and also the ApplicationFoundation and ApplicationPlatform packages. This will be useful later.

Now set a breakpoint in the line where we call the info method. Then press the green arrow to start debugging, or use the F5 keyboard shortcut.

You will see a browser open with a URL that designates the runnable class. After a little while the browser will load the form that shows that the class runner is active, and is executing the MyRunnableClass class. Then the debugger will load the symbols for your project and hit the breakpoint.

After you continue execution (by pressing F5) you will see that the infolog pane in Visual Studio shows the message we entered into the infolog using the call to info(). Now go to the browser and refresh it, loading the URL. You will see that the breakpoint loads immediately: The debugger is still running, and the message will appear a second time in the infolog, without restarting the debugger. This technique is especially useful when running forms: You can always refresh the browser, and the form will be loaded again, without any delay caused by loading the symbols. 

Let us try that. Instead of tediously writing our own form all over again, we will use a form that already exists, namely the SysUserSetup form that allows you to set the colorization (i.e. the theme) used to render forms. We will change the URL open the SysUserSetup form instead of running the class by changing the menuitem (mi) that part that designates the menu item to start the class runner. The URL will end up with something like:

https://<environment?prt=initial&debug=vs&activityid=<unchanged>&cmp=DAT&mi=SysUserSetup

You will now see the form that allows you to set the colors in Dynamics open. 

Now let us set a breakpoint in the form. First open the application explorer from the View menu. Then enter the string 'SysUserSetup type:"form"' in the search bar in the Application Explorer window. Select the form there, and select View Code to open the editor with the source code for this form.

In that form, set a breakpoint in the selectionChange() method in the ThemeChooser control. This code will be triggered when the user selects a new color theme. Then, in the browser, select one of the colored squares, say the red one. You will hit the breakpoint. Continue the execution with F5 and hit another colored square and the breakpoint will be triggered again.

## Summary

As a recap, here is a summary and the points to take away from this exersize. We started with using Visual Studio to create a simple runnable class. After the compilation, the package needed to be pushed to the cloud endpoint for execution: X++ code can only be executed in the cloud, so we performed a deployment operation. Once the deployment was complete, we executed the code by setting a breakpoint and running the debugger. We then started a form from the browser, and noticed that breakpoints were hit correctly as the form was used and that we did not have to restart the debugger for that to happen. In fact, the debugger can be started by using the "Launch Debugger" option on the Extension menu. You can then enter the URL in the browser and the breakpoints will be hit.

### See also

[Finance and operations apps documentation](/dynamics365/fin-ops-core/fin-ops/)<br/>
[Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment)<br/>
[Manage Dynamics 365 apps](/power-platform/admin/manage-apps)