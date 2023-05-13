---
title: Configure hand-off to Dynamics 365 Customer Service
description: Escalate bot conversations to live agents using omnichannel engagement capabilities of Dynamics 365 Customer Service.
keywords: "PVA"
ms.date: 12/05/2022

ms.topic: article
author: iaanw  
ms.author: iawilt
ms.reviewer: clmori
ms.service: power-virtual-agents
ms.collection: virtual-agent
ms.custom: handoff, ceX
---

# Configure hand-off to Dynamics 365 Customer Service

When your customers need to speak with a human agent, your bot can seamlessly hand off the conversation. With the omnichannel capabilities of the [Chat Add-in for Dynamics 365 Customer Service](/dynamics365/omnichannel/omnichannel-customer-service-guide), you can connect both voice and text conversations.

When your bot hands off a conversation, it shares the full history of the conversation and all variables collected in the interaction. Your Omnichannel for Customer Service routes incoming escalations to the right queue, and a live agent can seamlessly resume the conversation. For more information about how to use hand-off in bot conversations, see [Hand off to a live agent](./advanced-hand-off.md).

You can also enable single sign-on (SSO) to allow chatbots to sign users in if they're logged in to the page where the bot is deployed. For more information, see [Configure single sign-on](configure-sso.md) and [Pass authentication token to bot during single sign-on in live chat](/dynamics365/customer-service/pass-auth-token-sso-live-chat).

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).
- Sign in with an account that has the System Administrator role.
- Have a [product license for Power Virtual Agents](https://go.microsoft.com/fwlink/?LinkId=2092080&clcid=0x409) and a [product license for the Chat Add-in for Dynamics 365 Customer service](/dynamics365/customer-engagement/omnichannel/try-chat-for-dynamics365).
- Environments:
  - Your bot environment and Omnichannel for Customer Service environment must be in the same [geographical region](./data-location.md#data-locations).
  - To use [voice capabilities](#voice-based-capabilities), your tenant and environment [must be in these geographies](./data-location.md#data-locations):
    - Asia
    - Australia
    - Canada
    - Europe
    - India
    - Switzerland
    - United Kingdom
    - United States
- [Register an application with Azure AD](/azure/active-directory/develop/howto-create-service-principal-portal#create-an-azure-active-directory-application).
- For end-to-end capabilities to work as expected, your bot must be [published](./publication-fundamentals-publish-channels.md).

## Connect your bot to Omnichannel for Customer Service

> [!NOTE]
> If you connected your bot to Omnichannel for Customer Service engagement before November 2021, the settings on the **Omnichannel** tile will look as if they haven't been configured. This is a known issue. It doesn't affect the bot or its omnichannel capabilities, which will continue to run normally. Select **Enable** to refresh the settings and show the actual connection details.

1. In Power Virtual Agents, edit your bot. In the navigation menu, select **Settings**, **Agent transfers**, and then select the **Omnichannel** tile.

    :::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-settings.png" alt-text="The bot management Agent transfers page.":::

1. Select **Enable**.

    - If the [required extensions](#recommended-extensions) aren't installed, you'll see a message that your bot doesn't have access to the variables or actions it needs.

      :::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-no-extension.png" alt-text="Message at the top of the Omnichannel configuration pane that says your bot doesn't have access.":::

    - If you're using Application Lifecycle Management (ALM), you may see a message that we can't determine if Omnichannel for Customer Service integration is enabled for the environment. For more information, see [Bots with ALM](#bots-with-alm).

1. Under **See the environment this bot is connected to**, select the environment where you have Omnichannel for Customer Service integration turned on. If your bot and Omnichannel for Customer Service are in different environments, Analytics for Omnichannel for Customer Service won't work for your bot.

    If you haven't set up Omnichannel for Customer Service in that environment, you'll see a message inviting you to begin a trial.

    :::image type="content" source="./media/configuration-hand-off-omnichannel/transfer-no-oc.png" alt-text="Message that says you haven't set up Omnichannel for Customer Service integration in this environment.":::

1. Select **See how to register a new Application ID** and follow the steps to find or create the app registration for Power Virtual Agents.

    :::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-bot-appid.png" alt-text="The Omnichannel configuration pane, with the Application ID section highlighted.":::

1. On the Azure portal go to **App registrations**, then select **Overview**. Copy the **Application (client) ID**.

1. Return to the **Omnichannel** pane in Power Virtual Agents and paste the Application ID in the **Application ID** box.

    > [!IMPORTANT]
    > Omnichannel for Customer Service models bots as "application users." Therefore, the Application ID that you use **must be unique** to your Power Virtual Agents bot. Reusing this Application ID across bots will cause error code `1004` (DuplicateBotAppId) to be shown. 

1. Select **Add your bot**.

   Power Virtual Agents uses a [Teams channel](./publication-fundamentals-publish-channels.md) to communicate with Omnichannel for Customer Service. If one isn't turned on, a Teams channel will be enabled when you select **Add your bot**.

1. Select the **View details in Omnichannel** link to [continue configuring the bot connection in Omnichannel for Customer Service](/dynamics365/omnichannel/administrator/configure-bot-virtual-agent).

> [!IMPORTANT]
> To test the bot on your custom website, you must use the embed code that's specified in the chat widget you set up in Omnichannel for Customer Service. If you use the embed code from Power Virtual Agents, hand-off won't work. For more information, see [Embed chat widget in your website or portal](/dynamics365/customer-service/embed-chat-widget-portal).

To add [voice capabilities](#voice-based-capabilities) after you've connected your bot to Omnichannel for Customer Service, you must disconnect the bot from your Omnichannel for Customer Service and reconnect it.

<a id="managed-bot-oc"></a>
<a id="bots-with-alm"></a>

### Bots with Application Lifecycle Management

If you've [set up Application Lifecycle Management (ALM) for your bots](/power-platform/alm/basics-alm), and are exporting and importing bots between [development (unmanaged) and test or production (managed) environments](/power-platform/alm/basics-alm#types-of-environments-used-in-alm), you might see a message that we can't determine if Omnichannel for Customer Service integration is enabled for the environment.

:::image type="content" source="./media/configuration-hand-off-omnichannel/transfer-managed-bot.png" alt-text="Message that we can't determine if this bot has omnichannel capabilities enabled or disabled.":::

If the bot you exported has omnichannel capabilities enabled, you can ignore this message. The bot will still work properly. The message will disappear after you export the latest version of your bot from your development environment, and then import it into a targeted test or production environment with managed bots.

If you continue to see the message after exporting and importing the latest version of your managed bot, make sure to remove any unmanaged layers:

1. Sign in to Power Apps and select the managed bot's environment.  

1. In the navigation menu, select **Solutions**, and then select the solution that contains the bot with the unmanaged layer.

1. Next to the chatbot component in the solution, select **More commands** (**&vellip;**), and then select **See solution layers**.

    :::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-see-layers.png" alt-text="Selecting solution layers in Power Apps.":::

1. Select the unmanaged layer, and then select **Remove unmanaged layer**.

    :::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-remove-layer.png" alt-text="Remove unmanaged layer in Power Apps.":::

If your bot doesn't have omnichannel capabilities enabled, the message will always show.

## Manage your bot's omnichannel capabilities

Select **Settings**, **Agent transfers**, and then select the **Omnichannel** tile. Here you can disconnect or disable your bot, refresh the connection, or open the Omnichannel for Customer Service admin center to view the connection details.

### Disconnect your bot from Omnichannel for Customer Service or disable the connection

If you select **Disconnect bot**, the application user that represents the bot in your Omnichannel for Customer Service instance is disabled. Your bot is effectively disconnected from the Omnichannel for Customer Service environment.

To add your bot back, you'll need to [connect it again](#connect-your-bot-to-omnichannel-for-customer-service), starting at Step 3.

If you select **Disable**, the connection between your Omnichannel for Customer Service instance and Power Virtual Agents is disabled. Your bot will stop receiving any traffic from your Omnichannel for Customer Service instance.

### Refresh the connection

If you select **Refresh**, the connection between your bot and the Omnichannel for Customer Service instance is tested and verified.

It's a good idea to refresh the connection after you add your bot to an Omnichannel for Customer Service workstream to make sure that the connection was successful.

## Voice-based capabilities

The [Power Virtual Agents telephony extension](https://appsource.microsoft.com/product/dynamics-crm/mscrm.mspva_telephony_extension) adds several actions and variables to Power Virtual Agents.

:::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-oc-voice-vars.png" alt-text="List of voice-related actions that can be added to a node in Power Virtual Agents.":::

Select **Enable voice** to turn voice capabilities on or off for the entire bot, not for individual bot sessions or connections. When voice is enabled, any connection with the bot can use voice, text, or both voice and text.

:::image type="content" source="./media/configuration-hand-off-omnichannel/voice-toggle.png" alt-text="Screenshot of the Power Virtual Agents Omnichannel section with the Enable voice toggle highlighted.":::

> [!IMPORTANT]
> If a bot is connected to an Omnichannel voice workstream or queue and taking calls, and the voice is disabled, the calls will start to fail. Ensure that the bot is disconnected from Omnichannel workstreams or queues before disabling voice in the Power Virtual Agents configuration.


### Set survey consent

Use this action to ask callers if they're willing to take a survey at the end of their call.

1. [Add the action](./authoring-create-edit-topics.md#insert-nodes).

1. Select **Add input for destination topic**, and then select **surveyConsent (boolean)**.

    :::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-voice-config-survey-consent-add.png" alt-text="Add a Set survey consent action to a node in Power Virtual Agents.":::

1. Select **Yes** or **No**, or enter a custom response.

    :::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-voice-config-survey-consent.png" alt-text="Set the response choice for the Set survey consent action.":::

### Set customer locale and handoff to Omnichannel for Customer Service

Use this action to ask callers for their preferred language.

1. [Add the action](./authoring-create-edit-topics.md#insert-nodes).

1. Select **Add input for destination topic**, and then select **customerLocale (string)**.

    :::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-voice-config-set-locale-add.png" alt-text="Add a Set customer locale and handoff to Omnichannel for Customer Service action to a node in Power Virtual Agents.":::

1. Select a variable that defines the locale code, or enter a locale code.

    Refer to the list of [languages supported in Omnichannel for Customer Service](/dynamics365/customer-service/voice-channel-multi-language-contact-center#supported-languages-and-locale-codes) for valid locale codes. Only a subset of these languages is supported in Power Virtual Agents. For more information, see [Supported languages](./authoring-language-support.md#list-of-supported-languages).

    :::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-voice-config-set-locale.png" alt-text="Set the response for the Set customer locale and handoff to Omnichannel for Customer Service action.":::

### Send uninterruptible voice message

Use this action to send a voice message that the caller can't interrupt.

1. [Add the action](./authoring-create-edit-topics.md#insert-nodes).

1. Select **Add input for destination topic**, and then select **UninterruptibleMessage (string)**.

    :::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-voice-config-interrupt-add.png" alt-text="Add a Send uninterruptible voice message action to a node in Power Virtual Agents.":::

1. Select a variable that defines the message content, or enter a message.

    :::image type="content" source="media/configuration-hand-off-omnichannel/handoff-voice-config-interrupt.png" alt-text="Set the input for the Send uninterruptible voice message action.":::

### Transfer the call to a different phone number

Use this action to transfer the call to a different phone number.

1. [Add the action](./authoring-create-edit-topics.md#insert-nodes).

1. Select **Add input for destination topic**, and then select **TargetPhoneNumber (string)**.

    :::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-voice-config-transfer-add.png" alt-text="Add a Transfer the call to a different phone number action to a node in Power Virtual Agents.":::
  
1. Select a variable that defines the phone number to transfer the call to, or enter a phone number.

    :::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-voice-config-transfer.png" alt-text="Set the phone number for the Transfer the call to a different phone number action.":::

    > [!WARNING]
    > Don't add a plus symbol, "+", before the phone number.
    >
    > The phone number you enter must have the "Make calls" privilege. Without it, transfers to the number will fail.

### Hang up

Use this action to end the call.

1. [Add the action](./authoring-create-edit-topics.md#insert-nodes).

    :::image type="content" source="./media/configuration-hand-off-omnichannel/handoff-voice-config-hangup.png" alt-text="Add a Hang up action to a node in Power Virtual Agents.":::

### bot.CustomerPhoneNumber

This variable contains the customer's phone number. It's also known as CallerID.

You can use the "Is Empty" condition with `bot.CustomerPhoneNumber` to find out the customer's communication channel. If the conversation is from a call, "Is Empty" always returns _False_. If it's from messaging, "Is Empty" always returns _True_.

### bot.OrganizationPhoneNumber

This variable contains the phone number the customer dialed.

### Dynamics 365 variables

Dynamics 365 Customer Service provides [more context variables](/dynamics365/customer-service/context-variables-for-bot#context-variables-for-power-virtual-agents-bots) for Power Virtual Agents bots.

### Authoring considerations

Authentication isn't supported for voice-based hand-off to Omnichannel for Customer Service instances. If you've set up authentication for your bot, the [authentication variables](./advanced-end-user-authentication.md) don't include authentication information when they're sent to your Omnichannel for Customer Service instance.

> [!WARNING]
> For voice-based hand-off capabilities to work, both your bot and Omnichannel for Customer Service environments must be hosted in a datacenter in the [United States, Canada, Europe, United Kingdom, Asia, or Australia geographies](data-location.md#data-locations). Otherwise, voice capabilities don't work, and you won't receive any error messages or warnings.

If your bot incorporates adaptive cards, make sure you use [Bot Framework Composer](./advanced-bot-framework-composer.md) so that the voice bot correctly reads their "speak" property.

If your topics include Markdown content, the voice bot will read the asterisk (*). Adjust your Markdown content accordingly, and always test your bot using voice to make sure you get the desired result.

## Known limitations

See [limitations when using Power Virtual Agents with the Chat Add-in for Dynamics 365 Customer Service](/dynamics365/omnichannel/administrator/configure-bot-virtual-agent#limitations).

## Recommended extensions

The following extensions aren't required to hand-off to Omnichannel for Customer Service, but they provide bot authors with a better experience by providing [extra variables and actions](#voice-based-capabilities).

Typically, the extensions are automatically installed in your Omnichannel for Customer Service environment. However, if the environment that you connected Omnichannel for Customer Service to isn't the same environment your bot is in, you'll need to manually install the extensions.

### For both text and voice hand-off

Install the following extensions in this order:

1. [Power Virtual Agents telephony extension](https://appsource.microsoft.com/product/dynamics-crm/mscrm.mspva_telephony_extension)
1. [Omnichannel Power Virtual Agent extension](https://appsource.microsoft.com/product/dynamics-365/mscrm.omnichannelpvaextension)
1. [Omnichannel Voice Power Virtual Agent extension](https://appsource.microsoft.com/product/dynamics-365/mscrm.omnichannelvoicepvaextension)

### For only text (messaging) hand-off

Install [Omnichannel Power Virtual Agent extension](https://appsource.microsoft.com/product/dynamics-365/mscrm.omnichannelpvaextension).

If you still see the following warning after installing the Omnichannel Power Virtual Agent extension, and you don't need voice capabilities, you can safely ignore it.

:::image type="content" source="media/configuration-hand-off-omnichannel/handoff-no-extension.png" alt-text="Screenshot of the yellow warning that can be ignored.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
