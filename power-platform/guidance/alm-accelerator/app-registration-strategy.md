---
title: App registration considerations
description: Learn about considerations to keep in mind and approaches you can take when you're designing app registrations for the ALM Accelerator for Power Platform.
ms.topic: concept-article
ms.date: 04/12/2023
ms.subservice: guidance-toolkit
author: jenschristianschroder
ms.author: jeschro
ms.reviewer: sericks
ms.custom: bap-template
---

# App registration considerations

The ALM Accelerator for Power Platform relies on Microsoft Entra app registrations to communicate with required services. This article discusses considerations you should keep in mind and approaches you can take when you design an app registration strategy for the ALM Accelerator.

## Required API permissions

You need to allow app registrations to use the relevant APIs for the ALM Accelerator to communicate with required services. Requirements for communication with these services depend on the functionality of the ALM Accelerator.

The following table shows what API permissions are required for the different functionalities of the ALM Accelerator.

| Functionality | API permission | Permission type | Description  |
|---------------|----------------|-----------------|--------------|
| CustomAzureDevOps custom connector | Azure DevOps - user_impersonation | Delegated | The ALM Accelerator canvas app needs Azure DevOps API permissions to communicate with Azure DevOps. |
| Deploy validation pipelines | Dynamics CRM - user_impersonation | Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| Deploy validation pipelines | Power Apps Advisor - Analysis.All | Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Apps Advisor service to run the solution checker task. |
| Deploy test pipelines | Dynamics CRM - user_impersonation | Delegated | The pipeline to deploy solutions to the test environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| Deploy production pipelines | Dynamics CRM - user_impersonation | Delegated | The pipeline to deploy solutions to the production environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| Export solution pipeline | Dynamics CRM - user_impersonation | Delegated | The pipeline to export solutions from the maker development environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| Import solution pipeline | Dynamics CRM - user_impersonation | Delegated | The pipeline to import solutions from Azure Git source control to the maker development environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| Delete solution pipeline | Dynamics CRM - user_impersonation | Delegated | The pipeline to delete solutions in the maker development environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |

## Considerations for an app registration strategy

When you design your strategy for creating and managing app registrations for the ALM Accelerator, you should consider both security and maintenance.

### Principle of least privilege

From a security perspective, consider the principle of least privilege. Any app registration should have the least privileges required to perform its necessary operations.

### Simplicity of maintenance

From a maintenance perspective, consider a strategy that requires you to do the least amount of work to maintain your app registrations and the services that use them. For example, one of the tasks of maintaining app registrations is secret rotation&mdash;revoking the current secret and creating a new one. Each service that uses an app registration needs to be reconfigured when a secret is rotated. The more app registrations you use, the more work you need to do to maintain them.

## Azure app registration strategies

Strategies for registering apps with Microsoft Entra ID use by the ALM Accelerator range from the very simple to the very granular.

### One app registration for everything

The simplest strategy is to create one app registration for all your needs. With this strategy, you use the same app registration for the CustomAzureDevOps custom connector and all Azure DevOps Service connections you need to access your Power Platform environments.

Although this strategy is the easiest to manage, it violates the principle of least privilege. One app registration has permissions to perform all required operations through the custom connector and all Azure DevOps Service connections you've configured.

| App registration | API permission and type | Description |
|------------------|-------------------------|-------------|
| Single app registration for all purposes | Azure DevOps - user_impersonation - Delegated | The ALM Accelerator canvas app needs Azure DevOps API permissions to communicate with Azure DevOps. |
| Single app registration for all purposes | Dynamics CRM - user_impersonation - Delegated | The pipeline to export solutions from maker development environments and deploy solutions to the validation, test, and production environments needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| Single app registration for all purposes | Power Apps Advisor - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Apps Advisor service to run the solution checker task. |

### One app registration for Azure DevOps and one for Power Platform

A more granular strategy is to create one app registration for the CustomAzureDevOps custom connector and one for the pipelines to communicate with Power Platform environments.

This strategy aligns better with the principle of least privilege. Only the app registration that's used for the CustomAzureDevOps custom connector can access the Azure DevOps API, and only the app registration that's used to connect to Power Platform can use the Power Platform (Dynamics CRM) API.

| App registration | API permission and type | Description |
|------------------|-------------------------|-------------|
| App registration for Azure DevOps | Azure DevOps - user_impersonation - Delegated | The ALM Accelerator canvas app needs Azure DevOps API permissions to communicate with Azure DevOps. |
| App registration for Power Platform | Dynamics CRM - user_impersonation - Delegated | The pipeline to export solutions from maker development environments and deploy solutions to the validation environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| App registration for Power Platform | Power Apps Advisor - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Apps Advisor service to run the solution checker task. |

### One app registration for Azure DevOps and several for Power Platform

An even more granular strategy is to create app registrations for accessing different Power Platform environments. You might create one app registration for each environment you need to access using the ALM Accelerator pipelines. Or, create one app registration for each Power Platform project that you support using the ALM Accelerator.

This strategy aligns closely with the principle of least privilege. However, you should also consider maintenance. Make sure to maintain a structured way to identify which app registration is used for each environment. This information will come in handy when you rotate the app registration secrets.

The following table shows how you can create app registrations for each Power Platform project to restrict access to only the relevant environment.

| App registration | Power Platform scope | API permission and type | Description |
|------------------|----------------------|-------------------------|-------------|
| App registration for Azure DevOps | Not applicable | Azure DevOps - user_impersonation - Delegated | The ALM Accelerator canvas app needs Azure DevOps API permissions to communicate with Azure DevOps. |
| App registration for Power Platform | Platform Project 1 | Dynamics CRM - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| App registration for Power Platform | Project 1 | Power Apps Advisor - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Apps Advisor service to run the solution checker task. |
| App registration for Power Platform | Project 2 | Dynamics CRM - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| App registration for Power Platform | Project 2 | Power Apps Advisor - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Apps Advisor service to run the solution checker task. |
| App registration for Power Platform | Maker development environment 1 | Dynamics CRM - user_impersonation - Delegated | The pipeline to export solutions from the maker development environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| App registration for Power Platform | Maker development environment 2 | Dynamics CRM - user_impersonation - Delegated | The pipeline to export solutions from the maker development environment needs permissions to use the Power Platform (Dynamics CRM) API to do solution operations |

The following table shows how you can further align with the principle of least privilege by creating app registrations for each Power Platform environment.

| App registration | Power Platform scope  | API permission and type | Description |
|------------------|-----------------------|-------------------------|-------------|
| App registration for Azure DevOps | Not applicable | Azure DevOps - user_impersonation - Delegated | The ALM Accelerator canvas app needs Azure DevOps API permissions to communicate with Azure DevOps. |
| App registration for Power Platform | Project 1 - Validation Environment | Dynamics CRM - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| App registration for Power Platform | Project 1 - Validation Environment | Power Apps Advisor - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Apps Advisor service to run the solution checker task. |
| App registration for Power Platform | Project 1 - Test Environment | Power Apps Advisor - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Apps Advisor service to run the solution checker task. |
| App registration for Power Platform | Project 1 - Production Environment | Dynamics CRM - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| App registration for Power Platform  | Project 2 - Validation Environment | Dynamics CRM - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| App registration for Power Platform | Project 2 - Validation Environment | Power Apps Advisor - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Apps Advisor service to run the solution checker task. |
| App registration for Power Platform | Project 2 - Test Environment | Power Apps Advisor - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Apps Advisor service to run the solution checker task. |
| App registration for Power Platform | Project 2 - Production Environment | Dynamics CRM - user_impersonation - Delegated | The pipeline to deploy solutions to the validation environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| App registration for Power Platform | Maker development environment 1 | Dynamics CRM - user_impersonation - Delegated | The pipeline to export solutions from the maker development environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |
| App registration for Power Platform | Maker development environment 2 | Dynamics CRM - user_impersonation - Delegated | The pipeline to export solutions from the maker development environment needs permissions to use the Power Platform (Dynamics CRM) API to perform solution operations. |

## Next steps

> [!div class="nextstepaction"]
> [Pipelines deployment settings](./deployment-settings-payload.md)

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
