---
title: "Test Engine known issues (preview)"
description: "Known issues for Test Engine"
author: snamilikonda
ms.author: snamilikonda
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Test Engine known issues (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

[This article is prerelease documentation and is subject to change.]

> [!NOTE]
> Please raise any issues by filing [GitHub issues for Test Engine](https://github.com/microsoft/PowerApps-TestEngine/issues) to make Microsoft and the community aware of issues.

## Issue 1: Preview.Pause function doesn't properly open up the inspector for pac test run

**Description:** The `Preview.Pause()` function fails to open the inspector during a `pac test run`.  
**Workaround:** The Open Source version of the Test Engine can be used for pause functionality.


