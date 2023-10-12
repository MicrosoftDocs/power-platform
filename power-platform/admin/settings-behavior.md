---
title: "Manage behavior settings  | MicrosoftDocs"
description: View and manage behavior settings for Microsoft Dataverse.
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/12/2023
ms.subservice: admin
ms.author: sericks 
search.audienceType: 
  - admin
contributors:
- adrianorth
---
# Manage behavior settings 

Use Behavior settings to adjust how model-driven apps appear and function. These settings do not apply to canvas apps, except where noted.

These settings can be found in the Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Product** > **Behavior**.

Make sure you have the System Administrator security role or equivalent permissions to update the business closures.

**Check your security role**

- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

## Settings

> [!div class="mx-tableFixed"]
> |Settings|Description| Default value |
> |--------------|-----------------|-----|  
> |**Release channel**||  |
> |Model-driven apps release channel|If this setting is set to **Semi-annual channel**, users in the org will use features from the current release wave, which is existing behavior. <br><br>If this setting is set to **Monthly channel**, users will use features from the current monthly release. <br><br>This setting can be changed at anytime and users will be switched after one to two browser refreshes. More information: [Release channels for your model driven app](/power-apps/maker/model-driven-apps/channel-overview)   | Semi-annual channel | 
> |**Basic behavior**||  |
> |Auto save|If **On**, after a record is created (initially saved), any changes made to a form will automatically be saved thirty seconds after the change is made. The 30-second period starts again after a change is made. If no changes are made, the automatic save doesn’t happen. More information: [Manage auto-save](/dynamics365/customer-engagement/customize/manage-auto-save)| On |
> |Load default static content from Content Delivery Network| Canvas apps will load out-of-the-box static content from the Azure Content Delivery Network (CDN) service. For firewall restrictions and IP approved list related issues, system administrators can select **Off** to disable the Azure Content Delivery Network feature. <br><br>**Note**: This setting does not apply to model-driven apps as they do not use CDN currently.|   On|
> |Share reassigned records with original owner|Select whether a record is shared with the original owner of the record, or completely reassigned to another user.|  Off |
> |Open in application mode|Select **On** to enable application mode. When this mode is enabled, customer engagement apps can be opened in a browser without menus, navigation, or toolbars. Hiding these parts of the browser causes customer engagement apps to appear like a separate application rather than a website. |  Off|
> |**Formatting**||  |
> |Full name display order|Select the order in which you want customer and user names to be displayed. |  First Name |
> |Display currencies using|Set how to display currencies, either by a currency symbol, which is the default setting, or by currency code. For example, a currency symbol could be $, and the currency code could be USD.|  Currency symbol | 
> |Pricing decimal precision|Select how many decimal points to use for a currency.| 0|
> |**Display behavior**|||  
> |Use updated experience for classic settings where possible.| If **On**, user will be redirected to the modern experience when accessing some settings from the legacy experience.  More information: [New location for admin settings](admin-settings.md#new-location-for-admin-settings).|Off for existing environment. <br><br>On for new environment created after October 2021. |
> |Show the Switch to classic buttons in Power Apps| When **On**, makers are able to open and continue to use the deprecated classic app, view, and form designers.  More information: [Classic app, form, and view designers are deprecated](../important-changes-coming.md#classic-app-form-and-view-designers-are-deprecated) |Off |
> |Show app download message|If **On**, users will see a message regarding downloading the Dynamics 365 for tablets app.| On|
> |Show legacy app to everyone, not just admin|The legacy web app, also known as *Dynamics 365 - custom*, is hidden from end users when a new environment is provisioned. It is always visible to those with System Administrator and System Customizer roles, and to other custom roles with similar privileges.  More information: [Dynamics 365 - custom](enable-unified-interface-only.md#dynamics-365---custom).| On | 
> |Legacy app name|Enter the label to use for the legacy app. This appears on the Dynamics 365 home page. More information: [Dynamics 365 - custom](enable-unified-interface-only.md#dynamics-365---custom).|Dynamics 365 - custom |
> |Show welcome screen on sign in|Indicate if you want users to see the welcome screen when they sign in. |  On|
> |Show Microsoft Power Automate on forms and in the site map|Select **On** to enable embedded Power Automate flows in your organization. More information: [Enable embedded Power Automate to automate processes](enable-embedded-flow-in-your-organization.md).|  On | 
> |Show dashboard cards in expanded state|Select **On** to see the detailed card form in a dashboard. If set to **Off**, only the header and minimal details are displayed in the card form.|  Off|
> |**Lookup behavior**|| | 
> |Minimum number of characters to trigger typeahead search  | Enter the minimum number of characters that trigger an automatic typeahead search in a lookup field in model-driven apps. <br><br>This setting can be used to improve lookup performance, particularly when the underlying environment database has huge amounts of data.  | 2 |
> | Delay between character inputs that will trigger a search | Enter the delay interval in milliseconds that will be introduced in lookups before a search is executed. <br><br> This can be used to improve lookup performance, particularly when the underlying environment database has huge amounts of data.   | 250 ms|

[!INCLUDE[footer-include](../includes/footer-banner.md)]
