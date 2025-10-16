---
title: RecordInfo function
description: Reference information including syntax and examples for the RecordInfo function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 3/22/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
no-loc: ["RecordInfo"]
---

# RecordInfo function
[!INCLUDE[function-recordinfo-applies-to](includes/function-recordinfo-applies-to.md)]



Provides information about a [record](/power-apps/maker/canvas-apps/working-with-tables#elements-of-a-table) of a [data source](/power-apps/maker/canvas-apps/working-with-data-sources).

Use **RecordInfo** to obtain information about a particular record of a data source. The data source must be tabular and compatible with the [**Remove**](function-remove-removeif.md) and [**Patch**](function-patch.md) functions.

At this time, only Microsoft Dataverse is supported. Records from all other data sources will result in a formula error.

The information available:

| Information argument            | Description                                                                       |
| ------------------------------- | --------------------------------------------------------------------------------- |
| **RecordInfo.DeletePermission** | Does the current user have permission to remove this record from the data source? |
| **RecordInfo.EditPermission**   | Does the current user have permission to modify this record in the data source?   |
| **RecordInfo.ReadPermission**   | Does the current user have permission to read this record from the data source?   |

**RecordInfo** returns a Boolean value:

| Return value | Description                                                                                               |
| ------------ | --------------------------------------------------------------------------------------------------------- |
| _true_       | The user has the permission.                                                                              |
| _false_      | The user does not have permission. If the record is _blank_ then **RecordInfo** will also return _false_. |

**RecordInfo** takes into account permissions at the data source level too. For example, if the user has permission at the record level to modify a record, but the user does not have permissions at the table level, then it will return _false_ for **ModifyPermission**. Use the [**DataSourceInfo**](function-datasourceinfo.md) function to obtain information about the data source as a whole.

## Syntax

**RecordInfo**( _Record_, _Information_ )

- _Record_ – Required. The record to test.
- _Information_ – Required. The desired information for the record.

## Examples

```power-fx
RecordInfo( First(Accounts), RecordInfo.EditPermission )
```

Checks the edit permission for the first record in the `Accounts` data source, which could be in Dataverse, SharePoint, SQL Server, or another tabular data source. If the user has permission to edit this record and modify the `Accounts` data source in general, then **RecordInfo** will return _true_.

```power-fx
With( { MyRecord: First( Accounts ) },
      RecordInfo( MyRecord, RecordInfo.EditPermission ) )
```

Captures a record using the [**With**](function-with.md) function and then passes this value to the `RecordInfo` function. The result will be the same as the last example.

```power-fx
Collect( MyAccounts, FirstN( Accounts, 10 ) );
RecordInfo( First( MyAccounts ), RecordInfo.EditPermission ) )
```

Captures the first 10 records from the `Accounts` data source into the `MyAccounts` collection. Since the records originated from a data source, they can be used with the **RecordInfo** function. The result will be the same as the last example.

```power-fx
Collect( MyCollection, [ 1, 2, 3 ] );
RecordInfo( First(MyCollection), RecordInfo.DeletePermission )
```

Creates the `MyCollection` collection and tests the first record to determine if it can be removed. Since the record's origin is a collection and not a data source, **RecordInfo** will return an error.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]







































































































































