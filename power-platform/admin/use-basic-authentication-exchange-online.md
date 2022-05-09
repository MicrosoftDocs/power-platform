---
title: "Use of Basic authentication with Exchange Online   | MicrosoftDocs"
description: Article discusses the impact of the deprecation of Basic authentication.
ms.component: pa-admin
ms.topic: overview
ms.date: 05/09/2022
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
# Use of Basic authentication with Exchange Online 

> [!IMPORTANT]
> Microsoft Exchange [plans](/exchange/clients-and-mobile-in-exchange-online/deprecation-of-basic-authentication-exchange-online) to disable the use of Basic authentication (also known as Legacy authentication) when connecting to Exchange Online starting October 1, 2022.  

## Overview

The [server-side synchronization](server-side-synchronization.md) feature and Dynamics 365 Email Router (deprecated) include configuration options that allowed customers to connect to Exchange Online using basic authentication (username and password). Server-side synchronization replaces the Email Router option which had been deprecated in July of 2018. If you are using our online service or on-premises (Dynamics CRM on-premises 2016 SP1 or later), server-side synchronization provides options to connect to Exchange Online using modern authentication options that do not depend on basic authentication. For how to use the required modern authentication options to connect Dynamics 365 online to Exchange Online, see [Connect to Exchange Online](connect-exchange-online.md). For how to connect Dynamics 365 on-premises to Exchange Online, see [Connect Customer Engagement (on-premises) to Exchange Online](/dynamics365/customerengagement/on-premises/admin/connect-dynamics-365-on-premises-exchange-online?view=op-9-1). 

## Impact

### What is the potential impact?
Once Exchange Online disables support for basic authentication, any connection from server-side synchronization or Email Router to Exchange Online using basic authentication will quit working. Any mailbox in Dynamics 365 configured with this type of connection will no longer be able to: 

- Send outgoing emails from Dynamics 365 through Exchange Online 
- Retrieve new incoming emails from Exchange Online 
- Synchronize appointments, contacts, or tasks between Dynamics 365 and Exchange Online 

### How do I know if my company is affected? 
If your company is using server-side synchronization or the Email Router to connect to Exchange Online using a username/password, action is required.  

### Are you using server-side synchronization or the Email Router? 
If you already know the answer, you can continue to step 2. If you are not sure, complete step 1: 

#### Step 1
Verify if your environment is configured to use server-side synchronization or Email Router.  
1. Access the Dynamics 365 web application as a user with the System Administrator security role.  
2. The next step is slightly different if you are using Dynamics 365 online or on-premises:

    **Dynamics 365 Online** and **Dynamics 365 on-premises**
    - In the upper-right corner, select **Settings** ![Gear icon.](media/selection-rule-gear-button.png), and then select **Advanced settings**. 
        
      > [!div class="mx-imgBorder"] 
      > ![Screenshot showing advanced settings.](media/advanced-settings.png "Advanced settings")

    - Select **Settings** > **Email Configuration** > **Email Configuration Settings**.  

3. Check which value is selected for the **Process Email Using** option. If **Server-Side Synchronization** is selected, the environment is using server-side synchronization and not the Email Router.

      :::image type="content" source="media/email-settings-process-email-using.png" alt-text="Email settings, Process Email Using option":::

#### Step 2
Based on the configured email option, refer to the corresponding section:  

**Server-side synchronization**

Identify which type of Email Server Profile is being used: 
1. On the **Email Configuration** page, select **Email Server Profiles**. 
2. View the list of Email Server Profile records that appear and follow the corresponding steps below based on whether you are using an online or on-premises deployment of Dynamics 365.

   **Dynamics 365 Online**
   - If you only see the default profile with a **Name** value of **Microsoft Exchange Online** and **Email Server Type Name** value of **Exchange Online**, you are using the server-side synchronization feature with the default Microsoft Exchange Online profile and are not affected because this profile use Server to Server (S2S) Authentication. 
    
   :::image type="content" source="media/email-configuration-active-profile-exchange-online.png" alt-text="Email settings, Active email server profile - Exchange Online":::

   - If you see other Email Server Profile records that **do not** have the **Email Server Type Name** value of **Exchange Online**, open each of the profiles to view the properties. If any of the profiles have an **Incoming Server Location** or **Outgoing Server Location** value matching one of the following values, this profile is impacted: 
     - https://outlook.office365.com/EWS/Exchange.asmx 
     - outlook.office365.com 
     - smtp.office365.com

    Use the steps provided [here](connect-exchange-online-server-profile-oauth.md) to create a new Exchange Online profile and update the mailboxes to use the new profile. Begin by testing one mailbox with the new profile before attempting to switch all mailboxes.  

   **Dynamics 365 on-premises**
   - If you only see a row with the **Email Server Type Name** value of **Exchange Online (Hybrid)**, you are using the correct profile type which uses Server to Server (S2S) Authentication instead of username/password.
   
   :::image type="content" source="media/email-configuration-active-profile-exchange-online-hybrid.png" alt-text="Email settings, Active email server profile - Exchange Online Hybrid)":::

   - If you see other Email Server Profile records that **do not** have the **Email Server Type Name** value of **Exchange Online (Hybrid)**, open each of the profiles to view the properties. If any of the profiles have an **Incoming Server Location** or **Outgoing Server Location** value matching one of the following values, this profile is impacted: 

     - https://outlook.office365.com/EWS/Exchange.asmx 
     - outlook.office365.com 
     - smtp.office365.com

   Use the steps provided [here](/dynamics365/customerengagement/on-premises/admin/connect-dynamics-365-on-premises-exchange-online?view=op-9-1) to create a new **Exchange Online (Hybrid)** profile and update the mailboxes to use the new profile. Begin by testing one mailbox with the new profile before attempting to switch all mailboxes. If you do not see the option for this type of profile, refer to the FAQ section which discusses the version requirement. 

   **Dynamics 365 Email Router**
   - If your company is using the Dynamics 365 Email Router to connect to Exchange Online, you are required to transition to using the server-side synchronization feature and use the steps provided [here](/dynamics365/customerengagement/on-premises/admin/connect-dynamics-365-on-premises-exchange-online?view=op-9-1). The Email Router was deprecated on July 17, 2018. It was previously communicated and [documented](../important-changes-coming.md?msclkid=254384a1c69a11ec9804139c37c818f7#microsoft-dynamics-365-email-router-is-deprecated) that the Email Router would no longer function starting April 12, 2021. Although the Email Router may still have worked with Dynamics 365 on-premises, this configuration is no longer supported. 

## FAQ

### What will happen when basic authentication is disabled in Exchange Online? 
Any apps configured to use basic authentication (username and password) to retrieve data from Exchange Online will quit working. For more information on the potential impact to Dynamics 365, refer to the [Impact](#impact) section of this document. 

### What if we are connecting to Exchange Online in another tenant? 
To connect Dynamics 365 Online to Exchange Online in a different tenant, see [Exchange Online cross-tenant authentication](connect-exchange-online-server-profile-oauth.md).  

### Why doesn’t our Dynamics 365 on-premises deployment include an option to create an Exchange Online (Hybrid) profile? 
Your on-premises deployment of Dynamics 365 needs to be version 8.1 (2016 SP1) or higher. If you are using an older version, you will need to upgrade to 8.1 or higher before you can create the required **Exchange Online (Hybrid)** profile. 

### See also






[!INCLUDE[footer-include](../includes/footer-banner.md)]





