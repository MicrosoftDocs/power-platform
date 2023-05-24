---
title: Extend pipelines
description: Add business log to customize the deployment process.
author: caburk
ms.author: matp
ms.topic: how-to
ms.date: 05/20/2023
ms.custom: template-how-to
---
# Extend pipelines

ALM processes often vary across customers and business organizations. Pipelines extensibility provides the ability to apply custom logic at multiple steps of your deployment process. Using Power Automate cloud flows, you can optionally extend and integrate pipelines with other systems of record. For example, you can add approvals, send notifications, or use pipelines in Power Platform along-side CI/CD applications such as Azure DevOps, GitHub, and others.

Pipelines uses [Microsoft Dataverse business events](https://learn.microsoft.com/power-apps/developer/data-platform/business-events) to provide flexibility in how the system can be extended. Pipelines event data is relayed to subscribers such as Power Automate, which provides over 1,000 built-in [connectors](https://learn.microsoft.com/connectors/connector-reference/), Azure Service Bus, Azure Event Hub, Webhooks, and Dataverse plug-ins. Regardless of how pipelines are extended, the maker-facing deployment experience remains simple.

## Add pre-deployment conditions

You can optionally configure a gate for each pipeline stage. Then when a deployment is submitted, the request remains in a pending state until your business logic executes and finally signals the pipelines host to complete or reject the deployment. Pending deployment requests contain both the exported managed and unmanaged solutions, and connections and environment variable values for the target environment. For example, you may wish to run code scans, commit the solution to source control, or perform any number of automated tasks before deployments to a target environment.

The system prevents any tampering or modification to the exported solution artifact. Solutions are exported when a deployment request is submitted (when the maker clicked "Deploy" from within their development environment), and the same solution artifact will be deployed upon approval. Similarly, the system does not re-export a solution for deployments to subsequent stages in a pipeline. The same solution artifact must pass through pipeline stages in sequential order. This ensures customization cannot bypass QA environments or your approval processes.

When configuring the pipeline stage, check **Pre-Deployment Step Required**
  :::image type="content" source="media/pipelines-pre-step-config.png" alt-text="Pipelines pre-deployment step required":::

   > [!IMPORTANT]
   > Adding a pre-deployment step gates pipelines deployments, but makers are required to have permission to import solutions to the target environment. A separate feature will be available soon for deploying with service principals.

## Triggers and actions

Each step of a deployment triggers a real-time event at the beginning and completion of the step.

Triggers are available in Power Automate cloud flows within the pipelines host environment under the Dataverse connector, **When an action is performed** trigger.

- Catalog: Microsoft Dataverse Common
- Category: Power Platform Pipelines
- Table name: (none)
- Action name: Select an option from the list

:::image type="content" source="media/pipelines-triggers.png" alt-text="Pipelines triggers in Power Automate":::

After running the desired pre-deployment logic in cloud flows, use the Perform an unbound action named UpdatePreDeploymentStepStatus to proceed or fail the deployment.
  :::image type="content" source="media/pipelines-approval-flow.png" alt-text="Pipelines approvals":::


**Deployment requested step**

| Event | Request Parameters  | Output Parameters | Callback | Comments |
| --- | --- | --- | --- | --- |
| OnDeploymentRequested  | StageRunID | Artifact Name, Deployment Stage Name, Deployment Pipeline Name, Solution Artifact Version, Deployment Stage Run Name, Stage Run Details Link (link to record in the pipelines configuration app), Artifact Download Link

 | N/A  | Not gated. Can be used for pre-deployment validation of the solution artifact |


**Pre-deployment step**

| Event | Request Parameters  | Output Parameters | Callback | Comments |
| --- | --- | --- | --- | --- |
| OnPreDeploymentStarted (Gated)  | StageRunID | Deployment Stage Run Name, Deployment Stage Name, Deployment Pipeline Name, Artifact Name, PreDeplymentStepStatus, Deployment Notes | UpdatePreDeploymentStepStatus(StageRunID PreDeplymentStepStatus, PreDeploymentNotes);  PreDeploymentStepStatus (10 = Pending, 20 = Completed, Failed = 30)
Pending = State until marked as completed or failed. 
Completed = Deployment will proceed, Failed = Reject the deployment. It will not proceed  | Only triggers when Pre-deployment step required is checked in the pipeline stage configuration.
Can be used to trigger approvals and other business logic before a deployment can proceed to the next step.
Requires calling the unbound action "UpdatePreDeploymentStepStatus" to mark the set the PreDeploymentStepStatus after other business logic has completed. |
| OnPreDeploymentCompleted   | StageRunID | Artifact Name Deployment Stage Name Deployment Pipeline Name PreDeployment Step Status (10 = Pending, 20 = Completed, Failed = 30),Comments | N/A  | Configure any necessary business logic that takes place before the solution import (deployment to target) is started. The pipeline will not proceed to the next step until the **UpdatePreDeploymentStatus** is set to completed. |


**Deployment Step**

| **Business Event**   | **Request Param**   | **Response Params**   | **Callback** | **Notes** |
| --- | --- | --- | --- | --- |
| OnDeploymentStarted   | StageRunID (GUID)  | Artifact Name Deployment Stage Name Deployment Pipeline Name Deployment Notes,Solution Artifact VersionStage Run Details Link (link to record in the pipelines configuration app),Artifact Download Link,Deployment Status ( **Started, Scheduled** )    | N/A   |  ArtifactFileDownloadLink is a link to download the managed solution file. To download the unmanaged solution, change the link from "/artifactfile/" to "/artifactfileunmanaged/"
Example to download managed solution: [https://myorg.crm.dynamics.com/api/data/v9.0/deploymentartifacts(55518dfc-23e5-ed11-8848-0022482b22b5)/artifactfile/$value](https://myorg.crm.dynamics.com/api/data/v9.0/deploymentartifacts(55518dfc-23e5-ed11-8848-0022482b22b5)/artifactfile/%24value)

Example to download unmanaged solution: https://myorg.crm.dynamics.com/api/data/v9.0/deploymentartifacts(55518dfc-23e5-ed11-8848-0022482b22b5)/artifactfileunmanaged/$value |
| OnDeploymentCompleted   | StageRunID (GUID), DeploymentStatus, ErrorMessage  | Artifact Name Deployment Stage Name Deployment Pipeline Name
 | N/A  | Triggers when the deployment succeeded, Failed, or was Canceled. Can be used to trigger custom post-deployment logic. |



  
