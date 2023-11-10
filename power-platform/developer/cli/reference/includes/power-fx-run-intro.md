### Examples

The following examples show the use of the `pac power-fx run` command.

- [Query a Dataverse table](#query-a-dataverse-table)
- [Use PowerFx functions](#use-powerfx-functions)


> [!NOTE]
> In both of these examples, you need to: 
> 
> 1. Create a file named `test-pfx.txt` with Power Fx expressions in a folder on your computer, like `c:\test`.
>
> 1. [Open a Windows PowerShell window](/powershell/scripting/windows-powershell/starting-windows-powershell), navigate to the `test` folder and run a command.


### Query a Dataverse table

> [!NOTE]
> To query a Dataverse table, you have to create and select an auth profile. See [pac auth create](../auth.md#pac-auth-create) and [pac auth select](../auth.md#pac-auth-select).

1. Add the following text to `test-pfx.txt` and save the file.

   ```text
   FirstN(Contacts, 5)
   ```

   This command will retrieve the first five contacts from Dataverse.

1. Run the following command:

   ```powershell
   PS C:\test> pac power-fx run --file test-pfx.txt
   ```

   This is the output you can expect:

   ```text
   Connected to... Your Organization
   Connected as you@yourorg.onmicrosoft.com

   contactid                                      fullname           ...
   ============================================== ================== =====
   GUID("eeb27495-d127-ed11-9db1-00224804f8e2")   Yvonne McKay (sample)
   GUID("cba0ed9e-d127-ed11-9db1-00224804f8e2")   Susanna Stubberod (sample)
   GUID("cea0ed9e-d127-ed11-9db1-00224804f8e2")   Nancy Anderson (sample)
   GUID("6cc7483c-7a77-ee11-8179-00224809f375")   Maria Campbell (sample)
   GUID("49b0be2e-d01c-ed11-b83e-000d3a572421")   Sidney Higa (sample)
   PS C:\test>
   ```

### Use PowerFx functions

1. Add the following text to `test-pfx.txt` and save the file.

   ```text
   Set(x, 1)
   Result = If( Mid( "asdf",x,1 ) = "a", "X", "Y" )
   ```

   This example shows how to use [Mid](../../../../power-fx/reference/function-left-mid-right.md), [If](../../../../power-fx/reference/function-if.md), and [Set](../../../../power-fx/reference/function-set.md) Power Fx functions.

1. Run the following command:

   ```powershell
   PS C:\test> pac power-fx run --file test-pfx.txt
   ```

   This is the output you can expect:

   ```powershell
   PS C:\test> pac power-fx run --file test-pfx.txt
   x: 1
   true
   Result: "X"
   PS C:\test>
   ```

1. Add the `--echo` parameter and you can expect this output:

   ```powershell
   PS C:\test> pac power-fx run --file test-pfx.txt --echo
   Set(x, 1)

   x: 1
   true
   Result = If( Mid( "asdf",x,1 ) = "a", "X", "Y" )

   Result: "X"
   PS C:\test>
   ```