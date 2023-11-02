---
title: Set up environments and data policies
description: Learn best practices for setting up environments and data policies to support the deployment of the SAP Procurement solutions.
author: jongilman88
ms.author: jongilman
contributors:
  - EllenWehrle
  - robinsonshields
  - microsoft-george
  - tverhasselt
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 08/18/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Set up environments and data policies

A cohesive environment strategy supported by data policies enables your organization to protect your existing digital assets and securely deploy solutions.

This article will help you and your team get started with:

- Developing best-practice processes.
- Establishing an environment strategy that supports application lifecycle management (ALM).
- Setting up data loss protection (DLP) policies that support SAP integration with Power Platform.

## Prepare

Take a couple of preparation steps before developing your organization's environment strategy for Power Platform integration with SAP.

First, make certain that members of your team are assigned admin roles:

- Microsoft Power Platform System admin
- Dynamics 365 Global admin

As an admin, please review [Administer Microsoft Power Platform](/power-platform/admin/admin-documentation). You can also review [Use service admin roles to manage your tenant](/power-platform/admin/use-service-admin-role-manage-tenant), [Management and monitoring](/power-platform/admin/wp-management-monitoring), and [Working with the admin portals](/power-platform/admin/wp-work-with-admin-portals) to gain more insight on how your organization can best secure and manage an SAP + Power Platform deployment.

Next, review your organization's current Power Platform administration and governance practices with your team. Identify strengths and opportunities for improvement. This is also a good time to review [Microsoft Power Platform best practices](/power-platform/guidance/adoption/methodology).

More information: [Security and governance considerations](/power-platform/admin/governance-considerations)

## Develop an environment strategy

[Environments](/power-platform/admin/environments-overview) serve as containers to separate applications that might have different roles, security requirements, stages of deployment, or target audiences.

Installing, configuring, testing, and running [solutions](/power-apps/maker/data-platform/solutions-overview) on Power Platform requires [application lifecycle management](/power-platform/alm/overview-alm). A three-environment strategy supports ALM:

- **Development**: The development sandbox environment is where the SAP Procurement solution template should first be installed and copied so it can be extended to meet your business requirements. This environment is connected to an SAP developer environment.
- **Test**: The test sandbox environment is where configurations layered on top of the SAP Procurement solutions should be staged and validated by technical and business experts. This environment is connected to an SAP test environment.
- **Production**: The production environment is where your extended and tested SAP solution for Power Platform goes live so your organization's designated users have access to it. This environment is connected to your production SAP environment.

> [!NOTE]
> Each environment requires that a [Microsoft Dataverse database](/power-platform/admin/create-database) be created for it.

More information: [Establish an environment strategy](/power-platform/guidance/adoption/environment-strategy), [Manage Microsoft Dataverse settings](/power-platform/admin/admin-settings), [Microsoft Dataverse developer documentation](/power-apps/developer/data-platform/)

## Enable managed environments

[Managed environments](/power-platform/admin/managed-environment-overview) give admins more control when running mission-critical processes—such as your procure-to-pay processes. You can:

- Put tighter controls on accessing SAP data by setting [data policies](/power-platform/admin/managed-environment-data-policies) and limiting sharing.
- Get adoption insights by viewing usage.
- Take advantage of other capabilities that support solutions running enterprise scenarios.

:::image type="content" source="media/set-up-environments-data-policies/enable-managed-env.png" alt-text="Reuse environment variables in the SAP ERP connector's actions":::

## Set up data policies

[Data loss protection (DLP) policies](/power-platform/admin/wp-data-loss-prevention) within environments ensure that data is managed in a uniform way across the organization and act as the guardrails that prevent users from unintentionally exposing organizational data.

The DLP policies you set up ensure that your valuable SAP business data is not accidentally shared to other parts of the business or externally.

[Create a data policy](/power-platform/admin/managed-environment-data-policies) that meets your organizational needs and allows the environments targeted for the SAP procurement solutions to have access to the [SAP ERP](/connectors/saperp/), [Microsoft Dataverse](/connectors/commondataserviceforapps/), [Office 365 Users](/connectors/office365users/) connections, and any other connections needed to run your procure-to-pay processes.
