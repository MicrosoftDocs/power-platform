---
title: Manage data policies
description: Learn how to create, edit, and delete data policies, including the default data group for new connectors.
ms.component: pa-admin
ms.topic: how-to
ms.date: 07/24/2024
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
contributors:
  - mikferland-msft
  - mihaelablendea
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
ms.contributors:
 - jopanchal
 - amijh
---

# Manage data policies

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

An organization's data is critical to its success. Its data needs to be readily available for decision making, but the data needs to be protected so that it isn't shared with audiences who shouldn't have access to it. To protect this data, you can use Power Apps to create and enforce data policies that define the consumer connectors that specific business data can be shared with. For example, an organization that uses Power Apps might not want the business data that's stored in SharePoint to be automatically published to its Twitter feed.

To create, edit, or delete data policies, you must have either Environment Admin or Power Platform admin permissions. 

## Prerequisites

### Tenant-level policies 

Tenant-level policies can be defined to include or exclude specific environments. To follow the steps described in this article for tenant-level policies, log in as a user with the Power Platform Administrator role. Learn more about the Power Platform Administrator role at [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md).

### Environment-level policies

To follow the steps for environment-level policies, you need to have Power Apps Environment Admin permissions. For environments with a Dataverse database, you need to be assigned the System Administrator role instead. 

> [!NOTE] 
> If using the **SingleEnvironment** EnvironmentType parameter when using PowerShell to create a data policy, the user account used to create the policy **MUST** have **Environment-level** and **MUST NOT** have **Tenant-level** permissions as described above, or a Bad Request error is returned and the policy isn't created.

## The data policy process

To create a data policy, complete the following steps.

1. Assign the policy a name.
2. Classify connectors.
3. Define the scope of the policy. This step doesn't apply to environment-level policies.
4. Select environments.
5. Review settings.

These steps are explained in the following section.

## Walkthrough: Create a data policy

Use this example walkthrough to create a tenant-level data policy. In this walkthrough, you complete the following tasks:

- Add SharePoint and Salesforce to the **Business** data group of a data policy.
- Add Facebook and Twitter to the **Blocked** data group.
- Leave the remaining connectors in the **Non-Business** data group.
- Exclude test environments from the scope of this policy and apply the policy to the remaining environments, such as the default environment and production environments in the tenant.

After this policy is saved, any Power Apps or Power Automate maker, who is part of the data policy's environment, can create an app or a flow that shares data between SharePoint or Salesforce. Any Power Apps or Power Automate resource that includes an existing connection with a connector in the **Non-business** data group, isn't allowed to establish connections with SharePoint or Salesforce connectors. These makers can't add Facebook or Twitter connectors to any Power Apps or Power Automate resource.

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select **Policies** > **Data policies** > **New policy**.

    If no policies exist in the tenant, you'll see the following page.
   
    :::image type="content" source="media/dlp-view-no-policies.png" alt-text="No policies view":::

1. Enter a policy name, and then select **Next**.

1. Review the various attributes and settings you can make on the **Assign Connectors** page. 

   :::image type="content" source="media/dlp-assign-connectors.png" alt-text="Assign connectors":::

   **Attributes** <br /><br />

   <table width="100%">
   <tr>
   <th>Attribute</th>
   <th>Description</th>
   </tr>
   <tr>
   <td width="20%"> Name</td>
   <td width="80%"> The name of the connector. </td>
   </tr>
   <tr>
   <td width="20%"> Blockable</td>
   <td width="80%"> Connectors that can be blocked. Learn more: <a href="dlp-connector-classification.md#list-of-connectors-that-cant-be-blocked">List of connectors that can't be blocked</a>  </td> 
   </tr>
   <tr> 
   <td width="20%"> Type</td>
   <td width="80%"> Whether connector usage requires a Premium license or is it included in the base/Standard license for Power Platform.    </td>
   </tr>
   <tr>
   <td width="20%"> Publisher</td>
   <td width="80%">  The company that publishes the connector. This value can be different from the service owner. For example, Microsoft can be the publisher of the Salesforce connector, but the underlying service is owned by Salesforce, not Microsoft.  </td>
   </tr>
   <tr>
   <td width="20%"> About</td>
   <td width="80%"> Select the URL for more information about the connector. </td>
   </tr>
   </table>

   **Lists** <br /><br />

   <table width="100%">
   <tr>
   <th>Pivot</th>
   <th>Description</th>
   </tr>
   <tr>
   <td width="20%"> Business  </td>
   <td width="80%"> Connectors for business-sensitive data. Connectors in this group can't share data with connectors in other groups.  </td>
   </tr>
   <tr>
   <td width="20%"> Non-Business/<br />Default </td>
   <td width="80%"> Connectors for non-business data, such as personal use data. Connectors in this group can't share data with connectors in other groups. </td>
   </tr>
   <tr>
   <td width="20%"> Blocked     </td>
   <td width="80%"> Blocked connectors can't be used where this policy is applied.    </td>
   </tr>
   </table>

   **Actions** <br /><br />  

   <table width="100%">
   <tr>
   <th>Action</th>
   <th>Description</th>
   </tr>
   <tr>
   <td width="20%"> Set default group </td>
   <td width="80%"> The group that maps any new connectors added by Power Platform <i>after</i> your data policy is created. Learn more: <a href="dlp-connector-classification.md#list-of-connectors-that-cant-be-blocked">Default data group for new connectors</a>      </td>
   </tr>
   <tr>
   <td width="20%"> Search Connectors </td>
   <td width="80%"> Search a long list of connectors to find specific connectors to classify. You can search on any field in the connector list view, such as <b>Name</b>, <b>Blockable</b>, <b>Type</b>, or <b>Publisher</b>.    </td>
   </tr>
   </table>


   You can take the following actions:

   :::image type="content" source="media/dlp-assign-connectors-actions.png" alt-text="Assign connectors actions.":::

   |     |Description  |
   |-----|-------------|
   |**1**|Assign one or more connectors across connector classification groups|
   |**2**|Connector classification group pivot tables|
   |**3**|Search bar to find connectors across properties like **Name**, **Blockable**, **Type**, or **Publisher**|
   |**4**|Connector classification group that maps any new connectors added by Power Platform *after* your data policy is created.|
   |**5**|Select, multi-select, or bulk-select connectors to move across groups|
   |**6**|Alphabetical sort capability across individual columns|
   |**7**|Action buttons to assign individual connectors across connector classification groups|


1. Select one or more connectors. For this walkthrough, select the SalesForce and SharePoint connectors, and then select **Move to Business** from the top menu bar. You can also use the ellipsis (![ellipses.](./media/vertical-ellipses.png)) to the right of the connector name. 

    :::image type="content" source="media/dlp-assign-connectors-multiple.png" alt-text="Assign multiple connectors.":::

   The connectors appear in the **Business** data group.

   :::image type="content" source="media/dlp-business-data-group.png" alt-text="Business data group":::

   Connectors can reside in only one data group at a time. By moving the SharePoint and Salesforce connectors to the **Business** data group, you're preventing users from creating flows and apps that combine these two connectors with any of the connectors in the **Non-Business** or **Blocked** groups.

   For connectors like SharePoint that are not blockable, the **Block** action isn't available and a warning appears.

1. Review and change the default group setting for new connectors, if needed. We recommend keeping the default setting as **Non-Business** to map any new connectors added to Power Platform by default. **Non-Business** connectors can be manually assigned to **Business** or **Blocked** later by editing the data policy, after you've had a chance to review and assign them. If the new connector setting is **Blocked**, any new connectors that are blockable are mapped to **Blocked**, as expected. However, any new connectors that are unblockable are mapped to **Non-Business** because by design they can't be blocked. 

   In the upper-right corner, select **Set default group**.

   :::image type="content" source="media/dlp-edit-default-group.png" alt-text="Set default group":::

   After you've completed all the connector assignments across the **Business**/**Non-Business**/**Blocked** groups and set the default group for new connectors, select **Next**.

1. Choose the scope of the data policy. This step isn't available for environment-level policies, because they're always meant for a single environment.

   :::image type="content" source="media/dlp-define-scope.png" alt-text="Define scope":::

   For the purpose of this walkthrough, you exclude test environments from this policy. Select **Exclude certain environments**, and on the **Add Environments** page, select **Next**.
  
1. Review the various attributes and settings on the **Add Environments** page. For tenant-level policies, this list shows the tenant-level admin all the environments in the tenant. For environment-level policies, this list only shows the subset of environments in the tenant that are managed by the user who has signed in as an Environment Admin or as a System Administrator for environments with Dataverse database. 

   :::image type="content" source="media/dlp-add-environments2.png" alt-text="Add environments":::

   **Attributes** <br /><br />

   <table width="100%">
   <tr>
   <th>Attribute</th>
   <th>Description</th>
   </tr>
   <tr>
   <td width="20%"> Name</td>
   <td width="80%"> The name of the environment. </td>
   </tr>
   <tr>
   <td width="20%"> Type</td>
   <td width="80%"> The type of the environment: trial, production, sandbox, default   </td>
   </tr>
   <tr>
   <td width="20%"> Region</td>
   <td width="80%"> The region associated with the environment.    </td>
   </tr>
   <tr>
   <td width="20%"> Created by  </td>
   <td width="80%">  The user who created the environment.   </td>
   </tr>
   <tr>
   <td width="20%"> Created (On) </td>
   <td width="80%"> The date on which the environment was created.  </td>
   </tr>
   </table>

   **Lists** <br /><br />

   <table width="100%">
   <tr>
   <th>Pivot</th>
   <th>Description</th>
   </tr>
   <tr>
   <td width="20%"> Available    </td>
   <td width="80%"> Environments that aren't explicitly included or excluded in the policy scope. For environment-level policy and tenant-level policies with scope defined as <b>Add multiple environments</b>, this list represents the subset of environments that aren't included in the policy scope. For tenant-level policies with scope defined as <b>Exclude certain environments</b>, this pivot represents the set of environments that are included within the policy scope.   </td>
   </tr>
   <tr>
   <td width="20%"> Added to policy     </td>
   <td width="80%">  For environment-level policy and tenant-level policies with scope defined as <b>Add multiple environments</b>, this pivot represents the subset of environments that are within the policy scope. For tenant-level policies with scope defined as <b>Exclude certain environments</b>, this pivot represents the subset of environments that are excluded from the policy scope.   </td>
   </tr>
   </table>

   **Actions** <br /><br />

   <table width="100%">
   <tr>
   <th>Action</th>
   <th>Description</th>
   </tr>
   <tr>
   <td width="20%"> Add to policy   </td>
   <td width="80%"> Environments in the <b>Available</b> category can be moved to the <b>Added to policy</b> category by using this action. </td>
   </tr>
   <tr>
   <td width="20%"> Remove from policy  </td>
   <td width="80%">  Environments in the <b>Added to policy</b> category can be moved to the <b>Available</b> category by using this action.  </td>
   </tr>
   </table>

1. Select one or more environments. You can use the search bar to quickly find the environments of interest. For this walkthrough, search for test environments - type sandbox. After we select the sandbox environments, we assign them to the policy scope by using **Add to policy** from the top menu bar. 

   > [!div class="mx-imgBorder"] 
   > ![Assign policy.](media/dlp-assign-policy-environments.png "Assign policy")

   Because the policy scope was initially selected as **Exclude certain environments**, these test environments are now excluded from the policy scope and the data policy settings are applied to all the remaining (**Available**) environments. For environment-level policy, you can only select a single environment from the list of available environments.

   After making selections for environments, select **Next**.

1. Review the policy settings, and then select **Create Policy**.

   > [!div class="mx-imgBorder"] 
   > ![Review new policy.](media/dlp-new-policy-review.png "Review new policy")

The policy is created and appears in the list of data policies. As a result of this policy, SharePoint and Salesforce apps can share data in non-test environments&mdash;such as production environments&mdash;because they're both part of the same **Business** data group. However, any connector that resides in the **Non-Business** data group&mdash;such as Outlook.com&mdash;won't share data with apps and flows by using SharePoint or Salesforce connectors. Facebook and Twitter connectors are altogether blocked from being used in any app or flow in non-test environments such as production or default environments. 

It's good practice for admins to share the list of data policies with their organization so that users are aware of the policies before they create apps.

This table describes how the data policy you created affects data connections in apps and flows.

|Connector matrix  |SharePoint (Business)  |Salesforce (Business)  |Outlook.com (Non-Business)   |Facebook (Blocked)  |Twitter (Blocked) |
|---------|---------|---------|---------|---------|---------|
|SharePoint (Business)     | Allowed        | Allowed        | Denied        |Denied        |Denied         |
|Salesforce (Business)     | Allowed        | Allowed        |  Denied       | Denied        | Denied        |
|Outlook.com (Non-Business)      |Denied         | Denied        | Allowed        |  Denied       | Denied        |
|Facebook (Blocked)     |  Denied       | Denied        |  Denied       |  Denied       |  Denied       |
|Twitter (Blocked)     |  Denied       | Denied        | Denied        | Denied        |  Denied       |

Because no data policy has been applied to test environments, apps and flows can use any set of connectors together in these environments.

## Find and view data policies

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Data policies**. If you have a long list of policies, use the **Search** box to find specific data policies.

   > [!div class="mx-imgBorder"] 
   > ![data policy list.](media/dlp-policy-list-view.png "data policy list")

   The list view shows the following attributes:

   | Attribute | Description |
   | --------- | ----------- |
   | Name | The name of the policy. |
   | Scope | The type of policy, such as environment-level or tenant-level |
   | Applied to | The environment scope associated with the policy.<br>For an environment-level policy, this is single environment name associated with the policy. <br> For a tenant-level policy, this can be one of the following values:<br>- All environments<br>- All environments, except (_n_)<br>- (_n_) environments<br>- A single environment name |
   | Created by | The user who created the policy. |
   | Created (On) | The date on which the policy was created. |
   | Modified by | The user who modified the policy. |
   | Modified (On) | The date on which the policy was modified. |

## Edit a data policy

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. From the list of data policies, select an environment, and then select **Edit Policy**. If you have a long list of policies, use the **Search** box to find specific environments.

   > [!div class="mx-imgBorder"] 
   > ![Edit a data policy.](media/dlp-edit-policy.png "Edit a data policy")

   > [!NOTE]
   > Environment admins can't edit policies that were created by the tenant admin.

3. Proceed through the steps described in [Walkthrough: Create a data policy](#walkthrough-create-a-data-policy), and then select **Update Policy**.

   > [!NOTE]
   > Environment-level data policies can't override tenant-wide data policies.

   > [!div class="mx-imgBorder"] 
   > ![Edit data policy review.](media/dlp-edit-policy-review.png "Edit data policy review")

4. (Optional) If necessary, consider enforcing data policies on connections. Learn more: [Enforce data policy for violating connections](powerapps-powershell.md#enforce-dlp-policy-for-violating-connections---environment)

   > [!NOTE]
   >  Enforcing data policies will disable existing connections that violate any data policies and enable any previously disabled connections that no longer violate any data policies.

## Delete a data policy

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. From the list of data policies, select an environment, and then select **Delete Policy**. If you have a long list of policies, use the **Search** box to find specific environments.

   > [!div class="mx-imgBorder"] 
   > ![Delete a data policy.](media/dlp-delete-policy.png "Delete a data policy")

   > [!NOTE]
   > Environment admins can't delete policies that were created by the tenant admin.

3. In the confirmation dialog box, select **Delete**.

## Change the default data group

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a [Power Platform admin](use-service-admin-role-manage-tenant.md#power-platform-administrator).

1. From the list of data policies, select an environment, and then select **Edit Policy**. If you have a long list of policies, use the **Search** box to find specific environments.

   > [!div class="mx-imgBorder"] 
   > ![Edit a data policy.](media/dlp-edit-policy.png "Edit a data policy")

   > [!NOTE]
   > Environment admins can't edit policies created by the tenant admin.

1. Select the **Connectors** step in the **Edit Policy** process.

1. In the upper-right corner, select **Set default group**.

   > [!div class="mx-imgBorder"] 
   > ![Set default group.](media/dlp-edit-default-group.png "Set default group")

1. Choose a default group, and then select **Apply**. Learn more: [Connector classification](dlp-connector-classification.md) and [Default data group for new connectors](dlp-connector-classification.md#default-data-group-for-new-connectors)

1. Select **Next** as needed to close the **Edit Policy** process.

The data group you chose will be the default group to automatically classify any new connectors added to Power Platform after your policy has been created. 

## Use PowerShell commands
See [data policies policy commands](powerapps-powershell.md#data-loss-prevention-dlp-policy-commands).

### See also

[Data loss prevention policies](wp-data-loss-prevention.md) <br />
[data policies policy commands](powerapps-powershell.md#data-loss-prevention-dlp-policy-commands) <br />
[Power Platform data policies SDK](data-loss-prevention-sdk.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
