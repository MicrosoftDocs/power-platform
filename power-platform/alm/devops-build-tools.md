---
title: "Microsoft Power Platform Build Tools for Azure DevOps | Microsoft Docs"
description: "Learn about the ALM-related tools, APIs, and services that are available to developers when using Azure DevOps."
keywords: 
author: devkeydet
ms.author: marcsc
ms.subservice: alm
ms.date: 10/07/2024
ms.reviewer: pehecke
ms.topic: article
search.audienceType: 
  - developer
---

# Microsoft Power Platform Build Tools for Azure DevOps

Use Microsoft Power Platform Build Tools to automate common build and deployment tasks related
to apps built on Microsoft Power Platform. These tasks include:

- Synchronizing solution metadata (also known as solutions) that contains the various platform components such as:
  - Customer engagement apps: Dynamics 365 Sales, Customer Service, Field Service, Marketing, and Project Service Automation
  - Canvas apps
  - Model-driven apps
  - UI flows
  - Agents
  - AI Builder models
  - Connectors between development environments and source control
- Generating build artifacts
- Deploying to downstream environments
- Provisioning or deprovisioning environments
- Performing static analysis checks against solutions by using the Power Apps checker service

Use Microsoft Power Platform Build Tools tasks with any other available
Azure DevOps tasks to compose your build and release pipelines. Pipelines
that teams commonly put in place include Initiate, Export from Dev, Build, and Release.

![ALM powered by Azure DevOps.](media/initiate-build-release.png "ALM powered by Azure DevOps")

> [!NOTE]
> Microsoft Power Platform Build Tools are supported only for a Microsoft Dataverse environment with a database. More information: [Create an environment with a database](../admin/create-environment.md#create-an-environment-with-a-database)
>
> Microsoft Power Platform Build Tools are now available for use in **GCC** and **GCC High** regions.

## What are Microsoft Power Platform Build Tools?

Microsoft Power Platform Build Tools are a collection of Power Platform specific Azure DevOps
build tasks that eliminate the need to manually download custom tooling and
scripts to manage the application lifecycle of apps built on Microsoft Power Platform.

You can use the tasks individually, such as importing a solution into a
downstream environment, or together in a pipeline to orchestrate a
scenario such as *generate a build artifact*, *deploy to test*, or *harvest maker
changes*. The build tasks can largely be categorized into four types:

- Helper
- Quality check
- Solution
- Environment management

For more information about the available tasks, see [Microsoft Power Platform Build Tools tasks](devops-build-tool-tasks.md).

## What is Power Platform Build Tools version 2.0?

In addition to what Power Platform Build Tools provide, version 2.0 of Power Platform Build Tools is Power Platform CLI based.

Power Platform Build Tools version 1.0 is based on PowerShell. Power Platform Build Tools 2.0 is the version that will be serviced and newer features added.

For previous versions of Power Platform Build Tools, we'll do critical security updates as needed. We would highly recommend that customers move to Power Platform Build Tools version 2.0 at their earliest.

> [!IMPORTANT]
> You cannot mix and match task versions for Power Platform Build Tools in your build pipeline.

## Get Microsoft Power Platform Build Tools

Microsoft Power Platform Build Tools can be installed into your Azure DevOps organization
from [Azure Marketplace](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools).

After installation, all tasks included in the Microsoft Power Platform Build Tools will be
available to add into any new or existing pipeline. You can find them by
searching for "Power Platform".

:::image type="content" source="media/get-build-tools.png" alt-text="Get the Microsoft Power Platform Build Tools":::

## Connection to environments

To interact with the Microsoft Power Platform environment, you must establish a connection so the build tool tasks can perform the required actions. Two types of connections are available:

|Connection type|Description|
|---------|---------|
|Service Principal via Workload Identity Federation (recommended)|Uses service principal based authentication via federated credentials.  Recommended for tenants which require multi-factor authentication.|
|Service principal and client secret|Uses service principal based authentication.|
|Username/password|A generic service connection with username and password. Does not support users requring multi-factor authentication.|

## Configure service connections using a service principal

To configure a connection using service principal, you must first have a Power Platform profile authenticated with the required permissions. You must add a Microsoft Entra ID application and associated application user to the Dataverse environment.

### Create service principal and client secret

Use the [pac admin create-service-principal](../developer/cli/reference/admin.md#pac-admin-create-service-principal) command to create and configure the service principal to be used with the Microsoft Power Platform Build Tools tasks.

This command first registers an Application object and corresponding Service Principal Name (SPN) in Microsoft Entra ID.
Then it adds the application as an administrator user to the Microsoft Power Platform tenant.

This command has two parameters:

|name|short name|Required|Description|
|---------|---------|---------|---------|
|`environment`|`env`|Yes|The ID or URL of the environment to add an application user to.|
|`role`|`r`|No|Name or ID of security role to be applied to application user. The default value is: 'System Administrator'. <p/><p/>Solution Checker requires a role with prvAppendmsdyn_analysisjob privilege to append to the msdyn_analysisjob table. The System Administrator role has this privilege by default.|

You can use it like this:

```powershell
C:\> pac admin create-service-principal  --environment <environment id>
```

<!-- Following example also in cli\reference\includes\admin-create-service-principal-remarks.md -->

When successful, four columns are displayed:

- Power Platform TenantId
- Application ID
- Client Secret (in clear text)
- Expiration

For example:

```powershell
PS C:\>pac admin create-service-principal --environment d3fcc479-0122-e7af-9965-bde57f69ee1d
Connected as admin@M365x57236726.onmicrosoft.com
Successfully assigned user adde6d52-9582-4932-a43a-beca5d182301 to environment d3fcc479-0122-e7af-9965-bde57f69eeld with security role System Administrator
Tenant ID                            Application ID                       Client Secret                           Expiration
2b0463ed-efd7-419d-927d-a9dca49d899c adde6d52-9582-4932-a43a-beca5d182301 beY8Q~JBZ~CBDgIKKBjbZ3g6BofKzoZkYj23Hbf 7/31/2024 4:27:03 PM
```

Use the information displayed to configure the Power Platform service connection.

> [!IMPORTANT]
> Keep the client secret safe and secure. Once the command prompt is cleared, you cannot retrieve the same client secret again.

### Configure environment with the Application ID

You must add the Application ID as an Application User in the Microsoft Power Platform environment you're connecting to. There are two ways you can do this.

- You can review this article:  [Application user creation](/power-apps/developer/data-platform/use-single-tenant-server-server-authentication#application-user-creation).
- You can use Power Platform CLI. For example:

```powershell
PS C:\>pac admin assign-user --user "adde6d52-9582-4932-a43a-beca5d182301" --role "System administrator" --environment d3fcc479-0122-e7af-9965-bde57f69ee1d --application-user
Connected to... SnDemoDev
Connected as admin@M365x57236726.onmicrosoft.com
Successfully assigned user adde6d52-9582-4932-a43a-beca5d182301 to environment d3fcc479-0122-e7af-9965-bde57f69ee1d with security role System Administrator
```

Ensure that the added Application User has the system administrator role assigned (available from "Manage Roles" in the security settings for the application user).

## Frequently asked questions (FAQs)

**Will my old Microsoft Power Platform Build Tool pipelines continue to work?**

*The older pipelines continue to work, but newer features won't be added to the older tasks. If you want to exercise the newer features, then we would highly recommend that you change the version of your task in the pipeline.*

**Why did you base the new task on Power Platform CLI instead of PowerShell?**

*The Power Platform CLI tasks are multi-platform with great flexibility including running on linux runners. These are the same tasks that are available with Power Platform Actions for GitHub. You now have a consistent experience between Azure DevOps and GitHub.*

**Do the Microsoft Power Platform Build Tools only work for Power Apps?**  

*The build tools work for both canvas and model-driven apps, Microsoft CoPilot Studio virtual agents, UI Flows and traditional flows, AI Builder, custom connectors and dataflows, all of which can now be added to a solution. This list also includes customer engagement apps (Dynamics 365 Sales, Customer Service, Field Service, Marketing, and Project Service Automation). Separate build tasks are available for Finance and Operations applications.*

**I had previously installed the preview of the Build Tools - can I upgrade from the preview of Power Apps Build Tools to Power Platform Build Tools?**

*You can't upgrade from the preview version as we had to introduce some breaking changes in the Generally Available release. To move from the preview version, you have to install the Microsoft Power Platform Build Tools and either rebuild your pipelines, or reconfigure your existing pipelines to use the new Build Tools tasks. You must also create new Service connections as well.*

**Can I include flow and canvas apps?**

*Yes, flows and canvas apps are solution aware so if these components are added to your solution, they can participate in the lifecycle of your app. However, some steps still require manual configurations. The need for manual configuration will be addressed later this year when we introduce environment variables and connectors. A list of current limitations are available here: [Known limitations](/powerapps/maker/common-data-service/use-solution-explorer#known-limitations).*

**How much do the Microsoft Power Platform Build Tools cost?**

*The build tools are available at no cost. However, a valid subscription to Azure DevOps is required to utilize the Build Tools. More information is available [Pricing for Azure DevOps](https://azure.microsoft.com/pricing/details/devops/azure-devops-services/).*

**I can see the extension, but why don't I have an option to install it?**

*If you don't see the **install** option, then you most likely lack the necessary install privileges in your Azure DevOps organization. More info available [Manage extension permissions](/azure/devops/marketplace/how-to/grant-permissions).*

**How can developers use the results of the Checker task?**

*The output of the Checker task is a [Sarif file](https://sarifweb.azurewebsites.net/) and both VS Code and Visual Studio extensions are available for viewing and taking action on Sarif files.*

### See Also

[Power Platform Build Tools for Azure DevOps release notes](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools#release-notes)<br/>
[Build tool tasks](devops-build-tool-tasks.md)<br/>
[Microsoft Power Platform Build Tools labs](https://github.com/microsoft/PowerApps-Samples/tree/master/build-tools)<br/>

[!INCLUDE[footer-include](../includes/footer-banner.md)]
