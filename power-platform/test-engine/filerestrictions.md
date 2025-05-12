---
title: "Test command migration process for Test Engine (preview)"
description: "Learn about the process of transitioning Test command between versions of Test Engine"
author: snamilikonda
ms.author: snamilikonda
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Migration Guide
[This article is prerelease documentation and is subject to change.]

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

# File Access Restrictions for Test Engine
The test engine is allowed to write files exclusively within designated directories under the `Microsoft/TestEngine` folder located in the temporary directory.

The test engine is prohibited from reading files certain file types and from specific locations, including network paths. Below is a non-exhaustive list of restricted directories:

## Windows
Note: `%SystemDrive%` is assumed for all paths listed below.

`Windows`, `Program Files`, `Program Files (x86)`, `Users\<User>\AppData\Roaming`, `ProgramData`, `Users\Public\Desktop`, `Users\Public\Documents`, `Users\Public\Music`, `Users\Public\Pictures`, `Users\Public\Videos`, `Users\<User>\AppData\LocalLow`, `Users\<User>\Documents`, `Users\<User>\Desktop`, `Users\<User>\Downloads`, `Users\<User>\Favorites`, `Users\<User>\Saved Games`, `Users\<User>\OneDrive`, `Users\<User>\Searches`, `Users\<User>\Links`, `Users\<User>\AppData\Local\Microsoft`
``
## Linux
`/bin/`, `/sbin/`, `/boot/`, `/root/`, `/dev/`, `/etc/`, `/lib/`, `/lib64/`, `/mnt/`, `/opt/`, `/proc/`, `/run/`, `/srv/`, `/sys/`, `/usr/`, `/var/`, `/media/`, `/lost+found/`, `/snap/`, `~/.ssh/`, `~/.config/`, `~/.gnupg/`, `~/.local/`, `~/.cache/`, `~/.docker/`, `~/.kube/`, `~/.npm/`, `~/.gem/`, `~/.m2/`, `~/.terraform.d/`, `~/.aws/`, `~/.azure/`, `~/.google/`

## OSX
`/bin/`, `/sbin/`, `/boot/`, `/root/`, `/dev/`, `/etc/`, `/lib/`, `/lib64/`, `/mnt/`, `/opt/`, `/proc/`, `/run/`, `/srv/`, `/sys/`, `/usr/`, `/var/`, `/media/`, `/lost+found/`, `/snap/`, `~/.ssh/`, `~/.config/`, `/private/`, `/Library/`, `~/Library/`, `/System/`, `/Applications/`, `/Volumes/`, `~/.gnupg/`, `~/.local/`, `~/.cache/`, `~/.docker/`, `~/.kube/`, `~/.npm/`, `~/.gem/`, `~/.m2/`, `~/.terraform.d/`, `~/.aws/`, `~/.azure/`, `~/.google/`