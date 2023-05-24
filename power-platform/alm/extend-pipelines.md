---
title: Extend pipelines in Power Platform
description: Add business log to customize the pipeline deployment process.
author: caburk
ms.author: caburk
ms.reviewer: caburk
ms.topic: how-to
ms.date: 05/23/2023
ms.custom: template-how-to
---
# Extend pipelines in Power Platform

ALM processes often vary across customers and business organizations. Pipelines extensibility provides the ability to apply custom logic at multiple steps of your deployment process. Using Power Automate cloud flows, you can optionally extend and integrate pipelines with other systems of record. For example, you can add approvals, send notifications, or use pipelines in Power Platform along-side CI/CD applications such as Azure DevOps, GitHub, and others.

Pipelines use [Microsoft Dataverse business events](/power-apps/developer/data-platform/business-events) to provide flexibility in how the system can be extended. Pipelines event data is relayed to subscribers such as Power Automate, which provides over 1,000 built-in [connectors](/connectors/connector-reference/), Azure Service Bus, Azure Event Hubs, Webhooks, and Dataverse plug-ins. Regardless of how pipelines are extended, the maker-facing deployment experience remains simple.

> [!IMPORTANT]
> The capability to extend pipelines is being gradually rolled out across regions and might not be available yet in your region.

## Add predeployment conditions

You can optionally configure a gate for each pipeline stage. Then when a deployment is submitted, the request remains in a pending state until your business logic executes and finally signals the pipelines host to complete or reject the deployment. Pending deployment requests contain both the exported managed and unmanaged solutions, and connections and environment variable values for the target environment. For example, you may wish to run code scans, commit the solution to source control, or perform any number of automated tasks before deployments to a target environment.

The system prevents any tampering or modification to the exported solution artifact. Solutions are exported when a deployment request is submitted (when the maker clicked "Deploy" from within their development environment), and the same solution artifact will be deployed upon approval. Similarly, the system doesn't re-export a solution for deployments to subsequent stages in a pipeline. The same solution artifact must pass through pipeline stages in sequential order. This ensures customization can't bypass QA environments or your approval processes.

When configuring the pipeline stage, select the **Pre-Deployment Step Required** checkbox.

  :::image type="content" source="media/pipelines-pre-step-config.png" alt-text="Pipelines pre-deployment step required":::

   > [!IMPORTANT]
   > Adding a pre-deployment step gates pipelines deployments, but makers are required to have permission to import solutions to the target environment. A separate feature will be available soon for deploying with service principals.

## Triggers and actions

Each step of a deployment triggers a real-time event at the beginning and completion of the step.

Triggers are available in Power Automate cloud flows within the pipelines host environment under the **When an action is performed** trigger of the Dataverse connector.

- **Catalog**: Microsoft Dataverse Common
- **Category**: Power Platform Pipelines
- **Table name**: (none)
- **Action name**: Select an option from the list. Pipelines provide the following custom actions that produces a trigger in Power Automate cloud flows:
  - `OnDeploymentCompleted`
  - `OnDeploymentRequested`
  - `OnDeploymentStarted`
  - `OnPreDeploymentCompleted`
  - `OnPreDeploymentStarted`

:::image type="content" source="media/pipelines-triggers.png" alt-text="Pipelines triggers in Power Automate":::

After running the desired predeployment logic in cloud flows, use the **Perform an unbound action** named **UpdatePreDeploymentStepStatus** to proceed or fail the deployment.

:::image type="content" source="media/pipelines-approval-flow.png" alt-text="Pipelines approvals":::

#### Deployment requested step

| Event | Request Parameters  | Output Parameters | Comments |
| --- | --- | --- | --- |
| `OnDeploymentRequested`  | `StageRunID` | Artifact Name, <br/>Deployment Stage Name, <br/>Deployment Pipeline Name, <br/>Solution Artifact Version, <br/>Deployment Stage Run Name, <br/>Stage Run Details Link (link to record in the pipelines configuration app), <br/>Artifact Download Link  | Not gated. Can be used for predeployment validation of the solution artifact |

#### Pre-deployment step

| Event | Request Parameters  | Output Parameters | Comments |
| --- | --- | --- | ---  |
| `OnPreDeploymentStarted` (Gated)  | `StageRunID` | Deployment Stage Run Name, Deployment Stage Name, Deployment Pipeline Name, Artifact Name, PreDeplymentStepStatus, Deployment Notes | - Only triggers when **Predeployment step required** is checked in the pipeline stage configuration. <br/>- Can be used to trigger approvals and other business logic before a deployment can proceed to the next step. <br/>- Requires calling the unbound action **UpdatePreDeploymentStepStatus** to mark the set the PreDeploymentStepStatus after other business logic has completed. |
| `OnPreDeploymentCompleted`   | `StageRunID` | Artifact Name, <br/>Deployment Stage Name, <br/>Deployment Pipeline Name,<br/> PreDeployment Step Status (10 = Pending, 20 = Completed, Failed = 30), <br/>Comments  | Configure any necessary business logic that takes place before the solution import (deployment to target) is started. The pipeline won't proceed to the next step until the **UpdatePreDeploymentStatus** is set to completed. |

For the `OnPreDeploymentStarted` (Gated) event, the following is the callback:

`UpdatePreDeploymentStepStatus (StageRunID PreDeplymentStepStatus,`PreDeploymentNotes`); PreDeploymentStepStatus (10 = Pending, 20 = Completed, Failed = 30)`

- Pending = State until marked as completed or failed.
- Completed = Deployment will proceed.
- Failed = Reject the deployment. It won't proceed.  

#### Deployment step

| Business Event | Request Param | Response Params  | Notes |
| --- | --- | --- | ---  |
| `OnDeploymentStarted`   | `StageRunID (GUID)`  | Artifact Name, <br/>Deployment Stage Name, <br/>Deployment Pipeline Name, <br/>Deployment Notes,<br/>Solution Artifact Version, <br/>Stage Run Details Link (link to record in the pipelines configuration app), <br/>Artifact Download Link, <br/>Deployment Status ( **Started, Scheduled** )   |ArtifactFileDownloadLink is a link to download the managed solution file. To download the unmanaged solution, change the link from "/artifactfile/" to "/artifactfileunmanaged/"<br/><br/>Example to download managed solution: `https://myorg.crm.dynamics.com/api/data/v9.0/deploymentartifacts(55518dfc-23e5-ed11-8848-0022482b22b5)/artifactfile/$value`<br/><br/>Example to download unmanaged solution: `https://myorg.crm.dynamics.com/api/data/v9.0/deploymentartifacts(55518dfc-23e5-ed11-8848-0022482b22b5)/artifactfileunmanaged/$value` |
| `OnDeploymentCompleted`   | `StageRunID (GUID)`, `DeploymentStatus`, `ErrorMessage`  | Artifact Name, <br/>Deployment Stage Name, <br/>Deployment Pipeline Name  | Triggers when the deployment succeeded, Failed, or was Canceled. Can be used to trigger custom post-deployment logic. |
