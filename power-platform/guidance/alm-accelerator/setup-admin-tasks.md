---
title: Configure the ALM Accelerator using the admin app
description: Learn how to configure the ALM Accelerator for Power Platform using the built-in administration app.
ms.topic: how-to
ms.date: 06/13/2024
ms.subservice: guidance-toolkit
author: jenschristianschroder
ms.author: jeschro
ms.reviewer: sericks
ms.custom:
  - bap-template
  - sfi-image-nochange
---

# Configure the ALM Accelerator using the admin app

You can configure the components of the ALM Accelerator for Power Platform either using its administration app or [manually](setup-components-manually.md). This article guides you through using the admin app and is structured in seven sections:

- [**Prerequisites**](#prerequisites)
- [**Configure Microsoft Entra app registrations**](#configure-microsoft-entra-app-registrations)
- [**Install Azure DevOps extensions**](#install-azure-devops-extensions)
- [**Import the solution and configure the app**](#import-the-solution-and-configure-the-app)
- [**Set up your first Azure DevOps project for use with the ALM Accelerator**](#set-up-your-first-azure-devops-project-for-use-with-the-alm-accelerator)
- [**Create an app user in your Dataverse environments**](#create-an-app-user-in-your-dataverse-environments)
- [**Set up makers to use the ALM Accelerator app**](#set-up-makers-to-use-the-alm-accelerator-app)

## Prerequisites

Before you install the ALM Accelerator for Power Platform, make sure you've met the following prerequisites.

- The ALM Accelerator must be installed in a Power Platform environment that has a Microsoft Dataverse database. All the environments you use the ALM Accelerator to deploy solutions to also require a Dataverse database.

  > [!NOTE]
  > The ALM Accelerator isn't compatible with Dataverse for Teams. Both the ALM Accelerator app and the associated pipelines assume that you're using the full version of Dataverse in all environments.

  We recommend you install the ALM Accelerator in the same environment as other CoE Starter Kit solutions. Learn more about how to determine the best strategy for your organization:

  - [Develop a tenant environment strategy to adopt Power Platform at scale](../adoption/environment-strategy.md)
  - [Environment strategy for ALM](../../alm/environment-strategy-alm.md)

- The ALM Accelerator uses Azure DevOps for source control and deployments. If you don't have an Azure DevOps organization, sign up for free for up to five users on the [Azure DevOps site](https://azure.microsoft.com/products/devops/).

- To complete the steps in this section, you need the following users and permissions in Azure, Azure DevOps, and Power Platform:

  - A licensed Azure user with permissions to create and view Microsoft Entra groups, create app registrations, and grant admin consent to app registrations in Microsoft Entra ID
  - A licensed Azure DevOps user with permissions to create and manage pipelines, service connections, repos, and extensions
  - A licensed Power Platform user with permissions to create application users and grant them administrative permissions

- The following connectors must be available to be used together in the environment into which the ALM Accelerator is imported:

  - [Dataverse (legacy)](/connectors/commondataservice/)
  - HTTP
  - [Power Apps for Makers](/connectors/powerappsforappmakers/)
  - [HTTP with Microsoft Entra ID](/connectors/webcontents/) (with endpoint access to <https://graph.microsoft.com>)
  - ALM Accelerator Custom DevOps (this connector is created as part of the [accelerator solution import](#import-the-solution-and-configure-the-app))
  - [Office 365 Users](/connectors/office365users/)
  - HTTP

- [Install the Creator Kit](/power-platform/guidance/creator-kit/setup) in the environment where you install the ALM Accelerator.

## Configure Microsoft Entra app registrations

The following steps are general to the functionality of the ALM Accelerator and aren't specific to any project or solution.

### Create an app registration in your Microsoft Entra environment

Create an app registration for the ALM Accelerator to grant the app and associated pipelines permissions required to perform operations in Azure DevOps and Power Apps or Dataverse. You only need to do this once.

The following steps show how to create a single app registration with permissions for both Dataverse and Azure DevOps. However, you might want to create separate app registrations to divide responsibilities. You should [consider how separate app registrations affect both maintenance and security](app-registration-strategy.md) before you decide on an app registration strategy.

#### Create the app registration

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Select **Microsoft Entra ID** > **App registrations**.

1. Select **+ New registration**, and then give the registration a name, such as *ALMAcceleratorServicePrincipal*.

1. Leave all other options at their default values, and select **Register**.

#### Add permissions to the app registration

1. In the left side panel, select **API permissions**.

1. Select **+ Add a permission**.

1. Select **Dynamics CRM**, and then select **Delegated permissions** and **user_impersonation**.

1. Select **Add permissions** to add the Dynamics CRM API user_impersonation permission to the app registration.

1. Select **+ Add a permission** again.

1. Select the **APIs my organization uses** tab. Search for and select **PowerApps-Advisor**, and then select **Delegated permissions** and **Analysis.All** (admin consent not required).

    This permission is required to run static analysis through the [app checker](../../alm/checker-api/overview.md).

1. Select **Add permissions** to add the PowerApps-Advisor API Analysis.All permission to the app registration.

1. Select **+ Add a permission** again.

1. On either the **Microsoft APIs** tab or the **APIs my organization uses** tab, select **Azure DevOps**, and then select **Delegated permissions** and **user_impersonation**.

    This permission is required for connecting to Azure DevOps through the custom connector in the ALM Accelerator app.

1. If you added the Azure DevOps permission from the **APIs my organization uses** tab, copy the **Application (client) ID** for use later in this procedure.

    You'll use it as the **DevOps Application (client) ID**, which is different from the **Application (client) ID** you'll copy later in this procedure.

    :::image type="content" source="media/almacceleratorpowerplatform-components/image-4c6d6244-004e-4ac9-9034-79274f9be4c8.png" alt-text="Screenshot of the Request API permissions window, with the APIs my organization uses tab and Application (client) ID highlighted.":::<!-- EDITOR'S NOTE: Please crop and rename the screenshot IAW our [screenshot guidelines](/bacx/screenshots-for-bap?branch=main) -->

    If you can't find the Azure DevOps permission on the **APIs my organization uses** tab, follow these steps to get the **DevOps Application (client) ID**:

      1. Open a private browser window and go to `https://dev.azure.com/<your devops organization>/_apis`.
      1. On the sign-in page, copy the value of the **client_id** parameter in the URL.

      :::image type="content" source="media/almacceleratorpowerplatform-components/aa4pp-devops-clientid.png" alt-text="Screenshot of an Azure DevOps organization sign-in page, with the client_id parameter in the URL highlighted.":::<!-- EDITOR'S NOTE: Please crop the screenshot IAW our [screenshot guidelines](/bacx/screenshots-for-bap?branch=main) -->

1. Select **Add permissions** to add the Azure DevOps API user_impersonation permission to the app registration.

1. Select **Grant admin consent for \<*your tenant*\>**.

#### Configure the client secret and redirect URI

1. In the left side panel, select **Certificates & secrets**.

1. Select **+ New client secret**.

1. Select an expiration date, and then select **Add**.

1. Copy the client secret **Value** for use later. *This is the only time you can copy the value.* Be sure to do so before you leave the page.

1. In the left side panel, select **Overview**.

1. Copy the **Application (client) ID** and **Directory (tenant) ID**.

1. Select **Add a Redirect URI**.

1. Select **+ Add a Platform**, and then select **Web**.

1. For the redirect URI of the application, enter *`https://global.consent.azure-apim.net/redirect`*.

    You might need to change this value after you install the ALM Accelerator app and configure the Azure DevOps custom connector. If the redirect URI that's populated in the custom connector is different from what you enter here, change this URI to match the one in the custom connector.

1. Select **Configure**.

### Give Power App Management permission to your app registration

Grant [Power App Management](/powershell/module/microsoft.powerapps.administration.powershell/new-powerappmanagementapp) permissions to your app registration so that the pipelines can perform the actions they need to in your environments. To do that, run the following PowerShell cmdlet as an interactive user that has Power Apps administrative privileges. You only need to run this command once, after you create your app registration.

> [!IMPORTANT]
> The following PowerShell cmdlet gives the app registration elevated permissions like Power Platform Admin. Your organization's security policies may not allow these types of permissions. Make sure they're allowed before you continue. If they aren't allowed, certain capabilities don't work in the ALM Accelerator pipelines.

```powershell
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
Install-Module -Name Microsoft.PowerApps.PowerShell -AllowClobber
New-PowerAppManagementApp -ApplicationId <the Application (client) ID you copied when you created the app registration>
```

### Install Azure DevOps extensions

The ALM Accelerator uses several Azure DevOps extensions, including some third-party extensions that are available in the Azure DevOps marketplace. The website of each third-party extension and a link to their source code are provided in the following instructions. [Learn how to evaluate a Marketplace extension publisher](/azure/devops/marketplace/trust).

1. Sign in to [Azure DevOps](https://dev.azure.com).

1. Select **Organization settings**.

1. Select **General** > **Extensions**.

1. Search for and install the following extensions:

   - **Power Platform Build Tools (required)**: This extension contains the Microsoft build tasks for Power Platform. (<https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools>)

   - **Replace Tokens (required)**: The pipelines use this extension to replace tokens in configuration files and store secure values in private variables configured for a pipeline. (<https://marketplace.visualstudio.com/items?itemName=qetza.replacetokens> | <https://github.com/qetza/vsts-replacetokens-task>)

   - **SARIF SAST Scans Tab (optional)**: Use this extension to visualize the SARIF files the solution checker generates during a build. ([SARIF SAST Scans Tab - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=sariftools.scans))

      :::image type="content" source="media/almacceleratorpowerplatform-components/image-20210217102344719.png" alt-text="Screenshot of the SARIF SAST Scans tab in Azure DevOps.":::<!-- EDITOR'S NOTE: Please crop and rename the screenshot IAW our [screenshot guidelines](/bacx/screenshots-for-bap?branch=main) -->

## Import the solution and configure the app

Import the ALM Accelerator canvas app into your Power Platform environment, and then configure the included custom connector for Azure DevOps.

### Install the ALM Accelerator in Dataverse

1. Download the latest managed solution file from [GitHub](https://github.com/microsoft/coe-starter-kit/releases). Scroll down to **Assets** and select *CenterofExcellenceALMAccelerator_\<latest version\>_managed.zip*.

1. Sign in to [Power Apps](https://make.powerapps.com), and then select the environment you want to host the ALM Accelerator app.

1. In the left side panel, select **Solutions**.

1. Select **Import solution** > **Browse**, and then browse to the location of the managed solution you downloaded and select the file.

1. Select **Next**, and then select **Next** again.

1. On the **Connections** page, select or create a connection to connect the **CDS DevOps connection** to Dataverse.

    When you create a connection for **HTTP with Microsoft Entra**, use **[Microsoft Graph](https://graph.microsoft.com)** for both parameters.

1. Select **Import**.

### Configure the DevOps custom connector

1. Select **Data** > **Custom Connectors** > **CustomAzureDevOps**.

1. Select **Edit**.

1. On the **Security** tab, select **Edit**, and then set the following values:

   | Name | Value |
   |--|--|
   | **Authentication Type** | **OAuth 2.0** |
   | **Identity provider** | **Microsoft Entra ID** |
   | **Client ID** | The **Application (client) ID** you copied when you [created the app registration](#create-an-app-registration-in-your-microsoft-entra-environment) |
   | **Client secret** | The **Application (client) secret value** you copied when you [created the app registration](#create-an-app-registration-in-your-microsoft-entra-environment) |
   | **Tenant ID** | Leave the default value, **common** |
   | **Resource URL** | The **DevOps Application (client) ID** you copied when you [added permissions to your app registration](#create-an-app-registration-in-your-microsoft-entra-environment) |

1. Select **Update connector**.

1. Confirm that the **Redirect URL** on the **Security** page is `https://global.consent.azure-apim.net/redirect`.

    If it isn't, copy the URL. [Return to the app registration you created](#create-an-app-registration-in-your-microsoft-entra-environment) earlier and replace the redirect URI there with the copied URL.

#### Test the custom connector

1. Open the **Test** menu.

1. Select **New Connection**, and then follow the prompts to create a connection.

1. In [Power Apps](https://make.powerapps.com), select your environment, and then select **Dataverse** > **Custom Connectors** > **CustomAzureDevOps**.

1. Select **Edit**, go to the **Test** page, and then find the **GetOrganizations** operation.

1. Select **Test operation**.

1. Confirm the **Response Status** returned is **200** and that the **Response Body** is a JSON representation of your Azure DevOps organization.

    :::image type="content" source="media/almacceleratorpowerplatform-components/image-20210222135128137.png" alt-text="Screenshot of test security settings for a custom Azure DevOps connector.":::

## Set up your first Azure DevOps project for use with the ALM Accelerator

Use the included wizard to set up your Azure DevOps project to deploy Power Platform solutions using the ALM Accelerator. You can configure an existing empty project or create one.

1. Open the ALM Accelerator administration app.

1. In the left side panel, select **Projects** in the **Azure DevOps** group.

1. If you're prompted to update **Release Tags**, select **Okay**.

1. Select your Azure DevOps organization in the list.

1. In the **Projects List**, select **New**.

1. Select **Project Wizard**.

1. In the **Project** step, enter the name of your project. Optionally, enter a description and enable preview features.

1. Select **Next**.

1. In the **Pipeline Templates** step, select **Next** to install templates in your project.

    The app installs the pipeline templates into a new repository in the project. Alternatively, you can configure the project to use templates from a project that already has them installed.

1. In the **Service Connections** steps, select the environments for which you want to create a service connection.

    You can select multiple environments and create service connections for all of them at the same time. To use different app registrations for your environments, create a service connection for each app registration individually.

1. After you configure a service connection for an app registration, select **Add**.

1. After you've configured all the service connections, select **Next**.

1. In the **Generic Pipelines** step, select **Next** to create the pipelines and variable group and set the Azure DevOps permissions the project needs for ALM Accelerator functionality.

## Create an app user in your Dataverse environments

Create an application user in your environments to allow the pipelines to connect to Dataverse. Do this in each environment you plan to use the ALM Accelerator to deploy to.

1. Sign in to the [Power Platform admin center](https://aka.ms/ppac).

1. Select your development environment, and then select **Settings**.

1. Select **Users + permissions** > **Application users**.

1. Select **+ New app user**.

1. Select **+ Add an app**, select the app registration you created earlier, and then select **Add**.

1. Select the **Business Unit**.

1. Select the pencil icon to the right of **Security roles**, and then select security roles for the app user.

    We recommend you give the app user system administrator security role privileges, so the user can perform the required functions in each environment.

1. Select **Create**.

Repeat these steps in your validation, test, and production environments.

## Set up makers to use the ALM Accelerator app

- [Configure user permissions](setup-app-user-permissions.md) for a maker's account in Dataverse and Azure DevOps.

- [Configure deployment user settings](setup-deployment-user-settings.md) to set up the app's user experience and grant access to solutions and deployment profiles.

## Read more

- [ALM Accelerator for Power Platform](overview.md)
- [Configure deployment profiles](setup-deployment-user-profiles.md)
- [Configuration and data deployment in pipelines](setup-data-deployment-configuration.md)
- [Configure pipeline sync](setup-pipeline-sync.md)

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
