---
title: "How to use the Environment Management components | MicrosoftDocs"
description: "The Environment Management components in the Core solution will help automate and manage requests for development resources."
author: denisem-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/04/2021
ms.subservice: guidance
ms.author: demora
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Environment management

## Process description

**Problem statement**: When a development project requires a new Environment, and non-admins are restricted from creating Environments, the only way for non-admins to access new Environments is for admins to provision the Environment and grant permissions to users. Admins can become the bottleneck of development if volume of demand for environments is high because multiple steps are involved.

**Solution**: The below process can be used by non-admins to request new environments.

![Environment management process.](media\env-mgmt-process.png "Environment management process")

Developers (non-admins) can:

- Submit requests for new environments.

Admins can:

- Provision new environments for developers using the app.
- See how new environments will be affected by data loss prevention policies.

## Developer: Request an environment

Developers (non-admins) can request new environments for their admin to triage.

1. Open the **Power Platform Resource Request canvas app**.
1. Select + New
1. In the fly-out menu, choose the desired connectors that will be needed in the new environment. Then select Next.
![Choose connectors](media\dev-resources-maker-connectors.png "Choose connectors")

1. Choose the user accounts who will need environment administrator access.
![Choose admins](media\dev-resources-maker-admins.png "Choose admins")

1. Provide basic details about the desired environment, including the display name, region, type, purpose.
1. Indicate if the environment can be automatically cleaned up after a certain period of time.
    1. If yes, then provide a duration (in days) from the dropdown that appears. Do this if you only need the environment for a short term project.
    1. If no, the environment will not be deleted automatically. Do this if you need to keep the environment for a long time.
1. Indicate whether to provision a Dataverse database. 
![Environment details](media\dev-resources-maker-env.png "Environment details")

1. If a database is needed (toggle=yes), provide the required language and currency values. Optionally provide a security group to restrict access to the environment.
![Choose database settings](media\dev-resources-maker-db.png "Choose database settings")

1. Submit the form when done by clicking the **Save** button.

📧 An email will be sent to notify the CoE Starter Kit admins to review the new request.

View any of your submitted requests in the canvas app.

![View requests](media\dev-resources-maker-pending.png "View requests")

## Admin: Approve or deny a request

As the admin, you can view and triage requests for new environments.

1. Open the canvas app called **Admin - Power Platform Resource RMS**.
1. View the pending environment creation requests in the home screen.

> [!NOTE]
> By default, pending requests are displayed first. Change the request state filter using the dropdown in the right side of the ribbon.

1. Select a request in the table to view more detail.
![Select request](media\dev-resources-admin.png "Select requests")

1. Read details requested for the new environment:
    1. Environment information, justification.
    1. Admins requested.
    1. View the requested security group, or add one if none was selected.
    1. Connectors.
    1. Impacting policies.
    1. Add comments about the decision in the Notes panel.

    ![View details](media\dev-resources-admin-details.png "View details")

    > [!NOTE]
    > A banner on the top of the page indicates how the new environment will be impacted based on the existing policies in the tenant. The impact analysis will change when policies are modified.

1. Modify data loss prevention policies in the Impacted Policies table by clicking on the suggested actions (if any are available).
![View actions](media\dev-resources-admin-details-actions.png "View actions")

    > [!WARNING]
    > Only certain types of policies can be added (Organization-level environments that are not "All Environments" type policies).

1. Select "View and modify policies" to see all policies and their impact on the requested connectors. You can add or remove policies to the modify list that will be changed upon approval by selecting a policy and choosing the actions that appear in the ribbon.
![View or modify DLP policies](media\dev-resources-admin-policies.png "View or modify DLP policies")

1. Select a policy and click on the **Details** action in the ribbon to view the impact on connectors.
![Policy impact](media\dev-resources-admin-policy-details.png "Policy impact")

1. Approve or reject the request in the top left ribbon.
![Approve or reject](media\dev-resources-admin-details-decision.png "Approve or reject")

### Approved path

Once the request is approved, the environment will be created with the requested configurations. The users are granted environment admin access.

#### ⏳ Expiration

If the environment has an expiration date, it will be automatically deleted after the duration indicated. Warning emails are sent out weekly to the admins to remind them to save work in source control or other locations outside of the environment.

If no expiration is set the environment will never be cleaned up automatically. The environment must be deleted manually in the Power Platform admin center.

## DLP recommendation logic

The admin app uses the below logic to provide guidance on how to configure the DLP policies to allow requested connectors.

### Decision matrix: Warning banner

This is the banner displayed in the admin app when viewing the request's details page.

| Condition | No policies apply to the environment | Existing policies apply to the environment without including it in any policy’s environment list | Environment will be added to policies upon approval |
|-|-|-|-|
| Unblocked |🟡 Connectors not blocked or restricted, but no policies will protect the environment. Add environment to at least one policy to prevent data loss.| 🟢 Connectors are not blocked or restricted and the environment is covered by at least one existing policy. | 🟢 Connectors are not blocked and environment will be added to selected policies on approval of request.|
| Blocked | -- | ⛔ Connectors blocked by original policy configurations. Add environment to existing policy environment lists or modify policies in the Power Platform admin center to unblock connectors. | ⛔ Connectors blocked by current policy configurations. Add environment to different policies or modify policies in the Power Platform admin center to unblock connectors. |
| Restricted | -- | 🟡 Connectors restricted by original policy configurations. Add environment to existing policies’ environments lists or modify policies in the Power Platform admin center to unblock connectors. | 🟡 Connectors restricted by current policy configurations. Add environment to different policies or modify policies in the Power Platform admin center to unblock connectors. |

### Decision matrix: Policy-level recommended actions

Matrix for recommended action based on the policy and the requested connectors. Horizontal columns show each policy type, and vertical rows of the matrix show the impact that policy has on the requested connectors based on its rules.

| Impact | All environments | Exclude certain environments | Include multiple environments |
|-|-|-|-|
| Not blocked or restricted | No action needed.<br><br>Requested connectors are not blocked by this policy. This type of policy will cover this new environment once created, so no action is needed. | Add policy if the new environment it not covered. If it is covered, no action needed. | Requested connectors would not be blocked by this policy if added to its environment list. Add to this policy’s list if this environment will be added to another "Exclude certain environments" policy list that is affecting the requested connectors. |
| Blocked | Unblock allowed connectors in the policy’s definition in the Power Platform Admin Center. <br><br>⚠CAUTION: changing policies that affect "All environments" can potentially impact any canvas app and cloud flow in the tenant. Confirm impact in the DLP Editor tool.<br><br>If this policy's connector rules cannot be changed, you can make an exception for this new environment by changing this policy to an "Exclude certain environments" type policy in the Power Platform Admin Center. Find or create a "Multiple environments" type policy that allows the requested connectors to add the environment to. Come back to this Environment Request Admin App record and add this to the environments list of both policies. | Add to this policy or unblock the blocked connectors. <br><br>If there are no other policies covering the environment, add it to another existing or new "Multiple environments" policy that will not block the requested connectors.  | Do not add the new environment to this policy.<br><br>The environment only needs to be added to a "Multiple environments" type policy if it is not covered by other policies. For example, if there are no "All environment policies" and the environment is being excluded from all "Exclude except environments" type policies, no policies are covering the environment.<br><br>If there are no better policies to add this environment to, consider updating this policy's connector groups, or create a new policy in the Power Platform Admin Center. |
| Restricted | Put the restricted connectors in the same group in the policy’s definition in the Power Platform Admin Center. <br><br>⚠CAUTION: changing "All environments" type policies can potentially impact any canvas app and cloud flow in the tenant.<br><br>If this policy’s connector rules cannot be changed, you can make an exception for this new environment by changing this policy to an "Exclude certain environments" type policy in the Power Platform Admin Center. Find or create a "Multiple environments" type policy that has the requested connectors in the same group. Come back to this Environment Creation Request Admin App record and add this to the environments list of both policies. | Add the environment to this policy’s exception list.<br><br>If this is added to the exception list and there are no other policies covering the environment, add it to another "Multiple environments" policy that will not restrict the acceptable requested connector(s), or create another policy to cover the most critical security requirements.<br><br>Consider if acceptable requested connectors can be unrestricted by updating this policy in the Power Platform admin center. <br><br>Caution: Make sure other environments excluded from this policy will not be negatively impacted by this change. | Do not add the new environment to this policy.<br><br>The environment only needs to be added to a "Multiple environments" type policy if it is being excluded from an "Exclude except environments" type policy and there are no other policies that will cover the environment.<br><br>If no existing policies work, consider if updating this policy to include the requested connectors in the same group is an option. making sure the other environments included in the environment list will not be negatively impacted. Go to the Power Platform admin center to update policy rules. |
