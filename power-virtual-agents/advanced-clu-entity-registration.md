---
title: Entity registration for conversational language understanding 
description: Add language understanding entities to a Microsoft Copilot Studio bot.
keywords: "Azure, conversational language understanding, PVA, CLU, CLU models"
ms.date: 9/26/2023
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "advanced-authoring, CLU, ceX"

---

# Entity registration for conversational language understanding integration 

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

This article discusses adding conversational language understanding (CLU) entities to Microsoft Copilot Studio bots. The entities are composed of the following boolean, string, and number data types. For more information, see [Data types](/power-platform/power-fx/data-types). In most cases, you can use [Power Virtual Agent Prebuilt Entities](advanced-entities-slot-filling.md) for your projects, but should you want to use CLU entity types with custom JSON resolutions, the following schema examples are provided as a reference. 

To set up your environment for mapping CLU entities to Microsoft Copilot Studio bots, see [Get started with language understanding](advanced-clu-get-started.md).

The following datatypes are available for mapping CLU entities: 

- BooleanDatatype: `Choice.Boolean`
- StringDatatype: `Geography.Location, Regex , List, General.Event, General.Organization, Phone Number, IpAddress, Person.Name, Phone Number, URL`
- NumberDatatype: `Number`

> [!NOTE] 
> Composite entities (entities with multiple components) map to the `StringDataype`. 

## Schema table

Bot creators can use sample JSON code to register [entities](advanced-entities-slot-filling.md). Entities resolve to complex data types. You can manually map CLU entities to Microsoft Copilot Studio data types by copying and pasting the following JSON code blocks for the relevant entity.


### Age

```json
{
    "unit": "Year",
    "value": 10
}
```

### Currency

```json
{
    "unit": "Egyptian pound",
    "ISO4217": "EGP",
    "value": 30
}
```

### Temperature

```json 
{
    "unit": "Fahrenheit",
    "value": 88
}
```

### Ordinal

```json
{
    "offset": "3",
    "relativeTo": "Start",
    "value": "3"
}
```

### Dimensions

```json
{
    "unit": "KilometersPerHour",
    "value": 24
}
```

## CLU dateTime entity types

DateTime is a special entity type that changes the returned resolution based on the types of user input that are received. 

The following examples demonstrate how to configure entities for different types of date and time utterances. You can create your own mappings, based on these examples, depending on the type of result you expect your bot users to provide.

### Date 

Example input: *Jan 1st, 1995*

```json
{
    "dateTimeSubKind": "Date",
    "timex": "1995-01-01",
    "value": "1995-01-01"
}
```

### DateTime (year)

Example input: *I'll be back on April 12th*

```json
{
    "dateTimeSubKind": "Date",
    "timex": "XXXX-04-12",
    "value": "2022-04-12"
}
```

### DatetimeRange (duration)

Example input: *I'm out between 3 and 12 of Sept.* 

```json
{
    "resolutionKind": "TemporalSpan",
    "timex": "(XXXX-09-03,XXXX-09-12,P9D)",
    "duration": "P9D",
    "begin": "2022-09-03",
    "end": "2022-09-12"
}
```

### DatetimeRange (set)
Example input: *Every Tuesday.* 

```json
{ 
    "resolutionKind": "DateTime",
    "dateTimeSubKind": "Set",
    "timex": "XXXX-WXX-2",
    "value": "not resolved"
}
```

### Datetime (since)

Example input: *I've been out since August*

```json
{
    "resolutionKind": "TemporalSpan",
    "timex": "XXXX-08",
    "begin": "2022-08-01",
    "modifier": "Since"
}
  ```

### Time

Example input : *It's half past seven o'clock*

```json
{
    "resolutionKind": "DateTime",
    "dateTimeSubKind": "Time",
    "timex": "T07:30",
    "value": "07:30:00"
}
```

## Related topics

- [Get started with language understanding](advanced-clu-get-started.md)
