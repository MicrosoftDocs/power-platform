### Examples

The following examples show the use of the `pac power-fx run` command.

- [How to query Dataverse table](#How-to-query-Dataverse-table)
- [Example scenario 2](#example-scenario-2)
- [Here we use MID, IF, and Set functions](#Here-we-use-MID,-IF,-and-Set-functions)

<!-- Replace these placeholder examples with real examples -->
### How to query Dataverse table

For example, you have a file called "test-pfx.txt" with Power Fx expressions to query table Contacts, that are:

```text
// Show first 5 records in Contacts table
FirstN(Contacts, 5)
// To leave, type Exit() which is case sensitive
Exit()
```

You will type below command to run the file without outputing Power Fx commands.

```powershell
pac power-fx run --file test-pfx.txt
```

**Result you would get:**

```text
>> FirstN(Contacts, 5)

  contactid                                      fullname    ...
 ============================================== =========== =====
  GUID("e03fa2ef-bd30-ee11-bdf3-000d3a5a7956")   Sh Nizar
  GUID("386dc912-f52c-ee11-bdf4-000d3a5a7956")   Shafqat N
  GUID("90a4fe1c-f52c-ee11-bdf4-000d3a5a7956")   Nizar S
  GUID("e1f83423-f52c-ee11-bdf4-000d3a5a7956")   Al N
  GUID("285c8d2b-f52c-ee11-bdf4-000d3a5a7956")   Sara H

>>

PS C:\Users\snizar>
```

### Here we use MID, IF, and Set functions

For example, you have a file called "test-pfx.txt" with Power Fx expressions, that are:

```text
Set(x, 1)
Result = If( Mid( "asdf",x,1 ) = "a", "X", "Y" )
```

You will type below command to run the file outputing Power Fx commands by using --echo switch.

```powershell
pac power-fx run --file test-pfx.txt --echo
```

**Result you would get:**

```text
>> Set(x, 1)
x: 1
true

>> Result = If( Mid( "asdf",x,1 ) = "a", "X", "Y" )
Result: "X"
```