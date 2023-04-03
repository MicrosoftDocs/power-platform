---
title: "CLU entity registration"
description: "Get started creating bots in Power Virtual Agents bots with CLU entity registration"
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

This topic defines the datatype mapping between CLU entity and PVA datatypes. The entities are composed of the following boolean, string, and number datatypes.

- `Choice.Boolean --> BooleanDatatype`
- `Geography.Location, Regex , List, General.Event, General.Organization, Phone Number, IpAddress, Person.Name, Phone Number. URL --> StringDatatype`
- `Number -> NumberDatatype`

> [!NOTE] 
> Composite entities (entities with multiple components) map to the `StringDataype`. 

## JSON Schema table

Bot creators can use sample JSON code to register entities that resolve to complex datatypes. You can manually map CLU entities to PVA datatypes by using the following JSON code blocks. 

To register the following data types, copy/paste the relative code block listed in the table by clicking the **Copy code** button.


| Datatype      | Code        |
|---------------|-------------|
| Age           | {<br>
    "unit": "Year",<br>
    "value": 10<br>
}|
| Currency      |{<br>
    "unit": "Egyptian pound",<br>
    "ISO4217": "EGP",<br>
    "value": 30<br>
}|
| Date          |{<br>
    "dateTimeSubKind": "Date",<br>
    "timex": "1995-01-01",<br>
    "value": "1995-01-01"<br>
}|
| DateTime      |{<br>
    "dateTimeSubKind": "Date",<br>
    "timex": "XXXX-04-12",<br>
    "value": "2022-04-12"<br>
}|
| Temperature   |{<br>
    "unit": "Fahrenheit",<br>
    "value": 88<br>
}|
| Ordinal       |{<br>
    "offset": "3",<br>
    "relativeTo": "Start",<br>
    "value": "3"<br>
}|
| Dimensions    |{<br>
    "unit": "KilometersPerHour",<br>
    "value": 24<br>
}|
| DatetimeRange |{<br>
    "duration": "PT2702H",<br>
    "begin": "2022-01-03 06:00:00",<br>
    "end": "2022-04-25 20:00:00"<br>
}|

