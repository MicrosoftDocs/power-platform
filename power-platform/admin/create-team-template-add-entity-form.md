---
title: Create a team template to control access rights for automatically created teams 
description: Create a team template and add to an entity form
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks
ms.custom: "admin-security"

ms.component: pa-admin
ms.topic: how-to
ms.date: 10/25/2024
search.audienceType: 
  - admin
---




# Create a team template to control access rights for automatically created teams

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

<!-- legacy procedure -->

A team template can be used for the entities that are enabled for automatically created access teams. In the team template, you have to specify the entity type and the access rights on the entity record. For example, you can create a team template for an account entity and specify the Read, Write, and Share access rights on the account record that the team members are granted when the team is automatically created. 

After you create a team template, you have to customize the entity main form to include the new team template. After you publish customizations, the access team template is added in all record forms for the specified entity in the form of a list. For example, you created a team template called “Sales team” for the account entity. On all account record forms you’ll see the list called “Sales team”. You can add or remove team members using this list.  

To learn more about creating, using, and adding access teams to a solution, watch the following video.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=16ecba96-02be-4d54-aaa2-5359c18983cd] 

    
## Enable an entity for access teams  

Make sure you have the system administrator or system customizer security role or equivalent permissions.

Check your security role:
- Follow the steps in [View your user information](/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin).

2. Select an environment and go to **Settings** > **Templates** > **Access team templates**.

3. On the command bar, select **More Commands** (...).

4. Select **Customize Entity**. 

5. In the navigation pane, expand **Entities**, and then choose the entity you want to use in the team template.  

6. On the **Entity Definition** form, in the **Communication & Collaboration** section, select the **Access Teams** checkbox.  

7. On the **Actions** toolbar, select **Save**.  
  

## Create a team template  
  
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin).
1. Select an environment and go to **Settings** > **Templates** > **Access team templates**.
1. On the control bar, select **+New**,
1. Enter a **Name** for your template.
1. Select the **Entity** that you have enabled for access teams.
1. Enter a **Description**.
1. Select the appropriate **Access Rights** for your access team members to access the record.
1. Select **Save**.  

> [!NOTE]
> You can create four access team templates per entity. Learn more in [Auto-created (system-managed) access team](/power-apps/developer/data-platform/use-access-teams-owner-teams-collaborate-share-information#auto-created-system-managed-access-team) if you need to create more.

## Add a team template to the entity form   
  
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin).

2. Select an environment and go to **Settings** > **Templates** > **Access team templates**.

3. On the command bar, select **More Commands** (...).

4. Select **Customize Entity**.  

5. In the navigation pane, expand **Entities**, expand the entity you want to use in the team template, and then select **Forms**.  

6. In **System Forms**, select **Active Forms** > **Main** form. 

7. On the **Main** form, open the **Insert** tab.  

8. On the ribbon, choose **Sub-Grid**.  
  
    The **Set Properties** dialog box appears.  
  
9. In **Set Properties**, complete the required fields, and then select the **Display label on the Form** checkbox. 

10. In the **Records** dropdown list, select **All Record Types**.  

11. In the **Entity** dropdown list, select **Users**.  

12. In the **Default View** dropdown list, select **Associated Record Team Members**.  

13. In the **Team Template** dropdown list, select the desired template and choose **Set**.  
  
     The team template you selected now appears on the **Main** form.  
  
14. On the **Actions** toolbar, select **Save**, and then select **Publish**.  

## Add a team template to a solution   

You can add your team template as a component to a [solution](/power-apps/maker/data-platform/solutions-overview).

1. [Create a solution](/power-apps/maker/data-platform/create-solution).

   Add Team template.
   
1. Select **Add existing** on the action bar.
1. Select **More** and **Other**, and then select **Team template**.
1. Select your Team template and select **Add**.

   Add the table where your Team template was added.

1. Select **Add existing** on the action bar.
1. Select **Table**.
1. Select the table where the Team template was added. Select **Next**.
1. Select the **Include table metadata** option.
1. Select **Add**.

    > [!NOTE]
    > For custom tables, you'll need to select the **Include all objects** option.

Add the form where the Team template was added.

1. Double-click the table where the updated form resides.
1. Click the **Forms** link under the **Data experiences** section.
1. Click the **Add existing form** option on the Action bar.
1. Select the form where the Team template was added.
1. Click **Add**.
1. [Publish your customizations](/power-apps/maker/data-platform/create-solution#publish-changes).

## Export your team template
You can now export your team template and import it into a different environment.

1. [Export your team template solution](/power-apps/maker/data-platform/export-solutions).
1. Download the solution .zip file.
1. [Import your team template .zip file solution](/power-apps/maker/data-platform/import-update-export-solutions).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
