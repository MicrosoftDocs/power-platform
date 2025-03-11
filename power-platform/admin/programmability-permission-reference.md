---
title: Programmability and Extensibility - Permission reference
description: Overview of granular permissions available in Power Platform programmability tools
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 03/07/2025
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Permission reference

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]
This article provides an overview of the Power Platform API granular permissions.  These permissions will be initially available for registering client applications in Microsoft Entra and may become available in security role form in the future.

## Naming convention

Permissions in Power Platform API are  named in the following manner: `{namespace}.{resourceType}.{action}`, where:
* `namespace` is the logical grouping of resources and functionality
* `resourceType` is the specific resource type on which the permission is defined and must be unique across the resource type's namespace and
* `action` is named per the table below

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

Name | Display name | Description | 
---- | ------------ | ----------- |
`AiFlows.Ai.Execute` | Execute AI-related operations (like Generate) on AI flow | Allows you to execute AI-related operations (like Generate) on AI flows.
`AiFlows.Ai.Read` | AI-related read operations on AI flow | Allows you to do AI-related read operations on AI flows.
`AiFlows.Ai.Write` | AI-related write operations on AI flow | Allows you to do AI-related write operations on AI flows.
`AiFlows.Connections.Read` | Read AI Flow connection | Allows reading of AI flow connections.
`AiFlows.Runs.Execute` | Perform actions on AI flow run | Allows you to perform actions on AI flow runs.
`AiFlows.Runs.Read` | Read Copilot flow run | Allows reading AI flow runs.
`AiFlows.Runs.Write` | Write AI flow run | Allows writing AI flow runs.
`AiFlows.Workflows.Execute` | Perform actions (like activate) AI flow | Allows you to perform actions (like activate) on AI flows.
`AiFlows.Workflows.Read` | Read AI flow | Allows reading AI flows.
`AiFlows.Workflows.Write` | Write AI flow | Allows writing AI flows.
`AiTools.Prompt.Invoke` | Invoke AI prompts | Allows invoking of AI prompts.
`AiTools.Prompt.Read` | Read AI prompts | Allows reading of AI prompts.
`AiTools.Prompt.Write` | Read and write AI prompts | Allows reading and writing of AI prompts.
`Analytics.AdvisorActions.Execute` | Analytics.AdvisorActions.Execute | Allows user to execute advisor actions.
`Analytics.AdvisorRecommendations.Read` | Analytics.AdvisorRecommendations.Read | Allows uses to read advisor reccomendations.
`AppManagement.ApplicationPackages.Install` | Install application packages | Allows installing application packages.
`AppManagement.ApplicationPackages.Read` | Read application packages | Allows reading application packages.
`CopilotFlows.CloudFlows.ChatAssistant` | Cloud flows chat assistant | Allows cloud flows chat assistant.
`CopilotFlows.Connections.Read` | Read Copilot flow connection | Allows reading copilot flow connections.
`CopilotFlows.Runs.Cancel` | Cancel Copilot flow run | Allows cancelling Copilot flow runs.
`CopilotFlows.Runs.Create` | Create Copilot flow run | Allows creating Copilot flow runs.
`CopilotFlows.Runs.Read` | Read Copilot flow run | Allows reading Copilot flow runs.
`CopilotFlows.Runs.Resume` | Resume Copilot flow run | Allows resuming Copilot flow runs.
`CopilotFlows.Workflows.Activate` | Activate Copilot flows | Allows activating Copilot flows.
`CopilotFlows.Workflows.Generate` | Generate Copilot flow suggestion | Allows generating Copilot flow suggestions.
`CopilotFlows.Workflows.Read` | Read Copilot flow | Allows reading Copilot flows.
`CopilotStudio.Copilots.Invoke` | Allows invoking Copilots | Allows interacting with authenticated Copilots hosted by Copilot Studio.
`EnvironmentManagement.Environments.Read` | Read environments | Allows reading of environments.
`EnvironmentManagement.Groups.Read` | Read environment groups | Allows reading of environment groups.
`EnvironmentManagement.Groups.ReadWrite` | Read and write environment groups | Allows reading and writing of environment groups.
`EnvironmentManagement.Settings.Read` | Read environment management settings | Allows reading of environment management settings.
`EnvironmentManagement.Settings.ReadWrite` | Update environment management settings | Allows update of environment management settings.
`Licensing.Allocations.Read` | Read currency allocations | Allows reading of currency allocations.
`Licensing.Allocations.ReadWrite` | Read and write currency allocations | Allows reading and writing of currency allocations.
`Licensing.BillingPolicies.Read` | Read billing policies | Allows reading of billing policies.
`Licensing.BillingPolicies.ReadWrite` | Read and write billing policies | Read and write billing policies.
`Licensing.IsvContracts.Read` | Read ISV contracts | Allows reading of ISV contracts.
`Licensing.IsvContracts.ReadWrite` | Read and write ISV contracts | Allows reading and writing ISV contracts.
`PowerApps.Apps.Play` | Play Power Apps | Allows playing of Power Apps.
`PowerApps.Apps.Read` | Read Power App | Allows reading of Power Apps.
`PowerPages.Websites.Read` | Read Power Pages websites | Allows reading of Power Pages websites.
`PowerPages.Websites.Write` | Write Power Pages websites | Allows writing of Power Pages websites.
