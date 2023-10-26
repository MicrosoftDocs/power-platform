---
title: Install the SAP Procurement template
description: Steps to access and install the SAP Procurement template.
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
ms.topic: how-to
ms.date: 06/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install the SAP Procurement template

As a Power Platform admin, go to [Templates for Power Platform](https://aka.ms/TemplatesforPowerPlatform) on GitHub to access all the template assets.

Download the SAP Procurement template files from GitHub and install them in the development environment you prepared for it.

> [!IMPORTANT]
>
> The template files contain two solution templates. You need to install both to your prepared environment:
>
> - **SAP Base solution** contains the base Power Platform components required for the SAP Procurement solutions. The base solution also supports other SAP-related solutions that will be released later.
> - **SAP Procurement solution template** contains Power Platform components specific to the procure-to-pay process domain.

## Install the SAP Base solution template

1. In the _Power Apps Maker Portal_, select the developer (sandbox) _environment_ that you want to install the solutions in and then select the **Solutions** menu option.

1. Select **Import solution**, selecting the **mpa_SAPBase_managed** file.

1. Enter the environment variables when prompted, using the [Configure environment variables](configure-environment-variables.md) guidance.

1. Select **Import**.

> [!NOTE]
>
> It may take several minutes for the solution to import.

## Install the SAP Procurement solution template

1. After the **SAP Base** solution successfully installs, navigate back to the **Solutions** menu option.

1. Select **Import solution**, selecting the **mpa_SAPProcurement_managed** file.

1. When prompted, populate the _connection references_ by either creating new or selecting existing connections as described in [Set up connections for solutions](set-up-connections.md).

1. Select **Import**.

> [!TIP]
> You can log your questions and get support for the SAP Procurement solution template at the [**Templates-for-Power-Platform**](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site.

## See also

- [Get started with the SAP Procurement template](get-started.md)
