---
title: "Center of Excellence (CoE) Command Line Interface (CLI) Overview"
description: "Overview of development for Center of Excellence Command-Line interface commands"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 11/30/2021
ms.service: power-platform
ms.topic: "article"
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# CLI development

This section outlines the following key sections on the CoE CLI. The information below can help guide you in making contributions back to the open-source repository.

- [Quick Start](#quick-start) - Provides set of links of the technology used to build and test the CLI.

- [Development Environment Setup](#development-environment-setup) - How to edit the CLI using Visual Studio Code.

- [Adding A New Command](./adding-new-command.md) - How to add a new CLI command.

- [Documentation](./documentation.md) - Adding documentation for commands.

## Quick start

The coe-cli command-line application makes use of following components.

1. [NodeJS](https://nodejs.org/en/) to provide cross-platform support.
1. TypeScript to use published type definitions for dependent components.
1. Jest for unit tests.

### Initial commands

1. Download or clone [coe-starter-kit](https://github.com/microsoft/coe-starter-kit).

1. Change to coe-cli folder.

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

## Understand The Concepts

### Documentation

Documentation is critical for users of the CoE understanding the commands. The [documentation](./documentation.md) pages describe how to add or modify CoE CLI.

### Development frameworks

If you're new to TypeScript, the following links may help.

- [Typescript docs](https://www.typescriptlang.org/docs/)
- [Getting Started with TypeScript - Learning Module](/learn/modules/typescript-get-started/)

If you're new to unit testing with Jest, you can start with.

- [Jest getting started](https://jestjs.io/docs/getting-started)

### Development environment setup

You can edit and debug the CLI using Visual Studio Code.

1. If you don't have Visual Studio Code, you can visit [https://code.visualstudio.com/Download](https://code.visualstudio.com/Download).

1. Once installed Open the coe-cli folder in Visual Studio Code.

1. The [.vscode/launch.json](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/.vscode/launch.json) file contains a preconfigured debug launch command.

1. You can edit the [sample.json](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/sample.json) file to the commands that you want to debug.

1. Place breakpoints in the TypeScript files you want to debug and Press F5 to start debugging.

NOTES:

- Depending on the command, you want to debug you may be prompted to log in to the DEBUG CONSOLE.

- If you're testing with a different account, you'll need to log out of any existing Azure CLI sessions.

   ```bash
   az logout

   ```

### Debugging commands

You can debug the coe-cli application commands using Visual Studio Code.

1. Change the sample.json to the command or commands you want to run.
1. Open the coe-cli folder in Visual Studio Code.
1. Place breakpoints in the TypeScript code you want to debug.
1. Press F5 or Select Run -> Start Debugging.

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
