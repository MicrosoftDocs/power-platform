---
title: Microsoft Power Platform CLI | Microsoft Docs
description: "Install Microsoft Power Platform CLI to create, debug, and deploy code components by using Power Apps component framework."
keywords: Microsoft Power Platform CLI, code components, component framework, CLI
ms.author: laswenka
author: laneswenka
ms.reviewer: jdaly
ms.date: 05/28/2025
ms.topic: overview
---
# What is Microsoft Power Platform CLI?

Microsoft Power Platform CLI is a simple, one-stop developer CLI that empowers developers and independent software vendors (ISVs) to perform various operations in Microsoft Power Platform related to:

- Environment lifecycle
- [Authentication](#manage-auth-profiles)
- Microsoft Dataverse environments
- Solution packages
- [Power Pages](/power-pages/configure/power-platform-cli)
- [Code components](/power-apps/developer/component-framework/create-custom-controls-using-pcf)
- and more...

## Provide feedback

Use [github.com/microsoft/powerplatform-build-tools/discussions](https://github.com/microsoft/powerplatform-build-tools/discussions) to view and submit feedback for PAC CLI.

## Install Microsoft Power Platform CLI

There are three ways to install the Power Platform CLI. You can use multiple installation methods on the same computer.

|Method|OS Support|Description|
|---------|---------|---------|
|[Install the Visual Studio Code extension](../howto/install-vs-code-extension.md)|Windows, Linux, macOS|Enables use of commands within a PowerShell terminal within Visual Studio Code on Windows 10, Windows 11, Linux, and macOS.<br /><br />When you install using ONLY this method, by default PAC CLI is only available within a Visual Studio Code terminal unless you [enable PAC CLI in Command Prompt (CMD) and PowerShell terminals for Windows](../howto/install-vs-code-extension.md#enable-pac-cli-in-command-prompt-cmd-and-powershell-terminals-for-windows)|
|[Install with .NET Tool](../howto/install-cli-net-tool.md)|Windows, Linux, macOS|Enables use of commands within a PowerShell, CMD, or Bash shell on Windows 10, Windows 11, Linux, and macOS.<br /><br />This installation method doesn't enable use of [pac data](reference/data.md) or certain [pac package](reference/package.md) commands ([deploy](reference/package.md#pac-package-deploy) and [show](reference/package.md#pac-package-show)) that are only available for Windows.|
|[Install with Windows MSI](../howto/install-cli-msi.md)|Windows only|Enables use of commands within a PowerShell terminal within Visual Studio Code on Windows only. You can [manage installed versions](../howto/install-cli-msi.md#manage-versions) with this installation method.|

> [!NOTE]
> The following commands are only available on Windows:
>
> - [pac data](reference/data.md)
> - [pac package deploy](reference/package.md#pac-package-deploy)
> - [pac package show](reference/package.md#pac-package-show)
>
> To use these commands on Windows, install Power Platform CLI using either (or both) of these installation methods:
>
> - [Visual Studio Code extension](../howto/install-vs-code-extension.md)
> - [Windows MSI](../howto/install-cli-msi.md)
>
> These commands aren't available on Windows if you only install using the [.NET Tool](../howto/install-cli-net-tool.md).

### Check whether Power Platform CLI is already installed

How to determine whether the Power Platform CLI is installed depends on your operating system.

## [Windows](#tab/windows)

1. Open a PowerShell terminal:

   - If you ONLY installed the [Visual Studio Code extension](../howto/install-vs-code-extension.md), open a Visual Studio Code PowerShell terminal window.
   - If you installed using the [.NET Tool](../howto/install-cli-net-tool.md), open a Visual Studio Code PowerShell terminal OR a PowerShell terminal.

1. Type `Get-Command pac | Format-List` at the prompt, and press **Enter**.

The results should look something like this:

```
Name            : pac.exe
CommandType     : Application
Definition      : C:\Users\you\.dotnet\tools\pac.exe
Extension       : .exe
Path            : C:\Users\you\.dotnet\tools\pac.exe
FileVersionInfo : File:             C:\Users\you\.dotnet\tools\pac.exe
                  InternalName:     pac.dll
                  OriginalFilename: pac.dll
                  FileVersion:      1.29.11
                  FileDescription:  Microsoft Power Platform CLI
                  Product:          Microsoft Power Platform&copy;
                  ProductVersion:   1.29.11+g9e2b163
                  Debug:            False
                  Patched:          False
                  PreRelease:       False
                  PrivateBuild:     False
                  SpecialBuild:     False
                  Language:         Language Neutral
```

When Power Platform CLI isn't installed, you get this error:

```powershell
Get-Command: The term 'pac' is not recognized as a name of a cmdlet, function, script file, or executable program.
Check the spelling of the name, or if a path was included, verify that the path is correct and try again.
```

## [Linux/macOS](#tab/linux-macos)

To see if Power Platform CLI is installed in **Linux or macOS**, open the Terminal/Command prompt, type `which pac` at the prompt, and press **Enter**.

The results should look something like this:

```bash
/home/you/.dotnet/tools/pac
```

---

### Check which version of Power Platform CLI is installed

Open the command prompt (on Microsoft Windows), or a Terminal session (in Linux), type `pac` and press **Enter**.

You should see something like this where the version is on the second line.

```
Microsoft PowerPlatform CLI
Version: 1.30.3+g0f0e0b9
```

## Manage auth profiles

Most PAC CLI commands require authenticated access to resources. You need to create and use auth profiles.

> [!NOTE]
> With the Visual Studio Code extension, [you can view and manage authentication profiles](../howto/install-vs-code-extension.md#authentication-profile-management).

[!INCLUDE [auth-intro](reference/includes/auth-intro.md)]

## Enable tab completion in PowerShell

Power Platform CLI has a `pac complete` command similar to the [.NET CLI complete command](/dotnet/core/tools/enable-tab-autocomplete).

When configured using the following instructions, you can type just the beginning of a command and then use the <kbd>Tab</kbd> key to complete the input entered.

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

You can also use tab completion with [bash, zsh, fish, and nushell](/dotnet/core/tools/enable-tab-autocomplete#bash). Instead of `dotnet complete` use `pac complete`

## US Sovereign cloud availability

Microsoft Power Platform CLI is available for use in the GCC and GCC High (US Sovereign cloud) regions. See the [`--cloud`](reference/auth.md#--cloud--ci) parameter for the [pac auth create](reference/auth.md#pac-auth-create) command to find out about supported US Sovereign cloud environments.


## Next steps

Learn about the commands. For the complete list of supported commands, run the `pac help` command or `pac <subcommand> help` - for example: `pac solution help`.

Or view the list of commands in the documentation:

> [!div class="nextstepaction"]
> [Microsoft Power Platform CLI Command Groups](reference/index.md)<br/>

### See also

[Microsoft Power Platform CLI release notes](https://www.nuget.org/packages/Microsoft.PowerApps.CLI#releasenotes-body-tab)<br />
[Microsoft Power Platform CLI Command Groups](reference/index.md)<br />
[Power Apps component framework](/power-apps/developer/component-framework/overview)<br />

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
