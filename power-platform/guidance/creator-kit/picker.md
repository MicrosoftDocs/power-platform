---
title: Picker control reference | Creator Kit
description: Learn about the details and properties of Picker control in the Creator Kit.
author: denisem-msft
manager: devkeydet

ms.component: pa-maker
ms.topic: conceptual
ms.date: 05/06/2022
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
  - demora-msft
  - mehdis-msft
---
# Picker control

A control used to provide a search experience.

![Picker](media/Picker.png "Picker")

## Description
Pickers are used to select one or more items, such as tags or files, from a large list.

The Picker code component allows using of the [Fluent UI Picker menu component](https://developer.microsoft.com/en-us/fluentui#/controls/web/Pickers) from inside canvas apps and custom pages.

The Tag Picker code component provides the following features:

1. Binds to an input collection for the chosen tags
1. Binds to an input collection for suggested tags
1. Allows users to select from suggestions or enter a free text tag
1. Raises **On Change** event when a user adds or removes a tag
1. Allows programmatic **Set Focus**
1. Styled to closely match the PILL Spec.

## Datasets

The Tag Picker has the following input datasets:

- `Tags` - A collection/table of tags. The app is responsible for adding/removing tags in responsive to the component raising Add/Remove events (see below).
  - `TagDisplayName` - set to the name of the column that holds the tag display name
- `Suggestions` - A collection/table of suggestions.
  - `SuggestionDisplayName` - set to the name of the column that holds the suggestion display name.
  - `SuggestionSubDisplayName` (Optional) - set to the name of the column that holds the secondary line of text.

The suggestions dataset should be filtered using the `SearchTerm` output property - e.g.

```powerapps-dot
Search(colSuggestions,TagPicker.SearchTerm,"name")
```

## Limitations
This PCF component can only be used in Canvas apps and Custom Pages.

## Key properties

| Property | Description |
| -------- | ----------- |
| Tags | A collection/table of tags. The app is responsible for adding/removing tags in responsive to the component raising Add/Remove events (see below). |
| TagDisplayName | Set to the name of the column that holds the tag display name. | 
| Suggestions | A collection/table of suggestions. |
| SuggestionDisplayName | set to the name of the column that holds the suggestion display name. |
| SuggestionSubDisplayName | Optional. Set to the name of the column that holds the secondary line of text.

## On Change event

The `TagPicker` component raises an `OnChange` event when tags are added or removed. The properties used are:

- **TagEvent** - the name of the event raised
- **TagKey** - the key of the item that has raised the event (if the event is related to a tag)

The event should contain an expression similar to:

```vb
If(TagPicker.TagEvent="Add" && CountRows(Filter(colTags,name=TagPicker.TagDisplayName))=0,
    Collect(colTags,{name:TagPicker.TagDisplayName})
);

If(TagPicker.TagEvent="Remove",
 RemoveIf(colTags,name=Text(TagPicker.TagDisplayName))
);
```

## Best Practices
Refer to [Fluent UI Picker control best practices](https://developer.microsoft.com/en-us/fluentui#/controls/web/Picker)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]