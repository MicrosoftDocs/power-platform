---
title: Change environment type 
description: Change the environment type
author: sericks007

ms.component: pa-admin
ms.topic: how-to
ms.date: 05/01/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
search.audienceType: 
  - admin
---
# Change the environment type

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

You may decide that your customization work developed and tested on a sandbox environment is now ready to go live. If you’ve placed your sandbox environment in administration mode, only users with System Administrator or System Customizer security roles are able to sign in to that environment. Once you change the environment type to production, all your users can access your organization. When you configure or edit an environment, you can change the environment from:

- Production to sandbox
- Sandbox to production

Make sure you have the System Administrator or Environment Admin role credentials. To check your security role, go to [View your user profile](/powerapps/user/view-your-user-profile). If you don’t have the correct permissions, contact your system administrator.

**To change the environment type**: 

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select the environment you want to change.
1. In the command bar, click **Convert to production** or **Convert to sandbox**.
1. Click **Continue**.
1. On the confirmation page, click **OK**.

#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select the environment you want to change.
1. In the command bar, click **Convert to production** or **Convert to sandbox**.
1. Click **Continue**.
1. On the confirmation page, click **OK**.
---


[!INCLUDE[footer-include](../includes/footer-banner.md)]
