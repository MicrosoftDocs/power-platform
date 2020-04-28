---
title: "Set up nurture components | MicrosoftDocs"
description: "Setup instructions for how to set up the nurture components solution of the CoE Starter Kit"
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

# Set up nurture components

Multiple nurture components are provided in the Center of Excellence (CoE) Starter Kit; each will require some configuration to install. The installation instructions in this article have been segmented based on the set of components that should be grouped and installed together, and dependencies on other segments are outlined in each section.

## Import the solution

The Core Components solution is required for the Nurture Components solution, or any other component in the starter kit, to work.

1. Follow the instructions detailed under [Set up core components](setup-core-components.md).

1. Import the *CenterOfExcellenceNurtureComponents_x_x_x_xx_managed.zip* file.

## Update environment variables

Environment variables are used to store application and flow configuration data. This means you only have to set the value once and it will be used in all necessary flows and apps.

All flows in this solution depend on all environment variables' being configured.

1. You may see an error notifying you that environment variables need to be configured.
   > [!NOTE]
   > For the Nurture Components solution, three environment variables need to be configured.
   
   ![Environment variables need to be updated](media/coe7.png "Environment variables need to be updated")

>[!TIP]
>To view all Environment Variables in the Environment, open the Default Solution for the Environment, and filter to Type Environment Variable

1. Select **See Environment Variables** to set the values as described in the following table.

| Name | Default value |
|------|---------------|
| Power Platform Maker Office 365 Group | The *Admin \| Welcome Email* flow sends a welcome email to onboard new makers and adds them to an Office 365 group. You can use this group to send communications to your makers or invite them to a Yammer or Teams group. Configure the group ID here.|
| Training in a day - Feedback Form     | The *Training in a day* package includes a flow that automatically sends a feedback request to attendees on the day of the event. Configure the form URL (<https://forms.office.com/>...) here.    |
| Power User Site URL (SharePoint Site) | The site that your Power Platform Power Users can use to communicate and share files. You will use it here to house the Template Library for them. |

## Activate the flows

The Nurture Components solution contains five flows:

-  Admin \| Newsletter with Product Updates

-  Admin \| Welcome Email

-  Training in a day \| Feedback Reminder

-  Training in a day \| Registration Confirmation

-  Training in a day \| Reminder 3 days prior to event

Follow the same instructions to configure the flows as explained in [Activate the Sync Template flows](setup-core-components.md#activate-the-sync-template-flows).

## Create a SharePoint document library

This library is used to store templates, components, and documents that you want to share with makers in your organization. In this section, you'll create and populate the library by using a set of starter materials.

The Template Catalog app depends upon this library.

### Create the site
If you do not already have a SharePoint Site for the Power Platform Power Users in your tenant, create a new team one now for them to access.
This site is the one specified in the following environmental variable: *Power User Site URL (SharePoint Site)*

More information: [Create a team site in SharePoint](https://support.office.com/article/create-a-team-site-in-sharepoint-ef10c1e7-15f3-42a3-98aa-b5972711777d)

### Create the library

We have created a helper flow to create the library for you, see the following zip file: *CreateCoETemplateLibaryDocLibraryinSP.zip*, part of your CoE Starter Kit download.

1. Download and import this zipped flow into your CoE environment using the same pattern as you did to [import the audit log flow](setup-auditlog.md).

2. Ensure the flow is turned on and run the flow.
3. When complete, you will have a Doc Lib named *AppTemplates* with the following shown for the default view:

   | Column name | Type |
   |----|----|
   |Title | Single line of text |
   |DisplayName | Single line of text |
   |ItemDescription | Multiple lines of text |
   |Featured | Yes/No |
   |TemplateType | Choice |

   The **TemplateType** column will have the following options: **App**, **Flow**, **Component**, **Image**, **Document**.

<!--- Commenting this out until version 3.20041.19 is live so that these msapp files will work in production
### Load Sample Templates
We have created a starter set of templates for you, to access them, please do the following:

1. Download the CoE Starter Components zip file from the [GitHub repository](https://github.com/microsoft/powerapps-tools/tree/master/Administration/CoEStarterKit) and extract: *CoE Components.zip*
2. Browse to the newly made Document library:
![BrowseToLib](media\sp-upload-1.png)
3. Chose to upload files
![BrowseToLib](media\sp-upload-2.png)
4. Select all files in the library downloaded above
![BrowseToLib](media\sp-upload-3.png)
5. Back in the Document Library, chose to Quick Edit
![BrowseToLib](media\sp-upload-4.png)
6. Select the first row under DisplayName, and  paste the data from the  following into the table.

    | DisplayName | ItemDescription |Featured|TemplateType|
    |------------------|---------|--------|--------|
    |Calendar Control|A control for your users to get date values from a calendar for use in their PA Canvas Apps  | Yes |Component|
    |Components Demo App|App showing the starter components from the CoE Starter Kit  | Yes |App|
    |Dual Range Slider|A control for your users to get numeric values from a slider control that lets them pick two numbers, for use in their PA Canvas Apps | Yes |Component|
    |Header Nav Control|A control for your users to easily have a nice header with navigation control for their PA Canvas Apps | Yes |Component|
    |Admin White Paper|An example document to show how they will appear in the Template Library. This document is also useful to you as an admin. | No |Document|

7. You now have a starter set of components for your power user usage.
![BrowseToLib](media\sp-upload-5.png)
-->

Ensure you set up the correct permissions for your SharePoint site; we recommend that you view only access to your Power Users.

More information: [Create a document library in SharePoint](https://support.office.com/article/create-a-document-library-in-sharepoint-306728fe-0325-4b28-b60d-f902e1d75939).

### Add your own Templates

If you have existing templates that you'd like to share with your makers (for example template apps, brand guidelines, or app and flow samples), upload them to the TemplateApps document library so they show up in the Template Catalog.

## Share apps with your organization

The Nurture Components solution contains four apps. As soon as you're ready to adopt the CoE, share these apps as follows:

- App Catalog; Share with your entire organization.

- Template Catalog: Share with your makers or your entire organization.

- Training in a day Management: Share with admins only.

- Training in a day Registration: Share with your entire organization.
