---
title: Manage data loss prevention (DLP) policies | Microsoft Docs
description: Walkthrough of how to manage data loss prevention policies for Power Apps.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/21/2018
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Manage data loss prevention (DLP) policies
An organization's data is critical to its success. Its data needs to be readily available for decision-making, but it needs to be protected so that it isn't shared with audiences that shouldn't have access to it. To protect this data, Power Apps lets you create and enforce data loss prevention (DLP) policies that define which consumer connectors specific business data can be shared with. For example, an organization that uses Power Apps may not want its business data that's stored in SharePoint to be automatically published to its Twitter feed.

<span style="color:blue">some *blue* text</span>

To create, edit, or delete DLP policies, you must have either Environment Admin or Power Platform service admin permissions. For more information, see [Environments administration in Power Apps](environments-administration.md).

For instructions on how to create a DLP policy, see [Create a data loss prevention (DLP) policy](create-dlp-policy.md).

## Find a DLP policy

1. Sign in to the Power Platform admin center.

2. In the navigation pane, select **Data policies**. If you have a long list of policies, use the **Search** box to find specific DLP policies.

   > [!div class="mx-imgBorder"] 
   > ![DLP policy list](media/dlp-policy-list-view.png "DLP policy list")

## Edit a DLP policy

1. In the list of data loss prevention policies, select an environment and then select **Edit Policy**.

   > [!div class="mx-imgBorder"] 
   > ![Edit DLP policy](media/dlp-edit-policy.png "Edit DLP policy")

   > [!NOTE]
   > Environment admins can't edit environments created by the tenant admin.

2. Proceed through the Edit policy steps, and then select **Update Policy**.

   > [!NOTE]
   > Environment DLP policies cannot override tenant-wide DLP policies.

   > [!div class="mx-imgBorder"] 
   > ![Edit DLP policy review](media/dlp-edit-policy-review.png "Edit DLP policy review")

## Delete a DLP policy

1. In the list of data loss prevention policies, select an environment and then select **Delete Policy**.

   > [!div class="mx-imgBorder"] 
   > ![Delete DLP policy](media/dlp-delete-policy.png "Delete DLP policy")

   > [!NOTE]
   > Environment admins can't delete environments created by the tenant admin.

2. In the confirmation dialog box, select **Delete**.

   The policy is deleted and no longer appears in the list of data loss prevention policies.

## Change the default data group

1. In the list of data loss prevention policies, select an environment and then select **Edit Policy**.

   > [!div class="mx-imgBorder"] 
   > ![Edit DLP policy](media/dlp-edit-policy.png "Edit DLP policy")

   > [!NOTE]
   > Environment admins can't edit environments created by the tenant admin.

2. Select the **Connectors** step in the **Edit Policy** process.

3. In the upper-right, select **Set default group**.

   > [!div class="mx-imgBorder"] 
   > ![Edit default group](media/dlp-edit-policy.png "Edit default group")

4. Choose a default group, and then select **Apply**. See [Connector classification](wp-data-loss-prevention.md#connector-classification) and [Default data group for new connectors](wp-data-loss-prevention.md#default-data-group-for-new-connectors).

5. Select **Next** as needed to close the **Edit Policy** process.

The data group you chose will be the default group to auto classify any new connectors added to Power Platform after your policy has been created. 

## See also
[Data loss prevention policies](wp-data-loss-prevention.md) <br />
[Create a data loss prevention (DLP) policy](create-dlp-policy.md)