---
title: "Connector classification  | MicrosoftDocs"
description: About ways to categorize connectors within a DLP policy.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/03/2021
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Connector classification

Data groups are a simple way to categorize connectors within a data loss prevention (DLP) policy. The three data groups available are the **Business** data group, the **Non-Business** data group, and the **Blocked** data group. 

A good way to categorize connectors is to place them in groups based on the business-centered or personal-use-centered services that they connect to in the context of your organization. Connectors that host business-use data should be classified as **Business**, and connectors that host personal-use data should be classified as **Non-Business**. Any connectors that you want to keep from being used at all across one or more environments should be classified as **Blocked**.

When a new policy is created, by default all connectors are placed in the **Non-Business** group. From there they can be moved to **Business** or **Blocked** based on your preference. You manage the connectors in a data group when you create or modify the properties of a DLP policy from the admin center. See [Create a data loss prevention (DLP) policy](create-dlp-policy.md). You can also change the initial classification of connectors by editing your DLP policy. More information: [Edit a DLP policy](prevent-data-loss.md#edit-a-dlp-policy)

> [!NOTE]
> Until recently, some HTTP connectors weren't readily available for DLP policy configuration by using the DLP policy UI or PowerShell. As of May 2020, the following HTTP connectors can now be classified by using the DLP policy UI and PowerShell, like any other Power Platform connector: **HTTP**, **HTTP Webhook**, and **When a HTTP request is received**. If legacy DLP policies are being updated by using the new DLP UI, a warning message will be displayed to admins indicating that these three HTTP connectors are now being added to the DLP purview and that they should ensure that these connectors are placed in the right DLP grouping.
>
> Because child flows share an internal dependency with the HTTP connector, the grouping that admins choose for HTTP connectors in a DLP policy might affect the ability to run child flows in that environment or tenant. Make sure your HTTP connectors are classified in the appropriate group for your child flows to function. If there are any concerns in classifying the connector as **Business** in shared environments such as the default environment, our advice is to classify it as **Non-Business** or to block it. Then, create dedicated environments where makers can use HTTP connectors, but restrict the maker list so that you can unblock makers from building child flows.
>
> The **Content Conversion** connector is an integral feature of Microsoft Power Platform, used to convert an HTML document to plain text. It applies both to **Business** and **Non-Business** scenarios and doesn't store any data context of the content converted through it; therefore, it's not available for classification through DLP policies.

## How data is shared among data groups

Data can't be shared among connectors that are located in different groups. For example, if you place SharePoint and Salesforce connectors in the **Business** group and you place Gmail in the **Non-Business** group, makers can't create an app or flow that uses both the SharePoint and Gmail connectors. This in turn restricts data flows between these two services in Microsoft Power Platform.

Although data can't be shared among services in different groups, it can be shared among services within a specific group. From the earlier example, because SharePoint and Salesforce were placed in the same data group, makers can create an app or flow that uses both SharePoint and Salesforce connectors together. This in turn allows data flows between these two services in Microsoft Power Platform.

The key point is that connectors in the same group can share data in Microsoft Power Platform, whereas connectors in different groups can't share data.

## The effect of the Blocked data group

Data flow to a specific service can be blocked altogether by marking that connector as **Blocked**. For example, if you place Facebook in the **Blocked** group, makers can't create an app or flow that uses the Facebook connector. This in turn restricts data flows to this service in Microsoft Power Platform. 

All third-party connectors can be blocked. All Microsoft-owned premium connectors (except Microsoft Dataverse) can be blocked.

## List of connectors that can't be blocked

All connectors driving core Microsoft Power Platform functionality (like Dataverse, Approvals, and Notifications), in addition to connectors that enable core Office customization scenarios like Microsoft Enterprise Plan standard connectors, will remain non-blockable to ensure that core user scenarios remain fully functional.

However, these non-blockable connectors can be classified into **Business** or **Non-Business** data groups. These connectors broadly fall into the following categories:

- Microsoft Enterprise Plan standard connectors (with no additional licensing implications).
- Microsoft Power Platform–specific connectors that are part of the base platform capabilities. Within this, Dataverse connectors are the only premium connectors that can't be blocked, because Dataverse is an integral part of Microsoft Power Platform. 

The following connectors can't be blocked by using DLP policies.


|Microsoft Enterprise Plan standard connectors | Core Power Platform connectors  |
|---------|---------|
|Cloud App Security      | Approvals        |
|Dynamics 365 Customer Voice      | Notifications        |
|Excel Online (Business)     | Dataverse       |
|Kaizala       | Dataverse (current environment)        |
|Microsoft 365 Groups      | Power Apps Notifications (v1 and v2)        |
|Microsoft 365 Groups Mail (Preview)      |         |
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
> If a currently unblockable connector is already in the **Blocked** group (for example, because it was blocked when restrictions were different), it will remain in the same group until you edit the policy. You'll get an error message stopping you from saving the policy until you move the unblockable connector to a **Business** or **Non-Business** group.

## Custom connector classification

### Environment-level DLP policies 

Environment admins can now find all the custom connectors in their environments alongside pre-built connectors on the **Connectors** page in **Data Policies**. Similar to pre-built connectors, you can classify custom connectors into **Blocked**, **Business**, or **Non-Business** categories. Custom connectors that aren't explicitly classified will be put under the default group (or **Non-Business**, if no default group setting is explicitly chosen by admins). 

:::image type="content" source="media/dlp-environment-level-connector.png" alt-text="Environment admins can now see all custom connectors in their environments alongside of pre-built connectors on the **Connectors** page in data policies.":::

You can also use DLP policy PowerShell commands to set custom connectors into **Business**, **Non-Business**, and **Blocked** groups. More information: [Data loss prevention (DLP) policy commands](powerapps-powershell.md#data-loss-prevention-dlp-policy-commands)

### Tenant-level DLP policies 

The Power Platform admin center also has support for tenant admins to classify custom connectors by their Host URL endpoints by using a pattern-matching construct for tenant-level DLP policies. Because the scope of custom connectors is environment-specific, these connectors won't show up on the **Connectors** page for you to classify. Instead, you'll see a new page in **Data Policies** named **Custom connectors**, which you can use to specify an ordered list of Allow and Deny URL patterns for custom connectors.  

The rule for the wildcard character (`*`) will always be the last entry in the list, which applies to all custom connectors. Admins can tag the `*` pattern to **Blocked**, **Business**, **Non-business**, or **Ignore**. By default, the pattern is set as **Ignore** for new DLP policies. 

**Ignore** ignores DLP classification for all connectors in this tenant-level policy, and defers evaluation of a pattern to other environments or tenant-level policies to attribute them into the **Business**, **Non-Business**, or **Blocked** grouping as appropriate. If no specific rule exists for the custom connectors, an **Ignore \*** rule will allow custom connectors to be used with both **Business** and **Non-Business** connector groupings. Except for the last entry in the list, **Ignore** as an action isn't supported for any other URL pattern added to the custom connector pattern rules. 

:::image type="content" source="media/dlp-tenant-level-connector-ignore-rule.png" alt-text="The Ignore rule in a list of rules.":::

You can further add new rules by selecting **Add connector pattern** on the **Custom Connectors** page.  

:::image type="content" source="media/dlp-select-add-connector-pattern.png" alt-text="Select Add connector pattern.":::

This opens a side panel where you can add custom connector URL patterns and classify them. New rules are added to the end of the pattern list (as the second-to-the-last rule, because `*` will always be the last entry in the list). However, you can update the order while adding a new pattern. 

:::image type="content" source="media/dlp-add-custom-connector-url-patterns.png" alt-text="Add custom connector URL patterns and classify them.":::

You can also update the order of the patterns by using the **Order** dropdown list or selecting **Move up** or **Move down**. 

:::image type="content" source="media/dlp-update-pattern-order.png" alt-text="Update the order of the patterns by using the Order dropdown list or Move up and Move down.":::

After a pattern has been added, you can edit or delete these patterns by selecting a specific row and selecting **Edit** or **Delete**. 

:::image type="content" source="media/dlp-edit-delete-pattern.png" alt-text="Edit or delete custom patterns.":::

## Default data group for new connectors

One data group must be designated as the default group to automatically classify any new connectors added to Microsoft Power Platform after your policy has been created. Initially, the **Non-Business** group is the default group for new connectors and all services. You can [change the default data group](prevent-data-loss.md#change-the-default-data-group) to the **Business** or **Blocked** data group, but we don't recommend that you do so.

Any new services that are added to apps will be placed in the designated default group. For this reason, we recommend that you keep **Non-Business** as the default group, and manually add services into the **Business** or **Blocked** group after your organization has evaluated the impact of allowing business data to be shared with the new service.

> [!NOTE]
> Microsoft 365 Enterprise license connectors and a few core Microsoft Power Platform connectors are exempt from being marked as **Blocked**, and can only be classified as **Business** or **Non-Business**. If Microsoft adds any new connectors that can't be blocked and you've set the default group for the DLP policy as **Blocked**, these connectors will be automatically marked as **Non-Business** instead of **Blocked**.





[!INCLUDE[footer-include](../includes/footer-banner.md)]
