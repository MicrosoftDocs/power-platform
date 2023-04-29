---
title: "ALM accelerator for Microsoft Power Platform pipeline sync setup | MicrosoftDocs"
description: "Creating a pipeline to sync the latest ALM accelerator for Microsoft Power Platform pipeline templates to your Azure DevOps repository."
author: jenschristianschroder
ms.topic: conceptual
ms.date: 04/07/2023
ms.subservice: guidance
ms.author: jeschro
ms.reviewer: sericks
---
# ALM accelerator for Microsoft Power Platform pipeline sync setup

>[!TIP]
>For a complete upgrade steps of ALM accelerator for Microsoft Power Platform [follow this link](/power-platform/guidance/coe/setup-almacceleratorpowerplatform-upgrade-config)

The pipeline sync script was created to make synchronizing the application lifecycle management (ALM) accelerator for Microsoft Power Platform pipeline templates simpler. As the pipeline templates grow and change, users are required to update the pipelines with each release of the accelerator.

## Pipeline sync setup

To simplify this process, we created another pipeline template that will automatically sync your Azure DevOps repo with the pipeline template repo in the CoE Starter Kit GitHub repository. Follow the steps below to get started using the pipeline sync pipeline.

1. Initially, you'll need to manually sync a copy of the pipeline templates from the [latest release](https://github.com/microsoft/coe-alm-accelerator-templates/releases). Follow the steps in the [setup documentation](setup-components-manually.md#clone-the-yaml-pipelines-from-github-to-your-devops-instance) to clone the pipeline template repo to your Azure DevOps repo.

1. In Azure DevOps, go to **Pipelines**, and then select **Create a New Pipeline**.

1. Select **Azure Repos Git** for your code repository, and point to the Azure DevOps repo you created and seeded with the pipeline templates in step 1.

1. On the **Configure your pipeline** page, select **Existing Azure Pipelines YAML file**, point to **/Pipelines/sync-pipeline-repo.yml**, and then select **Continue**.

1. On the next screen, select **Save**, select **...** next to **Run Pipeline**, and then select **Rename/Move**.

1. Update the pipeline name to **sync-pipeline-repo**, and then select **Save**.

1. Set the **TEMPLATE-REPO pipeline variable** to <https://github.com/microsoft/coe-alm-accelerator-templates>.

   > [!NOTE]
   > The sync pipeline can be used to sync any GitHub repo to Azure DevOps. By setting the TEMPLATE-REPO to the source GitHub repo, you can specify the source of the sync.

1. Run the new pipeline.

1. Enter the name of the **SourceBranch** and **BranchToCreate** in Azure DevOps, the **TargetBranch** (such as **main**), and then select **Select Run**.

1. After the pipeline runs, a pull request will be created for the **BranchToCreate** into the **TargetBranch**. To commit the changes, approve and complete the pull request.

   ![Verify the pull request created, and then select Approve and Complete.](media/setup-almacceleratorpowerplatform-pipeline-sync/image-20210524102603951.png)

## Next steps

> [!div class="nextstepaction"]
> [Customize deployment pipelines](./customize-deployment-pipelines.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
