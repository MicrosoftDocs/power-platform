---
title: Configure pipeline extension points
description: Learn how to use extension points to customize your deployment pipelines in the ALM Accelerator for Power Platform.
ms.topic: how-to
ms.date: 04/07/2023
ms.subservice: guidance-toolkit
author: jenschristianschroder
ms.author: jeschro
ms.reviewer: sericks
ms.custom: bap-template
---

# Configure pipeline extension points

The pipeline templates in the ALM Accelerator for Power Platform have several extension points, or *hooks*. You can use them to customize the pipelines while minimizing the noise from merge conflicts when you upgrade the pipeline templates to a new release.

## Extension points in ALM Accelerator YAML templates

The following table lists the extension points that are supported.

| Pipeline YAML file name | Extension point | Description | Extension YAML file |
| ----------------------- | --------------- | ----------- | ------------------- |
| Templates/export-Solution.yml | Export Solution Pre Hook | Adds customizations as the initial step in the export solution pipeline. | Hooks/export-solution-pre-hook.yml |
| Templates/export-Solution.yml | Solution Unpack Pre Hook | Adds customizations before the unpack solution process. | Hooks/export-solution-unpack-pre-hook.yml |
| Templates/export-Solution.yml | Manipulate Pre Hook | Adds customizations before the manipulation of solution files. | Hooks/export-solution-manipulate-pre-hook.yml |
| Templates/export-Solution.yml | Update deployment settings Pre Hook | Adds customizations before updating the deployment settings. | Hooks/export-solution-update-deploymentsettings-pre-hook.yml |
| Templates/export-Solution.yml | Solution Commit Pre Hook | Adds customizations before the solution source code is committed to Git. | Hooks/export-solution-commit-pre-hook.yml |
| Templates/export-Solution.yml | Export Solution Post Hook | Adds customizations as the final step in the export solution pipeline. | Hooks/export-solution-post-hook.yml |
| Templates/build-Solution.yml | Build Solution Pre Hook | Adds customizations as the initial step in the build solution pipeline. | Hooks/build-solution-pre-hook.yml |
| Templates/build-Solution.yml | Manipulate Pre Hook | Adds customizations before the manipulation of solution files. | Hooks/build-solution-manipulate-pre-hook.yml |
| Templates/build-Solution.yml | Solution Pack Pre Hook | Adds customizations before the solution is packed from source code. | Hooks/build-solution-pack-pre-hook.yml |
| Templates/build-Solution.yml | Build Solution Post Hook | Adds customizations as the final step in the build solution pipeline. | Hooks/build-solution-post-hook.yml |
| Templates/deploy-Solution.yml | Deploy Solution Pre Hook | Adds customizations as the initial step in the deploy solution pipeline. | Hooks/deploy-solution-pre-hook.yml |
| Templates/deploy-Solution.yml | Import Solution Pre Hook | Adds customizations before the solution is imported. | Hooks/deploy-solution-import-pre-hook.yml |
| Templates/deploy-Solution.yml | Configure Solution Pre Hook | Adds customizations before the configuration of the deployed solution. | Hooks/deploy-solution-configure-pre-hook.yml |
| Templates/deploy-Solution.yml | Deploy Solution Post Hook | Adds customizations as the final step in the build solution pipeline. | Hooks/deploy-solution-post-hook.yml |

## Use extension points in the YAML templates

To use the extension points to extend the functionality of the ALM Accelerator pipelines, add your extension to either a custom YAML template in the *Hooks/CustomTemplates* folder or directly to the YAML file for the extension point you want to use.

The following example uses the **Export Solution Pre Hook** extension point to customize the template *Hooks\CustomTemplates\output-environment-variables.yml* in the *export-solution.yml* pipeline.

Add the following code to the *export-solution-pre-hook.yml* file:

```yaml
- template: CustomTemplates/output-environment-variables.yml
```

The *export-solution-pre-hook.yml* should look like this:

```yaml
steps:
- script: echo Export Solution Pre Hook
  displayName: 'Export Solution Pre Hook'
  enabled: false

- template: CustomTemplates/output-environment-variables.yml
```

## Handle merge conflicts when you upgrade customized pipeline templates

> [!NOTE]
> To help you resolve merge conflicts when you upgrade to a new release of the ALM Accelerator pipeline templates, we recommend the [**Pull Request Merge Conflict extension**](https://marketplace.visualstudio.com/items?itemName=ms-devlabs.conflicts-tab) for Azure DevOps.

If you make any customizations to the ALM Accelerator pipeline templates, you'll have merge conflicts when you upgrade the templates to a new release.

The extension points are implemented in a way that should make it simple to handle merge conflicts if you've used them to customize the pipelines. Keep your changed version of a file in the **Hooks** folder. When you upgrade to a new release of the ALM Accelerator pipeline templates, accept any additions to the folder.

## Next steps

> [!div class="nextstepaction"]
> [Considerations when creating Azure app registrations](./app-registration-strategy.md)

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
