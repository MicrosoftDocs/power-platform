---
title: "Add a chatbot to Facebook"
description: "Add your bot to Facebook so Facebook users can interact with it."
keywords: "Channel, publish, Facebook, PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: micchow
manager: leeclontz
ms.custom: "publication, authoring, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Add bot to Facebook

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can add your bot to Facebook Messenger to use the Facebook experience to engage with your end users.

Facebook Messenger and related services are subject to Facebook's own terms and conditions. For support related to Facebook Messenger, contact Facebook directly.

> [!IMPORTANT]
> This article is intended for experienced IT professionals who manage your organization's Facebook page.

> [!NOTE]
> By publishing your bot to a Facebook page, some of your data such as bot content and end-user chat content will be shared with Facebook (meaning that your data will flow outside of your [organization's compliance and geographic or regional boundaries](data-location.md)).  
> For more information, see [Facebook's Platform Policies](https://developers.facebook.com/docs/messenger-platform/policy-overview).

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

## Add bot to Facebook Messenger

You need a Facebook app, and an associated developer account, to connect your Microsoft Copilot Studio bot to Facebook Messenger on your Facebook pages.

These are the steps involved in this process:

1. Configure Facebook app settings: retrieve your Facebook app information, enable API access, add Facebook Messenger to your app, and configure the Facebook pages your app should appear on.

1. Configure the Facebook publication channel in Microsoft Copilot Studio.

1. Connect your Facebook app to Microsoft Copilot Studio using webhooks.

You will then need to submit your app for Facebook review before you can publish your app and make it public.

### Configure Facebook app settings

#### Retrieve Facebook app information

1. Sign in to the Facebook app that you want to add your bot to at [Facebook for Developers](https://developers.facebook.com/).

1. Under **Settings** on the side menu pane, select **Basic** .

1. Copy the _App ID_ and _App Secret_. You will need these when you [configure the Facebook channel in Microsoft Copilot Studio](#configure-the-facebook-channel-in-microsoft-copilot-studio).

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-get-app-id-secret.png" alt-text="Get Facebook App ID and secret.":::

#### Enable API access for your Facebook app

1. Sign in to the Facebook app that you want to add your bot to at [Facebook for Developers](https://developers.facebook.com/).

1. Under **Settings** on the side menu pane, select **Advanced**.

1. Make sure **Allow API Access to App Settings** is set to **Yes**.  

1. Select **Save Changes** to confirm your changes.

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-allow-api-access.png" alt-text="Allow API Access to App Settings.":::

#### Add Facebook Messenger to your app

1. Sign in to the Facebook app that you want to add your bot to at [Facebook for Developers](https://developers.facebook.com/).

1. Go to the **Dashboard**. Under the **Add a Product** section, select **Set Up** on the **Messenger** tile.

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-add-messenger.png" alt-text="Add Messenger product.":::

#### Configure Facebook pages

1. Sign in to the Facebook App that you want to add your bot to at [Facebook for Developers](https://developers.facebook.com/).

1. Select **Settings** under **Products** and **Messenger** on the side menu pane.

1. Add the pages you want to add the bot to by selecting **Add or Remove Pages** under the **Access Tokens** section. You can also create a new page by selecting **Create New Page**.

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-add-page-to-fb-app.png" alt-text="Add Facebook page to Facebook app." border="false":::

1. When adding pages, make sure **Manage and access Page conversations in Messenger** is set to **Yes**.

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-page-messenger-capability.png" alt-text="Messenger permission for page." border="false":::

1. Copy the _Page ID_ and _Token_ for each of the pages that you want to add the bot to. You'll need to select **Generate Token** for each page. You'll need these when you [configure the Facebook channel in Microsoft Copilot Studio](#configure-the-facebook-channel-in-microsoft-copilot-studio).

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-get-page-id-token.png" alt-text="Get page ID and token." border="false":::

### Configure the Facebook channel in Microsoft Copilot Studio

1. In Microsoft Copilot Studio, in the navigation menu under **Settings**, select **Channels**.

1. Select the **Facebook** tile to open the configuration window.

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb.png" alt-text="Facebook channel.":::

1. Paste the _App ID_, _App Secret_, _Page ID_, and _Token_ you retrieved earlier into their corresponding fields.

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-add-channel.png" alt-text="Provide Facebook app and page information." border="false":::

1. At least one page is required, but you can select **Add Page** to add additional pages.

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-add-pages.png" alt-text="Provide multiple Facebook pages' information." border="false":::

1. Select **Add** and wait for the success confirmation message. Once successful, copy the _Callback URL_ and _Verify token_. You'll need these when you [connect your Facebook app to Microsoft Copilot Studio](#connect-your-facebook-app-to-microsoft-copilot-studio).

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-get-callback-info.png" alt-text="Get callback information for Facebook." border="false":::

### Connect your Facebook app to Microsoft Copilot Studio

1. Sign in to the Facebook app that you want to add your bot to at [Facebook for Developers](https://developers.facebook.com/).

1. Select **Settings** under **Products** and **Messenger** on the side menu pane.

1. Under the **Webhooks** section, select **Add Callback URL**.

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-add-callbackurl.png" alt-text="Set up webhooks for Facebook app." border="false":::

1. Provide the _Callback URL_ and _Verify token_ from the [Configure the Facebook channel in Microsoft Copilot Studio](#configure-the-facebook-channel-in-microsoft-copilot-studio) section and select **Verify and Save**.

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-webhook-setting.png" alt-text="Add Callback URL and Verify Token." border="false":::

1. Select **Add Subscriptions** for each page that you want to add the bot to.  

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-add-webhooks-subscription.png" alt-text="Add webhook subscription." border="false":::

1. Select the following fields:
    - **messages**
    - **messaging_postbacks**
    - **messaging_optins**
    - **message_deliveries**

1. Select **Save**.

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-subscription-fields.png" alt-text="Add webhook subscription fields." border="false":::

### Submit for Facebook review

You need to submit your app for Facebook review before you can make your Facebook app public. Facebook requires a Privacy Policy URL and Terms of Service URL. You need to provide those on the Facebook basic app settings page (after signing in to your app at [Facebook for Developers](https://developers.facebook.com/), select **Basic** under **Settings** on the side menu pane).

The [Code of Conduct](https://investor.fb.com/corporate-governance/code-of-conduct/default.aspx) page contains third-party resources to help create a privacy policy. The [Terms of Service](https://www.facebook.com/terms.php) page contains sample terms to help create an appropriate Terms of Service document.

Facebook has its own [review process](https://developers.facebook.com/docs/messenger-platform/app-review) for apps that are published to Messenger. You can learn more about it at [Sample submissions](https://developers.facebook.com/docs/apps/review/sample-submissions/) and [Common rejection reasons](https://developers.facebook.com/docs/apps/review/common-rejection-reasons/). Your bot will be tested to ensure it is compliant with [Facebook's Platform Policies](https://developers.facebook.com/docs/messenger-platform/policy-overview) before approved by Facebook to become public.

### Make the app public and publish the page

Until the app is published, it is in [Development Mode](https://developers.facebook.com/docs/apps/managing-development-cycle). The bot will not be public and it will work only for admins, developers, and testers.

After the review is successful, in the app's **Dashboard** under **App Review**, set the app to **Public**. Ensure that the Facebook Page associated with the bot is published. The status appears in the **Pages** settings.

## Remove your bot from Facebook Messenger

When you do not want the bot to be reachable in Facebook Messenger, you can remove the bot from Facebook.

1. In Microsoft Copilot Studio, in the navigation menu under **Settings**, select **Channels**.

1. Select the **Facebook** tile and then **Delete**.

   :::image type="content" source="media/publication-add-bot-to-facebook/channel-fb-delete-channel.png" alt-text="Delete Facebook channel." border="false":::

## Updating bot content for existing conversations on Facebook

To prevent disruptions during a chat between a user and the bot, existing conversations will not be updated to the latest bot content immediately after a new publish. Instead, the content will be updated after the conversation has been idle for 30 minutes.

New conversations between user and the bot will have the latest published bot content.

## Known limitations

- You will need to create a new bot if the Customer Satisfaction (CSAT) survey shows up as a non-interactable card image for a bot created during public preview to access the latest CSAT content.
- It might take a few minutes before the bot becomes reachable by users on Facebook pages after the Facebook channel is added.
- After removing the Facebook channel, it might take a few minutes before the bot is removed fully and becomes unreachable on Facebook Messenger.
- After removing a Facebook page, it might take a few minutes before the bot becomes unreachable by visitors to the removed page through Facebook Messenger.

[!INCLUDE[footer-include](includes/footer-banner.md)]
