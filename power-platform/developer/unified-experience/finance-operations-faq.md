---
title: "Frequently asked questions"
description: "FAQs for the Power Platform unified developer experience."
author: pvillads
ms.date: 06/06/2024
ms.topic: faq
ms.reviewer: pehecke
ms.author: pvillads
ms.subservice: developer
---

# Frequently asked questions

This FAQ answers common questions regarding the unified developer experience for finance and operations apps.

## Licensing, capacity, and environment provisioning

### My environment shows as preparing in Power Platform admin center, but is now disappeared. Why did my environment deployment fail?

This missing environment situation happens when provisioning fails. Contact Microsoft Support with the environment name and tenant ID.

### I can't provision an environment with PowerShell 7

Use Windows PowerShell instead of PowerShell 7

### My provisioning fails with an error about missing licenses

When you get the following error, ensure that you have licenses for the template you're deploying.

Error message:

"You don't have the required Dynamics 365 licenses to create a database with `<app name>` Dynamics app."

### How can I provision or update my unified environment to a specific finance and operations version

We currently don't have the capability to provision or update the environment to a specific runtime update or version. Support for versions is planned, but until enabled, we suggest using the environment copy feature to get your unified development environment on the same version as the sandbox or production environments. [Copy a Lifecycle Services environment to a unified environments](../../admin/unified-experience/tutorial-copy-lifecycle-services-environment-unified-environment.md)

## Developer setup (metadata download, configuration, connecting to an environment)

### Can I watch a presentation and demos covering core developer scenarios

Yes, one such place among others is [Unified Development Experience for Finance and Operations | Dynamics 365 FastTrack Tech Talk Dev](https://www.youtube.com/watch?v=OuEZ1rXkpYY)

### I connected to the environment from Visual Studio but didn't get any pop-up to download metadata

Ensure that the unified development environment you created is a unified development environment of type **Sandbox**. A **Trial** environment doesn't work.

### The Configure Metadata option doesn't appear on the menu

When this option is missing from the menu, open Infolog from the menu and retry. This issue is addressed in application version 10.0.39 and higher.

### How do I redownload the client assets?

In Visual Studio from the **Tools** menu, select **Download Dynamics 365 FinOps assets**.

### PackagesLocalDirectory extraction doesn't complete

You can configure settings using the Visual Studio setting **Tools** > **Options** > **Power Platform Tools**.
The option **Auto setup for Dynamics 365...** is enabled by default. This setting ensures you don't have to manually extract system metadata or create the metadata configuration. The tool configures metadata for you. The Visual Studio output pane informs you of any user action needed.

You can still use [7-Zip](https://www.7-zip.org/download.html) to extract the metadata.

### The message "Please wait for update to complete" popup keeps appearing

When a configuration is created, saved, and the dialog closed, the necessary files are updated and this popup doesn't appear. If the dialog keeps recurring even after you open a new Visual Studio instance, the find the file C:\Users\<user>\AppData\Local\Microsoft\Dynamics365\<AppVersion>\PackagesLocalDirectory\bin\InstalledVersion.json in reference metadata folder and update the version to match the platform version in your environment.

### Cross reference database validation keeps failing

Ensure that your Microsoft Windows user has access to the specified SQL Server or LocalDB. The following instructions describe a LocalDB setup.

1. Download the LocalDB 2019 installer by using the [SQL Server Express installer](https://go.microsoft.com/fwlink/?linkid=866658).
1. Run the installer and select **Download Media**
1. Select "LocalDB" and **Download**
1. Before running the SqlLocalDB.msi installer, delete your current MSSQLLocalDB instance:

```powershell
sqllocaldb stop MSSQLLocalDB
sqllocaldb delete MSSQLLocalDB
sqllocaldb create MSSQLLocalDB -s
```

5. Run the new SqlLocalDB.msi (2019) installer. It creates a new MSSQLLocalDB instance.

### I get a missing licenses error when running unified developer experience operations

When you get the following error, contact Microsoft Support with environment details to fix the issue.

Error message:

"Principal user (Id=`<Redacted>`, type=8, rollCount=2, privilegeCount=<>, accessMode=1, MetadataCachePrivilegesCount=7371, businessUnitId=`<Redacted>`(Setup/Stub unlicensed user with filtered privileges from associated roles. Consider assigning license.)), is missing prvCreatemsprov_fnopackage privilege"

## Unified developer experience operations (apply package, debugging, copy, pipeline setup, package conversion)

### My Operations fails with error EnvironmentNotInReadyState

This result happens when the unified developer environment isn't ready to service the request. Retry after a few minutes. You can check if the environment is in the ready state by opening the finance and operations environment link.

### What is the earliest version of source environment I can copy from?

Unified developer experience functionality is generally available for version 10.0.39 and later. During copy we also copy compute. Therefore, if the source environment is earlier than the target, you might lose some unified developer experience features made available only in the more recent version.

### Is package deployment of the unit test code required for executing tests in the cloud runtime?

Yes. Any new tests or modifications must be deployed to the environment for the test execution to succeed.

### What dependencies are needed for running unit tests on a new model?

Application Foundation and Test Essentials are required for unit test execution.

### How can I set up a pipeline that automates creation and application of a deployable package to a new environment?

Use the latest version of the Azure DevOps extension from the marketplace. It's capable of package creation, ISV license addition, and application of the package. Refer to [Dynamics 365 Finance and Operations Tools](https://marketplace.visualstudio.com/items?itemName=Dyn365FinOps.dynamics365-finops-tools).

### How can I deploy packages received from ISVs to my Unified Developer Environment?

Place the ISV modules in a common folder. Add this common parent folder of all ISV modules to the existing list of reference metadata folders in the active configuration you intend to use. For more information, see [Install and configure development tools](finance-operations-install-config-tools.md).

### How do I include a license and directly deploy from Visual Studio?

Licenses can be directly included and deployed by placing them in the __License (with _two_ underscores) folder in the model, at the same level as your bin folder. This license is verified and applied when you deploy the package.

Additionally, a **Full DB Sync** from the Dynamics 365 menu in **Extensions** is required for the applied license to take effect.

### How can I convert a fully deployable package (Lifecycle Services legacy package) into the new format to be compatible for deployment to environments?

Locate `ModelUtil.exe` inside the bin folder and run it from the command line to see usage. Choose the `-convertToUnifiedPackage` option and provide the package zip and output location as parameters.

### How can I create a fully deployable package (Lifecycle Services legacy package) from Visual Studio?

For UDE, we moved on to the Power Platform Unified Package format, but you can still create the fully deployable package from Azure DevOps pipelines in addition to the unified format.

### Stopping debugging restarts the runtime

Use **Detach All** to end debugging in place of **Stop Debugging**.

### Are you still improving developer experiences in UDE?

Yes, we're focused on improving developer experiences across all scenarios encompassing F&O, Dataverse and all of Power Platform. These include sign-in, deployment, troubleshooting, SSRS and richer, uniform / modern UX across the board.

## Checking logs and history

### I applied a package, but it failed. How can I do further debugging to determine the failure?

The package deployment can fail in various stages including DB sync, for various reasons including developer bugs. A link to download operation logs is available in the Visual Studio output pane. Logs download if there are failures or if you enable the setting in **Tools** > **Options** > **Power Platform Tools**.

You can also download the logs from your Dataverse organization:

- Sign in to the Dataverse organization.
- Find **Finance and Operation Package Manager App** on the main page.
- Select the app and then from left pane, select **Operation History**.
- Open the respective record by selecting the **Operation Name** and download the operation logs (`operationlogs.zip` file).

### How can I find the history of packages applied, DB sync, and other updates to my environment?

You can check the packages applied and other updates to your Finance and Operations environment with the following steps:

- Sign in to the Dataverse organization.
- Find **Finance and Operation Package Manager App** on the main page.
- Select the app and then select **Package** in the left pane to see packages applied to your Finance and Operations environment.
- Select **Operation History** to see the history of operations performed on your Finance and Operations environment.

### My operation failed, and wasn't able to find sufficient information in the logs. What information do I provide to Microsoft Support?

The correlation ID, client machine name, and timestamp are required for Microsoft to investigate. The correlation ID is in the Visual Studio output pane.

The logs are also written to `Microsoft.PowerPlatformVSExtension*.log` files in `C:\Users\<user>\AppData\Local\Microsoft\Dynamics365\Logs`.
Additionally, a log file named `VisualStudioD365Extension*.log` is generated at a path similar to `C:\Users\AppData\Roaming\Microsoft Corporation\Microsoft® Visual Studio®\<version>\VisualStudioD365Extension-*.log`.

### How do I monitor and diagnose deployed code running in the unified environment?

Use Application Insights to monitor and diagnose the application executing in the unified developer environment.

Learn more about observability: [Monitoring and telemetry using Application Insights](/dynamics365/fin-ops-core/dev-itpro/sysadmin/monitoring-and-telemetry-appinsights)

### See also

- [Unified Development Experience for Finance and Operations | Dynamics 365 FastTrack Tech Talk Dev](https://www.youtube.com/watch?v=OuEZ1rXkpYY)  
- [Unified developer experience for finance and operations apps](finance-operations-dev-overview.md)  
- [Install and configure development tools](finance-operations-install-config-tools.md)  
- [Write, deploy, and debug X++ code](finance-operations-debug.md)  
- [Unit testing in the unified developer experience](finance-operations-testing.md)
