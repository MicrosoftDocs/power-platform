---
title: "Edit properties of an environment  | MicrosoftDocs"
description: Edit properties of an environment 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/04/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Edit properties of an environment 

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

Administrators can edit properties of an environment, such as the friendly name, URL, and the purpose. However, environments that are being provisioned cannot be edited, and disabled environments must be enabled before they can be edited.  
  
## Edit an environment  
  
1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in using administrator credentials.

2. From the left-side menu, select **Environments**, and then select an environment.

3. Select **Edit**.

   > [!div class="mx-imgBorder"] 
   > ![Select Edit](media/select-edit.png "Select Edit")

4. Select any of the following field values that you want to change.  
  
   - **Name**. This is typically the name of your organization and is displayed in the customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). After you save the change, it may take up to 5 minutes for the friendly name to appear in the application.  
  
   - **URL**. The URL is used to construct the URL for users to sign in to customer engagement apps. We recommend that you limit the length of the URL name to reduce the overall length of the URL.  
  
     > [!WARNING]
     >  There are important tasks that you must communicate to your users immediately following a URL name change.  
     > 
     > - For users of the web application, send information that includes the new URL with instructions about how to bookmark it.  
     > - For users of Dynamics 365 for Outlook, the following two tasks must be completed in the order specified here:  
     > 
     >   1. **Synchronize offline data**. Dynamics 365 for Outlook users connected to this environment who work offline must synchronize by using the previous URL. If you run the Configuration Wizard and change the URL before completing this step, offline data may be lost.  
     >   2. **Run the Configuration Wizard**. After a URL name change is saved and any offline data is synchronized, users of Dynamics 365 for Outlook must run the Configuration Wizard to update the URL.  
  
        After a URL name change is saved, all users who access that environment must be notified of the change. Users will be able to access the environment for up to 24 hours by using the previous URL. After the 24-hour period has passed, the previous URL will not work.  
  
        Notice that interim URL names are discarded when there are multiple changes within 24 hours. For example, consider the following situation:  
  
     - The original URL of your environment is *fourthcoffeesales.crm.dynamics.com*.  
  
     - Using the environment picker, you change the URL name from *fourthcoffeesales.crm.dynamics.com* to *fourthcoffeemktg.crm.dynamics.com*.  
  
     - Within 24 hours of the URL name change, you change the URL name again, this time from *fourthcoffeemktg.crm.dynamics.com* to *fourthcoffeesalesandmktg.crm.dynamics.com*.  
  
       In this situation, the first URL name change to *fourthcoffeemktg.crm.dynamics.com* will be immediately removed from the system. The new URL, *fourthcoffeesalesandmktg.crm.dynamics.com*, will become active. Additionally, the original URL, *fourthcoffeesales.crm.dynamics.com*, will be active for up to 24 hours.  
  
   - **Type**. Change the environment type from production to sandbox or sandbox to production.

   - **Purpose**. Specify the purpose of the environment. 
  
   - **Edit Security group**. This value is used to determine the security group that includes the users who will have access to this environment. See [Control user access to environments: security groups and licenses](control-user-access.md).
  
     > [!IMPORTANT]
     >  If you do not specify a security group, all users who have a license will be added to this environment.  
  
5. Select **Save**.  
  
### See also
[Control user access to environments: security groups and licenses](control-user-access.md)