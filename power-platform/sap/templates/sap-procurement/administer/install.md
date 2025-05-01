---
title: Install the SAP Procurement template
description: Steps to access and install the SAP Procurement template.
author: tverhasselt
ms.author: thoverh
contributors:
  - EllenWehrle
  - robinsonshields
  - microsoft-george
  - jongilman88
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 11/09/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install the SAP Procurement template

This article provides links to the SAP Procurement solution files and gives the steps to manually import them into a developer environment you prepared for them.

## Download the solution files

You have the option to download either managed or unmanaged solution files.

Whichever option you choose, be sure to download both **SAP Base** and **SAP Procurement** solution files.

- Managed
  - [mpa_SAPBase_managed.zip](https://aka.ms/SAPBaseManagedSolution)
  - [mpa_SAPProcurement_managed.zip](https://aka.ms/SAPProcurementManagedSolution)
- Unmanaged
  - [mpa_SAPBase_unmanaged.zip](https://aka.ms/SAPBaseUnmanagedSolution)
  - [mpa_SAPProcurement_unmanaged.zip](https://aka.ms/SAPProcurementUnmanagedSolution)

More information: [Managed and unmanaged solutions](/power-platform/alm/solution-concepts-alm#managed-and-unmanaged-solutions)

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the SAP Procurement template.

## Install the solution files

Once you have downloaded **either** the *managed* or *unmanaged* solution files, you can install them into the developer (sandbox) environment that you prepared for them.

### Install the SAP Base solution

Follow these steps to install either the *managed* or *unmanaged* **SAP Base** solution:

1. Go to [Power Apps maker portal](https://make.preview.powerapps.com/) and select the environment where you want to install the solution.
1. Select **Solutions** on the left pane.
1. Select **Import solution**.
1. Browse for and select either the managed *or* unmanaged version of the **mpa_SAPBase** file downloaded in previous step.
1. Enter the environment variables when prompted, using the [Configure environment variables](configure-environment-variables.md) guidance.
1. Select **Import** to start the import process of the *SAP Base* solution. Once the import is complete, you're notified with a *Success* message.

### Install the SAP Procurement solution

Follow these steps to install either the *managed* or *unmanaged* **SAP Procurement** solution:

1. Go to **Solutions** on the left pane of the *Power Apps maker portal* after the SAP Base solution successfully installs.
1. Browse for and select either the managed or unmanaged version of the *mpa_SAPProcurement* solution file downloaded in previous step.
1. Select **Next** and **Next** again.
1. When prompted, populate the *connection references* by either creating new or selecting existing connections as described in [Set up connections for solutions](set-up-connections.md).
1. Select **Import** to start the import process of the *SAP Procurement* solution. Once the import is complete, you're notified with a *Success* message.

More information: [Solution concepts](/power-platform/alm/solution-concepts-alm)

> [!IMPORTANT]
>
> The template files contain two solutions. You need to install both of the same type (two unmanaged or two managed) to your prepared environment:
>
> - **SAP Base solution** contains the base Power Platform components required for the SAP Procurement solutions. The base solution also supports other SAP-related solutions that will be released later.
> - **SAP Procurement solution** contains Power Platform components specific to the procure-to-pay process domain.

### See also

[Get started with the SAP Procurement template](get-started.md)
