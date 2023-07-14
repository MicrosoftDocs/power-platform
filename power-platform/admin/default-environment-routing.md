---
title: Default environment routing
description: Description goes here.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/14/2023
author: sericks007 
ms.author: sericks 
ms.reviewer: sericks
ms.subservice: admin
search.audienceType: 
  - admin
---


# Overview

Default environment routing is a premium governance feature that allows Power Platform admins to automatically direct their **new makers** into their own personal developer environment when they visit the maker portal page for the first time (i.e., make.powerapps.com). Default environment routing will offer new makers a personal safe space to build with DATAVERSE without the fear of others' accessing their apps or data.

Unlike today, when the default environment routing admin setting is enabled and a new maker visit the maker portal page for the first time, they will land into their own personal developer environment instead of the default environment. Personal developer environments will be makers' own personal "OneDrive" for personal productivity where they can start building apps and solutions in their own workspace. New makers will not need to learn about which environment to work in since this will all happen automatically.

They will have Dataverse available in their environment and their developer environment will be automatically a managed environment with the admin settings already pre-configured, like sharing limits, and solution checker. Admins will no longer need to worry that their makers working in the Default environment where other makers can step on each other work or storing sensitive data in a shared place.

# Prerequisites

Default environment routing is a tenant level admin setting that:

-   Can only be enabled by **Power Platform admins**.

-   Require the "**Developer Environment assignment**" setting to be enabled for "**Everyone**".

![A screenshot of a computer Description automatically generated with medium confidence](media/image1.png)

-   Require the default environment to be Managed. Learn more how to make an environment managed.

![A screenshot of a computer Description automatically generated](media/image2.png)

# Enabling Default environment routing setting

The default environment routing setting is disabled by default and must be enabled using the Command Line tool / PowerShell.

## Before you begin

Before you enable this feature, ensure you consider the following effects:

-   This feature will enable the automatic creation of a personal developer environment for **all** of your Power Apps new makers when they first land into the portal page (make.powrapps.com). The definition of a new maker is limited to the makers who visit the maker portal page (make.powerapps.com) for the first time. Returning makers who have visited the maker portal page before won't be impacted.

-   New makers will be assigned the admin role in their newly created developer environments.

## Enabling the feature

During this private preview, you'll need to get your Power Platform **tenant ID** to the allow-list for using this feature. To get your tenant ID you will need to go to PPAC / Admin portal à Settings àSession details, and copy your tenant ID from the session details window.

![A screenshot of a computer Description automatically generated with medium confidence](media/image3.png)

**Step 1:**

You need to apply for the Private Preview Enrollment [here](https://aka.ms/er-p).

**Step 2:**

After you receive confirmation of having your Tenant ID added to the allow-list for this private preview, login to PPAC (Power Platform Admin Center) as a Power Platform admin and make sure your Default Enviornment is Managed.

![A screenshot of a computer Description automatically generated](media/image4.png)

**Step 3:**

Make sure the "Developer Environment assignment" Settings is enabled for "Everyone". You can check / change this tenant level settings from PPAC (See below)

![A screenshot of a computer Description automatically generated with medium confidence](media/image5.png)

**Step 4:**

Run the following commands in Power Shell.

//login to your tenant account

$Add-PowerAppsAccount -Endpoint "prod" -TenantID &lt;Tenant\_ID&gt;

// retrieve and store your tenant setting in tenantSettings

$tenantSettings = Get-TenantSettings  

// setup the enableDefaultEnvironmentRouting flag to true

$tenantSettings.powerPlatform.governance.enableDefaultEnvironmentRouting = $True

Set-TenantSettings -RequestBody $tenantSettings

When trying to enable an environment routing tenant setting, 

1.  If Developer environment assignments is set for only "Specific admins", the command will not succeed and show error message. To change this, go to PPAC -&gt; Tenant Settings -&gt; Developer environment assignments and set it to everyone.

2.  If tenant default environment is not managed, the command will not succeed and show error message. TO change this, refer to [Enable Managed Environments - Power Platform \| Microsoft Learn](https://learn.microsoft.com/en-us/power-platform/admin/managed-environment-enable#enable-or-edit-managed-environments-in-the-admin-center)

## Disabling the feature

To **disable** environment routing for your tenant, running the following Power shell commands

$tenantSettings = Get-TenantSettings  

$tenantSettings.powerPlatform.governance.enableDefaultEnvironmentRouting = $False

Set-TenantSettings -RequestBody $tenantSettings

**Check if Environment Routing is On**

Admins can run the following Cmdlt to confirm if environment routing is enabled for their tenant default environment. The ***enableDefaultEnvironmentRouting** flag should be set to True*

$Get-TenantSettings

$tenantSettings = Get-TenantSettings

$tenantSettings.powerPlatform.governance

*disableAdminDigest : False*

*additionalAdminDigestEmailRecipients : AllanD@M365x95509069.OnMicrosoft.com*

*disableDeveloperEnvironmentCreationByNonAdminUsers : False*

***enableDefaultEnvironmentRouting** : **True***

*policy : @{enableDesktopFlowDataPolicyManagement=False}*

# Maker Experience

Please keep in mind that if the makers are testing the **<u>functionality before June 18<sup>th</sup></u> , they will need to append the following flag "*?cdsCommon.enableNewHomePageExperience=false*** "next to the Power Maker Portal page URL in order to display the **legacy maker portal homepage** and activate the environment routing; otherwise, if you are testing after Jun 18<sup>th</sup>, this flag can be disregarded.

![](media/image6.png)

*New maker portal page is not supported before Jun 18<sup>th</sup>*

**Example URL with the maker home page flag** <https://make.powerapps.com/?cdsCommon.enableNewHomePageExperience=false>

# Preview disclaimer

Preview features are features that aren't complete but are made available on a "preview" basis so customers can get early access and provide feedback. Preview features are not supported by Microsoft Support, may have limited or restricted functionality, aren't meant for production use, and may be available only in selected geographic areas.

# Feedback / Issue reporting 

Please capture your session details and share them using the [following form](https://forms.office.com/r/ppXNGHD8RX) or send us an email to report any problems you come across or to share your feedback. You can capture the session details by clicking on the gear icon at the top right corner of your maker portal page session details and then copy the session details from the popup window.

![A screenshot of a computer Description automatically generated](media/image7.png)

# FAQ

1. **Will the created developer environments be managed ?**

Yes, all the newly created developer environments will be managed by default.

2. **What environment types are created when the default environment routing is enabled ?**

The created environments are developer environments.

3. **What roles do the makers get assigned in the created developer environments?**

The makers get assigned the admin security role in their created developer environments.

4. **Can the new makers switch to the default environment or any other environment they have access after landing into their own developer environment using the environment picker ?**

Yes, makers can always switch to other environments after landing into their own environment.

5. **Will the created Developer environment impact my tenant DV quota ?**

No, the developer environments should not impact your tenant DV quota.

6. **What will happen if the developer environment creation fails ?**

If some reason, the creation of the developer environment fails, makers will be automatically routed to the default environment.

7. **What DLP policies will be applied for the newly created developer environment ?**

During the private preview, no specific DLP policies will be assigned to the developer environment. Accordingly, the developer environment will inherit existing tenant level DLP policies.

8. **What are the preconfigured Managed Environment settings for the newly created developer environments ?**

All the newly created developer environments will have the following managed environment settings preconfigured:

Sharing limits: Set to exclude sharing with SG and preconfigured to share with 5 individuals.

Solution Checker: Set to Warn

Usage Insights: Is selected.

Maker welcome message: Not established.

![A screenshot of a computer Description automatically generated with low confidence](media/image8.png)

![A screenshot of a computer Description automatically generated with low confidence](media/image9.png)

9. **Is the default environment routing also available for Power Automate, PVA, and Power Pages ?**

During the private preview, the default environment routing is limited to Power Apps only.

10. **Do I need to be a Power Platfrom tenant admin to enable this feature ?**

 Yes, you need to have a Power Platform tenant admin privilege to enable this feature in your tenant or you can ask your tenant admin to turn it on for you.

# Copyright

This document is provided "as-is". Information and views expressed in this document, including URL and other Internet web site references, may change without notice.

Some examples depicted herein are provided for illustration only and are fictitious. No real association or connection is intended or should be inferred.

This document does not provide you with any legal rights to any intellectual property in any Microsoft product. You may copy and use this document for your internal reference purposes. This document is confidential and proprietary to Microsoft. It is disclosed and can be used only pursuant to a non-disclosure agreement.

© 2023 Microsoft. All rights reserved.

Microsoft is the trademark of the Microsoft group of companies. All other trademarks are the property of their respective owners.
