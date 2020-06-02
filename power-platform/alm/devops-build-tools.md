---
title: "Microsoft Power Platform Build Tools for Azure DevOps | Microsoft Docs"
description: "Learn about the ALM-related tools, APIs, and services that are available to developers when using Azure DevOps."
keywords: 
author: phecke
ms.author: pehecke
manager: kvivek
ms.custom: ""
ms.date: 06/01/2020
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
to apps built on the Power Platform. These tasks include: 
Use Microsoft Power Platform Build Tools to automate common build and deployment tasks related
to apps built on the Power Platform. These tasks include: 
<ul><li>Synchronization of solution metadata (also known as
solutions) that contains the various platform components such as Dynamics 365 Customer Engagement apps, canvas apps, UI flows, virtual agents, AI Builder models and connectors between development environments and source control, </li></ul>
<ul><li>Generating build artifacts</li></ul>
<ul><li>Deploying to downstream environments</li></ul>

<ul><li>Provisioning or de-provisioning
environments</li></ul>

<ul><li>Perform static analysis checks against solutions by using the Power Apps checker service</li></ul>


The Microsoft Power Platform Build Tools tasks can be used along with any other available
Azure DevOps tasks to compose your build and release pipelines. Pipelines
that teams commonly put in place include Initiate, Export from Dev, Build, and Release.

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
searching for "Power Platform".

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
| Service Connection                         | (Required) A connection to a licensed Power Platform environment is required to use the Power Apps checker.  Service connections are defined in **Service Connections** under **Project Settings** using the **Power Platform** connection type .<p/>Note: Service Principal is the only authentication method available for the checker task. For more information on how to configure service principals to be used with this task see [Configure service principal connections for Power Platform environments]( #configure-service-connections-using-a-service-principal). |
| User default PowerApps Checker endpoint       | By default, the gelocation of the checker service will use the same geo as the environment you connect to. By unchecking the default, you have an option to specify another geo to use, for example https://japan.api.advisor.powerapps.com. For a list of available geographies, see [Use the PowerApps Checker API](https://docs.microsoft.com/powerapps/developer/common-data-service/checker/webapi/overview#determine-a-geography).|
| Location of file(s) to analyze       | (Required) Specify whether to reference a local file or a reference file from a shared access signature (SAS) URL.<p/>Note: It is important to reference an exported solution file and not the unpacked source files in your repository. Both managed and unmanaged solution files can be analyzed. |
| Local files to analyze/SAS URI for the file to analyze | (Required) Specify the path and file name of the zip files to analyze. Wildcards can be used. For example, enter \*\*\\*.zip for all zip files in all subfolders.<p/>If **File from SAS URI** was chosen as location of files to analyze, simply enter the SAS URI. You can add more than one SAS URI through a comma (,) or semi-colon (;) separated list.     |
| Rule set                          | (Required) Specify which rule set to apply. The following two rule sets are available:<ul><li> Solution checker: This is the same rule set that is run from the Power Apps [maker portal](https://make.powerapps.com).</li><li>AppSource: This is the extended rule set that is used to certify an application before it can be published to [AppSource](https://appsource.microsoft.com/).</li></ul>    |

### Solution tasks

This set of tasks perform actions against solutions, and includes the following tasks.

#### Import solution
Imports a solution into a target environment.

| Parameters           | Description        |
|----------------------|--------------------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection to the target environment that you want to import the solution into (e.g., [https://powerappsbuildtools.crm.dynamics.com](https://powerappsbuildtools.crm.dynamics.com)).  Service connections are defined in **Service Connections** under **Project Settings** using the **Power Platform** connection type .|
 | Solution input file        | (Required) The path and file name of the solution.zip file to import into the target environment (e.g., $(Build.ArtifactStagingDirectory)\$(SolutionName).zip ). <p/>Note: Variables give you a convenient way to get key bits of data into various parts of your pipeline. A comprehensive list of predefined variables is available here: [https://docs.microsoft.com/azure/devops/pipelines/build/variables](https://docs.microsoft.com/azure/devops/pipelines/build/variables).  |
 | Import solution as asynchronous operation | If selected, the import operation will be performed asynchronously. This is recommended for larger solutions as this task will automatically timeout after 4 minutes otherwise. |

#### Export solution

Exports a solution from a source environment.

| Parameters      | Description     |
|-----------------|---------------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection to the source environment that you want to export the solution from.  Service connections are defined in **Service Connections** under **Project Settings** using the **Power Platform** connection type.|
| Solution name              | (Required) The name of the solution to export.<p/>Always use the solution *Name*, not its *Display Name*.    |
| Solution output file       | (Required) The path and file name of the solution.zip file to export the source environment to (e.g., $(Build.ArtifactStagingDirectory)\$(SolutionName).zip ). <p/>Note: Variables give you a convenient way to get key bits of data into various parts of your pipeline. A comprehensive list of predefined variables is available here: [https://docs.microsoft.com/azure/devops/pipelines/build/variables](https://docs.microsoft.com/azure/devops/pipelines/build/variables).   |

#### Unpack solution

Takes a compressed solution file and decomposes it into multiple XML files so that these files can be more easily read and managed by a source control system.

| Parameters    | Description       |
|---------------|-------------------|
| Solution input file              | (Required) The path and file name of the solution.zip file to unpack.     |
| Target folder to unpack solution | (Required) The path and target folder you want to unpack the solution into.      |
| Type of solution                 | (Required) The type of solution you want to unpack. Options include: **Unmanaged** (recommended), **Managed**, and **Both**. |

#### Pack solution

Packs a solution represented in source control into a solution.zip file that can be imported into another environment.

| Parameters       | Description     |
|------------------|-----------------|
| Solution output file              | (Required) The path and file name of the solution.zip file to pack the solution into.     |
| Source folder of solution to pack | (Required) The path and source folder of the solution to pack.      |
| Type of solution                  | (Required) The type of solution you want to pack. Options include: **Unmanaged** (recommended), **Managed**, and **Both**. |

#### Publish customizations

Publishes all customizations in an environment.

| Parameters     | Description    |
|----------------|----------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection to the environment in which you want to publish customizations. Service connections are defined in **Service Connections** under **Project Settings** using the **Power Platform** connection type. |

#### Set solution version

Updates the version of a solution.

| Parameters    | Description   |
|---------------|---------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection to the target environment that holds the solution you want to update.  Service connections are defined in **Service Connections** under **Project Settings** using the **Power Platform** connection type .|
| Solution name              | (Required) The name of the solution you want to set the version number for.     |
| Solution Version Number              | (Required) Version number you want to set.     |


#### Deploy package

Deploys a package to an environment. Deploying a [package](/powerapps/developer/common-data-service/package-deployer/create-packages-package-deployer) as opposed to a single solution file provides an option to deploy multiple solutions, data, and code into an environment.

| Parameters      | Description    |
|-----------------|----------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection to the target environment into which you want to deploy the package.  Service connections are defined in **Service Connections** under **Project Settings** using the **Power Platform** connection type.|
| Package file | (Required) The path and file name of the path and file name of the package file assembly (.dll). |

### Environment management tasks

Automate common environment management tasks.

> [!NOTE]
> Environment actions will be made available in subsequent releases.

<!-- #### Create environment

Creates a new environment.

> [!NOTE]
> A new environment can only be provisioned if your license or capacity
> allows for the creation of additional environments.

| Parameters        | Description     |
|-------------------|-----------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection to the tenant for which you want to create the environment. Defined under **Service Connections** > **Generic Service Connection** in **Project Settings**. |
| Display name | (Required) The display name of the environment created. |
| Deployment Region | (Required) The region that the environment should be deployed into.         |
| Environment Type     | (Required) The type of instance to deploy. Options are **Sandbox** or **Production**.      |
| Region | (Required) The region that the environment should be created in.  |
| Currency | (Required) Base currency for the environment created. Note that the currency cannot be updated after the environment is created. |
| Language     | (Required) The base language in the environment.      |
| Domain Name       | (Required) This is the environment-specific string that forms part of the URL. For example, for an environment with the following URL: [https://powerappsbuildtasks.crm.dynamics.com](https://powerappsbuildtasks.crm.dynamics.com/), the domain name would be 'powerappsbuildtasks'. <p/>Note: If you enter a domain name that's already in use, the task appends a numeric value to the domain name, starting with 0. For the example above, the URL might become [https://powerappsbuildtasks0.crm.dynamics.com](https://powerappsbuildtasks0.crm.dynamics.com/). |

#### Delete environment

Deletes an environment.

| Parameters       | Description         |
|------------------|---------------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection to the tenant for which you want to delete the environment. Defined under **Service Connections** > **Generic Service Connection** in **Project Settings**. |

#### Backup environment

Backs up an environment.

| Parameters   | Description   |
|--------------|---------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection to the tenant for which you want to backup the environment. Defined under **Service Connections** > **Generic Service Connection** in **Project Settings**. |
| Backup label               | (Required) The label to be assign to the backup.                                                                         |

#### Copy environment

Copies an environment to a target environment. Two
types of copies are available: full and minimal. A *Full* copy includes both data and
solution metadata (customizations), whereas a *minimal* copy only includes solution
metadata and not the actual data.

| Parameters     | Description     |
|----------------|-----------------|
| Authentication type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| Service connection | (Required) The service connection for the source environment that you want to copy from. Defined under **Service Connections** in **Project Settings**. |
| Service connection | (Required) The service connection for the target environment that you want to copy to. Defined under **Service Connections** in **Project Settings**. | -->

## Build and release pipelines

Now that we've identified what can be done using the build tools, let's see
how you might apply these tools to your build and release pipelines. A
conceptual overview is shown below. Let's view some details of the pipeline implementation using the build tool tasks in the sub-sections that follow.

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

## Configure service connections using a service principal

To configure a connection using service principal, you must first create an application registration in Azure Active Directory (AAD) with the required permissions and then create the associated Application User in the Power Platform environment you want to connect to. We have offered a script to facilitate some of the steps required in the section below, while detailed information with manual step-by-step instructions are available [here](https://docs.microsoft.com/powerapps/developer/common-data-service/use-single-tenant-server-server-authentication#azure-application-registration).

### Create service principal and client secret using PowerShell

This PowerShell script assists in creating and configuring the service principal to be used with the Microsoft Power Platform Build Tools tasks. It first registers an Application object and corresponding Service Principal Name (SPN) in AAD.

This application is then added as an administrator user to the Power Platform tenant itself.

**Installation**

Download the following PowerShell cmdlet: https://pabuildtools.blob.core.windows.net/spn-docs-4133a3fe/New-CrmServicePrincipal.ps1

<ul><li>Open a regular Windows PowerShell command prompt (standard, not PS core)
</li></ul> 
<ul><li>Navigate to the folder where you saved the script, and unblock the script using the following command: `Unblock-File New-CrmServicePrincipal.ps1`
</li></ul>
<ul><li>Run the script: `.\New-CrmServicePrincipal.ps1`</li></ul>

The script will prompt two times with AAD login dialogs:


<ul><li>1st prompt: to login as administrator to the AAD instance associated with the Power Platform tenant
</li></ul> 
<ul><li>2nd prompt: to login as tenant administrator to the Power Platform tenant itself
</li></ul>


Once successful, 3 columns are displayed:

<ul><li>Power Platform TenantId</li></ul>
<ul><li>Application ID</li></ul>
<ul><li>Client Secret (in clear text)</li></ul>

Use the information displayed to configure the Power Platform service connection. 

> [!IMPORTANT]
> Keep the client secret safe and secure. Once the PowerShell command prompt is cleared, you cannot retrieve the same client secret again.


### Configure environment with the Application ID
The Application ID must be added as an Application User in the Power Platform environment you are connecting to. Information on how to add an application user is available [here](https://docs.microsoft.com/powerapps/developer/common-data-service/use-single-tenant-server-server-authentication#application-user-creation) 

Ensure that the added Application User has the system administrator role assigned (available from “Manage Roles” in the security settings for the application user).

## Frequently asked question (FAQ)

**Do the Microsoft Power Platform Build Tools only work for Power Apps?**  

*The build tools work for both canvas and model-driven apps, Power Virtual Agents, UI Flows and traditional flows, AI Builder, Custom Connectors and Data Flows, all of which can now be added to a solution. This also includes Dynamics 365 CE applications, such as Dynamics 365 Sales and Dynamics 365 Customer Service. Separate build tasks are available for Microsoft Dynamics for Finance and Operations.*

**I had previuosly installed the preview of the Build Tools - can I upgrade from the preview of Power Apps Build Tools to Power Platform Build Tools?**

*You cannot upgrade from the preview version as we had to introduce some breaking changes in the Generally Available release. To move from the preview version, you have to install the Power Platform Build Tools and either re-build your pipelines, or re-configure your existing pipelines to use the new Build Tools tasks. This includes creating new Service connections as well.*

**Can I include flow and canvas apps?**

*Yes, flows and canvas apps are solution aware so if these are added to your solution, they can participate in the lifecycle of your app.  However, some steps still require manual configurations. This will be addressed later this year when we introduce environment variables and connectors A list of current limitations are available here: [Known limitations](/powerapps/maker/common-data-service/use-solution-explorer#known-limitations).*

**How much do the Microsoft Power Platform Build Tools cost?**

*The build tools are available at no cost. However, a valid subscription to Azure DevOps is required to utilize the Build Tools. More information is available [here](https://azure.microsoft.com/pricing/details/devops/azure-devops-services/).*

**I can see the extension, but why don’t I have an option to install it?**

*If you do not see the **install** option (outlined in screenshot below) then you most likely lack the necessary install privileges in your Azure DevOps organization. More info available [here](https://docs.microsoft.com/azure/devops/marketplace/how-to/grant-permissions?view=azure-devops).*

**How can developers use the results of the Checker task?**

*The output of the Checker task is a [Sarif file](https://sarifweb.azurewebsites.net/) and both VS Code and Visual Studio extensions are available for viewing and taking action on Sarif files.*

