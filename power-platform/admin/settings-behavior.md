---
title: "Manage behavior settings | MicrosoftDocs"
description: View and manage behavior settings for Common Data Service for Apps.
ms.custom: ""
ms.date: 09/14/2018
ms.reviewer: ""
ms.service: "crm-online"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "get-started-article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
caps.latest.revision: 31
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - Powerplatform
---
# Manage behavior settings 

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Use Behavior settings to adjust how Dynamics 365 (online) appears and functions.

These settings can be found in the Power platform Admin center by going to **Environments** > [select an environment] > **Settings** > **Behavior**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the business closures.

**Check your security role**

- Follow the steps in [View your user profile](https://docs.microsoft.com/dynamics365/customer-engagement/basics/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

## Settings

|Settings|Description|  
|--------------|-----------------|  
|**Basic behavior**||  
|Default app name|Enter the label to use for the default app. This appears on the Dynamics 365 home page. The default label is Dynamics 365 - custom. More information: For admins and end users: [Introducing the Dynamics 365 home page](https://docs.microsoft.com/dynamics365/customer-engagement/admin/quickly-navigate-office-365-app-launcher)|  
|Auto save|Default: On. If **On**, after a record is created (initially saved), any changes made to a form will automatically be saved thirty seconds after the change is made. The 30-second period starts again after a change is made. If no changes are made, the automatic save doesn’t happen. More information: [Manage auto-save](https://docs.microsoft.com/dynamics365/customer-engagement/customize/manage-auto-save)|  
|Load default static content from Content Delivery Network|Default: On. Dynamics 365 will load out-of-the-box static content from the Azure Content Delivery Network (CDN) service. For firewall restrictions and IP whitelisting related issues, system administrators can select **Off** to disable the Azure Azure Content Delivery Network feature.|  
|Share reassigned records with original owner|Default: Off. Select whether a record is shared with the original owner of the record, or completely reassigned to another user.| 
|Open in application mode|Default: Off. Select **On** to enable application mode. When this mode is enabled, Dynamics 365 can be opened in a browser without menus, navigation, or toolbars. Hiding these parts of the browser causes Dynamics 365 to appear like a separate application rather than a website. |  
|Use legacy form rendering|Default: Off. For compatibility, use the legacy form rendering engine. Note that performance may be adversely affected. If you have forms that include unsupported customizations, these enhancements can cause compatibility problems. To avoid this, you can temporarily turn the form enhancements off by setting to **On**. We recommend that you reset this setting to **Off** after addressing scripting problems so you can take advantage of optimized forms. Note: When a form that includes unsupported customizations is used, such as unsupported JavaScript, the form may fail to load or the user will receive an error message.<br /><br /><ul><li>If the form just fails, set the Use legacy form rendering option to **On**. If the form loads after you select this option, you may have unsupported customizations.</li>| <li>If the user receives an error, select "View the data that will be sent to Microsoft" and see the details in the <CrmScriptErrorReport> tags.</li> </ul>
|**Formatting**||  
|Full name display order|Default: First Name. Select the order in which you want customer and user names to be displayed. |  
|Display currencies using|Default: Currency symbol. Set how to display currencies, either by a currency symbol, which is the default setting, or by currency code. For example, a currency symbol could be $, and the currency code could be USD.|  
|Pricing decimal precision|Default: 0. Select how many decimal points to use for a currency.|  
|**Display behavior**||  
|Show app download message|Default: On. If **On**, users will see a message regarding downloading the Dynamics 365 for tablets app.|  
|Show default app on landing page and in app switcher|Default: On. Change to No to prevent the default app from appearing on the Dynamics 365 home page and in the app selector menu. More information: For admins and end users: [Introducing the Dynamics 365 home page](https://docs.microsoft.com/dynamics365/customer-engagement/admin/quickly-navigate-office-365-app-launcher)|  
|Display welcome screen on sign in|Default: On. Select **On** to see the detailed card form in a dashboard. If set to **Off**, only the header and minimal details are displayed in the card form.|  
|Show Microsoft Flow on forms and in the site map|Default: On. Select **On** to enable embedded Microsoft Flows in your organization. More information: [Enable embedded Flow to automate processes](https://docs.microsoft.com/dynamics365/customer-engagement/admin/enable-embedded-flow-in-your-organization)|  
|Show dashboard cards in expanded state|Default: Off. Select **On** to see the detailed card form in a dashboard. If set to **Off**, only the header and minimal details are displayed in the card form.|  