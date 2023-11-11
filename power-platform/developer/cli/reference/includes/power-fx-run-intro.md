### Examples

The following examples show the use of the `pac power-fx run` command.

- [Create Dataverse records](#create-dataverse-records)
- [Query a Dataverse table](#query-a-dataverse-table)
- [Use PowerFx functions](#use-powerfx-functions)


> [!NOTE]
> In each of these examples, you need to:
> 
> 1. Create a file named `test-pfx.txt` with Power Fx expressions in a folder on your computer, like `c:\test`.
>
> 1. [Open a Windows PowerShell window](/powershell/scripting/windows-powershell/starting-windows-powershell), navigate to the `test` folder and use the `run` command specifying the file that contains the commands: `pac power-fx run --file test-pfx.txt`.
>
> To use Dataverse tables, you have to create and select an auth profile. See [pac auth create](../auth.md#pac-auth-create) and [pac auth select](../auth.md#pac-auth-select).
> 
> If you get an error check [Troubleshooting](#troubleshooting).

### Create Dataverse records

1. Add the following text to `test-pfx.txt` and save the file.

   ```powerapps-dot
   Collect(Contacts, { firstname: "Megan", lastname: "Bowen" })
   Collect(Contacts, { firstname: "Garth", lastname: "Forth" })
   Collect(Contacts, { firstname: "Adele", lastname: "Vance" })
   Collect(Contacts, { firstname: "Patti", lastname: "Fernandez" })
   ```
   
1. Run this command:

   ```powershell
   PS C:\test> pac power-fx run --file test-pfx.txt
   ```
   
   You can expect output like the following:

   ```powershell
   {contactid:GUID("80eb0c02-9180-ee11-8179-0022482a40c7"), fullname:"Megan Bowen", ...}
   {contactid:GUID("81eb0c02-9180-ee11-8179-0022482a40c7"), fullname:"Garth Forth", ...}
   {contactid:GUID("82eb0c02-9180-ee11-8179-0022482a40c7"), fullname:"Adele Vance", ...}
   {contactid:GUID("83eb0c02-9180-ee11-8179-0022482a40c7"), fullname:"Patti Fernandez", ...}
   ```
   
### Query a Dataverse table


1. Add this text to `test-pfx.txt` and save the file.

   ```powerapps-dot
   FirstN(Contacts, 5)
   ```

   This command retrieves the first five contacts from Dataverse.

1. Run this command:

   ```powershell
   PS C:\test> pac power-fx run --file test-pfx.txt
   ```

   You can expect output like the following:

   ```powershell
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

   ```powerapps-dot
   Set(x, 1)
   Result = If( Mid( "asdf",x,1 ) = "a", "X", "Y" )
   ```

   This example uses the [Mid](../../../../power-fx/reference/function-left-mid-right.md), [If](../../../../power-fx/reference/function-if.md), and [Set](../../../../power-fx/reference/function-set.md) Power Fx functions.

1. Run the following command:

   ```powershell
   PS C:\test> pac power-fx run --file test-pfx.txt
   ```

   You can expect output like the following:

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