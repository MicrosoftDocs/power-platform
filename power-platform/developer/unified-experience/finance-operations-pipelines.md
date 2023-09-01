---
title: "Continuous integration and deployment (preview)"
description: Learn how to set up continuous integration and deployment using Azure Pipelines.
author: pvillads
ms.date: 08/31/2023
ms.topic: how-to
ms.reviewer: pehecke
ms.author: pvillads
ms.subservice: developer
---

# Continuous integration and deployment (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This article explains how to implement continuous integration and deployment (CI/CD) of Power Platform unified developer experience assets using Azure Pipelines. You will find learn how to

- Get the latest Dynamics 365 Finance and Operations and Power Platform build tools
- Upload your solution and relevant artifacts using nuget packages with for the unified environment
- Create a build pipeline to generate a package in Power Platform unified package format
- Link to the release pipeline for deployment.

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]