---
title: "Enable the hybrid experience  | MicrosoftDocs"
description: Some features are not yet present in Unified Interface but can be enabled for display as legacy dialogs in Unified Interface through the hybrid experience.
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/27/2024
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
# Enable the hybrid experience

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

<!-- legacy procedure -->

Most of the core functionalities of sales and customer service have moved to the [Unified Interface](about-unified-interface.md) experience. Some of the features that are not yet on Unified Interface can be accessed in the Unified Interface client. 

The following features are not yet present in Unified Interface but can be enabled for display as legacy dialogs in Unified Interface through the hybrid experience.

- [Advanced Find](/power-apps/user/advanced-find) 
- Bulk edit
- [Record sharing](/power-apps/user/assign-or-share-records)
- [Audit History](/power-apps/developer/common-data-service/auditing-overview)
- All options under **Set Personal Options** (![Settings gear.](media/settings-gear-icon.png "Settings gear"))
- [Reports](/power-apps/user/work-with-reports)

 > [!NOTE]
 > The hybrid experience is not available for on-premises versions, on mobile, or within Teams.  

These features are enabled through a setting in System Settings.

1. In the web app, go to **Settings** (![Settings.](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

2. Select **Settings** > **Administration**.

3. Select **System Settings**, and then select the **General** tab. 

4. Set **Enable embedding of certain legacy dialogs in Unified Interface browser client** to **Yes**.

![Enable hybrid experience.](media/hybrid-system-settings.png "Enable hybrid experience")

When you enable the hybrid experience, commands appear on the command bar. For example, when you select an account, **Edit**, **Merge**, and **Share** commands are available.

![Commands on command bar.](media/hybrid-edit-merge-share.png "Commands on command bar")

You can select **Share** to share this account with another user or team.

![Share account.](media/hybrid-share-account.png "Share account")

If you disable the hybrid experience, these commands are not available in the command bar.

![Commands not on command bar.](media/hybrid-no-edit-merge-share.png "Commands not on command bar")

### See also  
 [Unified Interface](about-unified-interface.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
