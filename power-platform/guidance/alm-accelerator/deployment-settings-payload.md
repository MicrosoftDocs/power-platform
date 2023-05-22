---
title: "Deployment settings for the ALM Accelerator for Power Platform pipelines | MicrosoftDocs"
description: "Customizing the ALM Accelerator for Power Platform can be achieved in several ways without affecting the upgrade path of the solution and pipelines. This document describes the deployment settings payload for the ALM Accelerator pipelines for Microsoft Power Platform."
author: mikefactorial
ms.topic: conceptual
ms.date: 05/22/2023
ms.subservice: guidance
ms.author: rusant
ms.reviewer: sericks
---

# Deployment settings for the ALM Accelerator for Power Platform pipelines

ALM Accelerator components enable makers to apply source-control strategies with Azure DevOps. Makers can use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. The ALM accelerator helps makers switch quickly from developing solutions to source-controlling the solution and pushing their apps to other environments with as few interruptions to their work as possible.

The ALM accelerator doesn't have a dependency on other components of the CoE Starter Kit. It can be used independently.

The deployment settings payload for the ALM Accelerator export pipeline is used to customize the deployment settings used in the deployment pipelines for a particular solution and environment. The deployment settings payload is a JSON string that is passed to the export pipeline as a parameter. Included in the payload are the following deployment settings for each deployment environment (for example, Test, Production, etc.):

## Deployment pipeline settings

  | Setting                     | Required | Description |
  | -------                     | -------- | ----------- |
  | ApprovalType                | No       | The type of approval to use in the deployment pipeline. |
  | BuildName                   | Yes      | The name of the build pipeline. |
  | BuildTemplate               | No       | The name of the build pipeline template. |
  | DeploymentEnvironmentName   | Yes      | The name of the deployment environment. |
  | DeploymentEnvironmentUrl    | Yes      | The URL of the deployment environment. |
  | EnvironmentUrl              | Yes      | The URL of the development / maker environment. |
  | ServiceConnectionName       | Yes      | The name of the service connection to the development / maker environment. |
  | StepType                    | No       | The type of step to use in the deployment pipeline. |

### User Settings (array of pipeline variables)

  | Setting                                                                 | Required | Description |
  | -------                                                                 | -------- | ----------- |
  | environmentvariable.environment-variable-schema-name                    | No       | Used to set the value of environment variables in a deployment environment during deployment. |
  | canvasshare.aadGroupId.canvas-app-schema-name                           | No       | This setting is the Microsoft Azure Active Directory (Azure AD) group ID for sharing the canvas app. In cases where the canvas app is to be shared with multiple Azure AD groups a unique suffix of .1 or .2 can be added to the end of the setting to generate multiple. |
  | canvasshare.roleName.canvas-app-schema-name                             | No       | This setting is the role to assign to the Azure AD group above the valid options are CanView, CanViewAndShare and CanEdit. In cases where the canvas app is to be shared with multiple Azure AD groups a unique suffix of .1 or .2 can be added to the end of the setting similar to above.  |
  | owner.ownerEmail.flow-name.flow-id                                      | No       | The owner of the flow assigned after import of the solution in the deployment environment. |
  | flow.sharing.flow-name.flow-id                                          | No       | The Dataverse Azure AD Group Team to share the process record associated with the flow after import of the solution in the deployment environment. |
  | activateflow.activateas.flow-name.flow-id                               | No       | The user to impersonate when activating the flow. Otherwise the connection creation user or the owner will be used to activate the flow. |
  | activateflow.order.flow-name.flow-id                                    | No       | The order in which to activate the flow. Setting the order is useful when activating parent / child flows. However, the pipelines will attempt to activate flows as long as there are flows to activate if the order isn't set.  |
  | activateflow.activate.flow-name.flow-id                                 | No       | This configuration sets whether or not activate this flow. In certain cases flows may intentionally be left in an off state in a deployment environment. This setting will trigger the pipelines to either turn on the flow or not when deployed. |
  | connector.teamname.connector-name.connector-id                          | No       | The Dataverse Azure AD Group Team to share the connector record associated with the custom connector after import of the solution in the deployment environment. |
  | groupTeam.teamid.aadGroupId                                             | No       | Dataverse Group Teams to create in the deployment environment. |
  | businessUnit.teamid.aadGroupId                                          | No       | Dataverse Business Unit associated with the Group Teams being created by groupTeam.teamid.aadGroupId. |
  | webhookurl.webookname                                                   | No       | The URL of the webhook to update in the deployment environment. |
  | sdkstep.unsec.sdkstepid                                                 | No       | The unsecure configuration of the SDK step to update in the deployment environment. |
  | sdkstep.sec.sdkstepid                                                   | No       | The secure configuration of the SDK step to update in the deployment environment. |
  | TriggerSolutionUpgrade                                                  | No       | True or false based on whether to apply solution upgrade during deployment to this environment. |

### Deployment Settings Schema

The schema of the deployment settings is based on the various components that require post deployment configuration in a Dataverse solution and will be updated when new capabilities are added to the ALM Accelerator. The schema is defined in the [deployment-settings.schema.json](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/deployment-settings.schema.json) file.

### Deployment Settings Sample Payload

The sample payload contains an example of a common payload for the ALM Accelerator pipelines. The sample payload is defined in the [deployment-settings.sample.json](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/deployment-settings.sample.json) file. The data contained in this sample payload is passed to the [export pipeline as a parameter](/power-platform/guidance/coe/almaccelerator-pipelines). The UserSettings array contains a list of all of the deployment pipeline variables that are set on the deployment pipeline(s). When the export pipeline is run, the deployment settings and custom deployment settings files are generated using placeholders for these values. When the deployment pipeline is run, the placeholders are replaced with the values from the deployment settings payload. The only exception is specific reserved pipeline variables that are created on the pipeline, but not included in the deployment settings or custom deployment settings (for example, TriggerSolutionUpgrade). Additionally, if the UseDeploymentSettingsPlaceholders variable is set to false, the placeholders aren't used and the values are set directly in the deployment settings and custom deployment settings files.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
