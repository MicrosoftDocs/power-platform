---
title: "Set incoming and outgoing email synchronization | MicrosoftDocs"
description: You can set a synchronization method for user mailboxes and specify incoming and outgoing email messaging options.
author: mduelae
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/12/2021
ms.subservice: admin
ms.author: mkaur
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Set incoming and outgoing email synchronization 

You have several options for synchronizing email messages with Microsoft Dataverse or customer engagement apps (such as [Dynamics 365 Sales](/dynamics365/sales-professional/help-hub), [Dynamics 365 Customer Service](/dynamics365/customer-service/help-hub), [Dynamics 365 Marketing](/dynamics365/marketing/help-hub), [Dynamics 365 Field Service](/dynamics365/field-service/overview), and [Dynamics 365 Project Service Automation](/dynamics365/project-operations/psa/overview)). Use the information in this topic to deploy the best option for your company.
  
## Set the synchronization method

**To set the default synchronization method for all newly created user mailboxes** 
  
1. In the  [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment. 

2. On the command bar, select **Settings** > **Email** > **Email settings**.  
  
   > [!NOTE]
   > In the legacy web app, in the upper-right corner, select **Settings** ![Gear icon.](media/selection-rule-gear-button.png), and then select **Advanced settings**. Then go to   **Settings** > **Email Configuration** > **Email Configuration Settings.**.  
  
**To set the synchronization method for individual mailboxes** 

1.  In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment. 

    > [!NOTE]
    > In the legacy web app, in the upper-right corner, select **Settings** ![Gear icon.](media/selection-rule-gear-button.png), and then select **Advanced settings**. 

2. Select **Settings** > **Mailboxes**, and then select a mailbox.
  
For information about picking a synchronization method, go to [Integrate your email system](integrate-synchronize-your-email-system.md).  
  
## Incoming email messaging options

The available incoming email configurations that you can use when a user or a queue receives email messages are as follows:
  
- **None**. Use this option for users or queues who don't use customer engagement apps to track received email messages. 
  
- **Dynamics 365 for Outlook**. This option is deprecated for Microsoft Power Platform and Microsoft Dataverse. This option is only available for on-premises deployments. More information: [Dynamics 365 for Outlook is deprecated](/important-changes-coming#dynamic-365-for-outlook-is-deprecated)
  
- **Server-Side Synchronization or Email Router**. When you select this option, the server-side synchronization or email router will process email messages directly from the user's or queue's inbox, without using a forward or a sink mailbox. 
  
- **Forward Mailbox**. This option requires a "sink" mailbox, which is a dedicated mailbox that collects email messages transferred from each user's mailbox by a server-side rule. This option doesn't require users to run Outlook, however it does require that the rule be deployed for each user. Use the **Rule Deployment Wizard** to deploy rules to each user mailbox. This option was provided for initial migration to server-side synchronization from previous versions of Dynamics 365. We don't recommend it as a long-term solution due to performance reasons. More information: [Forward mailbox vs. individual mailboxes](forward-mailbox-vs-individual-mailboxes.md) 
  
## Outgoing email messaging options

The available outgoing email configurations that you can use when users or queues send email messages are as follows:
  
- **None**. Use this option for users or queues who don't use customer engagement apps to send email messages. 
  
- **Dynamics 365 for Outlook**. This option is deprecated for Microsoft Power Platform and Dataverse. This option is only available for on-premises deployments. More information: [Dynamics 365 for Outlook is deprecated](/important-changes-coming#dynamic-365-for-outlook-is-deprecated)
  
- **Server-Side Synchronization or Email Router**. This option delivers email messages by using the server-side synchronization or email router component. The email system must be SMTP-compliant. The server-side synchronization or email router can be installed on the SMTP server or on a different computer that has a connection to the SMTP server.


## Find the right combination of settings

Email auto-tracking behavior for a given user or queue is a combination of personal options and system settings. In addition to the synchronization methods described in this topic, server-side synchronization honors a user's [personal email options](/powerapps/user/set-personal-options#email-tab-options) and environment-level [system settings](system-settings-dialog-box-email-tab.md). 

For help finding the right combination of settings for your organization, go to [Community forum: How to choose System Settings and Personal Options for automatic Email tracking](https://community.dynamics.com/crm/b/crminthefield/posts/dynamics-365-customer-engagement-how-to-choose-system-settings-and-personal-options-for-automatic-email-tracking).


  
### See also

 [Forward mailbox vs. individual mailboxes](../admin/forward-mailbox-vs-individual-mailboxes.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
