---
title: Edit properties of an environment
description: Learn how to edit the properties of an environment in Power Platform admin center, including URL, friendly name, type, and security group.
author: LaurentPepin 
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/11/2024
ms.subservice: admin
ms.author: lapepin
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - jordanchodakWork
---

# Edit properties of an environment 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Administrators can edit properties of an environment, such as the friendly name, URL, and the purpose. However, environments that are being provisioned cannot be edited, and disabled environments must be enabled before they can be edited.  
  
## Edit an environment  
  
1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in using administrator credentials.

2. From the left-side menu, select **Environments**, and then select an environment.

3. Select **Edit**.

   > [!div class="mx-imgBorder"] 
   > ![Select Edit.](media/select-edit.png "Select Edit")

4. Select any of the following field values that you want to change.  
  
   - **Name:** This is typically the name of your organization and is displayed in the customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). After you save the change, it may take up to 5 minutes for the friendly name to appear in the application.  
  
   - **URL:** The URL is used to construct the URL for users to sign in to customer engagement apps. We recommend that you limit the length of the URL name to reduce the overall length of the URL.  

     > [!IMPORTANT]
     > After the updated URL has successfully been applied, Power Automate flows in the environment are turned off. You must fix the connections and turn the Power Automate flows back on again. If Power Automate flows are using [connection references](/power-apps/maker/data-platform/create-connection-reference), make sure they're associated to the new connections, if new ones are created.
  
     > [!IMPORTANT]
     > After the updated URL has successfully been applied, all Power Apps model-driven apps that have been embedded as a personal app in Teams and added to a Teams tab, must be deleted and readded.  Follow the documentation to [embed a model-driven app as a tab in Teams](/power-apps/teams/embed-model-driven-teams-tab) and [embed a model-driven app as personal app in Teams](/power-apps/teams/embed-model-driven-teams-personal).
       
     > [!WARNING]
     > For up to 24-48 hours after you have updated the URL, you will not be able to open or edit Power Automate flows in the environment that have connections to Dataverse. You will see the error "It looks like something went wrong." while the edit flow page is pointing to the old environment URL. The flows will still run in the background and can be turned on or off via Solutions.
     > 
     >  There are important tasks that you must communicate to your users immediately following a URL name change.  
     > 
     > - For users of the web application, send information that includes the new URL with instructions about how to bookmark it.  
     > - For users of Dynamics 365 for Outlook, the following two tasks must be completed in the order specified here:  
     > 
     >   1. **Synchronize offline data**. Dynamics 365 for Outlook users connected to this environment who work offline must synchronize by using the previous URL. If you run the Configuration Wizard and change the URL before completing this step, offline data may be lost.  
     >   2. **Run the Configuration Wizard**. After a URL name change is saved and any offline data is synchronized, users of Dynamics 365 for Outlook must run the Configuration Wizard to update the URL.  
  
        After a URL name change is saved, all users who access that environment must be notified of the change. For 24 hours after the change, users will be able to access the environment using the most recent, previous URL. No other environment will be able to use the most recent URL. After the 24-hour period has passed, users won't be able to access the environment using the most recent, previous URL. Other environments will be able to use the most recent URL.
  
        If the URL name is changed more than once during a 24-hour period, the original URL is released and cannot be used to access the environment anymore. For example, consider the following situation:  
  
     - The original URL of environment A: **domain01.crm.dynamics.com**
        - Most recent, previous URL: NULL
        - Active URL: **domain01.crm.dynamics.com**
  
     - The URL of environment A is changed to: **domain02.crm.dynamics.com**
       - At this point, users can still use **domain01.crm.dynamics.com** to access the environment for a period of 24 hours; however, they should now use the **domain02.crm.dynamics.com** URL. Note that during this 24-hour period, no other environment can use the domain **domain01.crm.dynamics.com**.
       - Most recent, previous URL: **domain01.crm.dynamics.com** (usable for 24 more hours)
       - Active URL: **domain02.crm.dynamics.com**
  
     - The URL of environment A is changed to: **domain03.crm.dynamics.com**
       - At this point, users can still use **domain02.crm.dynamics.com** to access the environment for a period of 24 hours; however, they should now use the **domain03.crm.dynamics.com** URL. Users can no longer use **domain01.crm.dynamics.com** to access the environment, since this is not the most recent, previous URL. The URL **domain01.crm.dynamics.com** is now available for use by any other environment.
       - Most recent, previous URL: **domain02.crm.dynamics.com** (usable for 24 more hours)
       - Active URL: **domain03.crm.dynamics.com**

     - The URL of environment B is changed to: **domain01.crm.dynamics.com**
       - This is possible because the URL of environment A was changed twice in a row, effectively removing **domain01.crm.dynamics.com** from environment A's most recent, previous URL, and therefore making it available for use by any other environment.

   - **Type:** Change the environment type from production to sandbox or sandbox to production.

   - **Purpose:** Specify the purpose of the environment. 
  
   - **Edit Security group:** This value is used to determine the security group that includes the users who will have access to this environment. See [Control user access to environments: security groups and licenses](control-user-access.md).
  
     > [!IMPORTANT]
     >  If you do not specify a security group, all users who have a license will be added to this environment.  
  
5. Select **Save**.  
  
### See also
[Control user access to environments: security groups and licenses](control-user-access.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
