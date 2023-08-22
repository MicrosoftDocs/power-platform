---
title: "Copy an LCS environment to ODE"
description: "Learn how to copy from an LCS managed environment to a Power Platform admin center ODE"
author: pvillads
ms.date: 08/21/2023
ms.topic: article
audience: Developer, IT Pro
ms.reviewer: phecke
ms.search.region: Global
ms.author: pvillads
ms.collection: get-started
---

# Copy an LCS environment to ODE (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This guide provides step-by-step instructions on performing a Copy from an LCS managed Production/Sandbox environment to a Power platform admin center (PPAC)) managed online development environment (ODE).

Unlike the current LCS copy experience, PPAC based copy copies over your AxDB, MrDB, any customizations and the ISV solutions. In simple terms, it produces a replica of the source environment that includes both code and data.

> [!NOTE]
> To copy from one ODE to another, skip to step 4.

## Prerequisites

1. An LCS Production/Sandbox environment (source)
1. Online development environment (target)

> [!IMPORTANT]
> Ensure that both source and target environments should be in the same geo or region. (Provisioning is now available in all regions)

> [!NOTE]
> Copying across geo is not supported in PPAC.
