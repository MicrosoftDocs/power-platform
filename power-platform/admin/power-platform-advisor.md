---
title: Use Power Platform Advisor (preview)
description: Learn about how to use Power Platform Advisor to optimize your tenant.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/28/2023
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
search.audienceType:
  - admin

---

# Use Power Platform Advisor (preview)

[This article is prerelease documentation and is subject to change.]

Power Platform Advisor is your guide to personalized, recommendations to optimize your Power Platform tenant. It analyzes all Managed Environments and the apps in these environments within your Power Platform tenant, and offers solutions to enhance security, reliability, and overall health. 

Currently, Power Platform Advisor is available for all tenant-level admin users. These include users with the Power Platform admin role, Dynamics 365 admin role, or a Global admin role within the Power Platform tenant. 

With Power Platform Advisor, administrators can: 

- Get proactive, best practice recommendations. 
- Improve the of overall health of your Power Platform tenant. 
- Take inline actions or automate actions using cloud flows. 

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

## Turn on Power Platform advisor
Power Platform Advisor is turned on, by default, for all [Managed Environments](managed-environment-overview.md) customers, however, recommendations are only available after turning on the [tenant-level analytics](tenant-level-analytics.md).

## Key capabilities

### Recommendations
Power Platform tenant admins can view the top recommendations on the Power Platform Advisor card. If the Power Platform admin center homepage is not customized, this card is automatically pinned on the homepage. Your tenant is scanned for recommendations weekly. 

:::image type="content" source="media/recommentations.png" alt-text="Get proactive, best practice recommendations.":::

If the homepage is customized or you don't see the Power Platform Advisor card or you removed the card from the homepage, you can select **+ Add cards** to add the card to the homepage. 

:::image type="content" source="media/add-cards.png" alt-text="Add the Power Platform Advisor card to the homepage.":::

The Power Platform Advisor card will show the top 4 recommendations. You can select **View details** for any of the recommendations to view the details for that recommendation. You can select the **View recommendations** button to view all the recommendations in the **Power Platform Advisor** page.
 
Power Platform Advisor can also be accessed using the **Advisor (preview)** option in the navigation pane of the Power Platform admin center. This option takes you to the **Power Platform Advisor** page, where you can view all the recommendations.
 
Admins can select a recommendation from the **Power Platform Advisor** page to view the associated details for that recommendation in the recommendation panel. In this panel, admins can learn more about the recommendation, its impact, and associated resources and details.
 
### Inline actions
For each recommendation, Power Platform Advisor presents one or more relevant actions that can be taken from the recommendation panel. Depending on the recommendation, an admin can take relevant action for a specific resource or take bulk action by selecting up to 10 resources from the recommendation panel and taking an action. For certain recommendations that require action by a non-admin user, detailed instructions will be presented. To learn more, see [recommendations](#categories-of-recommendations).

### Automated actions
In addition to the inline actions, Power Platform Advisor supports automated actions via the Power Platform Admin v2 connector. This is a very useful way to build a process for remediations. For example, instead of deleting an unused app - admin can first send an email/chat to the owner of the app informing about an impending action. If they don't receive any correspondence from the owner, the app can then be deleted.

You can learn more about the Power Platform Admin v2 connector here. [<u>Power Platform Admin v2 connector (microsoft.com)</u>](https://learn.microsoft.com/en-us/connectors/powerplatformadminv2/).

While building the cloud flows using this connector, you can get the Power Platform Advisor recommendations and actions using the below actions -

-   Get Recommendations - This returns all the valid recommendations in your tenant.

-   Get Recommendation Resources - This returns all the resources for a specific recommendation.

-   Execute Recommendation Action - This executes a specific action for a specific resource listed in a recommendation.


### Share Recommendations**:

All recommendations in Power Platform Advisor can be shared in Microsoft Teams, with other users for team collaboration.

![A screenshot of a computer Description automatically generated](media/image3.png)

An admin can share the entire recommendation or share specific rows within the recommendation to another user by entering their name in the "Share to" textbox in the sharing panel. Shared recommendations or details will be sent to the user as an adaptive card in a personal Teams chat.

 

![A screenshot of a chat Description automatically generated](media/image4.png)

 

When an entire recommendation or multiple rows within the recommendation is shared, the sharing card will provide a link to that recommendation for the admin.

When a specific app/resource is shared, the sharing card will provide a link to the recommendation as well as a link to that app in the maker portal.

 

![A screenshot of a computer Description automatically generated](media/image5.png)

 

- **Advisor summary card in Microsoft Teams**:

Once a week, Power Platform Advisor sends a summary card in Microsoft Teams highlighting the top 2 recommendations the admin should focus on for that week. This helps admins invest their time on the most important recommendations.

To get this summary card, admins should install the "Power Apps" app in Microsoft Teams.

 

![A screenshot of a computer Description automatically generated](media/image6.png)

 

Once installed, admin can view these summary cards in their Teams chats.

![A screenshot of a computer Description automatically generated](media/image7.png)

 


## Categories of Recommendations

During the public preview, the recommendations focus on **Security** and **Operational Efficiency**. You can view these recommendations by category and learn about actions to resolve issues or seize opportunities.

1. **Apps without valid owners**:

This recommendation lists apps in all the Managed Environments within your Power Platform tenant that do not have a valid owner. Currently this list contains apps that have been active in the last 90 days.

 

It is important that resources have valid owners to make necessary changes or to support the users when an issue arises, else it may pose business continuity risk.

 

![A screenshot of a computer Description automatically generated](media/image8.png)

 

**Supported actions:**  
 

**Assign to new owner:** To assign app(s) to a new owner, select one or more apps from the list of apps and click "Assign to new owner". Then enter the new owner's name in the text box below the app list and click "Assign"

 

![A screenshot of a computer Description automatically generated](media/image9.png)

 

Once assigned, you'll see a success message in the panel and the Action State column for that row will show "Completed". You cannot re-take actions for completed rows.

Please note:

-   New owner information will not be updated in the list.

-   The app will continue to be shown in the list until the next planned scan.

-   Assigning a new owner for the app doesn't automatically provide necessary permissions to the environment or the underlying data sources used in the app. Admins should separately provision the user with necessary permissions to this user.

 

![A screenshot of a computer Description automatically generated](media/image10.png)

 

**Promote co-owner to owner:**

If there are co-owners for an app, admins can use this action to promote one of the co-owners to an owner. To do this, select an app and click "Promote co-owner to owner" command. This should all co-owners for the selected app. You can select one of the co-owners and assign them as the new owner.

![A screenshot of a computer Description automatically generated](media/image11.png)

 

If you select multiple apps, Power Platform Advisor will show any shared co-owners for the selected apps. Clicking on "Assign app" will then make the selected co-owner the new owner for all the selected apps.

 

**Delete:**

To delete unwanted apps, select one or more apps from the list and click the "Delete command". Once you confirm the delete operation, the selected apps will be deleted.

![A screenshot of a computer error Description automatically generated](media/image12.png)

 

2. **Apps that are not used in last 60 days**: Detailed steps for handling apps that are not used in the last 60 days will be provided here.

This recommendation lists apps in all the Managed Environments within your Power Platform tenant that were not used in the last 60 days.

 

It is important that unused and unnecessary resources be removed periodically, to reduce the risk exposure of your resources and to maintain proper hygiene of the tenant.

![A screenshot of a computer Description automatically generated](media/image13.png)

 

**Supported actions:**  
 

**Quarantine:** To quarantine unused apps, select one or more apps from the list and click the "Quarantine" command. Once you confirm the quarantine operation, the selected apps will be quarantined. Once quarantined, you can make them active again using the Set-AppAsUnquarantined PowerShell command ([<u>https://learn.microsoft.com/en-us/power-platform/guidance/adoption/manage-default-environment\#quarantine-apps</u>](https://learn.microsoft.com/en-us/power-platform/guidance/adoption/manage-default-environment#quarantine-apps))

![A screenshot of a computer error message Description automatically generated](media/image14.png)

 

**Delete:**

To delete unwanted apps, select one or more apps from the list and click the "Delete" command. Once you confirm the delete operation, the selected apps will be deleted.

![A screenshot of a computer error Description automatically generated](media/image12.png)

 

 

3. **Apps that are shared with Everyone**:

This recommendation lists apps in all the Managed Environments within your Power Platform tenant that are actively used and are shared with 'Everyone'. 'Everyone' includes any guest users in your Microsoft Entra tenant.

 

It is important that only those apps that are required for the entire organization are shared with 'Everyone'. Oversharing apps beyond the intended users poses a significant security risk as it increases the risk exposure of your assets and could lead to potential misuse. It is important to periodically review the apps that are overshared and adjust the sharing permissions.

 

![A screenshot of a computer Description automatically generated](media/image15.png)

 

 

4. **Apps that are not part of a solution**:

This recommendation lists apps in all the Managed Environments within your Power Platform tenant that are actively used but is not part of a solution. An app not being part of a solution means that the app was developed in the same environment as it's being used.

 

It is important that apps follow Application Lifecycle Management (ALM) best practices while developing your important apps. Not following a proper ALM process could result in a single change breaking the app for several users without an easy way to recover. The new pipelines feature makes it very simple for citizen developers without prior ALM experience to safely deploy their apps and dependent assets to a production environment.

 

![A screenshot of a computer Description automatically generated](media/image16.png)

 

