---
title: "Source control canvas apps (preview)"
description: "Learn how to use Git integration with canvas apps in Power Platform."
author: marcelbf
ms.subservice: alm
ms.author: marcelbf
ms.date: 05/13/2025
ms.topic: how-to
ms.reviewer: jdaly
ms.collection: 
ms.contributors:
---

# Source control canvas apps

Makers and developers use Git integration in Power Platform to manage canvas apps' source code effectively using version control. This feature helps you review changes made by makers in Power Apps Studio without encountering noisy diffs. Additionally, it allows for minimal edits to be made directly in the repository, ensuring a streamlined and efficient workflow.

## How to commit canvas apps using Git integration

You can commit your canvas apps when you publish them. Changes aren't available to commit until you publish your app. This behavior ensures that the source code reflects the latest published version of your app, making it ready for use with Git integration.

### Steps to commit canvas apps

1. Open Power Apps Studio and make changes to your canvas app.
1. Publish the app to make the changes available for Git integration.
1. Navigate to your Git repository and commit the changes.

## Accessing source code files

Canvas apps' source code is stored in `.pa.yaml` files.  These files are human-readable and designed for use with source control. When you use Git integration, the source code for canvas apps is automatically available in the repository without requiring any conversion. The source code is stored within the `canvas` folder in the repository.

## File structure for canvas apps

The extracted source code files are located in the `\Src` folder and include:

- `App.pa.yaml`: Represents the app.
- `[screen Name].pa.yaml`: One file for each screen, representing the screen.
- `\Component`: A folder containing one file for each component, represented as `[component Name].pa.yaml`.

Only use `.pa.yaml` files within the `\Src` folder with source control. Don't use other files, such as JSON files, as source code because they aren't stable between save and load cycles.

## Editing `.pa.yaml` files

You can do minor edits directly in the repository. Any changes are restored with the app when you pull changes to your environment. You must consider any code in your branch as a published app.

### Best practices for editing

- Avoid making significant changes directly in the `.pa.yaml` files.
- Always test changes in a development environment before merging them into the main branch.

## Known limitations

You can't edit the `.pa.yaml` files directly in your repository if your app contains:

- **Code components** (also known as PCF). 

Editing files with these components prevent the app from running. If you change these files by mistake, you can load the previous version of your canvas app in the Maker portal.

## Troubleshooting

This section contains common issues and tips to help you be more successful using Git integration with canvas apps.

### Common issues

- **Merge Conflicts**: Resolve conflicts carefully to avoid corrupting the `.pa.yaml` files.
- **App Fails to Load**: Ensure no unsupported edits were made to the `.pa.yaml` files.

### Tips

- Use a Git client with visual diff tools to review changes before committing.
- Regularly back up your repository to avoid data loss.

## Next steps

- [Overview of Dataverse Git Integration](./overview.md)
- [View Source Code for Canvas Apps](/power-apps/maker/canvas-apps/power-apps-yaml)