---
title: Dataverse.Unmask function
description: Reference information, including syntax and examples, for the Dataverse.Unmask function in Power Apps canvas apps.
author: yogeshgupta698
ms.topic: reference
ms.custom: canvas
ms.date: 10/09/2026
ms.subservice: power-fx
ms.author: yogupt
search.audienceType:
  - maker
no-loc: ["Dataverse.Unmask"]
ai-usage: ai-assisted
---

# Dataverse.Unmask function
[!INCLUDE[function-dataverse-unmask-applies-to](includes/function-dataverse-unmask-applies-to.md)]

Requests the unmasked value of a secured column for a single Microsoft Dataverse record.

## Description

The **Dataverse.Unmask** function reads a column asynchronously and returns a single value with the column's Power Fx type. It doesn't return a record or table, update the source record, change the masking rule, or replace masked values elsewhere in your app.

Dataverse enforces the user's permissions. The function doesn't grant access or bypass column-level security. To read an unmasked value, the user needs access to the table and record, column **Read** permission, and appropriate **Read unmasked** permission in a column security profile.

Add the Dataverse table as a data source in your canvas app and enable column-level security on the column. To configure masking, apply a supported masking rule in a managed environment. A secured column doesn't necessarily have a masking rule. See [Column-level security](../../admin/field-level-security.md) and [Create and manage masking rules](../../admin/create-manage-masking-rules.md) for configuration, permission options, and supported masking-rule types.

> [!IMPORTANT]
> Have your administrator choose the appropriate **Read unmasked** permission for the scenario. Don't grant **All records** solely to enable a single-record example. Test access restrictions with a non-administrator account because column-level security doesn't hide data from system administrators.

## Syntax

```powerfx
Dataverse.Unmask( Record, Column )
```

- _Record_ - Required. A record that retains its Dataverse record identity and is associated with exactly one Dataverse data source.
- _Column_ - Required. The identifier of a secured, supported scalar column on that record. Supply a column identifier, not a text expression containing the column name.

You can use a valid display name or logical name for _Column_. Use single quotes around a display name that contains spaces, such as `'Sensitive reference'`. Double quotes create a text literal and aren't equivalent. Power Apps resolves the identifier to the column's logical name.

## Record and column requirements

A selected gallery record, a record returned by **LookUp**, or a record stored in a variable or collection can be used if it retains its Dataverse identity and association with exactly one Dataverse source. Constructing an anonymous record with the same field values doesn't establish that identity.

Don't assign records from different Dataverse tables to the same record variable used by **Dataverse.Unmask**. Such a variable is associated with multiple sources and is rejected, even if the tables have secured columns with matching names. Use separate single-source variables or calls.

The target column must be secured and have a supported scalar type. Lookup-valued, record, table, file, image, and untyped columns aren't supported targets. Reading a record through a lookup is different from unmasking a lookup-valued column. Refer to the [masking-rule documentation](../../admin/create-manage-masking-rules.md#add-a-masking-rule-to-a-secured-column) for supported masking scenarios; formula type acceptance doesn't establish that a masking rule can be configured for a column.

## Return value and errors

The result has the same Power Fx type as the target column. For example, a text column returns text, not a record containing text.

Use **[IfError](function-iferror.md)** to handle failed reads. Dataverse determines the response when access is restricted; don't assume every permission denial produces an HTTP error.

| Situation | Behavior |
| --- | --- |
| The record has no associated Dataverse source or has multiple Dataverse sources. | Power Apps Studio rejects the record argument. |
| The column is unknown, unsecured, or has an unsupported type. | Power Apps Studio rejects the column argument. |
| A nonblank record has no valid identity at runtime, or its Dataverse source can't be resolved. | The function returns an invalid-record error. |
| The Dataverse request fails. | The function returns a Power Fx error that you can handle with **IfError**. |
| A successful request returns no row, omits the requested column, or returns a null value. | The result is blank. |

A blank result alone doesn't identify a permission problem. Check the selected record, its value, and the user's access before treating a blank result as a failure.

## Examples

These examples use an illustrative `Customers` Dataverse table with a secured text column named `'Sensitive reference'`. Add the table as a data source, configure a masking rule, and use synthetic records with a test user who has the appropriate permissions. Replace the table and column names with your own.

### Read a selected record

Set a gallery's **Items** property to `Customers`. With a saved record selected, this formula requests its unmasked reference:

```powerfx
Dataverse.Unmask( Gallery1.Selected, 'Sensitive reference' )
```

If the stored value is `"REF-12345"` and the user has permission to read it unmasked, the expected result is the text `"REF-12345"`. The formula doesn't change the masked value read through `Gallery1.Selected.'Sensitive reference'`.

### Handle an error for a text result

Use the following formula in a text label's **Text** property where you intend to display the unmasked value:

```powerfx
IfError(
    Dataverse.Unmask( Gallery1.Selected, 'Sensitive reference' ),
    "Unable to show this value."
)
```

The replacement value is text because `'Sensitive reference'` is a text column. For a different supported column type, use a compatible replacement value or convert the result before returning a text message. **IfError** handles errors, not successful blank results.

For a complete reveal-and-hide interaction, see [Reveal a masked Dataverse column value](/power-apps/maker/canvas-apps/dataverse-unmask).

## Data handling

Repeated evaluations can reuse cached results rather than make new network requests. Don't rely on another evaluation to recheck recently changed permissions. Hiding a control isn't an authorization boundary and doesn't clear cached values.

Don't persist unmasked values with **SaveData**, write them to logs, or copy them to a less-protected data source. Avoid exposing unmasked data in screenshots or diagnostic attachments.

## Related information

- [Reveal a masked Dataverse column value](/power-apps/maker/canvas-apps/dataverse-unmask).
- [Column-level security](../../admin/field-level-security.md).
- [Create and manage masking rules](../../admin/create-manage-masking-rules.md).
- [IfError, IsError, IsBlankOrError, and Error functions](function-iferror.md).
