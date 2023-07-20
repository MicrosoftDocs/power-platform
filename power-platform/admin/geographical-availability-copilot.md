---
title: Enabling generative AI in non-US regions
description: Description about this article.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/20/2023
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
search.audienceType: 
  - admin 
---
# Enabling generative AI in non-US regions

With Copilots and generative AI features in Power Platform and Dynamics 365 you can build apps, flows, pages, chatbots, ask questions about your data, summarize information, reply to chat and email messages, generate content ideas, and get general question and answers related to the product.

These capabilities are currently available in environments in US region and support English language. This feature will allow you to try the copilot and generative features across Power Platform and Dynamics 365 CE from environments is non-US regions.

Note: The underlying infrastructure for copilots is currently available in the US region only. Accessing copilots or generative AI features from non-US region will result in data movement across regional boundaries.

You can allow copilots in your non-US environments by following these steps:

1.  Navigate to the environment settings page in Power Platform Admin Center.

2.  Click the Edit button on the "Allow data movement across regions for AI features" card.

![A screenshot of a computer Description automatically generated](media/image1.png)

3.  Read the information on the panel and select the check box to consent to the terms of use.

![A screenshot of a computer Description automatically generated](media/image2.png)

4.  Click "Enable" button.

![A screenshot of a computer Description automatically generated](media/image3.png)

After you consent, the status on the "Allow data movement across regions for AI features" card should show as "Allowed" copilots and generative AI features will be enabled in the environment.

You can disable the copilots in non-US environments by following these steps.

1.  Navigate to the environment settings page in Power Platform Admin Center.

2.  Click the Edit button on the "Allow data movement across regions for AI features" card.

![](media/image4.png)

3.  Unselect the terms of use check box.

![](media/image5.png)

4.  Click "Disable" button.

![A screenshot of a computer Description automatically generated](media/image1.png)

After you remove your consent, the status on the "Allow data movement across regions for AI features" card should show as "Not allowed" and the copilots and generative AI features will be disabled in the environment.

Please note that any data movement that happened while this feature was enabled cannot be reversed by removing your consent.

### Geographical availability of copilot & generative AI features

Currently all the Power Platform and Dynamics 365 copilots and generative features are available in US only. As the required infrastructure are available across other regions, copilots and generative AI features can be accessed from the same data boundary and an opt-in is not required.

