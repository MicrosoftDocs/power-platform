---
title: Install the CoE CLI (Deprecated)
description: Learn how to install and set up the CoE command line interface using local or Docker methods.
author: Grant-Archibald-MS
ms.author: grarchib
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:08/07/2025
ms.date: 08/07/2025
ms.topic: install-set-up-deploy
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
---

# Install the CoE CLI (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

To install the Center of Excellence (CoE) command line interface (CLI):

1. Download the [CoE Starter Kit compressed file](https://aka.ms/CoEStarterKitCurrentMonthRelease).

1. Extract the zip file.

1. Open the extracted folder and then navigate to the **coe-cli** folder.

   ```bash
   cd coe-cli
   ```

Perform a [local install](#local-install) or [Docker install](#docker-install).

## Local install

Install the CoE CLI locally on your computer to run the CLI commands directly from your command prompt or terminal. 

If you don't have administrative rights, make sure you install the [prerequisites for a non-administrator](#prerequisites-for-a-non-administrator). The [installation instructions](#install) are the same for both administrator and non-administrator installs.

### Prerequisites as administrator

- Node 16+, available at [https://nodejs.org/en/download/](https://nodejs.org/en/download/)

- Azure CLI (version 2.37.0+). You need Azure CLI for user authentication and Microsoft Entra integration. Follow the install instructions for your operating system at [Install Azure CLI](/cli/azure/install-azure-cli).

    > [!Important]
    > The CoE CLI works with Azure CLI versions up to 2.38.0.

- PowerShell Core (version 7.2+), available at [/powershell/scripting/install/installing-powershell](/powershell/scripting/install/installing-powershell).

- Git CLI (version 2.37.2+), available at [https://git-scm.com/downloads](https://git-scm.com/downloads).
 
To check that you installed the prerequisites correctly and have the right versions, issue the following commands at the command prompt.

1. Verify the node version:

   ```bash
   node --version
   ```

1. Verify the Azure CLI version:

   ```bash
   az --version
   ```

### Prerequisites for a non-administrator

- [Miniconda](https://www.anaconda.com/docs/getting-started/miniconda/), a free bootstrap version of Anaconda that includes only conda, Python, the packages they depend on, and a few other useful packages. 

- [Node.js](https://nodejs.org/). To install:

    - Go to [Download Node.js](https://nodejs.org/en/download/).
    - Download the Windows binary for your operating system type.
    - Extract the downloaded zip file.
    - In Windows Explorer, open **%USERPROFILE%**.
    - Create a folder named *nodejs*.
    - Copy all files from the zip file into the **nodejs** folder.

- Prepare your system:

    1. Open `%USERPROFILE%\dev.bat` with a text editor like Notepad and make the following edit:

        ```text
        SET PATH=%PATH%;%USERPROFILE%/nodejs
        %windir%\System32\cmd.exe "/K" %USERPROFILE%\miniconda3\Scripts\activate.bat %USERPROFILE%\miniconda3
        ```

    1. Save the file.

    1. Install the Azure CLI by using [pip](https://pypi.org/project/pip/), the Python package manager:

        ```cmd
        pip install azure-cli
        ```

    1. Verify all prerequisites are installed:

         ```cmd
         az --version
         node --version
         pac --version
         ```

### Install

For a demo of the steps, go to [Video demo of local installation](#video-demo-of-local-installation).

1. Start from the **coe-cli** folder.

   ```bash
   cd coe-cli
   ```

1. Install application dependencies:

   ```bash
   npm install
   ```

1. Build the application:

   ```bash
   npm run build
   ```

1. Link to the CoE CLI application:

   ```bash
   npm  link
   ```

1. Verify that the CoE CLI is installed.

    ```cmd
    coe --help    
   ```

> [!NOTE]
> On Windows, you might need to add `%APPDATA%\npm` to your PATH environment variable to access the `coe` command.

#### Video demo of local installation

The following video shows the results of a sample local install.

:::image type="content" source="./media/install-local.svg" alt-text="Demo of example local installation of CoE CLI.":::

## Docker install

Another way to install the CoE CLI is by using Docker. For a demo of the steps, go to [Video demo of Docker installation](#video-demo-of-docker-installation).

### Prerequisites

To run the CoE CLI application, you need to install [Docker](https://docs.docker.com/get-docker/) locally. You can use either the Community Edition or Enterprise Edition. If you're installing on a desktop environment, choose Community Edition.

### Docker install steps

> [!NOTE]
> On some operating systems, you might need to use `sudo` before each of the Docker commands.

1. Build docker image:

   ```bash
   cd coe-cli
   docker build -t coe-cli . 
   ```

1. Use the docker image:

   ```bash
   docker run -it --rm coe-cli
   ```

    This command starts a new interactive console (`-it`) and removes the Docker container (`--rm`) when the console session exits. Using `--rm` removes any cached credentials when you exit.

#### Video demo of Docker installation

The following video shows the results of a sample Docker install on Linux.

![Demo of example Docker installation of CoE CLI on Linux.](./media/install-docker.svg)

## Next step

> [!div class="nextstepaction"]
> [Install the CoE CLI ALM accelerator](./alm/overview.md)

[!INCLUDE[footer-include](../../../includes/footer-banner.md)]
