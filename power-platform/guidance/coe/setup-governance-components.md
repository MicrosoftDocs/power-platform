---
title: "Set up governance components | MicrosoftDocs"
description: "Learn how to set up the governance components of the CoE Starter Kit"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Set up governance components

Multiple governance components are provided in the Center of Excellence (CoE) Starter Kit; each will require some configuration to install. The installation instructions in this article have been segmented based on the set of components that should be grouped and installed together. Dependencies on other segments are outlined in each section.

## Create a SharePoint document library

The Archive and Clean Up flows will archive unneeded apps to a SharePoint library. If you intend to use those flows, you need to configure a SharePoint site and document library first.

### Create the site

If you don't already have a SharePoint site for CoE admins in your tenant, create a new team site now for them to access. This site will be specified later in the environment variable *Archive Site URL (SharePoint Site)*.

More information: [Create a team site in SharePoint](https://support.office.com/article/create-a-team-site-in-sharepoint-ef10c1e7-15f3-42a3-98aa-b5972711777d)

>[!IMPORTANT]
> As soon as you create the team site, you need to update the *Archive Site URL (SharePoint Site)* environment variable, as described in [Update environment variables](#update-environment-variables) later in this article.

### Create the library

We've created a helper flow to create the library for you. See the following zip file: CreateCoEArchivalDocLibraryinSP.zip.

1. Download the zip file.
1. Go to [https://flow.microsoft.com/](https://flow.microsoft.com/) > **Select CoE Environment** > **My Flows** > **Import**.
1. Ensure that the flow is turned on, and run it.
1. When the flow is completed, you'll have a document library named PowerAppsArchive.

Ensure that you set up the correct permissions for your SharePoint site; we recommend that only your admin team have Contribute access to the site.

More information: [Create a document library in SharePoint](https://support.office.com/article/create-a-document-library-in-sharepoint-306728fe-0325-4b28-b60d-f902e1d75939)

## Create an Azure AD security group

Some features of the CoE Starter Kit require an Admin security group; therefore, you need to configure the Admin security group first.

If you already have a security group, go to [portal.azure.com](<https://portal.azure.com/>) and get its object ID.

1. Follow the steps described here to create a new Azure Active Directory (Azure AD) group: [Create a basic group and add members using Azure AD](https://docs.microsoft.com/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal).

1. Add your admin team to the Azure AD security group.

1. Make note of the **Object Id** of the group, which is needed to share an app with your group.

    ![Azure portal group](media/coe13.png "Azure portal group")

## Import the solution

The core components solution is required for the audit and report components solution&mdash;or any other component in the starter kit&mdash;to work.

1. Follow the instructions in [Set up core components](setup-core-components.md).

1. Import the CenterOfExcellenceAuditComponents_*x_x_x_xx*_managed.zip file.

1. Create a new connection to the **Approvals** connector.
    ![Import the CoE governance components solution](media/msig-import.png "Import the CoE governance components solution")

1. Update the environment variable values. Environment variables are used to store application and flow configuration data. This means that you only have to set the value once per environment, and it will be used in all necessary flows and apps in that environment.

    | Name | Current value |
   |------|---------------|
   | Archive Site URL (SharePoint Site)  | The Archive and Clean Up flow archives app files (.msapp) to a SharePoint site. Paste the URL of the team site you created earlier in [Create a SharePoint document library](#create-a-sharepoint-document-library).
   | Archive Folder                      | The folder (document library) in the SharePoint site where you want the .msapp file to be stored. Paste the name of the [document library you created earlier](#create-a-sharepoint-document-library).   |
   | Auto Delete On Archive | Determines whether apps are deleted when they're archived in the Admin \| App Archive and Clean Up - Check Approvals and Archive flow. <br> Value must be Yes or No (default). |
   | Developer Compliance Center         | Leave this blank on import, and [update the environment variable](#update-environment-variables) after the import has finished by first going to the details page of the Developer Compliance Center (canvas app) included with this solution, and then copying the web link (the link used to open the app) and pasting it into this variable.  |
   | Power Platform Admin Security Group | The Admin \| Find and Add Admins as Owners for Apps that Leverage Certain Connectors flow adds the Admin security group to apps. Configure the Admin security group first, and then enter the Azure AD group ID (**Object Id**) of the group here. Note: Be sure you enter the **Object Id**, not an email address. |

1. Select **Import**, without adding values to the environment variables. We'll update them in the following step.

## Update environment variables

Complete this step after you import the solution. Environment variables are used to store application and flow configuration data. This means that you only have to set the value once per environment, and it will be used in all necessary flows and apps in that environment..

All flows in this solution depend on all environment variables' being configured.

>[!TIP]
>To view all environment variables in the environment, open the default solution for the environment and set the **Type** filter to **Environment variable**.

1. Select **See Environment Variables** to set the values as described in the following table.

   | Name | Current value |
   |------|---------------|
   | Archive Site URL (SharePoint Site)  | The Archive and Clean Up flow archives app files (.msapp) to a SharePoint site. Paste the URL of the team site you created earlier in [Create a SharePoint document library](#create-a-sharepoint-document-library).
   | Archive Folder                      | The folder (document library) in the SharePoint site where you want the .msapp file to be stored. Paste the name of the [document library you created earlier](#create-a-sharepoint-document-library).   |
   | Auto Delete On Archive | Determines whether apps are deleted when they're archived in the Admin \| App Archive and Clean Up - Check Approvals and Archive flow. <br> Value must be Yes or No(default). |
   | Developer Compliance Center         | Go to the details page of the Developer Compliance Center (canvas app) included with this solution, and then copy the web link (the link used to open the app) and paste it into this variable.  |
   | Power Platform Admin Security Group | The Admin \| Find and Add Admins as Owners for Apps that Leverage Certain Connectors flow adds the Admin security group to apps. Configure the Admin security group first, and then enter the Azure AD group ID (**Object Id**) of the group here. Note: Be sure you enter the **Object Id**, not an email address. |

## Initialize flow approval entities in your environment

The archive approval flows (Admin \| App Archive and Clean Up – Start Approval, Admin \| Flow Archive and Clean Up – Start Approval, Admin \| App Archive and Clean Up – Check Approval, and Admin \| Flow Archive and Clean Up – Check Approval) use the built-in Approval actions of Power Automate. In the background, the built-in Approval actions use Common Data Service. If you've installed the solution in a new environment, the Approval entities must be initialized. The easiest way to do this is to create a "dummy" approval flow.

1. Go to [flow.microsoft.com](https://flow.microsoft.com).

1. Select **+ New** > **Instant (From Blank)**.

1. Pick **manually trigger a flow** as the trigger, and enter **Admin \| Dummy Approval Flow** as the name.

   ![Build an instant flow](media/coe14.png "Build an instant flow")

1. Select **+ New Step** to add an approval action to the flow, and then search for and select **Create an approval**.

1. Select a dummy title, and enter your email address under **Assigned To**.

   ![Approval flow](media/coe16.png "Approval flow")

1. In the upper-right corner, select **Test**, and then select **I'll perform the trigger action**.

1. Select **Save & Test**  

1. Select **Run Flow**  

    > [!NOTE]
    > This flow can take up to 10 minutes to run initially. After it runs, you can delete the flow because you won't need it anymore.

1. On the left pane, select **Solutions**. You'll see two new flow approvals solutions. Note that the presence of these solutions was the point of this step, and this is the way you know it succeeded.

   ![Flow approval solutions](media/coe17.png "Flow approval solutions")

## Activate the flows

This governance components solution contains five flows:

- Admin \| App Archive and Clean Up – Start Approval
- Admin \| App Archive and Clean Up – Check Approval
- Admin \| Flow Archive and Clean Up – Start Approval
- Admin \| Flow Archive and Clean Up – Check Approval
- Admin \| Compliance Detail Request

These flows will be turned off when you import the solution. You can turn them on as soon as you're ready to use them.

## Share apps with makers

The governance components solution contains one app, which is used by makers to update the compliance details of their applications.

### Developer Compliance Center

Your app, flow and bot makers will  use the Developer Compliance Center app to provide further information about the resources they're building - get familiar with the [audit process](example-processes.md) and share the app with your makers. Your makers must have a Power Apps Premium license to use this app.

In addition to sharing the app, you will also need to share the data by providing data permissions to the user.

1. Navigate to make.powerapps.com and select the app
1. Select ... > Share
1. Select the Common Data Service data permissions
   ![Sharing Data 1](media/SharingData1.png "Sharing Data 1")
1. Select the Power Platform Maker Security Role
   ![Sharing Data 2](media/SharingData2.png "Sharing Data 2")
1. Select Share

