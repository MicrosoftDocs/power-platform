---
title: Programmability and Extensibility - Permission reference
description: Overview of granular permissions available in Power Platform programmability tools
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 08/18/2025
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Permission reference

This article provides an overview of the Power Platform API granular permissions. These permissions are available for registering client applications in Microsoft Entra ID and might become available in security role form in the future.

## Naming convention

Permissions in the Power Platform API are named in this manner: `{namespace}.{resourceType}.{action}`, where:

* `namespace` is a logical grouping of resources and functionality
* `resourceType` is the specific resource type where the permission is defined. It must be unique across the resource type's namespace, and
* `action` is described in the following table

  HTTP Method | Path Structure | Action Name(s)
  ----------- | -------------- | --------------
  GET or HEAD | Any            | Read
  DELETE      | Any            | Delete
  PATCH       | Any            | Update
  PUT         | Any            | Create and Update
  POST        | `/{namespace}/.../{resourceType}` | Create
  POST        | `/{namespace}/.../{resourceType}/{resourceId}/{action}` | `{action}`

## Defined permissions

The following table lists the currently defined permissions in Power Platform API:

Name | Display name | Description
---- | ------------ | -----------
AiFlows.Ai.Execute | Execute AI related operations (like Generate) on AI flow | Allows you to execute AI-related operations (like Generate) on AI flows.
AiFlows.Ai.Read | AI related read operations on AI flow | Allows you to do AI-related read operations on AI flows.
AiFlows.Ai.Write | AI related write operations on AI flow | Allows you to do AI-related write operations on AI flows.
AiFlows.Connections.Read | Read AI flow connection | Allows reading AI flow connections.
AiFlows.Runs.Execute | Perform actions on AI flow run | Allows performing actions on AI flow runs.
AiFlows.Runs.Read | Read Copilot flow run | Allows reading AI flow runs.
AiFlows.Runs.Write | Write AI flow run | Allows writing AI flow runs.
AiFlows.Workflows.Execute | Perform actions (like activate) AI flow | Allows you to perform actions (like activate) on AI flows.
AiFlows.Workflows.Read | Read AI flow | Allows reading AI flows.
AiFlows.Workflows.Write | Write AI flow | Allows writing AI flows.
AiTools.Prompt.Invoke | Invoke AI prompts | Allows invoking of AI prompts.
AiTools.Prompt.Read | Read AI prompts | Allows reading of AI prompts.
AiTools.Prompt.Write | Read and write AI prompts | Allows reading and writing of AI prompts.
Analytics.AdvisorActions.Execute | Analytics.AdvisorActions.Execute | Allows users to execute advisor actions.
Analytics.AdvisorRecommendations.Read | Analytics.AdvisorRecommendations.Read | Allows users to read advisor recommendations.
AppManagement.ApplicationPackages.Install | Install application packages | Allows installing application packages.
AppManagement.ApplicationPackages.Read | Read application packages | Allows reading of application packages.
Authorization.RoleAssignments.Read | Power Platform role assignment reader | Allows reading of Power Platform role assignments.
Authorization.RoleAssignments.Write | Power Platform role assignment writer | Allows assigning of Power Platform role assignments.
Connectivity.Connectors.Read | Read connectors | Allows reading of connectors.
Connectivity.Connections.Read | Read connections | Allows reading of connections.
CopilotFlows.ChatAssistant.Execute | Call cloud flows chat assistant | Allows calling cloud flows chat assistant.
CopilotFlows.CloudFlows.ChatAssistant | Cloud flows chat assistant | Allows cloud flows chat assistant.
CopilotFlows.Workflows.Generate | Generate Copilot flow suggestion | Allows generating Copilot flow suggestions.
CopilotGovernance.Features.Execute | Perform actions related to Copilot governance features | Permission required to perform actions related to Copilot governance features.
CopilotGovernance.Features.Read | Read Copilot governance features | Permission required to read Copilot governance features.
CopilotGovernance.Settings.Read | Read Copilot governance settings | Permission required to read Copilot governance settings.
CopilotGovernance.Settings.Write | Write Copilot governance settings | Permission required to write Copilot governance settings.
CopilotStudio.AdminActions.Invoke | Allows admins to invoke administrative actions | Allow admins to invoke administrative actions on agents created in Microsoft Copilot Studio.
CopilotStudio.Copilots.Invoke | Allows invoking Copilots | Allows interacting with authenticated Copilots hosted by Copilot Studio.
EnvironmentManagement.Environments.Read | Read environments | Allows reading of environments.
EnvironmentManagement.Groups.Read | Read environment groups | Allows reading of environment groups.
EnvironmentManagement.Groups.ReadWrite | Read and write environment groups | Allows reading and writing of environment groups.
EnvironmentManagement.Settings.Read | Read environment management settings | Allows reading of Environment Management Settings
EnvironmentManagement.Settings.ReadWrite | Update environment management settings | Allows update of environment management settings.
Governance.CrossTenantConnectionReports.Read | Read cross-tenant connection reports | Allows reading cross-tenant connection reports
Governance.CrossTenantConnectionReports.ReadWrite | Read and write cross-tenant connection reports | Allows reading and writing of cross-tenant connection reports.
Licensing.Allocations.Read | Read currency allocations | Allows reading currency allocations.
Licensing.Allocations.ReadWrite | Read and write currency allocations | Allows reading and writing of currency allocations.
Licensing.BillingPolicies.Read | Read billing policies | Allows reading of billing policies.
Licensing.BillingPolicies.ReadWrite | Read and write billing policies | Allows read and writing of billing policies.
Licensing.IsvContracts.Read | Read ISV contracts | Allows reading of ISV contracts.
Licensing.IsvContracts.ReadWrite | Read and write ISV contracts | Allows reading and writing of ISV contracts.
PowerApps.Apps.Play | Play Power Apps | Allows playing of Power Apps applications.
PowerApps.Apps.Read | Read Power App | Allows reading of Power Apps applications.
PowerAutomate.Flows.Read | Read Power Automate flows | Allows reading of Power Automate flows.
PowerAutomate.Flows.Write | Write Power Automate flows | Allows writing of Power Automate flows.
PowerPages.Websites.Read | Read Power Pages websites | Allows reading of Power Pages websites.
PowerPages.Websites.Write | Write Power Pages websites | Allows writing of Power Pages websites.
ResourceQuery.Resources.Read | Query Resources | Allows querying of resources.
Security.Recommendations.Read | Read Power Platform security information | Allows reading of security recommendations in Power Platform.
