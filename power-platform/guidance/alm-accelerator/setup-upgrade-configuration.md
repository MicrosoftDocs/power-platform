---
title: "Upgrade of ALM Accelerator for Power Platform | MicrosoftDocs"
description: "Upgrade the ALM accelerator for Microsoft Power Platform."
author: rsantos00
ms.topic: conceptual
ms.date: 04/13/2023
ms.subservice: guidance
ms.author: rusant
ms.reviewer: sericks
---
# Upgrade of ALM Accelerator for Power Platform

The ALM Accelerator for Power Platform, apart from the solution components, also uses pipeline templates that are updated in every release. This article describes the required steps to upgrade it.

## Before you start

If you're installing the ALM accelerator for the first time, [follow this link](/power-platform/guidance/coe/setup-almacceleratorpowerplatform) and skip this document.

In every release the version of the solution is updated to the date when was created, example: 1.0.20220406.1 would mean version 1.0 created on 20220406 (yyyyMMdd) April 6 of 2022.

## Download the latest release

Access the latest release of the ALM Accelerator for Power Platform [follow this link](https://github.com/microsoft/coe-starter-kit/releases/latest). The page describes the Change Log, and some instructions about the upgrade. At the end of the page, are the assets files created in the release, example: **centerofexcellencealmaccelerator_1.0.20220517.1_managed.zip**.

To get the latest tag of the pipelines [follow this link](https://github.com/microsoft/coe-alm-accelerator-templates) and select **tags** near the branch name, you should find the latest tag in the top of the list, example: **CenterofExcellenceALMAccelerator-March2023**.

## Installing the ALM Accelerator for Power Platform solution

Go to [Power Apps](https://make.powerapps.com) and select the environment you plan to use. Select **Solutions** -> **Import solution** -> **Browse** to select the location of the zip file downloaded in the previous section, example: **centerofexcellencealmaccelerator_1.0.20220517.1_managed.zip**. Select **Next** and expand the **Advanced settings**, make sure **Update** is selected. Select **Import** to finalize the upgrade.

When the import is completed, the reactivation of the **CustomAzureDevOps** custom connector needs to be done. The following steps need to be done.

1. Select **Data** > **Custom Connectors** and edit the **CustomAzureDevOps**.
2. Go to the Definition tab and verify if there are 6 **Policies** created and the information is accordingly to [this section](/power-platform/guidance/alm-accelerator/setup-upgrade-configuration#verify-the-customazuredevops-custom-connector-policies).
3. Go to the **Security** tab and select **Edit**.
4. Select **Azure Active Directory** as the **Identity Provider**.
5. Add your **ClientId**, **Client Secret**, and **ResourceUrl** according to [Configure the DevOps custom connector](/power-platform/guidance/alm-accelerator/setup-components-manually#configure-the-devops-custom-connector).
6. Select the **Test** tab and select **Test operation**.
7. Confirm the **status** of the response and select **Update connector** at the top.

> [!NOTE]
> If you already followed these steps before, you could run the **sync-pipeline-repo** pipeline with the new tag copied in the previous section, and **approve** and **complete** the pull request.
If it's the first time you are executing these steps, please continue.

## Updating the pipelines in Azure DevOps

To simplify this process, there's a pipeline template that automatically synchronizes your Azure DevOps repo with the pipeline template repo in the CoE Starter Kit GitHub repository. Use the following steps to get started using the pipeline sync pipeline.

1. In Azure DevOps, enter in the project you would like to update and go to **Pipelines**, then select **New pipeline**.

1. Select **Azure Repos Git** for your code repository, and point to the Azure DevOps repo you created and seeded with the pipeline templates.

1. On the **Configure your pipeline** page, select **Existing Azure Pipelines YAML file**, point to **/Pipelines/sync-pipeline-repo.yml**, and then select **Continue**.

1. Select **Variables** and select **New Variable**. Give the name **TEMPLATE-REPO** and value **<https://github.com/microsoft/coe-alm-accelerator-templates>** and select **OK** and **Save** to finalize the creation.

   > [!NOTE]
   > The sync pipeline can be used to sync any GitHub repo to Azure DevOps. By setting the TEMPLATE-REPO to the source GitHub repo, you can specify the source of the sync.

1. Under **Run** dropdown, select **Save**, select **...** next to **Run Pipeline**, and then select **Rename/Move**.

1. Update the pipeline name to **sync-pipeline-repo**, and then select **Save**.

1. Run the new pipeline.

1. Do the following settings: in **SyncFrom** select **Tag** , in **SourceBranchOrTag** enter the tag copied in the previous section (example: **CenterofExcellenceALMAccelerator-May2022**), in  **BranchToCreate** define the name you want, example: update-from-original-repo, in **TargetBranch** define the name you want example: **main**, and then select **Run**.

1. After the pipeline runs, a pull request will be created for the **BranchToCreate** into the **TargetBranch** example: Pull request from **update-from-original-repo** to **main**. To commit the changes, approve and complete the pull request by selecting **Repos** and **Pull requests**.

> [!NOTE]
> If the generated pull request has merge conflicts, these need to be resolved to complete the upgrade. A free Azure DevOps extension called **Pull Request Merge Conflict Extension** can be install from [Visual Studio Market Place](https://marketplace.visualstudio.com/items?itemName=ms-devlabs.conflicts-tab).

## Verify the CustomAzureDevOps custom connector policies

You should have 6 policies under **Definition** tab in the CustomAzureDevOps custom connector. Verify the policies are created according to the following information. You might need to create the missing policies or update them to ensure they match the specifications. Pay attention to the Operations field which in some cases has been seen to be empty after upgrade.

**Set host to `https://vssps.dev.azure.com` policy**

| **Field name**         | **Value**   |
|-------------------|-------------------|
| Name     | Set host to `https://vssps.dev.azure.com`|
| Template| Set host URL
| Operations | GetUsers, GetIdentities
| URL Template | `https://vssps.dev.azure.com`

**Set host to `https://app.vssps.visualstudio.com` policy**

| **Field name**         | **Value**   |
|-------------------|-------------------|
| Name     | Set host to `https://app.vssps.visualstudio.com` |
| Template| Set host URL |
| Operations | GetOrganizations |
| URL Template | `https://app.vssps.visualstudio.com` |

**Convert Build Definition Variables to Array policy**

| **Field name**         | **Value**   |
|-------------------|-------------------|
| Name     | Convert Build Definition Variables to Array |
| Template| Convert an object to an array (Preview) |
| Operations | |
| Target object or collection path | @body().value |
| Property subpath | variables |
| Path of the new property | @item().variables |
| Property name for the key | key |
| Property name for the value | value |
| Run policy on | Response |

**Set host to `https://vsaex.dev.azure.com` policy**

| **Field name**         | **Value**   |
|-------------------|-------------------|
| Name     | Set host to `https://vsaex.dev.azure.com`|
| Template| Set host URL
| Operations | RemoveMemberFromGroup, AddMemberToGroup
| URL Template | `https://vsaex.dev.azure.com`

**Set method to POST policy**

| **Field name**         | **Value**   |
|-------------------|-------------------|
| Name     | Set method to POST |
| Template| Route request
| Operations | RunSyncPipeline
| New path | {organization}/{project}/_apis/pipelines/{pipelineId}/runs
| Method | POST

**Set method to GET for ListItems policy**

| **Field name**         | **Value**   |
|-------------------|-------------------|
| Name     | Set method to GET for ListItems |
| Template| Route request
| Operations | ListItems
| New path | `https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repo}/items`
| Method | GET
