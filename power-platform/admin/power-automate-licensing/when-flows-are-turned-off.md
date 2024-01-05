---
title: When premium flows are turned off due to license issues
description: Learn about why your flows are turned off, types of enforecements, and recommendations.
author: PriyaKodukula
contributors:
  - PriyaKodukula
  - thomasjeffries11
  - v-aangie
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/25/2023
ms.author: prkoduku
ms.reviewer: angieandrews
search.audienceType: 
  - admin
---

# When premium flows are turned off due to license issues

Dynamics 365 and Power Apps licenses include a limited set of Power Automate capabilities that allow users to run flows that allow for in context flows. To learn more, go to [What Power Automate capabilities are included in Dynamics 365 licenses](faqs.md#what-power-automate-capabilities-are-included-in-dynamics-365-licenses). 

## Enforcement

Flows not in context of apps are subject to enforcement. The following list explains the enforcement timelines.
  - Admins with flows that need licenses will first get notifications in Power Platform Admin center.
  - Admins can find these flows using PowerShell and assign a Process/per-flow license to the flow or a Power Automate premium/per-user license to the owner to avoid any interruptions. Admins have 30 days to act on these flows before makers start receiving notifications.
  - After 30 days from admin notifications, flow owners and co-owners get email notifications and in product banners in Power Automate portal about the flows that need their attention. Admins get email notifications about the flows.
  - Flow owners can start a trial or ask an admin for a license or buy their own license. Alternatively, if the flow is supporting a Power App/D365 app, they can associate the flow to the app. Flow owners and co-owners have 90 days to take action.
  - Once enforcement notifications are sent to makers, new flows using premium features without a license are turned off by default.
  - If no action is taken in 90 days, the flows are turned off and the flow owners and co-owners get email and in product notifications. Turning on these flows requires a premium Power Automate license or association with the corresponding app.

## Types of enforcements

Admins have a PowerShell command to find the flows that need their attention.

Dynamics 365 licensed user flows are automatically considered as being in context of the Dynamics 365 app in the environment and are excluded from enforcement if they are:

- Using a Dataverse connector to talk to Dynamics 365 entities in the environment.
    Or
- Using first party Dynamics 365 connectors like finance and operations.

 You must purchase a standalone Power Automate license if:

- The environment doesn't have Dynamics 365 app installed, or
- A premium flow isn't using Dynamics 365 entities and isn't linked to any Dynamics 365 app.

| Enforcement Type | Exceptions | Admin notifications | Maker notification (+30 days) | Grace period | Recommended Action | Enforcement - Flow turn off |
|--------------|-------------------|--------|----------|---------|-------|------|
| Premium flows where flow owner left the organization | Manual flows and flows whose owners have grandfathered licenses(P1,P2) will not be enforced  | September 1, 2022 | October 1, 2022 | 14 days | Assign a Power Automate license to the flow owner or per-flow/process license to the flow | October 15, 2022 |
|Premium flows where the flow owner doesn't have a Premium license (owner previously had a trial/license that is expired now)|Manual flows and flows whose owners have grandfathered licenses(P1,P2) will not be enforced  | September 1, 2022| October 1, 2022 | 14 days | Assign a Power Automate license to the flow owner or per-flow/process license to the flow | October 15, 2022 |
|Premium flows created by flow owner with Power Apps license but the flow isn't triggered by the Power App|Power Apps licensed user flows that are triggered from the canvas apps or that use Dataverse "For a select record" trigger in model driven app are automatically considered as being in context of the Power App and are excluded from enforcement|October 13, 2023| November 13, 2023|120 days| Assign a Power Automate license to the flow owner or per-flow/process license to the flow. Alternatively, if the flow is supporting a Power App, [associate the flow to the app](faqs.md#how-can-i-associate-in-context-flows-to-power-appsdynamics-365-apps).| March 13, 2024 |
|Premium flows created by flow owner with D365 license but the flow isn't in a Dynamics environment or the flow isn't interacting with Dynamics entities|Dynamics 365 licensed user flows that are using Dataverse connector to talk to Dynamics entities in the environment or using First party Dynamics connectors like finance and operations are automatically considered as being in context of the D365 app in the environment and are excluded from enforcement.|October 13, 2023| November 13, 2023|120 days| Assign a Power Automate license to the flow owner or per-flow/process license to the flow. Alternatively, if the flow is supporting a Dynamics 365 app, [associate the flow to the app](faqs.md#how-can-i-associate-in-context-flows-to-power-appsdynamics-365-apps).| March 13, 2024 |
|Premium Sevice principal flows without a per flow/ Process licenses| Service principal flows in context of Dynamics 365 app are excluded from enforcement | March 15, 2024| April 15, 2024|90 days| Assign a Power Automate license to the flow owner or per-flow/process license to the flow. Alternatively, if the flow is supporting a Dynamics 365 app, associate the flow to the app.| Aug 15, 2024 |

> [!NOTE]
> Enforcements are deployed a geo region at a time. The dates in the preceding table are for the earliest region. If you don't see notifications in the Power Platform admin center or Power Automate portal even though the date listed in the table passed, it means the enforcement isn't deployed in your region yet.

## Identify flows that need Premium licenses to avoid interruptions due to enforcement

Admins need to run the PowerShell per environment. If no results are returned, there are no flows that need your attention. When there are any licensing changes in your environment, or new users or flows added to the environment, run the PowerShell command to identify if any flows need your attention. When new enforcements are launched, admins and makers get notifications in the Power Platform admin center, Power Automate portal, and emails. If you receive a notification, update the version and rerun the PowerShell to identify any new flows need your attention.  

If you previously installed PowerShell, check for the installed version using the following command:

`Get-InstalledModule -Name  Microsoft.PowerApps.Administration.PowerShell`

The latest version deployed in August 2023 is 2.0.174. If you're on a previous version, use the following command to update the PowerShell module.

```powershell
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell -Force
Install-Module -Name Microsoft.PowerApps.PowerShell -AllowClobber -Force 
``````

> [!NOTE]
> In August 2023, we made multiple enhancements and performance improvements to the Powershell module. You shoud update to the latest version.

Command: `Get-AdminFlowAtRiskOfSuspension`

Command example with export:

`Get-AdminFlowAtRiskOfSuspension -EnvironmentName  <ENV_NAME> -ApiVersion '2016-11-01' | Export-Csv -Path suspensionList.c
