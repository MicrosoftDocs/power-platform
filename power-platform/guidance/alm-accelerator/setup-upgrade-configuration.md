---
title: Upgrade the ALM Accelerator
description: Learn how to install new releases of the ALM Accelerator for Power Platform.
ms.topic: upgrade-and-migration-article
ms.date: 04/13/2023
ms.subservice: guidance-toolkit
author: rsantos00
ms.author: rusant
ms.reviewer: sericks
ms.custom: bap-template
---

# Upgrade the ALM Accelerator

We periodically release updates of the ALM Accelerator for Power Platform. When a new version of the solution is available, follow the steps in this article to upgrade it. Upgrade the pipeline templates separately using the [pipeline sync template](setup-pipeline-sync.md) that's included with the ALM Accelerator solution.

Don't use these instructions to install the ALM Accelerator for the first time. Instead, follow one of these guides:

- [Configure the ALM Accelerator using the admin app](setup-admin-tasks.md)
- [Configure the ALM Accelerator manually](setup-components-manually.md)

## Download the latest release

The solution version number indicates the date of the release. For example, version *1.0.20220406.1* means version 1.0, created on 20220406 (yyyyMMdd), or April 6, 2022.

Download the latest managed solution file from [GitHub](https://github.com/microsoft/coe-starter-kit/releases). Scroll down to **Assets** and select *CenterofExcellenceALMAccelerator_\<latest version\>_managed.zip*.

## Install the ALM Accelerator solution

1. Sign in to [Power Apps](https://make.powerapps.com), and then select the environment that hosts the ALM Accelerator app.

1. In the left side panel, select **Solutions**.

1. Select **Import solution** > **Browse**, and then browse to the location of the managed solution you downloaded and select the file.

1. Select **Next**.

1. Select **Advanced settings**, and then select **Update**.

1. Select **Import**.

## Reactivate the Azure DevOps custom connector

1. Select **Data** > **Custom Connectors** > **CustomAzureDevOps**.

1. Select **Edit**.

1. On the **Definition** tab, confirm there are six policies that are configured as described in [the following section](#verify-the-azure-devops-custom-connector-policies).

1. On the **Security** tab, select **Edit**, and then set the following values:

   - **Identity provider**: **Microsoft Entra ID**
   - **Client ID**: The **Application (client) ID** from [the app registration](setup-admin-tasks.md#create-an-app-registration-in-your-microsoft-entra-environment)
   - **Client secret**: The **Application (client) secret value** from [the app registration](setup-admin-tasks.md#create-an-app-registration-in-your-microsoft-entra-environment)
   - **Resource URL**: The **DevOps Application (client) ID** from [the app registration](setup-admin-tasks.md#create-an-app-registration-in-your-microsoft-entra-environment)

1. On the **Test** tab, select **Test operation**.

1. Confirm the **Response Status** returned is **200**.

1. Select **Update connector**.

1. [Update the ALM Accelerator pipeline templates](setup-pipeline-sync.md).

## Verify the Azure DevOps custom connector policies

You should have six policies on the **Definition** tab in the CustomAzureDevOps custom connector. Make sure they're defined as described in the following tables. You might need to create missing policies or change values to match the specifications that follow. Pay attention to the `Operations` field, which can sometimes be set to empty after an upgrade.

Set host to `https://vssps.dev.azure.com` policy:

| Field | Value |
| ----- | ----- |
| Name | Set host to `https://vssps.dev.azure.com` |
| Template | Set host URL |
| Operations | GetUsers, GetIdentities |
| URL Template | `https://vssps.dev.azure.com` |

Set host to `https://app.vssps.visualstudio.com` policy:

| Field | Value |
| ----- | ----- |
| Name | Set host to `https://app.vssps.visualstudio.com` |
| Template | Set host URL |
| Operations | GetOrganizations, GetUserCurrentProfile |
| URL Template | `https://app.vssps.visualstudio.com` |

Convert Build Definition Variables to Array policy:

| Field | Value |
| ----- | ----- |
| Name | Convert Build Definition Variables to Array |
| Template | Convert an object to an array (Preview) |
| Operations | |
| Target object or collection path | @body().value |
| Property subpath | variables |
| Path of the new property | @item().variables |
| Property name for the key | key |
| Property name for the value | value |
| Run policy on | Response |

Set host to `https://vsaex.dev.azure.com` policy:

| Field | Value |
| ----- | ----- |
| Name | Set host to `https://vsaex.dev.azure.com` |
| Template| Set host URL |
| Operations | RemoveMemberFromGroup, AddMemberToGroup |
| URL Template | `https://vsaex.dev.azure.com` |

Set method to POST policy:

| Field | Value |
| ----- | ----- |
| Name | Set method to POST |
| Template| Route request |
| Operations | RunSyncPipeline |
| New path | <*organization*>/<*project*>/_apis/pipelines/<*pipelineId*>/runs
| Method | POST |

Set method to GET for ListItems policy:

| Field | Value |
| ----- | ----- |
| Name| Set method to GET for ListItems |
| Template| Route request |
| Operations | ListItems
| New path | <*organization*>/<*project*>/_apis/git/repositories/<*repo*>/items |
| Method | GET |
