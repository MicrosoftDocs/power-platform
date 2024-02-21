---
title: "Share and collaborate on copilots with other users (contains video)"
description: "Share Microsoft Copilot Studio copilots with other users, assign security roles, and work together."
keywords: "Administration, share, multi-author, PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: micchow
ms.custom: "multi-author, admin, ceX"

---

# Share your copilot with other users

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can share your copilots with others to grant them special permissions. There are two different sharing methods:

1. Grant security groups, or your whole organization, permission to chat with the copilot.
1. Invite users to collaborate on your copilot project. Collaborators always have permission to chat with the copilot.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-copilot-studio.md).
- The copilot's [end user authentication setting](configuration-end-user-authentication.md) must be configured to **Only for Teams** or **Manual**, with **Azure Active Directory** or **Microsoft Entra ID** as the provider. **Required user sign-in** must be enabled to manage who can chat with the copilot in your organization.

# [Web app](#tab/web)

### Share a copilot for chat

Copilot makers that you've [shared your copilot with for collaborative authoring](#share-a-copilot-for-collaborative-authoring) always have permission to chat with the copilot. However, you can also grant users permission to chat with the copilot without granting them authoring permissions.

To grant users permission to only chat with the copilot, you can either:

- Share your copilot with a security group.
- Share your copilot with everyone in your organization.

### Share copilot with security groups

You can share your copilot with security groups so their members can chat with the copilot.

1. Select **Share** at the top of the copilot's overview page.

    :::image type="content" source="media/admin-share-bots/sharing-home.png" alt-text="Sharing UI entry point in copilot homepage." border="false":::

1. Specify the security group name that you would like to share the copilot with.

    > [!NOTE]
    > When sharing a copilot for _chat_, you can only share a copilot with security groups. You can't share it with:
    >
    > - Microsoft 365 groups.
    > - Individual users directly. To manage individual user access, add or remove users from the security group.

    :::image type="content" source="media/admin-share-bots/sharing-bot-specify-security-group.PNG" alt-text="Specify security group in Sharing UI":::

1. Review the security group's permission.

    :::image type="content" source="media/admin-share-bots/sharing-review-sg-permission.PNG" alt-text="Review security group permission in Sharing UI.":::

1. If you want to let users know you've shared the copilot with them, select the **Send an email invitation to new users** checkbox.

    > [!NOTE]
    > Only security groups with email enabled will receive an email invitation. You can [copy the link for the Demo website](publication-connect-bot-to-web-channels.md) and share it with users directly so they can chat with the copilot.

1. Select **Share** to share the copilot with the new security groups.

### Share copilot with everyone in the organization

You can share your copilot to allow everyone in the same organization the copilot to chat with it.

1. Select **Share** at the top of the copilot's overview page.

1. Select **Everyone in _your organization's name_**.

1. Select **User - can use the copilot** option.

   :::image type="content" source="media/admin-share-bots/sharing-share-everyone-in-org.PNG" alt-text="Set user permission for everyone in the organization in Sharing UI.":::

   > [!NOTE]
   > Microsoft Copilot Studio will not send email invitations to everyone in the organization. You can [copy the link for the Demo website](publication-connect-bot-to-web-channels.md) and share it with users directly so they can chat with the copilot.

1. Select **Share** to share the copilot with everyone in the organization.

### Stop sharing copilot

You can stop sharing the copilot with a security group or everyone in your organization.

#### Stop sharing with a security group

1. Select **Share** at the top of the copilot's overview page.

1. Select **X** next to the security groups that you want to stop sharing the copilot with.

    :::image type="content" source="media/admin-share-bots/sharing-unshare-sg.PNG" alt-text="Unshare security group in Sharing UI.":::

1. Select **Share** to stop sharing the copilot with the security groups.

#### Stop sharing with everyone in the organization

1. Select **Share** on the copilot's overview page.

1. Select **Everyone in _your organization's name_**.

1. Select **None** option.

    :::image type="content" source="media/admin-share-bots/sharing-unshare-everyone-in-org.PNG" alt-text="Unshare everyone in the organization in Sharing UI.":::

1. Select **Share** to stop sharing the copilot with everyone in the organization.

1. Select **Share** to stop sharing the copilot with everyone in the organization.

## Share a copilot for collaborative authoring

Individual users that you share a copilot with can view, edit, configure, share, and publish the copilot. They can't delete the copilot.

>
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4DdcM]
>

> [!NOTE]
> You can only share a copilot with users who have a Microsoft Copilot Studio per user license. Users who don't have a license can [sign up for a free trial](sign-up-individual.md).

1. To share a copilot, sign in to Microsoft Copilot Studio and select **Share** at the top of the copilot's overview page.

    :::image type="content" source="media/admin-share-bots/sharing-home.png" alt-text="Microsoft Copilot Studio copilot overview page with the Share button highlighted." border="false":::

1. Specify the name or email address of each user that you would like to share the copilot with.  

    > [!NOTE]
    > When sharing a copilot for _collaborative authoring_, you can only share it with individual users. You can't share it with:
    >
    > - A security group in your organization.
    > - Distribution group in your organization.  
    > - Users or groups outside of your organization.  

    :::image type="content" source="media/admin-share-bots/sharing-input-invitee.png" alt-text="Screenshot showing name input in the share window." border="false":::

1. Review the user's permissions.

    :::image type="content" source="media/admin-share-bots/sharing-view-permission.png" alt-text="Screenshot showing share window with user permissions." border="false":::

1. If you want to let users know you've shared the copilot with them, select the **Send an email invitation to new users** checkbox.

1. Select **Share** to share the copilot with the new users.

> [!IMPORTANT]
> It can take up to 10 minutes for the copilot to show up in the shared user's copilot list if the user [was not previously part of the environment](#assign-environment-security-roles) of the shared copilot.

### Insufficient environment permissions

Users in the environment must have the **Environment maker** security role before a copilot can be shared with them.

:::image type="content" source="media/admin-share-bots/sharing-insufficient-permission.png" alt-text="User doesn't have sufficient permissions." border="false":::

**System administrators** of the environment need to assign the **Environment maker** security role to the user before you share the copilot. If you're a **System administrator**, you can [assign the **Environment maker** role when you share the copilot](#assign-environment-security-roles).

Learn more about [security roles](/power-platform/admin/security-roles-privileges) and [predefined security roles](/power-platform/admin/database-security#predefined-security-roles).

### Share Power Automate flows used in a copilot

You can [add actions to a copilot using flows in Power Automate](advanced-flow.md); however flows in a copilot aren't automatically shared with other users when sharing a copilot.

Users who don't have access to the shared flow can still run it by using the test copilot canvas.

To let other users edit or add flows, you need to share them in Power Automate. You can open flows directly from the topic where the flow is used.

1. Select **View flow details** to go to the flow's details page in Power Automate.

    :::image type="content" source="media/admin-share-bots/sharing-view-flow-details.png" alt-text="Highlight of the view flow details on a flow in a topic." border="false":::

1. Select **Edit** in the **Owners** section.

    :::image type="content" source="media/admin-share-bots/sharing-flow-owners.png" alt-text="Select the Edit link." border="false":::

1. Enter the name or email address of the user you want to give editing permissions to.

### Stop sharing a copilot

You can stop sharing a copilot with a user, and any shared user can stop the copilot from being shared with other users, except for the owner. The owner always has access to the copilot.

1. Sign in to Microsoft Copilot Studio and select **Share** at the top of the copilot's overview page.

1. Select **X** next to the users that you want to stop sharing the copilot with.

    :::image type="content" source="media/admin-share-bots/sharing-remove-user.png" alt-text="Remove copilot access 'X'." border="false":::

1. Select **Share** to stop sharing the copilot with the user.

## Assign environment security roles

If you're a **System administrator**, you can assign and manage environment security roles when sharing a copilot.

The **Environment security roles** section shows when you share a copilot and only if you're a **System administrator**. It lets you share copilots with users who don't have sufficient environment permissions to use Microsoft Copilot Studio.

You must be a **System administrator** of the environment where the copilot is located to view and add security roles.

> [!NOTE]
> You can only _assign_ security roles when sharing a copilot. You can't remove security roles when sharing. For full security role management, [use the Power Platform admin center](/power-platform/admin/create-users-assign-online-security-roles#assign-a-security-role-to-a-user).  
>
> Learn more about [security roles](/power-platform/admin/security-roles-privileges) and [predefined security roles](/power-platform/admin/database-security#predefined-security-roles).

### Assign the Environment maker security role during copilot sharing

You can assign the **Environment maker** security role when sharing a copilot with a user who doesn't have sufficient environment permissions to run Microsoft Copilot Studio.

When [sharing the copilot for chat](#share-a-copilot-for-chat), if the specified user doesn't have sufficient permissions to use Microsoft Copilot Studio in the environment, you are notified that the **Environment maker** security role is assigned to the user so they can use the copilot.

:::image type="content" source="media/admin-share-bots/sharing-input-invitee-no-permission.png" alt-text="Share panel with permission notice bubble." border="false":::

### Assign the Copilot transcript viewer security role during copilot sharing

You can assign the **Copilot transcript viewer** security role to users who don't have conversation transcript access when sharing a copilot.

Based on the content and target audience of the copilot, you may want to give transcript access only to users who have appropriate privacy training.

> [!IMPORTANT]
> Conversation transcript access is managed by environment security roles. After assigning the **Copilot transcript viewer** security role to a user, that user can access conversation transcripts for all copilots that they create or are shared with in the environment.  
>
> In the default environment, every user has the **Copilot transcript viewer** role assigned by default. We recommend you create an environment for copilots that controls which user can view conversation transcripts. Learn more about how to [Create a new environment for your copilots](./environments-first-run-experience.md#create-a-new-environment-for-your-copilots)

When [sharing the copilot for chat](#share-a-copilot-for-chat), you can assign the **Copilot transcript viewer** role by selecting the checkbox.

:::image type="content" source="media/admin-share-bots/sharing-assign-transcript-viewer.png" alt-text="Share panel with Copilot transcript viewer role selected." border="false":::

### Manage security roles

You can [manage environment security roles at the Power Platform admin center](/power-platform/admin/database-security#assign-security-roles-to-users-in-an-environment-that-has-a-common-data-service-database).


# [Teams](#tab/teams)

Share your copilot with other users so they can chat with the copilot or collaborate together to author it.

### Share copilots for users to chat with

A user can always chat with a copilot if it was created in the same team. You can share copilots with users outside of the team with the **Share** options available in Microsoft Copilot Studio.


### Share copilot with security groups

You can share your copilot with security groups so their members can chat with the copilot.

1. Select **Share** at the top of the copilot's overview page.

    :::image type="content" source="media/admin-share-bots/sharing-bot-homepage-teams.PNG" alt-text="Sharing UI entry point in copilot overview page.":::

1. Specify the security group name that you would like to share the copilot with.

    > [!NOTE]
    > You can only share a copilot with security groups. You can't share with individual users directly.  
    >
    > You can manage individual user access by adding or removing users from the security group.
    >
    > To make a security-enabled group, please refer to [Microsoft Graph documentation](/graph/api/resources/groups-overview#security-groups-and-mail-enabled-security-groups).

    :::image type="content" source="media/admin-share-bots/sharing-bot-specify-security-group-teams.PNG" alt-text="Specify security group in Sharing UI.":::

1. Review the security group's permissions.

    :::image type="content" source="media/admin-share-bots/sharing-review-sg-permission-teams.PNG" alt-text="Review security group permission in Sharing UI.":::

1. If you want to let users know you've shared the copilot with them, select the **Send an email invitation to new users** checkbox.

    > [!NOTE]
    > Only security groups with email enabled receive an email invitation. You can directly **Copy link** and share it with users to install the copilot in Microsoft Teams.

1. Select **Share** to share the copilot with the security group.

### Share copilot with everyone in the organization

You can share your copilot to allow everyone in the same organization as the copilot to chat with it.

1. Select **Share** at the top of the copilot's overview page.

1. Select **Everyone in _your organization's name_**.

1. Select **User - can use the copilot** option.

    :::image type="content" source="media/admin-share-bots/sharing-share-everyone-in-org-teams.PNG" alt-text="Set user permission for everyone in the organization in Sharing UI.":::

    > [!NOTE]
    > Microsoft Copilot Studio will not send an email invitation to everyone in the organization. You can directly **Copy link** and share it with users to install the copilot in Microsoft Teams.

1. Select **Share** to share the copilot with everyone in the organization.

### Stop sharing the copilot

You can stop sharing the copilot with a security group or everyone in your organization.

> [!NOTE]
> When you stop sharing a copilot, affected users can't access the copilot after their current conversation has timed out (after 30 minutes of idle time).

### Stop sharing with a security group

1. Select **Share** at the top of the copilot's overview page.

1. Select **X** next to the security groups that you want to stop sharing the copilot with.

    :::image type="content" source="media/admin-share-bots/sharing-unshare-sg-teams.PNG" alt-text="Unshare security group in Sharing UI.":::

1. Select **Share** to stop sharing the copilot with the security groups.

### Stop sharing with everyone in the organization

1. Select **Share** on the copilot's overview page.

1. Select **Everyone in _your organization's name_**.

1. Select **None** option.

    :::image type="content" source="media/admin-share-bots/sharing-unshare-everyone-in-org-teams.PNG" alt-text="Unshare everyone in the organization in Sharing UI.":::

1. Select **Share** to stop sharing the copilot with everyone in the organization.

## Share copilots to collaborate with others

You can collaborate with others when building copilots in Microsoft Teams. This means other members of your team can make edits and changes, and you can see who else is editing a topic.

Your permissions are determined by your [Microsoft Teams roles](/microsoftteams/assign-roles-permissions) in the team where your copilot is created:

- Team Owners can create, view, edit, and configure all copilots in the team where they're Team Owners.
- Team Members can create, edit, and configure copilots they have created. They can view other member's copilots in the team.

> [!NOTE]
> If you are an owner of an Microsoft Entra ID group associated with a team, but you are not also a member of that group, you might not see the team in the Power Apps and Microsoft Copilot Studio apps in Microsoft Teams.
>
> You can add yourself as a member to the team and it will resolve the issue after a few minutes.

To share your copilot with other users for collaboration, you need to [add them to your team](https://support.microsoft.com/office/add-members-to-a-team-in-teams-aff2249d-b456-4bc3-81e7-52327b6b38e9).

> [!NOTE]
> It could take up to 15 minutes before the new team member sees the team in the Microsoft Copilot Studio app.

You can see a list of the teams you belong to, and each copilot within that team by going to the **Copilots** tab on the top bar. Teams are listed on the left; selecting a team shows the copilots in that team. Where ever you are in the app, you can always get back to the list of copilots by selecting **Copilots** at the top.

> [!TIP]
> **My copilots** shows all the copilots you created and is an easy way for you to find your copilot across multiple teams. You can find copilots created by other team members by selecting the team.

:::image type="content" source="media/admin-share-bots/admin-share-bots-list.png" alt-text="The teams and copilots are listed in the Copilots tab.":::

You can open copilots for editing by selecting the copilot's name.

If you select the check mark next to the copilot's name, you can go straight to the Topics or Analytics page for that copilot. You can also select **Edit** to go to the copilot's overview page.

:::image type="content" source="media/admin-share-bots/admin-share-bots-edit.png" alt-text="The Topics and Analytics buttons appear when a copilot is selected.":::

If you select the menu icon next the copilot's name you can then select **Edit** to go to the copilot's overview page, or go to the Topics or Analytics pages.

:::image type="content" source="media/admin-share-bots/admin-share-bots-hamburger.png" alt-text="The copilot's menu lets you edit details, topics, and see analytics":::

If you rename, restore, or delete a team, it could take up to 2 hours for the changes to be reflected in the Microsoft Copilot Studio app.

---

## Data permissions

To make sure users who chat with your copilot can run [Power Automate](advanced-flow.md) flows correctly, you should test your copilot to make sure their permissions with the integrated systems are configured correctly.

## Collaborate on copilots

After you've shared a copilot, everyone can edit the copilot's topics.

In the **Topics** list, you can see who's working on a topic under the **Editing** column. You can select the person's icon to quickly chat with them in Teams or send them an email.

This list can help prevent conflicts if multiple people are working on the same topic.

:::image type="content" source="media/admin-share-bots/sharing-multi-authors.png" alt-text="Screenshot showing the Microsoft Copilot Studio list of topics with the Currently editing column highlighted.":::

> [!NOTE]
> The list of authors in the **Currently editing** column is only refreshed when the page is loaded.

A list of who's editing the page also appears as user icons on the top of the authoring canvas when you've opened a topic for editing.

:::image type="content" source="media/admin-share-bots/sharing-multi-editing.png" alt-text="Screenshot of a topic being edited with user profile pictures appearing on the top menu bar.":::

If an author doesn't make any changes to the topic, disconnects their computer, or closes the browser window, they're considered to have abandoned the topic. After 30 minutes of inactivity, the user isn't identified as editing the topic.

Occasionally, multiple people might make changes to a topic and attempt to save their changes concurrently. For example, you might open and start editing a topic. Your coworker opens the same topic, makes a small change, and saves it. Then, when you've finished editing the topic, you go to save it, only to find yourself in a conflict state.

Microsoft Copilot Studio detects this and prevents you from overwriting your coworker by prompting you with an option: you can reload the content with the latest changes (discarding your work), or you can save a copy of the topic (keeping your changes in a new, duplicate copy of the topic).

:::image type="content" source="media/admin-share-bots/sharing-multi-conflict.png" alt-text="Screenshot showing a prompt that says Updated content available and gives you options to discard your changes or save a copy." border="false":::

If you save your changes to a new topic, you can then review your coworker's changes and merge the two topics, deleting the copy of the topic once you've finished.
