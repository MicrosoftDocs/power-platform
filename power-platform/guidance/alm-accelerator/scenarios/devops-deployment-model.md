---
title: Azure DevOps deployment model
description: Learn about Azure DevOps deployment models for the ALM Accelerator for Power Platform.
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.reviewer: sericks
ms.custom: bap-template
ms.date: 04/07/2023
ms.topic: concept-article
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# Azure DevOps deployment model

The ALM Accelerator for Power Platform supports three Azure DevOps deployment models:

- [**1:1**](#11-power-platform-to-azure-devops): A single Azure DevOps organization and a single ALM Accelerator project
- [**1:Many**](#1many-power-platform-to-azure-devops): A single Azure DevOps organization and multiple ALM Accelerator projects
- [**Many:Many**](#manymany-power-platform-to-azure-devops): Multiple Azure DevOps organizations with multiple ALM Accelerator installations  
    We don't recommend a Many:Many scenario. You'd need to update and manage separate instances, and projects displayed to the user would be managed by role-based security.

## Factors to consider

As you plan your Azure DevOps deployment model, the following factors may help you determine the best approach:

- Do different teams or business units require separate locations to store and manage solutions?

- Do different teams or business units have different levels of business sensitivity or data policies that require separate handling?

- Does the benefit outweigh the cost of the overhead in managing and maintaining multiple Azure DevOps processes for different Power Platform environments?

- How will common assets like Azure DevOps templates and shared components be shared and managed between multiple teams?

- Will each team manage and maintain Microsoft Entra applications and service principals? Or will Microsoft Entra applications and service principals be shared across different Power Platform environments and Azure DevOps organizations?

## 1:1 Power Platform to Azure DevOps

In this scenario, the following configuration is assumed:

- Has a single Power Platform maker deployment with shared Power Platform environments for the ALM Accelerator canvas app and validation, test, and production environments.

- Has a single shared Azure DevOps organization where all makers collaborate on solutions.

## 1:Many Power Platform to Azure DevOps

In this scenario, the following configuration is assumed:

- Has a single Power Platform maker deployment with shared Power Platform environments for the maker canvas app and validation, test, and production environments.

- Has multiple Azure DevOps organizations for different teams or business units.

- Each Azure DevOps organization can have a different set of users protected by different role-based security rules.

- Multiple pipelines can be defined and used at an Azure DevOps organization level to allow solutions to be deployed to different validation, test, and production environments.

## Many:Many Power Platform to Azure DevOps

This scenario isn't recommended because it requires the deployment and management of multiple ALM Accelerator instances.

In this scenario, the following configuration is assumed:

- Has multiple Power Platform maker deployments with shared Power Platform Environments for the maker canvas app and validation, test, and production environments.

- Has multiple Azure DevOps organizations for different teams or business units.

- Each Azure DevOps organization can have a different set of users protected by different role-based security rules.

[!INCLUDE [footer-include](../../../includes/footer-banner.md)]
