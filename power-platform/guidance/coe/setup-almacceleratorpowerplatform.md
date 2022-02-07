---
title: "Set up ALM Accelerator for Power Platform components manual | MicrosoftDocs"
description: "The ALM Accelerator for Power Platform helps you follow ALM patterns and practices to source control and move your solutions from your development environment to test and production environments using DevOps. This guide walks through the manual set-up steps of the accelerator."
author: mikefactorial
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2021
ms.subservice: guidance
ms.author: v-mikeochs
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Set-up ALM Accelerator for Power Platform components manually (preview)

The ALM Accelerator for Power Platform (AA4PP) components enable makers to apply source control strategies using DevOps and use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. In addition, the ALM Accelerator helps makers work without intimate knowledge of the downstream technologies and to be able to switch quickly from developing solutions to source controlling the solution and ultimately pushing their apps to other environments with as few interruptions to their work as possible.

> [!NOTE]
> ALM Accelerator for Power Platform is currently in public preview. Go to [Issues currently tagged as vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the roadmap to be completed prior to general availability. While the tool is in public preview, there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the public preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that is being developed separately from AA4PP.

The ALM Accelerator components solution doesn't have a dependency on other components of the CoE Starter Kit. It can be used independently.

## Setup options

There are two set-up options available for the ALM Accelerator for Power Platform.

1. Set-up using the [Center of Excellence command line interface (CoE CLI)](/power-platform/guidance/coe/cli/overview).
1. Set-up manually by using this step-by-step walk-through.

> [!IMPORTANT]
> We recommend that you use the [Center of Excellence command line interface (CoE CLI)](/power-platform/guidance/coe/cli/overview) to assist in automating these steps. This document provides details and context for the actions that are performed by the CoE CLI and act as a reference for anyone who wants to know the specifics of each step in the process.

## Document structure

The set-up guide is structured into seven main sections:

- **Prerequisites** - Considerations and requirements to complete the set-up.
- **Foundational Set-up** - This section walks through the base set-up of the AA4PP. The base setup consists of the steps and configurations required.
- **Development Project Set-up** - This section includes the steps required to set up a new development project covering project-specific setup of DevOps, generic build and deployment pipelines, Service connections, Power Platform environments, and application users.
- **Solution Set-up** - These steps are specific to each solution you wish to support with the ALM Accelerator. The section covers setting up the solution-specific pipelines, branch policies, deployment variables to support connections references, environment variables, and Azure AD group sharing.
- **Importing the Solution and Configuring the app** - This section takes you through the steps required to import the actual AA4PP canvas app and configuring the included custom connector.
- **Using the ALM Accelerator app** - A short introduction to using the AA4PP canvas app.
- **Troubleshooting** - A few pointers on some known issues and how to remediate them.

## Prerequisites

### Dataverse environments

The AA4PP solution must be installed into a Power Platform environment with a Microsoft Dataverse database. From this environment the AA4PP application can be used to deploy solutions from development to validation to testing and to production. All of these environments will also require a Dataverse database in order to deploy your solutions.

> [!NOTE]
> Currently the ALM Accelerator is not compatible with Dataverse for Teams. Both the AA4PP app and the associated AzDO pipelines assume the full version of Dataverse is being used in all environments.

You'll need to create an environment in which to set up the AA4PP Solution. We recommend you install AA4PP in the same environment as other CoE Starter Kit solutions. For more information about how to decide on the best strategy for your organization, see [Establishing an environment strategy for Microsoft Power Platform](/power-platform/guidance/adoption/environment-strategy) and [Environment strategy for ALM](/power-platform/alm/environment-strategy-alm).

### DevOps organization

This solution uses DevOps for source control and deployments (pipelines). You can sign up for DevOps for free for up to five users on the [DevOps](https://azure.microsoft.com/services/DevOps/) site.

### Users and permissions

To complete the steps below, you'll need the following users and permissions in Power Platform, DevOps, and Azure.

- A licensed Azure user with permissions to create and view Azure AD groups, create app registrations and gGrant admin consent to app registrations in Azure AD.
- A licensed DevOps user with permissions to create and manage pipelines, service connections, repos, and extensions.
- A licensed Power Platform user with permissions to create application users and grant administrative permissions to the application user.

### Connectors and DLPs

For the AA4PP canvas app to work, the following connectors must be available to be used together in the environment into which the ALM Accelerator solution is imported.

- [Dataverse (legacy)](/connectors/commondataservice/)
- [Power Apps for Makers](/connectors/powerappsforappmakers/)
- [HTTP with Azure AD](/connectors/webcontents/) (with endpoint access to <https://graph.microsoft.com>)
- ALM Accelerator Custom DevOps (this connector will be created as part of the [AA4PP solution import](#importing-the-solution-and-configuring-the-app))

## Foundational set-up

The following steps guide you through setting up the foundations of AA4PP. These steps are general to the functionality of the ALM Accelerator and not project or solution-specific.

### Create an app registration in your Azure AD environment

Creating an app registration for the ALM Accelerator is a one time set-up step to grant permissions to the app and the associated pipelines the permissions required to perform operations in DevOps and Power Apps or Dataverse. The steps below show how to create a single app registration with permissions for both Dataverse and DevOps. However, you might want to separate responsibilities into specifically Dataverse and DevOps as separate app registrations.

1. Sign in to the [Azure portal](https://portal.azure.com).
1. Go to **Azure Active Directory** > **App registrations**.

1. Select **New registration**, and then give the registration a name, such as *ALMAcceleratorServicePrincipal*. Leave all other options as default and select **Register**.

1. Select **API permissions** > **+ Add a permission**.

1. Select **Dynamics CRM**, and configure permissions as follows:

    - Select **Delegated permissions**.
    - Select **user_impersonation**.

1. Select **Add permissions**.

1. Repeat the steps above for the following permissions:
    - **PowerApps-Advisor (Analysis All)**. This is required for running static analysis via [app checker](/power-platform/alm/checker-api/overview). This permission can be found under **APIs my organization uses**.

    - **DevOps**. This is required for connecting to DevOps via the custom connector in the ALM Accelerator app. This permission can be found under **APIs my organization uses**.

      - When adding the DevOps permission, select **APIs my organization uses**, and then search for *DevOps* and copy the **Application (client) ID**.

        > [!IMPORTANT]
        > You'll use this value later and specifically call it out as the **DevOps Application (client) ID**, which is different from the **Application (client) ID** copied in [step 12 below](#create-an-app-registration-in-your-azure-ad-environment)

      ![Copy the Application client ID](media/almacceleratorpowerplatform-components/image-4c6d6244-004e-4ac9-9034-79274f9be4c8.png)

1. After adding permissions in your app registration, select **Grant Admin consent for (your tenant)**.

1. Select **Certificates & Secrets**, and then select **New client secret**.

1. Set the **Expiration**, and then select **Add**.

1. After adding the secret copy the value and store for safe keeping to be used later.

1. Return to the **Overview** section of your app registration and copy the **Application (client) ID** and **Directory (tenant) ID**.

     > [!IMPORTANT]
     > You'll use this value later and call it out as the **Application (client) ID**, which is different from the **DevOps Application (client) ID** copied in [Step 7 above](#create-an-app-registration-in-your-azure-ad-environment).

1. Select **Add a Redirect URI** > **Add a Platform** > **Web**.

1. Set the **Redirect URI** to *https://global.consent.azure-apim.net/redirect*.

    > [!NOTE]
    > You might need to update this later when configuring your custom connector after installing the app if this URL is different than the **Redirect URI** populated in the custom connector.

1. Select **Configure**.

### Install DevOps extensions

The ALM Accelerator uses several DevOps extensions, including some third-party extensions that are available in the DevOps marketplace. Under **Organization settings** in Azure DevOps, install the following extensions. For more information regarding Microsoft and third-party DevOps extensions, go to [Evaluate a Marketplace extension publisher](/azure/devops/marketplace/trust). In addition, each of the third-party extensions web pages and the link to their source code are provided below.

1. Go to <https://dev.azure.com> and select **Organization settings**.
1. Select **General** > **Extension**.
1. Install the following extensions:
   - **Power Platform Build Tools (required)**: This extension contains the first-party build tasks for Power Platform. (<https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools>)

   - **Replace Tokens (required)**: This extension is used by the pipelines to replace tokens in configuration files in order to be able to store secure values in private variables configured for a pipeline. (<https://marketplace.visualstudio.com/items?itemName=qetza.replacetokens> | <https://github.com/qetza/vsts-replacetokens-task>)

   - **SARIF SAST Scans Tab (optional)**: This extension can be used to visualize the SARIF files that are generated by the Solution Checker during a build. ([SARIF SAST Scans Tab - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=sariftools.scans))

      ![Image of SARIF SAST Scans Tab in DevOps](media/almacceleratorpowerplatform-components/image-20210217102344719.png)

### Clone the YAML pipelines from GitHub to your DevOps instance

1. Go to <https://dev.azure.com/> and sign in to **DevOps (AzDO)**.
1. Create a new project or select an existing project.
1. Go to **Repos**, and then select **Import repository** from the repository dropdown list.

1. Enter the URL of the tag for the latest release. For example: [https://github.com/microsoft/coe-alm-accelerator-templates/tree/ALMAcceleratorForAdvancedMakers-September2021a](https://github.com/microsoft/coe-alm-accelerator-templates/tree/ALMAcceleratorForAdvancedMakers-September2021a), as the **Clone URL**, and then select **Import**.
1. Check that the default branch for this repo is `main`. Choose **Repos** and **Branches** and ensure that the `main` branch is tagged as the default.
   If it's not, select the three vertical dots corresponding to the `main` branch and from the **More options** menu, select **Set as default branch**.

   > [!NOTE]
   > The AzDO repo you created will be where the solution pipeline templates and the export/import pipelines will run. Later, when you create the pipelines for your solutions, you might need to reference this specific project/repo if you choose to source control your solutions in another repo in AzDO.

### Create pipelines for import, delete, and export of solutions

Following the steps below to create the following pipelines based on the YAML in the DevOps repo. These pipelines will run when you **Commit to Git**, **Import a Solution**, or **Delete a Solution** from the app, respectively.

> [!NOTE]
> If all of your exports are expected to perform the same actions regardless of the solution for which the pipeline is running it's sufficient to create a single export pipeline as described below. However, there may be circumstances where you want to do things differently based on the specific solution when exporting. In that case you can append the solution name to the export-solution-to-git pipeline to have the app execute your specific solution pipelines when you perform the actions in the app, such as *export-solution-to-git-SampleSolution*.

| YAML File                                    | Pipeline Name                            |
| -------------------------------------------- | ---------------------------------------- |
| export-solution-to-git.yml                   | export-solution-to-git                   |
| import-unmanaged-to-dev-environment.yml      | import-unmanaged-to-dev-environment      |
| delete-unmanaged-solution-and-components.yml | delete-unmanaged-solution-and-components |

1. In DevOps, go to **Pipelines**, and then **Create a New Pipeline**.
1. Select **Azure Repos Git** for your code repository and point to DevOps repo you created and seeded with the pipeline templates in the steps above.
1. On the **Configure your pipeline** page, select **Existing Azure Pipelines YAML file** and point to **/Pipelines/export-solution-to-git.yml**, **/Pipelines/import-unmanaged-to-dev-environment.yml** or **/Pipelines/delete-unmanaged-solution-and-components.yml** and select **Continue**.
1. On the next screen,  select **Save**, select the three dots next to **Run Pipeline**, and then select **Rename/Move**.
1. Update the pipeline name to **export-solution-to-git**, **import-unmanaged-to-dev-environment**, or **delete-unmanaged-solution-and-components**, and then select **Save**.

### Create export pipeline variables (optional)

There are a few optional pipeline variables that can be set on the export-solution-to-git pipeline to control what information is persisted to source control. If you want to apply these settings globally, you can set the following variables on your export-solution-to-git pipeline. Or, in the case that you want to apply these to specific solutions on export, create a specific export pipeline for your solution as described above and set the following variables on your solution-specific export pipeline.

The **DoNotExportCurrentEnvironmentVariableValues** variable can be used to ensure that the current values of environment variables are never committed to source control during the export process. To enable this feature create a new pipeline variable for your export-solution-to-git pipeline and set the value to true.

> [!IMPORTANT]
> This pipeline variable is recommended in order to use the deployment configuration functionality in the AA4PP app.

The **VerifyDefaultEnvironmentVariableValues** can be used to ensure that specific default environment variable values are set during the export of a solution. The default environment variable values can be configured as part of the customDeploymentSettings.json configuration in the [deployment configuration guide](setup-almacceleratorpowerplatform-deployment-config.md). To enable this feature create a new pipeline variable for your export-solution-to-git pipeline and set the Value to true.

### Create pipeline global variables

1. In DevOps, select **Pipelines** > **Library** > **Create a new Variable Group**.
1. Name the variable group *alm-accelerator-variable-group*.

    > [!NOTE]
    > The pipelines reference this specific variable group so it has to be named exactly as what's shown. If you decide to use a different naming convention for your variable group you'll need to modify parts of the pipeline(s) to reference the name you use instead.
1. Add the following variables to the variable group.

    |Name| Value |
    |--|--|
    | CdsBaseConnectionString  | AuthType=ClientSecret;ClientId=\$(ClientId);ClientSecret=\$(ClientSecret);Url= |
    | ClientId  | [The Application (client) ID you copied when creating the app registration] |
    | ClientSecret | [The Application (client) secret you copied when creating the app registration] NOTE: We recommend that you secure this value by selecting the lock next to the value so others can't see your secret. |
    | TenantID  | [The Directory (tenant) ID you copied when creating the app registration] |

### Update permissions for the project build service

> [!IMPORTANT]
> There are a number of "Build Service" accounts in DevOps that may confuse the steps below. Pay close attention to the names and format specified in Step 3 and 5 below. You might need to search for the specific account if it doesn't show up in the initial list.

1. In DevOps, select **Project settings** in the left-hand navigation.

1. Select **Repositories** > **Security**.

1. Find and select **Project Collection Build Service ([Your Organization Name])** under **Users**.

   > [!NOTE]
   > In some cases you might not see Your *Organization Name* after the **Project Collection Build Service** user. In some cases, it might just be a unique identifier and you may need to use the search function to find this user. Select this user.

1. Set the following permissions for the build service user.

   | Permission | Value |
   |--|--|
   | Contribute | Allow |
   | Contribute to pull requests | Allow |
   | Create branch | Allow |
   | Edit policies | Allow |

1. Find and select the user name **[Your Project Name] Build Service ([Your Organization Name])** under **Users**, and then set the same values as above.

1. Select **Pipelines**, select the three dots in the top right corner, and then select **Manage Security**.

1. Set the following permissions for the build service user.

   | Permission                            | Value |
   | ------------------------------------- | ----- |
   | Edit build pipeline                   | Allow |
   | Edit build quality                    | Allow |
   | Manage build queue                    | Allow |
   | Override check-in validation by build | Allow |
   | Update build information              | Allow |
   | View build pipeline                   | Allow |
   | View builds                           | Allow |

1. Select **Service connections**, select the three dots in the top right corner, and then select **Security** and select **Add**.

1. Find and select the user name **[Your Project Name] Build Service ([Your Organization Name])**, and then set the **Role** to Administrator and select **Add**.

1. Select **Agent pools** and select **Security**, then select **Add**.

1. Find and select the user name **[Your Project Name] Build Service ([Your Organization Name])**, and then set the **Role** to Reader and select **Add**.

## Development project set-up

The following section guides you through the set-up steps required for each of the development projects you'll support. In this context, a development project signifies the required infrastructure and configuration needed to support healthy ALM including configuration of you Dataverse environment that will support the ALM process.

### Create service connections for DevOps to access Power Platform

Each Dataverse environment, such as development, validation, test, and production, must have a Power Platform service connection in DevOps. For each of your environments, follow the steps below to set up the service connection.

> [!NOTE]
> Users of the AA4PP app only see environments for which they have either a user or administrator role on the service connection in DevOps. If using personal development environments, all developers should have a user or administrator role for the service connection for their own development environment. Validation, test, and production environment service connections only need permissions granted to pipelines. For example, build service.

1. Go to <https://dev.azure.com> and select your **Project**.

1. Under **Project settings** in your DevOps project, select **Service connections**.

1. Select **Create/New service connection**, search for Power Platform, and then select the **Power Platform** service connection type. Select **Next**.

1. In the **Server URL**, put your environment URL. For example *https://myorg.crm.dynamics.com/*.
   > [!IMPORTANT]
   > You must include the trailing forward slash after the URL. In the example above it is .com/.

1. Enter the same URL as in step 4 for the **Service Connection Name**.

   > [!IMPORTANT]
   >
   > - AA4PP will use the service connection name to identify the service connection to use per environment, so this needs to be the same URL you entered in step 4.
   > - You must include the trailing forward slash after the URL. In the example above it is .com/.

1. Enter the **Tenant ID**, **Application (client) ID**, and **Client Secret** you copied from Azure AD when you created your app registration, and then select **Grant access permissions to all pipelines**. Select **Save**.

1. In order for users to be able to use the service connection from the ALM Accelerator app, the service connections must provide user permissions to all users to be able to use the service connections. Update permissions as follows for environments that user's should be able to access from the app. For example, maker environments:

    - Select the service connection to be shared with users from the **Service Connections** list.

    - Select the three 3 dots in the top-right corner, and then select **Security**.

    - Select the **Group or User** you want to provide user permissions to in the dropdown list.

    - Select the **User**, select a **Role**, and then select **Add**.

1. Repeat these steps for each of your environments, such as development, validation, test, and production.

### Create an app user in your Dataverse environments

Each environment, such as development, validation, test, and production, needs an application user. For each of your environments, follow the steps below to set up the application user.

1. Go to [Power Platform admin center](https://aka.ms/ppac).

1. Select your environment, and then select **Settings**.

1. Select **Users + permissions** > **Application users**.

1. Select **New app user** to add a new application user.

1. Select the Azure app registration you created, **Business Unit**, and **Security Role**.

    > [!NOTE]
    > We recommend you give this user system administrator security role privileges to be able to perform the required functions in each of the environments.

1. Repeat the previous steps for each of your environments, such as development, validation, test, and production.

## Solution set-up

When you create a solution in Dataverse, you'll need to create pipelines specifically for that solution. Follow these steps for creating pipelines for your solution in DevOps. There are sample pipelines included in the **Pipelines** directory in the CoE ALM templates repo.

- <https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-validation-SampleSolution.yml>
- <https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-test-SampleSolution.yml>
- <https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-prod-SampleSolution.yml>

The sample pipelines provide flexibility for organizations to store their pipeline templates in a separate project or repo from the specific solution pipeline YAML. Follow the steps below to configure your solution pipeline. Repeat the steps for each of the solutions you'll be source controlling with the ALM Accelerator.

> [!IMPORTANT]
> The pipeline YAML for your solution pipeline will always be stored in the same repo to which you'll be source controlling your solution. However, the pipeline templates, that is, the folder **Pipeline\Templates**, can exist in either the same repo as your solution pipeline YAML or in a separate repo and/or project.

### Create the solution build and deployment pipelines

Solution pipelines are used to build and deploy your source-controlled solutions to environments in your tenant. You can create as many solution pipelines as needed based on your organization's environment strategy. The sample pipelines provided assume only three environments: validation, test, production. However, more or less can be created as needed with specific triggers in the pipelines or without triggers that can be run manually as well. The sample deployment pipelines trigger off of changes to a branch (that is, test and production) or as a part of a branch policy in DevOps (that is, validation). For more information about branch policies, go to [Setting branch policies for pull request validation](#setting-branch-policies-for-pull-request-validation).

The following steps show how to create a pipeline from the sample pipeline YAML. Follow these steps to create all of your deployment pipelines. For reference, your pipelines will follow this configuration.
> [!IMPORTANT]
> The pipeline name below must be named exactly as shown below. You'll replace 'MyNewSolution' with the name of your solution.

| Pipeline YAML File Name                   | Pipeline Name                   | Branch Policy Enabled | Required              |
| ----------------------------------------- | ------------------------------- | --------------------- | --------------------- |
| build-deploy-validation-MyNewSolution.yml | deploy-validation-MyNewSolution | Yes                   | Yes                   |
| build-deploy-test-MyNewSolution.yml       | deploy-test-MyNewSolution       | No                    | Yes                   |
| build-deploy-prod-MyNewSolution.yml       | deploy-prod-MyNewSolution       | No                    | No (See next section) |

> [!NOTE]
> The following steps create pipelines that build and deploy for each environment, such as validation, test, and production. However, you might want to only build and deploy for validation and test and then deploy the artifacts from the test build to production. Included in the [Create the solution deployment pipeline](#create-the-solution-deployment-pipeline-optional) section are instructions for doing the latter. If this is your preferred method of setting up the pipelines follow the steps below for only the validation and test environments. Then, skip to the next section to see how to configure your release pipeline.

1. In DevOps, go to the repo that contains the [pipelines folder you committed](#clone-the-yaml-pipelines-from-github-to-your-devops-instance), and select the **Pipelines** folder.

1. Open the sample deployment pipeline (that is, **build-deploy-validation-SampleSolution.yml**, **build-deploy-test-SampleSolution.yml**, or **build-deploy-prod-SampleSolution.yml**) and copy the YAML to use in your new Pipeline.
1. Note the name of the repo for use in your pipeline.

1. Go to the repo where you want to source control your solution.

1. Create a new branch based on your default branch in the repo with the name of your solution. For example *MyNewSolution*.

    > [!NOTE]
    > This branch will be your next version (v-next) branch for your solution in the repo. All development work should be branched from this branch to a developers personal working branch and then merged into the v-next branch in order to push to validation and testing. Later, when a release is ready, the v-next branch can be merged into the main or default branch.

1. Select **New** from the top menu, and then select **Folder**.

1. Give the new folder the same name as your solution, such as *MyNewSolution*, and the new pipeline YAML file a name, such as **build-deploy-validation-SampleSolution.yml**, **build-deploy-test-SampleSolution.yml**, or **build-deploy-prod-SampleSolution.yml**). Select **Create**.

1. Paste the YAML from **build-deploy-validation-SampleSolution.yml**, **build-deploy-test-SampleSolution.yml**, or **build-deploy-prod-SampleSolution.yml** into your new pipeline YAML file.

1. Update the following values in your new pipeline YAML:

   - Change the **Resources** > **Repositories** > **Name** to the repo name that contains your pipeline templates. If your template repository is in another AzDO project, you can use the format **projectname/reponame**. In this example, the repo is called **coe-alm-accelerator-templates** and it exists in the same project as our **MyNewSolution** repo. Additionally, you can specify a branch for where your templates live using the `ref` parameter if necessary.

   - Change any value that references **SampleSolutionName** to the unique name of your solution. For example *MyNewSolution*.

1. Select **Commit** to save your changes.

1. In DevOps, go to **Pipelines**, and then select **Create a New Pipeline**.

1. Select **Azure Repos Git** for your code repository.

1. Select the **DevOps repo**, which contains the deployment pipeline YAML.

1. On the **Configure your pipeline** page, select **Existing Azure Pipelines YAML file**, point to the YAML file in your repo that you created previously, and then select **Continue**.

1. On the next screen, select **Save**, select the three dots next to **Run Pipeline**, and then select **Rename/Move**.

1. Update the pipeline name to **deploy-validation-MyNewSolution**, **deploy-test-MyNewSolution**, or **deploy-prod-MyNewSolution** where 'MyNewSolution' is the name of your solution, and then select **Save**.

1. Update the **Default branch for manual and scheduled builds**. More information: [Configure pipeline triggers - Azure Pipelines | Microsoft Docs](/azure/devops/pipelines/process/pipeline-triggers?tabs=YAML#branch-considerations-for-pipeline-completion-triggers).

      > [!NOTE]
      > If your new pipeline was not created in the default branch of the repo you might need to update the **Default branch for manual and scheduled builds**. Go to [Configure pipeline triggers - Azure Pipelines | Microsoft Docs](/azure/devops/pipelines/process/pipeline-triggers?tabs=YAML#branch-considerations-for-pipeline-completion-triggers) for more information about **Default branch for manual and scheduled builds**.

      - Select **Edit** on your new pipeline.

      - Select the 3 dots on the top right, and then select **Triggers**.

      - Select the **YAML** tab, and then select **Get Sources**.

      - Update the **Default branch for manual and scheduled builds** to point to your solution branch.

1. Repeat the steps above to create a deployment pipeline for each of your environments referencing the sample deployment pipeline YAML from the **coe-alm-accelerator-templates repo** (deploy-validation-SampleSolution.yml, deploy-test-SampleSolution.yml, and deploy-prod-SampleSolution.yml).

1. Select **Save and Queue**, and then select **Save**.

### Create the solution deployment pipeline (optional)

As mentioned in the note above, the previous section allows you to create pipelines that build and deploy for each environment, such as validation, test, and production. However, if you want to only build and deploy for validation and test, and then deploy the artifacts from the test build to production, you can follow these instructions to create your production deployment pipeline after you've created your build and deploy pipeline for validation and test. For reference, your pipeline will be configured as follows.

> [!IMPORTANT]
> The pipeline name below must be named exactly as shown below. You'll replace 'MyNewSolution' with the name of your solution.

| Pipeline YAML File Name       | Pipeline Name             | Branch Policy Enabled |
| ----------------------------- | ------------------------- | --------------------- |
| deploy-prod-MyNewSolution.yml | deploy-prod-MyNewSolution | No                    |

1. In DevOps, go to the repo that contains the [pipelines folder you committed](#clone-the-yaml-pipelines-from-github-to-your-devops-instance) and select the **Pipelines** folder.

1. Open the sample deployment pipeline (**deploy-prod-pipelineartifact-SampleSolution.yml**) and copy the YAML to use in your new pipeline.
1. Note the name of this repo for use in your pipeline.

1. Go to the repo where you want to source control your solution.

1. Select **New** from the top menu, and then select **File**.

1. Give the new pipeline YAML file a name. For example *deploy-prod-MyNewSolution.yml*. Select **Create**.

1. Paste the YAML from **deploy-prod-pipelineartifact-SampleSolution.yml**, into your new pipeline YAML file.

1. Update the following values in your new pipeline YAML.

   - Update the **Trigger** > **Branches** > **Include** to the branches for which changes would trigger a deployment to production.

   - Change the **Resources** > **Repositories** > **Name** to the repo name that contains your pipeline templates. If your template repository is in another AzDO project, you can use the format **projectname/reponame**. In this example, the repo is called **coe-alm-accelerator-templates** and it exists in the same project as the **MyNewSolution** repo. Additionally, you can specify a branch for where your templates live using the `ref` parameter if necessary.

   - Update **Resources** > **Pipelines** > **Source** to specify the build pipeline that contains the artifacts to be deployed by this pipeline. In this case, we are going to deploy the artifacts from the test pipeline, created earlier, that built and deployed our solution to the test environment.

   - Change any value that references **SampleSolutionName** to the unique name of your solution. For example *MySolutionName*.

1. Repeat the same steps 9-17 performed for **deploy-validation-ALMAcceleratorSampleSolution** and **deploy-test-ALMAcceleratorSampleSolution** to create a pipeline from the new production pipeline YAML called **deploy-prod-ALMAcceleratorSampleSolution**.

### Setting deployment pipeline variables

**EnvironmentName** and **ServiceConnection** variables are required for each pipeline. These pipeline variables will be set for each deployment pipeline you've configured earlier based on the environment to which your pipeline deploys.

#### Create environment and service connection (required)

These variables are required by every deployment pipeline. The environment variable is **EnvironmentName** and the service connection variable is **ServiceConnection**.

The **EnvironmentName** variable is used to specify the DevOps environment being deployed in order to enable tracking deployment history and set permissions and approvals for deployment to specific environments. Depending on the environment to which you're deploying, set this value to **Validate, Test or Production** For more information on environments in DevOps, go to [Create and target an environment](/azure/devops/pipelines/process/environments).

The **ServiceConnection** variable is used to specify how the deployment pipeline connects to Power Platform. The values used for the service connection variable are the names of the service connections created above [Create a service connection for DevOps to access Power Platform](#create-service-connections-for-devops-to-access-power-platform)

#### Create EnableFlows variable (optional)

You can optionally set a pipeline variable on your deployment pipelines to turn off the automatic enabling of flows after your solution is imported. This variable is **EnableFlows**. Setting EnableFlows to 'false' results in the pipeline skipping the steps to enable Power Automate flows as part of your deployment. The default of the EnableFlows variable value is 'true'.

> [!NOTE]
> You only need to set the EnableFlows variable if you want to skip enabling flows after your solution is imported.

### Setting branch policies for pull request validation

In order to execute the build pipeline for your solution when a pull request is created, you'll need to create a branch policy to execute the pipeline you created in the previous step. Use the following steps to set your branch policy. More information: [Branch policies](/azure/devops/repos/git/branch-policies)

1. In DevOps, go to **Repos**, and then select the **Branches** folder.

1. Locate the target branch on which you want to run the pull request policy, select **...** (ellipsis) to the right of the target branch, and then select **Branch Policies**.

1. On the **Branch Policies** page, go to **Build Validation**.

1. Select **+** to add a new branch policy.

1. Select the pipeline you created from the **Build pipeline** dropdown list.

1. Specify a **Path filter** (if applicable). The path filter ensures that only changes to the path specified will trigger the pipeline for your pull request.

1. Set the **Trigger** to **Automatic**.

1. Set the **Policy requirement** to **Required**.

1. Set the **Build expiration** to **Immediately**.

1. Set a **Display name** for your branch policy. For example *PR Build Validation*.

1. Select **Save**.

   ![Select settings for validation build policy](media/almacceleratorpowerplatform-components/image-20210301104042544.png)

### Create deployment configuration (optional)

There are several configurations that need to be made in a target environment after a solution is deployed. These configurations are specific to the environment into which the solution is being deployed. Included are connection references, environment variables, setting permissions for Azure AD Groups and Dataverse teams as well as sharing canvas apps and updating ownership of solution components, such as Power Automate flows. In addition to these configurations, many times sample or configuration data associated with Dataverse tables in the solution is required in a target environment in order to provide a full end to end ALM experience.

If your solution requires these other configuration settings and/or data, follow the [deployment configuration guide](setup-almacceleratorpowerplatform-deployment-config.md) to configure your pipelines based on the environments to which you're deploying.

## Importing the solution and configuring the app

### Install ALM Accelerator solution in Dataverse

1. Download the latest managed solutions from [GitHub](https://github.com/microsoft/coe-starter-kit/releases).

1. Go to [Power Apps](https://make.powerapps.com) and select the environment you want to use to host the ALM Accelerator app.

1. Select **Solutions** from the left navigation.

1. Select **Import** and browse to the location of the managed solution you downloaded.

1. Select **Next**, and then select **Next** again.

1. On the **Connections** page, select or create a new connection to use to connect to Dataverse for the **CDS DevOps connection**.

    > [!NOTE]
    > When creating a connection for **HTTP with Azure AD** use 'https://graph.microsoft.com' for both parameters.

1. Select **Import** and wait for the solution to complete the import process.

### Configure the DevOps custom connector

1. In [Power Apps](https://make.powerapps.com), select your environment, and then select **Data** > **Custom Connectors** > **CustomAzureDevOps**.

1. Select **Edit**. Then, go to the **Security** section and select **Edit** and set the following fields.

   | Name | Value |
   |--|--|
   | **Client ID** | [The **Application (client) ID** you copied when [creating the app registration](#create-an-app-registration-in-your-azure-ad-environment)] |
   | **Client secret** | [The **Application (client) Secret** you copied when [creating the app registration](#create-an-app-registration-in-your-azure-ad-environment)] |
   | **Tenant ID** | leave as the default **common** |
   | **Resource URL** | [The **DevOps Application (client) ID** you copied when [adding permissions to your app registration](#create-an-app-registration-in-your-azure-ad-environment)] |

1. Select **Update connector**.

1. Verify that the **Redirect URL** is populated on the **Security** page with the URL <https://global.consent.azure-apim.net/redirect>. If the redirect URL is other than <https://global.consent.azure-apim.net/redirect>, copy the URL and [return to the app registration your created](#create-an-app-registration-in-your-azure-ad-environment) and update the [redirect URI](#create-an-app-registration-in-your-azure-ad-environment) you set earlier to the updated URL.

1. Verify the connector from the **Test** menu once you've completed the steps above.
    - Open the **Test** menu.

    - Select **New Connection**, and then follow the prompts to create a new connection.

    - In [Power Apps](https://make.powerapps.com), select your environment, and then select **Data** > **Custom Connectors** > **CustomAzureDevOps**.

    - Select **Edit**, go to the **Test** section and find the **GetOrganizations** operation.

    - Select **Test operation** and verify your **Response Status** returned is **200**.

    ![Test Security Settings for Custom DevOps Connector](media/almacceleratorpowerplatform-components/image-20210222135128137.png)

## Set-up makers to use the ALM Accelerator app

- See the [user set-up guide](setup-almacceleratorpowerplatform-users.md) for the recommended set-up of a maker's user account in Dataverse and DevOps.
- See the [user deployment setting and profile guide](setup-almacceleratorpowerplatform-deployment-profiles.md) for how to configure user experience in the app and access to solutions and deployment profiles.

## Read more

- [ALM Accelerator for Power Platform](/power-platform/guidance/coe/almacceleratorpowerplatform-components) - An overview of the ALM Accelerator.
- [Deployment experience and profile set up](/power-platform/power-platform/guidance/coe/setup-almacceleratorpowerplatform-deployment-profiles) - Configuring user settings and deployment profiles.
- [User permissions set up](/power-platform/power-platform/guidance/coe/setup-almacceleratorpowerplatform-users) - Configuring Microsoft Dataverse users to access the ALM Accelerator for Power Platform.
- [Deployment configuration settings](/power-platform/power-platform/guidance/coe/setup-almacceleratorpowerplatform-deployment-config) - Configuring solution assets for the deployment. For example, connection references, environment variables, and sharing.
- [Pipeline sync set up](/power-platform/power-platform/guidance/coe/setup-almacceleratorpowerplatform-pipeline-sync) - Creating a pipeline to sync the latest YAML from the CoE Starter Kit GitHub repo.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
