---
title: Extend pipelines in Power Platform
description: Add business logic to customize the pipeline deployment process.
author: caburk
ms.author: caburk
ms.reviewer: pehecke
ms.topic: overview
ms.date: 03/18/2024
ms.custom: 
---

# Extend pipelines in Power Platform

Pipelines can be custom tailored to serve the unique needs of an organization. For example, you can add approvals, deploy via service principals, and integrate with internal systems of record, Azure DevOps, GitHub, and much more. Because [Microsoft Dataverse business events](/power-apps/developer/data-platform/business-events) are used, business logic can be executed within Power Automate or various other subscribers. Whether your pipeline is basic or sophisticated on the inside, the deployment experience remains simple for makers on the outside.

> [!IMPORTANT]
>
> - New pipelines extensions are being gradually rolled out across regions and might not be available yet in your region.
> - Existing pipelines customers may need to update the Power Platform pipelines application to enable new features. You can manage the updates within the Power Platform admin center.
> - Personal pipelines created within Power Apps (make.powerapps.com) can't be extended.

## Gated extensions available
Pipelines deployments progress through multiple predefined steps until deployment completion. Gated extensions insert custom steps into the progression where custom business logic can be executed. It's like your own personal train where you're in control of where it stops and whether it continues or not.

:::image type="content" source="media/pipelines-extensibility-train.png" alt-text="Extensibility train diagram":::

When enabled, each extension inserts a custom step at a different point within a deployment’s progression. Extensions can be used alone or together. 

- **Pre-export Step Required** allows running custom validation logic when a deployment request is submitted. Pipelines won’t export the solution from a development environment until this step is marked as completed. Only enable this for the first stage in a pipeline. For example, user assistance testing (UAT).

- **Is Delegated Deployment** carries out deployments using a service principal or pipeline stage owner’s identity instead of the requesting maker’s. This identity ensures makers can request deployments without elevated (or any) access within target environments. Requires approval from an authorized identity.

- **Pre-deployment Step Required** provides additional flexibility to insert a custom step after a deployment is approved. For example, if a final approval is required.

:::image type="content" source="media/three-gated-extensions.png" alt-text="Enable gated extensions":::

Steps inserted by enabling a gated extension are in a pending state until your business logic executes and finally signals the pipelines host to complete or reject the step. Makers can see when a deployment is pending as well as cancel their deployment request up until the final step of the deployment. 

> [!NOTE]
> Once the managed and unmanaged solution artifacts are exported, the system stores them in the pipelines host and prohibits any tampering or modification. The same managed artifact, per version, will be deployed to all subsequent stages in the pipeline in sequential order. This ensures no solution can bypass QA environments or approval processes. 

## Understanding pipelines triggers and actions

Each step of a pipeline deployment triggers a real-time event at the beginning and completion of the step for which you can initiate custom logic. Additional triggers are produced when gated extensions are enabled. These correspond to the custom step inserted when an extension is enabled on the pipeline stage.

The tables here indicate triggers and actions required for each extension. Output parameters from each trigger can be used within subsequent steps of a cloud flow.

| Gated extension | Step started trigger  | Step completed trigger | Unbound action | Connection to use |
| --- | --- | --- | --- | --- |
| Pre-export step required | OnDeploymentRequested | N/A | UpdatePreExportStepStatus | Any identity with access to update the deployment stage run record |
| Is delegated deployment | OnApprovalStarted | OnDeploymentCompleted | Create a connection as the service principal or pipeline stage owner as configured on the pipeline stage. The pipeline stage owner must be an owner of the service principal in Microsoft Entra ID. |
| Predeployment step required | OnPreDeploymentStarted | OnPreDeploymentCompleted | UpdatePreDeploymentStepStatus | Any identity with access to update the deployment stage run record |

> [!NOTE]
> OnDeploymentRequested triggers for all deployments.

:::image type="content" source="media/extensibility-flow-diagram.png" alt-text="Deployment to first stage diagram":::

## Triggers

Triggers are available in Power Automate cloud flows within the pipelines host environment under the **When an action is performed** [trigger](/connectors/commondataserviceforapps/#triggers) of the Dataverse connector.

- **Catalog**: Microsoft Dataverse Common.
- **Category**: Power Platform Pipelines.
- **Table name**: (None).
- **Action name**: Select an option from the list. Pipelines provide the following custom actions that produce a trigger in Power Automate cloud flows. Approval and OnPreDeployment* related events only trigger when the corresponding extension is enabled.
  `OnDeploymentRequested`  
  `OnApprovalStarted`  
  `OnApprovalCompleted`  
  `OnPreDeploymentStarted`  
  `OnPreDeploymentCompleted`  
  `OnDeploymentStarted`  
  `OnDeploymentCompleted`

Here's an example screenshot of a trigger.

:::image type="content" source="media/pipelines-triggers.png" alt-text="Pipelines triggers in Power Automate":::

### Trigger conditions

Power Automate [trigger conditions](/power-automate/triggers-introduction#use-trigger-conditions-to-reduce-flow-runs) allow you to customize the trigger so that the flow runs only when certain conditions are met. For example, you might need to run different flows and associated business logic within different pipelines or pipeline stages. This also helps keep flow runs and Power platform requests consumption low.

:::image type="content" source="media/pipelines-flow-trigger-conditions.png" alt-text="Pipelines trigger conditions in Power Automate":::

### Trigger a flow for a specific pipeline

Triggers a flow run for all stages of a pipeline (Contoso Pipeline). In this example, replace 'Contoso Pipeline' with the name of your pipeline:

`@equals(triggerOutputs()?['body/OutputParameters/DeploymentPipelineName'], 'Contoso Pipeline')`

### Trigger a flow for a specific stage in a pipeline

Triggers a flow for a deployment stage with the stage name *equal* to 'Contoso UAT':

`@equals(triggerOutputs()?['body/OutputParameters/DeploymentStageName'], 'Contoso UAT')`

### Trigger a flow for specific stages in a pipeline

Triggers a flow for deployment stages with the stage name *containing* 'QA':

`@contains(triggerOutputs()?['body/OutputParameters/DeploymentStageName'], 'QA')`

Learn more about expressions used in conditions: [Use expressions in conditions to check multiple values](/power-automate/use-expressions-in-conditions).

## Actions

After running the desired logic in cloud flows, use the **Perform an unbound action** in conjunction with the corresponding action for each gated extension.

These parameters are exposed across the actions for the corresponding gated extensions.  

- UpdatePreExportStepStatus, UpdateApprovalStatus, and PreDeploymentStepStatus:
  - **10** is the pending status set by the system.
  - **20** for completing the step.
  - **30** for rejecting the step. The deployment won't proceed and status will be set to failed. You can also add both maker facing and admin facing comments to indicate the reason for rejection.
- ApprovalComments and predeployment comments:
  -   Comments that are visible to the maker within pipelines run history. Intended for approvers to share comments with the requesting maker. For example, why their deployment was rejected or information about company specific processes.
- PreExportProperties and ApprovalProperties:
  - Admins can store information or custom parameters here without it surfacing to makers - for example a link to the flow run or approval, or other pertinent data. The intent is to provide flexibility and simplify custom reporting for deployment related data.

## Samples

Download and then import the desired managed solution into your pipelines host environment. These samples can be customized to fit the unique needs of your organization.

### Pipelines extensibility samples

This download contains sample cloud flows for using the above triggers and actions with pipelines. More information: [Download sample solution](https://aka.ms/DownloadPipelinesExtensibilitySamples)

### Delegated deployment samples

This download contains sample cloud flows for managing approvals and sharing deployed canvas apps and flows within the target environment. More information: [Download sample solution](https://aka.ms/DownloadDelegatedDeploymentSamples)

## Next steps

- [Run pipelines in Power Platform](run-pipeline.md)

### Related content

- [Extend a pipeline in Microsoft Power Platform - Learn Module](/training/modules/extend-pipeline/)
- [What are cloud flows?](/power-automate/overview-cloud)<br/>
- [Use Dataverse connector with cloud flows](/power-automate/dataverse/overview)
