---
title: Install and configure the Awards and Recognition template for Power Platform
description: Learn how to install, configure, and deploy the Awards and Recognition template for Microsoft Power Platform.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: install-set-up-deploy
ms.date: 09/27/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install and configure the Awards and Recognition template

As a Power Platform admin, you can access, install, configure, and deploy the Awards and Recognition template for your organization. To get started, follow the steps to install and configure the Awards and Recognition template.

## Step 1: Create connections

The installation requires a Microsoft Dataverse connection. It's best to create connections before importing the template to make the import smoother. If you create the connections during import, you have to jump back and forth between browser windows.

Create a new connection with the [Microsoft Dataverse connector](/connectors/commondataserviceforapps/).

If you want to create the connection in advance, go to **Connections**, and select **+ New Connection**. Search for the Microsoft Dataverse connector and create a connection.

## Step 2: Install from AppSource

You can access the template on AppSource and install into the Power Platform environment that has the Dataverse connector set up.

1. Go to the Awards and Recognition solution template in AppSource and select **Get it now**.
1. Select the environment that you want to install the template into.

1. Agree to the Terms and Privacy Statements by checking the boxes.

1. Select **Install**. You'll be taken to a screen where you can view the installation status. After the installation is complete, the status shows as *Installed*.

> [!TIP]
> You can log your questions and get support for the Awards and Recognition template at the [**Templates-for-Power-Platform**](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site.

## Step 3: Assign security roles

Set up security roles in your solutions so admins can manage access to and the experiences in the app. Take these steps to get started:

1. Go to [**Power Platform admin center**](https://admin.powerplatform.microsoft.com/home).
1. Select **Environment** and then select the environment where the solution was installed.
1. Select **Users**, then select **See all**.
1. Choose the users who will be using the app and then select **Manage security roles** to assign *Basic User* and any other appropriate roles to each user.
1. Select **Save**.

### Awards and Recognition

**Program Admin**: Assign the admin role to people who will be configuring award programs and reviewing and finalizing nominations.

- Program admins can see and update all the data.
- Admins can configure awards, award assessment ratings, nomination periods, groups, and group membership.
- Admins can approve, reject, withdraw, or cancelling nominations.
- Admins can create, update, or delete language localization data.

**User**: Assign the user role to *everyone* who will potentially nominate others for awards.

- Users can nominate people and see their own data.
- Users can read the localized data.

### Employee Experiences Base

**Localizer**: You can grant the localizer role independently of the Awards and Recognition security roles so someone can create localized text strings without the ability to administer the awards program.

- Localizers can create localized text strings.
- Localizers can nominate people and see their own data.

> [!IMPORTANT]
> All users must be assigned the *Basic User* role in addition to any other roles assigned to them.

## Step 4: Set cloud flows to *on*

Open the newly installed Awards and Recognition solution and verify that the cloud flow is set to the *on* status. If not, turn it on.

1. Select **Solutions** on left-side panel.
1. Select the **Awards and Recognition** solution from the list.
1. Select **Cloud flows (1)** on the left-side panel.
1. Select the *flow*.
1. Select **Turn on** on the command bar if the flow is not already set to *on*.

## Step 5: Share the app

Once you have configured the app

1. Select **Apps** in the environment in which Awards and Recognition is installed.
1. Locate the Awards and Recognition app.
1. Go to the *three dots* to the right of the Awards and Recognition app and select **Share**.
1. Search for and add the users who you want to share the app with.

    - For users who should have access to *edit* the app, check the Co-owner box.
    - For regular users of the app, leave that checkbox empty.
    - If everyone in the organization should be able to use the app, you can look for Everyone in the Enter a name box.

1. In the *Data permission area*, you can select roles from a drop-down list. It's next to the Microsoft Dataverse tables that the Awards and Recognition app uses. Be sure to select the correct Awards and Recognition role (Program Admin or User) along with *Basic User* for each user.
1. Add an optional email message.
1. Select **Share**.

> [!TIP]
> You may want to only share the app with the Awards and Recognition program admins first so they can configure awards, award assessment ratings, nomination periods, groups, and group membership. Once the program admins have set up the app for wider use, they can have you deploy it to the wider audience.

> [!NOTE]
> If you didn't install the Awards and Recognition solution and it hasn't been shared with you, then you'll have to navigate into the Awards and Recognition solution to find the app there.

More information: [Share a canvas app with your organization](/power-apps/maker/canvas-apps/share-app)

## Step 6: Turn on auditing (optional)

While this isn't required, we recommend enabling the audit setting on the system, so it's easy to see who created/updated records in the future. To do this:

1. Go to [**Power Platform admin center**](https://admin.powerplatform.microsoft.com/home).
1. Select **Environment** to select the environment where the solution is installed.
1. Select **Audit settings**.
1. Select **Start auditing**.

## Next steps

[Manage the Awards and Recognition app](manage.md)
[Use the Awards and Recognition app](use.md)
