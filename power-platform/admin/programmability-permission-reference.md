---
title: Programmability and Extensibility - Permission reference
description: Overview of granular permissions available in Power Platform programmability tools
author: laneswenka
ms.reviewer: sericks

ms.component: pa-admin
ms.topic: reference
ms.date: 03/03/2025
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Permission reference
This article provides an overview of the Power Platform API granular permissions. These permissions are initially available for registering client applications in Microsoft Entra and may become available in security roles in the future.

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

Name | Display Name | Description | 
---- | ------------ | ----------- |
`AiFlows.Ai.Execute` | Execute AI related operations (like Generate) on AI flow | Allows to execute AI related operations (like Generate) on AI flows
`AiFlows.Ai.Read` | AI related read operations on AI flow | Allows to do AI related read operations on AI flows
`AiFlows.Ai.Write` | AI related write operations on AI flow | Allows to do AI related write operations on AI flows
`AiFlows.Connections.Read` | Read AI Flow Connection | Allows reading AI flow connections
`AiFlows.Runs.Execute` | Perform actions on AI flow run | Allows performing actions on AI flow runs
`AiFlows.Runs.Read` | Read Copilot Flow Run | Allows reading AI flow runs
`AiFlows.Runs.Write` | Write AI Flow Run | Allows writing AI flow runs
`AiFlows.Workflows.Execute` | Perform actions (like activate) AI flow | Allows to perform actions (like activate) AI flows
`AiFlows.Workflows.Read` | Read AI flow | Allows reading AI flows
`AiFlows.Workflows.Write` | Write AI flow | Allows writing AI flows
`AiTools.Prompt.Invoke` | Invoke AI Prompts | Allows invoking of AI Prompts
`AiTools.Prompt.Read` | Read AI Prompts | Allows reading of AI Prompts
`AiTools.Prompt.Write` | Read and Write AI Prompts | Allows reading and writing of AI Prompts
`Analytics.AdvisorActions.Execute` | Analytics.AdvisorActions.Execute | Allows user to execute advisor actions
`Analytics.AdvisorRecommendations.Read` | Analytics.AdvisorRecommendations.Read | Allows uses to read advisor reccomendations
`AppManagement.ApplicationPackages.Install` | Install Application Packages | Allows installing application packages
`AppManagement.ApplicationPackages.Read` | Read Application Packages | Allows reading application packages
`CopilotFlows.CloudFlows.ChatAssistant` | Cloud Flows chat assistant | Allows cloud flows chat assistant
`CopilotFlows.Connections.Read` | Read Copilot Flow Connection | Allows reading copilot flow connections
`CopilotFlows.Runs.Cancel` | Cancel Copilot Flow Run | Allows cancelling copilot flow runs
`CopilotFlows.Runs.Create` | Create Copilot Flow Run | Allows creating copilot flow runs
`CopilotFlows.Runs.Read` | Read Copilot Flow Run | Allows reading copilot flow runs
`CopilotFlows.Runs.Resume` | Resume Copilot Flow Run | Allows resuming copilot flow runs
`CopilotFlows.Workflows.Activate` | Activate Copilot Flows | Allows activating copilot flows
`CopilotFlows.Workflows.Generate` | Generate Copilot Flow Suggestion | Allows generating copilot flow suggestions
`CopilotFlows.Workflows.Read` | Read Copilot Flow | Allows reading copilot flows
`CopilotStudio.Copilots.Invoke` | Allows Invoking Copilots | Allows interacting with authenticated copilots hosted by Copilot Studio
`EnvironmentManagement.Environments.Read` | Read Environments | Allows reading of Environments
`EnvironmentManagement.Groups.Read` | Read Environment Groups | Allows reading of Environment Groups
`EnvironmentManagement.Groups.ReadWrite` | Read and Write Environment Groups | Allows reading and writing of Environment Groups
`EnvironmentManagement.Settings.Read` | Read Environment Management Settings | Allows reading of Environment Management Settings
`EnvironmentManagement.Settings.ReadWrite` | Update Environment Management Settings | Allows update of Environment Management Settings
`Licensing.Allocations.Read` | Read Currency Allocations | Allows reading currency allocations
`Licensing.Allocations.ReadWrite` | Read and Write Currency Allocations | Allows reading and writing currency allocations
`Licensing.BillingPolicies.Read` | Read Billing Policies | Allows reading billing policies
`Licensing.BillingPolicies.ReadWrite` | Read and Write Billing Policies | Read and Write Billing Policies
`Licensing.IsvContracts.Read` | Read ISV Contracts | Allows reading ISV contracts
`Licensing.IsvContracts.ReadWrite` | Read and Write ISV Contracts | Allows reading and writing ISV contracts
`PowerApps.Apps.Play` | Play Power Apps | Allows playing Power Apps
`PowerApps.Apps.Read` | Read Power App | Allows reading Power Apps
`PowerPages.Websites.Read` | Read Power Pages Websites | Allows reading Power Pages websites
`PowerPages.Websites.Write` | Write Power Pages Websites | Allows writing Power Pages websites
