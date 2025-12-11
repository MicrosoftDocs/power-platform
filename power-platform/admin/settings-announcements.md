---
title: "Broadcast announcements to an entire organization  | MicrosoftDocs"
description: About broadcast announcements to an entire organization 
author: sericks007

ms.component: pa-admin
ms.topic: how-to
ms.date: 11/25/2025
ms.subservice: admin
ms.author: sericks 
search.audienceType: 
  - admin
---
# Broadcast announcements to an entire organization

> [!IMPORTANT]
> Announcements are deprecated and removed from current releases.

Use announcements in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) to quickly share information with a wide set of users. Announcements can also serve as message boards where you can post topics of interest that you want to share or get answers to.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. Select an environment.
1. Go to **Settings** > **Data management** > **Announcements**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the setting.

- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- If you don't have the correct permissions, contact your system administrator.

## Create an announcement

1. Select an environment and go to **Settings** > **Data management** > **Announcements**.
1. On the command bar, select **New**.
1. Fill in the information, as required.

   - Title (required) - Type a title for the announcement that clearly and unambiguously states the purpose and nature of the announcement.
   - Body (required) - Type the text for the announcement that you want to broadcast.

   > [!TIP]
   > You can copy and paste an announcement text from another application. However, formatting might be lost.

   - More Information URL (optional) - Type the address of the website that provides detailed information about the announcement.

   > [!NOTE]
   > A web address that doesn't contain *http://* is automatically expanded to a full web address. In the announcement, the web address appears as an active external link.

   - Expiration Date (optional) - Type the date on which you want to stop the broadcast and the announcement should expire.

   > [!NOTE]
   > You can't edit or extend this date after expiry. Customer engagement apps delete the announcement after the expiration date.

1. When you're done, on the command bar, choose **Save** or **Save and Close** to begin the broadcast.

## Broadcast an announcement

Make the announcements available to other users in your organization by using web resources and dashboards.

### Create a web resource

1. In a text editor, type the following code, and save the file as `announcementsondashboard.htm`.

    ```html  
    <html>
    <body>
    <script type="text/javascript">window.location.href="/home/homepage/home_news.aspx?pagemode=iframe";</script>
    </body>
    </html>
    ```  

1. Go to **Settings** > **Customizations** > **Customize the System**.
1. Under **Components**, select **Web Resources** > **New**.
1. Type the name as `announcements` and display name as **Announcements**.
1. In the **Type** drop-down list, select **Web Page (HTML)**.
1. In the **Upload File** box, choose **Browse** and select the `announcementsondashboard.htm` file that you created earlier.
1. Select **Save**.
1. Add this new web resource to any existing or new dashboard.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
