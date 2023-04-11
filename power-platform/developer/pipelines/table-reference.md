---
title: "Pipeline table reference | Microsoft Learn"
description: "Includes schema information for tables used in the pipeline solution."
ms.date: 03/01/2023
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---
# Pipeline table reference

This article contains the table definitions used in the Pipeline solution. More information: [Overview of pipelines in Power Platform](../../alm/pipelines.md)

:::image type="content" source="media/pipeline-tables.png" alt-text="Diagram showing relationship between pipeline tables":::

> [!NOTE]
> For brevity, common columns found on all tables are not included here. The schema name for these columns are: `CreatedBy`, `CreatedOn`, `CreatedOnBehalfBy`, `ImportSequenceNumber`, `ModifiedBy`, `ModifiedOn`, `ModifiedOnBehalfBy`, `OverriddenCreatedOn`, `OwningBusinessUnit`, `OwningTeam`, `OwningUser`, `TimeZoneRuleVersionNumber`, `UTCConversionTimeZoneCode`, `VersionNumber`, and `statecode`.

## DeploymentArtifact (Deployment Artifact)

Stores solution artifacts that are exported when running pipelines.

|SchemaName<br/>Display Name |Type  |Description  |
|---------|---------|---------|
|`ArtifactVersion`<br/>**Artifact Version** |String|Stores the artifact version number.|
|`DeploymentArtifactId`<br/>**DeploymentArtifact**|Uniqueidentifier|Unique identifier for entity instances.|
|`GeneratedOn`<br/>**Generated On** |DateTime|Date and time when the artifact record was generated.|
|`Name`<br/>**Name** |String|The name of the artifact record.|
|`OwnerId`<br/>**Owner** |Owner|Owner ID|
|`statuscode`<br/>**Status Reason**|Status|Reason for the status of the Deployment Artifact.<br />Value:`1` Label: Active<br />Value:`2` Label: Inactive|
|`ArtifactFile`<br/>**Managed Artifact File**|File|Stores the managed version of the artifact.<br />**Not valid for Create**|
|`ArtifactFileUnmanaged`<br/>**Unmanaged Artifact File**|File|Unmanaged Artifact File.<br />**Not valid for Create**|

## DeploymentEnvironment (Deployment Environment)

Stores the environments that are participating in pipelines and configured in the deployment stages.

|SchemaName<br/>Display Name |Type  |Description  |
|---------|---------|---------|
|`DeploymentEnvironmentId`<br/>**Deployment Environment** | Uniqueidentifier| Unique identifier for deployment environment instances|
|`EnvironmentId`<br/>**Environment ID**| String| The Environment ID of the Power Platform environment.|
|`EnvironmentType`<br/>**Environment Type**|Picklist| Indicates if the environment is used for development or as a target environment that a pipeline will deploy to.<br />Value: `200000000` Label: Development Environment<br />Value: `200000001` Label: Target Environment |
|`ErrorMessage`<br/>**Error Message**| String| Stores the Power Platform environment validation failure error messages.|
|`name`<br/>**Name**|String|The name of the Deployment Environment.|
|`OwnerId`<br/>**Owner**| Owner| Owner ID|
|`statuscode`<br/>**Status Reason**|Status| Reason for the status of the Deployment Environment.<br />Value:`1` Label: Active<br />Value:`2` Label: Inactive|
|`ValidationStatus`<br/>Validation Status|Picklist|Indicates if the Environment ID of the Power Platform environment has been validated. <br />**Not valid for Create**<br />Value:`200000000` Label: Pending<br />Value:`200000001` Label: Success<br />Value:`200000002` Label: Failed|

## DeploymentPipeline (Deployment Pipeline)

Stores the pipeline configurations.

|SchemaName<br/>Display Name |Type  |Description  |
|---------|---------|---------|
|`DeploymentPipelineId`<br/>**Deployment Pipeline** |Uniqueidentifier | Unique identifier for the pipeline instances|
|`Description`<br/>**Description**|String| Custom description of the pipeline.|
|`Name`<br/>**Name**|String| The name of the pipeline record.|
|`OwnerId`<br/>**Owner**|Owner| Owner ID|
|`statuscode`<br/>**Status Reason**|Status| Reason for the status of the deployment pipeline.<br />Value:`1` Label: Active<br />Value:`2` Label: Inactive |

## DeploymentStage (Deployment Stage)

Stores the deployment stage configuration such as target environment and prerequisite deployment stages.

|SchemaName<br/>Display Name |Type  |Description  |
|---------|---------|---------|
|`DeploymentPipelineId`<br/>**Deployment Pipeline**| Lookup| Lookup to the pipeline that this stage belongs to.|
|`DeploymentStageId`<br/>**Deployment Stage ID**| Uniqueidentifier| Unique identifier for the Deployment Stage instance.|
|`Description`<br/>**Description**| String| Custom description of the deployment stage instance.|
|`Name`<br/>**Name**|String| The name of the deployment stage instance.|
|`OwnerId`<br/>**Owner**|Owner| Owner ID|
|`PreviousDeploymentStageId`<br/>**Previous Deployment Stage**| Lookup| Lookup to the previous deployment stage configured in the pipeline. Previous deployment stages must be run successfully before deployments can be run for the current stage.|
|`statuscode`<br/>**Status Reason**| Status| Reason for the status of the Deployment Stage.<br />Value:`1` Label: Active<br />Value:`2` Label: Inactive|
|`TargetDeploymentEnvironmentId`<br/>**Target Deployment Environment ID**| Lookup| Lookup to the target deployment environment associated with this deployment stage.|

## DeploymentStageRun (Deployment Stage Run)

Stores information about a deployment stage execution.

|SchemaName<br/>Display Name |Type  |Description  |
|---------|---------|---------|
|`ArtifactDevCurrentVersion`<br/>**Solution Artifact Current Version**| String| Stores the current version of the solution artifact within a development environment.|
|`ArtifactId`<br/>**Artifact ID**| Lookup| Internal use only.|
|`ArtifactName`<br/>**Artifact Name**| String| The name of the Deployment Artifact being deployed by a Stage Run instance.|
|`ArtifactVersion`<br/>**Solution Artifact Version**| String| The version number of the Deployment Artifact being deployed by a Stage Run instance.|
|`DeploymentSettingsJson`<br/>**Deployment Settings JSON**| String| Validated JSON payload storing the Connection Reference and Environment Variable information collected when a Deployment Stage is run. |
|`DeploymentStageId`<br/>**Deployment Stage**| Lookup| Lookup to the Deployment Stage associated with a Deployment Stage Run instance.|
|`DeploymentStageRunId`<br/>**Deployment Stage Run**| Uniqueidentifier | Unique identifier for Deployment Stage Run instances.|
|`DevDeploymentEnvironment`<br/>**Development Deployment Environment ID** | Lookup| Lookup to the development Deployment Environment associated with a Deployment Stage Run.|
|`DevEnvironmentId`<br/>**Dev Environment Id**| String| For internal use only.|
|`EndTime`<br/>**End Time**| DateTime| Date and time when the deployment succeeded or failed.|
|`ErrorMessage`<br/>**Error Message**| String| Stores the deployment failure messages for a stage run instance.|
|`Name`<br/>**Name**| String| The name of a Deployment Stage Run. This is auto-generated based on the stage name, the artifact name, and the artifact version number. |
|`Operation`<br/>**Operation**| Picklist| Indicates the current operation the deployment.<br />Value: `200000200` Label: None<br />Value: `200000201` Label: Validate<br />Value: `200000202` Label: Deploy|
|`OperationDetails`<br/>**Operation Details**| String| Stores the details of the current deployment operation.|
|`OperationStatus`<br/>**Operation Status**| Picklist| Stores the status of the current deployment operation.<br />Value: `200000000` Label: NotStarted<br />Value: `200000001` Label: Started<br />Value: `200000002` Label: Succeeded<br />Value: `200000003` Label: Failed<br />Value: `200000004` Label: Pending|
|`OwnerId`<br/>**Owner**| Owner| Owner ID|
|`RetryCount`<br/>**Retry Count**| Integer| For internal use only.|
|`StageRunStatus`<br/>**Stage Run Status**| Picklist| Indicates the overall status of a Deployment Stage Run.<br />Value: `200000000` Label: NotStarted<br />Value: `200000001` Label: Started<br />Value: `200000002` Label: Succeeded<br />Value: `200000003` Label: Failed|
|`StartTime`<br/>**Start Time**| DateTime| Date and time when the deployment started.|
|`statuscode`<br/>**Status Reason**| Status| Reason for the status of the Deployment Stage Run.<br />Value:`1` Label: Active<br />Value:`2` Label: Inactive|
|`SubOperation`<br/>**SubOperation**| Picklist| Represents the sub operation of the current deployment operation. This is managed internally.<br />Value: `200000100` Label: None<br />Value: `200000101` Label: Executing Pre-step<br />Value: `200000102` Label: Retrieving Artifact Configuration<br />Value: `200000103` Label: Validating Artifact Configuration<br />Value: `200000104` Label: Retrieving Artifact<br />Value: `200000105` Label: Deploying Artifact<br />Value: `200000106` Label: Executing Post-step|
|`TargetDeploymentEnvironment`<br/>**Target Deployment Environment ID**| Lookup| Lookup to the target Deployment Environment associated with a Deployment Stage Run.|
|`TargetEnvironmentId`<br/>**Target Environment Id**| String| For internal use only.|
|`ValidationResults`<br/> **Validation Results**| String| Stores the artifact validation response.|

## DeploymentStageRunStatus (Deployment Stage Run Suboperations)

Stores background operation information for a Deployment Stage Run.

|SchemaName<br/>Display Name |Type  |Description  |
|---------|---------|---------|
|`DeploymentStageRunId`<br/>**Deployment Stage Run**| Lookup| Lookup to the owning Deployment Stage Run instance.|
|`DeploymentStageRunStatusId`<br/>**Deployment Stage Run Suboperation ID** |Uniqueidentifier| Unique identifier for Deployment Stage Run Suboperation instances.|
|`Details`<br/>**Details**|String| Stores information about the Deployment Stage Run Suboperation.|
|`EndTime`<br/>**End Time**| DateTime| Date and Time when the deployment operation succeeded or failed.|
|`ErrorMessage`<br/>**Error Message**| String| Stores any error message associated with the Deployment Stage Run Suboperation.|
|`Name`<br/>**Name**|String| The name of the Deployment Stage Run Suboperation. This is managed internally.|
|`Operation`<br/>**Operation**| Picklist| Stores information about the deployment operation being run.<br />Value: `200000200` Label: None<br />Value: `200000201` Label: Validate<br />Value: `200000202` Label: Deploy|
|`OperationStatus`<br/>**Operation Status**| Picklist| Stores the status of the deployment sub operation.<br />Value: `200000000` Label: NotStarted<br />Value: `200000001` Label: Started<br />Value: `200000002` Label: Succeeded<br />Value: `200000003` Label: Failed<br />Value: `200000004` Label: Pending|
|`OwnerId`<br/>**Owner**| Owner| Owner ID|
|`RetryCount`<br/>**Retry Count**| Integer| For internal use only.|
|`StartTime`<br/>**Start Time**| DateTime| Date and time when the deployment operation started.|
|`statuscode`<br/>**Status Reason**| Status| Reason for the status of the Deployment Stage Run Status.<br />Value:`1` Label: Active<br />Value:`2` Label: Inactive|
|`SubOperation`<br/>**Suboperation**| Picklist| Stores additional information about the background operation.<br />Value: `200000100` Label: None<br />Value: `200000101` Label: Executing Pre-step<br />Value: `200000102` Label: Retrieving Artifact Configuration<br />Value: `200000103` Label: Validating Artifact Configuration<br />Value: `200000104` Label: Retrieving Artifact<br />Value: `200000105` Label: Deploying Artifact<br />Value: `200000106` Label: Executing Post-step|

### See Also

[Overview of pipelines in Power Platform](../../alm/pipelines.md)<br />

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
