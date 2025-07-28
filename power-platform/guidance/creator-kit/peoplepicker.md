---
title: PeoplePicker control reference (preview)
description: Learn how to use the PeoplePicker control in the Creator Kit to select people or groups effortlessly in your Power Apps canvas apps.
author: denise-msft
ms.component: pa-maker
ms.topic: concept-article
ms.date: 07/28/2025
ms.subservice: guidance-toolkit
ms.author: demora
ms.reviewer: jhaskett-msft
search.audienceType:
  - maker
contributors:
  - tapanm-msft
  - slaouist
  - Ramakrishnan24689
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:07/28/2025
---

# :::no-loc text="PeoplePicker"::: control (preview)

[This article is pre-release documentation and is subject to change.]

A control used to create a loading experience.

> [!NOTE]
> Full documentation and source code are found in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/PeoplePicker).

:::image type="content" source="media/peoplepicker.png" alt-text="PeoplePicker control.":::

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE[cc_preview_features_definition](../../includes/cc-preview-features-definition.md)]

## Description

The people picker (`PeoplePicker`) lets you select one or more entities, like people or groups, from a list. It makes composing an email to someone or adding them to a group easier if you don't know their full name or email address.

This code component provides a wrapper around the [Fluent UI PeoplePicker](https://developer.microsoft.com/en-us/fluentui#/controls/web/peoplepicker) control for use in canvas and custom pages. Consult the component documentation for best practices.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Items` | The pre-selected Persona(members) to appear on Peoplepicker. |
| `Suggestions_Items` | List of suggested members to pick from. This is a required dataset property. |
| `PeoplePickerType` | Type of Peoplepicker to use. |
| `MaxPeople` | Maximum number of users allowed for selection. |
| `NoResultFoundMesage` | Message to be shown if no result is found based on the specified search text. |
| `MinimumSearchTermLength` | Minimum search term length to be entered before providing the suggestions. |
| `SearchTermToShortMessage` | Custom message to be shown when the search text is less than *MinimumSearchTermLength*. |
| `Error` | Highlight the people picker in red to indicate that it has an error requiring validation.|
| `ShowSecondaryText` | Specify Yes or No, depending on whether the Secondary text (for example, JobTitle) is to be shown or not. |

### Items properties

| Property | Description |
| -------- | ----------- |
| `PersonaName` | Display name of the persona. |
| `PersonaKey` | The key identifies the specific item and must be unique. |
| `PersonaImgUrl` | Url or Base64 Content of Persona Image(Profile Picture). |
| `PersonaRole` | Secondary text, preferably JobTitle of the persona.|
| `PersonaPresence` | (Optional) Presence of the person to display. Presence isn't displayed if undefined. The value can be one of: `away`, `blocked`, `busy`, `dnd`, `none`, `offline`, or `online`. |
| `PersonaOOF` |  (Optional) True or False, based on whether the persona is Out of office or not. |

### Suggestions_Items properties

| Property | Description |
| -------- | ----------- |
| `SuggestionName` | Display name of the persona. |
| `PersonaKey` | The key identifies the specific item and must be unique. |
| `SuggestionImgUrl` | Url or Base64 Content of Persona Image(Profile Picture). |
| `SuggestionRole` | Secondary text, preferably JobTitle of the persona. |
| `SuggestionPresence` |  (Optional) Presence of the person to display. Presence isn't displayed if undefined. The value can be one of: `away`, `blocked`, `busy`, `dnd`, `none`, `offline`, or `online`. |
| `PersonaOOF` |  (Optional) True or False, based on whether the persona is Out of office or not. |

### Additional properties

| Property | Description |
| -------- | ----------- |
| `Theme` | Accepts a JSON string that is generated using [Fluent UI Theme Designer (windows.net)](https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/). If left blank, the default theme defined by Power Apps is used. |
| `AccessibilityLabel` | Screen reader aria-label. |
| `InputEvent` | An event to send to the control. Supports [SetFocus](setfocus.md) as an `InputEvent`. |

## Examples

The `PeoplePicker` component supports additional sources for retrieving the input collection. Following are examples of how to use the component.  

### Office 365 Users Connector

1. Add the Office 365 Users connector as a data source.

1. Assign a Power Fx formula to the **On Search** property of the control to create a collection called `UserCollection`.

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

1. Optionally, if not using photos, set the `Suggestions_Items` property to `UserCollection`.

    The formula includes a consecutive request to get UserPhoto, which increases loading time. If you don't need photos and want to decrease search time, use the following formula in the `Suggestions_Items` property of the control instead of `UserCollection`: 

    ```
    AddColumns(
        Office365Users.SearchUser({ searchTerm: Self.SearchText, top: 500 }),
        "SuggestionKey", Mail, 
        "SuggestionName", DisplayName,
        "SuggestionRole", JobTitle
    )
    ```

At this point, the control is functioning and selected members can be obtained from the `SelectedPeople` property.

```power-fx
PeoplePicker1.SelectedPeople
```

### With Dataverse tables (Microsoft Entra Users or Users)

1. Set the `Suggestions_Items` property.

    Add Users or specific users from the table to the items collection (under `Suggestions_Items` property) of `PeoplePicker`.

    - `AAD Users` table

      ```power-fx
      Search('AAD Users', Self.SearchText,"displayname" ,"mail")
      ```
    - `Users` table
    
      ```power-fx
      Search('Users', Self.SearchText,"fullname","internalemailaddress")
      ```

1. Map the columns according to your need using `AddColumns()`. Here's an example of Column-Property Mapping:

    |Property Name|AADUser Table Column|User Table Column|
    |-------------|--------------------|-----------------|
    |SuggestionKey|"mail"|"internalemailaddress"|
    |SuggestionName|"displayname"|"fullname"|
    |SuggestionRole|"jobtitle"|"jobtitle"|

At this point, the people picker control is working and the selected members can be obtained from the `SelectedPeople` property.

```power-fx
PeoplePicker1.SelectedPeople
```

## Limitations

This canvas component can only be used in canvas apps and custom pages.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
