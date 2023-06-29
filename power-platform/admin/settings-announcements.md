---
title: "Broadcast announcements to an entire organization  | MicrosoftDocs"
description: About broadcast announcements to an entire organization 
author: sericks007

ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/09/2021
ms.subservice: admin
ms.author: sericks 
search.audienceType: 
  - admin
---
# Broadcast announcements to an entire organization 

> [!IMPORTANT]
> Announcements are deprecated and are removed from current releases.

Circulate information quickly to a wide set of users at one go by using Announcements in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). Announcements can also serve as message boards, where you can post topics of your interest that you wish to share, or get answers to.

These settings can be found in the Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Data management** > **Announcements**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the setting.

- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

## Create an announcement

1. Select an environment and go to **Settings** > **Data management** > **Announcements**.

2. On the command bar, select **New**.

3. Fill in the information, as required. 

   - Title (required) - Type a title for the announcement that clearly and unambiguously states the purpose and nature of the announcement.
   - Body (required) - Type the text for the announcement that you want to broadcast.

   > [!TIP]
   > You can copy and paste an announcement text from another application. However, formatting might be lost.

   - More Information URL (optional) - Type the address of the website that provides detailed information about the announcement. 

   > [!NOTE]
   > A web address that does not contain "http://" is automatically expanded to a full web address. In the announcement, the web address will appear as an active external link.

   - Expiration Date (optional) - Type the date on which you want to stop the broadcast and the announcement should expire.

   > [!NOTE]
   > You can’t edit/extend this date after expiry. Customer engagement apps deletes the announcement after the expiration date.

4. When you’re done, on the command bar, choose **Save** or **Save and Close** to begin the broadcast.

## Broadcast an announcement

Make the announcements available to other users in your organization by using web resources and dashboards.

### Create a web resource

1. In a text editor, type the following code, and save the file as “announcementsondashboard.htm”.

    ```html  
    <html>
    <body>
    <script type="text/javascript">window.location.href="/home/homepage/home_news.aspx?pagemode=iframe";</script>
    </body>
    </html>
    ```  

2. Go to **Settings** > **Customizations** > **Customize the System**.

3. Under **Components**, select **Web Resources** > **New**.

4. Type the name as “announcements” and display name as “Announcements”.

5. In the **Type** drop-down list, select **Web Page (HTML)**.

6. In the **Upload File** box, choose **Browse** and select the “announcementsondashboard.htm” file that you created earlier.

7. Select **Save**.

8. Add this new web resource to any existing or new dashboard.


[!INCLUDE[footer-include](../includes/footer-banner.md)]
