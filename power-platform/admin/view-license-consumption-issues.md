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

You can use the Licenses page to see how different licenses are consumed in your environment and you can also see if there are environments might require licensing attention. In the environment page you can select an environment to see how different licenses consumed in your environment, based on last thirty days app launch activity in your environment. You can get answers to questions like:

-   What types of licenses are being used to launch apps?

-   How many users are actively consuming Power app licenses in a specific environment.

-   Who are the users who are actively consuming Power app licenses.

-   Are there users in my environment who need standalone power app licenses.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Overview page

To see an overview of license usage:

1.  Sign in to the [<u>Power Platform admin center</u>](https://admin.powerplatform.microsoft.com/).

2.  Select **Billing** &gt; **Licenses**.

3.  Select the **Overview** tab.

### What's on the Overview tab page

This tab displays a summary of environments in your tenant requiring licensing attention.

| Settings/information          | Description        |
|--------------------------------------|------------------------------------------------------------|
| Include standard environments        | Select to see results for standard (unmanaged) environments. By default, managed environments are displayed. In managed environments, all users will need standalone Power Apps licenses to run apps.           |
| **Environments requiring attention** | The number of environments having licensing issues. These might require your attention.       |
| Environment                          | Which environments have license issues.               |
| License issues                       | The number of license issues for the environment. The number of licensing issues are calculated based on how many different types of licensing actions need to be performed based on the app usage in environments in the tenant. |
| **Recommended actions**              | See a list of possible actions to remediate your license issues.        |

### Environment view tab

Select the **Environment view** tab to see a variety of licensing information related to a selected environment.

### What's on the Environment view tab page

| Information                  | Description     |
|-------------------------------------|-------------------|
| Select environment                  | Select an environment to see the license usage in the environment. You can see if the selected environment is a standard or a managed environment. You can also view the license usage for the selected environment.        |
| **Power Apps licensing overview**   | Summary count of users actively using licenses based on last 30 days app launch usage , and if actions are recommended. If you change a standard environment to managed, any current user launching app with only Microsoft 365 licenses will require a standalone Power Apps license to run app     |
| License type                        | Type of license (Dynamics 365, Microsoft 365, per app, per user, pay-as-you-go, trial, or developer) the actual license is mapped to.       |
| Active users                        | Count of unique users launching apps within the environment at least once within the last 30 days.    |
| Recommended actions                 | Recommended actions, if any, to be considered to convert the environment as a managed environment.   |
| Usage details for a License Type    | Select a license type in the Power Apps licensing overview section to see the list of users of users consuming specific license type.                    |
| Email                               | Email ID/or UPN of the user, who has launched an app available in the selected environment. Includes a list of users with whom an app is shared and if the app is installed in the selected environment. Selecting Email takes users to the Microsoft 365 admin portal.     |
| License                             | Actual SKU Name of the license.     |
| Last active date                    | Date when a selected app was last launched by the user in a selected time.     |
| **License Type: Power App Per App** | If the selected environment has got Per app licenses assigned, you can view the list of apps consuming app pass licenses, number of users the app has been shared with and the count of users who have launched app using per app licenses     |
|                                     |                                              |
| **Download**                        | You can download the information available in the overview section and information available in the drill down section in csv format. To download the details available in the drill down section, You can select a specific license type and from the drill down section initiate a download. Once a csv file is generated you can re- download the same file within 5 days , no need to re-initiate a new |
|                                     | Download .             |
|                                     |                                                                                                                                                                                                                                                                                                         

## Other ways to access licensing pages

You can select **View licensing details** from the Enable Managed Environments page to see licensing information.

If the selected environment is standard, you'll see an alert about license requirements for users with only Microsoft 365 licenses.

To change the standard environment to managed, select **Enable Managed Environments** or see [Enable Managed Environments](hmanaged-environment-enable.md).

