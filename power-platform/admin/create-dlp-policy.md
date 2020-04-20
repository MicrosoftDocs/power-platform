---
title: Create a data loss prevention (DLP) policy | Microsoft Docs
description: In this quickstart, you learn how to create a data loss prevention (DLP) policy in Power Apps
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: quickstart
ms.date: 04/23/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Create a data loss prevention (DLP) policy
To protect data in your organization, Power Apps lets you create and enforce policies that define which consumer connectors specific business data can be shared with. These policies that define how data can be shared are referred to as data loss prevention (DLP) policies. DLP policies ensure that data is managed in a uniform manner across your organization, and they prevent important business data from being accidentally published to connectors such as social media sites.

## Prerequisites
To follow the steps, **one** of the following items is required:
* Power Platform service admin permissions
* Global admin permissions
* Power Apps Environment Admin permissions plus a Power Apps plan, Power Automate plan, or a [free Power Apps trial](https://docs.microsoft.com/powerapps/maker/signup-for-powerapps) license

For more information, see [Environments administration in Power Apps](environments-administration.md).

## Create a DLP policy

In these steps, you'll add SharePoint and Salesforce to the **Business** data only data group of a DLP policy. If a person who is part of the DLP policy's environment creates an app that shares data between SharePoint or Salesforce and any service in the **Non-business** data allowed data group, the app will not be allowed to connect.

1. In Power Platform admin center, select **Data policies** > **New policy** to start the New Policy process.


   > [!div class="mx-imgBorder"] 
   > ![New data policy](media/dlp-new-policy.png "New data policy")

2. Enter a policy name and then select **Next**.

3. Review the various actions you can take on the **Assign connectors** page. 

   > [!div class="mx-imgBorder"] 
   > ![Assign connectors](media/dlp-assign-connectors.png "Assign connectors") 

   |Setting  |Description  |
   |---------|---------|
   |Set default group | Default: **Business**. For more information on the default group, see xyz.        |
   |Business (n)     | Connectors for sensitive data. Connectors in this group can’t share data with connectors in other groups. Unassigned connectors will show up here by default.        |
   |Non-Business / Default (n)      | Default: All app connectors are originally assigned to this data group. Connectors in this group can’t share data with connectors in other groups.       |
   |Blocked (n)      | Blocked connectors can’t be used where this policy is applied.  |
   |Search Connectors     | To search a long list of policies to find specific DLP policies.        |
   |Name     | The name of the connector.        |
   |Blockable     | Connectors which can be blocked. See xyz for a list of connectors that cannot be blocked.     |
   |Type     | [need explanation for Standard and Premium]        |
   |Publisher     |  The company that publishes the connector.       |
   |About      | Select the URL for more information about the connector.       |


4. Select one or more connectors, such as SalesForce and Sharepoint, and then select **Move to Business** from the top menu bar to apply to all the selected. You can also use the ellipses (![](./media/vertical-ellipses.png)) to the right of the connector name. 

   > [!div class="mx-imgBorder"] 
   > ![Assign multiple connectors](media/dlp-assign-connectors-multiple.png "Assign multiple connectors")

   The connectors will appear in the **Business** data group.

   > [!div class="mx-imgBorder"] 
   > ![Business data group](media/dlp-business-data-group.png "Business data group")

       Connectors can reside in only one data group at a time. By moving the SharePoint and Salesforce connectors to the **Business** data group, you're preventing users from creating flows and apps that combine these two connectors with any of the connectors in the **Non-Business** and **Blocked** groups.

5. Tenant admins, choose the scope of the DLP policy. If you're an environment admin, you won't see scope settings so move to Step 6.

   > [!div class="mx-imgBorder"] 
   > ![Define scope](media/dlp-define-scope.png "Define scope")

   Depending on which scope you've chosen, you'll see more options for selecting environments to include in or exclude from the DLP policy.

   Make your selections and select **Next**.

6. Tenant admins can add multiple environments to the DLP policy. Environment admins can add a single environment.  Select **Next** to continue.


   > [!div class="mx-imgBorder"] 
   > ![Add environments to policy](media/dlp-add-environments.png "Add environments to policy")


    Note that environment DLP policies cannot override tenant-wide DLP policies.

7. Review the policy settings and then select **Create Policy**.

   > [!div class="mx-imgBorder"] 
   > ![Review new policy](media/dlp-new-policy-review.png "Review new policy")

The policy is created and appears in the list of data loss prevention policies. As a result of this policy, SharePoint and Salesforce apps can share data. However, any connector, such as Twitter, that resides in the **Non-Business** data group will not share data with SharePoint and Salesforce apps.

It's good practice for administrators to share a list of DLP policies with their organization so that users are aware of the policies prior to creating apps.

### See also
[Data loss prevention policies](wp-data-loss-prevention.md) <br />
[Manage data loss prevention (DLP) policies](prevent-data-loss.md)