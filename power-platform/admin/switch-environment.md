---
title: "Change environment type | MicrosoftDocs"
description: Change the environment type
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Change the environment type

You may decide that your customization work developed and tested on a sandbox environment is now ready to go live. If you’ve placed your sandbox environment in administration mode, only users with System Administrator or System Customizer security roles are able to sign in to that environment. Once you change the environment type to production, all your users can access your organization. When you configure or edit an environment, you can change the environment from:

- Production to sandbox
- Sandbox to production

**To change the environment type**: 

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) and sign in using Environment Admin or System Administrator role credentials.

2. From the left-side menu, select **Environments**, and then select an environment to change.

3. Select **Edit**

   > [!div class="mx-imgBorder"] 
   > ![](media/select-edit.png "Select Edit")

4. Under **Type**, choose the environment type to change to. 

   > [!div class="mx-imgBorder"] 
   > ![](media/switch-environment.png "Select environment type")

5. Select **Save**.