---
title: "How field security affects synchronization between customer engagement apps and Outlook  | MicrosoftDocs"
description: How field security affects synchronization between customer engagement apps and Outlook 
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/17/2021
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
# How field security affects synchronization with Outlook

<!-- legacy procedure -->

Securing a field with field-level security can impact synchronization between customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) and [!INCLUDE[pn_microsoft_dynamics_crm_for_outlook](../includes/pn-microsoft-dynamics-crm-for-outlook.md)]. Consider the following scenario.  
  
> [!NOTE]
>  We do not recommend securing a field when the field is set to sync. Best practice is to NOT secure any sync fields. If you do decide to secure sync fields, you'll need to do the following:  
> 
> 1. Secure the field using field-level security. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] see "Set field-level security" below.  
> 2. Change the sync direction so that sync does not attempt to update or write the field during synchronization. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Control field synchronization between customer engagement apps and Outlook or Exchange](control-field-synchronization-outlook.md)  
  
## Scenario: Restrict users from changing Job Title  
 The Contoso company wants to promote consistent data entry. While sales personnel are out in the field, it's easy for them to create different data entries to describe the same thing. For example, the same job title could be entered as "Construction Manager", "Foreman", or "Site Manager". To prevent this, the Job Title field is secured. This has consequences for synchronization.  
  
### Set field-level security  
 John, the admin for Contoso, sets security on several fields.  
  
 ![Job Title field.](../admin/media/job-title-field.png "Job Title field")  
  
 John did the following steps:  

1. In the web app, go to **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

2. Select **Settings** > **Customizations**.
  
3. Select **Customize the System**.  
  
4. Expand **Entities** > **Contact**.  
  
5. Select **Fields** and select **jobtitle**. There are a lot of Contact fields so you'll need to advance several pages.  
  
6. Select **Edit**.  
  
7. For Field Security, select **Enable** > **Save and Close**.  
  
8. Select **Publish All Customizations**.  
  
   John also secured the following Contact fields so they won't appear in customer engagement apps: ftpsiteurl, governmentid  
  
### Create and configure a field security profile  
 John creates a field security profile and assigns sales team members to the profile.  
  
 ![Field Security Profile.](../admin/media/field-security-profile.png "Field Security Profile")  
  
 John did the following to create the field security profile:  

1. In the web app, go to **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

2. Select **Settings** > **Security**.
  
3. Select **Field Security Profiles**.  
  
4. Create a profile. Select **New** and enter a Name.  
  
5. Select **Save and Close**.  
  
6. Select the new profile > **Users** > **Add**  
  
7. Select users and then celect **Select** > **Add**.  
  
### Set field permissions  
 With a field security profile created and users added to the profile, John can now set permissions on the fields to match the organization's requirements.  
  
 ![Edit Field Security form.](../admin/media/edit-field-security.png "Edit Field Security form")  
  
1. In the web app, go to **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

2. Select **Settings** > **Security**.
  
3. Select **Field Security Profiles** > your profile.  
  
4. Select **Field Permissions** > the field to secure > **Edit**  
  
5. Change the security settings to match your company's requirements and then select **OK** > **Save and Close**.  
  
### What the user sees  
 Nancy, a salesperson at Contoso, uses [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] and creates a new contact and tracks it in Dynamics 365 apps.  
  
 ![Contact Rene Valdes form.](../admin/media/contact-form-example.png "Contact Rene Valdes form")  
  
 When Nancy synchronizes with customer engagement apps, the Job Title field is gone from the contact. This is because Nancy doesn't have update rights for the Job Title field.  
  
 ![Rene contact with no Job Title.](../admin/media/contact-no-job-title.png "Rene contact with no Job Title")  
  
 Nancy's manager, with update rights to the Job Title field, fills in the field with the correct job title: Construction Manager.  
  
 Nancy synchronizes again with customer engagement apps and now the Job Title field is in the contact with the correct title.  
  
 ![Contact with Job Title form.](../admin/media/contact-job-title.png "Contact with Job Title form")  
  
### See also  
 [Field-level security](../admin/field-level-security.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
