---
title: "Fundamentals - Publish a chatbot to various channels (contains video)"
description: "Publish your bot to the web, Microsoft Teams, Facebook, or even use an existing Azure Bot Service framework."
keywords: "Publish; demo; demo website; channels, PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "publication, fundamentals, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Key concepts - Publish your bot

With Power Virtual Agents, you can publish bots to engage with your customers on multiple platforms or channels. These include live websites, mobile apps, and messaging platforms like Microsoft Teams and Facebook.

After you've published at least once, you can connect your bot to more channels.

Each time you want to update your bot, you publish it again from within the Power Virtual Agents app itself. Publishing your bot will update the bot across all the channels where you've inserted or connected your bot.

>
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4mGa9]
>

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).


# [Preview](#tab/preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

You need to publish your bot before your customers can engage with it. You can publish your bot on multiple platforms, or channels.

After you've published your bot to at least one channel, you can connect it to more channels. Remember to publish your bot again after you make any changes to it. Publishing your bot updates it across all the channels it's connected to. If you don't, your customers won't be engaging with the latest content.

### Publish the latest bot content

1. With your bot open for editing, in the navigation menu, select **Publish**.

1. Select **Publish**, and then confirm.

    :::image type="content" source="media/publication-fundamentals-publish-channels/channel-publish-latest-content.png" alt-text="Screenshot that shows where to find the Publish button in the bot authoring experience.":::

Publishing can take up to a few minutes.

### Test your bot

Test your bot after it's published. Select the **demo website** link to open a prebuilt website in a new browser tab, where you and your teammates can interact with the bot. The demo website is also useful to gather feedback from stakeholders before you roll your bot out to customers. Learn how to [configure the demo website and add the bot to your live website](publication-connect-bot-to-web-channels.md).

> [!TIP]
> **What's the difference between the test chat and the demo website?**  
> Use the test chat (the **Test bot** pane) while you're building your bot to make sure conversation flows as you expect and to spot errors.
>
> Share the demo website URL with members of your team or other stakeholders to try out the bot. The demo website isn't intended for production use. You shouldn't share the URL with customers.  


# [Web app](#tab/web)

### Publish the latest bot content

You need to publish the bot at least once before your customers can interact with it or before you can share it with your teammates. After the first publish, you can publish the bot again whenever you'd like your customers to engage with the latest bot content.

1. In the navigation menu, select the **Publish** tab.

1. Select **Publish** to make the latest bot content available to your customers.

    :::image type="content" source="media/publication-fundamentals-publish-channels/channel-publish-latest-content.png" alt-text="Publish latest bot content." border="false":::

    The publishing process will take less than a few minutes as it checks for errors in the latest bot content.

    :::image type="content" source="media/publication-fundamentals-publish-channels/channel-publish-validation.png" alt-text="Validate latest bot content for publish." border="false":::

1. After publishing completes, select the **demo website** link. The link will open a new tab and display a prebuilt demo website where you and your team can interact with the bot. The demo website is useful to gather feedback from stakeholders involved in the bot.

:::image type="content" source="media/publication-fundamentals-publish-channels/channel-go-to-demo-website.png" alt-text="Go to demo website." border="false":::

For details on updating the welcome message and help text on the demo website, go to [Configure the demo website and add the bot to your live website](publication-connect-bot-to-web-channels.md).

> [!TIP]
> **What's the difference between the test chat and the demo website?**  
> On the demo website, you can share a URL with members of your team, or other stakeholders who want to try out the bot.  However, the website isn't intended for production use, and you shouldn't use it directly with customers.  
> You can use the test chat to see whether conversation flows as expected, and to spot any errors during the bot creation process.

### Configure channels

After publishing your bot at least once, you can add channels to make the bot reachable by your customers.

To configure channels:

1. Select **Settings**.
1. In the navigation menu, select the **Channels** tab.

:::image type="content" source="media/publication-fundamentals-publish-channels/channel-channels-menu.png" alt-text="Channel settings." border="false":::

The connection steps are different for each channel. See the related article in the list below more information:

- [Microsoft Teams](publication-add-bot-to-microsoft-teams.md)
- [Demo Website](publication-connect-bot-to-web-channels.md)
- [Custom Website](publication-connect-bot-to-web-channels.md#custom-website)
- [Mobile App](publication-connect-bot-to-custom-application.md)
- [Facebook](publication-add-bot-to-facebook.md)
- [Azure Bot Service channels](publication-connect-bot-to-azure-bot-service-channels.md), including:
  - Skype
  - Cortana
  - Slack
  - Telegram
  - Twilio
  - Line
  - Kik
  - GroupMe
  - Direct Line Speech
  - Email

### Channel experience reference table

Different channels have different end-user experiences. The following table shows a high-level overview of the experiences for each channel. Take the channel experiences into account when optimizing your bot content for specific channels.

| Experience                                                                        | Website       | Microsoft Teams                                                                                         | Facebook                                                                                                   | Dynamics Omnichannel for Customer Service                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| --------------------------------------------------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Customer satisfaction survey](authoring-create-edit-topics.md#insert-nodes)      | Adaptive card | Text-only                                                                                               | Text-only                                                                                                  | Text-only                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| [Multiple-choice options](authoring-create-edit-topics.md#insert-nodes)           | Supported     | [Supported up to six (as hero card)](/microsoftteams/platform/concepts/cards/cards-reference#hero-card) | [Supported up to 13](https://developers.facebook.com/docs/messenger-platform/send-messages/quick-replies/) | [Partially Supported](/dynamics365/customer-service/asynchronous-channels#suggested-actions-support)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| [Markdown](https://daringfireball.net/projects/markdown/)                         | Supported     | [Partially Supported](/microsoftteams/platform/bots/how-to/format-your-bot-messages#text-only-messages) | [Partially supported](https://www.facebook.com/help/147348452522644?helpref=related)                       | [Partially Supported](/dynamics365/customer-service/asynchronous-channels#preview-support-for-formatted-messages)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| [Welcome message](authoring-create-edit-topics.md#insert-nodes)                   | Supported     | Supported                                                                                               | Not supported                                                                                              | Supported for [Chat](/dynamics365/customer-service/set-up-chat-widget). Not supported for other channels.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| [Did-You-Mean](advanced-ai-features.md#topic-suggestion-from-chat-transcripts) | Supported     | Supported                                                                                               | Supported                                                                                                  | Supported for [Microsoft Teams](/dynamics365/customer-service/configure-microsoft-teams), [Chat](/dynamics365/customer-service/set-up-chat-widget), Facebook, and text-only channels (SMS via [TeleSign](/dynamics365/customer-service/configure-sms-channel) and [Twilio](/dynamics365/customer-service/configure-sms-channel-twilio), [WhatsApp](/dynamics365/customer-service/configure-whatsapp-channel), [WeChat](/dynamics365/customer-service/configure-wechat-channel), and [Twitter](/dynamics365/customer-service/configure-twitter-channel)).</br>Suggested actions will be presented as a text-only list; users will need to retype an option to respond |

> [!IMPORTANT]
> Users can't send attachments to Power Virtual Agents chatbots. If they try to upload a file (including media, such as images), the bot will say:
>
> *Looks like you tried to send an attachment. Currently, I can only process text. Please try sending your message again without the attachment.*
>
> This applies to all channels, even if the channel or end-user-facing experience supports attachments (for example, if you're using the Direct Line API or Microsoft Teams).
>
> Attachments can be supported if the message is sent to a skill, where the skill bot supports the processing of attachments. For more information, see the [Use Microsoft Bot Framework skills topic](advanced-use-skills.md) for more details on skills.

## Next steps

| Topic                                                                                                         | Description                                                                       |
| ------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| [Configure the demo website and add the bot to your live website](publication-connect-bot-to-web-channels.md) | Publish your bot on your live website, or use a demo website to share internally. |
| [Add bot to Microsoft Teams](publication-add-bot-to-microsoft-teams.md)                                       | Use Teams to distribute your bot.                                                 |
| [Add bot to Facebook](publication-add-bot-to-facebook.md)                                                     | Add your bot to Facebook Messenger.                                               |
| [Add bot to mobile and custom apps (web-based or native)](publication-connect-bot-to-custom-application.md)   | Add your bot to mobile or custom native apps (developer coding required).         |
| [Add bot to Azure Bot Service channels](publication-connect-bot-to-azure-bot-service-channels.md)             | Add your bot to Azure Bot Service channels (developer coding required).           |


# [Teams](#tab/teams)

Once you're satisfied with your bot's content and quality, you can publish your bot to allow users to engage with your bot. You must publish your bot at least once for the user to chat with the bot in Microsoft Teams.

Each time you want to update your bot's content, you publish it again from within the Power Virtual Agents app in Microsoft Teams. This will update the bot's content with the latest changes you have made.

### Publish the latest bot content

You need to publish the bot at least once before you can share it with your teammates.

After the first publish, you can do subsequent publishes whenever you would like your customers to see the latest bot content.

1. In the navigation menu, select **Publish**.

1. Select **Publish** to make the latest bot content available to your customers.

    :::image type="content" source="media/publication-fundamentals-publish-channels/channel-publish-latest-content-teams.png" alt-text="Publish latest bot content.":::

The publishing process will check for errors in the latest bot content.

When publication is successful, you can [make the bot available to users in Microsoft Teams](publication-add-bot-to-microsoft-teams.md) with the installation link or from various places in the Microsoft Teams app store. You can share your bot later by selecting **Make bot available to others** from the Publish page.

You can also install the bot for your own use in Microsoft Teams by selecting **Open the bot**.

> [!TIP]
> To prevent disrupting users who are having an existing conversation with the bot, they will not receive the latest published content until a new conversation has started. A new conversation starts after it has been idle for more than 30 minutes.
>
> You may want to try out the latest published content in Microsoft Teams right away. You can do so by typing _start over_ in an existing conversation. This will restart the conversation with the latest content you have published.

### Known limitations

- Customer satisfaction survey is a text-only version in Microsoft Teams instead of an adaptive card.
- Microsoft Teams can only render up to six suggested actions for user in one question node.
- A user can't send or upload attachments to the chat. If they try to send an attachment, the bot will reply with _Looks like you tried to send an attachment. Currently, I can only process text. Please try sending your message again without the attachment._
  - This applies to all channels, even if the channel or end-user-facing experience supports attachments (for example, if you're using the Direct Line API or Microsoft Teams).  
  - Attachments can be supported if the message is sent to a skill, where the skill bot supports the processing of attachments.  
  - See the [Use Microsoft Bot Framework skills topic](advanced-use-skills.md) for more details on skills.

### Next steps

| Topic                                                                            | Description                                                                  |
| -------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| [Add bot to Microsoft Teams](publication-add-bot-to-microsoft-teams.md)    | Make your bot available to users in Microsoft Teams.                         |
| [Create a privacy statement and terms of use](publication-terms-of-use-teams.md) | Create and link to a privacy statement and terms of use for bots you create. |

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
