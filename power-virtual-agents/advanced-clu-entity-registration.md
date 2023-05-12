---
title: Entity registration for cognitive language understanding (preview)
description: Add language understanding entities to a Power Virtual Agents bot.
keywords: "Cognitive language understanding, PVA, CLU, CLU models"
ms.date: 5/1/2023
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "advanced-authoring, CLU, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent

---

# Entity registration for cognitive language understanding (preview)

[!INCLUDE [Preview disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

This article discusses adding cognitive language understanding (CLU) entities to Power Virtual Agents bots. The entities are composed of the following boolean, string, and number data types. For more information, see [Data types](/power-platform/power-fx/data-types). In most cases, you can use [Power Virtual Agent Prebuilt Entities](advanced-entities-slot-filling.md) for your projects, but should you want to leverage CLU entity types with custom JSON resolutions, the following Schema examples are provided as a referernce. 

To setup your environment for mapping CLU entities to Power Virtual Agents bots, see [Get started with language understanding](advanced-clu-get-started.md).

The following datatypes are available for mapping CLU entities: 

- BooleanDatatype: `Choice.Boolean`
- StringDatatype: `Geography.Location, Regex , List, General.Event, General.Organization, Phone Number, IpAddress, Person.Name, Phone Number, URL`
- NumberDatatype: `Number`

> [!NOTE] 
> Composite entities (entities with multiple components) map to the `StringDataype`. 

## Schema table

Bot creators can use sample JSON code to register [entities](advanced-entities-slot-filling.md). Entities resolve to complex data types. You can manually map CLU entities to Power Virtual Agents data types by using the following JSON code blocks. 

To register the following data types, copy/paste the relative code block listed below by selecting **Copy code**.

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
## A special note about the CLU Datetime entity types
DateTime is a special entity type that will change the returned resolution based the types of user input that are received. Included are some examples, you may want to experiment with coming up with your own depending on the type of result you expect your bot users to provide.

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


### DatetimeRange

```json
{
    "duration": "PT2702H",
    "begin": "2022-01-03 06:00:00",
    "end": "2022-04-25 20:00:00"
}
```


todo cleanup and merge versus above

============================date
I'll go back Oct/2
      {
       "resolutionKind": "DateTime",
       "dateTimeSubKind": "Date",
       "timex": "XXXX-10-02",
       "value": "2022-10-02"
      },
      {
       "resolutionKind": "DateTime",
       "dateTimeSubKind": "Date",
       "timex": "XXXX-10-02",
       "value": "2023-10-02"
      }
============================daterange
I'll be out between 3 and 12 of Sept hahaha
      {
       "resolutionKind": "TemporalSpan",
       "timex": "(XXXX-09-03,XXXX-09-12,P9D)",
       "duration": "P9D",
       "begin": "2022-09-03",
       "end": "2022-09-12"
      },
      {
       "resolutionKind": "TemporalSpan",
       "timex": "(XXXX-09-03,XXXX-09-12,P9D)",
       "duration": "P9D",
       "begin": "2023-09-03",
       "end": "2023-09-12"
      }
==============================daterange
I'll be out the last week of july
      {
       "resolutionKind": "TemporalSpan",
       "timex": "XXXX-07-W05",
       "begin": "2022-07-25",
       "end": "2022-08-01"
      },
      {
       "resolutionKind": "TemporalSpan",
       "timex": "XXXX-07-W05",
       "begin": "2023-07-24",
       "end": "2023-07-31"
      }
================================daterange
I'll be out since August
      {
       "resolutionKind": "TemporalSpan",
       "timex": "XXXX-08",
       "begin": "2022-08-01",
       "modifier": "Since"
      },
      {
       "resolutionKind": "TemporalSpan",
       "timex": "XXXX-08",
       "begin": "2023-08-01",
       "modifier": "Since"
      }
================================datetime
I'll go back October 14 for 8:00:31am
      {
       "resolutionKind": "DateTime",
       "dateTimeSubKind": "DateTime",
       "timex": "XXXX-10-14T08:00:31",
       "value": "2022-10-14 08:00:31"
      },
      {
       "resolutionKind": "DateTime",
       "dateTimeSubKind": "DateTime",
       "timex": "XXXX-10-14T08:00:31",
       "value": "2023-10-14 08:00:31"
      }
================================time
8:30
      {
       "resolutionKind": "DateTime",
       "dateTimeSubKind": "Time",
       "timex": "T08:30",
       "value": "08:30:00"
      },
      {
       "resolutionKind": "DateTime",
       "dateTimeSubKind": "Time",
       "timex": "T20:30",
       "value": "20:30:00"
      }
================================datetime
I'll go back end of the sunday
      {
       "resolutionKind": "DateTime",
       "dateTimeSubKind": "DateTime",
       "timex": "XXXX-WXX-7T23:59:59",
       "value": "2023-01-15 23:59:59"
      },
      {
       "resolutionKind": "DateTime",
       "dateTimeSubKind": "DateTime",
       "timex": "XXXX-WXX-7T23:59:59",
       "value": "2023-01-22 23:59:59"
      }
================================datetimerange
I'll be out five to seven today 
      {
       "resolutionKind": "TemporalSpan",
       "timex": "(2023-01-19T05,2023-01-19T07,PT2H)",
       "duration": "PT2H",
       "begin": "2023-01-19 05:00:00",
       "end": "2023-01-19 07:00:00"
      },
      {
       "resolutionKind": "TemporalSpan",
       "timex": "(2023-01-19T17,2023-01-19T19,PT2H)",
       "duration": "PT2H",
       "begin": "2023-01-19 17:00:00",
       "end": "2023-01-19 19:00:00"
      }
==================================datetimerange
I'll go back tuesday in the morning
{
       "resolutionKind": "TemporalSpan",
       "timex": "XXXX-WXX-2TMO",
       "begin": "2023-01-17 08:00:00",
       "end": "2023-01-17 12:00:00"
      },
      {
       "resolutionKind": "TemporalSpan",
       "timex": "XXXX-WXX-2TMO",
       "begin": "2023-01-24 08:00:00",
       "end": "2023-01-24 12:00:00"
      }
===================================time
It's half past seven o'clock
      {
       "resolutionKind": "DateTime",
       "dateTimeSubKind": "Time",
       "timex": "T07:30",
       "value": "07:30:00"
      },
      {
       "resolutionKind": "DateTime",
       "dateTimeSubKind": "Time",
       "timex": "T19:30",
       "value": "19:30:00"
      }
===================================datetimerange
monday 8-9am
      {
       "resolutionKind": "TemporalSpan",
       "timex": "(XXXX-WXX-1T08,XXXX-WXX-1T09,PT1H)",
       "duration": "PT1H",
       "begin": "2023-01-16 08:00:00",
       "end": "2023-01-16 09:00:00"
      },
      {
       "resolutionKind": "TemporalSpan",
       "timex": "(XXXX-WXX-1T08,XXXX-WXX-1T09,PT1H)",
       "duration": "PT1H",
       "begin": "2023-01-23 08:00:00",
       "end": "2023-01-23 09:00:00"
      }
===================================datetimerange
Cortana can help us find a time Monday 12-4.
      {
       "resolutionKind": "TemporalSpan",
       "timex": "(XXXX-WXX-1T00,XXXX-WXX-1T04,PT4H)",
       "duration": "PT4H",
       "begin": "2023-01-16 00:00:00",
       "end": "2023-01-16 04:00:00"
      },
      {
       "resolutionKind": "TemporalSpan",
       "timex": "(XXXX-WXX-1T00,XXXX-WXX-1T04,PT4H)",
       "duration": "PT4H",
       "begin": "2023-01-23 00:00:00",
       "end": "2023-01-23 04:00:00"
      },
      {
       "resolutionKind": "TemporalSpan",
       "timex": "(XXXX-WXX-1T12,XXXX-WXX-1T16,PT4H)",
       "duration": "PT4H",
       "begin": "2023-01-16 12:00:00",
       "end": "2023-01-16 16:00:00"
      },
      {
       "resolutionKind": "TemporalSpan",
       "timex": "(XXXX-WXX-1T12,XXXX-WXX-1T16,PT4H)",
       "duration": "PT4H",
       "begin": "2023-01-23 12:00:00",
       "end": "2023-01-23 16:00:00"
      }
====================================duration
more than 4 days
      {
       "resolutionKind": "TemporalSpan",
       "timex": "P4D",
       "duration": "P4D",
       "modifier": "More"
      }
=====================================set
every Tuesday
      { 
       "resolutionKind": "DateTime",
       "dateTimeSubKind": "Set",
       "timex": "XXXX-WXX-2",
       "value": "not resolved"
      }
=======================================timerange
after 6pm
      {
       "resolutionKind": "TemporalSpan",
       "timex": "T18",
       "begin": "18:00:00",
       "modifier": "After"
      }
=======================================daterange
between 2015 and 2018
      {
       "resolutionKind": "TemporalSpan",
       "timex": "(2015-01-01,2018-01-01,P3Y)",
       "duration": "P3Y",
       "begin": "2015-01-01",
       "end": "2018-01-01"
      }
