---
title: "Enable Unified Interface Only  | MicrosoftDocs"
description: Enable Unified Interface Only
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/15/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Enable Unified Interface Only

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 

In 2018, we introduced [Unified Interface](https://docs.microsoft.com/powerapps/user/unified-interface), the latest generation of web app design for the PowerApps model-driven apps and Dynamics 365 for Customer Engagement apps. It brings the best in usability, accessibility, functionality, and speed to every user. Improve how your business applications run by using only the Unified Interface. To learn how to enable it, see [How to enable Unified Interface Only](#how-to-enable-unified-interface-only-mode). For more information, see [What experiences are available in Unified Interface Only](#what-experiences-are-available-in-unified-interface-only-mode) and [FAQs](#faqs).

## When does the Unified Interface Only experience become available, and which environments are affected?

### New environments

All new Dynamics 365 for Customer Engagement environments (instances) and Common Data Service environments, including those created in existing tenants, will be provisioned in Unified Interface Only mode per the schedule below. 

**Note**: Some geographical regions will get the changes ahead of schedule by as much as 2-3 weeks. 

|Environment (instance) types  |Release date  |
|---------|---------|
|New Trial Dynamics 365 for Customer Engagement instances     | December 12, 2018         |
|New Trial and Production Common Data Service environments     | February 2, 2019        |
|New Production and Sandbox Dynamics 365 for Customer Engagement instances     | June 8, 2019       |

### Existing environments

Environments created before the scheduled release dates will not get this change automatically. Version 9.1.0.3448 onwards, administrators will have the option to change the environment settings to get the Unified Interface Only experience. It is recommended to switch to this mode by following the steps at [How to enable Unified Interface Only](#how-to-enable-unified-interface-only-mode).

> [!IMPORTANT]
> For existing environments, it’s recommended that you:
>
> - Read [What experiences are available in Unified Interface Only](#what-experiences-are-available-in-unified-interface-only-mode) and understand how it affects end users in your environment. 
> - Test the changes in your Trial or Sandbox environments before applying to your production environment.

## What experiences are available in Unified Interface Only mode 

### New immersive home page experience on web

Unified Interface Only mode provides easier and quicker access to apps, and gives users the ease of working in simple purpose-built apps. Users with just one app available to their security roles land directly in the app after signing in using the environment URL (for example: https://contoso.crm.dynamics.com/). The first page they see is determined by the first page of the app. 

Users with multiple apps see the list of apps available to them, and can navigate to them by selecting the app tile. 

> [!div class="mx-imgBorder"] 
> ![Unified interface apps](media/uci-apps-home-page.png "Unified interface apps")

> [!NOTE]
> This change applies to environment URL based sign-in (for example, https://contoso.crm.dynamics.com/) on the web. It doesn’t affect users who sign in using home.dynamics.com or other portals. The sign-in and home page experience for [!INCLUDE[pn_dyn-365_phones](../includes/pn-dyn-365-phones.md)] and [!INCLUDE [pn-dyn-365-tablets](../includes/pn-dyn-365-tablets.md)] remains unchanged. You can learn more at [Signing in and signing out (for iOS users)](https://docs.microsoft.com/en-us/dynamics365/customer-engagement/mobile-app/dynamics-365-phones-tablets-users-guide#signing-in-and-signing-out-for-ios-users) and [Signing in and signing out (for Android users)](https://docs.microsoft.com/en-us/dynamics365/customer-engagement/mobile-app/dynamics-365-phones-tablets-users-guide#signing-in-and-signing-out-for-android-users).

### Run all apps in Unified Interface Only mode

Unified Interface is centered around the concept of modular applications known as [model-driven apps](https://docs.microsoft.com/en-us/powerapps/maker/model-driven-apps/model-driven-app-overview). These apps allow developers and admins to streamline the data and functionality to provide exactly what end users need. 

In Unified Interface Only mode, all model-driven apps, including those created for the legacy web client, run in Unified Interface to provide superior performance and usability. 

### Deep linking apps and pages

With Unified Interface Only mode, all URLs (or deep links) open in Unified Interface in the context of the app being referenced. For more information on constructing links, see [Open forms, views, dialogs, and reports with a URL](https://docs.microsoft.com/powerapps/developer/model-driven-apps/open-forms-views-dialogs-reports-url).

If no app is referenced in the URL, the record or page opens without any navigation elements on the page. Navigation elements like sitemap are defined using an app; URLs without apps don’t have them. Users can use the app switcher to navigate to an app and continue their work.

### Dynamics 365 - custom

The legacy web client app, also known as *Dynamics 365 - custom*, is hidden from end users when a new environment is provisioned. It is always visible to those with System Administrator and System Customizer roles, and to other custom roles with similar privileges. The legacy web client app should only be used temporarily for backwards compatibility with custom and third-party legacy functionality that you have not migrated to Unified Interface. It is not designed for Unified Interface and can cause unexpected errors and experience. For the best user experience, port all custom and third-party functionality to model-driven apps for Unified Interface.

> [!div class="mx-imgBorder"] 
> ![Dynamics 365 - custom legacy app](media/dynamics-365-custom.png "Dynamics 365 - custom legacy app")

When Unified Interface Only mode is enabled, *Dynamics 365 - custom* opens in Unified Interface and not in the legacy web client. If users only have access to the Dynamics 365 – custom app and no other model-driven apps, they won’t be redirected automatically when signing in using the environment URL (for example, https://contoso.crm.dynamics.com/). Access to this app can be enabled in one of two ways:

- In Dynamics 365 for Customer Engagement, go to **Settings** > **Administration** > **System Settings** > **General** tab. Under **Show legacy Dynamics 365 - custom app**, select **Yes** for **Show this app to all users, not just administrators**.

> [!div class="mx-imgBorder"] 
> ![](media/d365ce-system-settings-legacy-app.png "System Settings for legacy app")

- In the Power Platform Admin center, go to **Environments** and select an environment. Go to **Settings** > **Behavior** > **Interface settings** and then turn on **Show legacy app to everyone, not just admins**.

### Advanced settings

When Unified Interface Only mode is enabled, environment settings can be accessed via a menu on the navigation bar. Follow these steps to navigate to **Advanced Settings**:

1. Select **Settings** (![Gear button](../admin/media/selection-rule-gear.gif "Gear button")) on the navigation bar.
2. Select **Advanced Settings**.

   > [!div class="mx-imgBorder"] 
   > ![Advanced Settings](media/uci-advanced-settings.png "Advanced Settings")

> [!NOTE]
> You need to select Advanced Settings from a Customer Engagement app page that's displayed in the Unified Interface such as Sales Hub or Customer Service Hub pages.

## How to enable Unified Interface Only mode

Unified Interface Only can be turned on and off in one of two ways:

- In Dynamics 365 for Customer Engagement, go to **Settings** > **Administration** > **System Settings** > **General** tab. Under **Use the new Unified Interface only (recommended)**, select **Yes** for **Enable only the Unified Interface**.

> [!div class="mx-imgBorder"] 
> ![](media/d365ce-system-settings-uci-only.png "System Settings for Unified Interface Only")

- In the Power Platform Admin center, go to **Environments** and select an environment. Go to **Settings** > **Behavior** > **Interface settings** and then turn on **Use Unified Interface only**.

## FAQs

### Is there any downtime while applying this change?

No, this change applies immediately, upon reloading the page. If it doesn't, clear cache and retry.

### Business users in my environment are still using the legacy web client for all or some of the scenarios, and our business is not completely ready to move to Unified Interface. How does the Unified Interface Only setting impact my environment after the April 2019 release?

This setting is preset to Off for your environment, and you are unaffected by the April 2019 release. It is recommended that you take advantage of the benefits of Unified Interface early by turning Unified Interface Only mode on.

### I want to use Unified Interface for all the apps, but still want *Dynamics 365 – custom* to open in the legacy web client. Is that possible?

You can achieve this by [setting all apps to be Unified Interface apps](https://docs.microsoft.com/en-us/dynamics365/customer-engagement/admin/update-apps-to-unified-interface). Note that this won't change the home page experience to Unified Interface. Unified Interface Only mode is a prerequisite to get the [new home page experience](#new-immersive-home-page-experience-on-web).

### How do I resolve errors seen while using a *Dynamics 365 - custom* legacy app in Unified Interface?
If there are issues with Unified Interface, [please let us know](https://docs.microsoft.com/power-platform/admin/get-help-support).

### How does it impact my Unified Service Desk deployment?

To learn about the impact of Unified Service Desk, see [Impact of Unified Interface Only availability with Unified Service Desk](/dynamics365/customer-engagement/unified-service-desk/admin/unified-service-desk-system-requirements#impact-of-unified-interface-only-availability-with-unified-service-desk).
