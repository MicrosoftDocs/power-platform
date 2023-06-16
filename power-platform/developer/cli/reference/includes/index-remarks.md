## Remarks

### How to enable tab completion for PAC CLI in PowerShell

Similar to [.NET CLI complete command](https://learn.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete) PAC CLI has `pac complete` command as well.

To add tab completion to **PowerShell** for the PAC CLI, create or edit the profile stored in the variable `$PROFILE`. For more information, see [How to create your profile](/powershell/module/microsoft.powershell.core/about/about_profiles#how-to-create-a-profile) and [Profiles and execution policy](/powershell/module/microsoft.powershell.core/about/about_profiles#profiles-and-execution-policy).

Add the following code to your profile:

```powershell
$scriptblock = {
    param($wordToComplete, $commandAst, $cursorPosition)

    &pac complete -s "$($commandAst.ToString())" | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}

Register-ArgumentCompleter -Native -CommandName pac -ScriptBlock $scriptblock
```

### Other Shells

Follow instructions to add to [other shells here](https://learn.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete#bash). Instead of `dotnet complete` use `pac complete`
