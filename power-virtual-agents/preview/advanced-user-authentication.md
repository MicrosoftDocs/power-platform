---
title: Add user authentication to a topic (preview)
description: Add user authentication to a topic to allow customers to sign in directly in a chatbot conversation in Power Virtual Agents preview.
keywords: "User Authentication, Authentication, AAD, MSA, Identity Provider, PVA"
ms.date: 3/09/2023

ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: kamrani
ms.custom: authentication, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# Add user authentication to a topic (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

Enable user authentication to access user variables on the authoring canvas. You can then personalize the conversation with user variables and access back-end systems on the user's behalf.

## Prerequisites

- [Use variables](authoring-variables.md)
- [Configure user authentication](configuration-end-user-authentication.md)

## Configure manual authentication with Azure AD

To use authentication in your topics, configure user authentication with Azure AD.

1. Follow the instructions in [Configure user authentication with Azure AD](configuration-authentication-azure-ad.md).
1. Return to this article.

## Add user authentication with the Sign in system topic

When you create a bot, Power Virtual Agents automatically adds a system topic called **Sign in**.

:::image type="content" source="media/advanced-user-authentication/system-topic.png" alt-text="Screenshot showing sign in topic.":::

To trigger this topic, you must turn on **Require users to sign in**:

1. In the navigation menu, under **Settings**, select **Security**.

1. Select the **Authentication** tile.

1. Select **Manual (for custom website)**, and then select **Require users to sign in**.

    :::image type="content" source="media/advanced-user-authentication/require-signin.png" alt-text="Screenshot of the Power Virtual Agents Authentication page with Require users to sign in selected and highlighted.":::

When the user first starts the conversation with the bot, the **Sign in** topic will be triggered, prompting the user to sign in.

:::image type="content" source="media/advanced-user-authentication/sign-in-card.png" alt-text="Screenshot of the sign-in prompt.":::

You can customize the **Sign in** topic to add additional logic or message nodes that are appropriate for your bot.

## Add user authentication with a custom topic

If you don't want to authenticate the user at the beginning of the conversation, you can add an **Authenticate** node to any custom topic.

When customers enter their username and password, they might be prompted to enter a validation code. After they've logged in, they won't be prompted again, even if they reach another **Authenticate** node.

To add an Authenticate node to a custom topic:

1. In the navigation menu under **Settings**, select **Security**.

1. Select the **Authentication** tile.

1. Turn off **Require users to sign in**.

1. In the navigation menu, select **Topics**, and then open the topic you want to add authentication to.

1. Select **Add node** (**+**), select **Call an action**, and then select **Authenticate**.

    :::image type="content" source="media/advanced-user-authentication/auth-node.png" alt-text="Screenshot of the authenticate option in the add node menu.":::

1. [Test your topic](authoring-test-bot.md) with a user configured with your identity provider.

> [!TIP]
> It's important that you create paths for both a successful sign-in and failure to sign in. A sign-in may fail for many reasons, including errors with the identity provider's sign-in experience.

## Authentication variables

When you've configured user authentication for your bot, you can use authentication variables in your topics. The following table compares the availability of these variables based on the authentication option you chose.

| Authentication Variable | No Authentication | Only for Teams | Manual    |
|-------------------------|:-----------------:|:--------------:|:---------:|
| [User.DisplayName][1]   | not available     | not available  | available |
| [User.Id][2]            | not available     | not available  | available |
| [User.IsLoggedIn][3]    | not available     | not available  | available |
| [User.AccessToken][4]   | not available     | not available  | available |
| [SignInReason][5]       | not available     | not available  | available |

[1]: #userdisplayname
[2]: #userid
[3]: #userisloggedin
[4]: #useraccesstoken
[5]: #signinreason

### User.DisplayName

> [!WARNING]
> This variable isn't guaranteed to contain a value. Test with a user from your identity provider to ensure your topic works correctly.

The `User.DisplayName` variable contains the display name that's stored in the identity provider. Use this variable to greet or refer to the user without their having to explicitly give their name to the bot, making the conversation more personalized.

Power Virtual Agents automatically sets the value of `User.DisplayName` from the `name` claim provided by the identity provider, as long as the `profile` scope was defined when manual authentication was configured. For more information about scope, see [Configure manual authentication with Azure AD](#configure-manual-authentication-with-azure-ad).

### User.Id

> [!WARNING]
> This variable isn't guaranteed to contain a value. Test with a user from your identity provider to ensure your topic works correctly.

The `User.Id` variable contains the userID that's stored in the identity provider. Use this variable in [Power Automate flows](advanced-flow.md) to call APIs that take the UserID as a value.

Power Virtual Agents automatically sets the value of `User.DisplayName` from the `sub` claim provided by the identity provider.

### User.IsLoggedIn

`User.IsLoggedIn` is a boolean-type variable that stores the user's sign-in status. A value of `true` indicates the user is signed in. You can use this variable to create branching logic in your topics that checks for a successful sign-in, or to fetch user information only if the user is signed in.

### User.AccessToken

> [!WARNING]
> Make sure you're passing the `User.AccessToken` variable only to trusted sources. It contains user authentication information, which, if compromised, could harm the user.

The `User.AccessToken` variable contains the user's token, obtained after the user is signed in. You can pass this variable to [Power Automate flows](advanced-flow.md) so they can connect to back-end APIs and fetch user information, or to take actions on the user's behalf.

Don't use `User.AccessToken` in **Message** nodes or in flows that you don't trust.

### SignInReason

`SignInReason` is a choice-type variable that indicates when the user must sign in. It has two possible values:

- `SignInRequired` indicates the user must sign in at the beginning of the conversation using the **Signin** system topic. [**Require users to sign in** must be turned on](#add-user-authentication-with-the-sign-in-system-topic).

- `Initializer` indicates that if the user hasn't signed in yet, and they reach a point in the conversation that uses authentication variables, they'll be prompted to sign in.

## Related links

You can also configure single sign-on (SSO) so your users don't need to sign in manually. For more information, see [Configure SSO for web](configure-web-sso.md).
