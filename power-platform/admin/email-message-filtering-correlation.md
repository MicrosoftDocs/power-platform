---
title: Specify which emails are automatically tracked
description: Use email message filtering and correlation to specify which emails are tracked in Dynamics 365 customer engagement apps. 
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/02/2023
ms.subservice: admin
ms.author: sericks
author: sericks007
ms.contributor: dmartens
search.audienceType: 
  - admin
ms.custom: bap-template
---

# Specify which emails are automatically tracked

With server-side synchronization and Dynamics 365 App for Outlook, you can automatically create email activities for received messages in customer engagement apps such as [Dynamics 365 Sales](/dynamics365/sales-professional/help-hub), [Customer Service](/dynamics365/customer-service/help-hub), [Marketing](/dynamics365/marketing/help-hub), [Field Service](/dynamics365/field-service/overview), and [Project Service Automation](/dynamics365/project-operations/psa/overview).

By default, the sync process evaluates only messages in the Inbox folder of a mailbox for automatic tracking. Email that's in a subfolder of the inbox is processed only if the subfolder is configured for [folder-level tracking](../admin/configure-outlook-exchange-folder-level-tracking.md), even if you move a message back to the Inbox folder before the next sync. Server-side sync tracks the received date of the last email it processes. During the next sync cycle, it evaluates only emails that are received after that date and time. To process an email that wasn't in the Inbox folder, use one of the following options:

- Manually track the email using [Outlook category tracking](use-outlook-category-track-appointments-emails.md) or [Dynamics 365 App for Outlook](/power-apps/user/use-outlook-app).
- Change the **Process Emails From** date on the mailbox record to a date earlier than when the email was received. You'll need to add this field to the mailbox record form since it isn't visible by default.
- Select [Test & Enable Mailbox](connect-exchange-online.md#test-the-configuration-of-mailboxes) in the mailbox record in Dynamics 365.

Users can [select a filter to determine which messages are tracked as an email activity](set-personal-options-affect-tracking-synchronization-between-dynamics-365-outlook-exchange.md):

- **All email messages**: All email the user receives is tracked in Dynamics 365 as an email activity.

- **Email messages in response to email**: Only replies to tracked messages are tracked as email activities.

   This option is turned on by default. The system [correlates a reply](#use-conversations-to-track-emails) with a tracked message after the email is filtered. An administrator can turn email correlation on or off in the **Email** tab in **[System Settings](system-settings-dialog.md)** at the organization level.

- **Email messages from Leads, Contacts, and Accounts**: Only messages that resolve to a lead, contact, or account in Dynamics 365 are tracked as email activities.

- **Email messages from records that are email enabled**: Messages from any record that resolves to an email address in Dynamics 365, including custom tables, are tracked as email activities.

- **No email messages**: No messages the user receives are automatically tracked as email activities.

These options can be set to automatically track sent items. They can also be set to operate on queues and queue mailboxes.

:::image type="content" source="media/email-filter-image1.png" alt-text="Screenshot of filter options to automatically convert email to activities.":::<!-- EDITOR'S NOTE: Please recapture the screenshot following the new screenshot guidelines. This image is blurry and uses yellow highlighter, not the red highlight box specified in the guidelines. -->

Email that a user manually tracks in Outlook using [Dynamics 365 App for Outlook](/dynamics365/outlook-app/dynamics-365-app-outlook-user-s-guide), [folder-level tracking](configure-outlook-exchange-folder-level-tracking.md), or [Outlook category](use-outlook-category-track-appointments-emails.md) synchronizes with Dynamics 365 regardless of the filter option the user has set for automatic tracking.

 To turn off incoming message tracking for specific users, an admin can set **Incoming Email** to **None** on the **Mailbox** form.

## Use conversations to track emails  

Server-side sync uses the following information in an email to determine if it correlates to an email that's tracked in Dynamics 365:

- **MessageId**: Uniquely identifies an email message. It's hidden in the email app user interface.

- **InReplyTo**: Contains the **MessageId** that the email is in reply to. It's hidden in the email app user interface.

   If a customer replies to an email and changes the subject line, the email app may remove the **InReplyTo** value from the reply. Server-side sync and Dynamics 365 can't correlate the reply with a previous email without it. The desktop version of Microsoft Outlook prevents the **InReplyTo** value from being removed when a user replies to an email and changes the subject.

- **ConversationIndex**: Associates a message with an email thread. It's hidden in the email app user interface.

- **Tracking token in subject**: A Dynamics 365 concept, it's stamped directly in the subject line.

- **Subject words and recipients**: Uses smart matching, a Dynamics 365 concept, based on configuration.

The email correlation logic goes through the following options in order:

1. **InReplyTo correlation**: If the **InReplyTo** value matches the **MessageId** of an email that's already in Dynamics 365, the new email is correlated with the existing one. This is the default, and we recommend that you don't change it. Email correlation is accurate, with no false positives.

1. **[Tracking token](#how-customer-engagement-apps-use-tracking-tokens) correlation**: If the subject contains a tracking token and it matches the tracking token of an email that's already in Dynamics 365, the new email is correlated with the existing one. This option is turned on by default. The tracking token is visible to the user and can be changed, which can cause a false correlation.

1. **Conversation Index:** If the **ConversationIndex** matches the **ConversationIndex** of an email that's already in Dynamics 365, the new email is correlated with the existing one.

1. [**Smart matching**](#smart-matching): The system searches email that's already in Dynamics 365 for the recipients and the words in the subject line. If it finds one with similar recipients and enough matching subject words, it correlates the two messages. We don't recommend this option, since smart matching can cause false positives. However, it's available in case you need to correlate emails that don't belong to the same conversation thread.

<a name="BKMK_tracking-token"></a>

## How to determine if and why an email was automatically tracked

Organization-wide settings and settings for individual users and queues determine [which emails are automatically tracked](#use-conversations-to-track-emails). You can use columns in the Email table to identify if and why an email was automatically tracked. Add them to an Advanced Find view of email to help you understand why an email was tracked and whether it was correlated with a previously tracked email.

| Column | Description |
|--------|-------------|
| Accepting Entity | The user or queue that received the email and was configured to automatically track it. For example, if a queue named Sales that has been configured to track all emails receives an email, then the Sales queue is considered the Accepting Entity. |
| Receiving Mailbox | The mailbox that was processed when server-side sync detected that an email contained a user or queue that was configured to automatically track it.<br><br>If the [OrgDBOrgSetting](../admin/OrgDbOrgSettings.md) called SSSForceFilteringMethodForUserMailboxes is turned off (the default setting), the value of this column may be different from the Accepting Entity. For example, suppose Luisa Alves, who is set up to automatically track replies to existing emails, receives a message. The Sales queue, which is set up to track all email, receives the same message. Server-side synchronization may process Luisa's mailbox first and recognize that another recipient, Sales, is configured to automatically track the email. In this case, the Accepting Entity is the Sales queue, but the Receiving Mailbox is Luisa's. |
| Correlated Activity ID | Indicates whether an email was associated with a previously tracked email. For example, if an email was sent from Dynamics 365 and a reply was automatically tracked, the Correlated Activity ID of the reply would refer to the original email.
| Correlation Method | The correlation method that was used to automatically track an email. It's not available for Advanced Find or other views and forms, but you can use the Web API to view it. Use this URL format: <br><br>`https://YourDynamics365URL/api/data/v9.2/emails(IDofEmail)?$select=subject,correlationmethod` <br><br>For example, if your Dynamics 365 URL is `https://contoso.crm.dynamics.com` and the email ID is `fd372987-7fac-ed11-aad1-0022480819b5`, you can use this URL to view the correlation method:<br><br>`https://**contoso.crm.dynamics.com**/api/data/v9.2/emails(**fd372987-7fac-ed11-aad1-0022480819b5**)?$select=subject,correlationmethod`<br><br>To find the ID of an email, open the email in a web browser. The ID is everything after `&id=` in the URL. In the example, it was `&id=fd372987-7fac-ed11-aad1-0022480819b5`.<br><br>The value of Correlation Method is an integer that corresponds to a specific correlation method. Refer to the table in the correlation method section of the [email EntityType](/power-apps/developer/data-platform/webapi/reference/email?view=dataverse-latest#properties&preserve-view=true). For example, a value of 3 indicates that the email was correlated using the InReplyTo method. |
| Parent Activity ID | Refers to a previously tracked email if the current email is correlated with it. However, the column is populated only if the email was correlated using the InReplyTo or ConversationIndex method. If the email was correlated using a different method, such as Tracking Token, the Parent Activity ID is empty. |

## Identify Automatic Replies

Auto-generated email responses can sometimes be triggered by automatic features. For instance, Microsoft Outlook's [Automatic Replies](https://support.microsoft.com/office/send-automatic-out-of-office-replies-from-outlook-for-windows-9742f476-5348-4f9f-997f-5e208513bd67) (Out of Office) feature can be set up to respond to emails when the recipient is away. Presently, Server-Side Sync does not actively assess whether an incoming email is an auto-generated response when determining whether it should be automatically tracked.

You can use the `InternetMessageHeaders` attribute in the **Email** table to identify such auto-generated responses. The `InternetMessageHeaders` attribute is populated for incoming emails only if an email includes `Auto-Submitted` or `Reply-To` headers. These header values are captured in a JSON format.

To check the value of `InternetMessageHeaders` attribute, parse the JSON data to access specific header names and values. You can also check if the column contains the header name you're interested in. For example, if the `InternetMessageHeaders` column contains `Auto-Submitted`, it signifies that the email was generated automatically.

The following table provides more information about the headers in automatic replies.

| Header | Description | Examples
|---------------|----------|----------------|
| Auto-Submitted | If this header is present, it means that the email is an auto-reply. Different email providers may use different values for this header. More information: [RFC - Recommendations for Automatic Responses to Electronic Mail](https://www.rfc-editor.org/rfc/rfc3834).  |Gmail - `Auto-Submitted : auto-replied` </BR></BR>Outlook - `Auto-Submitted : auto-generated` |
| Reply-To | If this header is present, it means the email has a reply-to setup. The value in this header will show the reply-to email address. The format of the value may vary depending on mail providers and other configurations. More information: [RFC - Reply-To field](https://www.rfc-editor.org/rfc/rfc3834#section-3.1.2). |`Reply-To : “Test email <example@contoso.com>”` </BR></BR>`Reply-To : “<example@contoso.com>”` |

## Automatic population of Regarding column

The **Regarding** column, present in each email record, links one record to another. For instance, an email might be linked to an opportunity, order, or case. If you're manually creating or updating an email record, you may use the **Regarding** column to connect the email to a record in any table that has been set up to permit activities.

If the email is tracked automatically because it was correlated with a previously tracked email, the **Regarding** column is automatically assigned the same value as the previously tracked email.

## How customer engagement apps use tracking tokens

A tracking token is an alphanumeric string that's generated by customer engagement apps and appended to the end of an email subject line. It matches email activities with email messages. The tracking token feature is turned on by default.

### Tracking token structure  

By default, customer engagement apps use a token structure that consists of a four-character prefix and a seven-digit identifier.

:::image type="content" source="../admin/media/tracking-token.png" alt-text="Illustration of the components of a tracking token.":::

 The following table lists tracking token parts and descriptions.  

| Part | Description |
|------|-------------|
| Prefix | Configurable from 1&ndash;20 characters. The default value is *CRM*. The prefix can be unique for each organization or environment. For example, in a multi-tenant deployment of customer engagement apps, we recommend that each organization configure and use a unique prefix. If you change the prefix, the previous prefix values are still maintained and used to correlate emails based on the previous prefix. |
| Online/Offline designator | A legacy value that indicates whether the user was offline or online when sending the email. This digit isn't configurable. |
| Deployment base tracking number | Configurable from 0&ndash;2,147,483,647. The default value is 0. Used as the base number for the user number digits. For example, if the value is 0 and three digits are configured for the user number, the first user would have an identifier of 001. If the value is 500, the first user would be 501. |
| Number of digits for user numbers | Configurable from 1&ndash;10. The default range is three digits. This value determines how many digits to use when the customer engagement app assigns a numeric identifier for the user who generated the email activity. |
| Number of digits for incremental message counter | Configurable from 1&ndash;9. The default range is three digits. This value determines how many digits to use when the customer engagement app assigns a numeric identifier for the email activity, not the individual messages in the activity.<br>**Note**: If you use the default value to generate a token with a three-digit number, it increments the number through 999, and then restarts the numbering at 000. You can use a larger number of digits to reduce the possibility of assigning duplicate tokens to active email threads. |

### Set up or turn tracking tokens on or off  

1. In **Settings** > **Administration** > **System Settings**, select the **Email** tab.  

1. In the **Configure email correlation** area, turn tracking tokens on or off and change the default structure.  

<a name="BKMK_smartmatching"></a>

## Smart matching

 When server-side sync processes an incoming email, it extracts the subject, sender address, and recipients' addresses and uses them to try to link the email activity with existing records. This correlation process, also known as smart matching, uses the following criteria to match received emails with email activities:

- **Subject matching**: Prefixes, such as RE: or Re:, and letter case are ignored. For example, the subjects *Re: hello* and *Hello* are considered a match.  
- **Sender and recipient matching**: The system calculates the number of exact sender and recipient email addresses in common.

When the matching process is complete, the system selects the owner and the object of the incoming email message.

Smart matching is turned off by default. You can turn it on and modify smart-matching settings in the **Email** tab in **[System Settings](system-settings-dialog.md)** at the organization level.

### How smart matching works

Smart matching relies completely on the existence of similarity between emails. The subject, sender, and recipients, including BCC and CC recipients, determine similarity.

When an email is sent from Dynamics 365 or a tracked email arrives, two sets of hashes are generated and stored in the database.

- **Subject hashes**: The subject of the email, which may include the Dynamics 365 token if it's turned on in system settings, is stripped of noise words like "RE:" and "FW:" and then tokenized. Nonempty tokens&mdash;words&mdash;are then hashed to generate subject hashes.

- **Recipient hashes**: The sender and recipient list are analyzed for unique email addresses. Each unique email address generates an address hash.

Server-side sync searches for matching values in the stored subject and recipient hashes to find a correlation between the incoming email and the outgoing email. Two emails are correlated if they have the same number of subject hashes and at least two matching recipient hashes.

> [!NOTE]
> As an organization sends and receives email over long periods, the correlation data that's stored in the **EmailHash** table may increase significantly. This, combined with less restrictive smart matching settings or common subject or recipient patterns, may reduce smart matching performance. As a performance optimization, if the system detects high resource usage when performing smart matching operations, it will correlate email from the previous 90 days.

### Smart matching advanced settings

- **HashFilterKeywords**: A regular expression that's used to filter out noise in the subject line. All matching instances of the regular expression in the subject line are replaced with empty strings before the subject hashes are generated.

   **Default value**: ^\[\\s\]\*(\[\\w\]+\\s?:\[\\s\]\*)+

   Ignore any word at the start of the subject line that ends with a colon (:). For example:

   |     | Subject | Ignored words |
   |-----|---------|---------------|
   | **1** | Test | -- |
   | **2** | RE: Test | RE: |
   | **3** | FW: RE: Test | FW: RE: |

   By default, "Out of office:" isn't ignored since the first word in the phrase, "out," isn't followed by a colon (:). To ignore this phrase, change the regular expression like this: `^\[\\s\]\*(\[\\w\]+\\s?:\[\\s\]\*)+\|Out of office:`

- **HashMaxCount**: The maximum number of hashes that are generated for any subject or recipient list.

   **Default value**: 20

   If the subject after noise cancellation contains more than 20 words, only the first 20 are hashed.

- **HashDeltaSubjectCount**: The maximum difference that's allowed between the subject hash counts of the emails to be correlated.

   **Default value**: 0

- **HashMinAddressCount**: The minimum hash count matches required on the recipients list for the emails to be correlated.

   **Default value**: 2

### See also

[Forward mailbox vs. individual mailboxes](../admin/forward-mailbox-vs-individual-mailboxes.md)  
[Associate an email address with a row](../admin/associate-email-address.md)

[!INCLUDE [footer-include](../includes/footer-banner.md)]
