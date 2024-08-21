---
title: Install and set up the SAP Setup Assistant template for Power Platform
description: Learn how to install, set up, and deploy the SAP Setup Assistant template for Microsoft Power Platform.
author: menakakmsft
ms.author: menakakmsft
contributors:
  - menakakmsft
  - ellenwehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 08/20/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install and set up the SAP Setup Assistant

As a Power Platform admin, you install, set up, and deploy the SAP Setup Assistant for your organization. This article covers the following steps:

## Step 1: Review prerequisites

Make sure that you have the required license and an environment and data policy in place before you start.

### Confirm licensing

Make sure that your organization has the necessary licensing to use enterprise templates. Power Apps usage rights that are included with Microsoft 365 and Office 365 licenses aren't sufficient. You need one of the following Power Apps plans:

- Power Apps Premium
- Power Apps per app
- Power Apps per app pay-as-you-go-meter
- Power Apps use rights included with Dynamics 365 licenses

> [!TIP]
> A free [Power Apps Developer Plan](https://powerapps.microsoft.com/developerplan/) is a great way to install the template for evaluation purposes.

More license details are available in the [Microsoft Power Platform Licensing Guide.](https://go.microsoft.com/fwlink/?linkid=2085130)

### Create environment and data policies

It's important to have a cohesive environment and data policy and to ensure required resources in place.

- **Administrators**

  Make sure that admins with the necessary privileges are available to assign licenses and create environments:

  - Microsoft Entra ID Global or tenant User Administrator to assign Power Apps or Power BI licenses
  - Power Platform Administrator to create environments

  [Learn more about Microsoft Power Platform administration.](/power-platform/admin/)

- **Environments**

  Follow [application lifecycle management (ALM)](/power-platform/alm/) best practices in [creating and managing environments.](/power-platform/admin/create-environment)

  - Make sure that a Power Platform environment is set up with a Dataverse database.
  - Make sure that environment maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment.

  [Learn more about Power Platform environments.](/power-platform/admin/environments-overview)

- **Data loss prevention policies**

  Make sure that the environment has access to the connectors used by the SAP Setup Assistant template:

  - [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
  - [Office 365 Outlook connector](/connectors/office365/)
  
  [Learn more about data loss prevention policies.](/power-platform/admin/wp-data-loss-prevention)

## Step 2: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be set up manually. You need to set up three new connections for the Expense Reimbursement app.

It's best to create the connections before you import the solution. If you create the connections during import, you have to jump back and forth between browser windows.

1. Sign in to [Power Apps.](https://make.preview.powerapps.com/)
1. Go to **Connections** and select **+ New Connection** to create new connections with each of these connectors:

    - [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
    - [Office 365 Outlook connector](/connectors/office365/)
    - [Teams](/connectors/teams/)

  [Learn how to manage connections in canvas apps.](/power-apps/maker/canvas-apps/add-manage-connections)

## Step 3: Install SAP Setup Assistant

You have one options for installing the SAP Setup Assistant:

- [Select **Get it now** on the template's AppSource page](#install-from-appsource) and an installation window opens automatically in the Power Platform admin center.

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the SAP Setup Assistant template.

### Install from AppSource

AppSource is a Microsoft digital storefront. Take these steps to go through the AppSource install process:

1. Go to the [SAP Setup Assistant on AppSource](<https://aka.ms/AccessSAPSetupAssistantTemplate>) and select **Get it now**.

1. In the **Install SAP Setup Assistant** window in the [Power Platform admin center,](https://admin.powerplatform.microsoft.com/) select the developer environment that you prepared in the [review prerequisites step.](#step-1-review-prerequisites)

1. Agree to the *Terms and Privacy* statements when prompted.

1. Select **Install**. One [solutions](/power-platform/alm/solution-concepts-alm) are installed in your environment:

    - **SAP Setup Assistant**

    Go to the [SAP Setup Assistant overview article](./overview.md) to learn more about the solution.

### Next step

# Use the SAP Setup Assistant

**SAP Setup Assistant** app is part of the SAP Setup Assistant solution:

Once the install and setup steps are complete, the app is ready to share and use.
