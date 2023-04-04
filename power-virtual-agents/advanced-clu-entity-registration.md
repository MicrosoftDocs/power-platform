---
title: "CLU entity registration"
description: "Add language understanding entities to a Power Virtual Agents bot"
keywords: "Cognitive language understanding, PVA, CLU, CLU models"
ms.date: 4/03/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "advanced-authoring, CLU, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent

---

# CLU entity registration

This article discusses adding language understanding entities to a Power Virtual Agents bot. The entities are composed of the following boolean, string, and number datatypes.

- Choice.Boolean --> `BooleanDatatype`
- Geography.Location, Regex , List, General.Event, General.Organization, Phone Number, IpAddress, Person.Name, Phone Number, URL --> `StringDatatype`
- Number -> `NumberDatatype`

> [!NOTE] 
> Composite entities (entities with multiple components) map to the `StringDataype`. 

## JSON Schema table

Bot creators can use sample JSON code to register [entities](advanced-entities-slot-filling.md). Entities resolve to complex datatypes. You can manually map CLU entities to PVA datatypes by using the following JSON code blocks. 

To register the following datatypes, copy/paste the relative code block listed below by selecting **Copy code**.

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

### Date

```json
{
    "dateTimeSubKind": "Date",
    "timex": "1995-01-01",
    "value": "1995-01-01"
}
```

### DateTime

```json
{
    "dateTimeSubKind": "Date",
    "timex": "XXXX-04-12",
    "value": "2022-04-12"
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

### DatetimeRange

```json
{
    "duration": "PT2702H",
    "begin": "2022-01-03 06:00:00",
    "end": "2022-04-25 20:00:00"
}
```
 