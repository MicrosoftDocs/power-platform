---
title: "Create templates for email  | MicrosoftDocs"
description: Create templates for email
author: sericks007

ms.component: pa-admin
ms.topic: how-to
ms.date: 09/16/2020
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
search.audienceType: 
  - admin
---
# Create templates for email

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Save time when creating multiple email messages by making email templates. Email templates contain prefilled data that you specify, so you don't have to re-enter the same information for each article.

An email template is attached to an email activity after the activity is created. Typically, each type of email activity has its own email template type; for example, an email activity created from a case record would use a case email template.

Additionally, you can create:
- Global templates, which are available for any record type.
- Personal templates, accessible only to you.
- Organizational templates, available to all users within your organization.

Make sure you have the System Administrator security role or equivalent permissions in Microsoft Dynamics 365. To check your security role, see [View your user profile](/powerapps/user/view-your-user-profile). If you don’t have the correct permissions, contact your system administrator.

### [Modern admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**. 
1. Expand **Templates**, then select **Email templates**.
  
### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Templates**, then select **Email templates**.
---
  
On the **Email Templates** page:
1. In the top command bar, select **New**.
1. In the **Email Template Type** dialog box, choose a **Template Type**, then select **OK**.  
  
   > [!IMPORTANT]
   >  If you select a specific record type, such as lead or opportunity, the template is available only for that record type. This setting cannot be changed. To use the same content for another record type, create a new template.  
  
On the **New Email Template** form:
1. Enter the template title in the **Name** field.
2. Provide a subject line in the **Subject** field.
3. Add a description for the template (this is not displayed to the recipient).  
4. Type the text you want to send in this message. Use the **Formatting toolbar** to customize the text.  
  
   > [!TIP]
   > - Although you cannot insert images or HTML directly into email messages or email templates, you can use the copy feature in [!INCLUDE[pn_Internet_Explorer](../includes/pn-internet-explorer.md)] to copy an image from a website and paste it into the email message or email template.  The image is available as long as the website is accessible.  
   > - To include a hyperlink in an email template, type the URL including the https://, for example, https://contoso.com. Do not include a period or comma or a space after the URL or the link will break. Select the link text and select **Make this a Hyperlink** (![Make this a Hyperlink.](../admin/media/make-this-hyperlink.png "Make this a Hyperlink")).  
   > 
   >    A link is automatically added to the  URL and the text is underlined and changed to blue.  
   > - To  include data fields in a hyperlink:  
   > 
   >   1. Select the link text and data fields. For example: https://contoso.com/q?{!User : City;}  
   >   2. Select **Make this a Hyperlink** (![Make this a Hyperlink.](../admin/media/make-this-hyperlink.png "Make this a Hyperlink")).  
   > 
   >      The text and data fields will be converted to a hyperlink. For example: \<a href="https://contoso.com/q?{!User : City;}">https://contoso.com/q?{!User : City;}\</a>.  
   > 
   >      The hyperlink text will appear as a link when the template is used in an email.  
   > - There is no spell check built into customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). There might be third-party solutions available. For more information, visit [Microsoft Dynamics Solution Finder](https://www.microsoft.com/dynamics365/partners).  
   > - The Formatting toolbar has limited fonts and font sizes. However, you can copy and paste content from [!INCLUDE[pn_MS_Word_Full](../includes/pn-ms-word-full.md)]. This allows you to take advantage of features such as spell checking and some advanced text formatting. To single-space a line of text, at the end of the line press **Shift+Enter**.  
  
5. To insert data fields to display information such as a customer's name or data from a quote, from a customer engagement apps record, select **Insert/Update**, and then in the **Data Field Values** dialog box, select **Add**.  
  
6. In the **Add Data Value** dialog box, select the **Record type** and **Field**, and then select **OK**.  
  
7. Select **OK** again to insert the data.  
  
8. To enter customers' first and last names, you'll need to repeat these three data-insertion steps; first and last names are separate data values. 
  
    > [!TIP]
    >  Use the **Default Text** box to define what text is displayed if the record does not have data for the field.  
  
9. Select **Save** or **Save and Close** to apply the changes.  
  
> [!NOTE]
> - To change a shared template to a personal one or a personal template to a shared one, on the template form, on the **Actions**![action.](../admin/media/action-button.png "action") menu, select **Revert to Personal Template**, or select **Make Template Available to Organization**.  
> - If you use an email template as a signature in another template, insert the signature template first. Otherwise, the Subject line will be overwritten.  
> - If you need to back up your templates, or export them for use in a different implementation, you can export them as part of exporting customizations. More information: [Export your customizations as a solution](/powerapps/maker/model-driven-apps/distribute-model-driven-app).  
  
### See also  



[!INCLUDE[footer-include](../includes/footer-banner.md)]
