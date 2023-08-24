---
title: "Frequently asked questions (preview)"
description: FAQs for the Power Platform unified developer experience.
author: pvillads
ms.date: 08/22/2023
ms.topic: article
ms.reviewer: pehecke
ms.author: pvillads
---

# Frequently asked questions (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This FAQ answers common questions about the AI that is used by the generative answers capability in Power Virtual Agents.

## Licensing, capacity and environment Provisioning

### My enviroment saw showing as preparing in Power Platform admin center (PPAC) but has now disappeared. Why has my environment deployment failed?

This happens when provisioning fails. Contact support with the environment name and tenant ID. 

### I can't provision an environemnt with PowerShell 7

Use Windows PowerShell instead of PowerShell 7

### Provisioning fails with the error "You don't have the required Dynamics 365 licences to create a database with <app name> Dynamics app.".

Ensure that you have licenses for the template you are deploying.

## Developer setup (metadata download, configuration, connecting to an enviornment, etc)

### I can't access SQL server using my SQL Server Management Studio (SSMS) client running in a OneBox environment (such as a VHD or CHE).

We do not currently have a solution for secure connection to a SQL server running behind a cloud endpoint. A TDS endpoint (like the one Dataverse has) will be developed to provide read-only queries to a database from SSMS. There is also a JIT access that will allow you to access the data after providing authentication.

### The Configure Metadata option does not appear on the menu.

When this happens, open the Infolog and the menu should appear.

### PackagesLocalDirectory extraction does not complete.

Use [7Zip](7-zip.org) to extract the metadata.

### The message "Please wait for update to complete" pop up keeps appearing.

This only happens until the metadata is configured.

### Cross reference database validation keeps failing

Ensure that your Windows user has access to the specified SQL server or LocalDB. The following instructions describe a local DB setup.

1. Download the LocalDB 2019 installer by using the [SQL Server Express installer](https://go.microsoft.com/fwlink/?linkid=866658).
1. Run the installer and select "Download Media"
1. Select "LocalDB" and **Download**
1. Before running the SqlLocalDB.msi installer, delete your current MSSQLLocalDB instance:

```
sqllocaldb stop MSSQLLocalDB
sqllocaldb delete MSSQLLocalDB
```

1. Run the new SqlLocalDB.msi (2019) installer. It will create a new MSSQLLocalDB instance.

### I get the following error running UnoDev operations:

```
Principal user (Id=<Redacted>, type=8, rollCount=2, privilegeCount=<>, accessMode=1, MetadataCachePrivilegesCount=7371, businessUnitId=<Redacted>(Setup/Stub unlicensed user with filtered privileges from associated roles. Consider assigning license.)), is missing prvCreatemsprov_fnopackage privilege
```

This is an issue in the environment. Please reach out to us with environment details. Users running the unodev operation should have correct licenses assigned.

### See also

[Unified developer experience overview (preview)](overview.md)