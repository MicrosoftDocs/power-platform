---
title: "Center of Excellence (CoE) Command Line Interface (CLI) ALM Accelerator User Add Generation Configuration"
description: Generate user add configuration files for the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 10/20/2021
ms.service: power-platform
ms.topic: "article"
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# Maker Add Generate

## Description

Generate configuration file to add an Advanced Maker to an installed the ALM Accelerator for Advanced Makers (AA4AM)

## Examples

Example command line

```bash
coe aa4am generate maker add -o user.json
```

To use the generated configuration file

```bash
coe aa4am maker add \
    -f user.json
```

Read more on [maker add command](../../maker/add.md)

## Parameters

### -o, --output

**Optional** name of the output JSON file to be created. If **-o** argument not found JSON results will be displayed in the console
