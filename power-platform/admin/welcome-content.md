---
title: Enable maker welcome content
description: Learn how to enable welcome content for makers for managed environments.
ms.component: pa-admin
ms.topic: how-to
ms.date: 9/23/2026
author: sidhartg
ms.author: sidhartg
ms.reviewer: ellenwehrle
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
ms.contributors:
  - hasharaf
contributors:
  - akadrno 
  - hasharaf
---

# Enable maker welcome content

In managed environments, admins can provide customized welcome content to help their makers get started with [Power Apps](https://make.powerapps.com), [Power Automate](https://make.powerautomate.com), and [Copilot Studio](https://copilotstudio.microsoft.com). When you add your own help content, it replaces the default Power Apps first-time help experience for makers. 

> [!VIDEO d378c495-3d91-4ba1-8646-aa335620d868]

When you use the welcome content, makers are greeted with customized getting-started information when they sign in to Power Apps or Copilot Studio. Learn more in [Use the learn hub](/power-apps/maker/common/learn-hub#from-your-org-preview).

## Add welcome content

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Manage**.

3. In the **Manage** pane, select **Environments**, and then select a managed environment.

4. On the top menu bar, select **Edit Managed Environment**.

5. Enter the help content in the text box under **Maker Welcome content**.
       
    You can enter plain text or use Markdown, as demonstrated in this example.
   
     ```
    ![Contoso](https://i.ibb.co/SNSTCx3/something.png)
    ## Welcome to Contoso Power Apps
    ### Let's get started with data
    Before you start using Power Apps, please refer to our company guidance
    1. **Get trained:** [Learning Videos]() and [training guides]()
    2. **Contribute ideas:** Submit an idea for a new app or flow idea at [Suggestion box]()
    3. **Learn from others:** [Top tips]() by expert makers at Contoso
    ```
    
    >[!NOTE]
    >For help with Markdown, see [Getting Started](https://www.markdownguide.org/getting-started/).

6. Enter your own link to a wiki, internal site, or other reference material in the **Learn more URL** box.
   
7. To require makers to acknowledge a privacy or terms-of-use link before continuing, select **Include consent button and log maker activity**, and then enter the URL in **Terms and conditions**. Makers must read and acknowledge the linked content before they can continue. Consent activity is logged and available for audit in Microsoft Purview.

   :::image type="content" source="media/welcome/maker-welcome-new.png" alt-text="Maker Welcome content settings, including the consent button and Terms and conditions field.":::


8. Select **Preview in a new tab** to see how the text you entered, or Markdown renders.

   :::image type="content" source="media/welcome/maker-welcome-new-2.png" alt-text="Preview content.":::