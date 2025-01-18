---
title: Enable maker welcome content
description: Enable welcome content for makers for Managed Environments.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/23/2024
author: AngelMarshall
ms.author: tsmarsha
ms.reviewer: sericks
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
ms.contributors:
- hasharaf
---
# Enable maker welcome content

In Managed Environments, admins can provide customized welcome content to help their makers get started with [Power Apps](https://make.powerapps.com) and [Copilot Studio](https://copilotstudio.microsoft.com). When you add your own help content, it replaces the default Power Apps first-time help experience for makers. 

When the welcome content is used, upon signing in to Power Apps or Copilot Studio, makers are greeted with customized getting started information. More information: [Use the learn hub](/power-apps/maker/common/learn-hub#from-your-org-preview)

:::image type="content" source="media/welcome/maker-welcome-1.png" alt-text="Welcome content for makers.":::

## Add welcome content

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. Select **Environments** in the left navigation pane, select a managed environment, and then select **Edit Managed Environment** on the top menu bar.

3. Enter the help content in the text box under **Maker Welcome content**. 
 
    :::image type="content" source="media/welcome/maker-welcome-2.png" alt-text="Enter your welcome content.":::
      
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

4. Enter your own link to a wiki, internal site, or other reference material in the **Learn more URL** box.

5. Select **Preview in a new tab** to see how the text you entered, or Markdown renders.

   :::image type="content" source="media/welcome/maker-welcome-3.png" alt-text="Preview content.":::

## Use PowerShell to add and update welcome content

You can use PowerShell to add and update welcome content for makers. 

#### Import module

Run the following command to import a module.

```powershell
import-Module -Name Microsoft.PowerApps.Administration.PowerShell 
```

#### Use Markdown content for maker onboarding for a specified Managed Environment

The following script is an example PowerShell script that uses Markdown content for maker onboarding for a specified Managed Environment. After you run the script, you see the Markdown content in the **Maker welcome content** section of the Managed Environment's settings. 

The Markdown parameter can span over multiple lines if it is in double quotes.

```powershell
SetManagedEnvironmentMakerOnboardingMarkdownContent -EnvironmentId 8d996ece-8558-4c4e-b459-a51b3beafdb4 -Markdown "## Welcome to Power Apps 
### Let's get started" 
```

#### Use a "Learn more" URL for maker onboarding for a specified Managed environment

The following script is an example PowerShell script that uses a "Learn more" URL for maker onboarding for a specified Managed Environment. After you run the script, you see a "Learn more" URL populated in the **Maker welcome content** section of the Managed Environment's settings. 

```powershell
SetManagedEnvironmentMakerOnboardingLearnMoreUrl -EnvironmentId 8d996ece-8558-4c4e-b459-a51b3beafdb4 -LearnMoreUrl "www.microsoft.com" 
```
 

