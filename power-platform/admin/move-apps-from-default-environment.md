---
title: Move apps from the default environment
description: The new recommendation in the Power Platform admin center allows administrators to easily move apps from the default environment to designated Managed Environments, ensuring compliance, security, and better organization. 
author: sidhartg
ms.component: pa-admin
ms.topic: concept-article
ms.date: 01/15/2026
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
search.audienceType:
  - admin
---

# Move apps from the default environment

Makers often use the default environment in Power Platform as a shared space to create apps, agents, and flows. However, they might not use adequate governance controls to manage these resources efficiently. Over time, this approach can lead to clutter, unmanaged resources, and security risks. The new recommendation in the Power Platform admin center helps administrators move apps from the default environment to designated Managed Environments. This process ensures compliance, security, and better organization.

> [!NOTE]
> - This feature is currently in public preview.
> - During the preview:
>   - You can only move canvas apps and SharePoint forms that don't use any shared connectors or resources. The recommendation only shows the apps and forms that you can move.
>   - You need to add the users in the target environment and reshare the app with them.
>   - If the app in the default environment isn't quarantined or deleted, users can continue to access that app. However, they see a banner message indicating that the app has been moved.

## Benefits

- Streamlined governance.
- Reduced manual effort.
- Improved security posture.
- Scalable for large organizations.

## Prerequisites

- You must have system or tenant-level administrator permissions.
- You must have access to Power Platform admin center.
- Managed Environments must be configured as the destination.

## Approaches to move apps

You can move apps by using one of two methods:

- **Manual cleanup**: Use this method for smaller-scale migrations or when you want to review apps individually.
- **Automated cleanup (using Power Automate)**: Use this method for bulk migrations by using pre-approved recommendations.

### Manual cleanup

1.  Sign in to [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/).

1.  Go to **Actions \> Recommendations**.

1.  Open the recommendation "Improve environment hygiene by moving the production apps out of the default environment."

1.  Review flagged apps for cleanup.

1.  Select an app and select **View Details**.

1.  Select **Move** to start the migration wizard.

1.  Choose the destination environment from the list.

1.  Decide what to do with the original app:

    - **None:** Keep as is (recommended: rename with "(Moved)" and add redirect screen).

    - **Quarantine:** Restrict access to owner only.

    - **Delete:** Permanently remove.

1.  Select **Move** to complete migration.

    **Tip:** The migration preserves permissions and sharing settings.


### Automated cleanup (using Power Automate)

1.  Create a flow with a **Manual Trigger**.

1.  Use **Power Platform for Admins V2** connector:

    - **Get Recommendations**.

    - **Get Recommendation Resources**.

1.  Filter for apps in the default environment.

1.  Loop through apps and run **Migrate to Managed Environment** action:

    - **Recommendation Name:** Secure high-value apps with premium governance.

    - **Action Name:** Migrates an application to a Managed Environment.

    - **API Version:** 2022-03-01-preview.

    - **Parameters** (example to use in a for-each action)**:**

> \[  
> {  
> "resourceId": @{items('Apply_to_each')?\['resourceId'\]},  
> "environment": @{items('Apply_to_each')?\['environmentId'\]}, "destinationEnvironmentName": "\<destination environment guid\>"  
> }  
> \]

1.  Confirm migration in PPAC.

## Post-migration

- Validate apps in the new environment.
- Update documentation and notify stakeholders.
- Optionally, add redirect screens to original apps.

## Next steps

- Learn more about [Managed Environments](managed-environment-overview.md).
- Explore [Environment routing](default-environment-routing.md).

