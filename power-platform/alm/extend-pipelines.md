---
title: Extend pipelines in Power Platform
description: Add business log to customize the pipeline deployment process.
author: caburk
ms.author: caburk
ms.reviewer: kvivek
ms.topic: overview
ms.date: 05/23/2023
ms.custom: 
---
# Extend pipelines in Power Platform

ALM processes often vary across customers and business organizations. Pipelines extensibility provides the ability to configure deployment gates and apply custom logic at multiple steps of your deployment process. No-code, low-code, and pro-code options are available to custom-tailor pipelines and integrate with with other systems of record. For example, you can use Power Automate to add approvals, send notifications, or use pipelines in Power Platform along-side continuous integration/continuous deployment (CI/CD) applications such as Azure DevOps, GitHub, and others. These are only a few of the millions of possibilities.

Pipelines raise various [Microsoft Dataverse business events](/power-apps/developer/data-platform/business-events) that can trigger custom logic. Event data is relayed to subscribers such as Power Automate, which provides over 1,000 built-in [connectors](/connectors/connector-reference/), Azure Service Bus, Azure Event Hubs, Webhooks, and [Dataverse plug-ins](/power-apps/developer/data-platform/plug-ins). Regardless of how pipelines are extended, the maker-facing deployment experience remains simple.

> [!IMPORTANT]
> The capability to extend pipelines is being gradually rolled out across regions and might not be available yet in your region.

## Add predeployment conditions

You can optionally configure a gate for each pipeline stage. Then when a deployment is submitted, the request remains in a pending state until your business logic executes and finally signals the pipelines host to complete or reject the deployment. Pending deployment requests contain both the exported managed and unmanaged solutions, and connections and environment variable values for the target environment _(sometimes referred to as “deployment settings” or “DeploymentSettings.JSON”)_. For example, you may wish to run code scans, commit the solution to source control, or perform any number of automated tasks before deployments to a target environment.

The system prevents any tampering or modification to the exported solution artifact. Solutions are exported when a deployment request is submitted (when the maker selects **Deploy** from within their development environment), and the same solution artifact will be deployed upon approval. Similarly, the system doesn't re-export a solution for deployments to subsequent stages in a pipeline. The same solution artifact must pass through pipeline stages in sequential order. This ensures customization can't bypass QA environments or your approval processes.

When configuring the pipeline stage, select the **Pre-Deployment Step Required** checkbox.

  :::image type="content" source="media/pipelines-pre-step-config.png" alt-text="Pipelines pre-deployment step required":::

   > [!IMPORTANT]
   > - Adding a pre-deployment step gates pipelines deployments, but makers are required to have permission to import solutions to the target environment.
   > - Existing pipelines customers may need to update the Power Platform Pipelines application to enable new features. Updates can be managed within the Power Platform admin center.

## Triggers

Each step of a pipeline deployment triggers a real-time event at the beginning and completion of the step.

Triggers are available in Power Automate cloud flows within the pipelines host environment under the **When an action is performed** [trigger](/connectors/commondataserviceforapps/#triggers) of the Dataverse connector.

- **Catalog**: Microsoft Dataverse Common
- **Category**: Power Platform Pipelines
- **Table name**: (none)
- **Action name**: Select an option from the list. Pipelines provide the following custom actions that produce a trigger in Power Automate cloud flows:
  - `OnDeploymentCompleted`
  - `OnDeploymentRequested`
  - `OnDeploymentStarted`
  - `OnPreDeploymentCompleted`
  - `OnPreDeploymentStarted`

:::image type="content" source="media/pipelines-triggers.png" alt-text="Pipelines triggers in Power Automate":::

## Trigger conditions
[Power Automate trigger conditions](/power-automate/triggers-introduction#use-trigger-conditions-to-reduce-flow-runs.md) allow you to customize the trigger so that the flow runs only when certain conditions are met. For example, you may need to run different flows and associated business logic within different pipelines or pipeline stages. This also helps keep flow runs and Power platform requests consumption low. 

:::image type="content" source="/media/pipelines-flow-trigger-conditions.png" alt-text="Pipelines trigger conditions in Power Automate":::

### Trigger a flow for a specific pipeline
Triggers a flow run for all stages of the Contoso Pipeline. _Replace “Contoso Pipeline” with the name of your pipeline._

````@equals(triggerOutputs()?['body/OutputParameters/DeploymentPipelineName'], ‘Contoso Pipeline’)````

### Trigger a flow for a specific stage in a pipeline

````@equals(triggerOutputs()?['body/OutputParameters/DeploymentStageName'], ‘Contoso UAT’)````

### Trigger a flow for deployments to QA
Triggers a flow for any deployment stages with a stage name containing QA. 

````@contains(triggerOutputs()?['body/OutputParameters/DeploymentStageName'], ‘QA’)````

Learn more about expressions used in conditions [here.](/power-automate/use-expressions-in-conditions.md)
https://learn.microsoft.com/power-automate/use-expressions-in-conditions


## Action

After running the desired predeployment logic in cloud flows, use the **Perform an unbound action** named `UpdatePreDeploymentStepStatus`. Set `PreDeploymentStepStatus` to:

- **20** for completing the deployment.

- **30** for rejecting the deployment. The deployment won't proceed and status will be set to failed. You can add comments to indicate the reason for rejection.

:::image type="content" source="media/pipelines-approval-flow.png" alt-text="Pipelines approvals":::

> [!NOTE]
> The system sets **10** (pending) for `PreDeploymentStepStatus` as the default state for submitted deployments when this configuration is present.

## Event details

The tables below indicate inputs and outputs for each event. Output parameters can be used within subsequent steps of a cloud flow.

#### Deployment requested step

| Event | Input parameters  | Output parameters | Comments |
| --- | --- | --- | --- |
| `OnDeploymentRequested`  | StageRunID | Artifact Name, <br/>Deployment Stage Name, <br/>Deployment Pipeline Name, <br/>Solution Artifact Version, <br/>DeployAsUser, <br/>Stage Run Details Link (link to record in the pipelines configuration app), <br/>Artifact Download Link  | Not gated. Can be used for predeployment validation of the solution artifact.<br/> ArtifactFileDownloadLink is a link to download the managed solution file. To download the unmanaged solution, change the link from "/artifactfile/" to "/artifactfileunmanaged/"<br/><br/>Example to download managed solution: `https://[myorg].crm.dynamics.com/api/data/v9.0/deploymentartifacts(GUID)/artifactfile/$value`<br/><br/>Example to download unmanaged solution: `https://[myorg].crm.dynamics.com/api/data/v9.0/deploymentartifacts(GUID)/artifactfileunmanaged/$value`  |

#### Pre-deployment step

| Event | Input parameters  | Output parameters | Comments |
| --- | --- | --- | ---  |
| `OnPreDeploymentStarted` (Gated)  | StageRunID, <br/> PreDeployment Step Status (**10** (Pending), **20** (Completed), **30** (Failed)) | Artifact Name, <br/>Deploy As User, <br/>Deployment Stage Name, <br/>Deployment Pipeline Name, <br/>Solution Artifact Version,, <br/>Deployment Notes, <br/>Stage Run Details Link (link to record in the pipelines configuration app), <br/>Artifact Download Link | - Only triggers when **Pre-Deployment Step Required** is checked in the pipeline stage configuration. <br/>- Can be used to trigger approvals and other business logic before a deployment can proceed to the next step. <br/>- Requires calling the unbound action `UpdatePreDeploymentStepStatus` to set the `PreDeploymentStepStatus` after other business logic has completed. <br/> ArtifactFileDownloadLink is a link to download the managed solution file. To download the unmanaged solution, change the link from "/artifactfile/" to "/artifactfileunmanaged/"<br/><br/>Example to download managed solution: `https://[myorg].crm.dynamics.com/api/data/v9.0/deploymentartifacts(GUID)/artifactfile/$value`<br/><br/>Example to download unmanaged solution: `https://[myorg].crm.dynamics.com/api/data/v9.0/deploymentartifacts(GUID)/artifactfileunmanaged/$value` |
| `OnPreDeploymentCompleted`   | StageRunID | Artifact Name, <br/>Deployment Stage Name, <br/>Deployment Pipeline Name,<br/> PreDeployment Step Status (**10** (Pending), **20** (Completed), **30** (Failed)), <br/>Comments  | Event produced when `UpdatePreDeploymentStatus` is set to completed. |

#### Deployment step

| Event | Input parameters  | Output parameters | Comments |
| --- | --- | --- | ---  |
| `OnDeploymentStarted`   | StageRunID (GUID), <br/>Deployment Status ( **200000001** (Started), **200000005** (Scheduled))  | Artifact Name, <br/>Deployment Stage Name, <br/>Deployment Pipeline Name,  | Triggers when the actual deployment started or scheduled. Can be used to trigger custom pre-deployment logic.
| `OnDeploymentCompleted`   | StageRunID (GUID), <br/>DeploymentStatus (**200000002** (Succeeded), **200000006** (Canceled), **200000003** (Failed)), <br/>ErrorMessage  | Artifact Name, <br/>Deployment Stage Name, <br/>Deployment Pipeline Name  | Triggers when the deployment succeeded, failed, or was canceled. Can be used to trigger custom post-deployment logic. |

## Next step

[Run pipelines in Power Platform](run-pipeline.md)

### Related content

[What are cloud flows?](/power-automate/overview-cloud)<br/>
[Use Dataverse connector with cloud flows](/power-automate/dataverse/overview)
