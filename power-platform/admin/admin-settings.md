---
title: Manage Microsoft Dataverse settings 
description: View and manage Microsoft Dataverse settings.
author: sericks007
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/25/2024
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
# Manage Microsoft Dataverse settings

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

You can view and manage the settings for your environments by signing in to the Microsoft [Power Platform admin center](https://admin.powerplatform.microsoft.com), going to the **Environments** page, selecting an environment, and then selecting **Settings**.

Settings for the selected environment can be managed here.

![Environment settings.](media/environment-settings.png)

## Environment settings are moving
Across organization admin settings are gradually moving from the web client to the Power Platform admin center, apps with unified interface, or Power Apps. Meanwhile, you can manage settings in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), as usual.

Many of these settings...

![Settings.](./media/old-settings.png)

...are moving here.

![Environment settings mini.](media/environment-settings-mini.png)

Use the links on this page to manage organization-wide settings. App-specific settings remain in customer engagement apps and accessed through the app settings. 

## New location for admin settings
The following web client admin settings have moved.

### Security settings

These security settings are managed in the Power Platform admin center.

- [Dataverse teams management](manage-teams.md)
- [Assign security roles to users in an environment that has a Dataverse database](database-security-configure.md#assign-security-roles-to-users-in-an-environment-that-has-a-dataverse-database)
- [Manage application users](manage-application-users.md)
- [Create users](create-users.md)
- [Field-level security to control access](field-level-security.md)
- [Manage business units](create-edit-business-units.md)
- [Hierarchy security to control access](hierarchy-security.md)

## App settings

Getting to app feature settings can vary based on the type of app you're using. 

When the **[Display behavior -> Use updated experience for classic settings where possible](settings-behavior.md)** toggle is **On** , the following app settings have the modernized experience available in the unified interface. 

| Legacy settings | Modernized experience  |
|--- | --- | 
|**Administration** ||
| System Settings > Goals | Sales Hub|
|**Business Management**  ||
| Business Closures    | Customer Service admin center|
| Currencies           | App-less unified interface|
| Facilities/Equipment | Customer Service admin center|
| Goal Metrics        | Customer Service admin center|
| Queues              | Customer Service admin center|
| Resource Groups     | Customer Service admin center|
| Rollup Queries      | Sales Hub |
| Sales Territories   | Sales Hub |
| Services            | Customer Service admin center|
| Sites               | Customer Service admin center|
| Subjects            | Customer Service admin center|
| LinkedIn Sales Navigator |  Sales Hub     |
| **Data Management** | |
| Similar Record Suggestion Settings | Customer Service admin center|
| **Product Catalog** | |
|  Discount Lists     | Sales Hub|
|  Families & Products| Sales Hub|
|  Price Lists        | Sales Hub|
|  Unit Groups        | Sales Hub|
| **Service Management** | |
| Business Closures   | Customer Service admin center| 
| Categories          | Customer Service admin center|
| Customer Service Schedule | Customer Service admin center|
| Email Templates     | Customer Service admin center|
| Embedded Knowledge Search | Customer Service admin center|
| Entitlement Templates | Customer Service admin center|
| Entitlements         | Customer Service admin center|
| Facilities/Equipment | Customer Service admin center|
| Holiday Schedule     | Customer Service admin center|
| Parent and Child case settings | Customer Service admin center|
| Queues               | Customer Service admin center|
| Resource Groups      | Customer Service admin center|
| Routing Rule Sets    | Customer Service admin center|
| Service Configuration Settings | Customer Service admin center|
| Services             | Customer Service admin center|
| Sites                | Customer Service admin center|
|**Templates** | |
| Document Templates   | App-less unified interface|
| Email Signatures     | Customer Service admin center|
| Email Templates      | Customer Service admin center|


### Settings in Unified Interface apps

To open legacy settings for apps that use [Unified Interface](about-unified-interface.md), look in the upper-right corner and select the **Gear** icon (![Gear icon.](media/selection-rule-gear-button.png)). Then select **Advanced settings**. 

> [!div class="mx-imgBorder"] 
> ![Advanced settings.](media/advanced-settings.png "Advanced settings")

### Settings in legacy web client apps

To open settings for legacy client apps, select the arrow next to the app name, and then select **Settings**. 

> [!div class="mx-imgBorder"] 
> ![Legacy settings.](media/legacy-settings.png "Legacy settings")

### See also
[Get started with Customer Service admin center](/dynamics365/customer-service/cs-admin-center)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
