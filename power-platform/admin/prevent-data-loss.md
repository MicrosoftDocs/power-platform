---
title: Manage data loss prevention (DLP) policies | Microsoft Docs
description: Walkthrough of how to manage data loss prevention policies for Power Apps.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/05/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Manage data loss prevention (DLP) policies

An organization's data is critical to its success. Its data needs to be readily available for decision-making, but the data needs to be protected so that it isn't shared with audiences who shouldn't have access to it. To protect this data, you can use Power Apps to create and enforce data loss prevention (DLP) policies that define the consumer connectors that specific business data can be shared with. For example, an organization that uses Power Apps might not want the business data that's stored in SharePoint to be automatically published to its Twitter feed.

To create, edit, or delete DLP policies, you must have either Environment Admin or Power Platform admin permissions. 

## Find and view DLP policies

1. Sign in to the Power Platform admin center.

2. In the navigation pane, select **Data policies**. If you have a long list of policies, use the **Search** box to find specific DLP policies.

   > [!div class="mx-imgBorder"] 
   > ![DLP policy list](media/dlp-policy-list-view.png "DLP policy list")

   The list view shows the following attributes:

   <table style="width:100%">
   <tr>
   <th>Attribute</th>
   <th>Description</th>
   </tr>
   <tr>
   <td width="20%"> Name</td>
   <td width="80%"> The name of the policy. </td>
   </tr>
   <tr>
   <td width="20%"> Scope</td>
   <td width="80%"> The type of policy, such as environment-level or tenant-level </td>
   </tr>
   <tr>
   <td width="20%"> Applied to</td>
   <td width="80%"> The environment scope associated with the policy.<br />For an environment-level policy, this will be a specific (single) environment name associated with the policy. <br /> For a tenant-level policy, this can be one of the following values:<br /><ul><li>All environments</li><li>All environments, except (<i>n</i>)</li><li> (<i>n</i>) environments</li><li>A single environment name</li></ul> </td>
   </tr>
   <tr>
   <td width="20%"> Created by  </td>
   <td width="80%">   The user who created the policy.   </td>
   </tr>
   <tr>
   <td width="20%"> Created (On) </td>
   <td width="80%"> The date on which the policy was created.  </td>
   </tr>
      <tr>
   <td width="20%"> Modified by  </td>
   <td width="80%">   The user who modified the policy.   </td>
   </tr>
   <tr>
   <td width="20%"> Modified (On) </td>
   <td width="80%"> The date on which the policy was modified.  </td>
   </tr>
   </table>

## Edit a DLP policy

1. Sign in to the Power Platform admin center.

2. From the list of DLP policies, select an environment, and then select **Edit Policy**. If you have a long list of policies, use the **Search** box to find specific environments.

   > [!div class="mx-imgBorder"] 
   > ![Edit a DLP policy](media/dlp-edit-policy.png "Edit a DLP policy")

   > [!NOTE]
   > Environment admins can't edit policies that were created by the tenant admin.

3. Proceed through the steps described in [Create a DLP policy](create-dlp-policy.md), and then select **Update Policy**.

   > [!NOTE]
   > Environment-level DLP policies can't override tenant-wide DLP policies.

   > [!div class="mx-imgBorder"] 
   > ![Edit DLP policy review](media/dlp-edit-policy-review.png "Edit DLP policy review")

## Delete a DLP policy

1. Sign in to the Power Platform admin center.

2. From the list of DLP policies, select an environment, and then select **Delete Policy**. If you have a long list of policies, use the **Search** box to find specific environments.

   > [!div class="mx-imgBorder"] 
   > ![Delete a DLP policy](media/dlp-delete-policy.png "Delete a DLP policy")

   > [!NOTE]
   > Environment admins can't delete policies that were created by the tenant admin.

3. In the confirmation dialog box, select **Delete**.

## Change the default data group

1. Sign in to the Power Platform admin center.

2. From the list of DLP policies, select an environment, and then select **Edit Policy**. If you have a long list of policies, use the **Search** box to find specific environments.

   > [!div class="mx-imgBorder"] 
   > ![Edit a DLP policy](media/dlp-edit-policy.png "Edit a DLP policy")

   > [!NOTE]
   > Environment admins can't edit policies created by the tenant admin.

3. Select the **Connectors** step in the **Edit Policy** process.

4. In the upper-right corner, select **Set default group**.

   > [!div class="mx-imgBorder"] 
   > ![Set default group](media/dlp-edit-default-group.png "Set default group")

5. Choose a default group, and then select **Apply**. More information: [Connector classification](wp-data-loss-prevention.md#connector-classification) and [Default data group for new connectors](wp-data-loss-prevention.md#default-data-group-for-new-connectors)

6. Select **Next** as needed to close the **Edit Policy** process.

The data group you chose will be the default group to automatically classify any new connectors added to Power Platform after your policy has been created. 

## Use DLP PowerShell commands
See [Data loss prevention (DLP) policy commands](powerapps-powershell.md#data-loss-prevention-dlp-policy-commands).

### See also

[Data loss prevention policies](wp-data-loss-prevention.md) <br />
[Create a data loss prevention (DLP) policy](create-dlp-policy.md) <br />
[Data loss prevention (DLP) policy commands](powerapps-powershell.md#data-loss-prevention-dlp-policy-commands)