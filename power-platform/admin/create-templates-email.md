---
title: "Create templates for email  | MicrosoftDocs"
description: Create templates for email
author: sericks007
contributor: yingchin
ms.component: pa-admin
ms.topic: how-to
ms.date: 06/02/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---
# Create templates for email

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Save time when creating multiple email messages by making email templates. Email templates contain predefined content, eliminating the need to repeatedly enter the same information.

An email template is attached to an email activity after the activity is created. Typically, each type of email activity has its own email template type. For example, if you create an email activity from a case record it uses a case email template.

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
   >  If you select a specific record type, such as lead or opportunity, the template is available only for that record type. This setting can't be changed. To use the same content for another record type, create a new template.  
  
On the **New Email Template** form:
1. In the **Template** section, enter the **Name** of the template, and other required data field information.
2. In the **Template editor** section, enter the **Subject** of the template.
3. You can also type a description for the template. This text is for internal reference and not visible to the recipient.  
4. Type the text you want to send in this message. Use the **Formatting toolbar** to edit the text.  
  
   > [!TIP]
   > - Although you can't insert images or HTML directly into email messages or email templates, you can use the copy feature in the browser to copy an image from a website and paste it into the email message or email template. The image is available as long as the website is accessible.
   >   
   > - To include a hyperlink in an email template:
   >   - Type the URL, including the https://, such as https://contoso.com. Avoid adding a period, comma, or space after a URL, as this formatting issue may cause the link to break.
   >   - Select the text, then select **Link** from the Formatting tool bar to enter the hyperlink information.
   >   - The link is automatically applied, underlined the text and changing its color to blue.
   >   
   > - To include data fields in a hyperlink:
   >   - Select the link text and data fields. For example: https://contoso.com/q?{!User:City;}
   >   - Select **Link** from the Formatting tool bar to enter the hyperlink information.
   >   - The text and data fields convert to a hyperlink. For example: <a href="https://contoso.com/q?{!User:City;}">https://contoso.com/q?{!User:City;}</a>.
   >   - The hyperlink text appears as a link when the template is used in an email.
   >   
   > - Customer engagement apps don't have built-in spell check functionality. This limitation applies to Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation. However, users can work around it by copying and pasting content into [!INCLUDE[pn_MS_Word_Full](../includes/pn-ms-word-full.md)] to take advantage of spell checking.
   >   
   > - The Formatting toolbar offers a limited selection of fonts and font sizes. However, users can copy and paste content from [!INCLUDE[pn_MS_Word_Full](../includes/pn-ms-word-full.md)] to access spell checking and advanced text formatting.
   >   
   > - To single-space a line of text, press **Shift+Enter** at the end of the line.  
  
5. To insert dynamic data fields to display customer information, such as names or quotes, from a customer engagement apps record:
     - In the top command bar, select **Insert dynamic text**.
     - In the **Edit dynamic text** dialog box:
       - Select the **Record type** and **Field Name** values
       - Select **Add data field** to insert another fields.
       - Enter the **Default text**, which appears when no data is available.
       - Select **Insert** to apply the changes.
 
6. To enter customers' first and family/last name, repeat the data-insertion steps, as each name is stored as a separate data value. 
  
    > [!TIP]
    >  Use the **Default Text** box to define what text is displayed if the record doesn't have data for the field.  
  
7. Select **Save** or **Save and Close** to apply the changes.  
  
> [!NOTE]
> - To change a shared template to a personal one or a personal template to a shared one, on the template form, on the **Actions**![action.](../admin/media/action-button.png "action") menu, select **Revert to Personal Template**, or select **Make Template Available to Organization**.  
> - If you use an email template as a signature in another template, insert the signature template first. Otherwise, the Subject line is  overwritten.  
> - If you need to back up your templates, or export them for use in a different implementation, you can export them as part of exporting customizations. More information: [Export your customizations as a solution](/powerapps/maker/model-driven-apps/distribute-model-driven-app).  
  
### See also  

[!INCLUDE[footer-include](../includes/footer-banner.md)]
