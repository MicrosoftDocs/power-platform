---
title: Picker control reference | Creator Kit
description: Learn about the details and properties of the Picker control in the Creator Kit.
author: denisem-msft
manager: devkeydet
ms.component: pa-maker
ms.topic: conceptual
ms.date: 05/16/2022
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
---

# :::no-loc text="Picker"::: control

[This article is pre-release documentation and is subject to change.]

A control used to provide a search experience.

:::image type="content" source="media/Picker.png" alt-text="Picker control.":::

## Description

Pickers are used to select one or more items, such as tags or files, from a large list.

Picker code components allow the [Fluent UI picker menu components](https://developer.microsoft.com/fluentui#/controls/web/Pickers) to be used from inside canvas apps and custom pages.<!--note from editor: The article you cite implies that "Pickers" refers to a group of components, not one individual component named "Picker." If my edit is wrong, would it be helpful to discuss the difference between the "Picker" and the "Tag Picker" components referenced here? Also - note that the TOC has this as "TagsPicker."-->

The Tag Picker code component provides the following features:

1. Binds to an input collection for the chosen tags.
1. Binds to an input collection for suggested tags.
1. Allows users to select from suggestions or enter a free-text tag.
1. Raises an **On Change** event when a user adds or removes a tag.
1. Allows programmatic **Set Focus**.
1. Is styled to closely match the Pills spec.

> [!NOTE]
> Component source code and more information in the [GitHub code components repository](https://github.com/microsoft/powercat-code-components/tree/main/Picker).

## Datasets
<!--note from editor: Edits suggested to avoid duplicating descriptions. It's confusing to have the exact same text occur twice.-->
The Tag Picker has the following input datasets, which are described in detail in [Key properties](#key-properties) later in this article.

- `Tags` 
  - `TagDisplayName` 
- `Suggestions` 
  - `SuggestionDisplayName` 
  - `SuggestionSubDisplayName`

The `Suggestions` dataset should be filtered by using the `SearchTerm` output property, for example:

```powerapps-dot
Search(colSuggestions,TagPicker.SearchTerm,"name")
```

## Limitations

This code component can only be used in canvas apps and custom pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| `Tags` | A collection (table) of tags. The app is responsible for adding or removing tags in response to the component's<!--note from editor: The possessive is necessary.--> raising Add or Remove events (described in the following [OnChange event section](#onchange-event)). |
| `TagDisplayName` | Set to the name of the column that holds the tag display name. |
| `Suggestions` | A collection (table) of suggestions. |
| `SuggestionDisplayName` | Set to the name of the column that holds the suggestion display name. |
| `SuggestionSubDisplayName`| Optional. Set to the name of the column that holds the secondary line of text. |

## OnChange event

The `TagPicker`component raises an `OnChange` event when tags are added or removed. The properties used are:

- **TagEvent**: The name of the event raised
- **TagKey**: The key of the item that has raised the event (if the event is related to a tag)

The event should contain an expression similar to:

```powerapps-dot
If(TagPicker.TagEvent="Add" && CountRows(Filter(colTags,name=TagPicker.TagDisplayName))=0,
    Collect(colTags,{name:TagPicker.TagDisplayName})
);

If(TagPicker.TagEvent="Remove",
 RemoveIf(colTags,name=Text(TagPicker.TagDisplayName))
);
```

## Best practices

Go to [Fluent UI pickers best practices](https://developer.microsoft.com/fluentui#/controls/web/pickers).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]