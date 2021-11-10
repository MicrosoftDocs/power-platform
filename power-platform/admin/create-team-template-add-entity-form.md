---
title: "Create a team template and add to an entity form  | MicrosoftDocs"
description: Create a team template and add to an entity form
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: jimholtz
ms.custom: "admin-security"
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/14/2021
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Create a team template to control access rights for automatically created teams

<!-- legacy procedure -->

A team template can be used for the entities that are enabled for automatically created access teams. In the team template, you have to specify the entity type and the access rights on the entity record. For example, you can create a team template for an account entity and specify the Read, Write, and Share access rights on the account record that the team members are granted when the team is automatically created. After you create a team template, you have to customize the entity main form to include the new team template. After you publish customizations, the access team template is added in all record forms for the specified entity in a form of a list. For example, you created a team template called “Sales team” for the account entity. On all account record forms you’ll see the list called “Sales team”. You can add or remove team members using this list.  
    
## Enable an entity for access teams  

Make sure you have the System Administrator or System Customizer security role or equivalent permissions.

Check your security role:
- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/).

2. Select an environment and go to **Settings** > **Templates** > **Access team templates**.

3. On the command bar, select **More Commands** (...).

4. Select **Customize Entity**. 

5. In the navigation pane, expand **Entities**, and then choose the entity you want to use in the team template.  

6. On the **Entity Definition** form, in the **Communication & Collaboration** section, select the **Access Teams** checkbox.  

7. On the **Actions** toolbar, select **Save**.  
  

## Create a team template  
  
1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/).

2. Select an environment and go to **Settings** > **Templates** > **Access team templates**.
  
3. On the **Actions** toolbar, choose **+New**, complete the required fields, and then choose **Save**.  

> [!NOTE]
> You can create two access team templates per entity.

## Add a team template to the entity form   
  
1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/).

2. Select an environment and go to **Settings** > **Templates** > **Access team templates**.

3. On the command bar, select **More Commands** (...).

4. Select **Customize Entity**.  

5. In the navigation pane, expand **Entities**, expand the entity you want to use in the team template, and then select **Forms**.  

6. In **System Forms**, select **Active Forms** > **Main** form. 

7. On the **Main** form, open the **Insert** tab.  

8. On the ribbon, choose **Sub-Grid**.  
  
    The **Set Properties** dialog box appears.  
  
9. In **Set Properties**, complete the required fields, and then select the **Display label on the Form** check box. 

10. In the **Records** drop-down list, select **All Record Types**.  

11. In the **Entity** drop-down list, select **Users**.  

12. In the **Default View** drop-down list, select **Associated Record Team Members**.  

13. In the **Team Template** drop-down list, select the desired template and choose **Set**.  
  
     The team template you selected now appears on the **Main** form.  
  
14. On the **Actions** toolbar, select **Save**, and then select **Publish**.  
  
> [!NOTE]
> The Access Team template does not get exported with its entity in a Solution.  Administrators will need to recreate the template when exporting the entity into another environment.



[!INCLUDE[footer-include](../includes/footer-banner.md)]