---
title: Extend pipelines in Power Platform
description: Add business logic to customize the pipeline deployment process.
author: caburk
ms.author: caburk
ms.reviewer: pehecke
ms.topic: overview
ms.date: 10/28/2026
ms.custom: 
---

# Extend pipelines in Power Platform

Pipelines can be custom tailored to serve the unique needs of an organization. For example, you can add approvals, deploy via service principals, and integrate with internal systems of record, Azure DevOps, GitHub, and much more. By using [Microsoft Dataverse business events](/power-apps/developer/data-platform/business-events), you can execute business logic within Power Automate or various other subscribers. Whether your pipeline is basic or sophisticated on the inside, the deployment experience remains simple for makers on the outside.

> [!IMPORTANT]
>
> - New pipeline extensions are gradually rolling out across regions and might not be available yet in your region.
> - Existing pipelines customers might need to update the Power Platform pipelines application to enable new features. You can manage the updates within the Power Platform admin center.
> - You can't extend personal pipelines created within Power Apps (make.powerapps.com).

## Available gated extensions

Pipelines deployments progress through multiple predefined steps until deployment completion. Gated extensions insert custom steps into the progression where custom business logic can be executed. It's like your own personal train where you're in control of where it stops and whether it continues or not.

:::image type="content" source="media/pipelines-extensibility-train.png" alt-text="Extensibility train diagram":::

When enabled, each extension inserts a custom step at a different point within a deployment’s progression. You can use extensions alone or together.

- **Pre-export Step Required** runs custom validation logic when you submit a deployment request. Pipelines don’t export the solution from a development environment until you complete this step. Only enable this extension for the first stage in a pipeline. For example, use it for user assistance testing (UAT).

- **Is Delegated Deployment** carries out deployments by using a service principal or pipeline stage owner’s identity instead of the requesting maker’s identity. This identity ensures makers can request deployments without elevated (or any) access within target environments. This extension requires approval from an authorized identity.

- **Pre-deployment Step Required** provides additional flexibility to insert a custom step after a deployment is approved. For example, use it if a final approval is required.

:::image type="content" source="media/three-gated-extensions.png" alt-text="Enable gated extensions":::

Steps that gated extensions insert are in a pending state until your business logic executes and finally signals the pipelines host to complete or reject the step. Makers can see when a deployment is pending and can cancel their deployment request up until the final step of the deployment.

> [!NOTE]
> Once the managed and unmanaged solution artifacts are exported, the system stores them in the pipelines host and prohibits any tampering or modification. The same managed artifact, per version, deploys to all subsequent stages in the pipeline in sequential order. This process ensures no solution can bypass QA environments or approval processes.

## Understanding pipeline triggers and actions

Each step of a pipeline deployment triggers a real-time event at the beginning and completion of the step. You can initiate custom logic for these events. Enabling gated extensions produces additional triggers. These triggers correspond to the custom step inserted when an extension is enabled on the pipeline stage.

The following tables indicate triggers and actions required for each extension. You can use output parameters from each trigger within subsequent steps of a cloud flow.

| Gated extension | Step started trigger  | Step completed trigger | Unbound action | Connection to use |
| --- | --- | --- | --- | --- |
| Pre-export step required | OnDeploymentRequested | N/A | UpdatePreExportStepStatus | Any identity with access to update the deployment stage run record |
| Is delegated deployment | OnApprovalStarted | OnDeploymentCompleted | Create a connection as the service principal or pipeline stage owner as configured on the pipeline stage. The pipeline stage owner must be an owner of the service principal in Microsoft Entra ID. |
| Predeployment step required | OnPreDeploymentStarted | OnPreDeploymentCompleted | UpdatePreDeploymentStepStatus | Any identity with access to update the deployment stage run record |

> [!NOTE]
> OnDeploymentRequested triggers for all deployments.

:::image type="content" source="media/extensibility-flow-diagram.png" alt-text="Deployment to first stage diagram":::

## Triggers

Power Automate cloud flows in the pipelines host environment offer triggers under the **When an action is performed** [trigger](/connectors/commondataserviceforapps/#triggers) of the Dataverse connector.

- **Catalog**: Microsoft Dataverse Common.
- **Category**: Power Platform Pipelines.
- **Table name**: (None).
- **Action name**: Select an option from the list. Pipelines provide the following custom actions that create a trigger in Power Automate cloud flows. Approval and OnPreDeployment* related events trigger only when you enable the corresponding extension.
  `OnDeploymentRequested`  
  `OnApprovalStarted`  
  `OnApprovalCompleted`  
  `OnPreDeploymentStarted`  
  `OnPreDeploymentCompleted`  
  `OnDeploymentStarted`  
  `OnDeploymentCompleted`

Here's a screenshot of a trigger.

:::image type="content" source="media/pipelines-triggers.png" alt-text="Pipelines triggers in Power Automate":::

### Trigger conditions

Power Automate [trigger conditions](/power-automate/triggers-introduction#use-trigger-conditions-to-reduce-flow-runs) let you customize the trigger so the flow runs only when certain conditions are met. For example, you might need to run different flows and associated business logic within different pipelines or pipeline stages. This condition also helps keep flow runs and Power Platform requests consumption low.

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

After running the desired logic in cloud flows, use the **Perform an unbound action** action together with the corresponding action for each gated extension.

These parameters are available across the actions for the corresponding gated extensions:  

- `UpdatePreExportStepStatus`, `UpdateApprovalStatus`, and `PreDeploymentStepStatus`:
  - `10` is the pending status set by the system.
  - `20` for completing the step.
  - `30` for rejecting the step. The deployment doesn't proceed and the system sets the status to failed. You can also add both maker-facing and admin-facing comments to indicate the reason for rejection.
- `ApprovalComments` and predeployment comments:
  - Comments that are visible to the maker within pipelines run history. Approvers use these comments to share information with the requesting maker. For example, why their deployment was rejected or information about company-specific processes.
- `PreExportProperties` and `ApprovalProperties`:
  - Admins can store information or custom parameters here without it surfacing to makers. For example, a link to the flow run or approval, or other pertinent data. The intent is to provide flexibility and simplify custom reporting for deployment related data.

## Samples

Download and then import the desired managed solution into your pipelines host environment. Customize these samples to fit the unique needs of your organization.

### Pipelines extensibility samples

This download contains sample cloud flows for using the preceding triggers and actions with pipelines. For more information, see [Download sample solution](https://download.microsoft.com/download/7/2/6/72633cb9-e046-4f3d-88ba-d64bffb6107a/PipelinesExtensibilitySamples_v1_June_2023_1_0_0_1.zip).

### Delegated deployment samples

This download contains sample cloud flows for managing approvals and sharing deployed canvas apps and flows within the target environment. For more information, see [Download sample solution](https://aka.ms/DownloadDelegatedDeploymentSamples).

## Next steps

- [Run pipelines in Power Platform](run-pipeline.md)

### Related content

- [Extend a pipeline in Microsoft Power Platform - Learn Module](/training/modules/extend-pipeline/)
- [What are cloud flows?](/power-automate/overview-cloud)<br/>
- [Use Dataverse connector with cloud flows](/power-automate/dataverse/overview)
