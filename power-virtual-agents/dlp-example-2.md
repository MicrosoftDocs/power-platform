---
title: "Use DLP to block HTTP requests in chatbots"
description: "Block HTTP requests from being used by Power Virtual Agents chatbots."
keywords: "PVA"
ms.date: 9/9/2022
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: admin, dlp
ms.collection: virtual-agent
---



# Data loss prevention example 2 - Block HTTP requests from Power Virtual Agents chatbots

Bot makers in your organization can [extend their bots with Bot Framework Composer](advanced-bot-framework-composer.md) and use HTTP requests.

You can use data loss prevention policies to prevent bot makers from configuring these HTTP requests to help prevent data exfiltration.

See the [Configure data loss prevention for Power Virtual Agents chatbots](admin-data-loss-prevention.md) topic for information about other DLP-related connectors.

### Configure DLP to block HTTP requests in the Power Platform admin center

1.  In the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) select **Data policies**.

    1.  To create a new policy, select **New policy**, enter a name for the policy, and select **Next**.

        ![Screenshot of the Power Platform admin center  open to the Data policies  New Policy section.](media/admin-data-loss-prevention/image3.png)

    1.  To add this connector to an existing DLP policy, select the policy you want to update, and then select **Edit policy**.

        ![Screenshot of the Power Platform admin center  open to the Data policies section  with an existing policy and the Edit Policy button highlighted.](media/admin-data-loss-prevention/image4.png)

1.  Under **Prebuilt connectors**, find the **HTTP connector**.

1.  Select the connector's menu ellipses (shown as three dots in a vertical line next to the connector's name), and then select **Block**. Select **Next**.

    ![Screenshot of the Power Platform admin center  showing the contextual menu for a connector available from the menu icon.](media/admin-data-loss-prevention/image5.png)



1.  Under **Review**, Select **Update policy** to apply the DLP changes.

    ![Screenshot of the review screen when creating a DLP policy ](media/admin-data-loss-prevention/image6.png)

### Confirm policy enforcement in Power Virtual Agents

You can confirm that this connector is being used in the DLP policy from the Power Virtual Agents web app.

First, open your bot from the environment where the DLP policy is applied. Go to the authoring canvas, and open (or create) a topic that includes a custom Bot Framework Trigger that uses a HTTP request.

If the policy is enforced, you'll see an error in the [**Topic checker**](authoring-topic-management.md#topic-errors) that says DLP policies are blocking HTTP requests for the affected node. The error is titled "HTTP requests blocked" and includes a message advising you to remove the HTTP request or contact an admin.

![Screenshot of the Topic checker in Power Virtual Agents with an error message saying HTTP requests are blocked.](media/admin-data-loss-prevention/image9.png)

[!INCLUDE[footer-include](includes/footer-banner.md)]