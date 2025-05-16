---
title: "Test command migration process for Test Engine (preview)"
description: "Learn about the process of transitioning Test command between versions of Test Engine"
author: snamilikonda
ms.author: snamilikonda
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Migration Guide (preview)

[This article is prerelease documentation and is subject to change.]

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

## Overview

This document provides guidance on any transition steps required for running the latest version of the Power Platform Test Engine as part of an update to the version of the Power Platform CLI (PAC CLI). Follow the steps outlined below to ensure a smooth transition.

## Prerequisites

- Ensure you have a backup of your current configuration and test files.

## Migrating from older versions to 1.43 and later

Version 1.43 of the Power Platform CLI (PAC CLI) introduces significant updates and breaking changes to the [test run command](../developer/cli/reference/test.md#pac-test-run).
Alternatively, follow guidance to [Check which version of Power Platform CLI is installed](../developer/cli/introduction.md#check-which-version-of-power-platform-cli-is-installed) and choose appropriate version based on related PAC CLI installation documents.

Follow these steps to migrate:

1. **Authentication updates**  
   Older versions used an environment variable for password. After version 1.43, the test run command depends on browser based authentication to be compatible with multifactor authentication mechanisms (MFA). In the test settings of the test plan file, ensure that the `headless` property is set to false to be able to see the browser and interactively sign-in for the initial sign in.

   There are two authentication providers `Storagestate` (default, no need to specify explicitly) and `Dataverse` which can be set using the `--user-auth` parameter in the [test run command](../developer/cli/reference/test.md#pac-test-run). `Storagestate` mechanism can be used in local Windows scenarios only. `Dataverse` can be used in local and pipeline execution scenarios and requires other setup.

   [Learn more about authentication](authentication.md).


1. **File system access restrictions**  
   Extra restrictions are applied to the Test engine to ensure that files can't be accessed from certain locations on the file system. Ensure test files and results aren't located in one of the restricted locations as outlined in [file access restrictions](filerestrictions.md).

## Other Resources

[Power Apps Test Engine release notes](https://github.com/microsoft/PowerApps-TestEngine/releases)  
[Power Apps Test Engine YAML format (preview)](yaml.md)  
[Power Apps Test Engine Power Fx functions (preview)](powerfx.md)
