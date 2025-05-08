---
title: "Center of Excellence (CoE) command line interface (CLI) upgrade (Deprecated)"
description: "Upgrade instructions for the Center of Excellence command line interface"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
ms.custom: ""
ms.date: 05/23/2023

ms.topic: upgrade-and-migration-article
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Center of Excellence (CoE) command line interface (CLI) upgrade (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

Upgrade will depend on how you installed the CoE CLI.

## Download

If you downloaded the CoE CLI as a zip file or a Git clone from [coe-starter-kit](https://github.com/microsoft/coe-starter-kit).

- Download the new zip file.
- Unzip the zip file to a new folder.

OR

- Pull changes from Git.

   ```bash
   git pull
   ```

Once you have a local version of the coe-cli, go to the **coe-cli** folder.

   ```bash
   cd coe-cli

   ```

### Local Upgrade

In the **coe-cli** folder, run the following commands:

1. Install the dependencies.

   ```bash
   npm install

   ```

1. Build the new version.

   ```bash
   npm run build

   ```

1. Update coe-cli to the new version.

   ```bash
   npm link --force

   ```

## Docker image

In the coe-cli folder, run the following command:

1. Build a new docker image.

   ```bash
   docker build -t coe-cli

   ```

[!INCLUDE[footer-include](../../../includes/footer-banner.md)]
