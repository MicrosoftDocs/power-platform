---
title: Microsoft Power Platform CLI | Microsoft Docs
description: "Install Microsoft Power Platform CLI to create, debug, and deploy code components by using Power Apps component framework."
keywords: Microsoft Power Platform CLI, code components, component framework, CLI
ms.author: snizar
author: snizar007
ms.reviewer: jdaly
ms.date: 01/26/2024
ms.topic: overview
---
# What is Microsoft Power Platform CLI?

Microsoft Power Platform CLI is a simple, one-stop developer CLI that empowers developers and ISVs to perform various operations in Microsoft Power Platform related to:

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

There are three ways to install the Power Platform CLI.

|Method|OS Support|Description|
|---------|---------|---------|
|[Install the Visual Studio Code extension](../howto/install-vs-code-extension.md)|Windows, Linux, macOS|Enables use of commands within a PowerShell terminal within Visual Studio Code on Windows 10, Windows 11, Linux, and macOS.|
|[Install with .NET Tool](../howto/install-cli-net-tool.md)|Windows, Linux, macOS|Enables use of commands within a PowerShell, CMD, or Bash shell on Windows 10, Windows 11, Linux, and macOS.<br />This installation method doesn't enable use of [pac data](reference/data.md) or certain [pac package](reference/package.md) commands ([deploy](reference/package.md#pac-package-deploy) and [show](reference/package.md#pac-package-show)) that are only available for Windows.|
|[Install with Windows MSI](../howto/install-cli-msi.md)|Windows only|Enables use of commands within a PowerShell terminal within Visual Studio Code on Windows only. You can [manage installed versions](../howto/install-cli-msi.md#manage-versions) with this installation method.|

> [!NOTE]
> The following commands are only available on Windows when you install Power Platform CLI using the [Visual Studio Code extension](../howto/install-vs-code-extension.md) or [Windows MSI](../howto/install-cli-msi.md):
>
> - [pac data](reference/data.md)
> - [pac package deploy](reference/package.md#pac-package-deploy)
> - [pac package show](reference/package.md#pac-package-show)
>
> You can't use these commands with Linux or macOS or when you use the [.NET Tool](../howto/install-cli-net-tool.md) install method.


### Check whether Power Platform CLI is already installed

How to determine whether the Power Platform CLI is installed depends on your operating system.

## [Windows](#tab/windows)

For Windows, open PowerShell, type `Get-Command pac | Format-List` at the prompt, and press **Enter**.

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

When Power Platform CLI isn't installed, you'll get this error:

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

### Do you need to add PAC to PATH variable in Microsoft Windows?

Open command prompt as Administrator, type `setx /M PATH "%PATH%;C:\\<location of your pac command>"` and press **Enter**.

## Manage auth profiles

Most PAC CLI commands require authenticated access to resources. You'll need to create and use auth profiles.

> [!NOTE]
> With the Visual Studio Code extension, [you can view and manage authentication profiles](../howto/install-vs-code-extension.md#authentication-profile-management).

[!INCLUDE [auth-intro](reference/includes/auth-intro.md)]

## US Sovereign cloud availability

Microsoft Power Platform CLI is available for use in the GCC and GCC High (US Sovereign cloud) regions. See the [`--cloud`](reference/auth.md#--cloud--ci) parameter for the [pac auth create](reference/auth.md#pac-auth-create) command to find out about supported US Sovereign cloud environments.


## Next steps

Learn about the commands. For the complete list of supported commands, run the `pac help` command or `pac <subcommand> help` - for example: `pac solution help`.

Or view the list of commands in the documentation:

> [!div class="nextstepaction"]
> [Microsoft Power Platform CLI Command Groups](reference/index.md)<br/>

### See also

[Microsoft Power Platform CLI Command Groups](reference/index.md)<br />
[Power Apps component framework](/power-apps/developer/component-framework/overview)<br />

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
