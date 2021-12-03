---
title: "ALM Accelerator for Power Platform | MicrosoftDocs"
description: "The ALM Accelerator for Power Platform will help you follow ALM patterns and practices to source control and move your solutions from your development environment to test and production environments using DevOps"
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
# Set up ALM Accelerator for Power Platform (AA4PP) components (Preview)

> [!NOTE]
> ALM Accelerator for Power Platform is currently in public preview. Please see Issues currently tagged as [vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the Roadmap to be completed prior to general availability. While in Public Preview it can be expected that there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the Public Preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that is being developed separately from AA4PP.

The ALM Accelerator components enable makers to apply source control strategies using DevOps and use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. In addition, the ALM Accelerator provides makers the ability to work without intimate knowledge of the downstream technologies and to be able to switch quickly from developing solutions to source controlling the solution and ultimately pushing their apps to other environments with as few interruptions to their work as possible.

The ALM Accelerator components solution doesn't have a dependency on other components of the CoE Starter Kit. It can be used independently.

## Before you start

The following documentation is intended to be a step-by-step process for setting up AA4PP manually. However, **it's recommended that you use the [Center of Excellence Command Line Interface (coe-cli)](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli#readme) to assist in automating these steps**. This document will provide details and context for the actions that are performed by the coe-cli and act as a reference for anyone who wants to know the specifics of each step in the process.

## Document structure

The Setup Guide is structured into seven main sections

- **Prerequisites** - Considerations and requirements to complete the setup.
- **Foundational Setup** - This section walks through the base setup of the AA4PP. The base setup consists of the steps and configurations required.
- **Development Project Setup** - This section includes the steps required to set up a new Development Project covering project-specific setup of DevOps, generic build and deployment pipelines, Service Connections, Power Platform Environments, and Application Users
- **Solution Setup** - These steps are specific to each solution you wish to support with the ALM Accelerator. The section covers setting up the solution-specific pipelines, branch policies, deployment variables to support connections references, environment variables, and AAD group sharing.
- **Importing the Solution and Configuring the App** - This section takes you through the steps required to import the actual AA4PP canvas app and configuring the included custom connector.
- **Using the ALM Accelerator App** - A short introduction to using the AA4PP canvas app
- **Troubleshooting** - A few pointers on some known issues and how to remediate them.

## Prerequisites

### Dataverse Environments

The application will manage deploying solutions from Development to Validation to Testing and to Production. The environment into which you're deploying the ALM Accelerator app will need to be created with a Dataverse database. Additionally, any target environment requires a Dataverse database in order to deploy your solutions.

> [!NOTE]
> Currently the ALM Accelerator is not compatible with Dataverse for Teams. Both the AA4PP App and the associated AzDO pipelines assume the full version of Dataverse is being used in all environments.

You'll need to **create an environment in which to set up the AA4PP Solution**. It's recommended to install AA4PP in the same environment as other CoE Starter Kit Solutions. For more information about how to decide on the best strategy for your organization, see [Establishing an Environment Strategy for Microsoft Power Platform](/power-platform/guidance/adoption/environment-strategy) and [Environment strategy for ALM](/power-platform/alm/environment-strategy-alm).

### DevOps Environment

This solution uses DevOps for source control and deployments (pipelines). You can sign up for DevOps for free for up to five users on the [DevOps](https://azure.microsoft.com/services/DevOps/) site.

### Users and Permissions

To complete the steps below, you'll need the following users and permissions in Power Platform, DevOps, and Azure.

- A licensed **Azure user** with Permissions to **create and view AAD Groups**, **create App Registrations** and **Grant Admin consent** to App Registrations in Azure Active Directory.
- A licensed **DevOps** user with Permissions to **create and manage Pipelines, Service Connections, Repos and Extensions**.
- A licensed **Power Platform** user with Permissions to **create Application Users** and **grant Administrative Permissions** to the Application User.

### Connectors and DLPs

For the AA4PP Canvas App to work, the following connectors must be available to be used together in the environment into which the ALM Accelerator solution is imported.

- [Dataverse (Legacy)](/connectors/commondataservice/)
- [Power Apps for Makers](/connectors/powerappsforappmakers/)
- [HTTP with Azure AD](/connectors/webcontents/) (with endpoint access to <https://graph.microsoft.com>)
- ALM Accelerator Custom DevOps

## Foundational Setup

The following steps will guide you through setting up the foundations of AA4PP. These steps are general to the functionality of the ALM Accelerator and not project or solution-specific.

### Create an App Registration in your AAD Environment

Creating an App Registration for the ALM Accelerator is a one time setup step to grant permissions to the App and the associated pipelines the permissions required to perform operations in **DevOps** and **Power Apps / Dataverse**. The steps below show how to create a single app registration with permissions for both Dataverse and DevOps. However, you might **choose to separate responsibilities into specifically Dataverse and DevOps as separate app registrations**.
Sign in to [portal.azure.com](https://portal.azure.com).

1. Go to **Azure Active Directory** > **App registrations**.
    ![Navigate to Azure Active Directory](media/almacceleratorpowerplatform-components/image-eac55e6c-922b-4e9d-a82f-a331ff90b634.png)

1. Select **New Registration** and give the registration a name (for example ALMAcceleratorServicePrincipal) leave all other options as default and select **Register**.

1. Select **API Permissions** > **+ Add a permission**.

1. Select **Dynamics CRM**, and configure permissions as follows:
    ![Select Dynamics CRM Permission](media/almacceleratorpowerplatform-components/image-f16b131d-9835-4427-bbc1-421b9d802ae6.png)

1. Select **Delegated permissions**, and then select **user_impersonation**.
    ![Select Delegated permissions](media/almacceleratorpowerplatform-components/image-c5e11a72-f4c9-4f57-befe-8edcf0d57fbc.png)

1. Select **Add permissions**.

1. Repeat the steps above for the following permissions:
    - **PowerApps-Advisor (Analysis All)** (Required for running static analysis via [App Checker](/power-platform/alm/checker-api/overview). This permission can be found under **APIs my organization uses**.
      ![Select PowerApps-Advisor (Analysis All) and Delegated permissions](media/almacceleratorpowerplatform-components/image-20210216135345784.png)

    - **DevOps**. (Required for connecting to DevOps via the custom connector in the ALM Accelerator App). This permission can be found under **APIs my organization uses**.

    - When adding the DevOps permission, go to APIs my organization uses and search for DevOps and **copy the Application (client) ID**.

      > [!IMPORTANT]
      > Disambiguation: We'll use this value later and specifically call it out as the **DevOps Application (client) ID** which is different from the **Application (client) ID** copied in Step 12 [below](#create-an-app-registration-in-your-aad-environment)

    - ![Copy the Application client ID](media/almacceleratorpowerplatform-components/image-4c6d6244-004e-4ac9-9034-79274f9be4c8.png)

1. After adding permissions in your App Registration, select **Grant Admin consent for (your tenant)**

1. Select **Certificates & Secrets** and select **New client secret**.

1. Set the **Expiration** and select **Add**.

1. After adding the secret **copy the value** and store for safe keeping to be used later.

1. Return to the **Overview** section of your App Registration and copy the **Application (client) ID** and **Directory (tenant) ID**.

     > [!IMPORTANT]
     > Disambiguation: We'll use this value later and call it out as the **Application (client) ID** which is different from the **DevOps Application (client) ID** copied in Step 7 [above](#create-an-app-registration-in-your-aad-environment)

1. Select **Add a Redirect URI** > **Add a Platform** > **Web**

1. Set the **Redirect URI** to <https://global.consent.azure-apim.net/redirect>

    > [!NOTE]
    > You may need to update this later when configuring your custom connector after installing the app if this URL is different than the Redirect URL populated in the Custom Connector

1. Select **Configure**

### Install DevOps Extensions

The ALM Accelerator uses several DevOps extensions, including some third-party Extensions that are available in the DevOps marketplace. Under Organization Settings in DevOps, install the following extensions. For more information regarding Microsoft and third-party DevOps extensions, see [here](/azure/devops/marketplace/trust). In addition, each of the third-party extensions web pages and the link to their source code are provided below.

1. Go to <https://dev.azure.com> and select **Organization settings**
1. Select **General** > **Extension**
![Navigate to Organization Settings and Select General > Extensions](media/almacceleratorpowerplatform-components/image-3ccc9c10-4cd7-4188-9881-952bba2701dc.png)
1. Install the following Extensions
   - **Power Platform Build Tools (required)**: This extension contains the first-party build tasks for Dataverse. (<https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools>)

   - **Replace Tokens (required)**: This extension is used by the pipelines to replace tokens in configuration files in order to be able to store secure values in private variables configured for a pipeline. (<https://marketplace.visualstudio.com/items?itemName=qetza.replacetokens> | <https://github.com/qetza/vsts-replacetokens-task>)

   - **SARIF SAST Scans Tab (optional)**: This extension can be used to visualize the **Sarif files** that get generated by the **Solution Checker** during a build. ([SARIF SAST Scans Tab - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=sariftools.scans))

      ![Image of SARIF SAST Scans Tab in DevOps](media/almacceleratorpowerplatform-components/image-20210217102344719.png)

### Clone the YAML Pipelines from GitHub to your DevOps instance

1. Go to <https://dev.azure.com/> and **sign in to DevOps (AzDO)**.
1. Create a **new project** or select an **existing project**.
1. Go to **Repos** and select **Import repository** from the repository dropdown

   ![Import a repository into DevOps](media/setup-almacceleratorpowerplatform/clone-template-repository-1.png)

1. Enter the url of the tag for the latest release (for example: [https://github.com/microsoft/coe-alm-accelerator-templates/tree/ALMAcceleratorForAdvancedMakers-September2021a](https://github.com/microsoft/coe-alm-accelerator-templates/tree/ALMAcceleratorForAdvancedMakers-September2021a) as the **Clone URL** and select **Import**
1. Check that the default branch for this repo is `main`. Choose **Repos** and **Branches** and ensure that the `main` branch is tagged as the default:
   ![Verify that the Default Branch in the imported repository](media/setup-almacceleratorpowerplatform/check-default-branch-imported-repository.png)
   If it's not, select the 3 vertical dots corresponding to the `main` branch and from the **More options** menu, choose **Set as default branch**
   ![Set default branch on imported repository](media/setup-almacceleratorpowerplatform/set-default-branch-imported-repository.png)

   > [!NOTE]
   > The AzDO repo you created above will be where the Solution Pipeline Templates and the Export / Import Pipelines will run. Later when you create the Pipelines for your solutions you may need to reference this specific Project/Repo if you choose to source control your solutions in another repo in AzDO.

### Create Pipelines for Import, Delete, and Export of Solutions

Following the steps below to create the following pipelines based on the YAML in the DevOps Repo. These pipelines will run when you **Commit to Git**, **Import a Solution**, or **Delete a Solution** from the App, respectively.

> [!NOTE]
> If all of your exports are expected to perform the same actions regardless of the solution for which the pipeline is running it's sufficient to create a single export pipeline as described below. However, there may be circumstances where you want to do things differently based on the specific solution when exporting. In that case you can append the Solution name to the export-solution-to-git pipeline to have the app execute your specific solution pipeline(s) when you perform the actions in the app (for example export-solution-to-git-SampleSolution).

| YAML File                                    | Pipeline Name                            |
| -------------------------------------------- | ---------------------------------------- |
| export-solution-to-git.yml                   | export-solution-to-git                   |
| import-unmanaged-to-dev-environment.yml      | import-unmanaged-to-dev-environment      |
| delete-unmanaged-solution-and-components.yml | delete-unmanaged-solution-and-components |

1. In DevOps, go to **Pipelines** and **Create a New Pipeline**
1. Select **Azure Repos Git** for your code Repository and point to DevOps repo you created and seeded with the pipeline templates in the steps above.
    ![Select Azure Repos Git to create a new pipeline](media/almacceleratorpowerplatform-components/image-b27c7dc5-7fe7-449f-99bc-73b9b351cc94.png)
1. On the **Configure your pipeline** page select **Existing Azure Pipelines YAML file** and point to **/Pipelines/export-solution-to-git.yml**, **/Pipelines/import-unmanaged-to-dev-environment.yml** or **/Pipelines/delete-unmanaged-solution-and-components.yml**  and Select **Continue**.
    ![Select the path to the export / import or delete YAML file](media/almacceleratorpowerplatform-components/image-20210309102040713.png)
1. On the next screen Select **Save** and then Select the **3 dots next to Run Pipeline** and Select **Rename/Move**.
    ![Rename the newly created pipeline](media/almacceleratorpowerplatform-components/image-c4e3cc16-3abd-453b-a420-9366ef587e8c.png)
1. Update the pipeline name to **export-solution-to-git**, **import-unmanaged-to-dev-environment**, or **delete-unmanaged-solution-and-components** and select **Save**.

### Create Export Pipeline variables (Optional)

There are a few optional pipeline variables that can be set on the export-solution-to-git pipeline to control what information is persisted to source control. If you want to **apply these settings globally**, you can set the following variables on your export-solution-to-git pipeline or in the case that you want to **apply these to specific solutions on export** you can create a specific export pipeline for your solution as described above and setting the following variables on your solution-specific export pipeline.

The **DoNotExportCurrentEnvironmentVariableValues** variable can be used to ensure that the current values of environment variables are never committed to source control during the export process.

> [!IMPORTANT]
> This pipeline variable is recommended in order to use the deployment configuration functionality in the AA4PP App.

![Create the DoNotExportCurrentEnvironmentVariableValues pipeline variable and set the value to true](media/setup-almacceleratorpowerplatform/image-20210723164226271.png)

The **VerifyDefaultEnvironmentVariableValues** can be used to ensure that specific default environment variable values are set during the export of a solution. The default environment variable values can be configured as part of the customDeploymentSettings.json configuration in the [Deployment Configuration Guide](setup-almacceleratorpowerplatform-deployment-config.md)

![Create the VerifyDefaultEnvironmentVariableValuespipeline variable and set the value to true](media/setup-almacceleratorpowerplatform/image-20210723164756178.png)

### Create Pipeline global variables

1. In DevOps Select **Pipelines** > **Library** > **Create a new Variable Group**
1. Name the Variable Group **alm-accelerator-variable-group**.

    > [!NOTE]
    > The pipelines reference this specific variable group so it has to be named exactly as what's shown. If you decide to use a different naming convention for your Variable Group you'll need to modify parts of the pipeline(s) to reference the name you use instead.
1. Add the following Variables to the variable group

    |Name| Value |
    |--|--|
    | CdsBaseConnectionString  | AuthType=ClientSecret;ClientId=\$(ClientId);ClientSecret=\$(ClientSecret);Url= |
    | ClientId  | [The Application (client) ID you copied when creating the App Registration] |
    | ClientSecret | [The Application (client) Secret you copied when creating the App Registration] NOTE: It's recommended that you secure this value by selecting the lock next to the value so others can't see your secret. |
    | TenantID  | [The Directory (tenant) ID you copied when creating the App Registration] |

### Update Permissions for the Project Build Service

> [!IMPORTANT]
> There are a number of "Build Service" accounts in DevOps that may confuse the steps below. Pay close attention to the names / format specified in Step 3 and 5 below. You may need to search for the specific account if it doesn't show up in the initial list.

1. In DevOps Select **Project Settings** in the left-hand navigation.

1. Select **Repositories** > **Security**.

1. Find and select **Project Collection Build Service ([Your Organization Name])** under Users.

   > [!NOTE]
   > In some cases you may not see Your Organization Name after the Project Collection Build Service user. In some cases it may just be a unique identifier and you may need to use the search function to find this user. Select this user]

1. Set the following permissions for the Build Service user.

   | Permission | Value |
   |--|--|
   | Contribute | Allow |
   | Contribute to pull requests | Allow |
   | Create branch | Allow |

   ![Set repository permissions to allow contributions, create pull requests and create branches](media/almacceleratorpowerplatform-components/image-8505cb38-0569-442b-aac0-cc9ceea3b5a5.png)

1. Find and select the user name **[Your Project Name] Build Service ([Your Organization Name])** under Users and set the **same values as above**.

1. Select **Pipelines** and Select **Manage Security**

   ![Select Manage Security for Pipelines](media/setup-almacceleratorpowerplatform/image-20210917105656888.png)

1. Set the following permissions for the Build Service user.

   | Permission                            | Value |
   | ------------------------------------- | ----- |
   | Edit build pipeline                   | Allow |
   | Edit build quality                    | Allow |
   | Manage build queue                    | Allow |
   | Override check-in validation by build | Allow |
   | Update build information              | Allow |
   | View build pipeline                   | Allow |
   | View builds                           | Allow |

   ![Set pipeline permissions](media/setup-almacceleratorpowerplatform/image-20210917105904945.png)

## Development Project Setup

The following section will guide you through the setup steps required for each of the Development Projects you'll support. In this context, a Development Project signifies the required infrastructure and configuration needed to support healthy ALM including configuration of you Dataverse environment that will support the ALM process.

### Create Service Connections for DevOps to access Power Platform

Each Dataverse environment (e.g Development, Validation, Test, and Production) will need to have a **Power Platform service connection in DevOps**. For each of your environments follow the steps below to set up the service connection.

> [!NOTE]
> Users of the AA4PP app will only see environments for which they have either User or Administrator role on the Service Connection in DevOps. If using personal development environments all developers should have User or Administrator role for the Service Connection for their own development environment. Validation, Test, and Production environment service connections only need permissions granted to pipelines (for example Build Service)

1. Go to <https://dev.azure.com> and select your **Project**

1. Under **Project Settings** in your DevOps project, select the **Service connections** menu item.

1. Select **Create/New service connection** and Search for Power Platform and select the **Power Platform** Service connection type and Select **Next**.
    ![Create Power Platform Service Connection](media/almacceleratorpowerplatform-components/image-79dc6002-cb1f-4533-95d5-753ef179c77e.png)

1. In the **Server URL**, put your environment URL (for example <https://myorg.crm.dynamics.com/>). **NOTE: You must include the trailing forward slash see below**

1. Enter the same value as above for the **Service Connection Name**.  **NOTE: You must include the trailing forward slash**

   > [!IMPORTANT]
   > AA4PP will use the Service connection name to identify the service connection to use per environment so this needs to be the same URL you entered above **including the trailing forward slash**).

1. Enter the **Tenant ID**, **Application (client) ID**, and **Client Secret** you copied from AAD when you created your App Registration and select **Grant access permissions to all pipelines** then select **Save**.

    ![Enter Power Platform Service Connection Details](media/setup-almacceleratorpowerplatform/image-20210709131833638.png)

1. In order for users to be able to use the service connection from the ALM Accelerator App the Service Connections must provide **User** permissions to all users to be able to **use** the Service Connections. Update Permissions as follows for environments that user's should be able to access from the App (for example Maker environment(s)):

    - Select the **Service Connection** to be **shared with users** from the **Service Connections** list.

      ![Select the Newly Created Service Connection](media/almacceleratorpowerplatform-components/image-20210401084558807.png)

    - Select the **3 dots** in the top-right corner and Select **Security**.

      ![Select Security Button](media/almacceleratorpowerplatform-components/image-20210401084807231.png)

    - Select the **Group or User** you want to provide User permissions to in the Dropdown.

    - Select the **User** **Role** and Select **Add**

      ![Add a User to the Role](media/setup-almacceleratorpowerplatform/SetServiceConnectionPermissions.png)

1. Repeat these steps for each of your environments (Development, Validation, Test, and Production).

### Create an App User in your Dataverse Environments

**Each environment (Development, Validation, Test and Production) will need to have an Application User.** For each of your environments follow the steps below to set up the Application User.

1. Go to Power Platform Admin Center [https://aka.ms/ppac](https://aka.ms/ppac)

1. Select your environment

1. Select **Settings**
   ![Select Settings in the Power Platform Admin Center](media/setup-almacceleratorpowerplatform/environment-settings.png)

1. Select **Users + permissions** > **Application users**
   ![Select Application users in the Power Platform Admin Center](media/setup-almacceleratorpowerplatform/environment-settings-applications-users.png)

1. Select **New app user** to add a new Application user
   ![Select new app user](media/setup-almacceleratorpowerplatform/environment-new-app-user.png)

1. Select the **Azure App Registration** you created, **Business Unit** and **Security Role**
   ![Select app registration, business unit and security role](media/setup-almacceleratorpowerplatform/create-new-app-user.png)

    > [!NOTE]
    > It's recommended you give this user System Administrator rights to be able to perform the required functions in each of the environments.

1. Repeat these steps for each of your environments (Development, Validation, Test, and Production).

## Solution Setup

When you create a solution in Dataverse, you'll need to **create pipelines specifically for that solution**. Follow these steps for creating pipelines for your solution in DevOps. There are sample pipelines included in the Pipeline directory in the CoE ALM Templates repo.

- <https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-validation-SampleSolution.yml>
- <https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-test-SampleSolution.yml>
- <https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-prod-SampleSolution.yml>

The sample pipelines provide flexibility for organizations to store their pipeline templates in a separate project or repo from the specific solution pipeline YAML. Follow the steps below to configure your **solution pipeline**. Repeat the steps for each of the solutions you'll be source controlling with the ALM Accelerator.

> [!IMPORTANT]
> The pipeline YAML for your solution pipeline will always be stored in the same repo to which you'll be source controlling your solution. However, the pipeline templates (that is, the folder Pipeline\Templates) can exist in either the same repo as your solution pipeline YAML or in a separate repo and/or project.

### Validate Your Setup Using the ALM Accelerator Sample Solution (Optional)

The steps below provide generic step-by-step instructions on how to create pipelines to handle the application lifecycle of your solution. Since these steps are generic, and can be difficult to follow without context. We've create a similar step-by-step setup guide for getting started with a Sample Solution that we've created. This will provide specific context for when you're ready to create and configure your own pipelines for your solution and validate the setup steps performed above. To validate your setup and complete the Sample Solution setup, follow the steps in the [Sample Solution Setup Guide](setup-almacceleratorpowerplatform-sample-solution.md).

### Create the Solution Build and Deployment Pipeline(s)

Solution Pipelines are used to build and deploy your source-controlled solutions to environments in your tenant. You can create as many solution pipelines as needed based on your organization's environment strategy. The sample pipelines provided assume only three environments (Validation, Test, Production). However, more or less can be created as needed with specific triggers in the pipelines or without triggers that can be run manually as well. The sample deployment pipelines trigger off of changes to a branch (that is, Test and Production) or as a part of a branch policy in DevOps (that is, Validation). For more information on Branch Policies, see [Setting Branch Policies for Pull Request Validation](#setting-branch-policies-for-pull-request-validation).

The following steps show how to **create a pipeline from the sample pipeline YAML**. Follow these steps to create all of your deployment pipelines. For reference your pipelines will follow this configuration

| Pipeline YAML File Name                   | Pipeline Name                   | Branch Policy Enabled | Required              |
| ----------------------------------------- | ------------------------------- | --------------------- | --------------------- |
| build-deploy-validation-MyNewSolution.yml | deploy-validation-MyNewSolution | Yes                   | Yes                   |
| build-deploy-test-MyNewSolution.yml       | deploy-test-MyNewSolution       | No                    | Yes                   |
| build-deploy-prod-MyNewSolution.yml       | deploy-prod-MyNewSolution       | No                    | No (See next section) |

> [!NOTE]
> The following steps will create pipelines that **build and deploy for each environment** (Validation, Test and Production). However, you may want to only build and deploy for Validation and Test and then deploy the artifacts from the Test build to Production. Included in [the section following this section](#create-the-solution-deployment-pipeline-optional) are instructions for doing the latter. If this is your preferred method of setting up the pipelines follow the steps below for **only the Validation and Test environment** and then skip to the next section to see how to configure your release pipeline.

1. In DevOps, go to the **Repo** that contains the [Pipelines folder you committed](#clone-the-yaml-pipelines-from-github-to-your-devops-instance) and select the Pipelines folder

1. Open the sample deployment pipeline (that is, **build-deploy-validation-SampleSolution.yml, build-deploy-test-SampleSolution.yml or build-deploy-prod-SampleSolution.yml**) and copy the YAML to use in your new Pipeline. **Note the name of this repo** for use in your pipeline.

   ![Open build-deploy-validation-SampleSolution.yml](media/almacceleratorpowerplatform-components/image-20210408172106137.png)

1. Navigate to the **Repo where you want to source control your solution**.

1. Create a new Branch based on **your default branch** in the Repo with the name of your solution (for example **MyNewSolution**)

    > [!NOTE]
    > This branch will be your next version (v-next) branch for your Solution in the repo. All development work should be branched from this branch to a developers personal working branch and then merged into the v-next branch in order to push to Validation and Testing. Later when a release is ready the v-next branch can be merged into the main or default branch.

    ![Create a New Branch](media/setup-almacceleratorpowerplatform/image-20210507110620258.png)

    ![Create MyNewSolution branch](media/setup-almacceleratorpowerplatform/image-20210507110801961.png)

1. Select **New** from the top menu and then **Folder**

   ![Create a New Folder in the Empty Repo Branch](media/almacceleratorpowerplatform-components/image-20210408144230561.png)

1. Give the new **Folder the same name as your solution** (for example MyNewSolution) and the new Pipeline YAML file a name (for example **build-deploy-validation-SampleSolution.yml**, **build-deploy-test-SampleSolution.yml**, or **build-deploy-prod-SampleSolution.yml**). Select **Create**.

   ![Create a New File in the New Folder](media/almacceleratorpowerplatform-components/image-20210408144634619.png)

1. Paste the YAML from **build-deploy-validation-SampleSolution.yml**, **build-deploy-test-SampleSolution.yml**, or **build-deploy-prod-SampleSolution.yml** into your new Pipeline YAML file.

   ![Paste the YAML Copied above](media/almacceleratorpowerplatform-components/image-20210408155252306.png)

1. Update the following values in your new Pipeline YAML.

   - Change the **resources -> repositories -> name**  to the repo name that contains your pipeline templates. If your template repository is in another AzDO project, you can use the format **projectname/reponame** here. In this case, the repo is called **coe-alm-accelerator-templates** and it exists in the same project as our MyNewSolution repo. Additionally, you can specify a branch for where your templates live using the **ref** parameter if necessary.

      ![Change the pointer to the template repository](media/almacceleratorpowerplatform-components/image-20210408175435181.png)

   - Change any value that references **SampleSolutionName** to the unique name of your Solution (for example MyNewSolution).

      ![Change SampleSolutionName to the name of the Solution](media/almacceleratorpowerplatform-components/image-20210408175919661.png)

   - Select **Commit** to save your changes.

1. In DevOps, go to **Pipelines** and **Create a New Pipeline**

1. Select **Azure Repos Git** for your code Repository.
   ![Create a new Pipeline for your new YAML](media/almacceleratorpowerplatform-components/image-b27c7dc5-7fe7-449f-99bc-73b9b351cc94.png)

1. Select the **DevOps repo** which contains the deployment Pipeline YAML.

    ![Select the Solution Repository](media/almacceleratorpowerplatform-components/image-20210409083340072.png)

1. On the **Configure your pipeline** page select **Existing Azure Pipelines YAML file**, point to the **YAML File in your repo that you created in step 5** and Select **Continue**.
   ![Select Existing Azure Pipelines YAML file](media/almacceleratorpowerplatform-components/image-20210409083824702.png)

1. On the next screen Select **Save** and then Select the 3 dots next to Run Pipeline and Select **Rename/Move**.
   ![Select Save and Rename/Move](media/almacceleratorpowerplatform-components/image-20210301103145498.png)

1. Update the pipeline name to **deploy-validation-MyNewSolution**, **deploy-test-MyNewSolution**,or **deploy-prod-MyNewSolution** (where 'MyNewSolution' is the name of your solution) and select **Save**.

   ![Rename the pipeline to deploy-validation-MyNewSolution](media/almacceleratorpowerplatform-components/image-20210409083958467.png)

1. Update the **Default branch for manual and scheduled builds** for more information, see [Configure pipeline triggers - Azure Pipelines | Microsoft Docs](/azure/devops/pipelines/process/pipeline-triggers?tabs=YAML#branch-considerations-for-pipeline-completion-triggers)

      > [!NOTE]
      > If your new pipeline was not created in the default branch of the repo you may need to update the **Default branch for manual and scheduled builds**. See the following link for more information on **Default branch for manual and scheduled builds**.

      - Select Edit on your new Pipeline

      - **Select the 3 dots** on the top right and **Select Triggers**

        ![Update the triggers for the Pipeline](media/setup-almacceleratorpowerplatform/image-20210510163520532.png)

      - **Select the YAML tab** and **Select Get Sources**.

      - Update the **Default branch for manual and scheduled builds** to point to your **Solution branch**

        ![Update trigger to use the New Branch](media/setup-almacceleratorpowerplatform/image-20210510163722833.png)

1. Repeat the steps above to create a deployment pipeline for each of your environments referencing the sample deployment pipeline YAML from the **coe-alm-accelerator-templates repo** (that is, deploy-validation-SampleSolution.yml, deploy-test-SampleSolution.yml, and deploy-prod-SampleSolution.yml).

1. **Select Save and Queue** and **Select Save**

     ![Save the pipeline](media/setup-almacceleratorpowerplatform/image-20210510163834521.png)

### Create the Solution Deployment Pipeline (Optional)

As mentioned in the note above, the previous section allows you to create pipelines that **build and deploy for each environment** (Validation, Test, and Production). However, if you want to only build and deploy for Validation and Test and then **deploy the artifacts from the Test build to Production** you can follow these instructions to create your production deployment pipeline after you've created your build and deploy pipeline for Validation and Test above. For reference, your pipeline will be configured as follows.

| Pipeline YAML File Name       | Pipeline Name             | Branch Policy Enabled |
| ----------------------------- | ------------------------- | --------------------- |
| deploy-prod-MyNewSolution.yml | deploy-prod-MyNewSolution | No                    |

1. In DevOps, go to the **Repo** that contains the [Pipelines folder you committed](#clone-the-yaml-pipelines-from-github-to-your-devops-instance) and select the Pipelines folder

1. Open the sample deployment pipeline (that is, **deploy-prod-pipelineartifact-SampleSolution.yml**) and copy the YAML to use in your new Pipeline. **Note the name of this repo** for use in your pipeline.

   ![Open the sample deployment pipeline (deploy-prod-pipelineartifact-SampleSolution.yml)](media/setup-almacceleratorpowerplatform/image-20210429113205147.png)

1. Navigate to the **Repo where you want to source control your solution**.

1. Select **New** from the top menu and then **File**

   ![Create new File in the Solution repo branch](media/setup-almacceleratorpowerplatform/image-20210429113559672.png)

1. Give the new Pipeline YAML file a name (for example **deploy-prod-MyNewSolution.yml**). Select **Create**

   ![set the deployment pipeline file name](media/setup-almacceleratorpowerplatform/image-20210429120113505.png)

1. Paste the YAML from **deploy-prod-pipelineartifact-SampleSolution.yml** into your new Pipeline YAML file.

   ![Paste the sample YAML in the new file](media/setup-almacceleratorpowerplatform/image-20210429130240109.png)

1. Update the following values in your new Pipeline YAML.

   - Update the **trigger -> branches -> include** to the branch(es) for which changes would trigger a deployment to production.

   - Change the **resources -> repositories -> name** to the repo name that contains your pipeline templates. If your template repository is in another AzDO project, you can use the format **projectname/reponame** here. In this case, the repo is called **coe-alm-accelerator-templates** and it exists in the same project as our MyNewSolution repo. Additionally, you can specify a branch for where your templates live using the **ref** parameter if necessary.

     ![Update the triggers and the pointer to the template repo](media/setup-almacceleratorpowerplatform/image-20210429131636443.png)

   - Update **resources -> pipelines -> source** to specify **the build pipeline that contains the artifacts to be deployed** by this pipeline. In this case, we are going to deploy the artifacts from our Test pipeline, created above, that built and deployed our Solution to the Test environment.

     ![Update the test pipeline name](media/setup-almacceleratorpowerplatform/image-20210429132004303.png)

   - Change any value that references **SampleSolutionName** to the unique name of your Solution (for example MySolutionName).

     ![Change SampleSolutionName to the name of your solution](media/setup-almacceleratorpowerplatform/image-20210429132557463.png)

1. Repeat the same steps 9-17 performed for **deploy-validation-ALMAcceleratorSampleSolution** and **deploy-test-ALMAcceleratorSampleSolution** to create a pipeline from the new production pipeline YAML called **deploy-prod-ALMAcceleratorSampleSolution**.

### Setting Deployment Pipeline Variables

**EnvironmentName** and **ServiceConnection** variables are **required** for each pipeline. These pipeline variables will be set for each **deployment pipeline** you've configured above based on the environment to which your pipeline deploys.

#### Create Environment and Service Connection (Required)

These variables are required by every deployment pipeline. The Environment variable is **EnvironmentName** and the Service Connection variable is **ServiceConnection**.

The **EnvironmentName** variable is used to specify the DevOps environment being deployed to in order to enable tracking deployment history and set permissions and approvals for deployment to specific environments. Depending on the environment to which you're deploying set this value to **Validate, Test or Production** For more information on Environments in DevOps, see [here](/azure/devops/pipelines/process/environments).

![Set Environment Name Pipeline Variable](media/almacceleratorpowerplatform-components/image-20210414170154479.png)

The **ServiceConnection** variable is used to specify how the deployment pipeline connects to the Power Platform. The values used for the Service Connection variable are the names of the Service Connections created above [Create a Service Connection for DevOps to access Power Platform](#create-service-connections-for-devops-to-access-power-platform)

![Set Service Connection Pipeline Variable](media/almacceleratorpowerplatform-components/image-20210414170210916.png)

#### Create EnableFlows Variable (Optional)

You can optionally set a pipeline variable on your deployment pipelines to turn off the automatic enabling of Flows after your solution is imported. This variable is **EnableFlows**. Setting EnableFlows to 'false' will result in the pipeline skipping the steps to enable Power Automate Flows as part of your deployment. The default of the EnableFlows variable value is 'true'. **You only need to set this variable if you want to skip enabling flows after your solution is imported.**

### Setting Branch Policies for Pull Request Validation

In order to execute the build pipeline for your solution when a **Pull Request is created**, you'll need to create a **Branch Policy** to execute the Pipeline you created in the previous step. Use the following steps to set your Branch Policy. For more information on Branch Policies, see [here](/azure/devops/repos/git/branch-policies)

1. In DevOps, go to **Repos** and select the **Branches** folder

1. Locate the **target branch** on which you want to run the **Pull Request policy** and select the ellipsis to the right of the target branch and Select **Branch Policies**.

   ![Open Branch policies for your Solution branch](media/almacceleratorpowerplatform-components/image-20210301103354462.png)

1. On the **Branch Policies** screen, go to **Build Validation**

1. Select the **+ Button** to add a **new Branch Policy**

   ![Add Build Validation Policy](media/almacceleratorpowerplatform-components/image-20210301103528302.png)

1. Select the Pipeline you created from the **Build pipeline** dropdown

1. Specify a **Path filter** (if applicable). The path filter will ensure that only changes to the path specified will trigger the pipeline for your Pull Request.

1. Set the **Trigger** to **Automatic**

1. Set the **Policy requirement** to **Required**

1. Set the **Build expiration** to **Immediately**

1. Set a **Display name** for your Branch Policy (for example PR Build Validation)

1. Select **Save**

   ![Select settings for Validation Build Policy](media/almacceleratorpowerplatform-components/image-20210301104042544.png)

### Create Deployment Configuration (Optional)

There are several configurations that need to be made in a target environment after a solution is deployed. These configurations are specific to the environment into which the solution is being deployed. Included are **connection references, environment variables, setting permissions for AAD Groups and Dataverse teams** as well as **sharing Canvas Apps and updating ownership of solution components** such as Power Automate flows. In addition to these configurations many times **sample or configuration data associated with Dataverse Tables** in the solution is required in a target environment in order to provide a full end to end ALM experience.

If your solution requires these other configuration settings and / or data, follow the [Deployment Configuration Guide](setup-almacceleratorpowerplatform-deployment-config.md) to configure your pipelines based on the environment(s) to which you're deploying.

## Importing the Solution and Configuring the App

### Install ALM Accelerator Solution in Dataverse

Download the **latest managed solution**(s) from GitHub (<https://github.com/microsoft/coe-starter-kit/releases>).

1. The screenshot below is for reference as to where the managed solution exists under a release. The actual version should be the most recent release.

   ![GitHub Releases for ALM Accelerator for Power Platform](media/setup-almacceleratorpowerplatform/image-20210430150752479.png)

1. Go to <https://make.powerapps.com> and select the environment you want to use to host the ALM Accelerator App

1. Select **Solutions** from the left navigation.

1. Select **Import** and Browse to the location of the managed solution you downloaded.

1. Select **Next** and **Next** again.

1. On the Connections page, select or create a new connection to use to connect to Dataverse for the **CDS DevOps connection**.

    > [!NOTE]
    > When creating a connection for **HTTP with Azure AD** use 'https://graph.microsoft.com' for both parameters

1. Select **Import** and wait for the solution to complete the import process.

### Configure the DevOps Custom Connector

1. In the Power App maker portal, select your **Environment** and Select **Data** > **Custom Connectors** > **CustomAzureDevOps**

1. Select **Edit** and go to the **Security** section and select **Edit** and set the following fields.
   ![Edit Security of Custom DevOps Connector](media/almacceleratorpowerplatform-components/image-683b4819-3664-465a-87d2-0ebe644e4c86.png)

   | Name | Value |
   |--|--|
   | Client ID | [The **Application (client) ID** you copied when [creating the App Registration](#create-an-app-registration-in-your-aad-environment)] |
   | Client secret | [The **Application (client) Secret** you copied when [creating the App Registration](#create-an-app-registration-in-your-aad-environment)] |
   | Tenant ID | leave as the default **common** |
   | Resource URL | [The **DevOps Application (client) ID** you copied when [adding permissions to your App Registration](#create-an-app-registration-in-your-aad-environment)] |

1. Select **Update Connector**

1. Verify that the **Redirect URL** is populated on the Security page with the URL <https://global.consent.azure-apim.net/redirect>. If the **Redirect URL is other than <https://global.consent.azure-apim.net/redirect>** copy the URL and [return to the app registration your created](#create-an-app-registration-in-your-aad-environment) and update the [Redirect URI](#create-an-app-registration-in-your-aad-environment) you set earlier to the updated URL.

1. Verify the connector from the **Test** menu once you've completed the steps above.
    - Navigate to the **Test** menu.

    - Select **New Connection** and follow the prompts to create a new connection.

    - In the Power App maker portal, select your **Environment** and Select **Data** > **Custom Connectors** > **CustomAzureDevOps**.

    - Select **Edit** and go to the **Test** section and find the **GetOrganizations** operation.

    - Select **Test operation** and verify you **Response Status returned is 200**.

    ![Test Security Settings for Custom DevOps Connector](media/almacceleratorpowerplatform-components/image-20210222135128137.png)

## Setup Makers to Use the ALM Accelerator App

- See the [User Setup Guide](setup-almacceleratorpowerplatform-users.md) for the recommended setup of a maker's user account in Dataverse and DevOps.
- See the [User Deployment Setting and Profile Guide](setup-almacceleratorpowerplatform-deployment-profiles.md) for how to configure users' experience in the App and access to solutions and deployment profiles.

## Using the ALM Accelerator App

See the [User Guide](almacceleratorpowerplatform-components.md) for using the ALM Accelerator App

## Troubleshooting

When you setup your pipelines with the pipeline templates stored in a different repository than the solution pipeline, you may get the following message when trying to run your pipeline for the first time. To eliminate the error, select the **Permit** button to grant the repo running the pipeline access to the template repository.

![Permit access to Pipelines](media/almacceleratorpowerplatform-components/image-20210311114131170.png)

Alternatively, to disable this notification for all pipelines you can turn off Limit Job authorization scope to referenced DevOps repositories in **Project -> Settings -> General**. This setting is turned on by default when you create a new project.  ![Permit access to all Repositories](media/almacceleratorpowerplatform-components/image-20210426143538533.png)

> [!NOTE]
> The project settings can be overridden at the DevOps organization level, so if the option to change this is disabled in project settings, check in Organization Settings.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
