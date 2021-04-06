---
title: "Create templates for articles  | MicrosoftDocs"
description: Create templates for articles
author: shubhadaj
manager: shujoshi
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/17/2021
ms.author: shujoshi
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Create templates for articles

<!-- legacy procedure -->

Article templates help you create new articles for your organization's knowledge base library. You can also create templates with boilerplate text to help article writers use consistent language and messaging.  

> [!NOTE]
> This experience is applicable only to legacy Articles entity and not the new Knowledge Article entity. 
  
1. [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the web app, go to **Settings** (![Settings](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

3. Select **Settings** > **Service Management**.

4. Select **Article Templates**. 
  
5. To create a new article template, select **New**.  
  
6. In the **Article Template Properties** dialog box, type the new article title, select the language, and then select **OK**.  
  
7. To add a section, in the **Common Tasks** area, select **Add a Section**, and specify the following:  
  
   1. In the **Title** box, type a title.  
  
   2. In the **Instructions** box, type a description of the information that users should provide in this section when they use this template.  
  
      When a user creates a new article with this template, these instructions appear in the body text for this section, and disappear when the user starts typing.  
  
8. To reposition a section from the template, select the section you want to reposition, and in the **Common Tasks** area, select the green arrows to move the section to the position you want.  
  
    When you select a section, its border turns green and the border lines become solid.  
  
9. To remove the section, select the section you want to remove, and in the **Common Tasks** area, select **Remove a Section**.  
  
10. To edit a section, select the section you want to edit, and in the **Common Tasks** area, select **Section Properties**. Edit the title and description.  
  
11. To format the text, font, and color of the article title, headings, and body text of each section, use the tools on the **Modify** toolbar.  
  
12. When you're done, select **Save** or **Save and close**.  
  
     After you save the template, it is immediately available for use. If the template is not complete and you want to finish it later, you can save the template, deactivate it (make it ready-only), and then complete it later. When the template is complete, you can reactivate it.  
  
> [!NOTE]
>  If you need to back up your templates, or export them for use in a different implementation, you can export them as part of exporting customizations. More information: [Export your customizations as a solution](/dynamics365/customerengagement/on-premises/customize/export-solution).  
  
### See also  
 [eBook: Use KB articles to help your customers](https://go.microsoft.com/fwlink/p/?LinkId=394983)

[!INCLUDE[footer-include](../includes/footer-banner.md)]