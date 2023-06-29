---
title: Enable maker welcome content (preview)
description: Enable welcome content for makers for Managed Environments.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/25/2023
author: AngelMarshall
ms.author: tsmarsha
ms.reviewer: sericks
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Enable maker welcome content (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]


In Managed Environments, admins can provide customized welcome content to help their makers get started with [Power Apps](https://make.powerapps.com). When you add your own help content, it replaces the default Power Apps first-time help experience for makers. 

When the welcome content is enabled, upon signing in to Power Apps, makers will be greeted with customized getting started information. More information: [Use the learn hub](/power-apps/maker/common/learn-hub#from-your-org-preview)

> [!div class="mx-imgBorder"] 
> ![Welcome content for makers.](media/welcome/maker-welcome-1.png "Welcome content for makers") 

> [!Important]
> [!include [preview](../includes/cc-preview-features-definition.md)]

## Add welcome content

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. Select **Environments** in the left navigation pane, select a managed environment, and then select **Edit Managed Environment** on the top menu bar.

   > [!div class="mx-imgBorder"] 
   > ![Edit Managed Environment.](media/welcome/edit-managed-environment.png "*Edit Managed Environment") 

3. Enter the help content in the text box under **Maker Welcome content**. 
 
    > [!div class="mx-imgBorder"] 
    > ![Enter your welcome content.](media/welcome/maker-welcome-2.png "Enter your welcome content") 
   
   
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

5. Select **Preview in a new tab** to see how the text you entered, or Markdown will render.

   > [!div class="mx-imgBorder"] 
   > ![Preview content.](media/welcome/maker-welcome-3.png "Preview content") 

## Use PowerShell to add and update welcome content

You can use PowerShell to add and update welcome content for makers. 

#### Import module

Run the following command to import a module.

```powershell
import-Module -Name Microsoft.PowerApps.Administration.PowerShell 
```

#### Use Markdown content for maker onboarding for a specified Managed Environment

The following script is an example PowerShell script that uses Markdown content for maker onboarding for a specified Managed Environment. After you run the script, you will see the Markdown content in the **Maker welcome content** section of the Managed Environment's settings. 

The Markdown parameter can span over multiple lines if it is in double quotes.

```powershell
SetManagedEnvironmentMakerOnboardingMarkdownContent -EnvironmentId 8d996ece-8558-4c4e-b459-a51b3beafdb4 -Markdown "## Welcome to Power Apps 
### Let's get started" 
```

#### Use a "Learn more" URL for maker onboarding for a specified Managed environment

The following script is an example PowerShell script that uses a "Learn more" URL for maker onboarding for a specified Managed Environment. After you run the script, you will see a "Learn more" URL populated in the **Maker welcome content** section of the Managed Environment's settings. 

```powershell
SetManagedEnvironmentMakerOnboardingLearnMoreUrl -EnvironmentId 8d996ece-8558-4c4e-b459-a51b3beafdb4 -LearnMoreUrl "www.microsoft.com" 
```
 

