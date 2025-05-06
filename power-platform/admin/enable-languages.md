---
title: "Regional and language options for your environment | MicrosoftDocs"
description: Set regional and language options for your environment 
author: sericks007
ms.component: pa-admin
ms.topic: concept-article
ms.date: 04/24/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks 
search.audienceType: 
  - admin
contributors:
- shmcarth 
---
# Regional and language options for your environment 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Add languages in your organization to display the user interface and Help in a language that’s different from the base language. 

The following table shows tasks that are associated with changing regional and language options for your organization.  

|Task |  Description   |
|--------|---------|
|  **Set the base language**  |  The base language determines default settings for regional and language options in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). After the base language is set, you can’t change it. |
| **Add or remove languages** | You can add or remove available languages in the **Settings** area. |
|  **Add and remove currencies**  | Similar to setting the base language, you select your organization's base currency during the purchasing process for a subscription. After the base currency is set, you can’t change it.<br /><br /> However, if your organization uses more than one currency to track financial transactions, you can add currencies. |
| **Deactivate or activate currency records** |   You can’t delete currency records that are being used by other records, such as opportunities or invoices. However, you can deactivate currency records so they won’t be available for future transactions. |

## Add a language  

These settings can be found in the Microsoft Power Platform admin center for an environment.

## [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Product**, and then select **Languages**. 

## [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Product**, and then select **Languages**. 
---

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the setting. To check your security role, go to [View your user profile](/powerapps/user/view-your-user-profile). If you don’t have the correct permissions, contact your system administrator.

Before users can start using a language pack to display a language, the language pack must be added in your organization.

> [!NOTE]
> To display the translated labels for the languages imported into an environment from a solution, the language must be added in the environment *before* you import the solution. Learn more in [Label text doesn’t display in additional languages after import](/powerapps/maker/data-platform/import-update-export-solutions#label-text-doesnt-display-in-additional-languages-after-import)

You see each language pack installed in your environment, with a check box to the left of each listed language pack.  

1. For each language pack that you want to provision (use), select the check box next to it. For each language pack that you want to unprovision (not use), clear the check box.

   > [!NOTE]
   >  More storage is required for each language you use. Not using a specific language doesn't uninstall the language or reduce the storage requirement. Only use languages that you need.

1. Select **Apply**.  

1. Select **OK** on any confirmation dialog boxes that open.  

   > [!NOTE]
   >  It may take an hour or more to provision or unprovision the languages.  

1. Select **Close** to close the **Language Settings** dialog box.

## Select the language to display the user interface and Help  

 Each user selects the language to display in an app. See [Languages tab options](/powerapps/user/set-personal-options#languages-tab-options).




[!INCLUDE[footer-include](../includes/footer-banner.md)]
