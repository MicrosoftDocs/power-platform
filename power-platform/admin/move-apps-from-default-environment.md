---
title: Move apps from the default environment (preview)
description: The new recommendation in the Power Platform admin center allows administrators to easily move apps from the default environment to designated Managed Environments, ensuring compliance, security, and better organization. 
author: sidhartg
ms.component: pa-admin
ms.topic: concept-article
ms.date: 01/16/2026
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
search.audienceType:
  - admin
---

# Move apps from the default environment (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

Makers often use the default environment in Power Platform as a shared space to create apps, agents, and flows. However, they might not use adequate governance controls to manage these resources efficiently. Over time, this approach can lead to clutter, unmanaged resources, and security risks. The new recommendation in the Power Platform admin center helps administrators move apps from the default environment to designated Managed Environments. This process ensures compliance, security, and better organization.

> [!NOTE]
> - This is a preview feature.
> - Preview features aren’t meant for production use and might have restricted functionality. These features are subject to supplemental terms of use, and are available before an official release so that customers can get early access and provide feedback.
> - During the preview:
>   - You can only move canvas apps and SharePoint forms that don't use any shared connectors or resources. The recommendation only shows the apps and forms that you can move.
>   - You need to add the users in the target environment and reshare the app with them.
>   - If the app in the default environment isn't quarantined or deleted, users can continue to access that app. However, they see a banner message indicating that the app has moved.

## Benefits

- Streamlined governance.
- Reduced manual effort.
- Improved security posture.
- Scalable for large organizations.

## Prerequisites

- You must have system or tenant-level administrator permissions.
- You must have access to Power Platform admin center.
- Managed Environments must be configured as the destination.

## Move apps

You can move apps by using one of two methods:

- **Manual cleanup**: Use this method for smaller-scale migrations or when you want to review apps individually.
- **Automated cleanup using Power Automate**: Use this method for bulk migrations by using preapproved recommendations.

### Move apps by using manual cleanup

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Go to **Actions \> Recommendations**.

1. Select the  **Improve environment hygiene by moving the production apps out of the default environment** recommendation.

1. Review the apps that are listed for cleanup.

1. Select an app and select the **View Details** option, above the list of app names.

1. Select the **Move** option, above the list of app names, to start the migration wizard.

1. Choose the destination environment from the list. Select **Next**.

1. Indicate who should receive messages about the move. You can remove users who are listed, or add a new user by entering a name in the **Send to** box. Select **Next**.

1. Review the information displayed and decide what to do with the original app by selecting one of the following options:

    - **None**: Keep as is. We recommend that you rename the original app with **(Moved)** and add a redirect screen.
    - **Quarantine**: Restrict access to owner only.
    - **Delete**: Permanently remove the original app.

1. Select **Move** to complete migration.

    > [!Tip]
    > The migration preserves permissions and sharing settings.

### Move apps by using automated cleanup with Power Automate

1.  Create a flow with a **Manual Trigger**.

1.  Use the **Power Platform for Admins V2** connector:

    - **Get Recommendations**.

    - **Get Recommendation Resources**.

1.  Filter for apps in the default environment.

1.  Loop through apps and run the **Migrate to Managed Environment** action:

    - **Recommendation name:** Secure high-value apps with premium governance.
    - **Action name:** Migrates an application to a Managed Environment.
    - **API version:** 2022-03-01-preview.
    - **Parameters:** Example to use in a for-each action:

      > \[  
      > {  
      > "resourceId": @{items('Apply_to_each')?\['resourceId'\]},  
      > "environment": @{items('Apply_to_each')?\['environmentId'\]}, "destinationEnvironmentName": "\<destination environment guid\>"  
      > }  
      > \]

1.  Confirm migration in the Power Platform admin center.

## Post-migration

- Validate apps in the new environment.
- Update documentation and notify stakeholders.
- Optionally, add redirect screens to original apps.

## Next steps

- Learn more about [Managed Environments](managed-environment-overview.md).
- Explore [Environment routing](default-environment-routing.md).

