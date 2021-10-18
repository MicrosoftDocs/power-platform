---
title: "Center of Excellence (CoE) Command Line Interface (CLI) Upgrade"
description: "Upgrade instructions for the Center of Excellence Command Line interface"
keywords: 
author: Grant-Archibald-MS
ms.author: garchib
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

# Upgrade

Upgrade will depend on how you installed the CoE CLI

## Download

It you downloaded the CoE CLI as a zip file or a git clone from [coe-starter-kit](https://github.com/microsoft/coe-starter-kit)

- Download the new zip file
- Unzip the zip file to a new folder

OR

- Pull changes from git

```bash
git pull
```

Once you have a local version of the coe-cli change to coe-cli folder

```bash
cd coe-cli

```

### Local Upgrade

In the coe-cli folder run the following commands

1. Install the dependencies

```bash
npm install

```

1. Build the new version

```bash
npm run build

```

1. Update coe-cli to new version

```bash
npm link --force

```

## Docker Image

In the coe-cli folder run the following commands

1. Build new docker image

```bash
docker build -t coe-cli .

```
