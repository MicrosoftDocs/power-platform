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

1. You'll see an error notifying you that environment variables need to be configured. 
   > [!NOTE]
   > For the Nurture Components solution, two environment variables need to be configured.
   
   ![Environment variables need to be updated](media/coe7.png "Environment variables need to be updated")

1. Select **See Environment Variables** to set the values as described in the following table.

| Name | Default value |
|------|---------------|
| Power Platform Maker Office 365 Group | The *Admin \| Welcome Email* flow sends a welcome email to onboard new makers and adds them to an Office 365 group. You can use this group to send communications to your makers or invite them to a Yammer or Teams group. Configure the group ID here.|
| Training in a day - Feedback Form     | The *Training in a day* package includes a flow that automatically sends a feedback request to attendees on the day of the event. Configure the form URL (<https://forms.office.com/>...) here.    |

## Activate the flows

The Nurture Components solution contains five flows:

-  Admin \| Newsletter with Product Updates

-  Admin \| Welcome Email

-  Training in a day \| Feedback Reminder

-  Training in a day \| Registration Confirmation

-  Training in a day \| Reminder 3 days prior to event

Follow the same instructions to configure the flows as explained in [Activate the Sync Template flows](setup-core-components.md#activate-the-sync-template-flows).

## (Optional) Create a SharePoint document library

This library is used to store templates, components, and documents that you want to share with makers in your organization. In this section, you'll create and populate the library by using a set of starter materials.

The Template Catalog depends upon this library.

1. Create a document library to store templates on a SharePoint site of your choice. We recommend having a dedicated Power Apps CoE SharePoint site. Ensure that everyone has Read-only and Download access to this library.

1. Name the library **AppTemplates** to make conversion of the app easy, and add the following metadata columns.

   | Column name | Type |
   |----|----|
   |Title | Single line of text |
   |Description | Multiple lines of text |
   |Featured | Yes/No |
   |Display Name | Single line of text |
   |Template Type | Choice |
   |Category | Choice |
   |Approved | Yes/No |

   The **Template Type** column should have the following options: **App**, **Flow**, **Component**, **Document**.

1. If you have existing templates that you'd like to share with your makers (for example template apps, brand guidelines, or app and flow samples), upload them to the TemplateApps document library so they show up in the Template Catalog.

## Share apps with your organization

The Nurture Components solution contains four apps. As soon as you're ready to adopt the CoE, share these apps as follows:

- App Catalog; Share with your entire organization.

- Template Catalog: Share with your makers or your entire organization.

- Training in a day Management: Share with admins only.

- Training in a day Registration: Share with your entire organization.
