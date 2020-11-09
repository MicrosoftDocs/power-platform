---
title: "Enable the hybrid experience  | MicrosoftDocs"
description: Some features are not yet present in the Unified Interface but can be enabled for display as legacy dialogs in the Unified Interface through the hybrid experience.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/02/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Enable the hybrid experience

<!-- legacy procedure -->

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

Most of the core functionalities of sales and customer service have moved to the [Unified Interface](about-unified-interface.md) experience. Some of the features that are not yet on Unified Interface can now be accessed in the Unified Interface client. 

The following features are not yet present in the Unified Interface but can be enabled for display as legacy dialogs in the Unified Interface through the hybrid experience.

- [Advanced Find](https://docs.microsoft.com/powerapps/user/advanced-find) 
- Bulk edit
- [Merge records](https://docs.microsoft.com/powerapps/user/merge-duplicate-records)
- [Record sharing](https://docs.microsoft.com/powerapps/user/assign-or-share-records)
- [Audit History](https://docs.microsoft.com/powerapps/developer/common-data-service/auditing-overview)
- All options under **Set Personal Options** (![Settings gear](media/settings-gear-icon.png "Settings gear"))
- Reports

 > [!NOTE]
   > The hybrid experience is not available for on-premises versions or on mobile.  

These features are enabled through a setting in System Settings.

1. In the web app, go to **Settings** > **Administration** > **System Settings**.  
2. Select the **General** tab.  
3. Set **Enable embedding of certain legacy dialogs in Unified Interface browser client** to **Yes**.

![Enable hybrid experience](media/hybrid-system-settings.png "Enable hybrid experience")

When you enable the hybrid experience, commands appear on the command bar. For example, when you select an account, **Edit**, **Merge**, and **Share** commands are available.

![Commands on command bar](media/hybrid-edit-merge-share.png "Commands on command bar")

You can select **Share** to share this account with another user or team.

![Share account](media/hybrid-share-account.png "Share account")

If you disable the hybrid experience, these commands are not available in the command bar.

![Commands not on command bar](media/hybrid-no-edit-merge-share.png "Commands not on command bar")

### See also  
 [Unified Interface](about-unified-interface.md)
