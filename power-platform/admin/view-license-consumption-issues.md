---
title: View license consumption (preview)
description: Review license consumption and potential license issues. 
author: amiyapatr-zz
ms.date: 10/12/2022
ms.reviewer: jimholtz
ms.topic: conceptual
ms.subservice: admin
ms.author: ampatra
search.audienceType: 
 - admin
search.app:
 - D365CE
 - PowerApps
 - Powerplatform
 - Flow
---

# View license consumption (preview)

<!-- fwlink: https://go.microsoft.com/fwlink/?linkid=2206011 -->

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You can use the Licenses page to view the number of licenses consumed in individual environments and see which environments might require licensing attention. You can select an environment to see license type activity and consumption for apps. Get answers to questions like:

- How many licenses have been assigned to users?
- Which users have these licenses been assigned to?  
- What types of licenses are being used to launch custom apps? 
- Which apps are driving which type of license usage?

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Overview page

To see an overview of license usage:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 

2. Select **Billing** > **Licenses**.

3. Select the **Overview** tab.

:::image type="content" source="media/licenses-overview-tab.png" alt-text="A screenshot of the Overview tab page.":::

### What's on the Overview tab page

This tab displays a summary of environments in your tenant requiring licensing attention.

| Settings/information |Description  |
|---------|---------|
| Include standard environments     | Select to see results for standard (unmanaged) environments. By default, managed environments are displayed. In managed environments, all users will need Power Apps licenses to run apps.      |
| **Environments requiring attention**     | The number of environments having licensing issues. These might require your attention.        |
| Environment    | Which environments have license issues.      |
| License issues | The number of license issues for the environment. The number of licensing issues are calculated based on how many different types of licensing actions need to be performed based on the app usage in environments in the tenant. |
|**Recommended actions**     | See a list of possible actions to remediate your license issues.        |

## Environment view tab 

Select the **Environment view** tab to see a variety of licensing information related to a selected environment.

:::image type="content" source="media/licenses-environment-view-tab.png" alt-text="Screenshot of the Environment view tab page.":::

### What's on the Environment view tab page 


<!-- Is it correct that "License type" is in this table twice? -->



| Settings/information |Description  |
|---------|---------|
| Select environment     | Select an environment to see whether it's a managed or standard environment, the license data, and if actions are recommended. If you change a standard environment to managed, any current user with only Microsoft 365 licenses will require a Power Apps license to run apps.       |
| **Power Apps licensing overview**    | For the license types in your environment, see the last 30-day activity for active licensed users and any recommended actions.        |
| License type | Type of license (Dynamics 365, Microsoft 365, per app, per user, pay-as-you-go, trial, or developer) the actual license is mapped to. |
| Active users | Count of unique users launching apps within the environment at least once within the last 30 days. |
| Recommended actions | Recommended actions, if any, to be considered to convert the environment as a managed environment.  |
|**Power Apps licensing activity**     | Use filters to query license usage information for licensed users.        |
| Email | Email ID of the user, who has access to launch an app available in the selected environment. Includes a list of users with whom an app is shared and if the app is installed in the selected environment. <br />Selecting Email takes user to the Microsoft 365 admin portal.  |
| App name | App name that is launched by the user in the selected time period. |
| Last active date | Date when a selected app was last launched by the user in a selected time period. |
| App type | The type of app: canvas app, model-driven app  |
| License | Known service plan name of the license being used while launching the app. |
| License type | Type of license (Dynamics 365, Microsoft 365, per app, per user, pay-as-you-go, trial, or developer) the actual license is mapped to. |
| Additional available | Any additional entitlement the user has.  | 

## Opt-in experience

The license experience is not enabled by default for tenants. Admins may need to opt in. 

If you see the message "Licensing information is not yet enabled", select **Enable license reporting** to enable licensing for your tenant. Your request to enable preview will be added to the queue . Please note , during this preview period we are onboarding a limited number of tenants .

:::image type="content" source="media/managed-environment-optin.png" alt-text="Message explaining that opt-in is required for tenant where license experience is not enabled.":::

## Other ways to access licensing pages

You can select **View licensing details** from the Enable Managed Environments page to see licensing information. 

:::image type="content" source="media/managed-environment-view-licensing.png" alt-text="Screenshot showing the View licensing details option on the Enable Managed Environments page.":::

If the selected environment is standard, you'll see an alert about license requirements for users with only Microsoft 365 licenses. 

:::image type="content" source="media/managed-environment-open-from-settings.png" alt-text="Screenshot showing the alert about license requirements.":::

To change the standard environment to managed, select **Enable Managed Environments** or see [Enable Managed Environments](managed-environment-enable.md).


### See also  
[Managed Environments overview](managed-environment-overview.md) <br />
[Enable Managed Environments](managed-environment-enable.md)   <br />
[Usage insights](managed-environment-usage-insights.md)  <br />
[Limit sharing](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md) <br />
[Licensing](managed-environment-licensing.md) <br />
[Tenant settings](tenant-settings.md) 





[!INCLUDE[footer-include](../includes/footer-banner.md)]
