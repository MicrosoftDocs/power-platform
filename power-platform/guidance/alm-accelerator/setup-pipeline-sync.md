---
title: Configure pipeline sync
description: Learn how to create a pipeline to sync the latest ALM Accelerator for Power Platform pipeline templates to your Azure DevOps repository.
ms.topic: how-to
ms.date: 04/07/2023
ms.subservice: guidance
author: jenschristianschroder
ms.author: jeschro
ms.reviewer: sericks
ms.custom: bap-template
---

# Configure pipeline sync

As the pipeline templates in the ALM Accelerator for Power Platform change, you need to update them with each new release. The pipeline sync script makes it easy to keep your pipeline templates up-to-date. [Get instructions for a full upgrade of the ALM Accelerator for Power Platform](/power-platform/guidance/coe/setup-almacceleratorpowerplatform-upgrade-config).

## Pipeline sync setup

To simplify the process, we created a pipeline template that automatically syncs your Azure DevOps repo with the pipeline template repo in the CoE Starter Kit GitHub repository. Here's how to get started with the pipeline sync pipeline.

1. To start, manually sync the [latest release](https://github.com/microsoft/coe-alm-accelerator-templates/releases) of the pipeline templates by [cloning the pipeline template repo to your Azure DevOps repo](setup-components-manually.md#clone-the-yaml-pipelines-from-github-to-your-devops-instance).

1. In Azure DevOps, go to **Pipelines**, and then select **Create a New Pipeline**.

1. Select **Azure Repos Git** for your code repository, and then point to the Azure DevOps repo you created and seeded with the pipeline templates in step 1.

1. On the **Configure your pipeline** page, select **Existing Azure Pipelines YAML file**, point to */Pipelines/sync-pipeline-repo.yml*, and then select **Continue**.

1. On the next screen, select **Save**, select (**&hellip;**) next to **Run Pipeline**, and then select **Rename/Move**.

1. Change the pipeline name to *sync-pipeline-repo*, and then select **Save**.

1. Set the `TEMPLATE-REPO` pipeline variable to <*https://github.com/microsoft/coe-alm-accelerator-templates*>.

   You can use the sync pipeline to sync any GitHub repo to Azure DevOps. Set the `TEMPLATE-REPO` variable to the source GitHub repo to specify the sync source.

1. Run the new pipeline.

1. Enter the name of the **SourceBranch** and **BranchToCreate** in Azure DevOps, and the **TargetBranch**, such as *main*, and then select **Select Run**.

1. After the pipeline runs, a pull request is created for the **BranchToCreate** into the **TargetBranch**. To commit the changes, approve and complete the pull request.

    :::image type="content" source="media/setup-almacceleratorpowerplatform-pipeline-sync/image-20210524102603951.png" alt-text="Screenshot of the sync pipeline pull request.":::<!-- EDITOR'S NOTE: Please crop, highlight, and rename the screenshot IAW our [screenshot guidelines](/bacx/screenshots-for-bap?branch=main) -->

## Next steps

> [!div class="nextstepaction"]
> [Customize deployment pipelines with templates](./customize-deployment-pipelines.md)

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
