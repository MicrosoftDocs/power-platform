---
title: Connect to IMAP or POP servers
description: Connect to IMAP, POP, or SMTP servers
ms.component: pa-admin
ms.topic: how-to
ms.date: 09/30/2025
author: DanaMartens
ms.subservice: admin
ms.author: dmartens
ms.reviewer: sericks
contributors: ellenwehrle
search.audienceType:
- admin
---
# Connect to IMAP, POP, or SMTP servers

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Follow these steps to connect customer engagement apps (such as [Dynamics 365 Sales](/dynamics365/sales-professional/help-hub), [Dynamics 365 Customer Service](/dynamics365/customer-service/help-hub), [Dynamics 365 Marketing](/dynamics365/marketing/help-hub), [Dynamics 365 Field Service](/dynamics365/field-service/overview), and [Dynamics 365 Project Service Automation](/dynamics365/project-operations/psa/overview)) with IMAP or POP email servers, such as those used for Gmail and Yahoo! Mail.  

> [!NOTE]
>
> - Only emails in the Inbox folder will be synchronized.
> - Existing POP3 email profiles won't automatically be converted to IMAP. You can't migrate email profiles from POP3 to IMAP, but you can create a new IMAP email server profile and move your mailboxes to the new server profile.
> - For information about IMAP or SMTP systems supported by Microsoft, go to [Supported email service configurations for server-side synchronization](supported-email-service-configurations-server-side-synchronization.md).  
> - To learn more about the protocols and ciphers used to secure the connection between Dynamics 365 and external email services, see [Server cipher suites and TLS requirements](server-cipher-tls-requirements.md).

## Create an email server profile

Take these steps to create an email server profile in the Power Platform admin center.

> [!NOTE]
> If you want to use the legacy view, go to [Create an email server profile using the legacy web app](#create-an-email-server-profile-by-using-the-legacy-web-app).

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Manage**.
1. On the **Manage** pane, select **Environments** and then select an environment
1. On the command bar, select **Settings**, then on the page select **Email** > **Server profiles**.
    :::image type="content" source="media/connect-to-imap-servers/email-server-profiles-settings.png" alt-text="Choose an email server profile.":::
1. On the command bar, select **New server profile** to view the *Set up server profile* pane.
    :::image type="content" source="media/connect-to-imap-servers/pop-smtp-profile.png" alt-text="Choose other profile.":::
1. For **Email Server Type**, select **Other (IMAP/POP,SMTP)**, and then specify a meaningful **Name** for the profile.
1. If you want to use this server profile as the default profile for new mailboxes, turn on **Set as default profile for new mailboxes**.
1. For **Authentication Type**, select **Credential Specified by user or queue**. When you select this option, the credentials specified in the mailbox record of a user or queue are used for sending or receiving email for the respective user or queue.
   > [!NOTE]
   > To ensure that the credentials are secured, SQL encryption is used to encrypt the credentials stored in the mailbox.
1. Expand **Locations and ports**, and enter the following:

   - **Incoming communication protocol**: Enter the protocol that will be used for authentication for incoming email.
   - **Incoming and Outgoing location**: Enter the incoming and outgoing email location.
   - **Incoming and Outgoing port**: Enter the incoming and outgoing port for the email server.

1. Expand the **Advanced** section, and use the tooltips to choose your email processing options.
1. When you're done, select **Save**.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment.
1. On the command bar, select **Settings** > **Email** > **Server profiles**.
    :::image type="content" source="media/connect-to-imap-servers/server-profile-settings.png" alt-text="Choose server profile.":::
1. On the command bar, select **New server profile**.
1. For **Email Server Type**, select **Other (IMAP/POP,SMTP)**, and then specify a meaningful **Name** for the profile.
   :::image type="content" source="media/connect-to-imap-servers/pop-smtp-profile.png" alt-text="Choose other profile.":::
1. If you want to use this server profile as the default profile for new mailboxes, turn on **Set as default profile for new mailboxes**.
1. For **Authentication Type**, select **Credential Specified by user or queue**. When you select this option, the credentials specified in the mailbox record of a user or queue are used for sending or receiving email for the respective user or queue.
   > [!NOTE]
   > To ensure that the credentials are secured, SQL encryption is used to encrypt the credentials stored in the mailbox.
1. Expand **Locations and ports**, and enter the following:

   - **Incoming communication protocol**: Enter the protocol that will be used for authentication for incoming email.
   - **Incoming and Outgoing location**: Enter the incoming and outgoing email location.
   - **Incoming and Outgoing port**: Enter the incoming and outgoing port for the email server.

1. Expand the **Advanced** section, and use the tooltips to choose your email processing options.
1. When you're done, select **Save**.

## Create an email server profile by using the legacy web app

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Manage**.
1. On the **Manage** pane, select **Environments** and then select an environment
1. On the command bar, select **Settings**, then on the page select **Email** > **Server profiles**.
1. On the command bar, select **Go to legacy**.
1. On the command bar, select **New** > **IMAP/SMTP Server**.  

1. For an Exchange email server profile, specify the following details:  

   |  Fields  |     Description      |
   |-----------|----------|
   |   **General**      |     |
   | Name     |  Specify a meaningful name for the profile.   |
   |   Description   |  Enter a short description about the objective of the email server profile.       |
   | Incoming Server Location and Outgoing Server Location  |  Enter the **Incoming Server Location** and **Outgoing Server Location**<br /><br /> For example, Incoming: imap.mail.yahoo.com  and Outgoing: smtp.mail.yahoo.com  |
   |  **Credentials**  |    |
   |  Authenticate Using  | Select a method to authenticate while connecting to the specified email server.<br /><br /> <ul><li> **Credentials Specified by a User or Queue**. If you select this option, the credentials specified in the mailbox record of a user or queue are used for sending or receiving email for the respective user or queue.<br> **Note:** To ensure that the credentials are secured, SQL encryption is used to encrypt the credentials stored in the mailbox.</li><br /><li> **Credentials Specified in Email Server Profile**. If you select this option, the credentials specified in the email server profile are used for sending or receiving email for the mailboxes of all users and queues associated with this profile. The credentials must have impersonation or delegation permissions on the mailboxes associated with the profile. This option requires some configuration on the email server, for example, configuring impersonation rights on [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] for the mailboxes associated with the profile.<br>**Note:** To ensure that the credentials are secured, SQL encryption is used to encrypt the credentials stored in the email server profile if you're processing email by using server-side synchronization.</li><br /><li> **Windows Integrated Authentication**. This option applies only to [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] and SMTP email server types. If you select this option, the credentials with which the Asynchronous Service has been configured will be used.</li><br /><li> **Without Credentials (Anonymous)**. Not a valid setting. </li></ul>|
   | User Name   | Enter the username used to connect to the email server for sending or receiving email for the mailboxes of all users and queues associated with this profile. This field is enabled and valid only if **Authenticate Using** is set to **Credentials Specified in Email Server Profile**. The username that you specify must have permission to send and receive email from the mailboxes of users and queues associated with this profile.<br>**Note:**  If you're using HTTP for customer engagement apps, the **User Name** and **Password** fields will be disabled. To enable the option, change the value of the deployment property AllowCredentialsEntryViaNonSecureChannels to 1.  |
   |  Password   |  Specify the password of the user that will be used together with the username to connect to the email server for sending or receiving email for the mailboxes of users and queues associated with this profile. The password is stored securely. <br>**Note:** If you're using HTTP for customer engagement apps, the **User Name** and **Password** fields will be disabled. To enable the option, change the value of the deployment property AllowCredentialsEntryViaNonSecureChannels to 1. |
   | Use same settings for Outgoing |  If you want to use the same credential settings for the incoming and outgoing connections, choose **Yes**.  |
   | **Advanced**    |  |
   |  Incoming Port  | This field shows the port on the email server for accessing the incoming email. This field is automatically populated when you save the record.   |
   |  Outgoing Port  | This field shows the port on the email server for accessing the outgoing email. This field is automatically populated when you save the record.   |
   | Use SSL for Incoming Connection    |  Choose **Yes** if the email channel is on a secure channel and [!INCLUDE[pn_ssl_short](../includes/pn-ssl-short.md)] must be used for receiving email.   |
   | Use SSL for Outgoing Connection |  Choose **Yes** if the email channel is on a secure channel and [!INCLUDE[pn_ssl_short](../includes/pn-ssl-short.md)] must be used for sending email.  |
   | Incoming Authentication Protocol and Outgoing Authentication Protocol |  Select a protocol that will be used for authentication for incoming and outgoing email.  |
   |   **Additional Settings**  |  |
   |  Process Email From |  Select a date and time. Email received after the date and time will be processed by server-side synchronization for all mailboxes associated with this profile. If you set a value earlier than the current date, the change will be applied to all newly associated mailboxes, and their emails that were processed earlier will be pulled.  |
   | Minimum Polling Intervals in Minutes  |  Enter the minimum polling interval, in minutes, for mailboxes that are associated with this email server profile. The polling interval determines how often server-side synchronization polls your mailboxes for new email messages.  |
   |  Maximum Concurrent Connections   | Enter the maximum number of simultaneous connections that can be made to the corresponding email server, per mailbox. Increase the value to allow more parallel calls to [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] to improve performance, or reduce the value if there are errors on [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] due to a large number of calls from customer engagement apps. The default value of this field is 10. The maximum number is considered per mailbox or per email server profile, depending on whether the credentials are specified in a mailbox or email server profile.   |

1. Select **Save**.  

## Configure default email processing and synchronization

Set server-side synchronization to be the default configuration method.

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment.
1. Select **Settings** > **Email** > **Email settings**.  
1. Set the processing and synchronization fields as follows:  

   - **Server Profile**: The profile you created in the preceding section.  
   - **Incoming Email**: Server-Side Synchronization or Email Router  
   - **Outgoing Email**: Server-Side Synchronization or Email Router  
   - **Appointments, Contacts, and Tasks**: Server-Side Synchronization or Email Router

       > [!NOTE]
       > The **Server-Side Synchronization or Email Router** setting for appointments, contacts, and tasks isn't supported for the IMAP profile.  

     If you leave **Email processing for unapproved user and queues** at the default values (selected), you'll need to approve emails and queues for user mailboxes as directed in [**Approve email**](#approve-email), later in this topic.  

     ![Screenshot showing System Settings for server-side synchronization.](../admin/media/imap-profile.png "System Settings for server-side synchronization")  

4. Select **OK**.  

## Configure mailboxes

To set mailboxes to use the default profile, you must first set the server profile and the delivery method for email, appointments, contacts, and tasks.  

In addition to administrator permissions, you must have Read and Write privileges on the Mailbox table to set the delivery method for the mailbox.  

Choose **one** of the following methods:

- Set mailboxes to the default profile
- Edit mailboxes to set profile and delivery methods.

### Set mailboxes to the default profile

Take these steps to set mailboxes to default profiles.

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment.
2. Select **Settings** > **Email** > **Mailboxes**.
3. Select **Active Mailboxes** if not already in that section.
4. Select all the mailboxes that you want to associate with the IMAP profile you created, select **Apply Default Email Settings**, verify the settings, and then select **OK**. By default, the mailbox configuration is tested and the mailboxes are enabled when you select **OK**.  

### Edit mailboxes to set the profile and delivery methods

Take these steps to edit mailboxes to set the profile and delivery methods.

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment.
1. Select **Settings** > **Email** > **Mailboxes**.  
1. Select **Active Mailboxes** if not already in that section.  
1. Select the mailboxes that you want to configure, and then select **Edit**.  
1. In the **Change Multiple Records** form, under **Synchronization Method**, set **Server Profile** to the IMAP profile you created earlier.  
1. Set **Incoming** and **Outgoing** **Email** to **Server-Side Synchronization or Email Router**.  
1. Set **Appointments, Contacts, and Tasks** to **None**.  
1. Select **Change**.  

## Approve email

You need to approve each user mailbox or queue before that mailbox can process email. More information: [Approve email](connect-exchange-online.md#approve-email)

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment.
1. Select **Settings** > **Email** > **Mailboxes**.  
1. Select **Active Mailboxes** if not already in that section.  
1. Select the mailboxes that you want to approve, and then select **Approve Email**.  
1. Select **OK**.

## Test the configuration of mailboxes

Take these steps to test the configuration of mailboxes:

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment.
1. Select **Settings** > **Email** > **Mailboxes**.  
1. Select **Active Mailboxes** if not already in that section.  
1. Select the mailboxes you want to test, and then select **Test & Enable Mailboxes**.  

    This tests the incoming and outgoing email configuration of the selected mailboxes and enables them for email processing. If an error occurs in a mailbox, an alert is shown on the **Alerts** wall of the mailbox and the profile owner. Depending on the nature of the error, server-side synchronization will try to process the email again after some time or disable the mailbox for email processing.

    The result of the email configuration test is displayed in the **Incoming Email Status** and **Outgoing Email Status** of a mailbox row. An alert is also generated when the configuration is successfully completed for a mailbox. This alert is shown to the mailbox owner.

You can find information about recurring issues and other troubleshooting information in the following topics:

- [Test configuration of mailboxes](connect-exchange-online.md#test-the-configuration-of-mailboxes)
- [Troubleshooting and monitoring server-side synchronization](troubleshooting-monitoring-server-side-synchronization.md).

## Test email configuration for all mailboxes associated with an email server profile  

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment.
1. Select **Settings** > **Email** > **Server profiles**.  
1. Select the profile you created, and then select **Test & Enable Mailboxes**.  

    When you test the email configuration, an asynchronous job runs in the background. It might take a few minutes for the test to complete. Customer engagement apps test the email configuration of all the mailboxes associated with the IMAP profile. For the mailboxes configured with server-side synchronization for synchronizing appointments, tasks, and contacts, it also checks to make sure they're configured properly.  

> [!TIP]
> If you're unable to synchronize contacts, appointments, and tasks for a mailbox, you might want to select the **Sync items with Exchange from this org only, even if Exchange was set to sync with a different org** checkbox. More information: [When would I want to use this check box?](when-would-want-use-check-box.md).

## Network ports for Power Apps

 The following ports are open for outbound connections between Power Apps and internet services:  

- 80 HTTP  
- 443 HTTPS
- 465 Secure SMTP  
- 587 Secure SMTP  
- 993 Secure IMAP  

Customizations or email configurations in Power Apps can only use these ports.  

### See also

[Troubleshooting and monitoring server-side synchronization](troubleshooting-monitoring-server-side-synchronization.md) <br />
[Test mail flow with the Remote Connectivity Analyzer](https://technet.microsoft.com/library/dn305950\(v=exchg.150\).aspx)   
[Set up server-side synchronization](set-up-server-side-synchronization-of-email-appointments-contacts-and-tasks.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
