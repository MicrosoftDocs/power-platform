---
title: Microsoft Power Platform CLI admin command group| Microsoft Docs
description: "Describes commands and parameters for the Microsoft Power Platform CLI admin command group."
keywords: "pac cli"
ms.subservice: developer
author: laneswenka
ms.author: laswenka
ms.reviewer: jdaly
ms.topic: generated-reference
contributors: 
 - JimDaly
---
<!-- 
Do not edit this file. 
This file is generated by a program and any changes will be overwritten when this topic is re-generated.
Use the include files to add additional content to this topic.
-->
# pac admin

Work with your Power Platform Admin Account

[!INCLUDE [admin-intro](includes/admin-intro.md)]

## Commands

|Command|Description|
|---------|---------|
|[pac admin add-group](#pac-admin-add-group)|Add environment to a group.|
|[pac admin application list](#pac-admin-application-list)|List Microsoft Entra ID applications registered under your tenant.|
|[pac admin application register](#pac-admin-application-register)|Register Microsoft Entra ID application with your tenant.|
|[pac admin application unregister](#pac-admin-application-unregister)|Unregister Microsoft Entra ID application from your tenant.|
|[pac admin assign-group](#pac-admin-assign-group)|Assign group to target Dataverse environment with specified security role.|
|[pac admin assign-user](#pac-admin-assign-user)|Assign a user to a target Dataverse environment with specified security role.|
|[pac admin backup](#pac-admin-backup)|Takes a manual backup of your environment.|
|[pac admin copy](#pac-admin-copy)|Copy Source Environment to Destination Environment.|
|[pac admin create](#pac-admin-create)|Creates a Dataverse instance in your tenant.|
|[pac admin create-service-principal](#pac-admin-create-service-principal)|Add Microsoft Entra ID application and associated application user to the Dataverse environment.|
|[pac admin delete](#pac-admin-delete)|Deletes the environment from your tenant.|
|[pac admin list](#pac-admin-list)|List all environments from your tenant.|
|[pac admin list-app-templates](#pac-admin-list-app-templates)|Lists all supported Dataverse templates of model-driven apps in Dynamics 365.|
|[pac admin list-backups](#pac-admin-list-backups)|Lists all backups of your environment.|
|[pac admin list-groups](#pac-admin-list-groups)|List environment groups from your tenant.|
|[pac admin list-service-principal](#pac-admin-list-service-principal)|List Microsoft Entra ID applications which have access to Dataverse.|
|[pac admin list-tenant-settings](#pac-admin-list-tenant-settings)|List tenant settings.|
|[pac admin reset](#pac-admin-reset)|Reset the environment from your tenant.|
|[pac admin restore](#pac-admin-restore)|Restores an environment to a given backup.|
|[pac admin set-backup-retention-period](#pac-admin-set-backup-retention-period)|Sets the backup retention period in days as provided. Valid values are: 7, 14, 21, 28.|
|[pac admin set-governance-config](#pac-admin-set-governance-config)|Enable, disable, and edit managed environments.|
|[pac admin set-runtime-state](#pac-admin-set-runtime-state)|Update environment administration mode.|
|[pac admin status](#pac-admin-status)|This command lists the status of all the operations in progress.|
|[pac admin update-tenant-settings](#pac-admin-update-tenant-settings)|Update tenant settings.|


## pac admin add-group

Add environment to a group.

[!INCLUDE [admin-add-group-intro](includes/admin-add-group-intro.md)]


### Required Parameters for admin add-group

#### `--environment-group` `-eg`

Environment group.


### Optional Parameters for admin add-group

#### `--environment` `-env`

Environment (ID, org ID, url, unique name, or partial name).

[!INCLUDE [admin-add-group-remarks](includes/admin-add-group-remarks.md)]

## pac admin application list

List Microsoft Entra ID applications registered under your tenant.

[!INCLUDE [admin-application-list-remarks](includes/admin-application-list-remarks.md)]

## pac admin application register

Register Microsoft Entra ID application with your tenant.

[!INCLUDE [admin-application-register-intro](includes/admin-application-register-intro.md)]


### Required Parameters for admin application register

#### `--application-id` `-id`

Application Id

[!INCLUDE [admin-application-register-remarks](includes/admin-application-register-remarks.md)]

## pac admin application unregister

Unregister Microsoft Entra ID application from your tenant.

[!INCLUDE [admin-application-unregister-intro](includes/admin-application-unregister-intro.md)]


### Required Parameters for admin application unregister

#### `--application-id` `-id`

Application Id

[!INCLUDE [admin-application-unregister-remarks](includes/admin-application-unregister-remarks.md)]

## pac admin assign-group

Assign group to target Dataverse environment with specified security role.

[!INCLUDE [admin-assign-group-intro](includes/admin-assign-group-intro.md)]


### Required Parameters for admin assign-group

#### `--group` `-g`

Microsoft Entra ID object ID of group to assign to target Dataverse environment.

#### `--group-name` `-gn`

Name of the group or team to create in Dataverse.

#### `--membership-type` `-mt`

Team membership type.

Use one of these values:

- `MembersAndGuests`
- `Members`
- `Owners`
- `Guests`

#### `--role` `-r`

Name or ID of security role to be applied to user

#### `--team-type` `-tt`

Type of team.

Use one of these values:

- `Owner`
- `Access`
- `AadSecurityGroup`
- `AadOfficeGroup`


### Optional Parameters for admin assign-group

#### `--business-unit` `-bu`

ID of business unit to associate application user with.

#### `--environment` `-env`

ID or URL of the environment to assign a user to.

[!INCLUDE [admin-assign-group-remarks](includes/admin-assign-group-remarks.md)]

## pac admin assign-user

Assign a user to a target Dataverse environment with specified security role.

[!INCLUDE [admin-assign-user-intro](includes/admin-assign-user-intro.md)]


### Required Parameters for admin assign-user

#### `--role` `-r`

Name or ID of security role to be applied to user

#### `--user` `-u`

Object ID or user principal name (UPN) of Microsoft Entra ID user to be assigned to the environment or Application ID if assigning an Application User.


### Optional Parameters for admin assign-user

#### `--application-user` `-au`

Specifies whether the input user is an application user. If a business unit isn't specified, the application user is added to the authenticated users business unit.

This parameter requires no value. It's a switch.

#### `--async` `-a`

**Deprecated**: This parameter is ignored.
#### `--business-unit` `-bu`

ID of business unit to associate application user with.

#### `--environment` `-env`

ID or URL of the environment to assign a user to.

[!INCLUDE [admin-assign-user-remarks](includes/admin-assign-user-remarks.md)]

## pac admin backup

Takes a manual backup of your environment.

[!INCLUDE [admin-backup-intro](includes/admin-backup-intro.md)]


### Required Parameters for admin backup

#### `--label` `-l`

Sets the backup label as provided.


### Optional Parameters for admin backup

#### `--environment` `-env`

Environment URL or ID of the Environment that requires backup.

[!INCLUDE [admin-backup-remarks](includes/admin-backup-remarks.md)]

## pac admin copy

Copy Source Environment to Destination Environment.

[!INCLUDE [admin-copy-intro](includes/admin-copy-intro.md)]


### Optional Parameters for admin copy

#### `--async` `-a`

Optional boolean argument to run pac verbs asynchronously, defaults to false.

This parameter requires no value. It's a switch.

#### `--max-async-wait-time` `-wt`

Max asynchronous wait time in minutes. The default value is 60 minutes.

#### `--name` `-n`

Name of the target environment.

#### `--skip-audit-data` `-sa`

Switch indicating whether audit data should be skipped

This parameter requires no value. It's a switch.

#### `--source-env` `-se`

Environment URL or ID of the source environment that is being copied

#### `--target-env` `-te`

Environment URL or ID of the target environment.

#### `--type` `-t`


Use one of these values:

- `MinimalCopy`
- `FullCopy`

[!INCLUDE [admin-copy-remarks](includes/admin-copy-remarks.md)]

## pac admin create

Creates a Dataverse instance in your tenant.

[!INCLUDE [admin-create-intro](includes/admin-create-intro.md)]


### Required Parameters for admin create

#### `--type` `-t`

Sets the environment Type.

Use one of these values:

- `Trial`
- `Sandbox`
- `Production`
- `Developer`
- `Teams`
- `SubscriptionBasedTrial`


### Optional Parameters for admin create

#### `--async` `-a`

Optional boolean argument to run pac verbs asynchronously, defaults to false.

This parameter requires no value. It's a switch.

#### `--currency` `-c`

Sets the currency used for your environment. [defaults to USD]

#### `--domain` `-d`

The domain name is part of the environment URL. If domain name is already in use, a numeric value is appended to the domain name. For example: If 'contoso' is already in use, then the environment URL is updated to https://{contoso}0.crm.dynamics.com.

**Note**: Only characters within the ranges [A - Z], [a - z], [0 - 9], or '-' are allowed. The first and last character can't be the '-' character. Consecutive '-' characters aren't allowed.

#### `--input-file` `-if`

The verb arguments to be passed in a .json input file. For example: {"name" : "contoso"}. The arguments passed through command-line will take precedence over arguments from the .json input file.

#### `--language` `-l`

Sets the language used for your environment. [defaults to English]

#### `--max-async-wait-time` `-wt`

Max asynchronous wait time in minutes. The default value is 60 minutes.

#### `--name` `-n`

Sets the name of the environment.

#### `--region` `-r`

Sets the environment's region name. [defaults to unitedstates]

#### `--security-group-id` `-sgid`

Microsoft Entra ID Security Group Id or Microsoft 365 Group Id (required for Teams environment).

**Note**: The Security Group Id must be a valid Guid.

#### `--templates` `-tm`

Sets the Dynamics 365 app that needs to be deployed, passed as comma separated values. For example: -tm "D365_Sample, D365_Sales"

#### `--user` `-u`

Object ID or user principal name (UPN) of Microsoft Entra ID user to be assigned to the environment.

[!INCLUDE [admin-create-remarks](includes/admin-create-remarks.md)]

## pac admin create-service-principal

Add Microsoft Entra ID application and associated application user to the Dataverse environment.

[!INCLUDE [admin-create-service-principal-intro](includes/admin-create-service-principal-intro.md)]


### Optional Parameters for admin create-service-principal

#### `--environment` `-env`

Environment (ID, org ID, url, unique name, or partial name).

#### `--name` `-n`

Application name to create in Entra ID.

#### `--role` `-r`

Name or ID of security role to be applied to application user. The default value is: 'System Administrator'.

[!INCLUDE [admin-create-service-principal-remarks](includes/admin-create-service-principal-remarks.md)]

## pac admin delete

Deletes the environment from your tenant.

[!INCLUDE [admin-delete-intro](includes/admin-delete-intro.md)]


### Optional Parameters for admin delete

#### `--async` `-a`

Optional boolean argument to run pac verbs asynchronously, defaults to false.

This parameter requires no value. It's a switch.

#### `--environment` `-env`

Environment URL or ID of the Environment that needs to be deleted from your tenant.

#### `--max-async-wait-time` `-wt`

Max asynchronous wait time in minutes. The default value is 60 minutes.

[!INCLUDE [admin-delete-remarks](includes/admin-delete-remarks.md)]

## pac admin list

List all environments from your tenant.

[!INCLUDE [admin-list-intro](includes/admin-list-intro.md)]


### Optional Parameters for admin list

#### `--application` `-a`

List all environments that have specified application installed. To specify application, use unique name or ID.

#### `--environment` `-env`

List all environments that contain given string in their name or ID.

#### `--name` `-n`

List all environments that contain given string in their name.

#### `--type` `-t`

List all environments with the given type.

Use one of these values:

- `Trial`
- `Sandbox`
- `Production`
- `Developer`
- `Teams`
- `SubscriptionBasedTrial`

[!INCLUDE [admin-list-remarks](includes/admin-list-remarks.md)]

## pac admin list-app-templates

Lists all supported Dataverse templates of model-driven apps in Dynamics 365.

[!INCLUDE [admin-list-app-templates-intro](includes/admin-list-app-templates-intro.md)]


### Optional Parameters for admin list-app-templates

#### `--region` `-r`

Sets the environment's region name. [defaults to unitedstates]

[!INCLUDE [admin-list-app-templates-remarks](includes/admin-list-app-templates-remarks.md)]

## pac admin list-backups

Lists all backups of your environment.

[!INCLUDE [admin-list-backups-intro](includes/admin-list-backups-intro.md)]


### Optional Parameters for admin list-backups

#### `--environment` `-env`

List all environments that contain a given string in their Environment ID or URL.

[!INCLUDE [admin-list-backups-remarks](includes/admin-list-backups-remarks.md)]

## pac admin list-groups

List environment groups from your tenant.

[!INCLUDE [admin-list-groups-remarks](includes/admin-list-groups-remarks.md)]

## pac admin list-service-principal

List Microsoft Entra ID applications which have access to Dataverse.

[!INCLUDE [admin-list-service-principal-intro](includes/admin-list-service-principal-intro.md)]


### Optional Parameters for admin list-service-principal

#### `--filter` `-f`

Application name 'starts with' filter.

#### `--max` `-m`

Max number of applications to show. Default: 20

[!INCLUDE [admin-list-service-principal-remarks](includes/admin-list-service-principal-remarks.md)]

## pac admin list-tenant-settings

List tenant settings.

[!INCLUDE [admin-list-tenant-settings-intro](includes/admin-list-tenant-settings-intro.md)]


### Optional Parameters for admin list-tenant-settings

#### `--settings-file` `-s`

The .json file to output tenant settings.

[!INCLUDE [admin-list-tenant-settings-remarks](includes/admin-list-tenant-settings-remarks.md)]

## pac admin reset

Reset the environment from your tenant.

[!INCLUDE [admin-reset-intro](includes/admin-reset-intro.md)]


### Optional Parameters for admin reset

#### `--async` `-a`

Optional boolean argument to run pac verbs asynchronously, defaults to false.

This parameter requires no value. It's a switch.

#### `--currency` `-c`

Sets the currency used for your environment. [defaults to USD]

#### `--domain` `-d`

The domain name is part of the environment URL. If domain name is already in use, a numeric value is appended to the domain name. For example: If 'contoso' is already in use, then the environment URL is updated to https://{contoso}0.crm.dynamics.com.

#### `--environment` `-env`

URL or ID of the Environment that needs to be reset.

#### `--input-file` `-if`

The verb arguments to be passed in a .json input file. For example: {"name" : "contoso"}. The arguments passed through command-line will take precedence over arguments from the .json input file.

#### `--language` `-l`

Sets the language used for your environment. [defaults to English]

#### `--max-async-wait-time` `-wt`

Max asynchronous wait time in minutes. The default value is 60 minutes.

#### `--name` `-n`

Sets the name of the environment.

#### `--purpose` `-p`

Sets the description used to associate the environment with a specific intent.

#### `--templates` `-tm`

Sets the Dynamics 365 app that needs to be deployed, passed as comma separated values. For example: -tm "D365_Sample, D365_Sales"

[!INCLUDE [admin-reset-remarks](includes/admin-reset-remarks.md)]

## pac admin restore

Restores an environment to a given backup.

[!INCLUDE [admin-restore-intro](includes/admin-restore-intro.md)]


### Required Parameters for admin restore

#### `--selected-backup` `-sb`

DateTime of the backup in 'mm/dd/yyyy hh:mm' format OR string 'latest'.


### Optional Parameters for admin restore

#### `--async` `-a`

Optional boolean argument to run pac verbs asynchronously, defaults to false.

This parameter requires no value. It's a switch.

#### `--max-async-wait-time` `-wt`

Max asynchronous wait time in minutes. The default value is 60 minutes.

#### `--name` `-n`

Optional name of the restored environment.

#### `--skip-audit-data` `-sa`

Switch indicating whether audit data should be skipped

This parameter requires no value. It's a switch.

#### `--source-env` `-se`

Environment URL or ID of the source environment required for restore.

#### `--target-env` `-te`

Environment URL or ID of the target environment required for restore. This would default to source URL/ID if not provided.

[!INCLUDE [admin-restore-remarks](includes/admin-restore-remarks.md)]

## pac admin set-backup-retention-period

Sets the backup retention period in days as provided. Valid values are: 7, 14, 21, 28.

[!INCLUDE [admin-set-backup-retention-period-intro](includes/admin-set-backup-retention-period-intro.md)]


### Required Parameters for admin set-backup-retention-period

#### `--backup-retention-period` `-br`

Sets the backup retention period in days as provided. Valid values are: 7, 14, 21, 28.


### Optional Parameters for admin set-backup-retention-period

#### `--async` `-a`

Optional boolean argument to run pac verbs asynchronously, defaults to false.

This parameter requires no value. It's a switch.

#### `--environment` `-env`

Environment URL or ID of the Environment that requires backup.

#### `--max-async-wait-time` `-wt`

Max asynchronous wait time in minutes. The default value is 60 minutes.

[!INCLUDE [admin-set-backup-retention-period-remarks](includes/admin-set-backup-retention-period-remarks.md)]

## pac admin set-governance-config

Enable, disable, and edit managed environments.

[!INCLUDE [admin-set-governance-config-intro](includes/admin-set-governance-config-intro.md)]


### Required Parameters for admin set-governance-config

#### `--environment` `-env`

URL or ID of the environment for which managed environments need to be enabled, disabled or edited.

#### `--protection-level` `-pl`

Set protection level : 'Standard' to enable managed environments, 'Basic' to disable managed environments.

Use one of these values:

- `Basic`
- `Standard`


### Optional Parameters for admin set-governance-config

#### `--checker-rule-overrides` `-cro`

Solution checker rule overrides

#### `--cloud-flows-limit` `-cfl`

Number of people that makers can share solution cloud flows with

#### `--cloud-flows-mode` `-cfm`

Solution cloud flows limit sharing mode

#### `--disable-group-sharing` `-dgs`

Disable group sharing.

This parameter requires no value. It's a switch.

#### `--exclude-analysis` `-ea`

Exclude usage insights for the environment from the weekly digest email.

This parameter requires no value. It's a switch.

#### `--include-insights` `-ii`

Include insights in the Power Platform Admin Center homepage cards.

This parameter requires no value. It's a switch.

#### `--limit-sharing-mode` `-lsm`

Limit sharing mode.

#### `--maker-onboarding-markdown` `-mom`

Maker onboarding markdown

#### `--maker-onboarding-url` `-mou`

Maker onboarding URL

#### `--max-limit-user-sharing` `-ml`

If group sharing is disabled, specify the number of people that makers can share canvas apps with.

#### `--solution-checker-mode` `-scm`

Solution checker validation mode.

Use one of these values:

- `none`
- `warn`
- `block`

#### `--suppress-validation-emails` `-sve`

Suppress validation emails

This parameter requires no value. It's a switch.

[!INCLUDE [admin-set-governance-config-remarks](includes/admin-set-governance-config-remarks.md)]

## pac admin set-runtime-state

Update environment administration mode.

[!INCLUDE [admin-set-runtime-state-intro](includes/admin-set-runtime-state-intro.md)]


### Required Parameters for admin set-runtime-state

#### `--environment` `-env`

URL or ID of the environment for which administration mode needs to be updated.

#### `--runtime-state` `-rs`

The environment runtime state

Use one of these values:

- `AdminMode`
- `Enabled`


### Optional Parameters for admin set-runtime-state

#### `--async` `-a`

Optional boolean argument to run pac verbs asynchronously, defaults to false.

This parameter requires no value. It's a switch.

#### `--background-operations` `-bo`

The environment background operations state

Use one of these values:

- `Enabled`
- `Disabled`

#### `--max-async-wait-time` `-wt`

Max asynchronous wait time in minutes. The default value is 60 minutes.

[!INCLUDE [admin-set-runtime-state-remarks](includes/admin-set-runtime-state-remarks.md)]

## pac admin status

This command lists the status of all the operations in progress.

[!INCLUDE [admin-status-remarks](includes/admin-status-remarks.md)]

## pac admin update-tenant-settings

Update tenant settings.

[!INCLUDE [admin-update-tenant-settings-intro](includes/admin-update-tenant-settings-intro.md)]


### Optional Parameters for admin update-tenant-settings

#### `--setting-name` `-n`

Name of the setting to be updated. For example: powerPlatform.helpSupportSettings.useSupportBingSearchByAllUsers

#### `--setting-value` `-v`

Value of the setting to be updated.

#### `--settings-file` `-s`

The .json file with tenant settings.

[!INCLUDE [admin-update-tenant-settings-remarks](includes/admin-update-tenant-settings-remarks.md)]

[!INCLUDE [admin-remarks](includes/admin-remarks.md)]

### See also

[Microsoft Power Platform CLI Command Groups](index.md)<br />
[Microsoft Power Platform CLI overview](../introduction.md)