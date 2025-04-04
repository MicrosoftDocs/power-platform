---
title: Microsoft Power Platform CLI pcf command group| Microsoft Docs
description: "Describes commands and parameters for the Microsoft Power Platform CLI pcf command group."
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
# pac pcf

Commands for working with Power Apps component framework projects

[!INCLUDE [pcf-intro](includes/pcf-intro.md)]

## Commands

|Command|Description|
|---------|---------|
|[pac pcf init](#pac-pcf-init)|Initializes a directory with a new Power Apps component framework project|
|[pac pcf push](#pac-pcf-push)|Import the Power Apps component framework project into the current Dataverse organization|
|[pac pcf version](#pac-pcf-version)|Patch version for controls|


## pac pcf init

Initializes a directory with a new Power Apps component framework project

[!INCLUDE [pcf-init-intro](includes/pcf-init-intro.md)]


### Optional Parameters for pcf init

#### `--framework` `-fw`

The rendering framework for control. The default value is 'none', which means HTML.

Use one of these values:

- `none`
- `react`

#### `--name` `-n`

The name for the component.

**Note**: Only characters within the ranges [A - Z], [a - z] or [0 - 9] are allowed. The first character may not be a number.

#### `--namespace` `-ns`

The namespace for the component.

**Note**: Only characters within the ranges [A - Z], [a - z], [0 - 9], or '.' are allowed. The first and last character may not be the '.' character. Consecutive '.' characters are not allowed. Numbers are not allowed as the first character or immediately after a period.

#### `--outputDirectory` `-o`

Output directory

#### `--run-npm-install` `-npm`

Auto run 'npm install' after the control is created. The default value is 'false'.

This parameter requires no value. It's a switch.

#### `--template` `-t`

Choose a template for the component.

Use one of these values:

- `field`
- `dataset`

[!INCLUDE [pcf-init-remarks](includes/pcf-init-remarks.md)]

## pac pcf push

Import the Power Apps component framework project into the current Dataverse organization

[!INCLUDE [pcf-push-intro](includes/pcf-push-intro.md)]


### Optional Parameters for pcf push

#### `--environment` `-env`

Specifies the target Dataverse. The value may be a Guid or absolute https URL. When not specified, the active organization selected for the current auth profile will be used.

#### `--force-import` `-f`

**Deprecated**: This parameter is ignored.
#### `--incremental` `-inc`

Pushes only files which are different using entity updates.

This parameter requires no value. It's a switch.

#### `--interactive` `-i`

Indicates that actions in the build are allowed to interact with the user. Don't use this argument in an automated scenario where interactivity is not expected.

This parameter requires no value. It's a switch.

#### `--publisher-prefix` `-pp`

Customization prefix value for the Dataverse solution publisher

**Note**: The prefix must be 2 to 8 characters long, can only consist of alpha-numerics, must start with a letter, and can't start with 'mscrm'.

#### `--solution-unique-name`

The unique name of the solution to add the component to.

#### `--verbosity` `-v`

Verbosity level for MSBuild when building the temporary solution wrapper.

Use one of these values:

- `minimal`
- `normal`
- `detailed`
- `diagnostic`

[!INCLUDE [pcf-push-remarks](includes/pcf-push-remarks.md)]

## pac pcf version

Patch version for controls

[!INCLUDE [pcf-version-intro](includes/pcf-version-intro.md)]


### Optional Parameters for pcf version

#### `--allmanifests` `-a`

Updates patch version for all 'ControlManifest.xml' files

This parameter requires no value. It's a switch.

#### `--filename` `-fn`

Tracker CSV file name to be used when using filetracking as a strategy. The default value is 'ControlsStateVersionInfo.csv'.

#### `--patchversion` `-pv`

Patch version for controls

**Note**: The value must be an integer with minimum value of 0.

#### `--path` `-p`

Absolute/Relative path of the 'ControlManifest.xml' for updating.

#### `--strategy` `-s`

Updates patch version for 'ControlManifest.xml' files using specified strategy. If using gittags, set a personal access token in the following environment variable "PacCli.PAT"

Use one of these values:

- `None`
- `GitTags`
- `FileTracking`
- `Manifest`

#### `--updatetarget` `-ut`

Specify which target manifest needs to be updated.

Use one of these values:

- `build`
- `project`

[!INCLUDE [pcf-version-remarks](includes/pcf-version-remarks.md)]

[!INCLUDE [pcf-remarks](includes/pcf-remarks.md)]

### See also

[Microsoft Power Platform CLI Command Groups](index.md)<br />
[Microsoft Power Platform CLI overview](../introduction.md)