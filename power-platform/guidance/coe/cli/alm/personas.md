---
title: "CoE ALM Accelerator for Power Platform personas (Deprecated)"
description: "Overview of the personas related to Center of Excellence (CoE) Command Line Interface (CLI) Application Lifecycle Management (ALM) Accelerator commands"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
ms.custom: ""
ms.date: 09/26/2024

ms.topic: concept-article
ms.reviewer: sericks
search.audienceType: 
  - admin
---


# CoE ALM Accelerator for Power Platform personas (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

Understanding the roles that different personas play in ALM Accelerator for Power Platform is important in helping you plan for and implement an application lifecycle management (ALM) deployment in your organization.

## Persona descriptions

### Business users

Business users represent the users of the created solutions. These users don't use the ALM Accelerator tools directly but they can see the shared applications. Business users may report version number of the application to the support team.

### Maker

Makers want to use components or services produced by an advanced maker or professional developer. Uses off the shelf components and documentation. Not directly exposed to the application lifecycle as this process is abstracted away. Creates and shares the application with business users.

### Advanced maker

Collaborates with professional development and information technology (IT) teams to integrate and build applications. Assumed to be familiar with concepts like ALM, DevOps, branching, and merging. Works in a development environment and pushes changes into validation, testing, and production environments. Uses managed AA4PP canvas management application and Azure DevOps website.

### Professional developer

Advanced maker knowledge plus the ability to use lower-level development programming languages and SDKs to create components and services. For example, JavaScript and PCF controls, MicrosoftM Dataverse plugins in C#. Might also include Azure services and APIs, such as Azure Functions and API management. Professional developers are likely to work in tools like Visual Studio Code.

### Data analyst

Develop data models, create, manage data services, and post data collection analysis and reporting. For example, using Power BI reporting and Azure Data Lake. For data elements that are covered in the solution system, for example, Dataverse modeling, AI Models. Items not covered today in solution system, like Power BI, will have a separate ALM process.

### Operations teams

Deploys solutions to environments across Power Platform and Microsoft cloud services, such as Azure. Distribute solutions into Power Platform and run Azure Resource Manager templates in Azure. Operations teams won't use the CLI commands directly. However, they might use managed canvas applications and Azure Pipelines to view the status or promote applications from test to production.

### Support teams

Post application deployment look at the version of the applications deployed, and triage issues. Might use managed canvas applications to view deployed solution versions.

### Information security team

Compares against organization standards for data loss prevention (DLP), authentication and authorization, service principals, teams, and security. Reviews the ALM process against threat models, risks, and mitigation.

### Architecture team

Reviews the entire ALM process and components and verifies it matches with the solution methodology and architecture.

### Administrators

#### Power Platform administrator

Using Power Platform administrator rights allocated to manage environments (create, update, delete).

```bash
coe alm generate install -o quickstart.json
coe alm install -f quickstart.json
```

If you're prompted to create an HTTP with Microsoft Entra ID connection, enter 'https://graph.microsoft.com' for both the **Base Resource URL** and **Azure AD Resource URI**.

More information: [CoE ALM generate install](https://aka.ms/coe-cli/help/alm/generate/install)

More information: [CoE ALM install](https://aka.ms/coe-cli/help/alm/install)

#### Power Platform environment administrator

Manages one or more Power Platform environments. Common tasks include, solution import, add users, and assign roles.

```bash
coe alm generate install -o data.json
coe alm install \
  -c environment \
  -e https://contoso-maker.crm.dynamics.com
```

More information: [generate install](https://aka.ms/coe-cli/help/alm/generate/install)

More information: [install](https://aka.ms/coe-cli/help/alm/install)

Add makers to an environment (assuming they also have Azure DevOps administrator rights).

```bash
coe alm maker add \
  -e https://user-Dev.crm.dynamics.com \
  -o https://dev.azure.com/dev12345 \
  -p alm-sandbox \
  -u user@contoso.com
```

More information: [maker add](https://aka.ms/coe-cli/help/alm/maker/add)

#### Azure tenant administrator

Manages the Microsoft Entra tenant. Common tasks include create users, groups,  applications, and service principals (Microsoft 365 or Azure administrators).

```bash
coe alm install -c aad
```

More information: [install](https://aka.ms/coe-cli/help/alm/install)

#### Azure DevOps project administrators

```bash
coe alm install -c devops \
  -o https://dev.azure.com/dev12345 \
  -p alm-sandbox
```

## Persona command mapping

This section provides a brief overview of each CoE command.

### alm branch

|Outcome|Frequency|Persona|Components|
|-------|---------|-------|----------|
|Create a solution branch in Azure DevOps|Run per new solution|Makers, professional developers|Azure DevOps|

[Read ALM branch help](https://aka.ms/coe-cli/help/alm/branch)

### alm user add

|Outcome|Frequency|Persona|Components|
|-------|---------|-------|----------|
|Add application user to the development environment|Run once per environment|Makers, professional developers|Dataverse|

[Read ALM user add help](https://aka.ms/coe-cli/help/alm/user/add)

### alm maker add

|Outcome|Frequency|Persona|Components|
|-------|---------|-------|----------|
|Create a service connection and add maker to security group|Run once per maker|User who is owner of Microsoft Entra Group and Azure DevOps project administrator|Azure DevOps|

[Read ALM maker add help](https://aka.ms/coe-cli/help/alm/maker/add)

### alm install

|Outcome|Frequency|Persona|Components|
|-------|---------|-------|----------|
|Import managed solution and set up security|Run once per organization|Microsoft Entra Group, Azure DevOps and Power Platform administrator|Azure Active directory, Azure DevOps, Power Platform|

[Read ALM install help](https://github.com/microsoft/coe-starter-kit/blob/main/coe-cli/docs/help/alm/install.md)

## Solution set-up

Assuming that AA4PP has been set up and installed, the first command that the advanced maker will run is the **coe alm user add** command. The user add command registers an application user created during install as a system administrator in their development environment to integrate with the solution. For example, using the default parameters.

```bash
coe alm user add \
  -e https://contoso-alans-dev.crm.dynamics.com
```

Read more on the [CoE ALM user add](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/user/add.md)

The **coe alm branch** command runs each time a new solution is created. The branch command allows a new solution branch to be created in Azure DevOps. This new branch is created with the associated ALM DevOps pipeline to validate pull requests and push changes to test and production environments.

```bash
coe alm branch \
  -o https://dev.azure.com/contoso \
  -p alm-sandbox \
  -d MySolution
```

More information: [branch](https://aka.ms/coe-cli/help/alm/branch)

## Administrator set-up

Each development environment used by makers needs to be registered with Azure DevOps and granted rights to the Microsoft Entra application.

```bash
coe alm maker add \
  -o https://dev.azure.com/contoso \
  -p alm-sandbox \
  -e https://contoso-userdev.crm.dynamics.com \
  -a ALMAcceleratorServicePrincipal \
  -g ALMAcceleratorForMakers \
  -u alan-s@contoso.com
```

> [!NOTE]
> The user running this command requires project administrator rights in Azure DevOps and owner rights of the Microsoft Entra application.

More information: [maker add](https://aka.ms/coe-cli/help/alm/maker/add)

Each Azure DevOps project will also require connections to deployment environments used by Azure Pipelines.

```bash
coe alm connection add \
  -o https://dev.azure.com/contoso \
  -p alm-sandbox \
  -e https://contoso-build.crm.dynamics.com \
  -a ALMAcceleratorServicePrincipal

coe alm connection add \
  -o https://dev.azure.com/contoso \
  -p alm-sandbox \
  -e https://contoso-test.crm.dynamics.com \
  -a ALMAcceleratorServicePrincipal

coe alm connection add \
  -o https://dev.azure.com/contoso \
  -p alm-sandbox \
  -e https://contoso-prod.crm.dynamics.com \
  -a ALMAcceleratorServicePrincipal
```

More information: [connection add](https://aka.ms/coe-cli/help/alm/connection/add)

## Install

To deploy an instance of AA4PP in your organization, the **generate install** and **install** commands are used once to deploy the managed solution. The install automates these key elements:

1. Microsoft Entra ID
    - New Microsoft Entra application used by Azure DevOps for service connection access to Power Platform.
    - New Microsoft Entra group to provide access to Azure DevOps resources and share the maker canvas application.
1. Azure DevOps resources
    - Import Azure Pipelines.
    - Create variable groups.
    - Create service connections to Power Platform environments.
1. Power Platform environments
    - Set up application users.
    - Import managed solution and set up security.

```bash
coe alm generate install -o install.json
coe alm install -f install.json
```

More information: [generate install](https://aka.ms/coe-cli/help/alm/generate/install)

More information: [install](https://aka.ms/coe-cli/help/alm/install)

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
