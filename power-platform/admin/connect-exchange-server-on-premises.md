---
title: "Connect to Exchange Server (on-premises) | MicrosoftDocs"
description: Connect to Exchange Server (on-premises)
ms.component: pa-admin
ms.topic: how-to
ms.date: 05/16/2025
author: DanaMartens
contributors: yingchin
ms.subservice: admin
ms.author: dmartens
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
ms.custom:
  - NewPPAC
  - sfi-image-nochange
---
# Connect to Exchange Server (on-premises)

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

With version 9.0, you can connect your customer engagement apps (such as [Dynamics 365 Sales](/dynamics365/sales-professional/help-hub), [Dynamics 365 Customer Service](/dynamics365/customer-service/help-hub), [Dynamics 365 Marketing](/dynamics365/marketing/help-hub), [Dynamics 365 Field Service](/dynamics365/field-service/overview), and [Dynamics 365 Project Service Automation](/dynamics365/project-operations/psa/overview)) with [!INCLUDE[pn_Exchange_Server_full](../includes/pn-exchange-server-full.md)] (on-premises). More information: [Setup Guide: Server-side synchronization for CRM Online and Exchange Server](https://download.microsoft.com/download/E/D/0/ED05CA70-190F-4BAE-9F6A-0BB2F0010B81/Setup%20Guide%20Server-side%20synchronization%20for%20CRM%20Online%20and%20Exchange%20Server.pdf) (white paper)

## Prerequisites  

1. **Exchange Server**. The following versions are supported: [!INCLUDE[pn_Exchange_Server_2013_short](../includes/pn-exchange-server-2013-short.md)] SP1, [!INCLUDE[pn_exchange_server_2016_short](../includes/pn-exchange-server-2016-short.md)], and Exchange Server 2019.  

2. **Authentication**. During installation, [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] configures [!INCLUDE[pn_Internet_Information_Services](../includes/pn-internet-information-services.md)]. To connect customer engagement apps with [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)], you must enable Windows NT LAN Manager (NTLM) or Basic authentication in [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)]. If you configure NTLM authentication, make sure Basic authentication is disabled on Exchange Server.  

For more information about authentication, go to:  

   - Exchange Server 2013: [Authentication and Exchange Web Services (EWS) in Exchange](/exchange/client-developer/exchange-web-services/authentication-and-ews-in-exchange)  
   - Exchange Server 2013: [Default settings for Exchange virtual directories](/exchange/default-settings-for-exchange-virtual-directories-exchange-2013-help) 
   - Exchange Server 2016: [Default settings for Exchange virtual directories](/Exchange/clients/default-virtual-directory-settings?view=exchserver-2019&preserve-view=true)
   - Exchange Server 2019: [Default settings for Exchange virtual directories](/Exchange/clients/default-virtual-directory-settings?view=exchserver-2019&preserve-view=true)

3. **ApplicationImpersonation role**. You need to create and configure a service account with the **ApplicationImpersonation** role in [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)]. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Impersonation and EWS in Exchange](https://msdn.microsoft.com/library/office/dn722377\(v=exchg.150\).aspx) 

4. **Secured connection**. The connection between customer engagement apps and Exchange must be encrypted via [TLS/SSL](/windows/win32/secauthn/cipher-suites-in-schannel) and current [cipher suites](server-cipher-tls-requirements.md). 

5. **Exchange Web Services (EWS)**. Connections to EWS must be allowed through the firewall. Often a reverse proxy is used for the exterior-facing connection. If your EWS endpoint is not exterior-facing, review [IP addresses required](online-requirements.md#ip-addresses-required). Be sure to add IP addresses to the allow list on your on-premises firewall, based on your Dynamics 365 online environment region to allow connections to your Exchange server that is on-premises.


> [!TIP]
> To make sure you've got a good connection to [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] (on-premises), run the [Microsoft Remote Connectivity Analyzer](https://testconnectivity.microsoft.com/). For information about which tests to run, see [Test mail flow with the Remote Connectivity Analyzer](https://technet.microsoft.com/library/dn305950\(v=exchg.150\).aspx). 
>
> For ports required, see [Network ports for clients and mail flow in Exchange](/exchange/plan-and-deploy/deployment-ref/network-ports?view=exchserver-2019&preserve-view=true).
> 
> To learn more about the protocols and ciphers used to secure the connection between Dynamics 365 and external email services, see [Server cipher suites and TLS requirements](server-cipher-tls-requirements.md).


## Create an email server profile  

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**. 
1. Expand **Email**, then select **Server profiles**.
1. In the command bar, select **New server profile**.

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**.  
1. Expand **Email**, then select **Server profiles**.
1. In the command bar, select **New server profile**.
---

#### In the **Set up server profile** panel:
1. For **Email Server Type**, select **Exchange Server (on premises)**, then enter a meaningful **Name** for the profile.
2. To set this server profile as the default for new mailboxes, enable **Set as default profile for new mailboxes**. 
3. For **Authentication Type**, choose one of the following:

    - **Authenticate using Impersonation (Basic Authentication)**: Enter the impersonation account **User name** and **Password**. The credentials specified in the email server profile are used for sending or receiving email for the mailboxes of all users and queues associated with this profile. The credentials must have impersonation or delegation permissions on the mailboxes associated with the profile. This option requires some configuration on the email server, for example configuring impersonation rights on Exchange for the mailboxes associated with the profile.

    > [!NOTE]
    > To ensure the credentials are secured, SQL encryption is used to encrypt the credentials stored in the email server profile.
    
    - **Hybrid Modern Authentication (OAuth)**: To get the information for this option, follow the steps in [Hybrid Modern Authentication (HMA) for Exchange on-premises](connect-exchange-server-onprem-hma.md).

4. Expand **Locations and ports**, then follow these steps:

   - If **Authentication Type** is set to **Authenticate using Impersonation (Basic Authentication)**, select whether **Autodiscover server location** is **Active** or **Inactive**. <br><br> If you choose **Inactive**, enter the incoming and outgoing email server information. Enter the ports for the email server to use for accessing incoming and outgoing email. Select the protocol that will be used for authentication for incoming and outgoing email. 
   
   -  If **Authentication Type** is set to **Hybrid Modern Authentication (OAuth)**, enter the location and port for the email server.

5. Expand the **Advanced** section and use the tooltips to configure email processing options. 
6. When finished, click **Save** to apply the changes. 

## Configure default email processing and synchronization

Set server-side synchronization to be the default configuration method.  

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, click **Settings**. 
1. Expand **Email**, then select **Email settings**.

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, click **Settings**.  
1. Expand **Email**, then select **Email settings**.
---

On the **Email settings** page, set up the **Synchronization methods** as follows:
1. Configure the following processing and synchronization options:  

   - **Server Profile**: Select the profile created in the preceding section.  

   - **Incoming Email**: Choose **Server-Side Synchronization** or **Email Router**.

   - **Outgoing Email**: Choose **Server-Side Synchronization** or **Email Router**.

   - **Appointments, Contacts, and Tasks**: Choose **Server-Side Synchronization** or **Email Router**.

     If **Email processing for unapproved user and queues** remains at its default setting (enabled), you'll need to approve emails and queues for user mailboxes as directed in [**Approve email**](#approve-email) later in this topic.  

2. Click **Save** to apply the changes.  

## Configure mailboxes

To set mailboxes to use the default profile, you must first set the server profile and the delivery method for email, appointments, contacts, and tasks.  

In addition to administrator permissions, you must have Read and Write privileges on the Mailbox table to set the delivery method for the mailbox.  

Choose **one** of the following methods: **set mailboxes to the default profile**, or **edit mailboxes to set profile and delivery methods**.
 
**To set mailboxes to the default profile**  

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, click **Settings**. 
1. Expand **Email**, then select **Mailboxes**.
1. In the grid view selector, select to **Active Mailboxes**.
1. Select all the mailboxes to associate with the server profile you created.
1. In the command bar, click **Apply Default Email Settings**, verify the settings, then click **OK**. 

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, click **Settings**.  
1. Expand **Email**, then select **Mailboxes**.
1. In the grid view selector, select **Active Mailboxes**.
1. Select all the mailboxes to associate with the server profile you created.
1. In the command bar, click **Apply Default Email Settings**, verify the settings, then click **OK**.  
---

By default, the mailbox configuration is tested, and the mailboxes are enabled upon selecting **OK**.  

**To edit mailboxes to set the profile and delivery methods**  

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose the environment you want to modify.
1. In the command bar, click **Settings**. 
1. Expand **Email**, then select **Mailboxes**.
1. In the grid view selector, choose **Active Mailboxes**.
1. Select the mailboxes you want to configure, then click **Edit** in the command bar.

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, choose the environment you want to modify.
1. In the command bar, click **Settings**.  
1. Expand **Email**, then select **Mailboxes**.
1. In the grid view selector, choose **Active Mailboxes**.
1. Select the mailboxes you want to configure, then click **Edit** in the command bar.
---

On the **Mailbox** page, go to the **General** tab and set up **Synchronization methods** as follows:
1. Config the following processing and synchronization options:

- **Server Profile**: Select the server profile created earlier.  
- **Incoming** and **Outgoing** **Email**: Choose **Server-Side Synchronization** or **Email Router**.  
- **Appointments, Contacts, and Tasks**: Set to **Server-Side Synchronization**.  

2. Click **Save** to apply the changes.  

## Approve email

You need to approve each user mailbox or queue before that mailbox can process email.  

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, click **Settings**. 
1. Expand **Email**, then select **Mailboxes**.
1. In the grid view selector, choose **Active Mailboxes**.
1. Select the mailboxes you want to approve, then click **Approve Email** in the command bar.  
1. Click **OK** to apply the changes.

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, click **Settings**.  
1. Expand **Email**, then select **Mailboxes**.
1. In the grid view selector, choose **Active Mailboxes**.
1. Select the mailboxes you want to approve, then click **Approve Email** in the command bar.  
1. Click **OK** to apply the changes.
---

## Test the configuration of mailboxes  

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**. 
1. Expand **Email**, then select **Mailboxes**.
1. In the grid view selector, choose **Active Mailboxes**.
1. Select the mailboxes you want to test, then select **Test & Enable Mailboxes** in the command bar.

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**.  
1. Expand **Email**, then select **Mailboxes**.
1. In the grid view selector, choose **Active Mailboxes**.
1. Select the mailboxes you want to test, then select **Test & Enable Mailboxes** in the command bar.
---

This tests the incoming and outgoing email configuration of the selected mailboxes and enables them for email processing. If an error occurs in a mailbox, an alert is shown on the **Alerts** wall of the mailbox and the profile owner. Depending on the nature of the error, customer engagement apps try to process the email again after some time or disable the mailbox for email processing.  

The result of the email configuration test is displayed in the **Incoming Email Status**, **Outgoing Email Status**, and **Appointments, Contacts, and Tasks Status** fields of a mailbox record. An alert is also generated when the configuration is successfully completed for a mailbox. This alert is shown to the mailbox owner.  

## Test email configuration for all mailboxes associated with an email server profile  

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**. 
1. Expand **Email**, then select **Server profiles**.
1. Select the profile you created, then select **Test & Enable Mailboxes** in the command bar.

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**.  
1. Expand **Email**, then select **Server profiles**.
1. Select the profile you created, then select **Test & Enable Mailboxes** in the command bar.
---

When you test the email configuration, an asynchronous job runs in the background. It might take a few minutes for the test to be completed. Customer engagement apps test the email configuration of all the mailboxes associated with the server profile. For the mailboxes configured with server-side synchronization for synchronizing appointments, tasks, and contacts, it also checks to make sure they're configured properly.  

> [!TIP]
> If you're unable to synchronize contacts, appointments, and tasks for a mailbox, you might want to select the **Sync items with Exchange from this org only, even if Exchange was set to sync with a different org** checkbox. You can learn more about this tip by reading, [When would I want to use this check box?](when-would-want-use-check-box.md). 

### See also

 [Troubleshooting and monitoring server-side synchronization](troubleshooting-monitoring-server-side-synchronization.md)   
 [Test mail flow with the Remote Connectivity Analyzer](https://technet.microsoft.com/library/dn305950\(v=exchg.150\).aspx)   
 [Server-side synchronization](server-side-synchronization.md)   
 [Autodiscover service](https://technet.microsoft.com/library/bb124251\(v=exchg.150\).aspx)   
 [Managing the Autodiscover Service](https://technet.microsoft.com/library/aa995956\(v=exchg.141\).aspx)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
