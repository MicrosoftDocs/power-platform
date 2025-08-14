---
title: Deployment settings for the ALM Accelerator
description: Learn about the settings you can change to customize deployment pipelines with the ALM Accelerator for Power Platform.
ms.topic: concept-article
ms.date: 05/22/2023
ms.subservice: guidance-toolkit
author: mikefactorial
ms.author: rusant
ms.reviewer: sericks
ms.custom: bap-template
---

# Deployment settings for the ALM Accelerator

The ALM Accelerator [export pipeline](/power-platform/guidance/coe/almaccelerator-pipelines) uses the deployment settings payload to customize the deployment pipelines for a particular solution and environment. The deployment settings payload is a JSON string that's passed to the export pipeline as a parameter.

The following tables describe the deployment settings that are included in the payload for each deployment environment.

## Deployment pipeline settings

  | Setting | Required | Description |
  | ------- | -------- | ----------- |
  | ApprovalType | No | The type of approval to use in the deployment pipeline |
  | BuildName  | Yes | The name of the build pipeline |
  | BuildTemplate | No | The name of the build pipeline template |
  | DeploymentEnvironmentName | Yes | The name of the deployment environment |
  | DeploymentEnvironmentUrl | Yes | The URL of the deployment environment |
  | EnvironmentUrl | Yes | The URL of the development or maker environment |
  | ServiceConnectionName | Yes | The name of the service connection to the development or maker environment |
  | StepType | No | The type of step to use in the deployment pipeline |

### User settings

  | Setting | Required | Description |
  | ------- | -------- | ----------- |
  | environmentvariable.environment-variable-schema-name | No | Sets the value of environment variables in an environment during deployment. |
  | canvasshare.aadGroupId.canvas-app-schema-name | No | Sets the Microsoft Entra group ID for sharing the canvas app. When the canvas app is to be shared with multiple Microsoft Entra groups, a unique identifier of .1 or .2 can be added to the end of the setting. |
  | canvasshare.roleName.canvas-app-schema-name | No | Sets the role to assign to the Microsoft Entra group. Valid options are **CanView**, **CanViewAndShare**, and **CanEdit**. When the canvas app is to be shared with multiple Microsoft Entra groups, a unique identifier of .1 or .2 can be added to the end of the setting. |
  | owner.ownerEmail.flow-name.flow-id | No | Sets the owner of the flow assigned after the solution is imported into the deployment environment. |
  | flow.sharing.flow-name.flow-id  | No | Sets the Dataverse Microsoft Entra Group Team to share the process record associated with the flow after the solution is imported into the deployment environment. |
  | activateflow.activateas.flow-name.flow-id | No | Sets the user to impersonate when activating the flow. Otherwise, the connection creation user or the owner is used to activate the flow. |
  | activateflow.order.flow-name.flow-id | No | Sets the order in which to activate the flow, useful when activating parent/child flows. However, the pipelines attempt to activate flows as long as there are flows to activate if the order isn't set. |
  | activateflow.activate.flow-name.flow-id | No | In certain cases, flows may intentionally be left off in a deployment environment. This setting triggers the pipelines to turn on the flow or not when deployed. |
  | connector.teamname.connector-name.connector-id | No | Sets the Dataverse Microsoft Entra Group Team to share the connector record associated with the custom connector after the solution is imported into the deployment environment. |
  | groupTeam.teamid.aadGroupId | No | Sets the Dataverse Group Teams to create in the deployment environment. |
  | businessUnit.teamid.aadGroupId | No | Sets the Dataverse Business Unit associated with the Group Teams. |
  | webhookurl.webookname | No | Sets the URL of the webhook to update in the deployment environment. |
  | sdkstep.unsec.sdkstepid | No | Sets the unsecured configuration of the SDK step to update in the deployment environment. |
  | sdkstep.sec.sdkstepid | No | Sets the secure configuration of the SDK step to update in the deployment environment. |
  | TriggerSolutionUpgrade | No | Sets whether to apply the solution upgrade during deployment to the environment. |

UserSettings is an array of variables that are set on the deployment pipelines. When the export pipeline is run, the deployment settings and custom deployment settings files are generated using placeholders for these values. When the deployment pipeline is run, most of the placeholders are replaced with the values from the deployment settings payload. The exception is specific reserved pipeline variables, such as TriggerSolutionUpgrade, that aren't included in the deployment settings or custom deployment settings. Additionally, if UseDeploymentSettingsPlaceholders is set to False, the placeholders aren't used. Instead, the values are set directly in the deployment settings and custom deployment settings files.

## Deployment settings schema

The schema of the deployment settings is based on the components that require configuration after deployment in a Dataverse solution. It's updated when new capabilities are added to the ALM Accelerator. The schema is defined in the [*deployment-settings.schema.json*](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/deployment-settings.schema.json) file.

## Deployment settings sample payload

The sample payload is an example of a common payload for the ALM Accelerator pipelines. The sample payload is defined in the [*deployment-settings.sample.json*](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/deployment-settings.sample.json) file.

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
