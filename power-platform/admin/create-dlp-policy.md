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
1. In Power Platform admin center, select **Data policies** > **New policy** to start the New Policy process.


   > [!div class="mx-imgBorder"] 
   > ![New data policy](media/dlp-new-policy.png "New data policy")

2. Enter a policy name and then select **Next**.

3. Review the various actions you can take on the **Assign connectors** page. 

   > [!div class="mx-imgBorder"] 
   > ![Assign connectors](media/dlp-assign-connectors.png "Assign connectors") 

   |Setting  |Description  |
   |---------|---------|
   |Set default group | Default: **Business**. See xyz.        |
   |Business (n)     | Connectors for sensitive data. Connectors in this group can’t share data with connectors in other groups. Unassigned connectors will show up here by default.        |
   |Non-Business / Default (n)      | Connectors for non-sensitive data. Connectors in this group can’t share data with connectors in other groups.       |
   |Blocked (n)      | Blocked connectors can’t be used where this policy is applied.  |
   |Search Connectors     | To search a long list of policies to find specific DLP policies.        |
   |Name     | The name of the connector.        |
   |Blockable     | Connectors which can be blocked. See xyz for a list of connectors that cannot be blocked.     |
   |Type     | <need explanation for Standard and Premium>        |
   |Publisher     |  The company that publishes the connector.       |
   |About      | Select the URL for more information about the connector.       |


4. Select one or more connectors and then select **Move to Business** or **Block** from the top menu bar to apply to all the selected. To set individual connectors, use the ellipses (![](./media/vertical-ellipses.png)) to the right of the connector name. 

   > [!div class="mx-imgBorder"] 
   > ![Assign multiple connectors](media/dlp-assign-connectors-multiple.png "Assign multiple connectors")

   - Select **Move to business** to 
   - Select **Block** to 
   - Select **Next** to move to the next step.

5. Tenant admins, choose the environment scope. Environment admins, you won't see scope options so move to Step 6.

   > [!div class="mx-imgBorder"] 
   > ![Define scope](media/dlp-define-scope.png "Define scope")

   Depending on which scope you've chosen, you'll see more options for selecting environments to include in or exclude from the DLP policy.

   Make your selections and select **Next**.

6. Environment admins can add a single environment to the DLP policy. Tenant admins can add multiple environments to the DLP policy. Select **Next** to continue.


   > [!div class="mx-imgBorder"] 
   > ![Add environments to policy](media/dlp-add-environments.png "Add environments to policy")


    Note that environment DLP policies cannot override tenant-wide DLP policies.

7. Review the policy settings and then select **Create Policy**.

   > [!div class="mx-imgBorder"] 
   > ![Review new policy](media/dlp-new-policy-review.png "Review new policy")

    Connectors can reside in only one data group at a time and are added to the **No business data allowed** group by default. By moving Common Data Service and SharePoint to the **Business data only** group, you're preventing users from creating flows and apps that combine these two connectors with any of the connectors in the **No business data allowed** group.

The policy is created and appears in the list of data loss prevention policies. Since the Twitter connector resides in the **No business data allowed** data group, this policy ensures that the Common Data Service and SharePoint do not share their data with Twitter.

It's good practice for administrators to share a list of DLP policies with their organization so that users are aware of the policies prior to creating apps.

### See also
[Manage data loss prevention (DLP) policies](prevent-data-loss.md)