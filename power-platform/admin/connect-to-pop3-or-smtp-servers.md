---
title: "Connect Gmail accounts by using credentials specified by a user or queue | MicrosoftDocs"
description: Connect Gmail accounts using credentials specified by a user or queue 
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/12/2021
author: revachauhan
ms.subservice: admin
ms.author: rechauha
ms.reviewer: mkaur
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Connect Gmail accounts by using credentials specified by a user or queue 

Follow the steps in this article to set up server-side synchronization to send and receive email in customer engagement apps (such as [Dynamics 365 Sales](/dynamics365/sales-professional/help-hub), [Dynamics 365 Customer Service](/dynamics365/customer-service/help-hub), [Dynamics 365 Marketing](/dynamics365/marketing/help-hub), [Dynamics 365 Field Service](/dynamics365/field-service/overview), and [Dynamics 365 Project Service Automation](/dynamics365/project-operations/psa/overview)) from Gmail accounts by using credentials specified by a user or queue as the authorization mechanism.


## Create an email server profile  

1. In the Power Platform admin center, select an environment. 

2. On the command bar, select **Settings** > **Email** > **Server profiles**.  
    
   > [!div class="mx-imgBorder"] 
   > ![Screenshot showing email server profile settings.](media/server-profile-settings.png "Email server profile setting")

3. On the command bar, select **New server profile**.

   > [!div class="mx-imgBorder"] 
   > ![Screenshot showing Create a new server profile.](media/new-server-profile.png "Create a new server profile")

4. For **Email Server Type**, select **Gmail**, and then specify a meaningful **Name** for the profile.

   > [!div class="mx-imgBorder"] 
   > ![Screenshot showing create a new server profile for Gmail.](media/gmail-profile.png "Create a new server profile for Gmail")

5. If you want to use this server profile as the default profile for new mailboxes, turn on **Set as default profile for new mailboxes**.

6. For **Authentication Type**, select **Credential specified by user or queue (Using less secure apps)**. The credentials specified in the mailbox row of a user or queue are used for sending or receiving email for the respective user or queue.

   > [!NOTE]
   > To ensure that the credentials are secured, SQL encryption is used to encrypt the credentials stored in the mailbox.

   > [!div class="mx-imgBorder"] 
   > ![Screenshot showing create a new server profile for Gmail using credential specified by user or queue.](media/gmail-profile-user-queue.png "Create a new server profile for Gmail using credential specified by user or queue")

7. The **Locations and ports** fields are automatically populated.

8. Expand **Advanced**, and then use the tooltips to choose your email processing options.

9. When you're done, select **Save**.

<a name="BKMK_ConfigureDefault"></a>   

## Configure default email processing and synchronization 

Set server-side synchronization to be the default configuration method.  

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Email** > **Email settings**.  

3. Under **Synchronization methods**, set the processing and synchronization fields as follows:  

   - **Server Profile**: The profile you created in the preceding section.  

   - **Incoming Email**: Server-Side Synchronization or Email Router  

   - **Outgoing Email**: Server-Side Synchronization or Email Router  

   - **Appointments, Contacts, and Tasks**: Server-Side Synchronization or Email Router 

     > [!NOTE]
     >  The **Server-Side Synchronization or Email Router** setting for Appointments, Contacts, and Tasks isn't supported for the POP3-SMTP profile.  

     If you leave **Email processing for unapproved user and queues** at the default values (selected), you'll need to approve emails and queues for user mailboxes as directed in [**Approve email**](#approve-email), later in this topic.  

     ![Screenshot showing System Settings for server-side synchronization.](../admin/media/crm-itpro-exchangeonlinessssettingspop.png "System Settings for server-side synchronization")  

4. Select **Save**.  

<a name="BKMK_ConfigureMailboxes"></a>   

## Configure mailboxes

To set mailboxes to use the default profile, you must first set the server profile and the delivery method for email, appointments, contacts, and tasks.  

In addition to administrator permissions, you must have Read and Write privileges on the Mailbox table to set the delivery method for the mailbox.  

Choose *one* of the following methods: set mailboxes to the default profile, or edit mailboxes to set profile and delivery methods.

<!--markdownlint-disable MD036--> 
**To set mailboxes to the default profile**

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Email** > **Mailboxes**.  

3. Select **Active Mailboxes**.  

4. Select all the mailboxes that you want to associate with the POP3-SMTP profile you created, select **Apply Default Email Settings**, verify the settings, and then select **OK**.  

   ![Screenshot showing Apply default email settings.](../admin/media/apply-default-email-settings.png "Apply default email settings")  

    By default, the mailbox configuration is tested and the mailboxes are enabled when you select **OK**.  

**To edit mailboxes to set the profile and delivery methods**

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Email** > **Mailboxes**.  

3. Select **Active Mailboxes**.  

4. Select the mailboxes that you want to configure, and then select **Edit**.  

5. In the **Change Multiple Records** form, under **Synchronization Method**, set **Server Profile** to the POP3-SMTP profile you created earlier.  

6. Set **Incoming** and **Outgoing** **Email** to **Server-Side Synchronization or Email Router**.  

7. Set **Appointments, Contacts, and Tasks** to **None**.  

8. Select **Change**.  

<a name="BKMK_ApproveEmail"></a> 

## Approve email

You need to approve each user mailbox or queue before that mailbox can process email.  

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Email** > **Mailboxes**.  

3. Select **Active Mailboxes**.  

4. Select the mailboxes that you want to approve, and then select **More Commands** (**…**) > **Approve Email**.  

5. Select **OK**.  

<a name="BKMK_TestConfiguration"></a>   

## Test the configuration of mailboxes  

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Email** > **Mailboxes**.  

3. Select **Active Mailboxes**.  

4. Select the mailboxes you want to test, and then select **Test & Enable Mailboxes**.  

    This tests the incoming and outgoing email configuration of the selected mailboxes and enables them for email processing. If an error occurs in a mailbox, an alert is shown on the **Alerts** wall of the mailbox and the profile owner. Depending on the nature of the error, customer engagement apps will try to process the email again after some time or disable the mailbox for email processing.  

    The result of the email configuration test is displayed in the **Incoming Email Status**, **Outgoing Email Status**, and **Appointments, Contacts, and Tasks Status** fields of a mailbox record. An alert is also generated when the configuration is successfully completed for a mailbox. This alert is shown to the mailbox owner.  

    You can find information about recurring issues and other troubleshooting information in [Blog: Test and Enable Mailboxes in Microsoft Dynamics CRM 2015](https://blogs.msdn.com/b/crm/archive/2015/08/31/test-and-enable-mailboxes-in-microsoft-dynamics-crm-2015.aspx) and [Troubleshooting and monitoring server-side synchronization](troubleshooting-monitoring-server-side-synchronization.md).  

> [!TIP]
>  If you're unable to synchronize contacts, appointments, and tasks for a mailbox, you might want to select the **Sync items with Exchange from this org only, even if Exchange was set to sync with a different org** checkbox. More information: [When would I want to use this check box?](when-would-want-use-check-box.md)  

<a name="BKMK_TestEmailConfig"></a>   

## Test email configuration for all mailboxes associated with an email server profile  

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Email** > **Server profiles**.  

3. Select the profile you created, and then select **Test & Enable Mailboxes**.  

    When you test the email configuration, an asynchronous job runs in the background. It might take a few minutes for the test to be completed. Customer engagement apps test the email configuration of all the mailboxes associated with the POP3-SMTP profile. For the mailboxes configured with server-side synchronization for synchronizing appointments, tasks, and contacts, it also checks to make sure they're configured properly.  

> [!TIP]
> If you're unable to synchronize contacts, appointments, and tasks for a mailbox, you might want to select the **Sync items with Exchange from this org only, even if Exchange was set to sync with a different org** checkbox. More information: [When would I want to use this check box?](when-would-want-use-check-box.md) 

<a name="BKMK_NetworkPorts"></a>   

## Network ports for Power Apps US Government

The following ports are open for outbound connections between Power Apps US Government and internet services: 

- 80 HTTP  
- 443 HTTPS 
- 465 Secure SMTP  
- 995 Secure POP3  

Customizations or email configurations in Power Apps US Government can only use these ports.  

### See also

[Troubleshooting and monitoring server-side synchronization](troubleshooting-monitoring-server-side-synchronization.md) <br />
[Test mail flow with the Remote Connectivity Analyzer](https://technet.microsoft.com/library/dn305950\(v=exchg.150\).aspx)   
[Microsoft Power Apps US Government](powerapps-us-government.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
