---
title: Use Outlook category to track appointments and emails
description: Use Outlook category to track appointments and emails 
author: DerekBraunMSFT
ms.component: pa-admin
ms.topic: how-to
ms.date: 12/10/2025
ms.subservice: admin
ms.author: debrau
search.audienceType: 
  - admin
---
# Use Outlook category to track appointments and emails

Server-side synchronization allows you to track emails, appointments, and tasks in Outlook with a [special category](https://support.office.com/article/video-set-an-email-flag-reminder-or-color-a894348d-b308-4185-840f-aff63063d076?ui=en-US&rs=en-US&ad=US) **Tracked to Dynamics 365**. When you assign this category to an email, appointment, or task in Outlook, it syncs the item to customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). Similarly, removing the category from a tracked email, appointment, or task untracks it from customer engagement apps.

You can also select multiple items and assign the **Tracked to Dynamics 365** Outlook category to them thereby tracking all of them to customer engagement apps. Quickly identify tracked items by observing the presence of this category in your Inbox and other folders.

## Configure category-based tracking through an OrgDBOrgSetting

As of version 9.1.0.4039 or higher, category tracking is on by default.

> [!TIP]
> To determine your version, sign in to customer engagement apps, and in the upper-right side of the screen, select the **Settings** button ![User profile Settings button.](media/user-profile-settings-button.png) > **About**.  

## Use category to track Outlook items
Once the **Tracked to Dynamics 365** category is available in Outlook, you can use it to track the following Outlook items.

## Email
Track an email by assigning it the **Tracked to Dynamics 365** category. You can see the category assignment immediately in Outlook. At this time, the email is marked for tracking. Server-side synchronization syncs the email to customer engagement apps within 15 minutes, based on the email synchronization setting.

If you track an email and categorize it as **Tracked to Dynamics**, removing the category untracks the email. However, the corresponding email activity record isn't deleted.

> [!TIP]
> You can set up a rule in Outlook to assign or remove a category. See [Manage email messages by using rules](https://support.office.com/article/manage-email-messages-by-using-rules-c24f5dea-9465-4df4-ad17-a50704d66c59?ui=en-US&rs=en-US&ad=US).

### Automatic email categorization

Server-side synchronization applies the **Tracked to Dynamics 365** category to emails when it automatically synchronizes them by using a Dynamics 365 recipient mailbox.

When a synchronized email is receivesd by multiple Dynamics 365 recipients, server-side synchronization automatically applies the category to the additional Dynamics 365 recipient mailboxes&mdash;as long as each Dynamics 365 recipient is enabled for incoming email synchronization and appears as a resolved activity party on the received email row. For example, emails received in Exchange by a Dynamics 365 recipient through a distribution group, a different email alias, or as a BCC recipient might not be reliably categorized because the associated Dynamics 365 party might be unresolved or doesn't appear as a recipient in the received Dynamics 365 email row.

Only emails that match the Dynamics 365 direction code are automatically categorized when the system setting **[Track emails sent between Dynamics 365 users as two activities](settings-email-tracking.md)** is enabled. For example, emails that are tracked and sent from Outlook to other Dynamics 365 users don't appear as categorized in the Outlook recipient mailboxes because they represent the _received_ copy of the email. This behavior allows the Dynamics 365 recipient to track an incoming copy of the email as per the system setting noted earlier.

## Appointment
You can track an appointment by assigning it the **Tracked to Dynamics 365** category. The appointment is tracked and synced to customer engagement apps based on server-side synchronization rules.

If you track an appointment and categorize it as **Tracked to Dynamics**, removing the category untracks the appointment. However, the corresponding Dynamics 365 apps appointment activity record isn't deleted.

## Task
> [!NOTE]
> Assignment of tasks to people that you capture in Outlook doesn't sync to customer engagement apps.

## Use category-based tracking with App for Outlook
If you have Dynamics 365 App for Outlook, you can use category-based tracking with App for Outlook.

The following table lists different scenarios of tracking.


|Action  |Result  |
|---------|---------|
|Assign the **Tracked to Dynamics 365** category to an email/appointment     |Server-side synchronization syncs the email/appointment within 15 minutes. Loading App for Outlook on that item displays the tracked status.         |
|Track an email/appointment using App for Outlook     |Email/Appointment is tracked. The **Tracked to Dynamics 365** category is assigned immediately.         |
|Removal of the **Tracked to Dynamics 365** category on an email/appointment     |Server-side synchronization untracks the item in about 15 minutes. Loading App for Outlook on that email displays the tracked status. The activity record isn't deleted from customer engagement apps.         |
|Untrack an email/appointment using App for Outlook     |Email/Appointment is untracked and **Tracked to Dynamics 365** category is removed.         |

## Delegate users
If you [allow someone else to manage your email and calendar](https://support.office.com/article/Allow-someone-else-to-manage-your-mail-and-calendar-41C40C04-3BD1-4D22-963A-28EAFEC25926) by providing them delegate access, the delegate can access your categories in Outlook, if the delegate has Editor permissions.

If your mailbox has the **Tracked to Dynamics 365** category, the delegate can track your emails and appointments by assigning the **Tracked to Dynamics 365** category.

## Category-based tracking with Dynamics 365 for Outlook
Dynamics 365 for Outlook doesn't support category-based tracking. Don't enable OrgDBOrgSetting **TrackCategorizedItems** on an organization set up to use Dynamics 365 for Outlook.

## Disable category-based tracking
You can disable category-based tracking for the Dynamics 365 apps organization by disabling OrgDBOrgSetting **TrackCategorizedItems**.

> [!NOTE]
> If you disable OrgDBOrgSetting **TrackCategorizedItems**, the **Tracked to Dynamics 365** category is soft-deleted, with the category assignment retained in Outlook. If you delete the category from the master list, it gets deleted permanently.

## FAQ
**Can I track my Outlook contacts by assigning the Tracked to Dynamics 365 category?**<br />
No, Outlook contacts don't support category-based tracking.

**What happens if I rename the Tracked to Dynamics 365 category?**<br />
If you rename the category, server-side synchronization continues to identify the category by its ID. It uses the ID to track and untrack Outlook items.

> [!NOTE]
> For delegate scenarios, a category name difference between the delegate and primary mailbox owner isn't supported and might result in unexpected behavior. Match the category name on the delegate and primary mailbox owner.

**What happens if I delete the Tracked to Dynamics 365 category?**<br />
If you delete the category, server-side synchronization recreates it on the Exchange server in about 15 minutes.

**When I turn on OrgDBOrgSetting TrackCategorizedItems for the first time, will my previously tracked items be assigned the Tracked to Dynamics 365 category?**<br />
No, server-side synchronization doesn't assign the category to already tracked items.

**If I assign the Tracked to Dynamics 365 category to an Outlook conversation thread, what happens?**<br />
If you categorize a conversation thread as **Tracked to Dynamics 365**, all the emails in that thread get the category and are tracked.

**Can I assign Tracked to Dynamics 365 category to recurring appointments?**<br />
If you categorize a recurring appointment as **Tracked to Dynamics 365**, all the individual occurrences of the appointment get the category and are tracked.

**What happens when a Tracked email fails?**<br/>
By default, failed auto tracked emails are retried in a new synchronization cycle – approximately every 15 minutes. The system retries up to five times. If the retries fail after five attempts, the email gets the category **Tracked to Dynamics 365 (Undeliverable)** and no further retries occur. The system retries auto tracked emails that fail with the following errors:

- Promotion of emails fails due to a plugin configured in the customer environment.
- Promotion of emails fails because of timeouts from either customer engagement apps or Microsoft Exchange.
- An email is rejected with InvalidSender or because of some unknown decisions.
- Emails fail and are undeliverable if the owner of the queue doesn't have the correct security role assigned to them. Without the correct security role, the owner can't own the email record tracked by the queue.

After five retries, if the failure to promote the email was due to a plugin error, try fixing the plugin. Then, assign the **Track to Dynamics 365** category to manually track the undelivered emails to get them tracked in customer engagement apps. 

**How do I remove category-based tracking through OrgDBOrgSetting?** <br/>
To disable the special **Tracked to Dynamics 365** Outlook category, you need to enable the OrgDBOrgSetting in your organization. Customer engagement apps provides the OrgDBOrgSettings tool that gives administrators the ability to implement specific updates that were previously reserved for registry implementations.

1. Follow the instructions [in this article](https://support.microsoft.com/help/2691237/orgdborgsettings-tool-for-microsoft-dynamics-crm) for steps to extract the tool.
1. After extracting the tool, disable the OrgDBOrgSetting **TrackCategorizedItems**.
3. Disabling the OrgDBOrgSetting will remove the category **Tracked to Dynamics 365** on all Exchange mailboxes of the organization which have server-side synchronization enabled in about 15 minutes.

You can also use [this tool](https://github.com/seanmcne/OrgDbOrgSettings/releases/) to edit the OrgDBOrgSetting **TrackCategorizedItems**.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
