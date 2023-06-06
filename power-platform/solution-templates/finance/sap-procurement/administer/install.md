---
title: Install the SAP Procurement solution template (preview)
description: Steps to access and install the SAP Procurement solution template.
author: jongilman88
ms.author: jongilman
contributors:
  - EllenWehrle
  - robinsonshields
  - microsoft-george
  - tverhasselt
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: install-set-up-deploy
ms.date: 05/03/2023
ms.custom: bap-template
---

# Install SAP Procurement solution template files (preview)

[This article is prerelease documentation and is subject to change.]

The SAP Procurement template solution files are hosted on the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site

As a Power Platform admin, you can take the following steps to access and install the solution to the development environment you prepared for it.

1. Access and download the [mpa_SAPBase_managed](https://aka.ms/DownloadSAPBaseSolution) and [mpa_SAPProcurement_managed](https://aka.ms/DownloadSAPProcurementSolution) solution files on GitHub.

1. In the _Power Apps Maker Portal_, select the developer (sandbox) _environment_ that you want to install the solutions in and then select the **Solutions** menu option.

1. Click **Import solution**, selecting the **mpa_SAPBase_managed** file.

1. Enter the environment variables when prompted, using the [Configure environment variables](configure-environment-variables.md) guidance.

1. Click **Import**.

> [!NOTE]
>
> It may take several minutes for the solution to import

1. After the **SAP Base** solution successfully installs, navigate back to the **Solutions** menu option.

1. Click **Import solution**, selecting the **mpa_SAPProcurement_managed** file.

1. When prompted, populate the _connection references_ by either creating new or selecting existing connections as described in [Setting up connections for solutions](set-up-connections.md).

1. Click **Import**.

> [!NOTE]
>
> It may take several minutes for the solution to import

## See also

- [Overview](../overview.md)
- [Get started](get-started.md)
