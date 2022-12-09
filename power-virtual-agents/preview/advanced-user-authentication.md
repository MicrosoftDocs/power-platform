---
title: "Add user authentication to chatbot topics (preview)"
description: "Insert user authentication into a topic to allow your users to sign in directly within a conversation in Power Virtual Agents preview."
keywords: "User Authentication, Authentication, AAD, MSA, Identity Provider, PVA"
ms.date: 10/11/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: kamrani
ms.custom: authentication, ceX
ms.collection: virtual-agent
---

# Add user authentication (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

Enable user authentication to access user variables on the authoring canvas. You can use these variables to personalize the conversation for the user, or access back-end systems on the user's behalf.

## Prerequisites

- [Use variables](authoring-variables.md).
- [Configure user authentication](configuration-end-user-authentication.md).

## Configure manual authentication with Azure AD

Before using authentication in your topics, you'll first need to configure user authentication with Azure AD.

1. Follow the instructions in [Configure user authentication with Azure AD](configuration-authentication-azure-ad.md).
1. Return to this article.

## Add user authentication with the Signin system topic

When you create a bot, Power Virtual Agents automatically adds a system topic called **Signin**.

:::image type="content" source="media/advanced-user-authentication/system-topic.png" alt-text="Screenshot showing sign in topic.":::

To trigger this topic, you must turn on **Require users to sign in**:

1. In the navigation menu under **Settings**, select **Security**.

1. Select the **Authentication** tile.

1. Turn on **Require users to sign in**.

    :::image type="content" source="media/advanced-user-authentication/require-signin.png" alt-text="Screenshot of the Require users to sign in option turned on.":::

When the user first starts the conversation with the bot, the **Signin** topic will be triggered, prompting the user to sign in.

:::image type="content" source="media/advanced-user-authentication/sign-in-card.png" alt-text="Screenshot of the sign in prompt.":::

You can customize the **Signin** topic to add additional logic or message nodes that are appropriate for your bot.

## Add user authentication with a custom topic

If you don't want to authenticate the user at the beginning of the conversation, you can add an Authenticate node to any custom topic.

Once the user enters their username and password in the prompt, they might be prompted to enter a validation code. After a user has logged in, they won't be prompted again, even if they reach another Authenticate node.

To add an Authenticate node to a custom topic:

1. In the navigation menu under **Settings**, select **Security**.

1. Select the **Authentication** tile.

1. Turn off **Require users to sign in**.

1. In the navigation menu, select **Topics**.

1. Open the topic you want to add the authentication to.

1. Select **Add node** (**+**), select **Call an action**, and then select **Authenticate**.

    :::image type="content" source="media/advanced-user-authentication/auth-node.png" alt-text="Screenshot of the authenticate option in the add node menu.":::

1. [Test your topic](authoring-test-bot.md) using a user configured with your identity provider.

> [!TIP]
> It's important that you create paths for both sign-in success and failure. A user may fail to sign in for many reasons, including errors with the identity provider's sign-in experience.

## Authentication variables

When user authentication is configured, you'll have access to authentication variables in your topics. The following table compares the availability of these variables based on authentication option:

| Authentication Variable | No Authentication | Only for Teams | Manual |
| ----------------------- | :---------------: | :------------: | :----: |
| [User.DisplayName][1]   |                   |                |   ✓    |
| [User.Id][2]            |                   |                |   ✓    |
| [User.IsLoggedIn][3]    |                   |                |   ✓    |
| [User.AccessToken][4]   |                   |                |   ✓    |
| [SignInReason][5]       |                   |                |   ✓    |

[1]: #userdisplayname
[2]: #userid
[3]: #userisloggedin
[4]: #useraccesstoken
[5]: #signinreason

### User.DisplayName

> [!WARNING]
> This variable isn't guaranteed to contain a value. Test with a user from your identification provider to ensure your topic works correctly.

The `User.DisplayName` variable contains the user's display name stored in the identity provider. Use this variable to greet or refer to the user without them having to explicitly tell it to the bot, making it more personalized.

Power Virtual Agents automatically sets the value of `User.DisplayName` based on the claim from the identity provider:

- For Azure Active Directory (Azure AD), the value is obtained from the `name` claim.
- For OAuth providers, the value is obtained from the `name` claim.

Power Virtual Agents won't be able to obtain this value if the `profile` scope isn't defined when configuring manual user authentication. For more information, see [Configure manual authentication with Azure AD](#configure-manual-authentication-with-azure-ad).

### User.Id

> [!WARNING]
> This variable isn't guaranteed to contain a value. Test with a user from your identification provider to ensure your topic works correctly.

The `User.Id` variable contains the user's ID stored in the identity provider. Use this variable in [Power Automate flows](advanced-flow.md) to call APIs that take the UserID as a value.

Power Virtual Agents automatically sets the value of `User.DisplayName` based on the claim from the identity provider:

- For Azure Active Directory (Azure AD), the value is obtained from the `sub` claim.
- For OAuth providers, the value is obtained from the `sub` claim.

### User.IsLoggedIn

`User.IsLoggedIn` is a boolean-type variable containing the signed-in status of the user. A value of `true` indicates the user is signed in and a value of `false` indicates they aren't.

You can use this variable to create branching logic in your topics that checks for a successful sign-in, or to opportunistically fetch user information only if the user is signed in.

### User.AccessToken

> [!WARNING]
> Make sure you're passing the `User.AccessToken` variable only to trusted sources. It contains user authentication information, which, if compromised, could harm the user.

The `User.AccessToken` variable contains the user's token, obtained after the user is signed in. You can pass this variable to [Power Automate flows](advanced-flow.md) so they can connect to back-end APIs and fetch user information, or to take actions on the user's behalf.

Don't use `User.AccessToken` inside **Message** nodes, or on flows that you don't trust.

### SignInReason

`SignInReason` is a choice-type variable that indicates when the user must sign in. It has two possible values:

- `SignInRequired` indicates the user must sign in at the beginning of the conversation using the **Sign in** system topic. This is only possible when **Require users to sign in** is turned on.

- `Initializer` indicates that if the user hasn't signed in yet, and they reach a point in the conversation that uses authentication variables, they'll be prompted to sign in.

## Related links

You can also configure single sign-on (SSO) so your users don't need to sign in manually. For more information, see [Configure SSO for web](configure-web-sso.md).
