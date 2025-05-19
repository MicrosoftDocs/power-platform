---
title: "File access restrictions for Test Engine (preview)"
description: "Learn about the file restrictions for Test Engine in different operating systems"
author: snamilikonda
ms.author: snamilikonda
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: article
---

# File access restrictions for Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

The test engine is allowed to write files exclusively within designated directories under the `Microsoft/TestEngine` folder located in the temporary directory.

The test engine is prohibited from reading files certain file types and from specific locations, including network paths. The following is a nonexhaustive list of restricted directories:

## Windows

Note: `%SystemDrive%` is assumed for all of the following paths.

`Windows`, `Program Files`, `Program Files (x86)`, `Users\<User>\AppData\Roaming`, `ProgramData`, `Users\Public\Desktop`, `Users\Public\Documents`, `Users\Public\Music`, `Users\Public\Pictures`, `Users\Public\Videos`, `Users\<User>\AppData\LocalLow`, `Users\<User>\Documents`, `Users\<User>\Desktop`, `Users\<User>\Downloads`, `Users\<User>\Favorites`, `Users\<User>\Saved Games`, `Users\<User>\OneDrive`, `Users\<User>\Searches`, `Users\<User>\Links`, `Users\<User>\AppData\Local\Microsoft`
``
## Linux

`/bin/`, `/sbin/`, `/boot/`, `/root/`, `/dev/`, `/etc/`, `/lib/`, `/lib64/`, `/mnt/`, `/opt/`, `/proc/`, `/run/`, `/srv/`, `/sys/`, `/usr/`, `/var/`, `/media/`, `/lost+found/`, `/snap/`, `~/.ssh/`, `~/.config/`, `~/.gnupg/`, `~/.local/`, `~/.cache/`, `~/.docker/`, `~/.kube/`, `~/.npm/`, `~/.gem/`, `~/.m2/`, `~/.terraform.d/`, `~/.aws/`, `~/.azure/`, `~/.google/`

## OSX

`/bin/`, `/sbin/`, `/boot/`, `/root/`, `/dev/`, `/etc/`, `/lib/`, `/lib64/`, `/mnt/`, `/opt/`, `/proc/`, `/run/`, `/srv/`, `/sys/`, `/usr/`, `/var/`, `/media/`, `/lost+found/`, `/snap/`, `~/.ssh/`, `~/.config/`, `/private/`, `/Library/`, `~/Library/`, `/System/`, `/Applications/`, `/Volumes/`, `~/.gnupg/`, `~/.local/`, `~/.cache/`, `~/.docker/`, `~/.kube/`, `~/.npm/`, `~/.gem/`, `~/.m2/`, `~/.terraform.d/`, `~/.aws/`, `~/.azure/`, `~/.google/`