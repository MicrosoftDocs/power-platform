---
title: "How field security affects synchronization between Dynamics 365 apps and Outlook  | MicrosoftDocs"
description: How field security affects synchronization between Dynamics 365 apps and Outlook 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/31/2017
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# How field security affects synchronization with Outlook

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 

Securing a field in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps with field level security can impact synchronization between [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps and [!INCLUDE[pn_microsoft_dynamics_crm_for_outlook](../includes/pn-microsoft-dynamics-crm-for-outlook.md)]. Consider the following scenario.  
  
> [!NOTE]
>  We do not recommend securing a field in [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps when the field is set to sync. Best practice is to NOT secure any sync fields. If you do decide to secure sync fields, you’ll need to do the following:  
> 
> 1. Secure the field using field level security. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] see “Set field level security” below.  
> 2. Change the sync direction so that sync does not attempt to update or write the field during synchronization. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Control field synchronization between Dynamics 365 apps and Outlook or Exchange](control-field-synchronization-outlook.md)  
  
## Scenario: Restrict users from changing Job Title  
 The Contoso company wants to promote consistent data entry. While sales personnel are out in the field, it’s easy for them to create different data entries to describe the same thing. For example, the same job title could be entered as “Construction Manager”, “Foreman”, or “Site Manager”. To prevent this, the Job Title field is secured. This has consequences for synchronization.  
  
### Set field level security  
 John, the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps admin for Contoso, sets security on several fields.  
  
 ![Job Title field in Microsoft Dynamics 365 apps](../admin/media/job-title-field.png "Job Title field in Dynamics 365 apps")  
  
 He did the following steps:  
  
1. [!INCLUDE[proc_settings_customization](../includes/proc-settings-customization.md)]  
  
2. Choose **Customize the System**.  
  
3. Expand **Entities** > **Contact**.  
  
4. Choose **Fields** and select **jobtitle**. There are a lot of Contact fields so you’ll need to advance several pages.  
  
5. Choose **Edit**.  
  
6. For Field Security, choose **Enable** > **Save and Close**.  
  
7. Choose **Publish All Customizations**.  
  
   John also secured the following Contact fields so they won’t appear in [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps: ftpsiteurl, governmentid  
  
### Create and configure a field security profile  
 John creates a field security profile and assigns sales team members to the profile.  
  
 ![Field Security Profile in Dynamics 365 apps](../admin/media/field-security-profile.png "Field Security Profile in Dynamics 365 apps")  
  
 He did the following to create the field security profile:  
  
1. [!INCLUDE[proc_settings_security](../includes/proc-settings-security.md)]  
  
2. Choose **Field Security Profiles**.  
  
3. Create a profile. Choose **New** and enter a Name.  
  
4. Choose **Save and Close**.  
  
5. Choose the new profile > **Users** > **Add**  
  
6. Select users and then choose **Select** > **Add**.  
  
### Set field permissions  
 With a field security profile created and users added to the profile, John can now set permissions on the fields to match his organization’s requirements.  
  
 ![Edit Field Security form in Dynamics 365 apps](../admin/media/edit-field-security.png "Edit Field Security form in Dynamics 365 apps")  
  
1. [!INCLUDE[proc_settings_security](../includes/proc-settings-security.md)]  
  
2. Choose **Field Security Profiles** > your profile.  
  
3. Choose **Field Permissions** > the field to secure > **Edit**  
  
4. Change the security settings to match your company’s requirements and then choose **OK** > **Save and Close**.  
  
### What the user sees  
 Nancy, a salesperson at Contoso, uses [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] and creates a new contact and tracks it in [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps.  
  
 ![Contact Rene Valdes form in Dynamics 365 apps](../admin/media/contact-form-example.png "Contact Rene Valdes form in Dynamics 365 apps")  
  
 When Nancy synchronizes with [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps, she notices that the Job Title field is gone from the contact. This is because Nancy doesn’t have update rights for the Job Title field.  
  
 ![Rene contact with no Job Title in Dynamics 365 apps](../admin/media/contact-no-job-title.png "Rene contact with no Job Title in Dynamics 365 apps")  
  
 Nancy’s manager, with update rights to the Job Title field, fills in the field with the correct job title: Construction Manager.  
  
 Nancy synchronizes again with [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps and now the Job Title field is in the contact with the correct title.  
  
 ![Contact with Job Title form in Dynamics 365 apps](../admin/media/contact-job-title.png "Contact with Job Title form in Dynamics 365 apps")  
  
### See also  
 [Field level security](../admin/field-level-security.md)
