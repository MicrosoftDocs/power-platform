---
title: "Work with mail merge templates  | MicrosoftDocs"
description: Work with mail merge templates 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/15/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Work with mail merge templates

You can use mail merge templates with Office Word to create customer-ready letters, faxes, e-mail messages, and quotes.  
  
 [!INCLUDE[pn_MS_Word_Full](../includes/pn-ms-word-short.md)] templates are created and edited in [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)], but can be uploaded to model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, to use with mail merge and share with other users. Only [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] .xml documents can be used as templates. To learn more about how to create mail merge templates, see the online Help in [!INCLUDE[pn_MS_Word_Full](../includes/pn-ms-word-short.md)].  
  
1. [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the Power Platform admin center, select an environment. 

3. Select **Settings** > **Templates** > **Mail merge templates**.  
  
4. To create a new mail merge template, select **New**.  
  
5. In the **Mail Merge Templates** form, enter a **Name** and an **Associated Entity** (record type).  
  
6. You can enter a description of the template. This is not displayed to the recipient.  
  
7. Enter the **Ownership** and **Owner** information. Use the handy tooltips as a guide.  
  
8. If you have enabled additional languages, you can select one for the template.  
  
9. To attach the template, select **Browse**, search for the template on your computer, and then select **Attach**. Only .xml documents can be uploaded.  
  
10. When you're done, select **Save and close**.  
  
> [!NOTE]
>  To change a personal template to a shared one, after you save the record on the template form, on the **More Actions** menu, select **Make Available to Organization**. To revert the template to a personal one, select **Make Personal**.  
  
### See also  
