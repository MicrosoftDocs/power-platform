---
title: "Configuring the ALM Accelerator for Power Platform hook extensions | MicrosoftDocs"
description: "The ALM Accelerator for Power Platform pipelines has extension points that allows users to customize the pipelines by using the available hooks to run custom yaml templates."
author: jenschristianschroder
mms.topic: conceptual
ms.date: 04/07/2023
ms.subservice: guidance
ms.author: jeschro
ms.reviewer: sericks
---
# Configuring the ALM Accelerator for Power Platform hook extensions

The ALM Accelerator for Power Platform pipeline templates has several extension points that you can use to customize the pipelines. Using these extension points, or hooks, allow you to customize the pipelines while minimizing the noise from merge conflicts in upgrade scenarios.

## Available extension points in ALM Accelerator for Power Platform yaml templates

The following table lists the extension points currently supported

| Pipeline YAML file name       | Extension point           | Description           | Extension YAML file   |
| ----------------------------- | ------------------------- | --------------------- | --------------------- |
| Templates/export-Solution.yml | Export Solution Pre Hook  | Extension point to add customizations as the initial step in the export solution pipeline | Hooks/export-solution-pre-hook.yml |
| Templates/export-Solution.yml | Solution Unpack Pre Hook  | Extension point to add customizations before the unpack solution process | Hooks/export-solution-unpack-pre-hook.yml |
| Templates/export-Solution.yml | Manipulate Pre Hook  | Extension point to add customizations before the manipulation of solution files | Hooks/export-solution-manipulate-pre-hook.yml |
| Templates/export-Solution.yml | Update deployment settings Pre Hook  | Extension point to add customizations before the updating the deployment settings | Hooks/export-solution-update-deploymentsettings-pre-hook.yml |
| Templates/export-Solution.yml | Solution Commit Pre Hook  | Extension point to add customizations before the Solution source code is committed to git | Hooks/export-solution-commit-pre-hook.yml |
| Templates/export-Solution.yml | Export Solution Post Hook  | Extension point to add customizations as the final step in the export solution pipeline | Hooks/export-solution-post-hook.yml |
| Templates/build-Solution.yml | Build Solution Pre Hook  | Extension point to add customizations as the initial step in the build solution pipeline | Hooks/build-solution-pre-hook.yml |
| Templates/build-Solution.yml | Manipulate Pre Hook  | Extension point to add customizations before the manipulation of solution files | Hooks/build-solution-manipulate-pre-hook.yml |
| Templates/build-Solution.yml | Solution Pack Pre Hook  | Extension point to add customizations before the solution is packed from source code | Hooks/build-solution-pack-pre-hook.yml |
| Templates/build-Solution.yml | Build Solution Post Hook  | Extension point to add customizations as the final step in the build solution pipeline | Hooks/build-solution-post-hook.yml |
| Templates/deploy-Solution.yml | Deploy Solution Pre Hook  | Extension point to add customizations as the initial step in the deploy solution pipeline | Hooks/deploy-solution-pre-hook.yml |
| Templates/deploy-Solution.yml | Import Solution Pre Hook  | Extension point to add customizations before the solution is imported | Hooks/deploy-solution-import-pre-hook.yml |
| Templates/deploy-Solution.yml | Configure Solution Pre Hook  | Extension point to add customizations before the configuration of the deployed solution | Hooks/deploy-solution-configure-pre-hook.yml |
| Templates/deploy-Solution.yml | Deploy Solution Post Hook  | Extension point to add customizations as the final step in the build solution pipeline | Hooks/deploy-solution-post-hook.yml |

## Using extension points in ALM Accelerator for Power Platform yaml templates

To use the extension points to extend the ALM Accelerator pipeline functionalities, you should add your extension to either a custom YAML template in the Hooks/CustomTemplates folder,, or directly to the extension YAML file for the extension point you want to use.

The following example implements the custom template **output-environment-variables.yml** located in the **Hooks\CustomTemplates** folder in the **export-solution.yml** pipeline via the **Export Solution Pre Hook** extension point:

Add the following code to the **export-solution-pre-hook.yml** file

```yaml
- template: CustomTemplates/output-environment-variables.yml
```

The **export-solution-pre-hook.yml** should now look like this

```yaml
steps:
- script: echo Export Solution Pre Hook
  displayName: 'Export Solution Pre Hook'
  enabled: false

- template: CustomTemplates/output-environment-variables.yml
```

## Handling merge conflicts when upgrading the ALM Accelerator pipeline templates

> [!NOTE]
> To help resolve merge conflicts when upgrading to a new release of ALM Accelerator pipeline templates we recommend the use of the [**Pull Request Merge Conflict Extension**](https://marketplace.visualstudio.com/items?itemName=ms-devlabs.conflicts-tab) for Azure DevOps.

If you make customizations to the ALM Accelerator pipeline templates in any way, you will have merge conflicts when upgrading the ALM Accelerator pipeline templates to a new release.

The extension points are implemented in a way that should make it simple to handle such merge conflicts if you use the extension points for customizations of the pipelines.

When upgrading to a new release of the ALM Accelerator pipeline templates, you should keep your own changes of any file in the **Hooks** folder and accept any additions to the folder.

## Next steps

> [!div class="nextstepaction"]
> [Azure App Registration strategy](./app-registration-strategy.md)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
