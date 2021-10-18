---
title: "ALM Accelerator for Advanced Makers Pipeline Sync Setup | MicrosoftDocs"
description: "Creating a pipeline to sync the latest ALM Accelerator for Advanced Makers pipeline templates to your Azure DevOps repository."
author: mikefactorial
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2021
ms.subservice: guidance
ms.author: v-mikeochs
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# ALM Accelerator for Advanced Makers Pipeline Sync Setup (Preview)

> [!NOTE]
> ALM Accelerator for Advanced Makers is currently in public preview. Please see Issues currently tagged as [vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the Roadmap to be completed prior to general availability. While in Public Preview it can be expected that there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the Public Preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that is being developed separately from AA4AM.

## Pipeline Sync Setup

The Pipeline Sync script was created to make synchronizing the ALM Accelerator for Advanced Makers' (AA4AM) pipeline templates simpler. As the pipeline templates grow and change, users are required to update the pipelines with each release of AA4AM. To simplify this process, we created another pipeline template that will automatically sync your Azure DevOps repo with the pipeline template repo in GitHub. Follow the steps below to get started using the Pipeline Sync pipeline.

1. Initially, you'll need to manually sync a copy of the pipeline templates from <https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/>. Follow the steps in the [Setup Docs](setup-almacceleratoradvanced.md#Clone-the-YAML-Pipelines-from-GitHub-to-your-Azure-DevOps-instance) to clone the pipeline template repo to your Azure DevOps repo.

1. In Azure DevOps, go to **Pipelines** and **Create a New Pipeline**

1. Select **Azure Repos Git** for your code Repository and point to Azure DevOps repo you created and seeded with the pipeline templates in step 1.
   ![Select Azure Repos Git in "Where is your code?" dialog](media/almacceleratoradvanced-components/image-b27c7dc5-7fe7-449f-99bc-73b9b351cc94.png)

1. On the **Configure your pipeline** page, select **Existing Azure Pipelines YAML file** and point to **/Pipelines/sync-pipeline-repo.yml** and Select **Continue**.
   ![Select Existing Azure Pipelines YAML file in "Configure your pipeline" dialog](media/setup-almacceleratoradvanced-pipeline-sync/image-20210524091622017.png)

1. On the next screen Select **Save** and then Select the **3 dots next to Run Pipeline** and Select **Rename/Move**.
   ![Rename/move pipeline after Save](media/almacceleratoradvanced-components/image-c4e3cc16-3abd-453b-a420-9366ef587e8c.png)

1. Update the pipeline name to **sync-pipeline-repo** and select **Save**.

1. Set the **TEMPLATE-REPO pipeline variable** to <https://github.com/microsoft/coe-alm-accelerator-templates>

   > [!NOTE]
   > The Sync Pipeline can be used to sync any GitHub repo to Azure DevOps. Setting the TEMPLATE-REPO to the source GitHub repo allows you to specify the source of the sync.

   ![Update TEMPLATE-REPO pipeline variable with url of GitHub repo](media/setup-almacceleratoradvanced-pipeline-sync/image-20210524095158923.png)

1. Run the new Pipeline

   ![Select Run pipeline to test](media/setup-almacceleratoradvanced-pipeline-sync/image-20210524091948116.png)

1. Enter the name of the **SourceBranch**, **BranchToCreate** in Azure DevOps and the **TargetBranch** (for example main) and **Select Run**

   ![Enter SourceBranch, BranchToCreate and TargetBranch as parameters to run the pipeline](media/setup-almacceleratoradvanced-pipeline-sync/image-20210524101705475.png)

1. After the Pipeline runs, a Pull Request will be created for the **BranchToCreate** into the **TargetBranch**. To commit the changes **Approve and Complete the Pull Request**.

   ![Verify the Pull Request created and select Approve / Complete](media/setup-almacceleratoradvanced-pipeline-sync/image-20210524102603951.png)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
