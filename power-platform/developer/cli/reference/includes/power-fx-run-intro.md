### Examples

The following examples show the use of the `pac power-fx run` command.

- [Example scenario 1](#example-scenario-1)
- [Example scenario 2](#example-scenario-2)

<!-- Replace these placeholder examples with real examples -->
### Example Scenario 1

For example, you have a file called "test-pfx.txt" with Power Fx expressions, that are:

```text
// Show first 5 records in Contacts table
FirstN(Contacts, 5)
// Use Help() for additional formaulas to use
Help()
// To leave, type Exit() which is case sensitive
Exit()
```

You will type below command to run the file.

```powershell
pac power-fx run --file test-pfx.txt
```

### Example Scenario 2

For example, you have a file called "test-pfx.txt" with Power Fx expressions, that are:

```text
Set(x, 1)
Result = If( Mid( "asdf",x,1 ) = "a", "X", "Y" )
```

```powershell
pac power-fx run --file test-pfx.txt --echo
```

**Result with --echo flag are:**

```text
>> Set(x, 1)
x: 1
true

>> Result = If( Mid( "asdf",x,1 ) = "a", "X", "Y" )
Result: "X"
```