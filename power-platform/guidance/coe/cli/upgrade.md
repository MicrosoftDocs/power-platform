---
title: Upgrade the CoE CLI (Deprecated)
description: Learn how to update the Center of Excellence command line interface.
author: Grant-Archibald-MS
ms.author: grarchib
ms.custom: ""
ms.date: 08/27/2025
ms.update-cycle: 3650-days
ms.subservice: guidance-toolkit
ms.topic: upgrade-and-migration-article
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
---

# Upgrade the CoE CLI (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

The upgrade steps depend on how you [installed the CoE CLI](./install.md).

## Download

If you downloaded the CoE CLI as a zip file:

1. Download the [CoE Starter Kit compressed file](https://aka.ms/CoEStarterKitCurrentMonthRelease).

1. Extract the zip file to a new directory.

If you downloaded the CoE CLI as a Git clone from [coe-starter-kit](https://github.com/microsoft/coe-starter-kit), pull the changes from Git:

```bash
git pull
```

When you have a local version of the CoE CLI, go to the **coe-cli** folder:

```bash
cd coe-cli
```

## Local upgrade

If you installed the CoE CLI locally, run the following commands from the **coe-cli** folder.

1. Install the dependencies:

   ```bash
   npm install
   ```

1. Build the new version:

   ```bash
   npm run build
   ```

1. Update the CoE CLI to the new version:

   ```bash
   npm link --force
   ```

## Docker upgrade

If you installed the CoE CLI as a Docker image, run the following command to build a new docker image:

```bash
docker build -t coe-cli .
```

[!INCLUDE[footer-include](../../../includes/footer-banner.md)]
