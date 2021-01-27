---
title: "Create templates for email  | MicrosoftDocs"
description: Create templates for email
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/04/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Create templates for email

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

Save time when creating multiple email messages by making email templates. Email templates contain prefilled data that you specify, so you don't have to re-enter the same information for each article.  
  
An email template is attached to an email activity after the activity is created. Typically, each type of email activity has its own email template type; for example, an email activity created from a case record would use a case email template. You can also create global templates that are available for any record type, or personal templates available only to you, or organizational templates available to anyone in your organization.  
  
1. [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the Power Platform admin center, select an environment. 

3. Select **Settings** > **Templates** > **Email templates**.  
  
4. On the Actions toolbar, select **New**.  
  
5. In the **Email Template Type** dialog box, in the **Template Type** list, select the type, and then select **OK**.  
  
   > [!IMPORTANT]
   >  If you select a specific record type, such as lead or opportunity, the template is available only for that record type. This cannot be changed. To use the same content for another record type, create a new template.  
  
6. On the **Email Templates** form, enter a **Title** and a **Subject**.  
  
7. You can type a description of the template. This is not displayed to the recipient.  
  
8. Type the text you want to send in this message. Use the Formatting toolbar to edit the text.  
  
   > [!TIP]
   > - Although you cannot insert images or HTML directly into email messages or email templates, you can use the copy feature in [!INCLUDE[pn_Internet_Explorer](../includes/pn-internet-explorer.md)] to copy an image from a website and paste it into the email message or email template.  The image is available as long as the website is accessible.  
   > - To include a hyperlink in an email template, type the URL including the http://, for example, http://contoso.com. Do not include a period or comma or a space after the URL or the link will break. Select the link text and select **Make this a Hyperlink** (![Make this a Hyperlink](../admin/media/make-this-hyperlink.png "Make this a Hyperlink")).  
   > 
   >    A link is automatically added to the  URL and the text is underlined and changed to blue.  
   > - To  include data fields in a hyperlink:  
   > 
   >   1. Select the link text and data fields. For example: http://contoso.com/q?{!User : City;}  
   >   2. Select **Make this a Hyperlink** (![Make this a Hyperlink](../admin/media/make-this-hyperlink.png "Make this a Hyperlink")).  
   > 
   >      The text and data fields will be converted to a hyperlink. For example: \<a href="https://contoso.com/q?{!User : City;}">http://contoso.com/q?{!User : City;}\</a>.  
   > 
   >      The hyperlink text will appear as a link when the template is used in an email.  
   > - There is no spell check built into customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). There might be third-party solutions available. For more information, visit [Microsoft Dynamics Solution Finder](https://www.microsoft.com/dynamics365/partners).  
   > - The Formatting toolbar has limited fonts and font sizes. However, you can copy and paste content from [!INCLUDE[pn_MS_Word_Full](../includes/pn-ms-word-full.md)]. This allows you to take advantage of features such as spell checking and some advanced text formatting. To single-space a line of text, at the end of the line press **Shift+Enter**.  
  
9. To insert data fields to display information such as a customer's name or data from a quote, from a customer engagement apps record, select **Insert/Update**, and then in the **Data Field Values** dialog box, select **Add**.  
  
10. In the **Add Data Value** dialog box, select the **Record type** and **Field**, and then select **OK**.  
  
11. Select **OK** again to insert the data.  
  
12. To enter customers' first and last names, you'll need to repeat these three data-insertion steps; first and last names are separate data values.  
  
    > [!TIP]
    >  Use the **Default Text** box to define what text is displayed if the record does not have data for the field.  
  
13. Select **Save** or **Save and Close**.  
  
> [!NOTE]
> - To change a shared template to a personal one or a personal template to a shared one, on the template form, on the **Actions**![action](../admin/media/action-button.png "action") menu, select **Revert to Personal Template**, or select **Make Template Available to Organization**.  
> - If you use an email template as a signature in another template, insert the signature template first. Otherwise, the Subject line will be overwritten.  
> - If you need to back up your templates, or export them for use in a different implementation, you can export them as part of exporting customizations. More information: [Export your customizations as a solution](https://docs.microsoft.com/powerapps/maker/model-driven-apps/distribute-model-driven-app).  
  
### See also  

