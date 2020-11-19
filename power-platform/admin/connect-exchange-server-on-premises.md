---
title: "Connect to Exchange Server (on-premises) | MicrosoftDocs"
description: Connect to Exchange Server (on-premises)
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/12/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Connect to Exchange Server (on-premises)

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

<!-- legacy procedure -->

With version 9.0., you can connect your customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), with [!INCLUDE[pn_Exchange_Server_full](../includes/pn-exchange-server-full.md)] (on-premises).  

 Check out the following white paper: [Setup Guide: Server-side synchronization for CRM Online and Exchange Server](https://download.microsoft.com/download/E/D/0/ED05CA70-190F-4BAE-9F6A-0BB2F0010B81/Setup%20Guide%20Server-side%20synchronization%20for%20CRM%20Online%20and%20Exchange%20Server.pdf)  

<a name="BKMK_PreReq"></a>   
## Prerequisites  

1. **Exchange Server**. The following versions are supported: [!INCLUDE[pn_Exchange_Server_2013_short](../includes/pn-exchange-server-2013-short.md)] SP1, [!INCLUDE[pn_exchange_server_2016_short](../includes/pn-exchange-server-2016-short.md)], or Exchange Server 2019.  

2. **Authentication**. During installation, [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] configures [!INCLUDE[pn_Internet_Information_Services](../includes/pn-internet-information-services.md)]. To connect customer engagement apps with [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)], Windows (NTLM) or Basic authentication must be enabled in [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)]. When configuring Windows (NTLM) authentication, make sure Basic authentication is disabled on Exchange server.  

     For more information on authentication, see:  

   - Exchange Server 2013: [Authentication and EWS in Exchange](https://docs.microsoft.com/exchange/client-developer/exchange-web-services/authentication-and-ews-in-exchange)  

   - Exchange Server 2013: [Default settings for Exchange virtual directories](https://docs.microsoft.com/exchange/default-settings-for-exchange-virtual-directories-exchange-2013-help) 

   - Exchange Server 2016: [Default settings for Exchange virtual directories](https://docs.microsoft.com/Exchange/clients/default-virtual-directory-settings?view=exchserver-2019)

   - Exchange Server 2019: [Default settings for Exchange virtual directories](https://docs.microsoft.com/Exchange/clients/default-virtual-directory-settings?view=exchserver-2019)

3. **ApplicationImpersonation role**. You need to create and configure a service account with the **ApplicationImpersonation** role in [!INCLUDE[pn_Microsoft_Exchange](../includes/pn-microsoft-exchange.md)]. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Impersonation and EWS in Exchange](https://msdn.microsoft.com/library/office/dn722377\(v=exchg.150\).aspx).  

4. **Secured connection**. The connection between customer engagement apps and Exchange must be encrypted via [TLS/SSL](https://docs.microsoft.com/windows/win32/secauthn/cipher-suites-in-schannel) and current [cipher suites](onpremises-server-cipher-tls-requirements.md). 

5. **Exchange Web Services (EWS)**. Connections to EWS must be allowed through the firewall. Often a reverse proxy is used for the exterior facing connection.  

> [!TIP]
>  To make sure you've got a good connection to [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] on-premises run the [Microsoft Remote Connectivity Analyzer](https://testconnectivity.microsoft.com/). For information on what tests to run, see [Test mail flow with the Remote Connectivity Analyzer](https://technet.microsoft.com/library/dn305950\(v=exchg.150\).aspx).  

<a name="BKMK_CreateProfile"></a>   

## Create an email server profile  

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Email** > **Server profiles**.  

3. Select **New** > **Exchange Server (Hybrid)**.  

4. **For an Exchange email server profile, specify the following details:**  


   |                                         Fields                                         |                                                                                                                                                                                                                                                                                                                                                       Description                                                                                                                                                                                                                                                                                                                                                       |
   |----------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
   |                                      **General**                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
   |                                          Name                                          |                                                                                                                                                                                                                                                                                                                                       Specify a meaningful name for the profile.                                                                                                                                                                                                                                                                                                                                        |
   |                                      Description                                       |                                                                                                                                                                                                                                                                                                                        Type a short description about the objective of the email server profile.                                                                                                                                                                                                                                                                                                                        |
   |                             Auto Discover Server Location                              |                                                                                                                                                                                                                                                          Select **Yes** (recommended), if you want to use the automatically discover service to determine the server location. If you set this to **No**, you must specify the email server location manually.                                                                                                                                                                                                                                                           |
   |                 Incoming Server Location and Outgoing Server Location                  |                                                                                                                                                                                                                                                                                        If you select **No** in **Auto Discover Server Location**, enter a URL for **Incoming Server Location** and **Outgoing Server Location**.                                                                                                                                                                                                                                                                                        |
   |                                    **Credentials**                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
   |                            Authenticate Using Impersonation                            |                                                                                                                                                                                                                                                                                    Enter the credentials for the [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] service account granted the **ApplicationImpersonation** role.                                                                                                                                                                                                                                                                                     |
   |                                       User Name                                        |                                                                                                                                                                                                                                                                                                             Type the user name for the [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] service account.                                                                                                                                                                                                                                                                                                             |
   |                                        Password                                        |                                                                                                                                                                                                                                                                                                             Type the password for the [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] service account.                                                                                                                                                                                                                                                                                                              |
   |                                      **Advanced**                                      |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
   |                                **Additional Settings**                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
   |                                   Process Email From                                   |                                                                                                                                                                                             Select a date and time. Email received after the date and time will be processed by server-side synchronization for all mailboxes associated with this profile. If you set a value less than the current date, the change will be applied to all newly associated mailboxes and their earlier processed emails will be pulled.                                                                                                                                                                                              |
   |                          Minimum Polling Intervals in Minutes                          |                                                                                                                                                                                                                                           Type the minimum polling interval, in minutes, for mailboxes that are associated with this email server profile. The polling interval determines how often server-side synchronization polls your mailboxes for new email messages.                                                                                                                                                                                                                                           |
   |                             Maximum Concurrent Connections                             | Type the maximum number of simultaneous connections that can be made by customer engagement apps to the corresponding email server per mailbox. Increase the value to allow more parallel calls to [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] to improve performance or reduce the value if there are errors on [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] due to large number of calls from customer engagement apps. The default value of this field is 10. The maximum number is considered per mailbox or per email server profile depending on whether the credentials are specified in a mailbox or email server profile. |
   |                       Move Failed Emails to Undeliverable Folder                       |                                                                                                                                                                                                     To move the undelivered email to the Undeliverable folder, select **Yes**. If there's an error in tracking email messages in Dynamics 365 apps as email activities, and if this option is set to **Yes**, the email message will be moved to the Undeliverable folder.                                                                                                                                                                                                     |
   |                                **Email Notifications**                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
   | Send an alert email to the owner of the email server profile reporting on major events |                                                                                                                                                                                                                                                                                                   If you want the email server profile owner to be notified when more than 50% of the mailboxes fail, select **Yes**.                                                                                                                                                                                                                                                                                                    |


5. Select **Save**.  

6. Select **Test Connection** and review the results. To diagnose issues, see the following section.  

<a name="BKMK_TroubleshootHybrid"></a>   
### Troubleshooting the Exchange Server (Hybrid) profile connection  
 If you've run **Test Connection** and have issues with the Exchange Server (Hybrid) profile connection, use the information in the **Test Connection** dialog box to diagnose and fix the connection.  

 ![Review the error messages](../admin/media/server-side-sync-exchange-hybrid-troubleshoot.png "Review the error messages")  

 In this case, there's a problem with Auto Discover. The admin should review the user name and password used for **Authentication Using Impersonation** for the Exchange Server (Hybrid) profile.  

 You can find information on recurring issues and other troubleshooting information in [Blog: Test and Enable Mailboxes in Microsoft Dynamics CRM 2015](https://blogs.msdn.com/b/crm/archive/2015/08/31/test-and-enable-mailboxes-in-microsoft-dynamics-crm-2015.aspx) and [Troubleshooting and monitoring server-side synchronization](../admin/troubleshooting-monitoring-server-side-synchronization.md).  

<a name="BKMK_ConfigDefaultProcess"></a>   

## Configure default email processing and synchronization  
 Set server-side synchronization to be the default configuration method.  

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Email** > **Email settings**.  

3. Under **Synchronization methods**, set the processing and synchronization fields as follows:  

   - **Server Profile**: The profile you created in the above section.  

   - **Incoming Email**: Server-Side Synchronization or Email Router  

   - **Outgoing Email**: Server-Side Synchronization or Email Router  

   - **Appointments, Contacts, and Tasks**: Server-Side Synchronization or Email Router  

     If you leave the **Email processing form unapproved user and queues** at the default values (checked), you will need to approve emails and queues for user mailboxes as directed below in **Approve Email**.  

4. Select **Save**.  

<a name="BKMK_ConfigMailbox"></a>   

## Configure mailboxes  
 To set mailboxes to use the default profile, you must first set the Server Profile and the delivery method for email, appointments, contacts, and tasks.  

 In addition to administrator permissions, you must have Read and Write privileges on the Mailbox entity to set the delivery method for the mailbox.  

 Select **one** of the following methods:  

### Set mailboxes to the default profile  

1. In the web app, go to **Settings** > **Email Configuration** > **Mailboxes**.  

2. Select **Active Mailboxes**.  

3. Select all the mailboxes that you want to associate with the [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)] profile you created, select **Apply Default Email Settings**, verify the settings, and then select **OK**.  

   ![Apply default email settings](../admin/media/apply-default-email-settings.png "Apply default email settings")  

    By default, the mailbox configuration is tested and the mailboxes are enabled when you select **OK**.  

### Edit mailboxes to set the profile and delivery methods  

1. In the web app, go to **Settings** > **Email Configuration** > **Mailboxes**.  

2. Select **Active Mailboxes**.  

3. Select the mailboxes that you want to configure, and then select **Edit**.  

4. In the **Change Multiple Records** form, under **Synchronization Method**, set **Server Profile** to the [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)] profile you created earlier.  

5. Set **Incoming** and **Outgoing** **Email** to **Server-Side Synchronization or Email Router**.  

6. Set **Appointments, Contacts, and Tasks** to **Server-Side Synchronization**.  

7. Select **Change**.  

<a name="BKMK_ApproveEmail"></a>   

## Approve email  
 You need to approve each user mailbox or queue before that mailbox can process email.  

1.  In the web app, go to **Settings** > **Email Configuration** > **Mailboxes**.  

2.  Select **Active Mailboxes**.  

3.  Select the mailboxes that you want to approve, and then select **More Commands** (**…**) > **Approve Email**.  

4.  Select **OK**.  

<a name="BKMK_TestMailboxConfig"></a>   

## Test configuration of mailboxes  

1. Go to **Settings** > **Email Configuration** > **Mailboxes**.  

2. Select **Active Mailboxes**.  

3. Select the mailboxes you want to test, and then select **Test & Enable Mailboxes**.  

    This tests the incoming and outgoing email configuration of the selected mailboxes and enables them for email processing. If an error occurs in a mailbox, an alert is shown on the Alerts wall of the mailbox and the profile owner. Depending on the nature of the error, customer engagement apps try to process the email again after some time or disables the mailbox for email processing.  

    The result of the email configuration test is displayed in the **Incoming Email Status**, **Outgoing Email Status**, and **Appointments, Contacts, and Tasks Status** fields of a mailbox record. An alert is also generated when the configuration is successfully completed for a mailbox. This alert is shown to the mailbox owner.  

> [!TIP]
>  If you're unable to synchronize contacts, appointments, and tasks for a mailbox, you may want to select the **Sync items with Exchange from this org only, even if Exchange was set to sync with a different org** check box. [Read more about this check box](when-would-want-use-check-box.md).  

<a name="BKMK_TestAllMailbox"></a>   

## Test email configuration for all mailboxes associated with an email server profile  

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Email** > **Server profiles**.  

3. Select the profile you created, and then select **Test & Enable Mailboxes**.  

    When you test the email configuration, an asynchronous job runs in the background. It may take a few minutes for the test to be completed. Customer engagement apps test the email configuration of all the mailboxes associated with the [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)] profile. For the mailboxes configured with server-side synchronization for synchronizing appointments, tasks, and contacts, it also checks to make sure they're configured properly.  

> [!TIP]
>  If you're unable to synchronize contacts, appointments, and tasks for a mailbox, you may want to select the **Sync items with Exchange from this org only, even if Exchange was set to sync with a different org** check box. [Read more about this check box](when-would-want-use-check-box.md).  

### See also  
 [Troubleshooting and monitoring server-side synchronization](../admin/troubleshooting-monitoring-server-side-synchronization.md)   
 [Test mail flow with the Remote Connectivity Analyzer](https://technet.microsoft.com/library/dn305950\(v=exchg.150\).aspx)   
 [Server-side synchronization](../admin/server-side-synchronization.md)   
 [Autodiscover service](https://technet.microsoft.com/library/bb124251\(v=exchg.150\).aspx)   
 [Managing the Autodiscover Service](https://technet.microsoft.com/library/aa995956\(v=exchg.141\).aspx)
