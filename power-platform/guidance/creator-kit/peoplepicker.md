---
title: PeoplePicker control reference (preview) | Creator Kit
description: Learn about the details and properties of the PeoplePicker control in the Creator Kit.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 11/02/2022
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
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
| Property | Description |
| -------- | ----------- |
| `Items` | The Pre-selected Persona(members) to appear on Peoplepicker |
| `Suggestions_Items` | List of Suggested members to pick from. This is a required dataset property |
| `PeoplePickerType` | Type of Peoplepicker to be used. |
| `MaxPeople` | Maximum number of user(s) to be allowed for selection |
| `NoResultFoundMesage` | Message to be shown if no result are found based on the specified search text. |
| `MinimumSearchTermLength` | Minimum search term length to be entered before providing the suggestions. |
| `SearchTermToShortMessage` | Custom message to be shown when the search text is less than *MinimumSearchTermLength*. |
| `Error` | To highlighting the people picker in red to represent that it has certain error that required validation. |
| `ShowSecondaryText` | Specify Yes or no, depending upon whether the Secondary text(for example, JobTitle) to be shown or not. |

### `Items` properties
| Property | Description |
| -------- | ----------- |
| `PersonaName` | Display Name of the Persona. |
| `PersonaKey` | The key identify the specific Item. The key must be unique. |
| `PersonaImgUrl` | Url or Base64 Content of Persona Image(Profile Picture). |
| `PersonaRole` | Secondary Text, Preferably JobTitle of the Persona |
| `PersonaPresence` | Optional - Presence of the person to display - won't display presence if undefined. Value should be from one of the following: `away`, `blocked`, `busy`, `dnd`, `none`, `offline`, `online` |
| `PersonaOOF` |  Optional - True or False, Based on whether the persona if Out of office or not. |

### `Suggestions_Items` properties
| Property | Description |
| -------- | ----------- |
| `SuggestionName` | Display Name of the Persona. |
| `SuggestionKey` | The key identify the specific Item. The key must be unique. |
| `SuggestionImgUrl` | Url or Base64 Content of Persona Image(Profile Picture). |
| `SuggestionRole` | Secondary Text, Preferably JobTitle of the Persona |
| `SuggestionPresence` | Optional - Presence of the person to display - won't display presence if undefined. Value should be from one of the following: `away`, `blocked`, `busy`, `dnd`, `none`, `offline`, `online` |
| `SuggestionOOF` |  Optional - True or False, Based on whether the persona if Out of office or not. |

### Additional properties
| Property | Description |
| -------- | ----------- |
| `Theme` | Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). Leaving this blank will use the default theme defined by Power Apps. |
| `AccessibilityLabel` | Screen reader aria-label |
| `InputEvent` | An event to send to the control. Supports [SetFocus](setfocus.md) as an `InputEvent`. |

## Examples

`PeoplePicker` supports other sources from where the input collection can be retrieved. Following are the examples on how to use the `PeoplePicker` component.

### Office 365 Users Connector

1. Add the Office 365 Users connector as a data source.

1. Assign the below Power Fx formula to the **On Search** property of the control to create a collection called `UserCollection`.

    ```power-fx
    ClearCollect(
        UserCollection,
        AddColumns(
            Filter(
                Office365Users.SearchUser(
                    {
                        searchTerm: Self.SearchText,
                        top: 500
                    }
                ),
                !(Mail in Self.SelectedPeople.PersonaKey)
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
            "SuggestionKey",
            Mail,
            "SuggestionName",
            DisplayName,
            "SuggestionRole",
            JobTitle,
            "SuggestionPresence",
            "away"
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

```power-fx
PeoplePicker1.SelectedPeople
```

### With Dataverse tables - Microsoft Entra Users or Users

1. Set up the `Suggestions_Items` Property by specifying the below code snippet.

      Add Users or specific users(using below code) from table to the items collection(under `Suggestions_Items` property) of `PeoplePicker`.

    -**`AAD Users` table**
      ```power-fx
      Search('AAD Users', Self.SearchText,"displayname" ,"mail")
      ```
   -**`Users` table**
      ```power-fx
      Search('Users', Self.SearchText,"fullname","internalemailaddress")
      ```

1. Map the columns according to your need using AddColumns(). Below is an example of Column-Property Mapping:

    |Property Name|AADUser Table Column|User Table Column|
    |-------------|--------------------|-----------------|
    |SuggestionKey|"mail"|"internalemailaddress"|
    |SuggestionName|"displayname"|"fullname"|
    |SuggestionRole|"jobtitle"|"jobtitle"|

At this point, the people picker should be working and the selected members can be obtained from SelectedPeople Property.

```power-fx
PeoplePicker1.SelectedPeople
```


## Limitations

This canvas component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
