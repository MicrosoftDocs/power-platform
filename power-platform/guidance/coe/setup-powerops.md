---
title: "Set up the Power Ops ALM solution | MicrosoftDocs"
description: "The Power Ops ALM solution uses GitHub to facilitate moving solutions from development to test to production environments."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/20/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Set up PowerOps components

You can use the PowerOps components to facilitate ALM for Power Platform solutions. The PowerOps components help you create projects, get your own development environment and follow best practices to move solutions from development to test to production environments.

This solution uses [GitHub actions](https://docs.microsoft.com/power-platform/alm/devops-github-actions) for source control and deployments. The [GitHub connector](https://docs.microsoft.com/connectors/github/) is used in flows to interact with GitHub.

>[!IMPORTANT]
>The PowerOps components solution doesn't have a dependency on other components of the CoE Starter Kit. It can be used independently.

## Prerequisites

- Create a GitHub account at [GitHub.com](https://github.com)
- Create a [GitHub org](https://docs.github.com/free-pro-team@latest/github/setting-up-and-managing-organizations-and-teams/creating-a-new-organization-from-scratch)

- If you aren't already using the CoE Starter Kit, we recommend [creating a new environment](https://docs.microsoft.com/power-platform/admin/create-environment) for CoE solutions.
- If you are already using other CoE Starter Kit components, use the environment that you created as part of setting up the [core components](setup-core-components.md) for this solution.

## Create an Azure AD app registration

Using these steps, you'll set up an Azure AD app registration that will be used to create environments and retrieve solutions within an environment.

Sign in to [portal.azure.com](https://portal.azure.com).

1. Go to **Azure Active Directory** > **App registrations**.

   ![Azure AD app registration](media/coe33.png "Azure AD app registration")

1. Select **+ New Registration**.

1. Enter **GithubDevOpsApp** as name, don't change any other setting, and then select **Register**.

1. Select **API Permissions** > **+ Add a permission**.

1. Select **PowerApps Runtime Service**, and configure permissions as follows:

   ![API Permissions - Add a permission](media/git-1.png "Add a permission")

   1. Select **Delegated permissions**, and then select **user_impersonation**.

      ![Delegated permissions](media/git-2.png "Delegated permissions")

   1. Select **Add permissions**.

1. Select **Overview**, and copy and paste the application (client) ID values to notepad. You'll need these values in the next step as you configure the custom connector.

Leave the Azure portal open, because you'll need to make some configuration updates after you set up the custom connector.

## Import the solution

1. Download the CoE Starter Kit compressed file ([aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload)).

1. Extract the zip file.

1. Go to [make.powerapps.com](<https://make.powerapps.com>).

1. Go to your CoE environment. In the example in the following image, we're importing to the environment named **Contoso CoE**.

     ![Power Apps maker portal environment selection](media/coe6.png "Power Apps maker portal environment selection")

1. Create connections to all connectors used as part of the solution.
    1. Go to **Data** > **Connections**.
    1. Select **+ New Connection**.
    1. Search for and select **Common Data Service**.
     ![Select the Datavsere connector](media/msi-connection.png "Select the Dataverse connector")
    1. Select **+** to create a connection.
    1. Complete the same steps for the following connectors:
        - Mail
        - GitHub
        - Power Apps for Makers
        - Power Platform for Admins
        - Approval
        - Content Conversion

1. On the left pane, select **Solutions**.

1. Select **Import**. A pop-up window appears. (If the window doesn't appear, be sure your browser's pop-up blocker is disabled and try again.)

1. In the pop-up window, select **Choose File**.

1. Select the PowerOps GitHub ALM solution from File Explorer (PowerPlatformGitHubALM_x_x_x_xx_managed.zip).

1. When the compressed (.zip) file has been loaded, select **Next**.

1. Review the information, and then select **Next**.
1. Establish connections to activate your solution. If you create a new connection, you must select **Refresh**. You won't lose your import progress.

     ![Establish connections to activate your solution](media/git-4.png "Establish connections to activate your solution.")

1. Update environment variable values. The environment variables are used to store application and flow configuration data with data specific to your organization or environment. You will configure some Environment Variables during import, and you will [update some environment variables](#update-environment-variables) after import.

    Configure the following variables for the PowerOps components solution during Import, leave the remaining ones blank and select **Save**.

    | Name | Current Value |
    |------|---------------|
    |OrgName| The name of the GitHub Org created during [Pre-Requisites](#pre-requisites) |
    |Dependency Environment User Id| Enter the User Id if you have a solution that needs to be installed when a new environment is created. Leave blank if you do not have a solution that needs to be installed first. |
    |Dependency Environment Url| Enter the Environment Url if you have a solution that needs to be installed when a new environment is created. Leave blank if you do not have a solution that needs to be installed first. |
    |Client ID | Enter the Applicaiton (client) ID from the Azure App Registration |

     ![Update environment variable values](media/git-3.png "Update environment variable values.")

1. Select **Import**.

## Update environment variables

Environment variables are used to store application and flow configuration data with data specific to your organization or environment. You will have configured some Environment Variables during import, and some after import.

- The WebHookURL environment variable depend on the import to have finished for their value. It is mandatory to update this variable after import.
- The GitHubOrgPlanExists and OrgLanguage environment variables are shipped with a Default Value that you can change after import. It is optional to update this variables after import.
- The remaining environment variables have been configured during import, and can be changed using the below steps.

>[!IMPORTANT]
>To edit environment variables in the environment, open the **Default Solution** for the environment and set the **Type** filter to **Environment variable**.

- Select a variable, and then configure its **Current Value**.

    Configure the following variables for the PowerOps components solution, and then select **Save**.

    | Name | Current Value |
    |------|---------------|
    |WebHookURL | Edit the WorkflowCompleteNotification flow in your solution, select the "When a HTTP request is received" action and copy the HTTP POST URL in the action. Enter this URL as the Current Value for this variable. |
    | GitHubOrgPlanExist | Enter Yes if a paid GitHub Org plan exists for your organization. Default Value: No |
    | OrgLanguage | Change your preferred language. Power Apps uses the [IETF BCP-47 language tag format](https://docs.microsoft.com/powerapps/maker/canvas-apps/functions/function-language#language-tags), for example en_US, fr_FR, it_IT. Default Value: en_US |
    |OrgName| The name of the GitHub Org created during [Pre-Requisites](#pre-requisites) |
    |Dependency Environment User Id| Enter the User Id if you have a solution that needs to be installed when a new environment is created. Leave blank if you do not have a solution that needs to be installed first. |
    |Dependency Environment Url| Enter the Environment Url if you have a solution that needs to be installed when a new environment is created. Leave blank if you do not have a solution that needs to be installed first. |
    |Client ID | Enter the Applicaiton (client) ID from the Azure App Registration |

## Configure field level security

[Field level security](https://docs.microsoft.com/power-platform/admin/field-level-security) is enabled to secure credentials for deployments. As an admin, you will need to add users to the **FieldSecurityForPassword** field security profile to enable those users to add their credentials for the deployment from development to test and production environments.

Add users to the field security profile:

1. Go to [make.powerapps.com](https://make.powerapps.com/), select **Solutions**, and then open the **Power Platform GitHub ALM** solution.
1. Select **FieldSecurityForPassword** from the solution.
    ![Select FieldSecurityForPassword from the solution](media/git-6.png "Select FieldSecurityForPassword from the solution")
1. Select **Users**.
     ![Select Users from Field Security Profile](media/git-7.png "Select Users from Field Security Profile")
1. Select **Add**.
1. Search for Users.
    ![Search for Users for the Field Security Profile](media/git-8.png "Search for Users for the Field Security Profile")
1. Click **Select** to add them to the security profile.
    ![Select Users to add them to a Field Security Profile](media/git-9.png "Select Users to add them to a Field Security Profile")
1. Repeat this step for all users that will use PowerOps.
1. Select **Save and Close**.
    ![Save the Field Security Profile](media/git-10.png "Save the Field Security Profile")

## Enter prerequisite data

This section explains how to enter data in the Deployment Stages and  table. PowerOps depends on these tables being configured.

add info on get environment url and id
![Save the Field Security Profile](media/git-11.png "Save the Field Security Profile")

### Deployment Stages

You will no enter three rows that contain information about your deployment stages (Development/Test/Production)

1. Go to [make.powerapps.com](https://make.powerapps.com/), select **Solutions**, and then open the **Power Platform GitHub ALM** solution.
1. Select the **Deployment Stage** table.
    ![Select the Deployment Stage table](media/git-12.png "Select the Deployment Stage table")
1. Select **Edit data in Excel**.
    ![Select Edit data in Excel](media/git-13.png "Select Edit data in Excel")
1. Open the file in Edit Mode.
    ![Open the file in Edit Mode.](media/git-14.png "Open the file in Edit Mode.")
1. Add the below three rows with your information for the deployment stages
    | Name | BuildEnabled | Order | Password | Username | Target Environment Name | Target Environment URL | Stage Owner |
    |------|---------------|------|------|------|------|------|------|
    | DEV | No | 1 | *Your password* | *Your username* | *Your Development Environment Name* | *Your Development Environment URL* | *Owner* |
    | TEST | Yes | 2 | *Your password* | *Your username* | *Your Test Environment* | *Your Test Environment*  | *Owner*  |
    | PROD | Yes | 3 | *Your password* | *Your username* | *Your Prod Environment Name* | *Your Prd Environment URL* | *Owner* |
1. Select **Publish** to update the data in the table.
    ![Publish changes to update the data in the table](media/git-15.png "Publish changes to update the data in the table")

### Import localization data

You will now import localized end user facing text into the **StringText** table. This table is then used in the canvas app to show labels, buttons and controls to end users in your preferred language.

1. Go to [make.powerapps.com](https://make.powerapps.com/), select **Solutions**, and then open the **Power Platform GitHub ALM** solution.
1. Select the **StringText** table.
1. Select **Get Data from Excel**.
1. Select **File not uploaded** to browse for a file.
1. Browse to the folder you extracted the CoE Starter Kit download to and select the **cat_deploymentstages.csv** file.
1. Once the mapping status has changed to *Mapping was successful*, select **Import**

## Configure Org Secrets

>[!IMPORTANT]
> The environment admin must have GitHub repo admin permissions to complete the below steps.

## Paid GitHub org plan

If you have a paid GitHub org plan, configure org secrets:

1. Navigate to your org in GitHub (https://github.com/yourorg).
1. Select **Settings**.
1. Select **Secrets**.
    ![Select Secrets from your GitHub Org Settings](media/git-20.png "Select Secrets from your GitHub Org Settings")
1. Select **New Secret**.
1. Enter **DEV_ENVIRONMENT_SECRET** as a secret name for your Dev deployment stage, and enter the value for your secret.
1. Select **Private Repositories** from the Repository access dropdown.
         ![Select Private Repositories for your Secret](media/git-21.png "Select Private Repositories for your Secret")
1. Select **Add Secret**.
1. Complete the above steps to add a **TEST_ENVIRONMENT_SECRET** and **PROD_ENVIRONMENT_SECRET**.

## Free GitHub org plan

If you do not have a paid GitHub org plan, follow the below steps for all projects created in PowerOps.

1. Navigate to your org in GitHub (https://github.com/yourorg).
1. Select **Settings**.
1. Select **Secrets**.
1. Select **New Secret**.
1. Enter **DEV_ENVIRONMENT_SECRET** as a secret name for your Dev deployment stage, and enter the value for your secret.
    ![Select Private Repositories for your Secret](media/git-22.png "Select Private Repositories for your Secret")
1. Select **Add Secret**.
1. Complete the above steps to add a **TEST_ENVIRONMENT_SECRET** and **PROD_ENVIRONMENT_SECRET**.

>[!NOTE]
> Configure an additional **DEPENDENCY_ENVIRONMENT_SECRET** secret if you have configured a solution that needs to be installed during environment setup.

You can now [use the PowerOps components](powerops-components.md).
