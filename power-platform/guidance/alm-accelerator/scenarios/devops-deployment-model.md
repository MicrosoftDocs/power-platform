---
title: "ALM Accelerator for Power Platform DevOps deployment model"
description: "Overview of deployment models for the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 04/07/2023

ms.topic: "article"
ms.reviewer: sericks
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# ALM Accelerator for Power Platform DevOps deployment model

## Overview

Scenarios:

- **Power Platform 1:1 DevOps** - Single Azure DevOps organization and project used by the ALM Accelerator.
- **Power Platform 1:Many DevOps** - Single Azure DevOps organization and multiple projects used by the ALM Accelerator.
- **Multiple Power Platform environments and DevOps** - Multiple Azure DevOps organizations with multiple ALM Accelerator installations.

> [!NOTE]
> Multiple Power Platform environments and DevOps aren't recommended by ALM Accelerator as separate instances will need to be updated and managed. Projects displayed to the user will be managed by role-based access security.

## Factors to consider

As you plan your DevOps deployment model, the following factors may help you decide the best approach:

- Do different teams or business units require separate locations to store and manage solutions?

- Is there a cost and benefit of the overhead in managing and maintaining managing multiple DevOps processes for different Power Platform environments?

- Do different teams or business units have differing levels of business sensitivity or data loss prevention that will require separate handling?

- How will common assets be shared and managed between multiple teams? For example, shared DevOps templates or shared components.

- Azure Active Directory security model. Will each team manage and maintain Active Directory applications and service principals or will they be shared across different Power Platform environments and Azure DevOps organizations?

## Power Platform 1 to 1 DevOps

In this scenario, the following configuration is assumed:

- Single Power Platform Maker Deployment with Shared Power Platform Environments for the Accelerator Canvas Application, Validation, Test, and Production Environments.

- Single Shared Azure DevOps where all Makers collaborate on Solutions.

## Power Platform 1 to many DevOps

In this scenario, the following configuration is assumed:

- Single Power Platform maker deployment with shared Power Platform environments for the Maker Canvas application, validation, test, and production environments.

- Multiple Azure DevOps for different teams or Business Units.

- Each Azure DevOps organization can have a different set of users protected buy different role-based access security rules.

- Multiple pipelines can be defined and used at an Azure DevOps level that allows solutions to be deployed to different validation, test, and production environments.

## Multiple Power Platform environments and DevOps

This scenario is not a recommended deployment model as it requires the deployment and management of multiple AA4PP deployments within the organization.

In this scenario, the following configuration is assumed:

- Multiple Power Platform maker deployments with shared Power Platform Environments for the Maker Canvas application, validation, test, and production environments.

- Multiple Azure DevOps for different teams or business units.

- Each Azure DevOps organization can have a different set of users protected buy different role-based access security rules.

[!INCLUDE[footer-include](../../../includes/footer-banner.md)]
