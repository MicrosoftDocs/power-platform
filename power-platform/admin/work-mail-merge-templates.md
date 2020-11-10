---
title: "Work with mail merge templates  | MicrosoftDocs"
description: Work with mail merge templates 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/11/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Work with mail merge templates

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

You can use mail merge templates with Office Word to create customer-ready letters, faxes, e-mail messages, and quotes.  
  
 [!INCLUDE[pn_MS_Word_Full](../includes/pn-ms-word-short.md)] templates are created and edited in [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)], but can be uploaded to customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), to use with mail merge and share with other users. Only [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] .xml documents can be used as templates. To learn more about how to create mail merge templates, see the online Help in [!INCLUDE[pn_MS_Word_Full](../includes/pn-ms-word-short.md)].  
  
1. [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the Power Platform admin center, select an environment. 

3. Select **Settings** > **Templates** > **Mail merge templates**.  
  
4. To create a new mail merge template, select **New**.  
  
5. In the **Mail Merge Templates** form, enter a **Name** and an **Associated Entity** (record type).  
  
6. You can enter a description of the template. This is not displayed to the recipient.  

7. Select **Save**. 

8. Select **Data Fields**, select the columns to add as fields in your email, and then select **OK**.

9. Select **Save**, and then select **Create Template in Word**.

10. Select **Add-ins**, and then select **CRM**.

11. Proceed through the Mail Merge process and save the template.

12. Return to the **Mail Merge Template** page, and then select **Choose File**. 

13. Select the newly created mail merge document, select **Open**, and then select **Attach**.

14. Select **Save and Close**.

> [!NOTE]
> To change a personal template to a shared one, after you save the record on the template form, on the **More Actions** menu, select **Make Available to Organization**. To revert the template to a personal one, select **Make Personal**.  

## Use a mail merge template

After creating a mail merge template, follow these steps to use it.

1. In the Power Platform admin center, select an environment and open it.

2. Select **Advanced Find** and select the customers to send an email.

3. Select **Mail Merge**, choose the **Personal mail merge template**, and then select **Download**.

4. Open the downloaded file in Microsoft Word and go through the steps.

