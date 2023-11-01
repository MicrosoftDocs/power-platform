## Enable tab completion in PowerShell

Power Platform CLI has a `pac complete` command similar to the [.NET CLI complete command](/dotnet/core/tools/enable-tab-autocomplete).

When configured using the instructions below, you can type just the beginning of a command and then use the <kbd>Tab</kbd> key to complete the input entered.

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

You can also use this with [bash, zsh, fish, and nushell](/dotnet/core/tools/enable-tab-autocomplete#bash). Instead of `dotnet complete` use `pac complete`
