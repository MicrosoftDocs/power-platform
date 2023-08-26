---
title: "Frequently asked questions (preview)"
description: FAQs for the Power Platform unified developer experience.
author: pvillads
ms.date: 08/22/2023
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

This happens when provisioning fails. Contact Microsoft Support with the environment name and tenant ID.

### I can't provision an environment with PowerShell 7

Use Windows PowerShell instead of PowerShell 7

### My provisioning fails with an error about missing licenses

When you get the following error, ensure that you have licenses for the template you're deploying.

Error message:

"You don't have the required Dynamics 365 licenses to create a database with `<app name>` Dynamics app."

## Developer setup (metadata download, configuration, connecting to an environment)

### I can't access SQL Server using my SQL Server Management Studio client running in a OneBox environment

We don't currently have a solution for secure connection to SQL Server running behind a cloud endpoint. A TDS endpoint (like the one Dataverse has) will be developed to provide read-only queries to a database from SQL Server Management Studio. There's also a JIT access that will allow you to access the data after providing authentication.

### The Configure Metadata option doesn't appear on the menu

When this happens, open the Infolog and the menu should appear.

### PackagesLocalDirectory extraction doesn't complete

Use [7Zip](https://www.7-zip.org/download.html) to extract the metadata.

### The message "Please wait for update to complete" pop up keeps appearing

When metadata is configured, this should stop.

### Cross reference database validation keeps failing

Ensure that your Windows user has access to the specified SQL Server or LocalDB. The following instructions describe a local DB setup.

1. Download the LocalDB 2019 installer by using the [SQL Server Express installer](https://go.microsoft.com/fwlink/?linkid=866658).
1. Run the installer and select "Download Media"
1. Select "LocalDB" and **Download**
1. Before running the SqlLocalDB.msi installer, delete your current MSSQLLocalDB instance:

```powershell
sqllocaldb stop MSSQLLocalDB
sqllocaldb delete MSSQLLocalDB
```

5. Run the new SqlLocalDB.msi (2019) installer. It creates a new MSSQLLocalDB instance.

### I get the a missing licenses error when running unified developer experience operations

When you get the following error, contact Microsoft Support with environment details to fix the issue.

Error message:

"Principal user (Id=`<Redacted>`, type=8, rollCount=2, privilegeCount=<>, accessMode=1, MetadataCachePrivilegesCount=7371, businessUnitId=`<Redacted>`(Setup/Stub unlicensed user with filtered privileges from associated roles. Consider assigning license.)), is missing prvCreatemsprov_fnopackage privilege"

## Unified developer experience operations (apply package, debugging, copy, pipeline setup, package conversion)

### My Operations fails with error EnvironmentNotInReadyState

This happens when the the unified developer environment isn't ready to service the request. Retry after a few minutes. You can check if the environment is in the ready state by opening the finance and operations environment link.

### My source environment version is <10.0.35. Why can't I copy from it?

Unified developer experience functionality is available for version 10.0.35 and later. Since during copy we also copy compute, if the source environment is earlier than 10.0.35 the target loses unified developer experience functionality.

### I provisioned an environment from UI, but am unable to run unified developer experience operations

The UI doesn't provision online environments. Only sandbox and production environments are provisioned via the UI, and unified developer experience operations aren't supported on these environments. Provision OnlineDev environments via the command line, and then run unified developer experience operations.

### Is package deployment of the unit test code required for executing tests in the cloud runtime?

Yes. Any new tests or modifications must be deployed to the environment for the test execution to succeed.

### What dependencies are needed for running unit tests on a new model?

Application Foundation and Test Essentials are required for unit test execution.

### For the preview release, how can I set up a pipeline that automates creation and application of a deployable package to a new environment?

Reach out over Yammer or other method to provide your organization name. Microsoft shares a marketplace extension that can be installed and used in creating a new pipeline setup. It's capable of package creation, ISV license addition, and application of the package.
This extension will soon be merged into the current generally available extension, so that no new installation will be needed. For details, see this [Yammer](https://www.yammer.com/dynamicsaxfeedbackprograms/#/files/1740962955264) reference.

### How do I include a license and directly deploy from Visual Studio?

Licenses can be directly included and deployed by placing them in the __License (with _two_ underscores) folder in the model, at the same level as your bin folder. This will be verified and applied when you deploy the package.

Additionally, a **Full DB Sync** from the Dynamics 365 menu in **Extensions** is required for the applied license to take effect.

### How can I convert a Fully deployable package (Lifecycle Services legacy package) into the new format to be compatible for deployment to environments?

Locate ModelUtil.exe inside the bin folder and run it from the command line to see usage. Choose the `-convertToUnifiedPackage` option and provide the package zip and output location as parameters.

### Trace parser doesn't work on my Visual Studio client

The trace parser is being updated to support working on unified clients. Analyze the trace using trace parser on existing finance and operations developer machines.

### Stopping debugging restarts the runtime

Use **Detach All** to end debugging.

## Checking logs and history

### I applied a package, but it failed. How can I do further debugging to determine the failure?

Details to access logs will be available in the Visual Studio output pane in case of failures, or if you mark the settings to download logs after every request.

### How can I find out what packages are applied to my environment?

Go to the Dataverse environment and check the OperationsHistory table to download the logs.

### My operation failed, and wasn't able to find sufficient information in the logs. How can I get a correlation id to provide to Microsoft Support?

The correlation id is in the output pane. The client machine name with timestamp is also sufficient for Microsoft to obtain telemetry information.

### See also

[Unified developer experience for finance and operations apps (preview)](finance-operations-dev-overview.md)
