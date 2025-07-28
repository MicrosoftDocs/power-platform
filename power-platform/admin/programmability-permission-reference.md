---
title: Programmability and Extensibility - Permission reference
description: Overview of granular permissions available in Power Platform programmability tools
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 07/28/2025
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Permission reference

This article provides an overview of the Power Platform API granular permissions. These permissions are initially available for registering client applications in Microsoft Entra and might become available in security role form in the future.

## Naming convention

Permissions in Power Platform API are named in the following manner: `{namespace}.{resourceType}.{action}`, where:

* `namespace` is the logical grouping of resources and functionality
* `resourceType` is the specific resource type on which the permission is defined and must be unique across the resource type's namespace, and
* `action` is named in the following table

  HTTP Method | Path Structure | Action Name(s)
  ----------- | -------------- | --------------
  GET or HEAD | Any            | Read
  DELETE      | Any            | Delete
  PATCH       | Any            | Update
  PUT         | Any            | Create and Update
  POST        | `/{namespace}/.../{resourceType}` | Create
  POST        | `/{namespace}/.../{resourceType}/{resourceId}/{action}` | `{action}`

## Defined permissions

The following table is a list of the currently defined permissions in Power Platform API:

Name | Display name | Description
---- | ------------ | -----------
`AiFlows.Ai.Execute` | Execute AI-related operations (like Generate) on AI flow | Allows you to execute AI-related operations (like Generate) on AI flows.
`AiFlows.Ai.Read` | AI-related read operations on AI flow | Allows you to do AI-related read operations on AI flows.
`AiFlows.Ai.Write` | AI-related write operations on AI flow | Allows you to do AI-related write operations on AI flows.
`AiFlows.Connections.Read` | Read AI Flow Connection | Allows reading of AI flow connections.
`AiFlows.Runs.Execute` | Perform actions on AI flow run | Allows performing actions on AI flow runs.
`AiFlows.Runs.Read` | Read Copilot Flow Run | Allows reading AI flow runs.
`AiFlows.Runs.Write` | Write AI Flow Run | Allows writing AI flow runs.
`AiFlows.Workflows.Execute` | Perform actions (like activate) AI flow | Allows to perform actions (like activate) AI flows.
`AiFlows.Workflows.Read` | Read AI flow | Allows reading AI flows.
`AiFlows.Workflows.Write` | Write AI flow | Allows writing AI flows.
`AiTools.Prompt.Invoke` | Invoke AI Prompts | Allows invoking of AI prompts.
`AiTools.Prompt.Read` | Read AI Prompts | Allows reading of AI prompts.
`AiTools.Prompt.Write` | Read and Write AI Prompts | Allows reading and writing of AI prompts.
`Analytics.AdvisorActions.Execute` | Analytics.AdvisorActions.Execute | Allows user to execute advisor actions.
`Analytics.AdvisorRecommendations.Read` | Analytics.AdvisorRecommendations.Read | Allows users to read advisor recommendations.
`AppManagement.ApplicationPackages.Install` | Install Application Packages | Allows installing application packages.
`AppManagement.ApplicationPackages.Read` | Read Application Packages | Allows reading application packages.
`Authorization.RoleAssignments.Read` | Power Platform role assignment reader | Allows reading Power Platform role assignments.
`Authorization.RoleAssignments.Write` | Power Platform role assignment writer | Allows assigning Power Platform role assignments.
`Connectivity.Connectors.Read` | Read Connectors | Allows reading connectors.
`Connectivity.Connections.Read` | Read Connections | Allows reading connections.
`CopilotFlows.ChatAssistant.Execute` | Call Cloud Flows chat assistant | Allows calling cloud flows chat assistant.
`CopilotFlows.CloudFlows.ChatAssistant` | Cloud Flows chat assistant | Allows cloud flows chat assistant.
`CopilotFlows.Workflows.Generate` | Generate Copilot Flow Suggestion | Allows generating copilot flow suggestions.
`CopilotGovernance.Features.Execute` | Perform actions related to copilot governance features | Permission required to perform actions related to copilot governance features.
`CopilotGovernance.Features.Read` | Read copilot governance features | Permission required to read copilot governance features.
`CopilotGovernance.Settings.Read` | Read copilot governance settings | Permission required to read copilot governance settings.
`CopilotGovernance.Settings.Write` | Write copilot governance settings | Permission required to write copilot governance settings.
`CopilotStudio.AdminActions.Invoke` | Allows admins to invoke administrative actions | Allow admins to invoke administrative actions on agents created in Microsoft Copilot Studio.
`CopilotStudio.Copilots.Invoke` | Allows Invoking Copilots | Allows interacting with authenticated copilots hosted by Copilot Studio.
`EnvironmentManagement.Environments.Read` | Read Environments | Allows reading of environments.
`EnvironmentManagement.Groups.Read` | Read Environment Groups | Allows reading of environment groups.
`EnvironmentManagement.Groups.ReadWrite` | Read and Write Environment Groups | Allows reading and writing of environment groups.
`EnvironmentManagement.Settings.Read` | Read Environment Management Settings | Allows reading of environment management settings.
`EnvironmentManagement.Settings.ReadWrite` | Update Environment Management Settings | Allows update of environment management settings.
`Licensing.Allocations.Read` | Read Currency Allocations | Allows reading currency allocations.
`Licensing.Allocations.ReadWrite` | Read and Write Currency Allocations | Allows reading and writing currency allocations.
`Licensing.BillingPolicies.Read` | Read Billing Policies | Allows reading billing policies.
`Licensing.BillingPolicies.ReadWrite` | Read and Write Billing Policies | Read and write billing policies.
`Licensing.IsvContracts.Read` | Read ISV Contracts | Allows reading ISV contracts.
`Licensing.IsvContracts.ReadWrite` | Read and Write ISV Contracts | Allows reading and writing ISV contracts.
`PowerApps.Apps.Play` | Play Power Apps | Allows playing Power Apps.
`PowerApps.Apps.Read` | Read Power App | Allows reading Power Apps.
`PowerAutomate.Flows.Read` | Read Power Automate Flows | Allows reading Power Automate flows.
`PowerAutomate.Flows.Write` | Write Power Automate Flows | Allows writing Power Automate flows.
`PowerPages.Websites.Read` | Read Power Pages Websites | Allows reading Power Pages websites.
`PowerPages.Websites.Write` | Write Power Pages Websites | Allows writing Power Pages websites.
