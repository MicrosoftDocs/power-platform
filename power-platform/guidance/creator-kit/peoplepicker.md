---
title: PeoplePicker control reference (preview) | Creator Kit
description: Learn about the details and properties of the PeoplePicker control in the Creator Kit.
author: denisem-msft
manager: devkeydet
ms.component: pa-maker
ms.topic: conceptual
ms.date: 10/25/2022
ms.subservice: guidance
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
contributors:
  - tapanm-msft
  - slaouist
  - Ramakrishnan24689
---

# :::no-loc text="PeoplePicker"::: control (preview)

[This article is pre-release documentation and is subject to change.]

A control used to create a loading experience.

> [!NOTE]
> Full documentation and source code found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/peoplepicker).

:::image type="content" source="media/peoplepicker.png" alt-text="PeoplePicker control.":::

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../../includes/cc-preview-features-definition.md)]

## Description

The people picker (`PeoplePicker`) is used to select one or more entities, such as people or groups, from a list. It makes composing an email to someone, or adding them to a group, easy if you don’t know their full name or email address.

This code component provides a wrapper around the [Fluent UI PeoplePicker](https://developer.microsoft.com/en-us/fluentui#/controls/web/peoplepicker) control for use in canvas & custom pages. See component documentation for best practices.

## Key properties

- **Items** - The Pre-selected Persona(members) to appear on Peoplepicker
  - **PersonaName** - Display Name of the Persona.
  - **PersonaKey** - The key identify the specific Item. The key must be unique.
  - **PersonaImgUrl** - Url or Base64 Content of Persona Image(Profile Picture).
  - **PersonaRole** - Secondary Text, Preferably JobTitle of the Persona
  - **PersonaPresence** - Optional - To defined the Presence of the persona. Value should be from one of the followings :
    - `away`
    - `blocked`
    - `busy`
    - `dnd`
    - `none`
    - `offline`
    - `online`
  - **PersonaOOF** -  True or False, Based on whether the persona if Out of office or not.

- **Suggestions_Items** - List of Suggested members to pick from. This is a required dataset property
  - **SuggestionName** - Display Name of the Persona.
  - **SuggestionKey** - The key identify the specific Item. The key must be unique.
  - **SuggestionImgUrl** - Url or Base64 Content of Persona Image(Profile Picture).
  - **SuggestionRole** - Secondary Text, Preferably JobTitle of the Persona
  - **SuggestionPresence** - Optional - To defined the Presence of the persona. Value should be from one of the followings :
    - away
    - blocked
    - busy
    - dnd
    - none
    - offline
    - online
  - **SuggestionOOF** -  True or False, Based on whether the persona if Out of office or not.
  - **PeoplePickerType** - Type of Peoplepicker to be used.
  - **MaxPeople** - Maximum number of user(s) to be allowed for selection
  - **NoResultFoundMesage** - Messgae to be shown if no result are found based on the specified search text.
  - **MinimumSearchTermLength** - Minimum search term length to be entered before providing the suggestions.
  - **SearchTermToShortMessage** - Custom message to be shown when the search text is less than *MinimumSearchTermLength*.
  - **Error** - To highlighting the people picker in red to represent that it has certain error which required validation.
  - **ShowSecondaryText** - Specify Yes or no, depending upon whether the Secondary text(e.g. JobTitle) to be shown or not.

### Additional Properties

- **Theme** - Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps.

- **AccessibilityLabel** - Screen reader aria-label

## Examples 

Following are the examples on how to use the `PeoplePicker` component. Note that `PeoplePicker` completely supports other sources from where the input collection can be retrieved.

### Office 365 Users Connector

1. Add the Office 365 Users connector as a data source.

1. Assign the below Power Fx formula to the **On Search** property of the control to create a collection called `UserCollection`.

    ```powerapps-dot
    ClearCollect(
        UserCollection,
        AddColumns(
            Office365Users.SearchUser(
                {
                    searchTerm: Self.SearchText,
                    top: 500
                }
            ),
            "SuggestionImgUrl",
            Substitute(
                JSON(
                    Office365Users.UserPhotoV2(Id),
                    JSONFormat.IncludeBinaryData
                ),
                """",
                ""
            ),
            "SuggestionKey", Mail, 
            "SuggestionName", DisplayName,
            "SuggestionRole", JobTitle
        )
    )
    ```

1. Set the `Suggestions_Items` property to `UserCollection`.

    > [!NOTE]
    > The above formula includes a consecutive request to get UserPhoto, which increases loading time. If you do not need photos and want to decrease search time, use the following formula in the `Suggestions_Items` property of the control instead of `UserCollection`: <br> 
    ```
    AddColumns(
        Office365Users.SearchUser({ searchTerm: Self.SearchText, top: 500 }),
        "SuggestionKey", Mail, 
        "SuggestionName", DisplayName,
        "SuggestionRole", JobTitle
    )
    ```

At this point the control is functioning and selected members can be obtained from the `SelectedPeople` property.

```powerapps-dot
PeoplePicker1.SelectedPeople
```

### With Dataverse tables - AAD Users or Users

Step 1) Setup the `Suggestions_Items` Property by specifying the below code snippet.

Add Users or specific users(using below code) from table to the items collection(under `Suggestions_Items` peroperty) of `PeoplePicker`.

#### `AAD Users` table

```powerapps-dot
Search('AAD Users', Self.SearchText,"displayname" ,"mail")
```

#### `Users` table

```powerapps-dot
Search('Users', Self.SearchText,"fullname","internalemailaddress")
```

Step 2) Map the Columns according your need. Below is an example of Column-Property Mapping

|Property Name|AADUser Table Column|User Table Column|
|--|--|--|
|SuggestionKey|"mail"|"internalemailaddress"|
|SuggestionName|"displayname"|"fullname"|
|SuggestionRole|"jobtitle"|"jobtitle"|

At this point, the people picker should be working and the selected members can be obtained from SelectedPeople Property.

```powerapps-dot
PeoplePicker1.SelectedPeople
```

### Event Properties

- **InputEvent** - An event to send to the control. E.g. `SetFocus`. See below.

### Setting Focus on the control

When a new dialog is shown, and the default focus should be on the control, an explicit set focus will be needed.

To make calls to the input event, you can set a context variable that is bound to the Input Event property to a string that starts with `SetFocus` and followed by a random element to ensure that the app detects it as a change.




## Limitations

This canvas component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
