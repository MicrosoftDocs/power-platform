---
title: "Set up ALM Helper for Makers components | MicrosoftDocs"
description: "The ALM Helper for Makers components will help you follow best DevOps practices to source control and move your solution from your development environment to test and production environments using GitHub."
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

# Set up ALM Helper for Makers components

The ALM Helper for Makers components enable makers to apply source control strategies using GitHub and use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. In addition PowerOps provides makers the ability to work without intimate knowledge of the downstream technologies and to be able to switch quickly from developing solutions to source controlling the solution and ultimately pushing their apps to other environments with as few interruptions to their work as possible.

This solution uses [GitHub actions](https://docs.microsoft.com/power-platform/alm/devops-github-actions) for source control and deployments. The [GitHub connector](https://docs.microsoft.com/connectors/github/) is used in flows to interact with GitHub.

>[!IMPORTANT]
>The ALM Helper for Makers solution doesn't have a dependency on other components of the CoE Starter Kit. It can be used independently.

## Prerequisites

### Environments

The application will manage deploying solutions from Development to Testing and to Production. You will need separate environments for deploying the ALM Helper for Makers solution, and for Development, Test and Production of you project.

- Create an environment with a Dataverse database for deploying the ALM Helper for Makers solution.
- Any target environment (Development, Test and Production) will require a Dataverse database for deploying solutions.
- Create a GitHub account at [GitHub.com](https://github.com).
- Create a [GitHub org](https://docs.github.com/free-pro-team@latest/github/setting-up-and-managing-organizations-and-teams/creating-a-new-organization-from-scratch).

### Users and Permissions

You will need the following users and permissions in Power Platform and Azure:

- A licensed **Power Apps user** with **System Administrator role** in the environment where the ALM Helper for Makers solution will be deployed.
    >[!NOTE] This user must not have Multi-Factor Authentication enabled until full support of Service Principals are enabled in GitHub workflows.

- A licensed **Azure user** with permissions to create **App Registrations and Grant Admin consent** to App Registrations in Azure Active Directory.

- GitHub account at [GitHub.com](https://github.com)
- [GitHub organization](https://docs.github.com/free-pro-team@latest/github/setting-up-and-managing-organizations-and-teams/creating-a-new-organization-from-scratch)

## Create an Azure AD app registration

Set up an Azure AD app registration that will be used to create environments and retrieve solutions within an environment.

1. Sign in to [portal.azure.com](https://portal.azure.com).

1. Go to **Azure Active Directory** > **App registrations**.

   ![Azure AD app registration](media/coe33.png "Azure AD app registration")

1. Select **+ New Registration**.

1. Enter **GithubDevOpsApp** as name, don't change any other setting, and then select **Register**.

1. Select **API Permissions** > **+ Add a permission**.

1. Select **Dynamics CRM**.

1. Select **Delegated permissions**, and then select **user_impersonation**.

      ![Delegated permissions](media/git-2.png "Delegated permissions")

1. Select **Add permissions**.
1. Select **Grant admin consent for [Your Organization]**.

1. Select **Authentication** from the menu.
1. Under Advanced Settings > Allow public client flows > Toggle **Enable the following mobile and desktop flows** to Yes.

1. Select **Save**.

1. Select **Overview**, and copy and paste the application (client) ID value to notepad. You'll need this value in the next step as you configure the custom connector.

Leave the Azure portal open, because you'll need to copy some information when you set up the custom connector.

## Import the solution

1. Download the CoE Starter Kit compressed file ([aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload)).

1. Extract the zip file.

1. Go to [make.powerapps.com](<https://make.powerapps.com>).

1. Go to your target environment. In the example in the following image, we're importing to the environment named **Contoso CoE**.

     ![Power Apps maker portal environment selection](media/coe6.png "Power Apps maker portal environment selection")

1. Create connections to all connectors used as part of the solution.
    1. Go to **Data** > **Connections**.
    1. Select **+ New Connection**.
    1. Search for and select **Common Data Service**.
     ![Select the Datavsere connector](media/msi-connection.png "Select the Dataverse connector")
    1. Select **+** to create a connection.
    1. Complete the same steps for the following connectors:
        - Office 365 Outlook
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

1. Select **Import**.

## Configure Environment Settings and Deployment Stages after import

1. Go to [make.powerapps.com](<https://make.powerapps.com>).
1. On the left pane, select **Solutions**.
1. Select the **Power Platform GitHub ALM** solution and open the **PowerOps Admin** app.

![Configure Environment Settings and Deployment Stages after import using the PowerOps Admin app](media/git-24.png "Configure Environment Settings and Deployment Stages after import using the PowerOps Admin app.")

### Set up deployment stages

>[!IMPORTANT]
>Update one row at a time and select **Update** to save your changes.

1. Update the **Stage Owner Email** for each of the three stages (DEV, TEST & PROD). The stage owner will receive notification for approving the project creation and deployment.
1. Update the **Admin username and password**. These credentials can be a service account or a user account with Power Platform Admin role.
1. For each of the Test and Production stages, select a pre-existing environment that will be used for Test and Production deployments. Your dev environment is the environment provisioned when you created a project.

### Update the "Webhook Url" value

This Url will be used for callbacks from GitHub.

1. In a new tab, go to [make.powerapps.com](<https://make.powerapps.com>) > **Solutions** > **Power Platform GitHub ALM** solution.
1. Edit the **WorkflowCompleteNotification** flow.
1. Select the first action and copy the URL in the action.
1. Go back to the **PowerOps Admin** app and update the **Webhook Url** with the value copied from the previous step.
1. Select **Update**.

### Update the Client ID

The Client ID is needed for flows to create an environment and perform other admin-related activities like fetching solutions and apps inside an environment.

1. In the PowerOps Admin app, update the Client ID with the Application (client) ID value you copied during [Create an Azure AD app registration](#create-an-azure-ad-app-registration).
1. Select **Update**

### Update the GitHub Org Name

1. Enter your GitHub org name (see [prerequisite](#prerequisites)). The repositories will be created inside this org.
1. Select Update.

### Update the language

1. Change your preferred language. Power Apps uses the [IETF BCP-47 language tag format](https://docs.microsoft.com/powerapps/maker/canvas-apps/functions/function-language#language-tags), for example en_US, fr_FR, it_IT.
1. Select Update.

### Update the “GitHub Plan Exist”

If there’s a Paid GitHub Org Plan that exists for your org. Toggle “GitHub Plan Exists” to On.

## Secure admin credentials

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
1. **Select** to add them to the security profile.

    ![Select Users to add them to a Field Security Profile](media/git-9.png "Select Users to add them to a Field Security Profile")
1. Repeat this step for all users that will use PowerOps.
1. Select **Save and Close**.

    ![Save the Field Security Profile](media/git-10.png "Save the Field Security Profile")

## Configure GitHub org secrets

GitHub Org secrets will be used to make API calls to import/export solutions and to interact with Microsoft Dataverse. Secrets are the recommended way of storing sensitive information.

GitHub supports org secrets and repository level secrets. If you have a paid plan, all the secrets created at the org level can be used by private repositories as well. That’s the advantage of having a paid plan. Otherwise, **the admin has to create secrets for all of the repositories**.

Learn more: [GitHub Team offerings](https://docs.github.com/free-pro-team@latest/github/getting-started-with-github/githubs-products#github-team).

>[!IMPORTANT]
> The environment admin must have GitHub repo admin permissions to complete the below steps.

## Paid GitHub org plan

If you have a paid GitHub org plan, configure org secrets:

1. Navigate to your org in GitHub (https://github.com/yourorg).
1. Select **Settings** > **Secret** > **New organization secret**
    ![Select Secrets from your GitHub Org Settings](media/git-20.png "Select Secrets from your GitHub Org Settings")
1. Enter **DEV_ENVIRONMENT_SECRET** as a secret name for your Dev deployment stage, and enter the value for your secret.
1. Select **Private Repositories** from the Repository access dropdown.
         ![Select Private Repositories for your Secret](media/git-21.png "Select Private Repositories for your Secret")
1. Select **Add Secret**.
1. Complete the above steps to add a **TEST_ENVIRONMENT_SECRET** and **PROD_ENVIRONMENT_SECRET**.

## Free GitHub org plan

If you do not have a paid GitHub org plan, follow the below steps for all projects created in PowerOps.

>[!NOTE]
>These steps need to be followed for all projects created in PowerOps.

1. Navigate to your org in GitHub (https://github.com/yourorg).
1. Select **Settings** > **Secret** > **New organization secret**
1. Enter **DEV_ENVIRONMENT_SECRET** as a secret name for your Dev deployment stage, and enter the value for your secret.
    ![Select Private Repositories for your Secret](media/git-22.png "Select Private Repositories for your Secret")
1. Select **Add Secret**.
1. Complete the above steps to add a **TEST_ENVIRONMENT_SECRET** and **PROD_ENVIRONMENT_SECRET**.

You can now [use the PowerOps components](powerops-components.md).
