---
title: Power Fx formula reference
description: Reference information for functions, signals, and enumerations in Power Fx.
author: gregli-msft
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur-msft
ms.date: 09/10/2022
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - mduelae
  - gregli-msft
  - jorisdg
---

# Power Fx formula reference

Formulas combine many elements. Listed below are:

- **Functions** take parameters, perform an operation, and return a value. For example, **Sqrt(25)** returns **5**. Functions are modeled after Microsoft Excel functions. Some functions have side effects, such as **SubmitForm**, which are appropriate only in a [behavior formula](/power-apps/maker/canvas-apps/working-with-formulas-in-depth) such as **Button.OnSelect**.
- **Signals** return information about the environment. For example, **[Location](reference/signals.md)** returns the device's current GPS coordinates. Signals don't take parameters or have side effects.
- **Enumerations** return a pre-defined constant value. For example, **[Color](reference/function-colors.md)** is an enumeration that has pre-defined values for **Color.Red**, **Color.Blue**, and so forth. Common enumerations are included here; function-specific enumerations are described with the function.
- **Named operators**, such as **[ThisItem](reference/operators.md#thisitem-thisrecord-and-as-operators)** and **[Self](reference/operators.md#self-and-parent-operators)**, provide access to information from within a container.

Other elements include:

- [Operators and identifiers](reference/operators.md)
- [Controls and their properties](/power-apps/maker/canvas-apps/reference-properties)
- [Data types](data-types.md)

## List of functions by product or service

:::row:::
   :::column span="":::
      [Power Apps](formula-reference-power-apps.md)
   :::column-end:::
   :::column span="":::
      [Dataverse](formula-reference-dataverse.md)
   :::column-end:::
   :::column span="":::
      [Power Virtual Agents](formula-reference-pva.md)
   :::column-end:::
:::row-end:::

## List of all functions

:::row:::
   :::column span="":::
        [Abs](reference/function-numericals.md)
   :::column-end:::
   :::column span="":::
        [Acceleration](reference/signals.md)
   :::column-end:::
   :::column span="":::
        [Acos](reference/function-trig.md)
   :::column-end:::
   :::column span="":::
        [Acot](reference/function-trig.md)
   :::column-end:::
   :::column span="":::
        [AddColumns](reference/function-table-shaping.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [And](reference/function-logicals.md)
   :::column-end:::
   :::column span="":::
        [App](reference/object-app.md)
   :::column-end:::
   :::column span="":::
        [Asin](reference/function-trig.md)
   :::column-end:::
   :::column span="":::
        [Assert](reference/function-assert.md)
   :::column-end:::
   :::column span="":::
        [As](reference/operators.md#thisitem-thisrecord-and-as-operators)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [AsType](reference/function-astype-istype.md)
   :::column-end:::
   :::column span="":::
        [Atan](reference/function-trig.md)
   :::column-end:::
   :::column span="":::
        [Atan2](reference/function-trig.md)
   :::column-end:::
   :::column span="":::
        [Average](reference/function-aggregates.md)
   :::column-end:::
   :::column span="":::
        [Back](reference/function-navigate.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Blank](reference/function-isblank-isempty.md)
   :::column-end:::
   :::column span="":::
        [Boolean](reference/function-boolean.md)
   :::column-end:::
   :::column span="":::
        [Calendar](reference/function-clock-calendar.md)
   :::column-end:::
   :::column span="":::
        [Char](reference/function-char.md)
   :::column-end:::
   :::column span="":::
        [Choices](reference/function-choices.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Clear](reference/function-clear-collect-clearcollect.md)
   :::column-end:::
   :::column span="":::
        [ClearCollect](reference/function-clear-collect-clearcollect.md)
   :::column-end:::
   :::column span="":::
        [ClearData](reference/function-savedata-loaddata.md)
   :::column-end:::
   :::column span="":::
        [Clock](reference/function-clock-calendar.md)
   :::column-end:::
   :::column span="":::
        [Coalesce](reference/function-isblank-isempty.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Collect](reference/function-clear-collect-clearcollect.md)
   :::column-end:::
   :::column span="":::
        [Color](reference/function-colors.md)
   :::column-end:::
   :::column span="":::
        [ColorFade](reference/function-colors.md)
   :::column-end:::
   :::column span="":::
        [ColorValue](reference/function-colors.md)
   :::column-end:::
   :::column span="":::
        [Compass](reference/signals.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Concat](reference/function-concatenate.md)
   :::column-end:::
   :::column span="":::
        [Concatenate](reference/function-concatenate.md)
   :::column-end:::
   :::column span="":::
        [Concurrent](reference/function-concurrent.md)
   :::column-end:::
   :::column span="":::
        [Connection](reference/signals.md)
   :::column-end:::
   :::column span="":::
        [Copy](reference/function-copy.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Count](reference/function-table-counts.md)
   :::column-end:::
   :::column span="":::
        [Cos](reference/function-trig.md)
   :::column-end:::
   :::column span="":::
        [Cot](reference/function-trig.md)
   :::column-end:::
   :::column span="":::
        [CountA](reference/function-table-counts.md)
   :::column-end:::
   :::column span="":::
        [CountIf](reference/function-table-counts.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [CountRows](reference/function-table-counts.md)
   :::column-end:::
   :::column span="":::
        [DataSourceInfo](reference/function-datasourceinfo.md)
   :::column-end:::
   :::column span="":::
        [Date](reference/function-date-time.md)
   :::column-end:::
   :::column span="":::
        [DateAdd](reference/function-dateadd-datediff.md)
   :::column-end:::
   :::column span="":::
        [DateDiff](reference/function-dateadd-datediff.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [DateTimeValue](reference/function-datevalue-timevalue.md)
   :::column-end:::
   :::column span="":::
        [DateValue](reference/function-datevalue-timevalue.md)
   :::column-end:::
   :::column span="":::
        [Day](reference/function-datetime-parts.md)
   :::column-end:::
   :::column span="":::
        [Defaults](reference/function-defaults.md)
   :::column-end:::
   :::column span="":::
        [Degrees](reference/function-trig.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Disable](reference/function-enable-disable.md)
   :::column-end:::
   :::column span="":::
        [Distinct](reference/function-distinct.md)
   :::column-end:::
   :::column span="":::
        [Download](reference/function-download.md)
   :::column-end:::
   :::column span="":::
        [DropColumns](reference/function-table-shaping.md)
   :::column-end:::
   :::column span="":::
        [EditForm](reference/function-form.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Enable](reference/function-enable-disable.md)
   :::column-end:::
   :::column span="":::
        [EncodeUrl](reference/function-encode-decode.md)
   :::column-end:::
   :::column span="":::
        [EndsWith](reference/function-startswith.md)
   :::column-end:::
   :::column span="":::
        [Error](reference/function-iferror.md)
   :::column-end:::
   :::column span="":::
        [Errors](reference/function-errors.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Exactin](reference/operators.md#in-and-exactin-operators)
   :::column-end:::
   :::column span="":::
        [Exit](reference/function-exit.md)
   :::column-end:::
   :::column span="":::
        [Exp](reference/function-numericals.md)
   :::column-end:::
   :::column span="":::
        [Filter](reference/function-filter-lookup.md)
   :::column-end:::
   :::column span="":::
        [Find](reference/function-find.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [First](reference/function-first-last.md)
   :::column-end:::
   :::column span="":::
        [FirstN](reference/function-first-last.md)
   :::column-end:::
   :::column span="":::
        [ForAll](reference/function-forall.md)
   :::column-end:::
   :::column span="":::
        [GroupBy](reference/function-groupby.md)
   :::column-end:::
   :::column span="":::
        [GUID](reference/function-guid.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [HashTags](reference/function-hashtags.md)
   :::column-end:::
   :::column span="":::
        [Host](reference/object-host.md)
   :::column-end:::
   :::column span="":::
        [Hour](reference/function-datetime-parts.md)
   :::column-end:::
   :::column span="":::
        [If](reference/function-if.md)
   :::column-end:::
   :::column span="":::
        [IfError](reference/function-iferror.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [In](reference/operators.md#in-and-exactin-operators)
   :::column-end:::
   :::column span="":::
        [Index](reference/function-first-last.md)
   :::column-end:::
   :::column span="":::
        [Int](reference/function-round.md)
   :::column-end:::
   :::column span="":::
        [IsBlank](reference/function-isblank-isempty.md)
   :::column-end:::
   :::column span="":::
        [IsBlankOrError](reference/function-iferror.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [IsEmpty](reference/function-isblank-isempty.md)
   :::column-end:::
   :::column span="":::
        [IsError](reference/function-iferror.md)
   :::column-end:::
   :::column span="":::
        [IsMatch](reference/function-ismatch.md)
   :::column-end:::
   :::column span="":::
        [IsNumeric](reference/function-isnumeric.md)
   :::column-end:::
   :::column span="":::
        [ISOWeekNum](reference/function-weeknum.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [IsToday](reference/function-now-today-istoday.md)
   :::column-end:::
   :::column span="":::
        [IsType](reference/function-astype-istype.md)
   :::column-end:::
   :::column span="":::
        [IsUTCToday](reference/function-now-today-istoday.md)
   :::column-end:::
   :::column span="":::
        [JSON](reference/function-json.md)
   :::column-end:::
   :::column span="":::
        [Language](reference/function-language.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Last](reference/function-first-last.md)
   :::column-end:::
   :::column span="":::
        [LastN](reference/function-first-last.md)
   :::column-end:::
   :::column span="":::
        [Launch](reference/function-param.md)
   :::column-end:::
   :::column span="":::
        [Left](reference/function-left-mid-right.md)
   :::column-end:::
   :::column span="":::
        [Len](reference/function-len.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Ln](reference/function-numericals.md)
   :::column-end:::
   :::column span="":::
        [LoadData](reference/function-savedata-loaddata.md)
   :::column-end:::
   :::column span="":::
        [Location](reference/signals.md)
   :::column-end:::
   :::column span="":::
        [Log](reference/function-numericals.md)
   :::column-end:::
   :::column span="":::
        [LookUp](reference/function-filter-lookup.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Lower](reference/function-lower-upper-proper.md)
   :::column-end:::
   :::column span="":::
        [Match](reference/function-ismatch.md)
   :::column-end:::
   :::column span="":::
        [MatchAll](reference/function-ismatch.md)
   :::column-end:::
   :::column span="":::
        [Max](reference/function-aggregates.md)
   :::column-end:::
   :::column span="":::
        [Mid](reference/function-left-mid-right.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Min](reference/function-aggregates.md)
   :::column-end:::
   :::column span="":::
        [Minute](reference/function-datetime-parts.md)
   :::column-end:::
   :::column span="":::
        [Mod](reference/function-mod.md)
   :::column-end:::
   :::column span="":::
        [Month](reference/function-datetime-parts.md)
   :::column-end:::
   :::column span="":::
        [Navigate](reference/function-navigate.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [NewForm](reference/function-form.md)
   :::column-end:::
   :::column span="":::
        [Not](reference/function-logicals.md)
   :::column-end:::
   :::column span="":::
        [Notify](reference/function-showerror.md)
   :::column-end:::
   :::column span="":::
        [Now](reference/function-now-today-istoday.md)
   :::column-end:::
   :::column span="":::
        [Or](reference/function-logicals.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Param](reference/function-param.md)
   :::column-end:::
   :::column span="":::
        [Parent](reference/operators.md#self-and-parent-operators)
   :::column-end:::
   :::column span="":::
        [ParseJSON](reference/function-parsejson.md)
   :::column-end:::
   :::column span="":::
        [Patch](reference/function-patch.md)
   :::column-end:::
   :::column span="":::
        [PDF](reference/function-pdf.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Pi](reference/function-trig.md)
   :::column-end:::
   :::column span="":::
        [PlainText](reference/function-encode-decode.md)
   :::column-end:::
   :::column span="":::
        [Power](reference/function-numericals.md)
   :::column-end:::
   :::column span="":::
        [Proper](reference/function-lower-upper-proper.md)
   :::column-end:::
   :::column span="":::
        [Radians](reference/function-trig.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Rand](reference/function-rand.md)
   :::column-end:::
   :::column span="":::
        [RandBetween](reference/function-rand.md)
   :::column-end:::
   :::column span="":::
        [ReadNFC](reference/function-readnfc.md)
   :::column-end:::
   :::column span="":::
        [RecordInfo](reference/function-recordinfo.md)
   :::column-end:::
   :::column span="":::
        [Refresh](reference/function-refresh.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Relate](reference/function-relate-unrelate.md)
   :::column-end:::
   :::column span="":::
        [Remove](reference/function-remove-removeif.md)
   :::column-end:::
   :::column span="":::
        [RemoveIf](reference/function-remove-removeif.md)
   :::column-end:::
   :::column span="":::
        [RenameColumns](reference/function-table-shaping.md)
   :::column-end:::
   :::column span="":::
        [Replace](reference/function-replace-substitute.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [RequestHide](reference/function-requesthide.md)
   :::column-end:::
   :::column span="":::
        [Reset](reference/function-reset.md)
   :::column-end:::
   :::column span="":::
        [ResetForm](reference/function-form.md)
   :::column-end:::
   :::column span="":::
        [Revert](reference/function-revert.md)
   :::column-end:::
   :::column span="":::
        [RGBA](reference/function-colors.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Right](reference/function-left-mid-right.md)
   :::column-end:::
   :::column span="":::
        [Round](reference/function-round.md)
   :::column-end:::
   :::column span="":::
        [RoundDown](reference/function-round.md)
   :::column-end:::
   :::column span="":::
        [RoundUp](reference/function-round.md)
   :::column-end:::
   :::column span="":::
        [SaveData](reference/function-savedata-loaddata.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Search](reference/function-filter-lookup.md)
   :::column-end:::
   :::column span="":::
        [Second](reference/function-datetime-parts.md)
   :::column-end:::
   :::column span="":::
        [Select](reference/function-select.md)
   :::column-end:::
   :::column span="":::
        [Self](reference/operators.md#self-and-parent-operators)
   :::column-end:::
   :::column span="":::
        [Sequence](reference/function-sequence.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [SendAppNotification (preview)](reference/function-send-app-notification.md)
   :::column-end:::
   :::column span="":::
        [Set](reference/function-set.md)
   :::column-end:::
   :::column span="":::
        [SetFocus](reference/function-setfocus.md)
   :::column-end:::
   :::column span="":::
        [SetProperty](reference/function-setproperty.md)
   :::column-end:::
   :::column span="":::
        [ShowColumns](reference/function-table-shaping.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Shuffle](reference/function-shuffle.md)
   :::column-end:::
   :::column span="":::
        [Sin](reference/function-trig.md)
   :::column-end:::
   :::column span="":::
        [Sort](reference/function-sort.md)
   :::column-end:::
   :::column span="":::
        [SortByColumns](reference/function-sort.md)
   :::column-end:::
   :::column span="":::
        [Split](reference/function-split.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Sqrt](reference/function-numericals.md)
   :::column-end:::
   :::column span="":::
        [StartsWith](reference/function-startswith.md)
   :::column-end:::
   :::column span="":::
        [StdevP](reference/function-aggregates.md)
   :::column-end:::
   :::column span="":::
        [Substitute](reference/function-replace-substitute.md)
   :::column-end:::
   :::column span="":::
        [SubmitForm](reference/function-form.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Sum](reference/function-aggregates.md)
   :::column-end:::
   :::column span="":::
        [Switch](reference/function-if.md)
   :::column-end:::
   :::column span="":::
        [Table](reference/function-table.md)
   :::column-end:::
   :::column span="":::
        [Tan](reference/function-trig.md)
   :::column-end:::
   :::column span="":::
        [Text](reference/function-text.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [ThisItem](reference/operators.md#thisitem-thisrecord-and-as-operators)
   :::column-end:::
   :::column span="":::
        [ThisRecord](reference/operators.md#thisitem-thisrecord-and-as-operators)
   :::column-end:::
   :::column span="":::
        [Time](reference/function-date-time.md)
   :::column-end:::
   :::column span="":::
        [TimeValue](reference/function-datevalue-timevalue.md)
   :::column-end:::
   :::column span="":::
        [TimeZoneOffset](reference/function-dateadd-datediff.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Today](reference/function-now-today-istoday.md)
   :::column-end:::
   :::column span="":::
        [Trace](reference/function-trace.md)
   :::column-end:::
   :::column span="":::
        [Trim](reference/function-trim.md)
   :::column-end:::
   :::column span="":::
        [TrimEnds](reference/function-trim.md)
   :::column-end:::
   :::column span="":::
        [Trunc](reference/function-round.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Ungroup](reference/function-groupby.md)
   :::column-end:::
   :::column span="":::
        [Unrelate](reference/function-relate-unrelate.md)
   :::column-end:::
   :::column span="":::
        [Update](reference/function-update-updateif.md)
   :::column-end:::
   :::column span="":::
        [UpdateContext](reference/function-updatecontext.md)
   :::column-end:::
   :::column span="":::
        [UpdateIf](reference/function-update-updateif.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Upper](reference/function-lower-upper-proper.md)
   :::column-end:::
   :::column span="":::
        [User](reference/function-user.md)
   :::column-end:::
   :::column span="":::
        [UTCNow](reference/function-now-today-istoday.md)
   :::column-end:::
   :::column span="":::
        [UTCToday](reference/function-now-today-istoday.md)
   :::column-end:::
   :::column span="":::
        [Validate](reference/function-validate.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [Value](reference/function-value.md)
   :::column-end:::
   :::column span="":::
        [VarP](reference/function-aggregates.md)
   :::column-end:::
   :::column span="":::
        [ViewForm](reference/function-form.md)
   :::column-end:::
   :::column span="":::
        [Weekday](reference/function-datetime-parts.md)
   :::column-end:::
   :::column span="":::
        [WeekNum](reference/function-weeknum.md)
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="":::
        [With](reference/function-with.md)
   :::column-end:::
   :::column span="":::
        [Year](reference/function-datetime-parts.md)
   :::column-end:::
   :::column span="":::
        
   :::column-end:::
   :::column span="":::
        
   :::column-end:::
   :::column span="":::
        
   :::column-end:::
:::row-end:::


[!INCLUDE[footer-include](../includes/footer-banner.md)]
