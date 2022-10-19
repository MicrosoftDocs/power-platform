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

You can enable user authentication directly within a Power Virtual Agents bot conversation. User authentication means you can get a user's basic properties such as name and ID in bot variables, but also prompt a user to sign in using an authentication node, retrieve a user token for that user, and then use that token to retrieve the user's information from a back-end system.

## Prerequisites

- [Use variables](authoring-variables.md)

## Configure manual authentication with Azure AD

<!-- FIXME: are other authentication options not supported in public preview? -->
Before using authentication in your topics, you'll first need to configure user authentication with Azure AD. To learn more about configuring user authentication, see [Configure user authentication](configuration-end-user-authentication.md).

During this process, you'll create an app registration which you'll use for authentication:

1. Create an app registration.
1. Add the redirect URL.
1. Generate a client secret.
1. Configure API Permissions.
1. Define a custom scope for your bot.
1. Configure manual authentication in Power Virtual Agents.

Follow the instructions in [Configure user authentication with Azure AD](configuration-authentication-azure-ad.md) then return to this article.

## Add user authentication with the Signin system topic

When you create a bot, Power Virtual Agents automatically adds a system topic called **Signin**.

:::image type="content" source="media/advanced-user-authentication/system-topic.png" alt-text="Screenshot showing sign in topic.":::

To trigger this topic, you must turn on **Require users to sign in**:

1. In the side pane, under **Settings**, select **Security**.

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

1. In the side pane, under **Settings**, select **Security**.

1. Select the **Authentication** tile.

1. Turn off **Require users to sign in**.

1. In the side pane, select **Topics**.

1. Open the topic you want to add the authentication to.

1. Select **Add node** (**+**), select **Call an action**, and then select **Authenticate**.

1. [Test your topic](authoring-test-bot.md) using a user configured with your identity provider.

> [!TIP]
> It's important that you create paths for both sign-in success and failure. A user may fail to sign in for many reasons, including errors with the identity provider's sign-in experience.

## Authentication variables

When user authentication is configured, you'll have access to authentication variables in your topics. The following table compares the availability of these variables based on authentication option:

<!-- FIXME: User.Id and User.DisplayName were previously supported in Only For Teams. Has this changed? -->
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

The `User.DisplayName` variable contains the user's display name stored in the identity provider. You can use this variable to greet or refer to the end user without them having to explicitly tell it to the bot, making it more personalized.

This field value is obtained from the Azure Active Directory (Azure AD) `name` claim. For OAuth providers, this is the value stored in the `name` claim. Power Virtual Agents automatically extracts this field into the variable, so ensure you have `profile` as part of your authentication scope setup.

### User.Id

The `User.Id` variable contains the user's ID stored in the identity provider. This value can be used by Power Automate flows to call APIs that take the UserID as a value.
This field value is obtained from the Azure AD `sub` claim. For OAuth providers, this is the value stored in the `sub` claim. Power Virtual Agents automatically extracts this field into the variable.

> [!WARNING]
> The `User.DisplayName` and `User.Id` variables are not guaranteed to be filled, and might be empty strings depending on the user configuration in the identity provider. Test with a user from your identification provider to ensure your topics work correctly, even if these variables are empty.

### User.IsLoggedIn

The `User.IsLoggedIn` variable indicates whether the user is signed in (either as a result of signing in or already being signed in, also known as the log-in success path) or not signed in (which would result in the log-in failure path).

`User.IsLoggedIn` is a boolean-type variable containing the signed-in status of the user. You can use this variable to create branching logic in your topics that checks for a successful sign-in (for example, in the template already provided as part of adding the **Authenticate** node), or to opportunistically fetch user information only if the user is signed in.

### User.AccessToken

The `User.AccessToken` variable contains the user's token, obtained after the user is signed in. You can pass this variable to [Power Automate flows](advanced-flow-input-output.md) so they can connect to back-end APIs and fetch the user's information, or to take actions on the user's behalf.

> [!WARNING]
> Make sure you're passing the `User.AccessToken` variable only to trusted sources. It contains user authentication information, which, if compromised, could harm the user.

Don't use `User.AccessToken` inside **Message** nodes, or on flows that you don't trust.

### SignInReason

The `SignInReason` variable indicates whether the user must sign in at the beginning of the conversation with the bot or not. If **Require users to sign** in is enabled in the authentication setting, the value of `SignInReason` is set to `SignInRequired` - this lets the bot prompt the user to sign in at the beginning using the **Sign in** system topic. Otherwise, you can use the authenticate node in any topic to prompt the user to sign in. For details, see Add user authentication to a topic section below. The `SignInReason` is set to `Initializer` if the user has not signed in and they try to use the system variables - this indicates that authentication needs to occur.

## Related links

You can also configure single sign-on (SSO) so your users don't need to sign in manually. For more information, see [Configure SSO for web](configure-sso.md).
