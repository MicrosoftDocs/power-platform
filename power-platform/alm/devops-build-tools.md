---
title: "Power Apps build tools for Azure DevOps | Microsoft Docs"
description: "Learn about the ALM-related tools, APIs, and services that are available to developers when using Azure DevOps."
keywords: 
author: phecke
ms.author: pehecke
manager: kvivek
ms.custom: ""
ms.date: 05/05/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Power Apps build tools for Azure DevOps

Use Power Apps build tools to automate common build and deployment tasks related
to Power Apps. This includes synchronization of solution metadata (also known as
solutions) between development environments and source control, generating build
artifacts, deploying to downstream environments, provisioning or de-provisioning
environments, and the ability to perform static analysis checks against your
solution by using the Power Apps checker service.

The Power Apps build tools tasks can be used along with any other available
Azure DevOps tasks to compose your build and release pipelines. Pipelines
that teams commonly put in place include Initiate, Build, and Release.

![ALM powered by Azure DevOps](media/initiate-build-release.png "ALM powered by Azure DevOps")

## What are Power Apps build tools?

The Power Apps build tools are a collection of Power Apps&ndash;specific Azure DevOps
build tasks that eliminate the need to manually download custom tooling and
scripts to manage the application lifecycle of Power Apps. The tasks can be used
individually to perform a simple task, such as importing a solution into a
downstream environment, or used together in a pipeline to orchestrate a
scenario such as "generate a build artifact," "deploy to test," or "harvest maker
changes." The build tasks can largely be categorized into four types:

- Helper

- Quality check

- Solution

- Environment management

## Get the Power Apps build tools

The Power Apps build tools can be installed into your Azure DevOps organization
from [Azure Marketplace](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerApps-BuildTools).
After they're installed, all tasks included in the Power Apps build tools will be
available to add into any new or existing pipeline. You can find them by
searching for **powerapps**.

![Get the Power Apps build tools](media/get-build-tools.png "Get the Power Apps build tools")

## Build tool tasks

The available build tasks are described in the following sections.

### Helper task

#### Power Apps Tool Installer

This task is required to be added once before any other Power Apps build tools tasks in build and
release pipelines. This task installs a set of Power Apps&ndash;specific tools required
by the agent to run the Power Apps build tasks. This task doesn't require any
additional configuration when added, but contains parameters for the specific versions
of each of the tools that are being installed.
To stay up to date with the tool versions over time, make sure these parameters correspond
to the versions of the tools that are required for the pipeline to run properly.

#### Power Apps WhoAmI

Verifies a Power Apps environment service connection by connecting and making a WhoAmI request. This task can be useful to include early in the pipeline, to verify connectivity before processing begins.

| Parameters    | Description   |
|---------------|---------------|
| Power Apps environment URL | The service endpoint for the environment to connect to. Defined under **Service Connections** in **Project Settings**. |

### Quality check

#### Power Apps Checker

This task runs a static analysis check on your solutions
against a set of best-practice rules to identify any problematic patterns that
you might have inadvertently introduced when building your solution.

| Parameters         | Description      |
|--------------------|------------------|
| Power Apps checker service                         | Select the service endpoint for the Power Apps checker. The service endpoint is defined under **Service Connections** in **Project Settings**.<p/>**Note**: The service connection type that must be used for this specific task only is **Power Apps Checker**, which is a service principals connection. You need to [configure service principals before you can use the task](https://aka.ms/buildtoolsconnection). |
| Location of file to analyze       | Specify whether to reference a local file or a reference file from a shared access signature (SAS) URL.   |
| Local files to analyze/SAS URI for the file to analyze | Specify the path and file name of the zip files to analyze. Wildcards can be used. For example, enter \*\*\*.zip for all zip files in all subfolders. You can choose to specify the files directly or reference a file by using an SAS URI.     |
| Rule set                          | Specify which rule set to apply. The following two rule sets are available:<ul><li> Solution checker: This is the same rule set that is run from the Power Apps maker portal.</li><li>AppSource: This is the extended rule set that is used to certify an application before it can be published to AppSource.</li></ul>    |
| Error Level | Combined with the Error threshold parameter defines the severity of errors and warnings that are allowed. |
| Error threshold | Defines the number of errors of specified level that are allowed for the checker to pass the solutions being checked. |

More information about how to configure the quality check service connection:
[Configure service connection for Power Apps checker](https://docs.microsoft.com/powerapps/developer/common-data-service/build-tools-tasks#configure-service-connection-for-power-apps-checker)

### Solution tasks

This set of tasks perform actions against solutions.

#### Power Apps Import Solution

The import solution task imports a solution into a target environment.

| Parameters           | Description        |
|----------------------|--------------------------|
| Power Apps environment URL | The service endpoint for the target environment that you want to import the solution to. For example, [https://powerappsbuildtools.crm.dynamics.com](https://powerappsbuildtools.crm.dynamics.com/). Service endpoints can be defined under **Service Connections** in **Project Settings**. |
| Solution input file        | The path and file name of the solution.zip file to import into the target environment. For example: \$(Build.ArtifactStagingDirectory)\$(SolutionName).zip.      |

> [!NOTE]
> Variables give you a convenient way to get key bits of data into
> various parts of your pipeline. For a comprehensive list of predefined variables, see [Use predefined variables](https://docs.microsoft.com/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml).

#### Power Apps Export Solution

The export solution task exports a solution from a source environment.

| Parameters      | Description     |
|-----------------|---------------------|
| Power Apps environment URL | The service endpoint for the source environment that you want to export the solution from. Defined under **Service Connections** -\> **Generic Service Connection** in **Project Settings**. |
| Solution name              | The name of the solution to export. Always use the solution **Name**, not its **Display Name**.    |
| Solution output file       | The path and file name of the solution.zip file to export the source environment to. For example: \$(Build.ArtifactStagingDirectory)\$(SolutionName).zip.        |

> [!NOTE]
> Variables give you a convenient way to get key bits of data into
> various parts of your pipeline. For a comprehensive list of predefined variables, see [Use predefined variables](https://docs.microsoft.com/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml).

#### Power Apps Pack Solution

This task packs a solution represented in source control into a solution.zip file that can
be imported into an environment.

| Parameters       | Description     |
|------------------|-----------------|
| Solution output file              | The path and file name of the solution.zip file to pack the solution into.     |
| Source folder of solution to pack | The path and source folder of the solution to pack.      |
| Type of solution                  | The type of solution you want to pack: **Unmanaged** (recommended), **Managed**, or **Both** |

#### Power Apps Unpack Solution

The unpack solution task takes a compressed solution file and decomposes it into
multiple XML files and other files so that these files can be more easily
managed by a source control system.

| Parameters    | Description       |
|---------------|-------------------|
| Solution input file              | The path and file name of the solution.zip file to unpack.     |
| Target folder to unpack solution | The path and target folder you want to unpack the solution into.      |
| Type of solution                 | The type of solution you want to unpack. **Unmanaged** is recommended: You should only unpack an unmanaged solution to your repo. |

#### Power Apps Set Solution Version

The set solution version task updates the version of a solution.

| Parameters    | Description   |
|---------------|---------------|
| Power Apps environment URL | The service endpoint for the environment where you want to deploy the package. Defined under **Service Connections** in **Project Settings**. |
| Solution name              | The name of the solution you want to set the version number for.     |
| Solution Version Number    | Version number to set, using the format *major.minor.build.revision* (for example, 1.0.0.1)  |

#### Power Apps Deploy Package

The deploy package task deploys a package to an environment. Deploying a package
as opposed to a single solution file gives you the option to deploy multiple
solutions, data, and code into an environment.

| Parameters      | Description    |
|-----------------|----------------|
| Power Apps environment URL | The service endpoint for the target environment that holds the solution you want to update. Defined under **Service Connections** in **Project Settings**. |

#### Power Apps Publish Customizations

The publish customizations task publishes all customizations in an environment.

| Parameters     | Description    |
|----------------|----------------|
| Power Apps environment URL | The service endpoint for the environment in which you want to publish customizations. Defined under **Service Connections** in **Project Settings**.|

### Environment management tasks

Environment management tasks are used to automate common environment management
functions.

#### Power Apps Create Environment

The create environment task creates an environment.

> [!NOTE]
> A new environment can only be provisioned if your license or capacity
> allows for the creation of additional environments.

| Parameters        | Description     |
|-------------------|-----------------|
| Deployment Region | The region that the environment should be deployed into.         |
| Instance Type     | The type of instance to deploy. Options are **Sandbox** or **Production**.      |
| Base Language     | The base language in the environment.      |
| Domain Name       | This is the environment-specific string that forms part of the URL. For example, for an environment with the following URL: [https://powerappsbuildtasks.crm.dynamics.com](https://powerappsbuildtasks.crm.dynamics.com/), the domain name would be powerappsbuildtasks. <p/>**Note**: If you enter a domain name that's already in use, the task appends a numeric value to the domain name, starting with 0. For the example above, the URL might become [https://powerappsbuildtasks0.crm.dynamics.com](https://powerappsbuildtasks0.crm.dynamics.com/). |
| Friendly name     | The friendly name of the environment.     |

#### Power Apps Delete Environment

The delete environment task deletes an environment.

| Parameters       | Description         |
|------------------|---------------------|
| Power Apps environment URL | The service endpoint for the environment you want to delete. Defined under **Service Connections** in **Project Settings**. |

#### Power Apps Backup Environment

The backup environment task backs up an environment.

| Parameters   | Description   |
|--------------|---------------|
| Power Apps environment URL | The service endpoint for the environment you want to backup. Defined under **Service Connections** in **Project Settings**. |
| Backup label               | The label you want to assign to the backup.                                                                         |

#### Power Apps Copy Environment

The copy environment task copies an environment to a target environment. Two
types of copy are available: full and minimal. *Full* copies both data and
solution metadata (customizations), whereas *minimal* only copies solution
metadata, not the actual data.

> [!NOTE]
> This task is only available for Dynamics 365 Customer Engagement (on-premises)
> environments.

| Parameters     | Description     |
|----------------|-----------------|
| Power Apps source environment URL | The service endpoint for the environment you want to copy from. Defined under **Service Connections** in **Project Settings**. |
| Power Apps target environment URL | The service endpoint for the environment you want to copy to. Defined under **Service Connections** in **Project Settings**.   |

## Build and release pipelines

Now that we've identified what can be done using the build tools, let's see
how you might apply these tools to your build and release pipelines. A
conceptual overview is shown below.

<!--This (the conceptual overview) doesn't seem to have come to pass:-->Now let's see some details of the pipeline implementation using the build tool tasks in the sub-sections that follow.

To learn more about creating these pipelines and actually do hands-on pipeline
authoring using the Power Apps build tools, complete the [Power Apps build tools labs](https://github.com/microsoft/PowerApps-Samples/tree/master/azure/build-tools),
which you can download from GitHub.

More information about Azure DevOps pipelines: [Use Azure Pipelines](https://docs.microsoft.com/azure/devops/pipelines/get-started/pipelines-get-started?view=azure-devops)

<a name="build-pipeline-export-solution-from-development"></a>

### Build pipeline: Export a solution from a development environment (DEV)

The following figure shows the build tool tasks that you might add to a pipeline that exports a solution from a development environment.

![Export a solution from a development environment (DEV)](media/export-pipeline.png "Export a solution from a development environment (DEV)")

<a name="build-pipeline-build-managed-solution"></a>

### Build pipeline: Build a managed solution

The following figure shows the build tool tasks that you might add to a pipeline that builds a managed solution.

![Build a managed solution](media/build-pipeline.png "Build a managed solution")

<a name="release-pipeline-deploy-to-production"></a>

### Release pipeline: Deploy to a production environment (PROD)

The following figure shows the build tool tasks that you might add to a pipeline that deploys to a production environment.

![Deploy to a production environment (PROD)](media/deploy-pipeline.png "Deploy to a production environment (PROD)")

### See also

[Power Apps component framework](component-framework.md)
