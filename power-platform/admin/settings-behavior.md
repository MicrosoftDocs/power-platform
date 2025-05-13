---
title: Manage behavior settings 
description: View and manage behavior settings for Microsoft Dataverse.
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 04/24/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks 
search.audienceType: 
  - admin
contributors:
- adrianorth
---
# Manage behavior settings 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Use behavior settings to adjust how model-driven apps appear and function. These settings don't apply to canvas apps, except where noted.

To adjust the settings in the Power Platform admin center for an environment, follow these steps:

## [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Product**, and then select **Behavior**. 

## [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Product**, and then select **Behavior**. 
---

Make sure you have the System Administrator security role or equivalent permissions to update the settings. To check your security role, see [View your user profile](/powerapps/user/view-your-user-profile). If you don’t have the correct permissions, contact your system administrator.

## Release channel

|Settings|Description| Default value |
|--------------|-----------------|-----|  
|Model-driven app release channel|If this setting is set to **Semi-annual channel**, users in the organization use features from the _current release wave_, which is existing behavior. <br><br>If this setting is set to **Monthly channel**, users use features from the _current monthly release_. <br><br>This setting can be changed at any time and users are switched after one to two browser refreshes. Learn more at [Release channels for your model driven app](/power-apps/maker/model-driven-apps/channel-overview).   | Auto<br><br>**Note**: Behavior for the **Auto** option is changing with 2024 release wave 2. Learn more at [Configuring release channel](/power-apps/maker/model-driven-apps/channel-overview#configuring-release-channel). | 

## Basic behavior

|Settings|Description| Default value |
|--------------|-----------------|-----|  
|Auto save|If **On**, after a record is created (initially saved), any changes made to a form are automatically saved 30 seconds after the change is made. The 30-second period starts again after a change is made. If no changes are made, the automatic save doesn’t happen. Learn more at [Manage auto-save](/dynamics365/customer-engagement/customize/manage-auto-save).| On |
|Load default static content from Content Delivery Network| Canvas apps load out-of-the-box static content from the Azure Content Delivery Network (CDN) service. For firewall restrictions and IP approved list related issues, system administrators can select **Off** to disable the Azure Content Delivery Network feature. <br><br>**Note**: This setting doesn't apply to model-driven apps as they don't use CDN currently.|   On|
|Share reassigned records with original owner|Select whether a record is shared with the original owner of the record, or reassigned to another user.|  Off |
|Open in application mode|Select **On** to enable application mode. When this mode is enabled, customer engagement apps can be opened in a browser without menus, navigation, or toolbars. Hiding these parts of the browser causes customer engagement apps to appear like a separate application rather than a website. |  Off|

## Formatting

|Settings|Description| Default value |
|--------------|-----------------|-----|  
|Full name display order|Select the order in which you want customer and user names to be displayed. |  First name |
|Display currencies using|Set how to display currencies, either by a currency symbol, which is the default setting, or by currency code. For example, a currency symbol could be $, and the currency code could be USD.|  Currency symbol | 
|Pricing decimal precision|Select how many decimal points to use for a currency.| 2|

## Display behavior

|Settings|Description| Default value |
|--------------|-----------------|-----|  
|Use updated experience for classic settings where possible.| If **On**, user is redirected to the modern experience when accessing some settings from the legacy experience. Learn more at [New location for admin settings](admin-settings.md#new-location-for-admin-settings).|**Off** for existing environment. <br><br>**On** for new environment created after October 2021. |
|Show the Switch to classic buttons in Power Apps| When **On**, makers are able to open and continue to use the deprecated, classic app view and form designers. Learn more at [Classic app, form, and view designers are deprecated](../important-changes-coming.md#classic-app-form-and-view-designers-are-deprecated). |On |
|Show app download message|If **On**, users see a message regarding downloading the Dynamics 365 for tablets app.| On|
|Show legacy app to everyone, not just admins|The legacy web app, also known as *Dynamics 365 - custom*, is hidden from end users when a new environment is provisioned. It's always visible to those with System Administrator and System Customizer roles, and to other custom roles with similar privileges.  Learn more at [Dynamics 365 - custom (hidden for users)](enable-unified-interface-only.md#dynamics-365---custom-hidden-for-users).| Off | 
|Show legacy app for admins|Indicate if the legacy web app, also known as *Dynamics 365 - custom*, is hidden from System Administrator and System Customizer roles, and to other custom roles with similar privileges. Learn more at [Dynamics 365 - custom (hidden for admins)](enable-unified-interface-only.md#dynamics-365---custom-hidden-for-admins).| Auto<br><br>**Note**: New environments are defaulted to **Off**. | 
|Legacy app name|Enter the label to use for the legacy app. This appears on the Dynamics 365 home page. Learn more at [Dynamics 365 - custom (hidden for users)](enable-unified-interface-only.md#dynamics-365---custom-hidden-for-users).|Dynamics 365 - custom |
|Show welcome screen on sign in|Indicate if you want users to see the welcome screen when they sign in. |  On|
|Show Power Automate on forms and in the site map|Select **On** to enable embedded Power Automate flows in your organization. Learn more at [Enable embedded Power Automate to automate processes](enable-embedded-flow-in-your-organization.md).<br><br>**Important:** Once the Power Automate integration option has been enabled, it can't be disabled.|  On | 
|Show dashboard cards in expanded state|Select **On** to see the detailed card form in a dashboard. If set to **Off**, only the header and minimal details are displayed in the card form.|  Off|

## Lookup behavior

|Settings|Description| Default value |
|--------------|-----------------|-----|  
|Minimum number of characters to trigger typeahead search  | Enter the minimum number of characters that trigger an automatic typeahead search in a lookup field in model-driven apps. <br><br>This setting can be used to improve lookup performance, particularly when the underlying environment database has huge amounts of data.  | Field is empty by default. |
| Delay between character inputs that trigger a search | Enter the delay interval in milliseconds that is introduced in lookups before a search is executed. <br><br> This can be used to improve lookup performance, particularly when the underlying environment database has huge amounts of data.   | 250 ms|

[!INCLUDE[footer-include](../includes/footer-banner.md)]
