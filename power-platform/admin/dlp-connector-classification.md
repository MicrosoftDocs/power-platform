---
title: Connector classification 
description: About ways to categorize connectors within a data policy.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 08/12/2025
ms.subservice: admin
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
contributors:
  - laneswenka 
  - mikferland-msft
  - mihaelablendea
  - kavehkazms 
ms.custom: "admin-security"
search.audienceType: 
  - admin
---

# Connector classification

Data groups are a simple way to categorize connectors within a data policy. The three data groups available are the **Business** data group, the **Non-Business** data group, and the **Blocked** data group. 

A good way to categorize connectors is to place them in groups based on the business-centered or personal-use-centered services that they connect to in the context of your organization. Connectors that host business-use data should be classified as **Business**, and connectors that host personal-use data should be classified as **Non-Business**. Any connectors that you want to keep from being used at all across one or more environments should be classified as **Blocked**.

When a new policy is created, by default all connectors are placed in the **Non-Business** group. From there they can be moved to **Business** or **Blocked** based on your preference. You manage the connectors in a data group when you create or modify the properties of a data policy from the admin center. See [Manage data policies](prevent-data-loss.md). You can also change the initial classification of connectors by editing your data policy. More information: [Edit a data policy](prevent-data-loss.md#edit-a-data-policy)

> [!NOTE]
> Until recently, some HTTP connectors weren't readily available for data policy configuration by using the data policy UI or PowerShell. As of May 2020, the following HTTP connectors can now be classified by using the data policy UI and PowerShell, like any other Power Platform connector: **HTTP**, **HTTP Webhook**, and **When an HTTP request is received**. If legacy data policies are being updated by using the new data policy UI, a warning message is displayed to admins indicating that these three HTTP connectors are now being added to the data policies purview and that they should ensure that these connectors are placed in the right data policies grouping.
>
> Because child flows share an internal dependency with the HTTP connector, the grouping that admins choose for HTTP connectors in a data policy might affect the ability to run child flows in that environment or tenant. Make sure your HTTP connectors are classified in the appropriate group for your child flows to function. If there are any concerns in classifying the connector as **Business** in shared environments such as the default environment, our advice is to classify it as **Non-Business** or to block it. Then, create dedicated environments where makers can use HTTP connectors, but restrict the maker list so that you can unblock makers from building child flows.
>
> The **Content Conversion** connector is an integral feature of Microsoft Power Platform, used to convert an HTML document to plain text. It applies both to **Business** and **Non-Business** scenarios and doesn't store any data context of the content converted through it; therefore, it's not available for classification through data policies.

## How data is shared among data groups

Data can't be shared among connectors that are located in different groups. For example, if you place SharePoint and Salesforce connectors in the **Business** group and you place Gmail in the **Non-Business** group, makers can't create an app or flow that uses both the SharePoint and Gmail connectors. This in turn restricts data flows between these two services in Microsoft Power Platform.

Although data can't be shared among services in different groups, it can be shared among services within a specific group. From the earlier example, because SharePoint and Salesforce were placed in the same data group, makers can create an app or flow that uses both SharePoint and Salesforce connectors together. This in turn allows data flows between these two services in Microsoft Power Platform.

The key point is that connectors in the same group can share data in Microsoft Power Platform, whereas connectors in different groups can't share data.

## The effect of the Blocked data group

Data flow to a specific service can be blocked altogether by marking that connector as **Blocked**. For example, if you place Facebook in the **Blocked** group, makers can't create an app or flow that uses the Facebook connector. This in turn restricts data flows to this service in Microsoft Power Platform. 

All third-party connectors can be blocked. All Microsoft-owned premium connectors (except Microsoft Dataverse) can be blocked.

## List of connectors that can't be blocked

All connectors driving core Microsoft Power Platform functionality (like Dataverse, Approvals, and Notifications), in addition to connectors that enable core Office customization scenarios like Microsoft Enterprise Plan standard connectors, remain nonblockable to ensure that core user scenarios remain fully functional.

> [!NOTE]
> These connectors can be limited or blocked using [advanced connector policies](./advanced-connector-policies.md).

However, these nonblockable connectors can be classified into **Business** or **Non-Business** data groups. These connectors broadly fall into the following categories:

- Microsoft Enterprise Plan standard connectors (with no other licensing implications).
- Microsoft Power Platform–specific connectors that are part of the base platform capabilities. Within this, Dataverse connectors are the only premium connectors that can't be blocked because Dataverse is an integral part of Microsoft Power Platform. 

The following connectors can't be blocked by using data policies.


|Microsoft Enterprise Plan standard connectors | Core Power Platform connectors  |
|---------|---------|
|Defender for Cloud Apps      | [Approvals](/connectors/approvals/)        |
|Dynamics 365 Customer Voice      | [Notifications](/connectors/flowpush/)        |
|Excel Online (Business)     | [Dataverse (legacy)](/connectors/commondataservice/)       |
|Kaizala       | [Dataverse](/connectors/commondataserviceforapps/)        |
|Microsoft 365 Groups      | Power Apps Notifications ([v1](/connectors/powerappsnotification/) and [v2](/connectors/powerappsnotificationv2/))        |
|Microsoft 365 Groups Mail (Preview)      | [Microsoft Copilot Studio](/connectors/powervirtualagents/)        |
|Microsoft 365 Outlook      |         |
|Microsoft 365 Users      |         |
|Microsoft Teams       |      |
|Microsoft To-Do (Business)      |     |
|OneDrive for Business      |         |
|OneNote (Business)      |         |
|Planner     |         |
|Power BI      |         |
|SharePoint     |         |
|Shifts     |         |
|Skype for Business Online      |         |
|Yammer      |         |

> [!NOTE]
> If a currently unblockable connector is already in the **Blocked** group (for example, because it was blocked when restrictions were different), it remains in the same group until you edit the policy. You get an error message stopping you from saving the policy until you move the unblockable connector to a **Business** or **Non-Business** group.

## Viewing the classification of connectors

When editing data policies in the Power Platform admin center, all available and visible connectors are shown, regardless of whether they have been classified in a policy. However, when viewing a data policy in PowerShell or through the Power Platform for Admins connector, you see only the connectors that have been explicitly classified in the Business, Non-business, or Blocked categories. data policies viewed from PowerShell or the Power Platform for Admins connector may include stale references to connectors that are no longer available or visible.

In general, the list of Power Platform connectors can differ depending on where you're viewing them, and there are several reasons for this. Some connectors may require specific licensing, and if your license doesn't include them, they're not visible. Different environments can also have different connectors available due to compliance and regulatory requirements. Microsoft may release updates to connectors, which may not be immediately available across all Power Platform components. Some connectors may only be available in Power Automate and not in Power Apps. Depending on your role and permissions, you may not have access to all connectors.

## Custom connector classification

### Environment-level data policies 

Environment admins can now find all the custom connectors in their environments alongside prebuilt connectors on the **Connectors** page in **Data Policies**. Similar to prebuilt connectors, you can classify custom connectors into **Blocked**, **Business**, or **Non-Business** categories. Custom connectors that aren't explicitly classified will be put under the default group (or **Non-Business**, if no default group setting is explicitly chosen by admins). 

:::image type="content" source="media/dlp-environment-level-connector.png" alt-text="Environment admins can now see all custom connectors in their environments alongside of prebuilt connectors on the **Connectors** page in data policies.":::

You can also use data policy PowerShell commands to set custom connectors into **Business**, **Non-Business**, and **Blocked** groups. More information: [Data policy commands](powerapps-powershell.md#data-loss-prevention-dlp-policy-commands)

### Tenant-level data policies 

The Power Platform admin center also has support for tenant admins to classify custom connectors by their Host URL endpoints by using a pattern-matching construct for tenant-level data policies. Because the scope of custom connectors is environment-specific, these connectors don't show up on the **Connectors** page for you to classify. Instead, you see a new page in **Data Policies** named **Custom connectors**, which you can use to specify an ordered list of Allow and Deny URL patterns for custom connectors.  

The rule for the wildcard character (`*`) is the last entry in the list, which applies to all custom connectors. Admins can tag the `*` pattern to **Blocked**, **Business**, **Non-business**, or **Ignore**. By default, the pattern is set as **Ignore** for new data policies. 

**Ignore** ignores data polciy classification for all connectors in this tenant-level policy, and defers evaluation of a pattern to other environments or tenant-level policies to attribute them into the **Business**, **Non-Business**, or **Blocked** grouping as appropriate. If no specific rule exists for the custom connectors, an **Ignore \*** rule allows custom connectors to be used with both **Business** and **Non-Business** connector groupings. Except for the last entry in the list, **Ignore** as an action isn't supported for any other URL pattern added to the custom connector pattern rules. 

:::image type="content" source="media/dlp-tenant-level-connector-ignore-rule.png" alt-text="The Ignore rule in a list of rules.":::

You can further add new rules by selecting **Add connector pattern** on the **Custom Connectors** page.  

:::image type="content" source="media/dlp-select-add-connector-pattern.png" alt-text="Select Add connector pattern.":::

This opens a side panel where you can add custom connector URL patterns and classify them. New rules are added to the end of the pattern list (as the second-to-the-last rule, because `*` is the last entry in the list). However, you can update the order while adding a new pattern. 

:::image type="content" source="media/dlp-add-custom-connector-url-patterns.png" alt-text="Add custom connector URL patterns and classify them.":::

You can also update the order of the patterns by using the **Order** dropdown list or selecting **Move up** or **Move down**. 

:::image type="content" source="media/dlp-update-pattern-order.png" alt-text="Update the order of the patterns by using the Order dropdown list or Move up and Move down.":::

After a pattern has been added, you can edit or delete these patterns by selecting a specific row and selecting **Edit** or **Delete**. 

:::image type="content" source="media/dlp-edit-delete-pattern.png" alt-text="Edit or delete custom patterns.":::

## Default data group for new connectors

One data group must be designated as the default group to automatically classify any new connectors added to Microsoft Power Platform after your policy has been created. Initially, the **Non-Business** group is the default group for new connectors and all services. You can [change the default data group](prevent-data-loss.md#change-the-default-data-group) to the **Business** or **Blocked** data group, but we don't recommend that you do so.

Any new services that are added to apps are placed in the designated default group. For this reason, we recommend that you keep **Non-Business** as the default group, and manually add services into the **Business** or **Blocked** group after your organization has evaluated the impact of allowing business data to be shared with the new service.

> [!NOTE]
> Microsoft 365 Enterprise license connectors and a few core Microsoft Power Platform connectors are exempt from being marked as **Blocked**, and can only be classified as **Business** or **Non-Business**. If Microsoft adds any new connectors that can't be blocked and you've set the default group for the data policy as **Blocked**, these connectors will be automatically marked as **Non-Business** instead of **Blocked**.

## Related information

- [Power Platform data policies](/power-platform/admin/wp-data-loss-prevention)
- [Data policies for Power Automate](/power-automate/prevent-data-loss)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
