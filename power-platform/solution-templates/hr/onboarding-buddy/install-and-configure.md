---
title: Install and configure the Onboarding Buddy template for Power Platform
description: Learn how to install and configure the Onboarding Buddy template for Power Platform.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: install-set-up-deploy
ms.date: 09/25/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install and configure the Onboarding Buddy template

As a Power Platform admin, you can access, import, install, configure, and deploy the Onboarding Buddy template for your organization.

> [!IMPORTANT]
> Two solutions will always be installed in your environment:
>
> - **Employee Experience Base**: Contains common foundational components that all human resource (HR) solutions use. For now, this is limited to components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
> - **Onboarding Buddy**: Contains all the components needed to enable the implementation of an Onboarding Buddy program within an organization.

To get started, follow the steps to install and configure the Onboarding Buddy template.

## Step 1: Prepare connectors

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be manually manually set up.

The installation requires you to set up four new connections for the Onboarding Buddy app. It's best to create the connections before importing the solution to make the import smoother. If you create the connections during import, you have to jump back and forth between browser windows.

- [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
- [Office 365 Outlook connector](/connectors/office365/)
- [Office 365 Users connector](/connectors/office365users/)
- [Office 365 Groups connector](/connectors/office365groups/)

To create the connections in advance, go to **Connections**, and select **+ New Connection** in the left-side panel. Search for each connection listed in this section and create a connection.

## Step 2: Import solutions

Access the template on AppSource and install the template's solutions into a Power Platform developer (sandbox) environment that has all the connectors set up.

- Go to the Onboarding Buddy template in AppSource and select **Get it now**.
- Select the environment that you want to install the template into.

- Agree to the Terms and Privacy Statements by checking the boxes.

- Select **install**. You'll be taken to a screen where you can view the installation status. After the installation is complete, the status shows as *Installed*.

OR

### Install Employee Experience Base solution

1. In the Power Apps Maker Portal, select the developer (sandbox) environment that you want to install the solutions in and then select the Solutions menu option.

1. Select ****Import solution**, selecting the Employee Base managed solution file.

1. Select **Import**.

### Install Onboarding Buddy solution  

1. After the Employee Experience Base solution successfully installs, navigate back to the Solutions menu option.
1. Select **Import solution**, then select the Onboarding Buddy managed solution file.
1. Select **Import**.

> [!TIP]
> You can log your questions and get support for the Employee Kudos template at the [**Templates-for-Power-Platform**](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site.

## Step 3: Assign security roles to the users

The Onboarding Buddy solution contains two security roles:

- **Administrator** - Assign this role to users who need access to the model-driven app administrative app and will have access to manage all reference data and see all records.
- **User** - Assign this role to all users of the application.

Roles can be assigned from the admin portal.

1. Go to the [admin portal](https://admin.powerplatform.microsoft.com/).

1. Select the **Environment** tab and select the environment where the solution was installed.  

1. Select **Users** > **See all**.

1. Select the user(s).
1. Select **Manage security roles** and select the appropriate roles for each user.
1. Select **Save**.
:::image type="content" source="media/ob-set-up-roles-env.png" alt-text="Screen of Power Platform admin center showing where to select environments and users.":::

> [!NOTE]
> All licensed users, whether or not they are members of the security groups, must be assigned security roles to access data in the environments. You assign the security roles in the web application. If users don't have a security role, they'll get a data access denied error when trying to run an app. Users can't access environments until they are assigned at least one security role for that environment.

More information:

- [Manage application users in the Power Platform admin center](/power-platform/admin/manage-application-users)
- [Control user access to environments: security groups and licenses](/power-platform/admin/control-user-access)
