---
title: "Frequently asked questions | MicrosoftDocs"
description: "Frequently asked questions, tips and how to's about getting the CoE Starter Kit setup"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/13/2021
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Frequently asked questions, tips and how to's

This article will provide you with answers to frequently asked questions and tips on setting up and using the CoE Starter Kit:

- [Installing a solution in Production Environment](internal link)
- [Installing a solution in Teams Environment] (internal link)
- [Set Run only users properties] (internal link)
- [Update Environment Variables] (internal link)
- [Share an app in Production Environment](internal link)
- [Share an app in Teams Environment](internal link)
- [Get an App URL in Production Environment](internal link)
- [Get an App URL in Teams Environment](internal link)

The following sections describe limitations for some components.

## Installing a solution in a Production Environment

1. Go to [make.powerapps.com](<https://make.powerapps.com>).
1. Go to your CoE environment. In the example in the following screenshot, we're importing to the environment named **Contoso CoE**.

    ![Power Apps maker portal environment selection.](media/coe6.png "Power Apps maker portal environment selection")

1. On the left pane, select **Solutions**.
1. Select **Import**, and then **Browse**.
1. Select the solution from the CoE Starter Kit download.
1. Establish connections to activate your solution. If you create a new connection, you must select **Refresh**. You won't lose your import progress.

     ![Establish connections to activate your solution.](media/msi-import.png "Establish connections to activate your solution.")
1. Update environment variable values. The environment variables are used to store application and flow configuration data with data specific to your organization or environment. This means that you only have to set the value once per environment and it will be used in all necessary flows and apps in that environment.
    ![Update environment variable values.](media/msi-envvar.png "Update environment variable values")
1. Select **Import**.

## Installing a solution in a Dataverse for Teams Environment

1. Select the Microsoft Teams group you want to add the solution to.
1. [Install the Power Apps personal app in Microsoft Teams](/powerapps/teams/install-personal-app)
1. [Create your first app](/powerapps/teams/create-first-app) (at least one app is required in the environment to enable the solution import experience).
1. Open to the Power Apps app in Teams, select **Build**, and select the Team you want to add the solution to.
1. Select **See All**

    ![Open the Power Apps app in Teams to import a new solution.](media/ibteams-1.png "Open the Power Apps app in Teams to import a new solution.")

1. Select **Import**
1. In the pop-up window, select **Choose File**.
1. Select the solution from the CoE Starter Kit download.
1. When the compressed (.zip) file has been loaded, select **Next**.
1. Establish connections to the required connectors, If you create a new connection, you must select **Refresh**. You won't lose your import progress.

     ![Establish connections to all connectors used in the solution.](media/coreteams-1.png "Establish connections to all connectors used in the solution.")

1. Update environment variable values. The environment variables are used to store application and flow configuration data with data specific to your organization or environment. This means that you only have to set the value once per environment and it will be used in all necessary flows and apps in that environment.
1. Select **Import**.
1. Once the import is complete, your solution will be available by choosing **Installed apps**. Select **See all** to see all tables, apps and flows part of the solution.

## Set flow run only users properties

1. Remove [unmanged layers](setup.md#installing-updates) for all flows.
1. Go to the details page and click the **Run only users** edit button
![Find setting for run only users.](media/runonlyusersgov1.png "Find setting for run only users")
1. You will see all the connections in the child flow. For each one, change the value to **Use this connection (userPrincipalName\@company.com)**.
1. If there is no connection for any of the connectors, go to **Data** > **Connections**, and create one for the connector.
![Configure run only users.](media/runonlyusersgov2.png "Configure run only users")
1. Once you have updated all run only users, you can turn on the child flow.

## Running a full inventory

The sync flows in the Core Component solution will only update resources that have changed since the last run. After an upgrade, you will only see the benefits of bug fixes or changes when you run a full inventory sync:

1) Set the value of the **Full inventory** environment variable to *Yes* (Learn more: [update environment variables](setup-core-components.md#update-environment-variables)).
1) Turn all flows in Core off and back on (note this step is temporary while we await a fix to a caching bug in flow).
1) Run the *Admin | Sync Template v3* flow.
1) Set the **Full inventory** environment variable back to *No*.
1) Turn all flows in Core off and back on

## Update Environment Variables

The following limitations apply when updating environment variables:

- You cannot update the values for environment variables from within the imported solution.
- You need to always add/update a Current value, not the Default value, because the Default value will be overwritten when you install an upgrade.
- Environment variables are cached in cloud flows until the flow is reset (example: turn the cloud flow off and back on).

To update Environment Variables, you can use the [Admin - Command Center](core-components.md#admin---command-center)

1. Go to [make.powerapps.com](https://make.powerapps.com) and select your CoE environment
1. Open the **Admin - Command Center** app.
1. Select the tool icon and update the current value.

>[!NOTE]
>After changing an environment variable value, you will need to turn on and off all flows using that environment variable to make sure the flow uses the latest value.

If you are not using the [Admin - Command Center](core-components.md#admin---command-center)

To update Environment Variables:

1. If you have installed the solution in a Production environment:
   1. Go to [Power Automate](https://flow.microsoft.com).
   1. On the left pane, select **Solutions**.
   1. Select the **Default Solution**, and change the filter to show **Environment Variables**.
   1. Select a variable that you want to update, and then configure its **Current Value**.

1. If you have installed the solution in a Dataverse for Teams environment:
   1. Go to [Power Automate](https://flow.microsoft.com).
   1. On the left pane, select **Solutions**.
   1. Select the **Common Data Services Default Solution**.
   1. Select **+ Add > Environment Variables**.
   1. Select the existing Environment Variables from the managed solution that you want to update.
   1. Now, change the filter to show **Environment Variables**.
   1. Select a variable that you want to update, and then configure its **Current Value**.

## Share an app from a Production environment

1. Go to [make.powerapps.com](https://make.powerapps.com) and select your CoE environment.
1. Select **... > Share** on the app you want to share.
1. Select the Dataverse security role - **Power Platform Admin SR** when sharing an app with admins, **Power Platform Maker SR** when sharing an app with your makers, ****Power Platform User SR** when sharing an app with end users.
1. Select **Share**.

## Share an app from a Dataverse for Teams environment

1. Open to the Power Apps app in Teams > Build > Select the team you have installed the CoE Starter Kit in > **Share with colleagues**. You must be a team owner to see this option.
1. Search for and select the security group you want to share the apps and tables with.
1. Select the apps you want to share with members of this security group.
1. Select **Save**.
1. Select **Installed apps**.
1. Select **See all**.
1. Select **Tables** from the left pane.
1. Select the table you want to manage > **Manage Permissions**.
1. Assign **[table permissions](/powerapps/teams/set-perms-and-share#assign-table-permissions)** to the security group. The level of permission will depend on the app you are sharing. Perform this step for all tables used by the app you are sharing.
1. To access the app, colleagues with access can go to Microsoft Teams > **Apps** > **Built by your colleagues** and select the app from there.
1. Note that apps are only accessible from within Microsoft Teams.

## Get a Power Apps URL from a Production environment

1. Go to [make.powerapps.com](https://make.powerapps.com) and select your CoE environment.
1. Select **... > Details**.
1. Select the **web link**.

## Add apps to Microsoft Teams

1. Open to the Power Apps app in Teams > Build > Select the team you have installed the CoE Starter Kit in > **Installed apps**.
1. Select **Apps** and select **Edit** for the app you want to add to teams.
1. Select **Publish to Teams > Next**.
1. Select **Add to a Channel > Save and close**.
1. If you would like to save the app URL, navigate to that channel in Microsoft Teams, open the app and select **Go to website**.

## Timeouts in the Admin | Sync Template v3

The Dataverse connector might experience some throttling limits if the tenant has many resources. If you see 429 errors in the flow run history occurring in later runs, you can try the following resolution steps:

- **Configure the retry policy**
  1. Open **Admin \| Sync Template v3**, and then select **Edit**.
  1. Expand the step **Get Environments and store them in the CoE Table**.
  1. Expand the step **Apply to each Environment**
  1. Go to the **Settings** pane for each call to Dataverse, and configure the timeout/retry settings. The default count is set to **10** and the default interval is set to **PT10S** - increase the values incrementally here.

     ![Configure retry policy.](media/coe72.PNG "Configure the retry policy")

- **Configure (reduce) concurrency in Foreach loops to reduce simultaneous calls**
  1. Open **Admin \| Sync Template v3**, and then select **Edit**.
  1. Expand the step **Get Environments and store them in the CoE Table**.
  1. Go to **Settings** for the **Apply to each Environment** step.

     ![Configure concurrency in Foreach.](media/coe73.PNG "Configure concurrency in Foreach")

  1. Use the slider to reduce the value of **Degree of Parallelism**. The default value is 50; reducing the parallelism here will increase the runtime of the flow, so we suggest gradually lowering the number.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
