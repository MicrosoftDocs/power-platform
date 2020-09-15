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

Multiple governance components are provided in the Center of Excellence (CoE) Starter Kit; each will require some configuration to install. The installation instructions in this article have been segmented based on the set of components that should be grouped and installed together, and dependencies on other segments are outlined in each section.

## Import the solution

The Core Components solution is required for the Audit and Report Components solution, or any other component in the starter kit, to work.

1. Follow the instructions detailed under [Set up core components](setup-core-components.md).

1. Import the *CenterOfExcellenceAuditComponents_x_x_x_xx_managed.zip* file.
1. Create a new connection to the **Approvals** connector
    ![Import the Center of Excellence - Governance components solution](media/msig-import.png "Import the Center of Excellence - Governance components solution")
1. Select **Import** without adding values to the Environment Variables, as we will update them later - see [update environment variables](#update-environment-variables)

## Create a SharePoint document library

The *Archive and Clean Up* flows will archive unneeded apps to a SharePoint library. If you intend to use those flows, you need to configure a SharePoint site and document library first.

### Create the site

If you don't already have a SharePoint Site for CoE Admins in your tenant, create a new team one now for them to access. This site will be specified later in the environmental variable *Archive Site URL (SharePoint Site)*.

More information: [Create a team site in SharePoint](https://support.office.com/article/create-a-team-site-in-sharepoint-ef10c1e7-15f3-42a3-98aa-b5972711777d)

>[!IMPORTANT]
> Now update the *Archive Site URL (SharePoint Site)* environment variable, see **[Update Environment Variable](#update-environment-variables)**.

### Create the library

We've created a helper flow to create the library for you. See the following zip file: *CreateCoEArchivalDocLibraryinSP.zip*.

1. Download and import this flow into your CoE environment.
   To import: Go to [https://flow.microsoft.com/](https://flow.microsoft.com/) > Select CoE  Environment > My Flows > Import
2. Ensure that the flow is turned on, and run it.
3. When the flow is completed, you'll have a document library named PowerAppsArchive.

Ensure that you set up the correct permissions for your SharePoint site; we recommend that only your admin team have Contribute access to the site.

More information: [Create a document library in SharePoint](https://support.office.com/article/create-a-document-library-in-sharepoint-306728fe-0325-4b28-b60d-f902e1d75939).

## Create an Azure AD security group

The *Admin \| Find and add admins as owners for apps that leverage certain
connectors* flow adds the Admin security group to apps; therefore you need to configure the Admin security group first.

If you already have a security group ready, go to [portal.azure.com](<https://portal.azure.com/>) and get its object ID.

1. Follow the steps described here to create a new Azure AD group: [Create a basic group and add members using Azure Active Directory](https://docs.microsoft.com/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal).

1. Add your Admin team to the Azure AD security group.

1. Make note of the **Object Id** of the group, which is needed to share an app with your group.

    ![Azure portal group](media/coe13.png "Azure portal group")

## Update environment variables

This step should be completed after you import the solution. Environment variables are used to store application and flow configuration data. This means that you only have to set the value once per environment and it will be used in all necessary flows and apps in that environment..

All flows in this solution depend on all environment variables' being configured.

1. You might see an error at the top of the Power Apps maker portal, notifying you that environment variables need to be configured.
   > [!NOTE]
   > For the Audit and Report Components solution, five environment variables need to be configured.
   
   ![Environment variables need to be updated](media/coe7.png "Environment variables need to be updated")

   >[!TIP]
   >To view all environment variables in the environment, open the default solution for the environment, and set the **Type** filter to **Environment variable**.

1. Select **See Environment Variables** to set the values as described in the following table.

   | Name | Default value |
   |------|---------------|
   | Archive Site URL (SharePoint Site)  | The *Archive and Clean Up* flow archives app files (.msapp) to a SharePoint site. Paste the URL of the team site you created earlier in [Create a SharePoint document library](#create-a-sharepoint-document-library).
   | Archive Folder                      | Folder (document library) in the SharePoint site where the .msapp file should be stored. Paste the name of the [document library you created earlier](#create-a-sharepoint-document-library).   |
   | Auto Delete On Archive | Determines whether apps are deleted when they're archived in the following flow: Admin \| App Archive and Clean Up - Check Approvals and Archive. <br> Value must be Yes or No. A default value of No is provided. |
   | Developer Compliance Center         | Navigate to the details page of the Developer Compliance Center (canvas app) included with this solution, and copy the web link (to launch the app) and paste it into this variable.  |
   | Power Platform Admin Security Group | The *Admin \| Find and add admins as owners for apps that leverage certain connectors* flow adds the Admin security group to apps. Configure the Admin security group first, then enter the Azure AD group ID (Object Id) of the group here. Note: Be sure you enter the Object Id, not an email address. |

## Initialize flow approval entities in your environment

The archive approval flows (*Admin \| App Archive and Clean Up – Start Approval*, *Admin \| Flow Archive and Clean Up – Start Approval*, *Admin \| App Archive and Clean Up – Check Approval*, and *Admin \| Flow Archive and Clean Up – Check Approval*), use the built-in Approval actions of Power Automate. In the background, the built-in Approval actions use Common Data Service. If you've installed the solution in a new environment, the Approval entities must be initialized. The easiest way to do this is to create a "dummy" approval flow.

1. Go to [flow.microsoft.com](https://flow.microsoft.com).

1. Select **+ New** > **Instant (From Blank)**.

1. Pick **manually trigger a flow** as the trigger, and enter *Admin \| Dummy Approval Flow* as the name.
   
   ![Build an instant flow](media/coe14.png "Build an instant flow")

1. Select **+ New Step** to add an approval action to the flow, and then search for and select **Create an approval**.

1. Select a dummy title, and enter your email address under **Assigned To**.

   ![Approval flow](media/coe16.png "Approval flow")

1. In the upper-right corner, select **Test**, and then select **I'll perform the trigger action**.

1. Select **Save & Test**  

1. Select **Run Flow**  

    > [!NOTE]
    > This flow can take up to ten minutes to run initially. After it runs, you can delete the flow because it won't be needed anymore.

1. Select **Solutions** on the left side panel, and you should now see two new Flow Approvals solutions. Note that the presence of these solutions was the point of this step, and the way you know it succeeded.

   ![Flow Approval solutions](media/coe17.png "Flow Approval solutions")

## Activate the flows

This Governance Components solution contains seven flows:

-  Admin \| App Archive and Clean Up – Start Approval
-  Admin \| App Archive and Clean Up – Check Approval
-  Admin \| Flow Archive and Clean Up – Start Approval
-  Admin \| Flow Archive and Clean Up – Check Approval
-  Admin \| Compliance detail request
-  SETUP REQUIRED \| Admin \| Find and add admins as owners for apps that leverage certain connectors ([Customization Instructions](governance-components.md#setup-required--admin--find-and-add-admins-as-owners-for-apps-that-leverage-certain-connectors))
-  SETUP REQUIRED \| Admin \| Find and disable flows that leverage certain connectors ([Customization Instructions](governance-components.md#setup-required--admin--find-and-disable-flows-that-leverage-certain-connectors))

Follow the same instructions to configure the flows as explained in [Activate the Sync Template flows](setup-core-components.md#activate-the-sync-template-flows).

## Share apps with makers

The Governance Components solution contains one app, which is used by makers to update the compliance details of their applications.

**Developer Compliance Center**

As soon as you're ready to adopt the CoE with your app and flow makers, share this app with them. Your makers must have a Power Apps Premium license, as mentioned under [Prerequisites](setup.md#prerequisites).
