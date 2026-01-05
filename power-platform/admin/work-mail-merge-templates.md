---
title: "Work with mail merge templates  | MicrosoftDocs"
description: Work with mail merge templates 
author: sericks007

ms.component: pa-admin
ms.topic: how-to
ms.date: 05/18/2021
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
# Work with mail merge templates

> [!IMPORTANT]
> The mail merge template feature has been deprecated and is not supported. In Dynamics CRM 2016 (version 8.0), we introduced server-side document generation using Word and Excel templates. You can use these templates to provide standardized documents or customized data analysis for your organization.

You can use mail merge templates with Office Word to create customer-ready letters, faxes, e-mail messages, and quotes.  
  
 [!INCLUDE[pn_MS_Word_Full](../includes/pn-ms-word-short.md)] templates are created and edited in [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)], but can be uploaded to customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), to use with mail merge and share with other users. Only [!INCLUDE[pn_ms_Word_short](../includes/pn-ms-word-short.md)] .xml documents can be used as templates. To learn more about how to create mail merge templates, see the online Help in [!INCLUDE[pn_MS_Word_Full](../includes/pn-ms-word-short.md)].  
  
1. [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. Select an environment.
1. Select **Settings** > **Templates** > **Mail merge templates**.  
1. To create a new mail merge template, select **New**.  
1. In the **Mail Merge Templates** form, enter a **Name** and an **Associated Entity** (record type).  
1. You can enter a description of the template. This is not displayed to the recipient.  
1. Select **Save**. 
1. Select **Data Fields**, select the columns to add as fields in your email, and then select **OK**.
1. Select **Save**, and then select **Create Template in Word**.
1. Select **Add-ins**, and then select **CRM**.
1. Proceed through the Mail Merge process and save the template.
1. Return to the **Mail Merge Template** page, and then select **Choose File**. 
1. Select the newly created mail merge document, select **Open**, and then select **Attach**.
1. Select **Save and Close**.

> [!NOTE]
> To change a personal template to a shared one, after you save the record on the template form, on the **More Actions** menu, select **Make Available to Organization**. To revert the template to a personal one, select **Make Personal**.  

## Use a mail merge template

After creating a mail merge template, follow these steps to use it.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. Select an environment.
1. Select **Advanced Find** and select the customers to send an email.
1. Select **Mail Merge**, choose the **Personal mail merge template**, and then select **Download**.
1. Open the downloaded file in Microsoft Word and go through the steps.



[!INCLUDE[footer-include](../includes/footer-banner.md)]
