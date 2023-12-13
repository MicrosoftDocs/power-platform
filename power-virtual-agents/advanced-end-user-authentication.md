---
title: "Add user authentication to chatbot topics"
description: "Insert user authentication into a topic to allow your users to sign in directly within a conversation."
keywords: "User Authentication, Authentication, Microsoft Entra ID, MSA, Identity Provider, PVA"
ms.date: 12/13/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: clmori
ms.custom: authentication, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Add end-user authentication to a Microsoft Copilot Studio bot

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can enable user authentication directly within a Microsoft Copilot Studio bot conversation. User authentication means you can get a user's basic properties such as name and ID in bot variables, but also prompt a user to sign in using an authentication node, retrieve a user token for that user, and then use that token to retrieve the user's information from a back-end system.

>[!NOTE]
> Bots created in the web app and in Microsoft Teams come with authentication pre-configured to use **Only for Teams and Power Apps** authentication.

You can also configure single sign-on (SSO) so your users don't need to sign in manually. For more information, see [Configure SSO for web](configure-sso.md).

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- [Use variables](authoring-variables.md)
- [Configure end-user authentication](configuration-end-user-authentication.md).


# [Web app](#tab/web)

Add user authentication to a topic to allow your customers to sign in right in the conversation. You can then personalize the conversation with user variables and access back-end systems on the user's behalf.

### Configure manual authentication with Microsoft Entra ID

You need to configure user authentication with Microsoft Entra ID before you can use authentication in your topics.

1. Follow the instructions in [Configure user authentication with Microsoft Entra ID](configuration-authentication-azure-ad.md).
1. Return to this article.

### Add user authentication with the Signin system topic

When you create a bot, Microsoft Copilot Studio automatically adds a system topic called **Signin**. To use it, you must set your bot's authentication to manual and require users to sign in. When a customer starts a conversation with the bot, the **Signin** topic triggers and prompts the user to sign in. You can customize the **Signin** topic as appropriate for your bot.

1. In the navigation menu under **Settings**, select **Security**.

1. Select the **Authentication** tile.

1. Select **Manual (for custom website)**, and then select **Require users to sign in**.

    :::image type="content" source="media/advanced-user-authentication/require-signin.png" alt-text="Screenshot of the Microsoft Copilot Studio Authentication page with Require users to sign in selected and highlighted.":::

    :::image type="content" source="media/advanced-user-authentication/sign-in-card.png" alt-text="Screenshot of the sign-in prompt.":::

### Add user authentication with a custom topic

The **Signin** topic authenticates the user at the beginning of the conversation. To allow the user to sign in later, you can add an **Authenticate** node to any custom topic.

When customers enter their username and password, they might be prompted to enter a validation code. After they've logged in, they won't be prompted again, even if they reach another **Authenticate** node.

1. In the navigation menu under **Settings**, select **Security**.

1. Select the **Authentication** tile.

1. Turn off **Require users to sign in**.

1. In the navigation menu, select **Topics**, and then open the topic you want to add authentication to.

1. Select **Add node** (**+**), select **Call an action**, and then select **Authenticate**.

1. [Test your topic](authoring-test-bot.md) with a user configured with your identity provider.

> [!TIP]
> It's important that you create paths for both a successful sign-in and failure to sign in. A sign-in may fail for many reasons, including errors with the identity provider's sign-in experience.

### Authentication variables

When you've configured user authentication for your bot, you can use authentication variables in your topics. The following table compares the availability of these variables based on the authentication option you chose.

| Authentication Variable | No Authentication | Only for Teams and Power Apps  | Manual    |
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

#### User.DisplayName

> [!WARNING]
> This variable isn't guaranteed to contain a value. Test with a user from your identity provider to ensure your topic works correctly.

The `User.DisplayName` variable contains the display name that's stored in the identity provider. Use this variable to greet or refer to the user without their having to explicitly give their name to the bot, making the conversation more personalized.

Microsoft Copilot Studio automatically sets the value of `User.DisplayName` from the `name` claim provided by the identity provider, as long as the `profile` scope was defined when manual authentication was configured. For more information about scope, see [Add user authentication to chatbot topics](configuration-authentication-azure-ad.md).

#### User.Id

> [!WARNING]
> This variable isn't guaranteed to contain a value. Test with a user from your identity provider to ensure your topic works correctly.

The `User.Id` variable contains the userID that's stored in the identity provider. Use this variable in [Power Automate flows](advanced-flow.md) to call APIs that take the UserID as a value.

Microsoft Copilot Studio automatically sets the value of `User.DisplayName` from the `sub` claim provided by the identity provider.

#### User.IsLoggedIn

`User.IsLoggedIn` is a boolean-type variable that stores the user's sign-in status. A value of `true` indicates the user is signed in. You can use this variable to create branching logic in your topics that checks for a successful sign-in, or to fetch user information only if the user is signed in.

#### User.AccessToken

> [!WARNING]
> Make sure you're passing the `User.AccessToken` variable only to trusted sources. It contains user authentication information, which, if compromised, could harm the user.

The `User.AccessToken` variable contains the user's token, obtained after the user is signed in. You can pass this variable to [Power Automate flows](advanced-flow.md) so they can connect to back-end APIs and fetch user information, or to take actions on the user's behalf.

Don't use `User.AccessToken` in **Message** nodes or in flows that you don't trust.

#### SignInReason

`SignInReason` is a choice-type variable that indicates when the user must sign in. It has two possible values:

- `SignInRequired` indicates the user must sign in at the beginning of the conversation using the **Signin** system topic. [**Require users to sign in** must be turned on](#add-user-authentication-with-the-signin-system-topic).

- `Initializer` indicates that if the user hasn't signed in yet, and they reach a point in the conversation that uses authentication variables, they'll be prompted to sign in.


# [Classic](#tab/classic)

### Authentication variables

If your bot is configured with either **Only for Teams and Power Apps** or **Manual** authentication options, you will have a set of authentication variables available in your topics. Check the [authentication configuration documentation](configuration-end-user-authentication.md) for more information on how to configure authentication in your bot.

The following table compares authentication variable availability by authentication configuration option:

| Authentication Variable | No Authentication |   Only for Teams and Power Apps  |       Manual       |
| ----------------------- | :---------------: | :----------------: | :----------------: |
| ```UserDisplayName```   |        :x:        | :heavy_check_mark: | :heavy_check_mark: |
| ```UserID```            |        :x:        | :heavy_check_mark: | :heavy_check_mark: |
| ```IsLoggedIn```        |        :x:        |        :x:         | :heavy_check_mark: |
| ```AuthToken```         |        :x:        |        :x:         | :heavy_check_mark: |

#### UserDisplayName variable

The ```UserDisplayName``` variable contains the user's display name stored in the identity provider. You can use this variable to greet or refer to the end user without them having to explicitly tell it to the bot, making it more personalized.

This field value is obtained from the Microsoft Entra ID ```name``` claim. For OAuth providers, this is the value stored in the ```name``` claim. Microsoft Copilot Studio automatically extracts this field into the variable, so ensure you have ```profile``` as part of your authentication scope setup.

#### UserID variable

The ```UserID``` variable contains the user's ID stored in the identity provider. This value can be used by Power Automate flows to call APIs that take the UserID as a value.
This field value is obtained from the Microsoft Entra ID ```sub``` claim. For OAuth providers, this is the value stored in the ```sub``` claim. Microsoft Copilot Studio automatically extracts this field into the variable.

> [!WARNING]
> The ```UserDisplayName``` and ```UserID``` variables are not guaranteed to be filled, and might be empty strings depending on the user configuration in the identity provider. Test with a user from your identification provider to ensure your topics work correctly, even if these variables are empty.

#### IsLoggedIn variable

The ```IsLoggedIn``` variable indicates whether the user is signed in (either as a result of signing in or already being signed in, also known as the log-in success path) or not signed in (which would result in the log-in failure path).

```IsLoggedIn``` is a boolean-type variable containing the signed-in status of the user. You can use this variable to create branching logic in your topics that checks for a successful sign-in (for example, in the template already provided as part of adding the **Authenticate** node), or to opportunistically fetch user information only if the user is signed in.

#### AuthToken variable

The ```AuthToken``` variable contains the user's token, obtained after the user is signed in. You can pass this variable to [Power Automate flows](advanced-flow-input-output.md) so they can connect to back-end APIs and fetch the user's information, or to take actions on the user's behalf.

> [!WARNING]
> Make sure you're passing the `AuthToken` variable only to trusted sources. It contains user authentication information, which, if compromised, could harm the user.

Don't use `AuthToken` inside **Message** nodes, or on flows that you don't trust.

### Testing authentication variables

By default, the **Test bot** pane will use the account of the currently signed-in user to populate the `UserDisplayName` and `UserID` variables. However, when testing topics that use authentication, you might want to use other values for these variables (or even a blank value).

For example, you might want to test how special characters are used, or what happens if the variable is empty.

This only applies to the **Test bot** pane; you can't use the commands described in this section in a published bot deployed to a channel.

The following table lists the commands that will populate these variables. Enter the command into the **Test bot** pane just as you would if you were normally chatting with the bot. You'll receive a confirmation message from the bot if you're successful. If your bot doesn't use authentication, you'll receive an error.

If you reset the **Test bot** pane (or you make changes to a topic that cause the **Test bot** to reset automatically), you will need to send the commands again.

| Variable          | Custom value command                         | Empty (blank) value command             |
| ----------------- | -------------------------------------------- | --------------------------------------- |
| `UserDisplayName` | ```/debug set bot.UserDisplayName "Value"``` | ```/debug set bot.UserDisplayName ""``` |
| `UserID`          | Not available                                | ```/debug set bot.UserID ""```          |

> [!IMPORTANT]
> You can't populate the `UserID` variable with a custom value (other than an empty or blank value) due to security reasons.

### Authentication when using "Only for Teams and Power Apps" configuration

If your authentication option is set to **Only for Teams and Power Apps**, you don't need to explicitly add authentication to your topics. In this configuration, any user in Microsoft Teams is automatically signed in via their Teams credentials and they don't need to explicitly sign in with an authentication card. If your authentication option is set to Manual, then you will need to add the authentication node (even for the Teams channel).

> [!NOTE]
> If your authentication option is set to **Only for Teams and Power Apps**, you don't have the option to explicitly add authentication to your topics.

### Add user authentication to a topic

The _Authenticate_ node will prompt a user to log in with a sign-in card. If a user is already logged in, they won't be prompted again, even if they reach another Authenticate node.

:::image type="content" source="media/advanced-end-user-authentication/auth-sign-in-user.png" alt-text="Request to sign in." border="false":::

Once the user enters their username and password in the prompt (hosted by the identity provider), they might be prompted to enter a validation code, depending on the [channel](publication-fundamentals-publish-channels.md). Some channels, such as Microsoft Teams, do not require the user to enter a validation code.

When your bot has [SSO](configure-sso.md) configured, the user won't be prompted to sign in.

To add an Authenticate node to your topic:

1. Go to the [**Topics page**](authoring-create-edit-topics.md) for the bot you want to edit.

1. Open the **Authoring canvas** for the topic you want to add the authentication template to.

    > [!NOTE]
    > If your bot is connected to Dynamics 365 Customer Service, the Authentication node can't be part of the conversation path the bot follows when initially greeting users; otherwise, the sign-in card will be shown twice. Instead you should add the Authenticate node to another topic that is triggered by a user response.

1. Select **Add node** (**+**) to add a message node. Enter what the bot should say to indicate that a sign-on experience is about to occur.

    :::image type="content" source="media/advanced-end-user-authentication/handoff-add-node.png" alt-text="Screenshot of adding a node." border="false":::

1. Underneath the message node, select **Add node** (**+**), select **Call an action**, and then select **Authenticate**.

    :::image type="content" source="media/advanced-end-user-authentication/auth-call-action-2.png" alt-text="Select Authenticate." border="false":::

    > [!NOTE]
    > The **Authenticate** node is only available in the action picker at the end of a dialog tree (as a leaf node). It cannot be added in the middle of a dialog. Once added, other nodes can be added below it.

1. Once selected, a number of new nodes will be added automatically. These nodes include a parent **Authenticate** node, followed by nodes for both a success and a failure path.

    :::image type="content" source="media/advanced-end-user-authentication/auth-template.png" alt-text="New nodes." border="false":::

### AuthToken usage without an Authenticate node

The ```IsLoggedIn``` and ```AuthToken``` variables are available even if you don't use the template provided by the **Call an action** menu entry. If you pass the `AuthToken` variable without first having the user go through the **Authenticate** node, the user will be prompted to sign in at that step.

Passing the `AuthToken` variable can be useful if you always expect the user to be signed in, or if your user is being redirected from a different topic. We suggest you use the template provided by the **Call an action** entry to treat cases where the user fails to sign in.

> [!NOTE]
> If the user signs out in the middle of a conversation, they will be prompted to sign in again if the topic comes to a node that uses the ```AuthToken``` variable.

#### Success path

The success path equates to where ```IsLoggedIn = True``` and accounts for when the user has successfully signed in (or was already signed in).

If you have logic that uses the `AuthToken` variable (for example, to connect to a back-end system using a flow to retrieve a user's information), it should go under this path.

#### Failure path

The failure path equates to any condition other than `IsLoggedIn = True`. In most cases the failure path occurs because the user failed to sign in, used the wrong password, or canceled the sign-in experience.

Add any logic you might want to treat this case. As an example, we have provided options for retrying or to [escalate to a live agent](advanced-hand-off.md). Customize the failure path's actions for your particular scenario and usage.

### Testing your topic

Make sure to [test your topic](authoring-test-bot.md) using a real user configured in your identity provider. Ensure both the sign-in success and failure paths are exercised, so there are no surprises if your user fails to sign in or there is an error with the identity provider's sign-in experience.

---

## Related topics

You can also configure single sign-on (SSO) so your users don't need to sign in manually. For more information, see [Configure SSO for web](configure-sso.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
