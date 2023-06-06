---
title: Extend canvas apps (preview)
description: Best practices and patterns for applying customizations to the canvas Power Apps to to enable local business requirements
author: tverhasselt
ms.author: thoverh
contributors:
  - EllenWehrle
  - robinsonshields
  - microsoft-george
  - jongilman88
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: install-set-up-deploy
ms.date: 06/05/2023
ms.custom: bap-template
---

# How to build a canvas app in Power Apps (preview)

[This article is prerelease documentation and is subject to change.]

Power Apps is a high-productivity platform for business apps. Canvas apps are built in Power Apps. You can craft tailored, pixel-perfect interfaces with the power of a blank canvas that can be rendered in the browser or embedded in a variety of containers such as Teams and SharePoint sites.

The core end-user experiences for the SAP procurement solutions are built using canvas apps and can easily be extended to support your local business requirements. Follow the patterns and best practices in this article.

More information: [What are canvas apps](/power-apps/maker/canvas-apps/getting-started)

## Follow best practices and standards

All apps are developed using published best practices and standards. We recommend that you adopt the same or similar best practices and standards as you extend or create new apps.

| Standard | Comments | More information |
| -------- | -------- | ---------------- |
| Feature Status | Only those features that are turned on by default and in special cases some that are not on by default, are used in the application settings. This includes a subset of preview features but no experimental features. | [Understand experimental, preview, and retired features in canvas apps](/power-apps/maker/canvas-apps/working-with-experimental-preview) |
| Responsiveness | Responsive to single device type such as tablet or mobile. Allows the app to snap to a variety of standard screen and container sizes including embedding the apps within Microsoft Teams. Uses auto-layout responsive container controls extensively. | [Building responsive canvas apps](/power-apps/maker/canvas-apps/build-responsive-apps)
| Naming & Coding Standards | Controls, variables, collections, and Dataverse naming standards are followed to promote ease of discovery and maintenance. | [Power Apps Canvas App Coding Standards and Guidelines](https://powerapps.microsoft.com/blog/powerapps-canvas-app-coding-standards-and-guidelines)
| Accessibility | Properties that support accessibility such as Accessible Labels, Roles, Live, Focus Border Thickness, Color Contrast, and Tab Orders have been implemented along with avoiding known design patterns that do not support accessibility requirements. | [Create accessible canvas apps](/power-apps/maker/canvas-apps/accessible-apps) and [Accessibility limitations in canvas apps](/power-apps/maker/canvas-apps/accessible-apps-limitations) |
| Performance | Best practices are followed avoiding known performance limitations. | [Tips and best practices to improve performance of canvas apps](/power-apps/maker/canvas-apps/performance-tips)

## Global app color themes

All apps follow a custom theme and can be changed according to your organization's preferred color scheme. A _global variable_ is set in the _App.OnStart_ properties across all of the apps. This variable is referenced by most color-related properties across all controls in the app. Changing the color global theme variable in one place will have an immediate effect across the app after running the _App.OnStart_ event.

> [!IMPORTANT]
>
> Although it is possible to change a variety of color palette properties, it is recommended to only change the primary color property in the global theme variable.

~~~power-fx
    Set(
        varThemeColors,
        {
            background: ColorValue("#FAF9F8"),
            backgroundFill: ColorValue("#FFFFFF"),
            backgroundFillDisabled: ColorValue("#F3F2F1"),
            text: ColorValue("#201F1E"),
            altText: ColorValue("#FFFFFF"),
            disabledText: ColorValue("#A19F9D"),
            primary: ColorValue("#0078D4"),
            secondary: ColorValue("#EFF6FC"),
            tertiary: ColorValue("#005A9E"),
            primaryGray: ColorValue("#8A8886"),
            secondaryGray: ColorValue ("#C8C6C4"),
            tertiaryGray: ColorValue("#605E5C"),
            requiredRed: ColorValue("#A80000"),
            lookupBlue: ColorValue("#0078D4")
        }
    )
~~~

## Add your corporate logo

Add your corporate logo to the apps by first uploading your corporate logo image file to the app and then adding it to the _ScreenHeader_ component.

:::image type="content" source="media/extend-canvas-apps/add-corp-logo-.png" alt-text=" Add your corporate logo to the app":::

More information: [Using multimedia files in canvas apps](/power-apps/maker/canvas-apps/add-images-pictures-audio-video)

## Localization and global app support

All canvas apps by default have support for the English language without any additional work. However, all apps are designed to be _localization ready_ and can be managed to support additional languages. Control- width properties may need to be altered directly depending on languages chosen to deploy.

### String localization pattern

1. On the first screen's _OnVisible_ property during the launch of the app, the app will read the user's browser language setting and determine the corresponding _ISO Language Code_ choice value.

~~~power-fx
      Set(
        varISOUserLanguageCode,
        Switch(
            Left(
                Language(),
                2
            ),
            "ar",
            'ISO Language Code'.ar,
            "de",
            'ISO Language Code'.de,
            "en",
            'ISO Language Code'.en,
            "es",
            'ISO Language Code'.es,
            "fr",
            'ISO Language Code'.fr,
            "he",
            'ISO Language Code'.he,
            "it",
            'ISO Language Code'.it,
            "ja",
            'ISO Language Code'.ja,
            "pt",
            'ISO Language Code'.pt,
            "zh",
            'ISO Language Code'.zh,
            'ISO Language Code'.en
        )
    )
~~~

> [!NOTE]
>
> Label and input control properties attempt to anticipate the width the localized text value but may not always be successful given complexities in that calculation. Thus, it is recommended to always test and make minor edits to the apps once localized strings and changes are made.

> [!TIP]
>
> Additional languages can be added and supported by adding more values to the _ISO Language Code_ choice component contained in the SAP Base solution.

The app queries the _SAP Localization_ Dataverse entity for strings that have been localized per the user's logged-in language and caches them locally in a collection.

~~~power-fx
        ClearCollect(
            colUserLocalizedStrings,
            Filter(
                'SAP Localizations',
                Language = varISOUserLanguageCode,
                'SAP Localizations (Views)'.'Active SAP Localizations'
            )
        )
~~~

All text related properties within various controls such as Text, HintText, Accessible Label, InputTextPlaceholder, NoSelectionText, and ToolTips will have formulas that look first for an equivalent localized string. If it does not find the equivalent, it will default to English, which is set in the _Text_ property within the _With_ block.

~~~power-fx
  With(
      {Text: "Vendor name"},
      If(
          IsBlank(
              LookUp(
                  colUserLocalizedStrings,
                  'English Value' = Text
              ).'Localized Value'
          ),
          Text,
          LookUp(
              colUserLocalizedStrings,
              'English Value' = Text
          ).'Localized Value'
      )
  )
~~~

For _combo box_ controls that filter values from the _SAP List of Value_ table, the user's mapped _ISO Language Code_ from their browser's setting is always applied to the filter criteria, defaulting to English if no list of values are administrated for their language.

~~~power-fx
Sort(
    Filter(
        'SAP List of Values',
        Status = 'Status (SAP List of Values)'.Active,
        Domain = 'Domain (SAP List of Values)'.Country,
        Language = varISOUserLanguageCode
    ),
    'Display Value'
)
~~~

### Browser locale settings

All number, date and time fields in the canvas apps will honor the user's browser locale settings by default. For example, a date displayed as _3/23/2023_ for a user using United States as their locale settings will show as _23.03.2023_ for a user using the Germany locale setting.

More information: [Build global support into canvas apps](/power-apps/maker/canvas-apps/global-apps)

## Components

Components are a great way to simplify the app development and maintenance process as well as help improve performance.

For areas where there is a need for common user experience either internally or across apps, components are configured. Given limitations on component libraries to support things like access to app scope and embedded cloud flows, local components can be used in all of the apps which then can be imported to other apps.

For example, the _VendorSearch_ component is used across all the apps that support procure-to-pay processes and it was primarily built within the SAP Vendor Management app and imported to be used within the other procure-to-pay apps.

> [!WARNING]
> A negative consequence of using local app components versus component libraries is that if a change is determined, those changes need to be made across all the apps that have already imported that component.

This table lists the common components that are used throughout the apps.

| Component | Description | Screenshot Example |
| --------- | ----------- | ------------------ |
| ScreenHeader | Common header across every screen | ![Screen header component](https://github.com/MicrosoftDocs/powerapps-docs-pr/assets/123208262/b8cdfd92-fdc1-4c9f-b9ae-d9cf66673358) |
| LeftNavigation | Main navigation that allows quick access to other apps driven by Menu Item Dataverse source | ![Main menu left navigation](https://github.com/MicrosoftDocs/powerapps-docs-pr/assets/123208262/9fcad2f0-d2fb-4421-8450-51ade5384c23) |
| CommandBar | List of common controls to create, change, save, cancel, search, recent search or advance search objects | ![Command bar](https://github.com/MicrosoftDocs/powerapps-docs-pr/assets/123208262/274edf6d-cbd3-4669-bfd1-e254db159682) |
| ScreenTabs | Used to group "tabs" and logic to navigate across screens that the tabs point to | ![Screen tabs](https://github.com/MicrosoftDocs/powerapps-docs-pr/assets/123208262/6193bc33-472d-47f2-9b50-b814f486b2e8) |
| NoItemsDisplay | Shown in grids when no records are present | ![No items](https://github.com/MicrosoftDocs/powerapps-docs-pr/assets/123208262/551b6f39-c631-4963-ad9f-8af3b3174e60) |
| ObjectNameSearch | Included within the appropriate app where used, common SAP object search components can be imported into other apps if needed. Examples include VendorSearch, GLAccountSearch, MaterialSearch, RequisitionSearch. | ![Object component search](https://github.com/MicrosoftDocs/powerapps-docs-pr/assets/123208262/b8182fbb-7cc0-4624-b9db-57e157d0eb82) |

More information: [Canvas component overview](/power-apps/maker/canvas-apps/create-component)  

## Additional SAP fields

Every SAP implementation is different and it is fully expected to add your own fields that support your business processes. Thus, ample screen space and design considerations were implemented to allow you to easily add the fields you need.

### Common control containers

Most controls are contained within a container consisting of both label and input control. For example, the field to capture the name of the vendor within the SAP Vendor Management app consists of a Label and Text Input control as seen below. To add a new field, simply copy an existing container control and paste in the appropriate responsive component, updating the names, text and ultimately mapped fields.

:::image type="content" source="media/extend-canvas-apps/container-control.png" alt-text=" Work with container controls.":::

> [!NOTE]
> There are similar containers for other types of input controls like Comboboxes, Date Pickers and Buttons.

### Responsive containers

The apps are designed to be responsive to the tablet/desktop device type using vertical and horizontal container controls such as show below. These containers are configured to have starting points for properties such as _height_, _width_, _LayoutMinHeight_, _LayoutMinWidth_, and _Wrap_. As you add more more fields to these containers, ensure these properties are also updated to continue to handle the responsiveness appropriately.

:::image type="content" source="media/extend-canvas-apps/ex-horizontal-container.png" alt-text=" Work with responsive containers.":::

More information: [Auto-layout containers](/power-apps/maker/canvas-apps/build-responsive-apps#auto-layout-containers)

## Connect with other data

The power of canvas apps is that they can easily connect into one of several hundred other systems and applications securely using their native connector library. For example, if your SAP Procurement purchase order process requires data from upstream pre-sales opportunities that exist in a CRM to complete the process, you can use the [Salesforce](/connectors/salesforce/) or Dataverse connectors to integrate with Dynamics 365 so you can easily add that data to the SAP Purchase Order app at the click of a button.

Additionally, if you have an internal proprietary system or a system with no native connector, you can work with your IT Team to create a custom connector that allows Power Apps to easily interface with that system through a supported API.

More information:
-[List of connectors](/connectors/connector-reference/connector-reference-powerapps-connectors)
-[Custom connectors overview](/connectors/custom-connectors/)

## App error handling

All embedded flow calls evaluate a response status field sent back by the flows by default and handle by raising a message through the [Notify](/power-platform/power-fx/reference/function-showerror) Power-Fx function. To learn more see [Error handling](extend-cloud-flows.md#error-handling).

~~~power-fx
If(
    !IsBlank(FirstError.Message),
    Patch(
        'SAP Integration Errors',
        Defaults('SAP Integration Errors'),
        {
            Action: FirstError.Source,
            'Additional Information': App.ActiveScreen.Name,
            'Error Message': FirstError.Message,
            Name: "SAP Vendor Management",
            'Source Type': 'Source Type (SAP Integration Errors)'.'Power App',
            'Workflow Status': 'Workflow Status (SAP Integration Errors)'.Failed
        }
    );
Trace(FirstError.Message);
Error(FirstError);  
)
~~~

All unexpected exceptions generated by the app are handled in the _App.OnError_ property where a _SAP solution template error_ record is created before the error is re-thrown and traced. The admin can view the error details as put triggers in place to be alerted on app unhandled exceptions as seen in the [Monitor errors](monitor-errors.md) document.

More information: [OnError property](/power-platform/power-fx/reference/object-app#onerror-property)

## Next steps

- [Extend model-driven apps and Dataverse](extend-model-apps-and-dataverse.md)
- [Extend cloud flows](extend-cloud-flows.md)

### See also

- [Overview](../overview.md)
- [Get started](get-started.md)
