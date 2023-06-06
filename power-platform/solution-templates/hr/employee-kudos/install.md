---
title: Install the Power Platform Employee Kudos solution template (preview)
description: Learn how to install the Employee Kudos solution template for Power Platform.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: install-set-up-deploy
ms.date: 06/05/2023
ms.custom: bap-template
---

# Install the Employee Kudos template

[This article is prerelease documentation and is subject to change.]

Take the following steps to install the Employee Kudos solution template.

## Step 1: Create connections

The installation requires that three new connections be set up. You can create the connections before importing the solution which makes the import smoother, or you can create them during import which requires jumping back and forth between browser windows.

Create three new connections with these connectors:

- A [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
- An [Office 365 Outlook connector](/connectors/office365/)
- An [Office 365 Users connector](/connectors/office365users/)

If you want to create the connections in advance, go to _Connections_, and select **+ New Connection** in the left-side panel. Search for each connection listed in this section and create a connection.

## Step 2: Install from AppSource

Import the Kudos solution template into the environment.

1. Go to to the Kudos solution template in AppSource and click **Get it now**.
1. Select the environment that you want to install into.
:::image type="content" source="media\install/AppSource2.png" alt-text="Select environment":::
1. Agree to the Terms and Privacy Statements by checking the boxes.
1. Click **install**. You will be taken to a screen where you can view the installation status.
Once installation is complete the status will read as _Installed_.

## Step 3: Create an access team

Access team: Kudos-ReadAccessTeam
Access teams are not, technically, a security role as defined in the Power Platform, but they play an important part in securing access rights to a Kudo. Kudo records are _owned_ by the recipient but should be readable by the sender's manager and the recipient's manager. The access team enables this by dynamically assigning the sender's manager and recipient's manager _read access_ to that Kudo through a Power Automate flow.

More information: [Use access teams and owner teams to collaborate and share information](/power-apps/developer/data-platform/use-access-teams-owner-teams-collaborate-share-information)

This application requires an access team on the Kudos table to operate properly. This access team shares each Kudos record with the sender of the Kudos and the recipient's manager. That way, these three users have access to the record:

- Recipient: Gets access to the record by owning it
- Sender: Gets access to the record by being part of the Access Team
- Recipient's manager: Gets access to the record by being part of the Access Team

If, for any reason, any other user needs access to a particular Kudos, an admin will need to add that user to the Access Team to get access automatically.
To create the Access Team:

1. Go to the [Admin Center](<https://admin.powerplatform.microsoft.com/environments>)
1. Click the **Environment** tab and select the environment where the solution was installed.
1. Click **Settings**.
1. Click on **Templates** > **Access team templates**.
:::image type="content" source="media\install/AccessTeam2.png" alt-text="Click on Access team templates":::
1. You will get redirected to the _All Team Templated_ view.
1. Click **New** on the ribbon.
1. Create a new record with the following information. It's important to use the same name as this is the name that the Power Automate flow will use to lookup and use the Access Team.
    - Name: Kudos-ReadAccessTeam
        - Use this name as this is the name that the Power Automate flow will use. You can change the name, but if you do, you must also edit the flow.
    - Entity: Kudo
    - Description: The team to share with the sender of Kudos and the kudos recipient's manager
1. Set _Access Rights_ to _Read_.
1. Click **Save** and close this window.

## Step 4: Assign security roles to users

The solution includes three new security roles:

- **Kudos – Program Admin**
  - A program admin can see all Kudos.
  - Users in this role will act as the administrator of the Kudos program. This security role grants access to the canvas app as a regular user and access to the model-driven app where an admin can view all Kudos, create new Kudos _Types_, add users to the _Opt-out User_ list, and delete and deactivate Kudos and _Opt-out User_ records.
  - Assign this role to users that will manage the Kudos program in your organization.
- **Kudos – Manager**
  - A manager has access to see their own Kudos, as well as the Kudos their direct reports have received.
  - This security role grants access to the canvas app, where users can see their own _sent_ and _received_ Kudos, send new Kudos, and see the Kudos received by employees they currently manage. This security role does not grant _delete_ or _deactivate_ access.
  - Assign this role to those users who manage employees.
- **Kudos –Employee**
  - An employee has access to see the Kudos they have both sent and received.
  - This security role grants access to the canvas app, where users can see their own sent and received Kudos and send new ones.
  - Assign this role to regular users that need access to send and receive Kudos.

> [!NOTE]
>
>All users must also be assigned the _Basic User_ role in addition to any other roles assigned to them.

Roles can be assigned from the Admin Center.

1. Go to the [Admin Portal](https://admin.powerplatform.microsoft.com/)

1. Click on the **Environment** tab and select the environment where the solution was installed.
1. Click on **Users** > **See all**.
1. Select the users, click **Manage security roles** and select the appropriate roles.
1. Click **Save**.

> [!IMPORTANT]
>
>Be sure to also add the **Basic User** security role in addition to any Kudos-specific roles.

## Step 5: Assign _run-only_ access to flows

Set up a new or use an existing security group that represents all users who will use the Kudos App so that the flows can run for all users.

There are two cloud flows that require configuration of run-only access:

- Kudo App – Share Kudo with Sender, Assign to Recipient
- Kudos App – Notification Email

Do the following for each flow:

1. Go to the Kudos solution and open the flow.
1. In the bottom-right, there is a section called _Run only users_. Click **Edit**. The _Manage run-only permissions_ screen will pop up:

 :::image type="content" source="media\install/RunOnly2.png" alt-text="Manage run-only permissions":::

1. In the top box labeled _Invite system users or teams_, enter the security group you want to use that contains all Kudos users.
1. Click **Save**.

## Step 6: Set flow connections

1. Open the Kudos solution template solution by clicking on **Kudos solution template** in the solutions tab.

1. Inside the _Kudos solution template_, go to _Cloud Flows_. There are two cloud flows that require editing:

    - **Kudo app**: Share Kudo with sender, assign to recipient
    - **Kudos app**: Notification email
1. Edit the _Kudo app_ by taking these steps:
    1. Click on the flow to open up a flow overview page.
    1. Click **Edit** in the top-left corner.
    1. Click **Continue**.
    1. Click **Save**.
1. Edit the _Kudos app_ by taking these steps:
    1. Go to _Cloud Flows_ in the Kudos solution.
    1. Click on the flow to open up a flow overview page.
    1. Click **Edit** in the top-left corner.
    1. Click on the first flows step with a warning sign on it.
    1. Click on **+ New connection reference** or if pre-existing connections are listed, you can click on one of those to reuse it. After you do that, the warning should resolve and you will see the flow step without the warning. Note: after clicking, it may take a few seconds for everything to resolve.
    1. Click on the next flow step with a warning on it.
    1. Click on **+ New connection reference** or if pre-existing connections are listed, you can click on one of those to reuse it. After you do that, the warning should resolve and you will see the flow step without the warning. It may take a few seconds for everything to resolve.
    :::image type="content" source="media\install/SetFlow12.png" alt-text="Create new connection reference":::
    1. Click the **Save** button at the bottom of the screen or at the top toolbar.

## Step 7: Set Cloud Flows to _On_

Open the newly installed _Kudos solution template_ and verify that the four cloud flows are set to the _on_ status. If they are not, turn them on.

1. Select the cloud flow that is turned off.
1. Click the **Turn on** button on the top toolbar.

## Step 8: Install sample data (optional)

Sample data along with installation instructions are available on GitHub at this link: [Kudos Sample Data](https://aka.ms/KudosSampleData).

To create your own badges, refer to [Create Custom Badges](use-kudos-app.md#create-custom-kudos-types).

## Step 9: Share the App

1. Go to the [Power Apps Portal](https://make.powerapps.com/).
1. Click on the "Environments" tab and select the environment where the solution was installed.
1. Click on **Apps** and localize the _Kudos App_.
1. Click on the three dots and click **Share**.
1. Look for the users that you want to share the app with.
    - For users that should have access to edit the app, check the _Co- owner_ box.
    - For regular users of the app, leave that checkbox empty.
    - If everyone in the company should be able to use the app, you can look for _Everyone_ in the _Enter a name_ box.
1. Click on the three dots and click **Edit**.
:::image type="content" source="media\install/ShareApp4.png" alt-text="Edit the app":::

## Step 10: Turn on Auditing (optional)

While this is not required, we recommend enabling the audit setting on the system, so it is easy to see who created/updated records in the future.
To do this:

1. Go to the [Admin Portal](https://admin.powerplatform.microsoft.com/).
1. Click **Environment** tab, select the environment where the solution is installed, and click **Audit settings**.

:::image type="content" source="media\install/Auditing1.png" alt-text="Select environment tab and click audit settings":::

1. Click on **Start auditing**.
