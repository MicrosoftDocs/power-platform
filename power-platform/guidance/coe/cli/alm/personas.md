---
title: "Center of Excellence (CoE) Command Line Interface (CLI) Application Lifecycle Management (ALM) Accelerator Personas"
description: "Overview of the personas related to Center of Excellence (CoE) Command Line Interface (CLI) Application Lifecycle Management (ALM) Accelerator commands"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 11/30/2021
ms.service: power-platform
ms.topic: "article"
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---


# Personas

Understanding the roles that different personas play in ALM Accelerator for Power Platform (AA4PP) is important in helping you plan for and implement a ALM deployment in your organization.

## Persona Description

### Business Users

Licensed internal users of the created solutions. Will not directly use the AA4PP tools they will be able to see the shared applications. May report version number of application to the support team.

### Maker

Wants to use components or services produced by an advanced maker or professional developer. Uses off the shelf components and documentation. Not directly exposed to the Application Lifecycle as this process is abstracted away. Create and Share the Application with Business Users.

### Advanced Maker

Collaborates with Professional Development and Information Technology (IT) teams to integrate and build applications. Assumed to be familiar with concepts like Application Lifecycle Management (ALM), DevOps, Branching and Merging. Works in Development environment and push changes into validation and testing and production environments. Uses managed AA4PP Canvas management application and Azure DevOps website.

### Professional Developer

Advanced maker knowledge plus the ability to use lower level development programing languages and SDKs to create components and services. For example JavaScript and PCF controls, Dataverse Plugins in C#, Azure Services and APIs for example Azure Functions, API Management. Likely to work in tools like Visual Studio Code.

### Data Analyst

Develop data model, Create and manage data services and post data collection analysis / reporting. For example Power BI reporting, Datalake. For data elements that are covered in the SOlution system for example, Dataverse Modeling, AI Models. Items not covered today in solution system like Power BI will have separate ALM process.

### Operations Teams

Deploy solution to environments across Power Platform and Microsoft Cloud Services (For example Azure). Distribute solutions into Power Platform and run Azure Resource Manager templates in Azure. Will not use the CLI commands directly. May use managed canvas application to view and Azure DevOps Pipelines to view the status or promote applications from test to production.

### Support Teams

Post application deployment look at version of applications deployed, triage issues. May use managed canvas application to view deployed solution versions.

### Information Security Team

Will compare against organization standards for Data Loss Prevention (DLP), Authentication and Authorization, Service Principals, Teams and Security. Review the ALM process against Threat models, risks and mitigations.

### Architecture Team

Review the entire ALM process and components and verify matches solution methodology and architecture

### Administrators

#### Power Platform Tenant Administrator

Global right to Power Platform Administration - Manage Environments (Create, Update, Delete). Common commands

```bash
coe alm generate install -o quickstart.json
coe alm install -f quickstart.json
```

More information on the [coe alm generate install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/generate/install.md) command

More information on the [coe alm install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) command

#### Power Platform Environment Administrator

Manage One or more Power Platform Environments - Import solution, add users assign roles

```bash
coe alm generate install -o data.json
coe alm install \
  -c environment \
  -e https://contoso-maker.crm.dynamics.com
```

More information on the [coe alm generate install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/generate/install.md) command

More information on the [coe alm install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) command

Add makers to an environment (Assuming they also have Azure DevOps Administrator rights)

```bash
coe alm maker add \
  -e https://user-Dev.crm.dynamics.com \
  -o https://dev.azure.com/dev12345 \
  -p alm-sandbox \
  -u user@contoso.com
```

More information on the [coe alm maker add](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/maker/add.md) command

#### Azure Tenant Administrator

Manage the AAD Tenant - Create User, Groups,  Applications and Service Principals (O365 or Azure Administrators). Common commands

```bash
coe alm install -c aad
```

More information on the [coe alm install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) command

#### Azure DevOps Project Administrators

```bash
coe alm install -c devops \
  -o https://dev.azure.com/dev12345 \
  -p alm-sandbox
``` 

More information on the [coe alm install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) command

## Persona Command Mapping

![Common Commands](../media/alm-command-summary.png)

## Solution Setup

Assuming that AA4PP has been setup and installed, the first command that the Advanced Maker will run is the **coe alm user add** command. This command will register an Application User created during install as a System administrator in their development environment to integrate with the solution. For example using the default parameters

```bash
coe alm user add \
  -e https://contoso-alans-dev.crm.dynamics.com
```

Read more on the [coe alm user add](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/user/add.md)

The **coe alm branch** command will be run each time a new solution is created. The branch command allows a new solution branch to be created in Azure DevOps. This new branch will be created with the associated ALM DevOps pipeline to validate pull requests and push changes to test and production environments.

```bash
coe alm branch \
  -o https://dev.azure.com/contoso \
  -p alm-sandbox \
  -d MySolution
```

More information on the [coe alm branch](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/branch.md) command

## Administrator Setup

As each Advanced Maker or Professional Developer creates a development environment, it will need to be registered with Azure DevOps and the Azure Active Directory Application. The user running this command requires Project Administrator rights in Azure DevOps and Owner rights of the Azure Active Directory Application.

```bash
coe alm maker add \
  -o https://dev.azure.com/contoso \
  -p alm-sandbox \
  -e https://contoso-userdev.crm.dynamics.com \
  -a alm-ado-service-principal \
  -g alm-makers \
  -u alan-s@contoso.com
```

More information on the [coe alm maker add](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/maker/add.md) command

Each Azure DevOps project will also require connections to deployment environments used by Azure DevOps Pipelines

```bash
coe alm connection add \
  -o https://dev.azure.com/contoso \
  -p alm-sandbox \
  -e https://contoso-build.crm.dynamics.com \
  -a alm-ado-service-principal

coe alm connection add \
  -o https://dev.azure.com/contoso \
  -p alm-sandbox \
  -e https://contoso-test.crm.dynamics.com \
  -a alm-ado-service-principal

coe alm connection add \
  -o https://dev.azure.com/contoso \
  -p alm-sandbox \
  -e https://contoso-prod.crm.dynamics.com \
  -a alm-ado-service-principal
```

More information on the [coe alm connection add](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/connection/add.md) command

## Install

To deploy an instance of AA4PP in your organization the **coe alm generate install** and **coe alm install** commands are used once to deploy the Managed solution. The install will automate key elements:

1. Azure Active Directory
    - New Azure Active directory Application that will be used by Azure DevOps for Service Connections and Access to Power Platform Environment
    - New Azure Active Directory Group to provide access to Azure DevOps resources and Share the Maker Canvas application
1. Azure DevOps resources
    - Import Azure DevOps Pipelines
    - Variable Groups
    - Create Service Connections to Power Platform Environments
1. Power Platform Environments
    - Setup Application Users
    - Import Managed Solution and Setup Security

```bash
coe alm generate install -o install.json
coe alm install -f install.json
```

More information on the [coe alm generate install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/generate/install.md) command

More information on the [coe alm install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) command