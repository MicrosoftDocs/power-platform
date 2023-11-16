---
title: Apply seed data
description: Learn how you can populate a database with an initial set of data for your SAP Procurement apps and flows that run on Microsoft Power Platform.
author: jongilman88
ms.author: jongilman
contributors:
  - robinsonshields
  - microsoft-george
  - tverhasselt
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
  - EllenWehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 06/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Apply seed data

Data seeding is the process of populating a database with an initial set of data. The SAP Procurement apps and flows require that key seed data be added to and managed by the SAP Administrator model-driven app. Adding seed data ensures an efficient and localized integration with SAP.

## Manage menu options

You can manage the menu options for one or more of the following apps that are part of the SAP Procurement template:

- SAP Vendor Management
- SAP Purchase Requisitions
- SAP Purchase Order Management

Managing the menu options enables you to determine which users will be able to view and access specific navigation items in the canvas apps deployed.

You need to have _Data_.

You can store and manage menu items in Dataverse and associate them with configured [Dataverse Group Teams](configure-security-groups.md#create-dataverse-group-teams) to control access and visibility to apps and components.

:::image type="content" source="media/apply-seed-data/sap-base-menu-items.png" alt-text="Manage menu options in Dataverse.":::

### Set up application menus

Follow these steps to set up application menus:

1. Open the _SAP Administrator_ app that was part of the SAP Administrator Base solution.
1. Go to _Menu Items_.
1. Select **+New**.
1. Populate the fields.

To help you set up application menus, a list of the fields with examples and descriptions are provided in this table.

| Field | Examples| Description |
| ----------- | ----------- | ----------- |
| Menu Item Name | "Vendors", "Requisitions", "Purchase Orders" | The short descriptive name of the menu item. |
| Used By Team | "Vendor Management Team", "Requisition Management Team", "Purchase Orders Team" | The Dataverse group that you previously set up. Select the appropriate group. |
| Menu Group | "Purchasing" | A logical grouping of menu items. Typically, this is a process domain area. |
| Order | _1_, _2_, _3_, _4_ | The order in which the menu items should be displayed. |
| Capability | "Vendors", "Requisitions", "Purchase Orders" | The capability or app that corresponds to each menu item. |
| Launch URL | "<https://apps.powerapps.com/play/e/2359c141-01e4-ec77-8e6f-7efd2f5c7308/a/7d0062b0-922b-454e-8154-295ef726d54d?tenantId=fe2dcd3b-6648-914a-8c8e-8761944769ce>" | The URL of the corresponding app to launch when the menu item is selected. You obtain it by copying the Web link value from the respective app details page. Note, this URL is unique for a given app per environment. |
| Menu Icon | Purchase Orders Menu Icon | The icon to be displayed with the menu item in the app. You can select your own or the one that is contained in the SAP Procurement solution located underneath _web resources_. |

## Apply SAP's list of values

SAP requires a constrained _list of values_ on transactions. These values need to be seeded and administered in the apps so they can be bound to the _combobox_ or _dropdown_ controls. This enables your users to make selections from the list of available values.

The constrained list of values varies according to what business process is being implemented. Work with your SAP admin and functional analyst to:

- Identify the necessary values from SAP.
- Extract the values from SAP and import through the _SAP Administrator_ app.

> [!TIP]
>
> The _Export to Excel Online_ capability available in the administrator app is the most efficient way to load and maintain these values in bulk.

:::image type="content" source="media/apply-seed-data/sap-base-list-of-values.png" alt-text="Manage list values in the SAP Administrator app.":::

### Create and manage list of values

1. Open the _SAP Administrator_ app that was installed as part of the SAP Base solution.
1. Go to _List of Values_.
1. Select **Export to Excel | Open in Excel Online**.

   :::image type="content" source="media/apply-seed-data/list-value-export.png" alt-text="Export list values to Excel.":::

   To help you create and manage the list of values, a list of the fields with examples and descriptions are provided in this table.

   | Field | Examples| Description |
   | ----------- | ----------- | ----------- |
   | Display Value | "United States", "German", "Mexico" | The localized version of the display value the user will see in combo box app controls. |
   | Language | "en", "de", "es" | The language code of the display value. The app combo box controls filter the appropriate values based on the user's browser language from the app. More languages can be created by extending the Dataverse choice values. |
   | Value Code | "US", "DE", "MX" | The language independent code that SAP expects within the API. |
   | Domain | "Country", "State", "Payment Terms" | Constrained value representing the domain that the list of values is mapped to. The app combo box controls filter the appropriate values based on mapped domain. More domains can be added by extending the Dataverse choice values. |
   | Parent Value |  | Allows for parent-child relationships of values. For example, specific state/province domain values can be parented to a single country domain value. |
   | Description |  | General description of what the value represents. |

1. Select **Save** and monitor the import progress.

More information: [Open your app data in Excel Online](/power-apps/user/export-to-excel-online)

> [!NOTE]
> If your requirements call for more domains, extend the **SAP List of Value** Dataverse entity by adding possible values to the domain choices list.

> [!TIP]
> When a value is no longer in use, a best practice is to **deactivate** a _list-of-value_ record rather than delete it. The app _combo box_ controls will only show _Active_ status values for selections going forward.

## String localization administration

All strings in the canvas apps are defaulted to English. However, the canvas apps are localization ready. This means all _Text_, _Accessible Label_, _Tool Tip_, _HintText_, _InputPlaceHolderText_, and _Notifications_ have Power Fx functions built in to check whether a localized string is present for the user's logged-in browser language code. These strings are administered and maintained via the _SAP Solution Administrator_ app. The most efficient way to load and maintain these values is by using the _Export to Excel Online_ capability available in the administrator app in bulk rather than manually entering each one.

More information: [Localization and global app support](extend-canvas-apps.md#localization-and-global-app-support)

:::image type="content" source="media/apply-seed-data/sap-base-localizations.png" alt-text="Manage SAP string localizations.":::

### Create localization strings

1. Open the _SAP Administrator_ app that was installed as part of the SAP Base solution.
1. Go to _Localizations_.
1. Select **Export to Excel | Open in Excel Online**.

   :::image type="content" source="media/apply-seed-data/export-sap-localizations.png" alt-text="Export SAP string localizations to Excel.":::

1. Create or update rows with the following attributes:

   | Field | Examples| Description |
   | ----------- | ----------- | ----------- |
   | English Value | _Cancel_ | The English version of the string that serves as the _string key_ that the application will always look up to see if there's a corresponding localized value to display. |
   | Language | _de_ | The language ISO code of the display value. The apps will automatically look up to see if there are localized strings to display based upon the user's browser language code. |
   | Localized Value | _Abbrechen_ | The localized string value to display for the given English value. |
   | String Type | _Label_ | Not required, but helps categorize what control/property the string is, noting that one localization entry can support multiple property types so just choose the primary property type in that situation. |

> [!NOTE]
> List of Values localizations are not impacted by these strings because combo box items behave differently than standard strings. Refer to the _List of values_ section to administer localized dropdown values.

> [!TIP]
> A [**CSV file available on GitHub**](https://aka.ms/SAPProcurementLocalizationStrings) contains all the app default English strings. You can import the CSV file into your environment using the [_**Import data**_](/power-apps/user/import-data) capability that is part of the SAP Administrator app. Although not required for English-only deployments, importing this file helps you quickly identify the localization strings that you need to prepare for your required language.
>
> To further accelerate the string localization creation process, create a cloud flow to trigger off of Dataverse English imported localization records selected in the SAP Administrator app. This flow can use _AI Builder_ action steps to automatically translate the English records to your target language and directly load them into the _SAP Localizations_ table.
>
> More information: [Use text translation pre-built model in Power Automate](/ai-builder/flow-text-translation)

## Next steps

- [Monitor errors](monitor-errors.md)
- [Customize solutions](customize-solutions.md)

## See also

- [Overview](../overview.md)
- [Get started](get-started.md)
