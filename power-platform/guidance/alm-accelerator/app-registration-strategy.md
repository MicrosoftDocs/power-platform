---
title: "ALM Accelerator App Registrations - considerations when designing your Azure App Registration strategy | MicrosoftDocs"
description: "The ALM accelerator for Microsoft Power Platform relies on Azure App Registrations to communicate with required services such as Azure DevOps, Power Platform and Power Apps Advisor service. This document gives an overview of different approaches to designing your App Registrations for ALM Accelerator."
author: jenschristianschroder
ms.topic: conceptual
ms.date: 04/12/2023
ms.subservice: guidance
ms.author: jeschro
ms.reviewer: sericks
---
# ALM Accelerator App Registrations

The ALM Accelerator for Microsoft Power Platform relies on Azure App Registrations to communicate with required services such as Azure DevOps, Power Platform and Power Apps Advisor service. This document gives an overview of different approaches to designing your App Registrations for ALM Accelerator.

## Required API Permissions for Azure App Registrations

In order for ALM Accelerator to be able to communicate with the required services, you need to configure the App Registration to be allowed to use the relevant APIs.

Requirements for communication to these services depend on the functionality of the ALM Accelerator.

### Canvas App communication with Azure DevOps

When you use the ALM Accelerator Canvas App to trigger an Azure DevOps pipeline, or to create a Pull Request in Azure DevOps Git repositories, these operations are executed via the CustomAzureDevOps custom connector. In order for the CustomAzureDevOps custom connector to communicate with Azure DevOps, the Azure App Registration used to configure the OAuth security settings in the custom connector must have the required permissions to communicate with the Azure DevOps Rest API.

### Azure DevOps pipeline communication with Power Platform

When an Azure DevOps pipeline is running operations in a Power Platform environment, it will use an Azure DevOps Service Connection to connect to the relevant environment. The Azure DevOps Service connection is configured with details about the Azure App Registration to use when connecting to Power Platform, and, in the relevant Power Platform environment the Azure App Registration will be registered as an [Application User](/power-apps/developer/data-platform/use-single-tenant-server-server-authentication#application-user-creation). This allows the Azure DevOps pipeline to communicate with the relevant Power Platform environment in the context of the Azure App Registration.

### API permissions overview

The following table shows what API permissions that are required for the different functionalities of ALM Accelerator

| Functionality         | API Permissions   | Permission type   | Description       |
|-------------------|-------------------|-------------------|-------------------|
| CustomAzureDevOps custom connector     | Azure DevOps - user_impersonation   | Delegated       | The Azure DevOps API permissions are required in order for the ALM Accelerator Canvas App to communicate with Azure DevOps |
| Deploy Validation pipelines     | Dynamics CRM - user_impersonation   | Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| Deploy Validation pipelines     | PowerApps-Advisor - Analysis.All   | Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the PowerApps Advisor service to run the Solution Checker task |
| Deploy Test pipelines     | Dynamics CRM - user_impersonation   | Delegated       | The Azure DevOps pipeline to deploy solutions to the Test environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| Deploy Prod pipelines     | Dynamics CRM - user_impersonation   | Delegated       | The Azure DevOps pipeline to deploy solutions to the Prod environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| Export solution pipeline     | Dynamics CRM - user_impersonation   | Delegated       | The Azure DevOps pipeline to export solutions from the Maker development environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| Import solution pipeline     | Dynamics CRM - user_impersonation   | Delegated       | The Azure DevOps pipeline to import solutions from Azure Git source control to the Maker development environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| Delete solution pipeline     | Dynamics CRM - user_impersonation   | Delegated       | The Azure DevOps pipeline to delete solutions in the Maker development environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |

## Considerations when designing your Azure App Registration strategy

When designing your strategy for creating and managing Azure App Registrations for ALM Accelerator, you should consider both the security aspect and the maintenance aspect.

### Simplicity of maintenance

From a maintenance perspective, you'll want to have to do the least amount of work to maintain your Azure App Registrations and those services that use them. One of the tasks relating to maintaining Azure App Registrations is secret rotation, meaning revoking the current secret and creating a new secret. You should consider that for each service where you use the Azure App Registration you need to reconfigure when a secret is rotated.
This perspective means the more App Registrations you use the more work is required.

### Principle of least privilege

From a security perspective, you'll want to consider the principle of least privilege. This means any Azure App Registration should have the least privileges required to perform its necessary operations.

## Different scenarios for configuring Azure App Registrations for ALM Accelerator

### One Azure App Registration

The absolute simplest strategy for creating your Azure App Registrations for ALM Accelerator is to create one Azure App Registration for all your needs.
This strategy means you use the same Azure App Registration for the ALM Accelerator CustomAzureDevOps custom connector and all Azure DevOps service connections you need to access your power platform environments.
While this will give you the least management, it will also violate the principle of least privilege, as you'll have one Azure App Registration with permissions to do all required operations via the custom connector, and all Azure Service Connections you've configured.

| App Registration         | API Permissions and type | Description       |
|-------------------|-------------------|-------------------|
| Single App Registration for all purposes     | Azure DevOps - user_impersonation - Delegated       | The Azure DevOps API permissions are required in order for the ALM Accelerator Canvas App to communicate with Azure DevOps |
| Single App Registration for all purposes     | Dynamics CRM - user_impersonation - Delegated       | The Azure DevOps pipeline to export solutions from Maker development environments and deploy solutions to the Validation, Test and Production environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| Single App Registration for all purposes     | PowerApps Advisor - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the PowerApps Advisor service to run the Solution Checker task |

### One Azure App Registration for accessing Azure DevOps and one Azure App Registration accessing Power Platform

A more granular configuration of Azure App Registration for ALM Accelerator is to have one Azure App Registration for the CustomAzureDevOps custom connector and one for the Azure Pipelines to communicate with Power Platform environments.
With this configuration, you'll have better alignment with the principle of least privilege. In this configuration, only the Azure App Registration used for the CustomAzureDevOps custom connector 's access to access the Azure DevOps API and only the App Registrations used to connect to Power Platform will be allowed to use the Power Platform (Dynamics CRM) API.

| App Registration         | API Permissions and type | Description       |
|-------------------|-------------------|-------------------|
| App Registration for Azure DevOps     | Azure DevOps - user_impersonation - Delegated       | The Azure DevOps API permissions are required in order for the ALM Accelerator Canvas App to communicate with Azure DevOps |
| App Registration for Power Platform     | Dynamics CRM - user_impersonation - Delegated       | The Azure DevOps pipeline to export solutions from Maker development environments and deploy solutions to the Validation environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| App Registration for Power Platform     | PowerApps Advisor - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the PowerApps Advisor service to run the Solution Checker task |

### One App Registration for accessing Azure DevOps and several Azure App Registrations for accessing Power Platform

Even more granular configuration, with close alignment to the principle of least privilege, would be to narrow the scope of Azure App Registrations that have access to Power Platform. You can do this by creating Azure App Registrations for accessing different Power Platform environments. This approach can be as granular as having one Azure App Registration per environment you'll need to access via the ALM Accelerator Azure DevOps pipelines. Or, one Azure App Registration per Power Platform project that you support via the ALM Accelerator.
With this configuration, you should also consider the maintenance task and ensure that you maintain a structured way of identifying which Azure App Registration is used for which environment. This will come in handy when you'll be rotating the Azure App Registration secrets.

The following table shows how you can create Azure App Registrations per Power Platform project to restrict Azure App Registrations to only have access to the relevant Power Platform environment.

| App Registration         | Power Platform Scope        | API Permissions and type | Description       |
|-------------------|-------------------|-------------------|-------------------|
| App Registration for Azure DevOps     | Not applicable     | Azure DevOps - user_impersonation - Delegated       | The Azure DevOps API permissions are required in order for the ALM Accelerator Canvas App to communicate with Azure DevOps |
| App Registration for Power | Platform Project 1    | Dynamics CRM - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| App Registration for Power Platform | Project 1 | PowerApps Advisor - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the PowerApps Advisor service to run the Solution Checker task |
| App Registration for Power Platform | Project 2    | Dynamics CRM - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| App Registration for Power Platform | Project 2 | PowerApps Advisor - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the PowerApps Advisor service to run the Solution Checker task |
| App Registration for Power Platform | Maker development environment 1 | Dynamics CRM - user_impersonation - Delegated       | The Azure DevOps pipeline to export solutions from the Maker development environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| App Registration for Power Platform | Maker development environment 2 | Dynamics CRM - user_impersonation - Delegated       | The Azure DevOps pipeline to export solutions from the Maker development environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |

The following table shows how you can further align with the principle of least privilege by creating Azure App Registrations for each Power Platform environment

| App Registration         | Power Platform Scope         | API Permissions and type | Description       |
|-------------------|-------------------|-------------------|-------------------|
| App Registration for Azure DevOps     | Not applicable     | Azure DevOps - user_impersonation - Delegated       | The Azure DevOps API permissions are required in order for the ALM Accelerator Canvas App to communicate with Azure DevOps |
| App Registration for Power Platform | Project 1 - Validation Environment    | Dynamics CRM - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| App Registration for Power Platform | Project 1 - Validation Environment | PowerApps Advisor - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the PowerApps Advisor service to run the Solution Checker task |
| App Registration for Power Platform | Project 1 - Test Environment | PowerApps Advisor - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the PowerApps Advisor service to run the Solution Checker task |
| App Registration for Power Platform | Project 1 - Production Environment    | Dynamics CRM - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| App Registration for Power Platform  | Project 2 - Validation Environment    | Dynamics CRM - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| App Registration for Power Platform | Project 2 - Validation Environment | PowerApps Advisor - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the PowerApps Advisor service to run the Solution Checker task |
| App Registration for Power Platform | Project 2 -Test Environment | PowerApps Advisor - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the PowerApps Advisor service to run the Solution Checker task |
| App Registration for Power Platform | Project 2 - Production Environment    | Dynamics CRM - user_impersonation - Delegated       | The Azure DevOps pipeline to deploy solutions to the Validation environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| App Registration for Power Platform | Maker development environment 1 | Dynamics CRM - user_impersonation - Delegated       | The Azure DevOps pipeline to export solutions from the Maker development environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |
| App Registration for Power Platform | Maker development environment 2 | Dynamics CRM - user_impersonation - Delegated       | The Azure DevOps pipeline to export solutions from the Maker development environment needs to have permissions to use the Power Platform (Dynamics CRM) API to do solution operations |

## Next steps

> [!div class="nextstepaction"]
> [Pipelines deployment settings](./deployment-settings-payload.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
