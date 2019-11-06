---
title: "Add to Facebook"
description: "Add your bot to a Facebook page so Facebook users can interact with it."
keywords: "Channel, publish, Facebook"
ms.date: 10/31/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "publication, authoring"
ms.collection: virtual-agent
---

# Add Facebook channel

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

You can publish your bot to your Facebook app so that it uses the Facebook Messenger experience on Facebook pages that you specify.

You need a Facebook app, and an associated developer account, to connect your Power Virtual Agents bot to Facebook. 

## Configure Facebook and Power Virtual Agents

There are a number of steps involved in this process:

1. Configure Facebook app settings: retrieve your app Facebook app information, enable API access, add Facebook Messenger to your app, and configure the Facebook pages your app should appear on
2. Configure the Facebook publication channel in Power Virtual Agents
3. Connect your Facebook app to Power Virtual Agents (by using webhooks)

You will then need to submit your app for Facebook review before you can publish your app and either make it public or, if you have a Facebook Workplace account (which is the business-to-employee version of Facebook), you can also deploy your bot there. 

>[!IMPORTANT]
>This article is intended for experienced IT professionals who manage your organization's Facebook page and Facebook Workplace.

>[!NOTE]
>By publishing your bot to a Facebook page, some of your data, such as bot content and end user chat content, will be shared with Facebook (meaning that your data will flow outside of your [organization’s compliance and geographic or regional boundaries](data-location.md).
>For more information, see [Facebook's Platform Policies](https://developers.facebook.com/docs/messenger-platform/policy-overview).

Facebook Messenger, Facebook Workplace, and related services are subject to Facebook's own terms and conditions.  For support related to Facebook Messenger and Facebook Workplace, please contact Facebook directly.


### Configure Facebook app settings

**Retrieve Facebook app information:**

1. Log into the Facebook App at [Facebook for Developers](https://developers.facebook.com/) that you want to add your bot to.
1. Select **Basic** under **Settings** on the side menu panel. 
3. Copy the *App ID* and *App Secret*. You will need these when [configuring the Facebook channel](#configure-the-facebook-channel).

![Get Facebook App ID and secret](media/channel-fb-get-app-id-secret.png)

**Enable API access for your Facebook app:**

1. Log into the Facebook App at [Facebook for Developers](https://developers.facebook.com/) that you want to add your bot to.
1. Select **Advanced** under **Settings** on the side menu panel. 
2. Make sure **Allow API Access to App Settings** is set to **Yes**.  
4. Select **Save Changes** to confirm your changes.

![Facebook allow api access to app settings](media/channel-fb-allow-api-access.png)

**Add Facebook Messenger to your app:**

1. Log into the Facebook App at [Facebook for Developers](https://developers.facebook.com/) that you want to add your bot to.
2. Go to the **Dashboard**. Under the **Add a Product** section, select **Set Up** on the **Messenger** tile.

![Add Messenger product](media/channel-fb-add-messenger.png)

**Configure Facebook pages:**

1. Log into the Facebook App at [Facebook for Developers](https://developers.facebook.com/) that you want to add your bot to.
1. Select **Settings** under **Products** and **Messenger** on the side menu panel.
3. Add the pages you want to add the bot to by cliking **Add or Remove Pages** under the **Access Tokens** section. You can also create a new page by selecting **Create New Page**.

![Add Facebook page to Facebook app](media/channel-fb-add-page-to-fb-app.png)

5. When adding pages, make sure **Manage and access Page conversations in Messenger** is set to **Yes**.

![Messenger permission for page](media/channel-fb-page-messenger-capability.png)

6. Copy the *page ID* and *token* pair for the pages that you want to add the bot to.  You will need to select **Generate Token** for each page. You will need these when [configuring the Facebook channel](#configure-the-facebook-channel)

![Get pages ID and token](media/channel-fb-get-page-id-token.png)

### Configure the Facebook channel

**Configure the Facebook publication channel in Power Virtual Agents:**

1. In Power Virtual Agents, select **Manage** on the side navigation panel, and then go to the **Channels** tab. 
1. Select the **Facebook** tile to open the configuration window.
![Facebook channel](media/channel-fb.png)

2. Paste the information you retrieved earlier into the corresponding fields.

![Provide Facebook app and page information](media/channel-fb-add-channel.png)

3. At least one page is required, select **Add Page** to add additional pages. This step is only required if you want to add the bot to more than one Facebook page. 

![Provide multiple Facebook pages' information](media/channel-fb-add-pages.png)

4. Click **Add** and wait for the success confirmation message. Once successful, copy the *Callback URL* and *Verify Token*. You will need these when you [connect your Facebook app to Power Virtual Agents](#connect-your-facebook-app-to-power-virtual-agents).
![Get callback information for Facebook](media/channel-fb-get-callback-info.png)

### Connect your Facebook app to Power Virtual Agents 

**Connect your Facebook app to Power Virtual Agents:**

1. Log into the Facebook App at [Facebook for Developers](https://developers.facebook.com/) that you want to add your bot to.
1. Select **Settings** under **Products** and **Messenger** on the side menu panel.

1. Under the **Webhooks** section, select **Add Callback URL**.

![Setup webhooks for Facebook app](media/channel-fb-add-callbackurl.png)

2. Provide the *Callback URL* and *Verify Token* from the [Configure the Facebook channel](#configure-the-facebook-channel) step and select **Verify and Save**.

![Add Callback URL and verify token](media/channel-fb-webhook-setting.png)

3. Select **Add Subscriptions** for each page that you want to add the bot to.  

![Add webhook subscription](media/channel-fb-add-webhooks-subscription.png)

4. Select the following fields:
    - **messages**
    - **messaging_postbacks**
    - **messaging_optins**
    - **message_deliveries** 

5. Select **Save**.

![Add webhook subscription fields](media/channel-fb-subscription-fields.png)


### Submit for Facebook review

You need to submit your app for Facebook review before you can make your Facebook app public.  Facebook requires a Privacy Policy URL and Terms of Service URL.  You need to provide those on the Facebook basic app settings page (after logging into your app at [Facebook for Developers](https://developers.facebook.com/), select **Basic** under **Settings** on the side menu panel).

The [Code of Conduct](https://investor.fb.com/corporate-governance/code-of-conduct/default.aspx) page contains third-party resources to help create a privacy policy. The [Terms of Use](https://www.facebook.com/terms.php) page contains sample terms to help create an appropriate Terms of Service document.

Facebook has its own [review process](https://developers.facebook.com/docs/messenger-platform/app-review) for apps that are published to Messenger. You can learn more about it at [Sample submissions](https://developers.facebook.com/docs/apps/review/sample-submissions/) and [Common rejection reasons](https://developers.facebook.com/docs/apps/review/common-rejection-reasons/). Your bot will be tested to ensure it is compliant with [Facebook's Platform Policies](https://developers.facebook.com/docs/messenger-platform/policy-overview) before approved by Facebook to become public. 

### Make the app public and publish the page
Until the app is published, it is in [Development Mode](https://developers.facebook.com/docs/apps/managing-development-cycle). The bot will not be public and only work for admins, developers, and testers.

After the review is successful, in the App Dashboard under App Review, set the app to **Public**. Ensure that the Facebook Page associated with this bot is published. The status appears in **Pages** settings.

## Add bot to Facebook Workplace
[Facebook Workplace](https://workplace.facebook.com/help/work/) is the business-to-employee version of Facebook.

To add your bot to Facebook Workplace you will need information from your Facebook Workplace Advanced account and Power Virtual Agents. You also need to be the administrator of a Facebook Workplace Advanced account to create a custom integration. Learn more at [What are the differences between Workplace Standard and Workplace Advanced?](https://www.facebook.com/help/work/289530281467090) and [Facebook Workplace Custom Integrations](https://developers.facebook.com/docs/workplace/custom-integrations-new/).

**Create and connect a custom integration:**

1. Sign in to your [Facebook Workplace Advanced](https://www.facebook.com/workplace) account as the administrator.

2. Select **Admin Panel** on the side menu panel and then **Integrations**. Select **Create Custom Integration**.
![Create custom integration](media/channel-fb-wp-custom-integration.png)

3. Under **Integration details**, copy and securely store the *App ID*, *App Secret* and *Access Token* (the *Access token* will be used as the page access token). Make sure **Enabled** is set to **Yes**. Under **Integrations Permissions**, make sure **Message any member** is seleted.

![Get Facebook Workplace custom integration info](media/channel-fb-wp-get-integration-info.png)

4. Navigate to the custom integration page you created in the previous step. You can do this by searching the custom integration's name on the side search bar. Copy the *page ID* of the custom integration from the URL at *my.workplace.com/\{your-integration-name}-\{pageID}/*.

![Get Facebook Workplace custom integration page ID](media/channel-fb-wp-get-page-id.png)

5. Follow the steps under [Configure the Facebook channel](#cconfigure-the-facebook-channel) to provide the custom integration information.

**Set up webhooks for Facebook Workplace custom integration:**
1. Return to your Facebook Workplace custom integration settings by selecting **Admin Panel** on the side menu panel and select the custom integration you created.

2. Under the **Configure Webhooks** section, provide the **Callback URL** and **Verify Token** from previous section [Configure the Facebook channel](#configure-the-facebook-channel).  Select the **messages**, **messaging_postbacks** and **message_deliveries** fields. 
![Set Facebook Workplace custom integration webhook](media/channel-fb-wp-webhooks.png)

3. Save your custom integration by clicking **Save**.



## Remove bot from Facebook Messenger or Facebook Workplace
When you do not want the bot to be reachable via Facebook Messenger or Facebook Workplace, you can remove the bot from Facebook. 

1. In Power Virtual Agents, select **Manage** on the side navigation panel, and then go to the **Channels** tab. 
1. Select the **Facebook** tile and then **Delete**.

![Delete Facebook channel](media/channel-fb-delete-channel.png)

## Known limitation
- It may take a few minutes before the bot becomes reachable by a user on Facebook pages added after the Facebook channel is added.
- After removing the Facebook channel, it may take a few minutes before the bot is removed fully and becomes unreachable on Facebook Messenger and Facebook Workplace.
- After removing a Facebook page, it may take a few minutes before the bot becomes unreachable by visitors to the removed page through Facebook Messenger.

