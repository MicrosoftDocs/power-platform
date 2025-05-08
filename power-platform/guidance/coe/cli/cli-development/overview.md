---
title: "CoE CLI development (Deprecated)"
description: "Overview of development for Center of Excellence Command-Line interface commands"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
ms.custom: ""
ms.date: 05/23/2023

ms.topic: overview
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# CoE CLI development (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

This section outlines the following key sections on the CoE CLI. The information below can help guide you in making contributions back to the open-source repository.

- [Quick start](#quick-start) - Provides a set of links to the technology used to build and test the CLI.

- [Development environment set-up](#development-environment-set-up) - How to edit the CLI using Visual Studio Code.

- [Adding a new command](./adding-new-command.md) - How to add a new CLI command.

- [Documentation](./documentation.md) - Adding documentation for commands.

## Quick start

The coe-cli command-line application makes use of following components.

1. [NodeJS](https://nodejs.org/en/) to provide cross-platform support.
1. TypeScript to use published type definitions for dependent components.
1. Jest for unit tests.

### Initial commands

1. Download or clone [coe-starter-kit](https://github.com/microsoft/coe-starter-kit).

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

### Documentation

Documentation is critical for users of the CoE understanding the commands. The [documentation](./documentation.md) pages describe how to add or modify CoE CLI.

### Development frameworks

If you're new to TypeScript, the following links may help.

- [Typescript docs](https://www.typescriptlang.org/docs/)
- [Getting started with TypeScript - learning module](/learn/modules/typescript-get-started/)

If you're new to unit testing with Jest, start with this article.

- [Jest getting started](https://jestjs.io/docs/getting-started)

### Development environment set-up

Edit and debug the CLI using Visual Studio Code.

1. If you don't have Visual Studio Code, download it at [https://code.visualstudio.com/Download](https://code.visualstudio.com/Download).

1. Once installed, open the **coe-cli** folder in Visual Studio Code.

1. The [.vscode/launch.json](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/.vscode/launch.json) file contains a preconfigured debug launch command.

1. You can edit the [sample.json](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/sample.json) file to the commands that you want to debug.

1. Place breakpoints in the TypeScript files you want to debug, and then press F5 to start debugging.

#### Notes

- Depending on the command you want to debug, you might be prompted to sign in to the DEBUG CONSOLE.

- If you're testing with a different account, you'll need to sign out of any existing Azure CLI sessions.

   ```bash
   az logout

   ```

### Debugging commands

You can debug the coe-cli application commands using Visual Studio Code.

1. Change the sample.json to the command or commands you want to run.
1. Open the **coe-cli** folder in Visual Studio Code.
1. Place breakpoints in the TypeScript code you want to debug.
1. Press F5 or select **Run** > **Start Debugging**.

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
