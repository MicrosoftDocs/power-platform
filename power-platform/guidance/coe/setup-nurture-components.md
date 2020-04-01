---
title: "Set up nurture components | MicrosoftDocs"
description: 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/18/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Set up nurture components

There are multiple components provided in this starter kit; each will require
some configuration to install. The installation instructions have been segmented
based on the set of components that should be grouped and installed together,
and dependencies on other segments are outlined in each section.

## Import the solution

This is the first setup step of the installation process and is required for any
other component in the starter kit to work.

The Nurture Components solution requires the Core Components solution
to be installed first.

1. Follow the instructions detailed under [Set up core components](setup-core-components.md)

1. Import the *CenterOfExcellenceNurtureComponents_x_x_x_xx_managed.zip*

## Update Environment Variables

The Environment
Variables are used to store application and flow configuration data. This means
you have to set the value only once and it will be used in all necessary flows
and apps.

All flows in this solution depend on all Environment Variables being configured.

1. You will see an error notifying you that Environment Variables need to be configured.  
    Note: For the Governance solution, **4**
    environment variables need to be configured. <Br>![Environment variables need to be updated](media/coe7.png)

1. Select **See Environment Variables** to set the values:

| Name | Default Value |
|------|---------------|
| Power Platform Maker Office 365 Group | The *Admin \| Welcome Email* flow sends a welcome email to onboard new makers and adds them to an Office 365 Group. You can use this group to send communications to your makers or invite them to a Yammer or Teams group. Configure the Group ID here.|
| Training in a day - Feedback Form     | The *Training in a day* package includes a flow that automatically sends a feedback request to attendees on the day of the event. Configure the Form URL (<https://forms.office.com/>...) here.                                                |

## Activate the Flows

This Nurture solution contains five flows:

1. Admin \| Newsletter with Product Updates

1. Admin \| Welcome Email

1. Training in a day \| Feedback Reminder

1. Training in a day \| Registration Confirmation

1. Training in a day \| Reminder 3 days prior to event

Follow the same instructions to configure the flows as explained under [
Activate the Sync Template Flows](setup-core-components.md).

## (Optional) Create a SharePoint document library

This library is used to store templates, components, and documents which you wish to share with Makers in your organization. In this section you will create
and populate the library with a set of starter materials.

The Template Catalog depends upon this library.

1. Create a document library to store templates on a SharePoint site of your choice. We recommend having a dedicated Power Apps CoE SharePoint site. Ensure everyone has read-only and download access to this library.

1. Name the library **AppTemplates** to make conversion of the app easy, and add the meta-data columns shown below with precise naming to your library.

| Column Name | Type
|----|----|
|Title | Single line of text |
|Description | Multiple lines of text |
|Featured | Yes/No |
|Display Name | Single line of text |
|Template Type | Choice |
|Category | Choice |
|Approved | Yes/No |

1. The Template Type column should have the following Choice options: **App, Flow, Component, Document**

1. If you already have existing templates that you would like to share with your makers, for example template apps, brand guidelines, app and flow samples, upload them to the TemplateApps Document Library so they show up in the Template Catalog app.

## Share apps with your organization

The Nurture Components solution contains four apps. Once you are ready to adopt the CoE, share these apps as indicated below.

- App Catalog – to be shared with your entire organization

- Template Catalog – to be shared with your makers or entire organization

- Training in a day Management – to be shared with admins only

- Training in a day Registration – to be shared with entire organization
