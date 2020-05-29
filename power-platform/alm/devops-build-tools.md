---
title: "Microsoft Power Platform Build Tools for Azure DevOps | Microsoft Docs"
description: "Learn about the ALM-related tools, APIs, and services that are available to developers when using Azure DevOps."
keywords: 
author: phecke
ms.author: pehecke
manager: kvivek
ms.custom: ""
ms.date: 05/27/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Microsoft Power Platform Build Tools for Azure DevOps

Use Microsoft Power Platform Build Tools to automate common build and deployment tasks related
to apps built on the Power Platform. These tasks include: 1) synchronization of solution metadata (also known as
solutions) that contains the various platform components such as Dynamics 365 Customer Engagement apps, canvas apps, UI flows, virtual agents, AI Builder models and connectors between development environments and source control, 2) generating build
artifacts, 3) deploying to downstream environments, 4) provisioning or de-provisioning
environments, and 5) the ability to perform static analysis checks against your
solution by using the Power Apps checker service.

The Microsoft Power Platform Build Tools tasks can be used along with any other available
Azure DevOps tasks to compose your build and release pipelines. Pipelines
that teams commonly put in place include Initiate, Build, and Release.

![ALM powered by Azure DevOps](media/initiate-build-release.png "ALM powered by Azure DevOps")

## What are Microsoft Power Platform Build Tools?

The Microsoft Power Platform Build Tools are a collection of Power Platform&ndash;specific Azure DevOps
build tasks that eliminate the need to manually download custom tooling and
scripts to manage the application lifecycle of apps built on the Power Platform. The tasks can be used
individually to perform a simple task, such as importing a solution into a
downstream environment, or used together in a pipeline to orchestrate a
scenario such as "generate a build artifact", "deploy to test", or "harvest maker
changes." The build tasks can largely be categorized into four types:

- Helper

- Quality check

- Solution

- Environment management

## Get the Microsoft Power Platform Build Tools

The Microsoft Power Platform Build Tools can be installed into your Azure DevOps organization
from [Azure Marketplace](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerApps-BuildTools).
After installation, all tasks included in the Microsoft Power Platform Build Tools will be
available to add into any new or existing pipeline. You can find them by
searching for "Power".

![Get the Microsoft Power Platform Build Tools](media/get-build-tools.png "Get the Microsoft Power Platform Build Tools")

## Connection to environments

To interact with the Power Platform environment, a connection must be established that enables the various build tool tasks to perform the required actions. Two types of connections are available:

- Username/password: Configured as a generic service connection with username and password. Note that username/password does not support multi-factor authentication.
- Service principal and client secret: (recommended) This connection type uses service principal based authentication and supports multi-factor authentication.

## Build tool tasks

The available build tasks are described in the following sections.

### Helper task

The Power Platform tools installer is required to be the first task in any build and
release pipeline. This task installs a set of Power Platform&ndash;specific tools required
by the agent to run the Power Platform build tasks. This task doesn't require any
additional configuration.

### Quality check

The Power Apps checker task runs a static analysis check on your solutions
against a set of best-practice rules to identify any problematic patterns that
you might have inadvertently introduced when building your solution.

| Parameters         | Description      |
|--------------------|------------------|
| Power Apps checker service                         | (Required) Select the service endpoint for the Power Apps checker. The service endpoint is defined under **Service Connections** in **Project Settings**.<p/>Note: The service connection type that must be used for this specific task only is **Power Platform Checker**, which is a service principals connection. For more information on how to configure service principals to be used with this task see [Configure service connection for Power Apps checker](https://aka.ms/buildtoolsconnection). |
| Location of file(s) to analyze       | (Required) Specify whether to reference a local file or a reference file from a shared access signature (SAS) URL.<p/>Note: It is important to reference an exported solution file and not the unpacked source files in your repository.  |
| Local files to analyze/SAS URI for the file to analyze | (Required) Specify the path and file name of the zip files to analyze. Wildcards can be used. For example, enter \*\*\*.zip for all zip files in all subfolders.<p/>If **File from SAS URI** was chosen as location of files to analyze, simply enter the SAS URI. You can add more than one SAS URI through a comma (,) or semi-colon (;) separated list.     |
| Rule set                          | (Required) Specify which rule set to apply. The following two rule sets are available:<ul><li> Solution checker: This is the same rule set that is run from the Power Apps maker portal.</li><li>AppSource: This is the extended rule set that is used to certify an application before it can be published to AppSource.</li></ul>    |

### Solution tasks

This set of tasks perform actions against solutions, and includes the following tasks.

#### Import solution
Imports a solution into a target environment.

| Parameters           | Description        |
|----------------------|--------------------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection for the target environment that you want to import the solution to (e.g., [https://powerappsbuildtools.crm.dynamics.com](https://powerappsbuildtools.crm.dynamics.com)). The service connections can be defined under **Service Connections** in **Project Settings**.|
 | Solution input file        | (Required) The path and file name of the solution.zip file to import into the target environment (e.g., $(Build.ArtifactStagingDirectory)\$(SolutionName).zip ). <p/>Note: Variables give you a convenient way to get key bits of data into various parts of your pipeline. A comprehensive list of predefined variables is available here: [https://docs.microsoft.com/azure/devops/pipelines/build/variables](https://docs.microsoft.com/azure/devops/pipelines/build/variables).  |
 | Import solution as asynchronous operation | If selected, the import operation will be performed asynchronously. This is recommend for larger solution as the task will automatically timeout after 4 minutes otherwise. |

#### Export solution

Exports a solution from a source environment.

| Parameters      | Description     |
|-----------------|---------------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection for the target environment that you want to import the solution from. The service connections can be defined under **Service Connections** > **Generic Service** > **Project Settings**. |
| Solution name              | (Required) The name of the solution to export.<p/>Always use the solution **Name**, not its **Display Name**.    |
| Solution output file       | (Required) The path and file name of the solution.zip file to export the source environment to (e.g., $(Build.ArtifactStagingDirectory)\$(SolutionName).zip ). <p/>Note: Variables give you a convenient way to get key bits of data into various parts of your pipeline. A comprehensive list of predefined variables is available here: [https://docs.microsoft.com/azure/devops/pipelines/build/variables](https://docs.microsoft.com/azure/devops/pipelines/build/variables).   |

#### Unpack solution

Takes a compressed solution file and decomposes it into multiple XML files so that these files can be more easily read and managed by a source control system.

| Parameters    | Description       |
|---------------|-------------------|
| Solution input file              | (Required) The path and file name of the solution.zip file to unpack.     |
| Target folder to unpack solution | (Required) The path and target folder you want to unpack the solution into.      |
| Type of solution                 | (Required) The type of solution you want to unpack. Options include: **Unmanaged** (recommended), **Managed**, and **Both**. Only the unmanaged solution should be unpacked to your repo.  |

#### Pack solution

Packs a solution represented in source control into a solution.zip file that can be imported into an environment.

| Parameters       | Description     |
|------------------|-----------------|
| Solution output file              | (Required) The path and file name of the solution.zip file to pack the solution into.     |
| Source folder of solution to pack | (Required) The path and source folder of the solution to pack.      |
| Type of solution                  | (Required) The type of solution you want to pack. Options include: **Unmanaged** (recommended), **Managed**, and **Both**. |

#### Publish customizations

Publishes all customizations in an environment.

| Parameters     | Description    |
|----------------|----------------|
| Power Apps environment URL | (Required) The service endpoint for the environment in which you want to publish customizations. Defined under **Service Connections** in **Project Settings**.|

#### Set solution version

Updates the version of a solution.

| Parameters    | Description   |
|---------------|---------------|
| Power Apps environment URL | (Required) The Service Endpoint for the target environment that holds the solution you want to update. Defined under **Service Connections** in **Project Settings**. |
| Solution name              | (Required) The name of the solution you want to set the version number for.     |

#### Deploy package

Deploys a package to an environment. Deploying a [package](/powerapps/developer/common-data-service/package-deployer/create-packages-package-deployer) as opposed to a single solution file provides an option to deploy multiple solutions, data, and code into an environment.

| Parameters      | Description    |
|-----------------|----------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service endpoint for the target environment to which you want to deploy the package. Defined under **Service Connections** in **Project Settings**. |
| Package file | (Required) The path and file name of the package that you want to deploy. |

### Environment management tasks

Automate common environment management tasks.

#### Create environment

Creates an environment.

> [!NOTE]
> A new environment can only be provisioned if your license or capacity
> allows for the creation of additional environments.

| Parameters        | Description     |
|-------------------|-----------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service endpoint for the target environment to which you want to deploy the package. Defined under **Service Connections** > **Generic Service Connection** in **Project Settings**. |
| Display name | (Required) The display name of the environment created. |
| Deployment Region | (Required) The region that the environment should be deployed into.         |
| Environment Type     | (Required) The type of instance to deploy. Options are **Sandbox** or **Production**.      |
| Region | (Required) The region that the environment should be created in.  |
| Currency | (Required) Base currency for the environment created. Note, this cannot be updated after the environment is created. |
| Language     | (Required) The base language in the environment.      |
| Domain Name       | (Required) This is the environment-specific string that forms part of the URL. For example, for an environment with the following URL: [https://powerappsbuildtasks.crm.dynamics.com](https://powerappsbuildtasks.crm.dynamics.com/), the domain name would be 'powerappsbuildtasks'. <p/>Note: If you enter a domain name that's already in use, the task appends a numeric value to the domain name, starting with 0. For the example above, the URL might become [https://powerappsbuildtasks0.crm.dynamics.com](https://powerappsbuildtasks0.crm.dynamics.com/). |

#### Delete environment

Deletes an environment.

| Parameters       | Description         |
|------------------|---------------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection to the tenant for which you want to create the environment. Defined under **Service Connections** > **Generic Service Connection** in **Project Settings**. |

#### Backup environment

Backs up an environment.

| Parameters   | Description   |
|--------------|---------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection to the tenant for which you want to create the environment. Defined under **Service Connections** > **Generic Service Connection** in **Project Settings**. |
| Backup label               | (Required) The label you want to assign to the backup.                                                                         |

#### Copy environment

Copies an environment to a target environment. Two
types of copy are available: full and minimal. *Full* copies both data and
solution metadata (customizations), whereas *minimal* only copies solution
metadata, not the actual data.

| Parameters     | Description     |
|----------------|-----------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection for the source environment that you want to copy from. Defined under **Service Connections** in **Project Settings**. |
| Service connection | (Required) The service connection for the target environment that you want to copy to. Defined under **Service Connections** in **Project Settings**. |

## Build and release pipelines

Now that we've identified what can be done using the build tools, let's see
how you might apply these tools to your build and release pipelines. A
conceptual overview is shown below. Let's see some details of the pipeline implementation using the build tool tasks in the sub-sections that follow.

To learn more about creating these pipelines and actually do hands-on pipeline
authoring using the Microsoft Power Platform Build Tools, complete the build tools [labs](https://github.com/microsoft/PowerApps-Samples/tree/master/build-tools),
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