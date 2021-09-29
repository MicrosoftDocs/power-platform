---
title: "Manage behavior settings  | MicrosoftDocs"
description: View and manage behavior settings for Microsoft Dataverse.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/27/2021
ms.subservice: admin
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Manage behavior settings 

Use Behavior settings to adjust how model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, appear and functions.

These settings can be found in the Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Product** >**Behavior**.

Make sure you have the System Administrator security role or equivalent permissions to update the business closures.

**Check your security role**

- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

## Settings

> [!div class="mx-tableFixed"]
> |Settings|Description|  
> |--------------|-----------------|  
> |**Basic behavior**||  
> |Auto save|Default: On. If **On**, after a record is created (initially saved), any changes made to a form will automatically be saved thirty seconds after the change is made. The 30-second period starts again after a change is made. If no changes are made, the automatic save doesn’t happen. More information: [Manage auto-save](/dynamics365/customer-engagement/customize/manage-auto-save)|  
> |Load default static content from Content Delivery Network|Default: On. Customer engagement apps will load out-of-the-box static content from the Azure Content Delivery Network (CDN) service. For firewall restrictions and IP approved list related issues, system administrators can select **Off** to disable the Azure Azure Content Delivery Network feature.|  
> |Share reassigned records with original owner|Default: Off. Select whether a record is shared with the original owner of the record, or completely reassigned to another user.| 
> |Open in application mode|Default: Off. Select **On** to enable application mode. When this mode is enabled, customer engagement apps can be opened in a browser without menus, navigation, or toolbars. Hiding these parts of the browser causes customer engagement apps to appear like a separate application rather than a website. |  
> | Use Unified Interface only | Default: Off. When you enable Unified Interface Only, all your apps, including those designed for the legacy web client, run in Unified Interface all the time. Environments with legacy web client apps will show a notification on the home page, prompting System Administrators to update those apps to Unified Interface.|
> |Use legacy form rendering|Default: Off. For compatibility, use the legacy form rendering engine. Note that performance may be adversely affected. If you have forms that include unsupported customizations, these enhancements can cause compatibility problems. To avoid this, you can temporarily turn the form enhancements off by setting to **On**. We recommend that you reset this setting to **Off** after addressing scripting problems so you can take advantage of optimized forms. Note: When a form that includes unsupported customizations is used, such as unsupported JavaScript, the form may fail to load or the user will receive an error message.<br /><ul><li>If the form just fails, set the Use legacy form rendering option to **On**. If the form loads after you select this option, you may have unsupported customizations.</li><li>If the user receives an error, select "View the data that will be sent to Microsoft" and see the details in the (CrmScriptErrorReport) tags.</li> </ul> | 
> |**Formatting**||  
> |Full name display order|Default: First Name. Select the order in which you want customer and user names to be displayed. |  
> |Display currencies using|Default: Currency symbol. Set how to display currencies, either by a currency symbol, which is the default setting, or by currency code. For example, a currency symbol could be $, and the currency code could be USD.|  
> |Pricing decimal precision|Default: 0. Select how many decimal points to use for a currency.|  
> |**Display behavior**||  
> |Use updated experience for classic settings where possible.| Default: Off for existing environment, On for new environment created after Oct 2021. If **On**, user will be redirected to the modern experience when accessing some settings from the legacy experience.  More information: [New location for admin settings](admin-settings.md#new-location-for-admin-settings).|
> |Show app download message|Default: On. If **On**, users will see a message regarding downloading the Dynamics 365 for tablets app.|  
> |Show legacy app to everyone, not just admin|Default: On. The legacy web app, also known as *Dynamics 365 - custom*, is hidden from end users when a new environment is provisioned. It is always visible to those with System Administrator and System Customizer roles, and to other custom roles with similar privileges.  More information: [Dynamics 365 - custom](enable-unified-interface-only.md#dynamics-365---custom).|  
> |Legacy app name|Enter the label to use for the legacy app. This appears on the Dynamics 365 home page. The legacy label is *Dynamics 365 - custom*. More information: [Dynamics 365 - custom](enable-unified-interface-only.md#dynamics-365---custom).|
> |Show welcome screen on sign in|Default: On.|  
> |Show Microsoft Power Automate on forms and in the site map|Default: On. Select **On** to enable embedded Power Automate flows in your organization. More information: [Enable embedded Power Automate to automate processes](enable-embedded-flow-in-your-organization.md).|  
> |Show dashboard cards in expanded state|Default: Off. Select **On** to see the detailed card form in a dashboard. If set to **Off**, only the header and minimal details are displayed in the card form.|  
> |**Lookup behavior**||  
> |Enable advanced lookup in model-driven apps|Default: Off. If enabled for [early access 2021 wave 2](opt-in-early-access-updates.md) then the default setting is **On**. For more information on how to use this feature, see [Advanced lookup](/powerapps/user/lookup-field#advanced-lookup).|  
> |Minimum number of characters to trigger typeahead search  | Enter the minimum number of characters that trigger an automatic typeahead search in a lookup field in model-driven apps. <br />This setting can be used to improve lookup performance, particularly when the underlying environment database has huge amounts of data. <br /> Default value: 2  |
> | Delay between character inputs that will trigger a search | Enter the delay interval in milliseconds that will be introduced in lookups before a search is executed. <br /> This can be used to improve lookup performance, particularly when the underlying environment database has huge amounts of data. <br /> Default value: 250ms  |

[!INCLUDE[footer-include](../includes/footer-banner.md)]
