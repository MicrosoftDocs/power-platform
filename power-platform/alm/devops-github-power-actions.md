---
title: "GitHub Actions for the Power Platform | Microsoft Docs"
description: "Learn about what build tool tasks are available plus some examples of tasks in DevOps pipelines."
keywords: 
author: mikkelsen2000
ms.author: pemikkel
manager: kvivek
ms.custom: ""
ms.date: 07/02/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Preview: GitHub Actions for the Power Platform
[This topic is pre-release documentation and is subject to change.]

The GitHub actions for the Power Platform are described in the following sections. Afterwards, we will showcase some example GitHub workflows using some of these actions. For information about the GitHub actions for the Power Platform and how to download them, see [GitHub actions for the Power Plaform](devops-github-power.md).

## Configure deployment credentials
Many of the actions require you to connect a Power Platform environment. You add credentials as secrets in your the GitHub repository and then use them in the workflow.

## Helper task

The available helper tasks are described below.

### Power Platform WhoAmI

Verifies a Power Platform environment service connection by connecting and making a WhoAmI request. This task can be useful to include early in the pipeline, to verify connectivity before processing begins.

| Parameters    | Description   |
|---------------|---------------|
| environment-url | The URL for the environment you are connecting to.|
| user-name | Username of the account you are using to connect with |
| password-secret | password for the user-name. Passwords are defined in **Settings** under **Secrets**. Note that you cannot retrieve a secret after it has been defined and saved |

## Quality check

Below are the available tasks for checking the quality of a solution.

### Power Platform Checker

This task runs a static analysis check on your solutions
against a set of best-practice rules to identify any problematic patterns that
you might have inadvertently introduced when building your solution.

| Parameters         | Description      |
|--------------------|------------------|
| environment-url                         | (Required) The URL for the environment you are connecting to. A connection to a licensed Power Platform environment is required to use the Power Platform checker.|
|tenant-id| Tenant ID of the Power Platform.|
|application-id | Azure Application ID to authenticate with. See  [Configure service principal connections for Power Platform environments](devops-build-tools.md#configure-service-connections-using-a-service-principal) for more information on how to configure service principals name (SPN) |
|client-secret | Client secret for the application ID. Client secret is defined in **Settings** under **Secrets**| 
| checker-endpoint       | By default, the gelocation of the checker service will use the same geo as the environment you connect to. By unchecking the default, you have an option to specify another geo to use, for example https://japan.api.advisor.powerapps.com. For a list of available geographies, see [Use the Power Platform Checker API](https://docs.microsoft.com/powerapps/developer/common-data-service/checker/webapi/overview#determine-a-geography).|
| location-type       | (Required) Specify whether to reference a local file or a reference file from a shared access signature (SAS) URL.<p/>Note: It is important to reference an exported solution file and not the unpacked source files in your repository. Both managed and unmanaged solution files can be analyzed. |
| file-location | (Required) Specify the path and file name of the zip files to analyze. Wildcards can be used. For example, enter \*\*\\*.zip for all zip files in all subfolders.<p/>If **File from SAS URI** was chosen as location of files to analyze, simply enter the SAS URI. You can add more than one SAS URI through a comma (,) or semi-colon (;) separated list.     |
| rule-set                          | (Required) Specify which rule set to apply. The following two rule sets are available:<ul><li> Solution checker: This is the same rule set that is run from the Power Apps [maker portal](https://make.powerapps.com).</li><li>AppSource: This is the extended rule set that is used to certify an application before it can be published to [AppSource](https://appsource.microsoft.com/).</li></ul>    |
| error-level | Combined with the Error threshold parameter defines the severity of errors and warnings that are allowed. |
| error-threshold | Defines the number of errors of specified level that are allowed for the checker to pass the solutions being checked. |

## Solution tasks

This set of tasks perform actions against solutions, and includes the following tasks.

### Import Solution
Imports a solution into a target environment.

| Parameters           | Description        |
|----------------------|--------------------------|
| authentication-type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| environment-url| (Required) The URL for the target environment that you want to import the solution into (e.g., [https://powerappsactions.crm.dynamics.com](https://powerappsbuildtools.crm.dynamics.com)).|
|user-name|(Required if you are using username/password authentication) Username of the account you are using to connect with.|
| password-secret | (Required if you are using username/password authentication) Password for the user-name. Passwords are defined in **Settings** under **Secrets**. Note that you cannot retrieve a secret after it has been defined and saved. |
|tenant-id| (Required if you are using service principals authentication) Tenant ID of the Power Platform.|
|application-id | (Required if you are using service principals authentication) Azure Application ID to authenticate with. See  [Configure service principal connections for Power Platform environments](devops-build-tools.md#configure-service-connections-using-a-service-principal) for more information on how to configure service principals name (SPN) |
|client-secret | (Required if you are using service principals authentication) Client secret for the application ID. Client secret is defined in **Settings** under **Secrets.**| 
 | solution-input-file        | (Required) The path and file name of the solution.zip file to import into the target environment (e.g., $(Build.ArtifactStagingDirectory)\$(SolutionName).zip ). <p/>Note: Variables give you a convenient way to get key bits of data into various parts of your pipeline. See [Use predefined variables](https://docs.microsoft.com/azure/devops/pipelines/build/variables) for a comprehensive list.  |
 | import-as-asynchronous| If selected, the import operation will be performed asynchronously. This is recommended for larger solutions as this task will automatically timeout after 4 minutes otherwise. |
<p/>

### Power Platform Export Solution

Exports a solution from a source environment.

| Parameters      | Description     |
|-----------------|---------------------|
| authentication-type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| environment-url| (Required) The URL for the environment that you want to export the solution from (e.g. [https://powerappsactions.crm.dynamics.com](https://powerappsbuildtools.crm.dynamics.com)).|
|user-name|(Required if you are using username/password authentication) Username of the account you are using to connect with.|
| password-secret | (Required if you are using username/password authentication) Password for the user-name. Passwords are defined in **Settings** under **Secrets**. Note that you cannot retrieve a secret after it has been defined and saved. |
|tenant-id| (Required if you are using service principals authentication) Tenant ID of the Power Platform.|
|application-id | (Required if you are using service principals authentication) Azure Application ID to authenticate with. See  [Configure service principal connections for Power Platform environments](devops-build-tools.md#configure-service-connections-using-a-service-principal) for more information on how to configure service principals name (SPN) |
|client-secret | (Required if you are using service principals authentication) Client secret for the application ID. Client secret is defined in **Settings** under **Secrets.**| 
 | solution-name              | (Required) The name of the solution to export.<p/>Always use the solution *Name*, not its *Display Name*.    |
 | solution-output-file        | (Required) The path and file name of the solution.zip file to export the source environment to.|
 | export-as-asynchronous| If selected, the export operation will be performed asynchronously. This is recommended for larger solutions as this task will timeout otherwise. |
<p/>

### Power Platform Unpack Solution

Takes a compressed solution file and decomposes it into multiple XML files so that these files can be more easily read and managed by a source control system.

| Parameters    | Description       |
|---------------|-------------------|
| solution-input-file              | (Required) The path and file name of the solution.zip file to unpack.     |
| target-folder | (Required) The path and target folder you want to unpack the solution into.      |
| solution-type | (Required) The type of solution you want to unpack. Options include: **Unmanaged** (recommended), **Managed**, and **Both**. |
<p/>

### Power Platform Pack Solution

Packs a solution represented in source control into a solution.zip file that can be imported into another environment.

| Parameters       | Description     |
|------------------|-----------------|
| solution-output-file              | (Required) The path and file name of the solution.zip file to pack the solution into.     |
| source-folder             | (Required) The path and source folder of the solution to pack.      |
| Type of solution                  | (Required) The type of solution you want to pack. Options include: **Unmanaged** (recommended), **Managed**, and **Both**. |

### Power Platform Publish Customizations

Publishes all customizations in an environment.

| Parameters     | Description    |
|----------------|----------------|
| authentication-type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| environment-url| (Required) The URL for the environment in which you want to publish customizations  (e.g. [https://powerappsactions.crm.dynamics.com](https://powerappsbuildtools.crm.dynamics.com)).|
|user-name|(Required if you are using username/password authentication) Username of the account you are using to connect with.|
| password-secret | (Required if you are using username/password authentication) Password for the user-name. Passwords are defined in **Settings** under **Secrets**. Note that you cannot retrieve a secret after it has been defined and saved. |
|tenant-id| (Required if you are using service principals authentication) Tenant ID of the Power Platform.|
|application-id | (Required if you are using service principals authentication) Azure Application ID to authenticate with. See  [Configure service principal connections for Power Platform environments](devops-build-tools.md#configure-service-connections-using-a-service-principal) for more information on how to configure service principals name (SPN) |
|client-secret | (Required if you are using service principals authentication) Client secret for the application ID. Client secret is defined in **Settings** under **Secrets.**| 
<p/>

### Power Platform Set Solution Version

Updates the version of a solution.

| Parameters    | Description   |
|---------------|---------------|
| authentication-type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| environment-url| (Required) The URL for the environment that holds the solution you want to update.in which you want to publish customizations  (e.g. [https://powerappsactions.crm.dynamics.com](https://powerappsbuildtools.crm.dynamics.com)).|
|user-name|(Required if you are using username/password authentication) Username of the account you are using to connect with.|
| password-secret | (Required if you are using username/password authentication) Password for the user-name. Passwords are defined in **Settings** under **Secrets**. Note that you cannot retrieve a secret after it has been defined and saved. |
|tenant-id| (Required if you are using service principals authentication) Tenant ID of the Power Platform.|
|application-id | (Required if you are using service principals authentication) Azure Application ID to authenticate with. See  [Configure service principal connections for Power Platform environments](devops-build-tools.md#configure-service-connections-using-a-service-principal) for more information on how to configure service principals name (SPN) |
|client-secret | (Required if you are using service principals authentication) Client secret for the application ID. Client secret is defined in **Settings** under **Secrets.**| 
| solution-name              | (Required) The name of the solution you want to set the version number for.     |
| solution-version-number              | (Required) Version number you want to set.     |
<p/>



## Environment management tasks

Automate common Environment Lifecycle Management (ELM) tasks.

### Power Platform Create Environment

Creates a new environment.

> [!NOTE]
> A new environment can only be provisioned if your license or capacity
> allows for the creation of additional environments. For more information on how to view capacity see [Capacity page details](https://docs.microsoft.com/power-platform/admin/capacity-storage#capacity-page-details).

| Parameters        | Description     |
|-------------------|-----------------|
| authentication-type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| environment-url| (Required) The URL to the tenant in which you want to create the environment
|user-name|(Required if you are using username/password authentication) Username of the account you are using to connect with.|
| password-secret | (Required if you are using username/password authentication) Password for the user-name. Passwords are defined in **Settings** under **Secrets**. Note that you cannot retrieve a secret after it has been defined and saved. |
|tenant-id| (Required if you are using service principals authentication) Tenant ID of the Power Platform.|
|application-id | (Required if you are using service principals authentication) Azure Application ID to authenticate with. See  [Configure service principal connections for Power Platform environments](devops-build-tools.md#configure-service-connections-using-a-service-principal) for more information on how to configure service principals name (SPN) |
|client-secret | (Required if you are using service principals authentication) Client secret for the application ID. Client secret is defined in **Settings** under **Secrets.**|
| display-name | (Required) The display name of the environment created. |
| environment-type     | (Required) The type of instance to deploy. Options are **Sandbox** or **Production**.  |
|d365-apps | Dynamics 365 apps to deploy into the newly created environment|
| deployment-region | (Required) The region that the environment should be deployed into.         |
| deployment-language     | (Required) The base language in the environment.      |
| deployment-currency | (Required) Base currency for the environment created. Note that the currency cannot be updated after the environment is created. |
| deployment-domain-name       | (Required) This is the environment-specific string that forms part of the URL. For example, for an environment with the following URL: [https://powerappsactions.crm.dynamics.com](https://powerappsbuildtasks.crm.dynamics.com/), the domain name would be 'powerappsactions'. <p/>Note: If you enter a domain name that's already in use, the action appends a numeric value to the domain name, starting with 0. For the example above, the URL might become [https://powerappsactions0.crm.dynamics.com](https://powerappsactions0.crm.dynamics.com/). |

### Power Platform Delete Environment

Deletes an environment.

| Parameters       | Description         |
|------------------|---------------------|
| authentication-type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| environment-url| (Required) The URL to the environment you want to delete.
|user-name|(Required if you are using username/password authentication) Username of the account you are using to connect with.|
| password-secret | (Required if you are using username/password authentication) Password for the user-name. Passwords are defined in **Settings** under **Secrets**. Note that you cannot retrieve a secret after it has been defined and saved. |
|tenant-id| (Required if you are using service principals authentication) Tenant ID of the Power Platform.|
|application-id | (Required if you are using service principals authentication) Azure Application ID to authenticate with. See  [Configure service principal connections for Power Platform environments](devops-build-tools.md#configure-service-connections-using-a-service-principal) for more information on how to configure service principals name (SPN) |
|client-secret | (Required if you are using service principals authentication) Client secret for the application ID. Client secret is defined in **Settings** under **Secrets.**|
<p/>


### Power Platform Backup Environment

Backs up an environment.

| Parameters   | Description   |
|--------------|---------------|
| authentication-type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| environment-url| (Required) The URL to the environment you want to backup.
|user-name|(Required if you are using username/password authentication) Username of the account you are using to connect with.|
| password-secret | (Required if you are using username/password authentication) Password for the user-name. Passwords are defined in **Settings** under **Secrets**. Note that you cannot retrieve a secret after it has been defined and saved. |
|tenant-id| (Required if you are using service principals authentication) Tenant ID of the Power Platform.|
|application-id | (Required if you are using service principals authentication) Azure Application ID to authenticate with. See  [Configure service principal connections for Power Platform environments](devops-build-tools.md#configure-service-connections-using-a-service-principal) for more information on how to configure service principals name (SPN) |
|client-secret | (Required if you are using service principals authentication) Client secret for the application ID. Client secret is defined in **Settings** under **Secrets.**|
| backup-label | (Required) The label to be assigned to the backup.     |
<p/>

### Power Platform Copy Environment

Copies an environment to a target environment. Two
types of copies are available: full and minimal. A *Full* copy includes both data and
solution metadata (customizations), whereas a *minimal* copy only includes solution
metadata and not the actual data.

| Parameters     | Description     |
|----------------|-----------------|
| authentication-type | (Required) Select whether to use username/password or service principal authentication. Note that username/password does not support multi-factor authentication. |
| source-environment-url| (Required) The URL to the source environment that you want to copy from.
| target-environment-url| (Required) The URL to the target environment that you want to copy to.
|user-name|(Required if you are using username/password authentication) Username of the account you are using to connect with.|
| password-secret | (Required if you are using username/password authentication) Password for the user-name. Passwords are defined in **Settings** under **Secrets**. Note that you cannot retrieve a secret after it has been defined and saved. |
|tenant-id| (Required if you are using service principals authentication) Tenant ID of the Power Platform.|
|application-id | (Required if you are using service principals authentication) Azure Application ID to authenticate with. See  [Configure service principal connections for Power Platform environments](devops-build-tools.md#configure-service-connections-using-a-service-principal) for more information on how to configure service principals name (SPN) |
|client-secret | (Required if you are using service principals authentication) Client secret for the application ID. Client secret is defined in **Settings** under **Secrets.**|
<p/>

## Build and release pipelines

Now that we've identified which actions you can take, let's see
how you can use these actions to create workflows that use multiple actions. Sample workflows are outlined below.

To learn more about creating these pipelines and actually do hands-on pipeline
authoring using GitHub actions for the Power Platform, complete the [GitHub actions for Power Platform labs](https://aka.ms/poweractionslab),
which you can download from GitHub.

For more information about on GitHub actions, see: [About GitHub Actions](https://help.github.com/actions/getting-started-with-github-actions/about-github-actions)

<!-- ---
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

### See Also

[Microsoft Power Platform Build Tools for Azure DevOps](devops-build-tools.md)
--- -->
