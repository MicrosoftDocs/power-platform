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

The Default Environment in Power Platform often becomes a shared space for makers to create apps, agents, and flows, often without adequate governance controls to manage efficiently. Over time, this can lead to clutter, unmanaged resources, and security risks. The new recommendation in the Power Platform Admin Center enables administrators to easily move apps from the Default Environment to designated Managed Environments, ensuring compliance, security, and better organization.

Note:

1.  This feature is currently in public preview

2.  During the preview:

    1.  You can only move Canvas apps and SharePoint Forms that do not use any shared connectors or resources. The recommendation will only show the apps and forms that can be moved.

    2.  You need to provision the users in the target environment and reshare the app with them.

    3.  If the app is the default environment is not quarantined or deleted, users can continue to access that app. However, they’ll see a banner message indicating that the app has been moved.

## Prerequisites

- System or Tenant-level administrator permissions.

- Access to Power Platform Admin Center.

- Managed Environments configured for destination.

## Approaches to Move Apps

You can move apps using one of two methods:

**1. Manual Cleanup (PPAC)**

Ideal for smaller-scale migrations or when reviewing apps individually.

**Steps**

1.  Sign in to [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/).

2.  Navigate to **Actions \> Recommendations**.

3.  Open the recommendation “Improve environment hygiene by moving the production apps out of the default environment”

4.  Review flagged apps for cleanup.

5.  Select an app and click **View Details**.

6.  Click **Move** to start the migration wizard.

7.  Choose the destination environment from the list.

8.  Decide what to do with the original app:

    - **None:** Keep as is (recommended: rename with “(Moved)” and add redirect screen).

    - **Quarantine:** Restrict access to owner only.

    - **Delete:** Permanently remove.

9.  Click **Move** to complete migration.

**Tip:** Permissions and sharing settings are preserved during migration.

**2. Automated Cleanup (Power Automate)**

Best for bulk migrations using pre-approved recommendations.

**Steps**

1.  Create a flow with a **Manual Trigger**.

2.  Use **Power Platform for Admins V2** connector:

    - **Get Recommendations**.

    - **Get Recommendation Resources**.

3.  Filter for apps in the Default Environment.

4.  Loop through apps and execute **Migrate to Managed Environment** action:

    - **Recommendation Name:** Secure high-value apps with premium governance.

    - **Action Name:** Migrates an application to a Managed Environment.

    - **API Version:** 2022-03-01-preview.

    - **Parameters** (example to use in a for-each action)**:**

> \[  
> {  
> "resourceId": @{items('Apply_to_each')?\['resourceId'\]},  
> "environment": @{items('Apply_to_each')?\['environmentId'\]}, "destinationEnvironmentName": “\<destination environment guid\>”  
> }  
> \]

5.  Confirm migration in PPAC.

## Post-Migration

- Validate apps in the new environment.

- Update documentation and notify stakeholders.

- Optionally, add redirect screens to original apps.

## Benefits

- Streamlined governance.

- Reduced manual effort.

- Improved security posture.

- Scalable for large organizations.

**Next Steps**

- Learn more about <https://learn.microsoft.com/power-platform/admin/managed-environments>.

- Explore <https://learn.microsoft.com/power-platform/admin/environment-routing>.

