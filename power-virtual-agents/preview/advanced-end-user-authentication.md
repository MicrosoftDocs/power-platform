---
title: "Add user authentication to chatbot topics (preview)"
description: "Insert user authentication into a topic to allow your users to sign in directly within a conversation in Power Virtual Agents preview."
keywords: "User Authentication, Authentication, AAD, MSA, Identity Provider, PVA"
ms.date: 10/11/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: clmori
ms.custom: authentication, ceX
ms.collection: virtual-agent
---

# Add end-user authentication to a Power Virtual Agents bot (preview)

> [!IMPORTANT]
> This topic contains Power Virtual Agents preview documentation and is subject to change.

You can authenticate users within a Power Virtual Agents chatbot. User authentication means you prompt a user to sign in, retrieve access token for that user, and then use that token to access information on behalf of the user. In addition, you can also get a user's basic properties, such as name and id variables.

When you create a bot, PVA automatically adds a system topic called **Sign in**, as shown below.

:::image type="content" source="media/authentication/system-topic.png" alt-text="Screenshot showing sign in topic." border="false":::

However, to trigger this topic, you must check the **Require users to sign in** option on the **Authentication** page under **Security** settings, as shown below.

:::image type="content" source="media/authentication/require-signin.png" alt-text="Screenshot shows require sign in option." border="false":::

If you check **Require users to sign in**, authentication occurs when the user first starts the conversation with the bot. If you don't want to authenticate the user at the beginning, you can leave the checkbox unchecked and instead add the authenticate node in the topic where you want the user to sign in. Regardless of your option, you will need to provide additional settings such as client id, client secret, token exchange URL, etc. - this information is provided in the prerequisites section below. 

## Prerequisites

- You'll need to _only complete_ [Create an app registration for your custom website](configure-web-sso#create-an-app-registration-for-your-custom-website) section in the _Configure SSO for your custom website_ topic. _Do not complete_ the instructions listed under "Create a canvas app registration" or "Configure SSO in your webpage" sections. 

## Authentication variables
After you complete the prerequisites, you will be able to access authentication variables. If your bot is configured with "Manual" authentication option, you will have a set of authentication variables available in your topics. The following table compares authentication variable availability by authentication configuration option:

| Authentication Variable | No Authentication |   Only for Teams   |       Manual       |
| ----------------------- | :---------------: | :----------------: | :----------------: |
| ```User.DisplayName```   |        :x:        |        :x:         | :heavy_check_mark: |
| ```User.Id```            |        :x:        |        :x:         | :heavy_check_mark: |
| ```User.IsLoggedIn```    |        :x:        |        :x:         | :heavy_check_mark: |
| ```User.AccessToken```   |        :x:        |        :x:         | :heavy_check_mark: |

### User.DisplayName variable

The ```User.DisplayName``` variable contains the user's display name stored in the identity provider. You can use this variable to greet or refer to the end user without them having to explicitly tell it to the bot, making it more personalized.

This field value is obtained from the Azure Active Directory (Azure AD) ```name``` claim. For OAuth providers, this is the value stored in the ```name``` claim. Power Virtual Agents automatically extracts this field into the variable, so ensure you have ```profile``` as part of your authentication scope setup.

### User.Id variable

The ```User.Id``` variable contains the user's ID stored in the identity provider. This value can be used by Power Automate flows to call APIs that take the UserID as a value.
This field value is obtained from the Azure AD ```sub``` claim. For OAuth providers, this is the value stored in the ```sub``` claim. Power Virtual Agents automatically extracts this field into the variable.

> [!WARNING]
> The ```User.DisplayName``` and ```User.Id``` variables are not guaranteed to be filled, and might be empty strings depending on the user configuration in the identity provider. Test with a user from your identification provider to ensure your topics work correctly, even if these variables are empty.

### User.IsLoggedIn variable

The ```User.IsLoggedIn``` variable indicates whether the user is signed in (either as a result of signing in or already being signed in, also known as the log-in success path) or not signed in (which would result in the log-in failure path).

```User.IsLoggedIn``` is a boolean-type variable containing the signed-in status of the user. You can use this variable to create branching logic in your topics that checks for a successful sign-in (for example, in the template already provided as part of adding the **Authenticate** node), or to opportunistically fetch user information only if the user is signed in.

### AccessToken variable

The ```User.AccessToken``` variable contains the user's token, obtained after the user is signed in. You can pass this variable to [Power Automate flows](advanced-flow-input-output.md) so they can connect to back-end APIs and fetch the user's information, or to take actions on the user's behalf.

> [!WARNING]
> Make sure you're passing the `AuthToken` variable only to trusted sources. It contains user authentication information, which, if compromised, could harm the user.

Don't use `User.AccessToken` inside **Message** nodes, or on flows that you don't trust.

## Customize Sign in system topic

A typical **Sign in** topic has **Condition** and **Authenticate** nodes as shown below. The system checks to see if `SignInReason` is set to `SignInRequied` - this value is set when you check the **Require users to sign in** checkbox in the authentication settings page. If it is set, then the authentication node prompts the user to sign in.  

Starting with the preview release of PVA, you can customize **Sign in** topic to add additonal logic or messages that are appropriate in your case. You can also customize title and text of the prompt by opening the topic in the code editor. To open the topic in code editor, click on (...) as shown below.

:::image type="content" source="media/authentication/edit-sign-in-topic.png" alt-text="Screenshot showing sign in system topic and code editor ellipses." border="false":::

In the code editor, you customize the title or text as shown below.

:::image type="content" source="media/authentication/code-editor.png" alt-text="Screenshot showing code changes in the code editor." border="false":::

## Add user authentication to a topic

As discussed above, to authenticate a user in a topic, make sure that **Require users to sign in** is _not_ set. You can add _Authenticate_ node and it will prompt the user to log in with a sign-in card. Once the user enters their username and password in the prompt (hosted by the identity provider), they might be prompted to enter a validation code. If a user is already logged in, they won't be prompted again, even if they reach another Authenticate node.

To add an Authenticate node to your topic:

1. Go to the **Topics page** for the bot you want to edit.

1. Open the **Authoring canvas** for the topic you want to add the authentication template to.

1. Select **Add node** (**+**), select **Call an action**, and then select **Authenticate**.

## Testing your topic

Make sure to [test your topic](authoring-test-bot.md) using a real user configured in your identity provider. Ensure both the sign-in success and failure paths are exercised, so there are no surprises if your user fails to sign in or there is an error with the identity provider's sign-in experience.

[!INCLUDE[footer-include](includes/footer-banner.md)]

## Reference
You can also configure single sign-on (SSO) so your users don't need to sign in manually. For more information, see [Configure SSO for web](configure-sso.md).
