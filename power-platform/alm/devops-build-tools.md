---
title: "Microsoft Power Platform Build Tools for Azure DevOps | Microsoft Docs"
description: "Learn about the ALM-related tools, APIs, and services that are available to developers when using Azure DevOps."
keywords: 
author: mikkelsen2000
ms.subservice: alm
ms.author: pemikkel
ms.custom: ""
ms.date: 12/07/2022
ms.reviewer: "pehecke"

ms.topic: "article"
search.audienceType: 
  - developer
---

# Microsoft Power Platform Build Tools for Azure DevOps

Use Microsoft Power Platform Build Tools to automate common build and deployment tasks related
to apps built on Microsoft Power Platform. These tasks include: 

<ul><li>Synchronization of solution metadata (also known as
solutions) that contains the various platform components such as customer engagement apps (Dynamics 365 Sales, Customer Service, Field Service, Marketing, and Project Service Automation), canvas apps, model-driven apps, UI flows, virtual agents, AI Builder models, and connectors between development environments and source control</li></ul>
<ul><li>Generating build artifacts</li></ul>
<ul><li>Deploying to downstream environments</li></ul>

<ul><li>Provisioning or de-provisioning
environments</li></ul>

<ul><li>Perform static analysis checks against solutions by using the Power Apps checker service</li></ul>


Microsoft Power Platform Build Tools tasks can be used along with any other available
Azure DevOps tasks to compose your build and release pipelines. Pipelines
that teams commonly put in place include Initiate, Export from Dev, Build, and Release.

![ALM powered by Azure DevOps.](media/initiate-build-release.png "ALM powered by Azure DevOps")

> [!NOTE] 
> Microsoft Power Platform Build Tools are supported only for a Microsoft Dataverse environment with a database. More information: [Create an environment with a database](../admin/create-environment.md#create-an-environment-with-a-database)
> 
> Microsoft Power Platform Build Tools are now available for use in **GCC** and **GCC High** regions.

## What are Microsoft Power Platform Build Tools?

Microsoft Power Platform Build Tools are a collection of Power Platform&ndash;specific Azure DevOps
build tasks that eliminate the need to manually download custom tooling and
scripts to manage the application lifecycle of apps built on Microsoft Power Platform. The tasks can be used
individually to perform a task, such as importing a solution into a
downstream environment, or used together in a pipeline to orchestrate a
scenario such as "generate a build artifact", "deploy to test", or "harvest maker
changes." The build tasks can largely be categorized into four types:

- Helper

- Quality check

- Solution

- Environment management

For more information about the available tasks, see [Microsoft Power Platform Build Tools tasks](devops-build-tool-tasks.md). 


## What is Power Platform Build Tools version 2.0? 
In addition to what Power Platform Build Tools provide, version 2.0 of Power Platform Build Tools is Power Platform CLI based. 
Power Platform Build Tools version 1.0 , as in the first release, is based on PowerShell. Going forward Power Platform Build Tools 2.0 is the version that will be serviced and newer features added. 
For previous versions of Power Platform Build Tools, we will do critical security updates as needed. We would highly recommend that customers move to Power Platform Build Tools version 2.0 at their earliest.

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

To interact with the Microsoft Power Platform environment, a connection must be established that enables the various build tool tasks to perform the required actions. Two types of connections are available:

- Username/password: Configured as a generic service connection with username and password. Username/password doesn't support multi-factor authentication.
- Service principal and client secret: (recommended) This connection type uses service principal based authentication and supports multi-factor authentication.

## Configure service connections using a service principal

To configure a connection using service principal, you must first create an application registration in Azure Active Directory (AAD) with the required permissions and then create the associated Application User in the Microsoft Power Platform environment you want to connect to. We've offered a script to facilitate some of the steps required in the section below, while detailed information with manual step-by-step instructions are available in this article [Azure application registration](/powerapps/developer/common-data-service/use-single-tenant-server-server-authentication#azure-application-registration).

### Create service principal and client secret using PowerShell

This PowerShell script helps creating and configuring the service principal to be used with the Microsoft Power Platform Build Tools tasks. It first registers an Application object and corresponding Service Principal Name (SPN) in AAD.

This application is then added as an administrator user to the Microsoft Power Platform tenant itself.

**Installation**

Download the following PowerShell cmdlet: https://pabuildtools.blob.core.windows.net/spn-docs-4133a3fe/New-CrmServicePrincipal.ps1

<ul><li>Open a regular Windows PowerShell command prompt (standard, not PS core)
</li></ul> 
<ul><li>Navigate to the folder where you saved the script, and unblock the script using the following command: `Unblock-File New-CrmServicePrincipal.ps1`
</li></ul>
<ul><li>Run the script: `.\New-CrmServicePrincipal.ps1`</li></ul>

The script will prompt two times with AAD login dialogs:


<ul><li>First prompt: to log in as administrator to the AAD instance associated with the Microsoft Power Platform tenant
</li></ul> 
<ul><li>Second prompt: to log in as tenant administrator to the Microsoft Power Platform tenant itself
</li></ul>


Once successful, three columns are displayed:

<ul><li>Power Platform TenantId</li></ul>
<ul><li>Application ID</li></ul>
<ul><li>Client Secret (in clear text)</li></ul>

Use the information displayed to configure the Power Platform service connection. 

> [!IMPORTANT]
> Keep the client secret safe and secure. Once the PowerShell command prompt is cleared, you cannot retrieve the same client secret again.


### Configure environment with the Application ID
The Application ID must be added as an Application User in the Microsoft Power Platform environment you are connecting to. Information on how to add an application user is available in this article [Application user creation](/powerapps/developer/common-data-service/use-single-tenant-server-server-authentication#application-user-creation).

Ensure that the added Application User has the system administrator role assigned (available from “Manage Roles” in the security settings for the application user).

## Frequently asked questions (FAQs)

**Will my old Microsoft Power Platform Build Tool pipelines continue to work?**

*The older pipelines will continue to work, but newer features will not be added to the older tasks. If you want to exercise the newer features, then we would highly recommend that you change the version of your task in the pipeline.*

**Why did you base the new task on Power Platform CLI instead of PowerShell?**

*The Power Platform CLI tasks are multi-platform with great flexibility including running on linux runners. These are the same tasks that are available with Power Platform Actions for GitHub. You now have a consistent experience between Azure DevOps and GitHub.*

**Do the Microsoft Power Platform Build Tools only work for Power Apps?**  

*The build tools work for both canvas and model-driven apps, Power Virtual Agents, UI Flows and traditional flows, AI Builder, custom connectors and dataflows, all of which can now be added to a solution. This list also includes customer engagement apps (Dynamics 365 Sales, Customer Service, Field Service, Marketing, and Project Service Automation). Separate build tasks are available for Finance and Operations applications.*

**I had previously installed the preview of the Build Tools - can I upgrade from the preview of Power Apps Build Tools to Power Platform Build Tools?**

*You cannot upgrade from the preview version as we had to introduce some breaking changes in the Generally Available release. To move from the preview version, you have to install the Microsoft Power Platform Build Tools and either rebuild your pipelines, or reconfigure your existing pipelines to use the new Build Tools tasks. You must also create new Service connections as well.*

**Can I include flow and canvas apps?**

*Yes, flows and canvas apps are solution aware so if these components are added to your solution, they can participate in the lifecycle of your app.  However, some steps still require manual configurations. The need for manual configuration will be addressed later this year when we introduce environment variables and connectors. A list of current limitations are available here: [Known limitations](/powerapps/maker/common-data-service/use-solution-explorer#known-limitations).*

**How much do the Microsoft Power Platform Build Tools cost?**

*The build tools are available at no cost. However, a valid subscription to Azure DevOps is required to utilize the Build Tools. More information is available [Pricing for Azure DevOps](https://azure.microsoft.com/pricing/details/devops/azure-devops-services/).*

**I can see the extension, but why don’t I have an option to install it?**

*If you do not see the **install** option, then you most likely lack the necessary install privileges in your Azure DevOps organization. More info available [Manage extension permissions](/azure/devops/marketplace/how-to/grant-permissions?view=azure-devops).*

**How can developers use the results of the Checker task?**

*The output of the Checker task is a [Sarif file](https://sarifweb.azurewebsites.net/) and both VS Code and Visual Studio extensions are available for viewing and taking action on Sarif files.*

### See Also

[Build tool tasks](devops-build-tool-tasks.md)  
[Microsoft Power Platform Build Tools labs](https://github.com/microsoft/PowerApps-Samples/tree/master/build-tools)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
