---
title: CoE CLI development (Deprecated)
description: Learn how to contribute to the Center of Excellence command-line interface, set up your environment, and add new commands using Visual Studio Code.
author: Grant-Archibald-MS
ms.author: grarchib
ms.date: 08/27/2025
ms.update-cycle: 3650-days
ms.subservice: guidance-toolkit
ms.topic: overview
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:08/27/2025
---

# CoE CLI development (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

This section describes key areas of the CoE CLI to help you contribute to the open-source repository.

- [Quick start](#quick-start): Provides links to the technology used to build and test the CLI.
- [Development environment setup](#development-environment-setup): Describes how to edit the CLI using Visual Studio Code.
- [Adding a new command](./adding-new-command.md): Describes how to add a new CLI command.
- [Documentation](./documentation.md): Describes how to add documentation for commands.

## Quick start

The coe-cli command-line application uses the following components:

- [NodeJS](https://nodejs.org/en/) to provide cross-platform support.
- TypeScript to use published type definitions for dependent components.
- Jest for unit tests.

### Initial commands

1. Download or clone the [coe-starter-kit](https://github.com/microsoft/coe-starter-kit).

1. Go to the **coe-cli** folder.

   ```bash
   cd coe-cli
   ```

1. Install dependent components.

   ```bash
   npm install
   ```

1. Build from the source code.

   ```bash
   npm run build
   ```

1. Install the coe command.

   ```bash
   npm link
   ```

## Understand the concepts

This section describes key concepts related to the CoE CLI.

### Documentation

The [documentation](./documentation.md) pages explain how to add or change CoE CLI commands.

### Development frameworks

If you're new to TypeScript, check out the [official TypeScript website](https://www.typescriptlang.org/) and the [TypeScript documentation](https://www.typescriptlang.org/docs/).

If you're new to unit testing with Jest, start with [Jest Getting started](https://jestjs.io/docs/getting-started).

### Development environment setup

Edit and debug the CLI with Visual Studio Code.

1. If you don't have Visual Studio Code, download it from [https://code.visualstudio.com/Download](https://code.visualstudio.com/Download).

1. Once installed, open the **coe-cli** folder in Visual Studio Code.

    The [.vscode/launch.json](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/.vscode/launch.json) file contains a preconfigured debug launch command.

1. Edit the [sample.json](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/sample.json) file to include the commands you want to debug.

1. Set breakpoints in the TypeScript files you want to debug, and then press F5 to start debugging.

#### Notes

- Depending on the command you want to debug, you might be prompted to sign in to the DEBUG CONSOLE.

- If you're testing with a different account, you need to sign out of any existing Azure CLI sessions.

   ```bash
   az logout
   ```

### Debugging commands

You can debug the coe-cli application commands with Visual Studio Code.

1. Change the **sample.json** file to the command or commands you want to run.
1. Open the **coe-cli** folder in Visual Studio Code.
1. Place breakpoints in the TypeScript code you want to debug.
1. Press F5 or select **Run** > **Start Debugging**.

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
