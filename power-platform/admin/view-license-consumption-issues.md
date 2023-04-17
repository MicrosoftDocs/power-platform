---
title: View license consumption (preview)
description: Review license consumption and potential license issues. 
author: amiyapatr-zz
ms.date: 04/14/2023
ms.reviewer: sericks
ms.topic: conceptual
ms.subservice: admin
ms.author: ampatra
search.audienceType: 
 - admin
---

# View license consumption (preview)

<!-- fwlink: https://go.microsoft.com/fwlink/?linkid=2206011 -->

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You can use the **Licenses** (**Billings > Licenses**) page to see how different licenses are consumed and if there are environments that might require licensing attention. You can get answers to questions like:

-   What types of licenses are being used to launch apps?

-   How many users are actively consuming Power Apps licenses in a specific environment.

-   Who are the users who are actively consuming Power Apps licenses.

-   Are there users in my environment who need standalone Power Apps licenses.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Overview tab

The **Overview** tab displays a summary of environments in your tenant requiring licensing attention.

| Setting        | Description        |
|--------------------------------------|------------------------------------------------------------|
| Include standard environments        | Select this option to see results for standard (unmanaged) environments. By default, managed environments are displayed. In managed environments, all users will need standalone Power Apps licenses to run apps.           |
| Environments requiring attention | Shows the number of environments having licensing issues. These envrionments require your attention.       |
| Environment                          | Indicates which environments have licensing issues.               |
| License issues                       | The number of licensing issues for the environment. The number of licensing issues is calculated based on how many different types of licensing actions need to be performed based on the app usage in the environment. |
| Recommended actions              | See a list of possible actions to remediate your licensing issues.        |

## Environment tab

The **Environment** tab displays licensing information related to a selected environment, based on the last thirty days. 

| Setting                  | Description     |
|-------------------------------------|-------------------|
| Select environment                  | Select an environment to see the license usage in the environment. You can see if the selected environment is a standard or a managed environment. You can also view the license usage for the selected environment.        |
| **Power Apps licensing overview**   | Summary count of users actively using licenses based on the last thirty days, and indicates if actions are recommended. If you change a standard environment to a managed environment, any current user launching an app&mdash;with only a Microsoft 365 license&mdash;will require a standalone Power Apps license to run the app.     |
| License type                        | Type of license (Dynamics 365, Microsoft 365, per app, per user, pay-as-you-go, trial, or developer) the actual license is mapped to.       |
| Active users                        | Count of unique users launching apps within the environment at least once within the last thirty days.    |
| Recommended actions                 | Actions to consider to convert the environment to a managed environment.   |
| Usage details for a License Type    | Select a license type in the **Power Apps licensing overview** section to see the list of users consuming a specific license type.                    |
| Email                               | Email ID or UPN of the user, who has launched an app available in the selected environment. Includes a list of users with whom an app is shared, and if the app is installed in the selected environment. Selecting the email link takes users to the Microsoft 365 admin portal.     |
| License                             | Actual SKU name of the license.     |
| Last active date                    | Date when a selected app was last launched by the user in a selected time.     |
| **License Type: Power App Per App** | If the selected environment has per app licenses assigned, you can view the list of apps consuming app pass licenses, the number of users the app has been shared with, and the count of users who have launched the app using per app licenses.     |
| Download                        | Download the information in CSV format. <br><br>To download the details available in the drill-down section, select a specific license type to initiate a download. Once a CSV file is generated, you can re-download the same file within five days; you don't have to re-initiate a new download.|
                                                                                                      

## Other ways to access licensing pages

You can select **View licensing details** from the **Enable Managed Environments** page to see licensing information.

If the selected environment is standard, you'll see an alert about license requirements for users with only Microsoft 365 licenses.

To change the standard environment to managed, select **Enable Managed Environments** or see [Enable Managed Environments](managed-environment-enable.md).

