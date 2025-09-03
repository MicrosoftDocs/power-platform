---
title: Azure DevOps deployment model
description: Learn about Azure DevOps deployment models for the ALM Accelerator for Power Platform.
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.reviewer: jhaskett-msft
ms.custom:
  - bap-template
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:09/02/2025
ms.date: 09/02/2025
ms.topic: concept-article
search.audienceType:
  - admin
search.app:
  - PowerApps
  - Powerplatform
---

# Azure DevOps deployment model

The ALM Accelerator for Power Platform supports three Azure DevOps deployment models:

- [**1:1**](#11-power-platform-to-azure-devops): A single Azure DevOps organization and a single ALM Accelerator project.
- [**1:Many**](#1many-power-platform-to-azure-devops): A single Azure DevOps organization and multiple ALM Accelerator projects.
- [**Many:Many**](#manymany-power-platform-to-azure-devops): Multiple Azure DevOps organizations with multiple ALM Accelerator installations.  
    Don't use a many-to-many scenario. You need to update and manage separate instances and use role-based security to manage which projects the user sees.

## Factors to consider

As you plan your Azure DevOps deployment model, use the following factors to help you determine the best approach:

- Do different teams or business units require separate locations to store and manage solutions?

- Do different teams or business units have different levels of business sensitivity or data policies that require separate handling?

- Does the benefit outweigh the cost of the overhead in managing and maintaining multiple Azure DevOps processes for different Power Platform environments?

- How will common assets like Azure DevOps templates and shared components be shared and managed between multiple teams?

- Will each team manage and maintain Microsoft Entra applications and service principals? Or will Microsoft Entra applications and service principals be shared across different Power Platform environments and Azure DevOps organizations?

## 1:1 Power Platform to Azure DevOps

In this scenario, the following configuration is assumed:

- Single Power Platform maker deployment with shared Power Platform environments for the ALM Accelerator canvas app and validation, test, and production environments.

- Single shared Azure DevOps organization where all makers collaborate on solutions.

## 1:Many Power Platform to Azure DevOps

In this scenario, the following configuration is assumed:

- A single Power Platform maker deployment with shared Power Platform environments for the maker canvas app and validation, test, and production environments.

- Multiple Azure DevOps organizations for different teams or business units.

- Each Azure DevOps organization can have a different set of users protected by different role-based security rules.

- Multiple pipelines can be defined and used at an Azure DevOps organization level to allow solutions to be deployed to different validation, test, and production environments.

## Many:Many Power Platform to Azure DevOps

This scenario isn't recommended because it requires the deployment and management of multiple ALM Accelerator instances.

In this scenario, the following configuration is assumed:

- Multiple Power Platform maker deployments with shared Power Platform Environments for the maker canvas app and validation, test, and production environments.

- Multiple Azure DevOps organizations for different teams or business units.

- Each Azure DevOps organization can have a different set of users protected by different role-based security rules.

[!INCLUDE [footer-include](../../../includes/footer-banner.md)]
