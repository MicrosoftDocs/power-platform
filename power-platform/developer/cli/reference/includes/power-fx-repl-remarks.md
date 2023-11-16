### Remarks

This command provides a shell to use formulas listed in [Formula reference - Power Platform CLI](../../../../power-fx/formula-reference-pac-cli.md).

Start the Power Fx repl by running the following command:

```powershell
pac power-fx repl
```

After that, you can run Power Fx commands.

#### Examples

The following examples show the use of the `pac power-fx repl` command.

- [Add rows](#add-rows)
- [Help](#help)
- [Exit](#exit)

##### Add rows

```powerapps-dot
Collect(Contacts, { firstname: "Patti", lastname: "Fernandez" })
```

The Power Fx repl responds with the following:

```text
{contactid:GUID("118d7b47-8f80-ee11-8179-0022482a40c7"), fullname:"Patti Fernandez", ...}
```

##### Help

Run the following command to get help about all the commands that are available in Power Fx repl:

```powerapps-dot
Help()
```

The Power Fx repl responds with the following output:

```text
  Abs             Acos            Acot            AddColumns      And
  Asin            AsType          Atan            Atan2           Average
  Blank           Boolean         Char            Clear           ClearCollect
  Coalesce        Collect         ColorFade       ColorValue      Concat
  Concatenate     Cos             Cot             Count           CountA
  CountIf         CountRows       Date            DateAdd         DateDiff
  DateTime        DateTimeValue   DateValue       Day             Dec2Hex
  Decimal         Degrees         Distinct        DropColumns     EDate
  EncodeUrl       EndsWith        EOMonth         Error           Exp
  Filter          Find            First           FirstN          Float
  ForAll          GUID            Help            Hex2Dec         Hour
  If              IfError         Index           Int             IsBlank
  IsBlankOrError  IsEmpty         IsError         IsMatch         IsNumeric
  IsToday         Language        Last            LastN           Left
  Len             Ln              Log             LookUp          Lower
  Match           MatchAll        Max             Mid             Min
  Minute          Mod             Month           Not             Notify
  Now             OptionSetInfo   Or              ParseJSON       Patch
  Pi              PlainText       Power           Proper          Radians
  Rand            RandBetween     Refresh         Remove          Replace
  RGBA            Right           Round           RoundDown       RoundUp
  Second          Sequence        Set             Shuffle         Sin
  Sort            Split           Sqrt            StartsWith      StdevP
  Substitute      Sum             Switch          Table           Tan
  Text            Time            TimeValue       TimeZoneOffset  Today
  Trim            TrimEnds        Trunc           Upper           Value
  VarP            Weekday         With            Year
>>
```

> [!NOTE]
> These commands will change over time to include more commands. It should be synchronized with the documented [currently available commands](../../../../power-fx/formula-reference-pac-cli.md).

##### Exit

Use `Exit()` to exit the `repl` command.