---
title: "Frequently asked questions (preview)"
description: FAQs for the Power Platform unified developer experience.
author: pvillads
ms.date: 10/23/2023
ms.topic: faq
ms.reviewer: pehecke
ms.author: pvillads
ms.subservice: developer
---

# Frequently asked questions (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This FAQ answers common questions regarding the unified developer experience for finance and operations apps.

## Licensing, capacity, and environment provisioning

### My environment was showing as preparing in Power Platform admin center, but has now disappeared. Why has my environment deployment failed?

This missing environment situation happens when provisioning fails. Contact Microsoft Support with the environment name and tenant ID.

### I can't provision an environment with PowerShell 7

Use Windows PowerShell instead of PowerShell 7

### My provisioning fails with an error about missing licenses

When you get the following error, ensure that you have licenses for the template you're deploying.

Error message:

"You don't have the required Dynamics 365 licenses to create a database with `<app name>` Dynamics app."
### How can I provision or update my unified environment to a specific finance and operations version
We currently don't have the capability to provision or update the environment to a specific runtime update or version. Support for this is planned, but until this support is enabled, we suggest using the environment copy feature to get your unified development environment on the same version as that of sandbox or production environments. [Copy a Lifecycle Services environment to a unified environments](../../admin/unified-experience/tutorial-copy-lifecycle-services-environment-unified-environment.md)

## Developer setup (metadata download, configuration, connecting to an environment)

### I can't access SQL Server using my SQL Server Management Studio client running in a OneBox environment

We don't currently have a solution for secure connection to SQL Server running behind a cloud endpoint. A TDS endpoint (like the one Dataverse has) is planned to provide read-only queries to a database from SQL Server Management Studio. There's also a JIT access that will allow you to access the data after providing authentication.

### I connected to the environment from Visual Studio but didn't get any pop-up to download metadata

Ensure that the unified development environment you created is of type **Sandbox**. A **Trial** environment won't work.

### The Configure Metadata option doesn't appear on the menu

When this option is missing from the menu, open the Infolog from the menu and retry.

### How do I download again the client assets

When you connect to the unified development environment, the tool does a few checks and doesn't initiate download if the required assets were previously downloaded. In case you need to download again, simply rename/delete the child folder with the application version of the environment under %LOCALAPPDATA%\Microsoft\Dynamics365. 

### PackagesLocalDirectory extraction doesn't complete

Use [7-Zip](https://www.7-zip.org/download.html) to extract the metadata.

### The message "Please wait for update to complete" pop up keeps appearing

When a configuration is created, saved, and the dialog closed, the necessary files are updated and this popup will stop. If the dialog keeps recurring even after you open a new Visual Studio instance, the find the file PackagesLocalDirectory/bin/InstalledVersion.json in reference metadata folder and update the version to match the platform version in your environment.

### Cross reference database validation keeps failing

Ensure that your Microsoft Windows user has access to the specified SQL Server or LocalDB. The following instructions describe a local DB setup.

1. Download the LocalDB 2019 installer by using the [SQL Server Express installer](https://go.microsoft.com/fwlink/?linkid=866658).
1. Run the installer and select **Download Media**
1. Select "LocalDB" and **Download**
1. Before running the SqlLocalDB.msi installer, delete your current MSSQLLocalDB instance:

```powershell
sqllocaldb stop MSSQLLocalDB
sqllocaldb delete MSSQLLocalDB
```

5. Run the new SqlLocalDB.msi (2019) installer. It creates a new MSSQLLocalDB instance.

### I get a missing licenses error when running unified developer experience operations

When you get the following error, contact Microsoft Support with environment details to fix the issue.

Error message:

"Principal user (Id=`<Redacted>`, type=8, rollCount=2, privilegeCount=<>, accessMode=1, MetadataCachePrivilegesCount=7371, businessUnitId=`<Redacted>`(Setup/Stub unlicensed user with filtered privileges from associated roles. Consider assigning license.)), is missing prvCreatemsprov_fnopackage privilege"

## Unified developer experience operations (apply package, debugging, copy, pipeline setup, package conversion)

### My Operations fails with error EnvironmentNotInReadyState

This result happens when the the unified developer environment isn't ready to service the request. Retry after a few minutes. You can check if the environment is in the ready state by opening the finance and operations environment link.

### What is the earliest version of source environment I can copy from?

Unified developer experience functionality is available for version 10.0.35 and later. Since during copy we also copy compute, if the source environment is earlier than 10.0.35 the target loses unified developer experience functionality.

### I provisioned an environment from UI, but am unable to run unified developer experience operations

The UI doesn't provision online environments. Only sandbox and production environments are provisioned via the UI, and unified developer experience operations aren't supported on these environments. Provision OnlineDev environments via the command line, and then run unified developer experience operations.

### Is package deployment of the unit test code required for executing tests in the cloud runtime?

Yes. Any new tests or modifications must be deployed to the environment for the test execution to succeed.

### What dependencies are needed for running unit tests on a new model?

Application Foundation and Test Essentials are required for unit test execution.

### How can I set up a pipeline that automates creation and application of a deployable package to a new environment?

Use the latest version of the Azure DevOps extension from the marketplace. It's now capable of package creation, ISV license addition, and application of the package. Refer to [Dynamics 365 Finance and Operations Tools](https://marketplace.visualstudio.com/items?itemName=Dyn365FinOps.dynamics365-finops-tools).

### How do I include a license and directly deploy from Visual Studio?

Licenses can be directly included and deployed by placing them in the __License (with _two_ underscores) folder in the model, at the same level as your bin folder. This license is verified and applied when you deploy the package.

Additionally, a **Full DB Sync** from the Dynamics 365 menu in **Extensions** is required for the applied license to take effect.

### How can I convert a fully deployable package (Lifecycle Services legacy package) into the new format to be compatible for deployment to environments?

Locate ModelUtil.exe inside the bin folder and run it from the command line to see usage. Choose the `-convertToUnifiedPackage` option and provide the package zip and output location as parameters.

### Trace parser doesn't work on my Visual Studio client

The trace parser is being updated to support working on unified clients. Analyze the trace using trace parser on existing finance and operations developer machines.

### Stopping debugging restarts the runtime

Use **Detach All** to end debugging in place of **Stop Debugging**.

## Checking logs and history

### I applied a package, but it failed. How can I do further debugging to determine the failure?

A link to download operation logs is available in the Visual Studio output pane. It's downloaded if there were failures, or if you enable the setting in **Tools> Options> Power Platform Tools**.

### How can I find out what packages are applied to my environment?

Go to the Dataverse environment and check the **OperationsHistory** and **Packages** tables.

### My operation failed, and wasn't able to find sufficient information in the logs. What information do I provide to Microsoft Support?

The correlation ID, client machine name, and timestamp are required for Microsoft to investigate. The correlation ID is in the Visual Studio output pane. Additionally, a log file named VisualStudioD365Extension*.log is generated at a path similar to C:\Users\AppData\Roaming\Microsoft Corporation\Microsoft® Visual Studio®\16.11.32802.440\VisualStudioD365Extension-2022-08-12.log.

### How do I monitor and diagnose deployed code running in the unified environment?

Use Application Insights to monitor and diagnose the application executing in the unified developer environment.

Learn more about observability: [Monitoring and telemetry using Application Insights](/dynamics365/fin-ops-core/dev-itpro/sysadmin/monitoring-and-telemetry-appinsights)

### See also

[Unified developer experience for finance and operations apps (preview)](finance-operations-dev-overview.md)
