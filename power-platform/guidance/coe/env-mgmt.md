---
title: Environment and data policy management
description: Use Environment Management components in the core solution to automate and manage requests for development resources including data loss prevention or DLP policies.
author: denise-msft
ms.component: pa-admin
ms.topic: how-to
ms.date: 08/29/2025
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: jhaskett-msft
search.audienceType: 
  - admin
---
# Environment and data policy management

[Watch a walk-through](https://www.youtube.com/watch?v=16mspbGz1zA&list=PLi9EhCY4z99W5kzaPK1np6sv6AzMQDsXG) of how the environment and data policy request process works.

## Process description

**Problem statement**: When a development project requires a new environment, and non-admins are restricted from creating environments, only admins can set up the environment and give users permission to use it. Admins can slow down development when demand for environments is high because multiple steps are involved. New environments might also need new connectors or data policies.

**Solution**: Non-admins can use the process that follows to request new environments and changes to data policies for their environments.

:::image type="content" source="media/env-mgmt-process.png" alt-text="Architecture diagram illustrating environment management process.":::

Developers (non-admins) can:

- Submit requests for new environments.
- Submit requests for data policies to be applied to their environments.

Admins can:

- Provision new environments for developers using the app.
- See how new environments will be affected by data policies.
- Approve or reject data policy requests.

## Developer: Request an environment

Developers (non-admins) can request new environments for their admin to triage.

1. Open the **Maker – Environment Request** app.
1. Select **+ New**.
1. In the fly-out menu, choose the desired connectors that you need in the new environment. Then select **Next**.

   :::image type="content" source="media/dev-resources-maker-connectors.png" alt-text="Screenshot showing the New Environment Creation Request panel where you choose connectors.":::

1. Choose the user accounts who need environment administrator access.

   :::image type="content" source="media/dev-resources-maker-admins.png" alt-text="Screenshot showing the New Environment Creation Request panel where you choose admins.":::

1. Provide basic details about the desired environment, including the display name, region, type, and purpose.

1. Indicate if the environment can be automatically cleaned up after a certain period of time.
    1. If yes, then provide a duration (in days) from the dropdown that appears. Use this option if you only need the environment for a short term project.
    1. If no, the environment isn't deleted automatically. Use this option if you need to keep the environment for a long time.

1. Indicate whether to provision a Dataverse database.

   :::image type="content" source="media/dev-resources-maker-env.png" alt-text="Screenshot showing the New Environment Creation Request screen where you provide environment details.":::

1. If you need a database (toggle=yes), provide the required language and currency values. Optionally, provide a security group to restrict access to the environment.

   :::image type="content" source="media/dev-resources-maker-db.png" alt-text="Screenshot showing the New Environment Creation Request pane where you choose language and currency settings.":::

1. Select **Save** to submit the form.

An email is sent to notify the CoE Starter Kit admins to review the new request.

Submitted requests are displayed in the canvas app.

:::image type="content" source="media/dev-resources-maker-pending.png" alt-text="Screenshot showing a single item in the My Pending Environment Creation Requests page.":::

## Admin: Approve or deny an environment request

As an admin, you can view and triage requests for new environments.

1. Open the canvas app called **Admin - Environment Request**.

1. View the Pending Environment Creation Requests.

    > [!TIP]
    > By default, pending requests are displayed first. You can change the request state filter by using the dropdown in the right side of the ribbon.

1. Select a request to view more details.

   :::image type="content" source="media/dev-resources-admin.png" alt-text="Screenshot showing a single item awaiting review in the Pending Environment Creation Requests.":::

1. Review the details requested for the new environment:

    1. Environment information, justification.
    1. Admins requested.
    1. View the requested security group, or add one if none was selected.
    1. Connectors.
    1. Impacting policies.
    1. Add comments about the decision in the Notes panel.

       :::image type="content" source="media/dev-resources-admin-details.png" alt-text="Screenshot showing details of the Environment request.":::

      > [!NOTE]
      > A banner on the top of the page indicates how the new environment is impacted based on the existing policies in the tenant. The impact analysis changes when policies are modified.

1. Modify data policies in the Impacted Policies table by selecting the suggested actions (if available).

   :::image type="content" source="media/dev-resources-admin-details-actions.png" alt-text="Screenshot showing a policy modification action.":::

   > [!WARNING]
   > You can only add certain types of policies (Organization-level environments that aren't "All Environments" type policies).

1. Select **View and modify policies** to see all policies and their impact on the requested connectors. You can add or remove policies to the modify list that you change upon approval by selecting a policy and choosing the actions that appear in the ribbon.

   :::image type="content" source="media/dev-resources-admin-policies.png" alt-text="Screenshot showing a list of policies.":::

1. Select a policy and select **Details** in the ribbon to view the impact on connectors.

   :::image type="content" source="media/dev-resources-admin-policy-details.png" alt-text="Screenshot showing details of the selected Marketing Policy.":::

1. Approve or reject the request in the top left ribbon.

   :::image type="content" source="media/dev-resources-admin-details-decision.png" alt-text="Screenshot showing Approve or Reject options.":::

### Approved path

When the request is approved, the system creates the environment with the requested configurations. The users are granted environment admin access.

#### ⏳ Expiration

If the environment has an expiration date, it's automatically deleted after the specified duration. Warning emails are sent to the admins weekly to remind them to save work in source control or other locations outside of the environment.

If no expiration is set, the environment won't be deleted automatically. The environment must be deleted manually in the Power Platform admin center.

## Data policy recommendation logic

The admin app uses the following logic to provide guidance on how to configure data policies to allow requested connectors.

### Decision matrix: Warning banner

This banner appears in the admin app when you view the request's details page.

| Condition | No policies apply to the environment | Existing policies apply to the environment without including it in any policy’s environment list. | Environment will be added to policies upon approval. |
|-|-|-|-|
| Unblocked |🟡 Connectors aren't blocked or restricted, but no policies protect the environment. Add the environment to at least one policy to prevent data loss.| 🟢 Connectors aren't blocked or restricted and the environment is covered by at least one existing policy. | 🟢 Connectors aren't blocked and the environment is added to selected policies when you approve the request.|
| Blocked | -- | ⛔ Connectors blocked by original policy configurations. Add environment to existing policy environment lists or modify policies in the Power Platform admin center to unblock connectors. | ⛔ Connectors blocked by current policy configurations. Add environment to different policies or modify policies in the Power Platform admin center to unblock connectors. |
| Restricted | -- | 🟡 Connectors restricted by original policy configurations. Add environment to existing policies’ environments lists or modify policies in the Power Platform admin center to unblock connectors. | 🟡 Connectors restricted by current policy configurations. Add environment to different policies or modify policies in the Power Platform admin center to unblock connectors. |

### Decision matrix: Policy-level recommended actions

Use the following matrix for recommended actions based on the policy and the requested connectors. Horizontal columns show each policy type, and vertical rows show the impact that policy has on the requested connectors based on its rules.

| Impact | All environments | Exclude certain environments | Include multiple environments |
|-|-|-|-|
| Not blocked or restricted | No action needed.<br><br>Requested connectors aren't blocked by this policy. This type of policy covers this new environment once created, so no action is needed. | Add policy if the new environment isn't covered. If it's covered, no action needed. | Requested connectors aren't blocked by this policy if added to its environment list. Add to this policy’s list if this environment will be added to another "Exclude certain environments" policy list that is affecting the requested connectors. |
| Blocked | Unblock allowed connectors in the policy’s definition in the Power Platform admin center. <br><br>⚠CAUTION: changing policies that affect "All environments" can potentially impact any canvas app and cloud flow in the tenant. Confirm impact in the DLP Editor tool.<br><br>If this policy's connector rules can't be changed, you can make an exception for this new environment by changing this policy to an "Exclude certain environments" type policy in the Power Platform admin center. Find or create a "Multiple environments" type policy that allows the requested connectors to add the environment to. Come back to this Environment Request Admin App record and add to the environments list of both policies. | Add to this policy or unblock the blocked connectors. <br><br>If there are no other policies covering the environment, add it to another existing or new "Multiple environments" policy that doesn't block the requested connectors.  | Don't add the new environment to this policy.<br><br>The environment only needs to be added to a "Multiple environments" type policy if it's not covered by other policies. For example, if there are no "All environment policies" and the environment is being excluded from all "Exclude except environments" type policies, no policies cover the environment.<br><br>If there are no better policies to add this environment to, consider updating this policy's connector groups, or create a new policy in the Power Platform admin center. |
| Restricted | Put the restricted connectors in the same group in the policy’s definition in the Power Platform admin center. <br><br>⚠CAUTION: changing "All environments" type policies can potentially impact any canvas app and cloud flow in the tenant.<br><br>If this policy’s connector rules can't be changed, you can make an exception for this new environment by changing this policy to an "Exclude certain environments" type policy in the Power Platform admin center. Find or create a "Multiple environments" type policy that has the requested connectors in the same group. Come back to this Environment Creation Request Admin App record and add to the environments list of both policies. | Add the environment to this policy’s exception list.<br><br>If you add this to the exception list and there are no other policies covering the environment, add it to another "Multiple environments" policy that won't restrict the acceptable requested connector(s), or create another policy to cover the most critical security requirements.<br><br>Consider if acceptable requested connectors can be unrestricted by updating this policy in the Power Platform admin center. <br><br>Caution: Make sure other environments excluded from this policy won't be negatively impacted by this change. | Don't add the new environment to this policy.<br><br>The environment only needs to be added to a "Multiple environments" type policy if it's being excluded from an "Exclude except environments" type policy and there are no other policies that cover the environment.<br><br>If no existing policies work, consider if updating this policy to include the requested connectors in the same group is an option. Make sure the other environments included in the environment list won't be negatively impacted. Go to the Power Platform admin center to update policy rules. |

## Developer: Request a data policy change

Makers can use the Data Policy Change Request system to modify the data loss prevention policy applied to environments where they're the administrator. If approved, this change enables the connectors you need in the environments you work in.

1. Open the **Maker – Environment Request** app.

1. Navigate to **Data Policy Change Requests** using the left navigation.

   :::image type="content" source="media/dlp-1.png" alt-text="Screenshot showing the Data Policy Change Requests screen.":::

1. Select **+ New**.

1. In the **Action Requested** field, choose the **Apply Policy to Environment** option.

1. In the **Policy** field, select the desired policy.

1. Confirm if the connectors required by your environment are in the policy by selecting the information icon next to **Policy**.

1. Choose the environment to apply this policy to. You can only select environments you're an administrator of.

   If you don't see any environments in the drop-down, then you don't have an environment administrator role to any environment.

1. Provide a reason for the request. For example, your project details and the connectors you need.

1. Select **Save** to submit the request.

If the administrator approves the request, the policy is applied to the environment.

## Admin: Approve or deny a data policy change request

> [!IMPORTANT]
> If you approve a Data Policy Change request in this system, it updates the status to **Approved**. This status change triggers a flow that automatically applies the selected policy to the indicated environment. The flow also removes the environment from all other policies that have an "include" environment scope, and adds the environment to all policies with an "exclude" environment scope. Before using the data policy request tooling, ensure this process fits with your setup.

### Configure shared policies

Configure [data policies](/power-platform/admin/wp-data-loss-prevention) in the Power Platform admin center.

> [!NOTE]
> Follow our best practices to create a [data policy strategy](/power-platform/guidance/adoption/dlp-strategy).

Example set of shared data policies that address different levels of groups:

- **Productivity** (Apply to all environments except): This policy covers the Default environment, trial environments, and all other environments that aren't covered by the other environments. It has the most restrictive rules.
- **Power User** (Apply to multiple environments): Available for individual environments with slightly less restrictive rules than Productivity.
- **Pro Dev** (Apply to multiple environments): Available for individual environments with access to most connectors compared to Power User. It's intended for trained users who agree to company data security policies, which must include an acknowledgment of liability for use.

### Sync shared policies

Since makers can't view all data policies, the request system makes this information visible to them via Dataverse. The system syncs the indicated policies from the Power Platform service to a Dataverse table, and makers can see the policies an admin permits them to view. Makers can request to apply those shared policies to their environments.

To make a shared data policy visible to makers, create the policy as a record in Dataverse.

1. Open the **Admin – Environment Request** app.

1. Navigate to **Data policies** in the left navigation.

1. Select the policy you want to make visible to makers, and then select the **Make visible** option in the ribbon.

:::image type="content" source="media/dlp-4.png" alt-text="Screenshot showing where to select a policy to make it visible to makers.":::

### Share app and instructions with makers

1. Grant your makers access to the **Maker – Environment Request** canvas app and assign them the **Power Platform Maker SR** security role. Use a Microsoft Entra group to make assignment easier.
1. Provide users with instructions on how to use the request system.

### Approve or reject requests

When users have access and start making requests, admins can see these requests in the **Admin – Environment Request** canvas app.

:::image type="content" source="media/dlp-5.png" alt-text="Screenshot showing DLP Policy Change Requests in the Admin Environment Request app.":::
 
To view and respond to the DLP Policy Change Requests:

1. Open the **Admin – Environment Request** app.

1. Navigate to **Policy Change Requests**  using the left navigation.

1. View the list of requests. You can filter the request by status by using the status filter in the right side of the ribbon.

   :::image type="content" source="media/dlp-6.png" alt-text="Screenshot showing the filter options for viewing the list of requests.":::

1. To view the request in more detail, select one of the requests and select the **Details** action in the ribbon.

1. To approve or deny a request, filter the status to “Pending” and select one of the requests. Only requests with pending status can be responded to in the app.

1. Choose to “approve” or “reject” the selected request using the actions in the ribbon.

    - If you approve a request, the app updates the status to “Approved.” This update triggers a flow that automatically applies the selected policy to the indicated environment. The flow also removes the environment from all other policies that have an “include” environment scope and adds the environment to all policies with an “exclude” environment scope. Make sure this behavior fits with your company’s security requirements before continuing. When the automation completes, the request status is set to “Fulfilled” and the record is deactivated.

    - If you reject the request, the app sets the status to “Rejected” and deactivates the record.
