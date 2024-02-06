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
- Authentication
- Microsoft Dataverse environments
- Solution packages
- Portals
- Code components
- and more.

## Provide feedback

Use [github.com/microsoft/powerplatform-build-tools/discussions](https://github.com/microsoft/powerplatform-build-tools/discussions) to view and submit feedback for PAC CLI.

## Install Microsoft Power Platform CLI

There are three ways to install the Power Platform CLI.

|Method|OS Support|Description|
|---------|---------|---------|
|[Install the Visual Studio Code extension](../howto/install-vs-code-extension.md)|Windows,Linux,MacOS|Enables use of commands within a PowerShell terminal within Visual Studio Code on Windows 10, Windows 11, Linux, and macOS.|
|[Install with .NET Tool](../howto/install-cli-net-tool.md)|Windows,Linux,MacOS|Enables use of commands within a PowerShell, CMD, or Bash shell on Windows 10, Windows 11, Linux, and macOS.|
|[Install with Windows MSI](../howto/install-cli-msi.md)|Windows only|Install this when you need to use [pac data](reference/data.md) or certain [pac package](reference/package.md) commands ([deploy](reference/package.md#pac-package-deploy) and [show](reference/package.md#pac-package-show)) that are only available for Windows.|

### Check whether Power Platform CLI is already installed

For Windows, open PowerShell, type `Get-Command pac | Format-List` at the prompt, and press <kbd>Enter<kbd>. 

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

When Power Platform CLI isn't installed, you will get this error:

```
Get-Command: The term 'pac' is not recognized as a name of a cmdlet, function, script file, or executable program.
Check the spelling of the name, or if a path was included, verify that the path is correct and try again.
```

To see if Power Platform CLI is installed in Linux or macOS, open the Terminal/Command prompt, type `which pac ` at the prompt, and press <kbd>Enter<kbd>. 

### Check which version of Power Platform CLI is installed

Open the command prompt (on Microsoft Windows), or a Terminal session (in Linux), type `pac` and press <kbd>Enter<kbd>. 

You should see something like this where the version is on the second line.

```
Microsoft PowerPlatform CLI
Version: 1.30.3+g0f0e0b9
```

For [Power Platform CLI for Windows](../howto/install-cli-msi.md): 

* You can type `pac use` and press <kbd>Enter</kbd> to list installed versions.
* If you have multiple versions installed on your system then you can type `pac use <CLI version number>` and press <kbd>Enter</kbd> to use a specific version.

```
C:\Users\snizar> pac use
  1.29.11 (In Use)
  1.30.3
  1.30.6 (Latest)
C:\Users\snizar> pac use 1.30.6
Now using version 1.30.6 of the Microsoft PowerApps CLI.
C:\Users\snizar>
C:\Users\snizar> pac use
  1.29.11
  1.30.3
  1.30.6 (In Use) (Latest)
C:\Users\snizar>
```

## Manage auth profiles

Most PAC CLI commands require authenticated access to resources. You will need to create and use auth profiles.

> [!NOTE]
> With the Visual Studio Code extension, [you can view an manage authentication profiles](../howto/install-vs-code-extension.md#authentication-profile-management).

### Connect to your tenant

The `pac auth create` command is what you should use to connect to your tenant. Running `pac auth create` creates an authentication profile on your machine. You can have multiple authentication profiles available. Having multiple authentication profiles is interesting when you work with multiple tenants. For instance, when your company uses multiple tenants (a production tenant and a test / QA tenant) or when you are a consultant that works for multiple customers.

The `pac auth create` command has a couple of helpful parameters. The first one is the `--environment` parameter. The `--environment` parameter enables you to automatically connect to the right environment. If you omit the `--environment` parameter, you are connected to the default environment, but with the `--environment` parameter added to it, you can connect to a different one. You can use the environment ID, url, unique name, or partial name as the value.

The second one is the `--deviceCode` parameter. In environments where you don't have the ability to use an interactive experience, adding the `--deviceCode` parameter will make sure you can still connect. In, for instance, GitHub Codespaces, the `--deviceCode` parameter automatically gets added when you run `pac auth create`.

#### Example

To connect to the `HR-Dev` environment, you can use the following example:

```powershell
pac auth create --environment "HR-Dev"
```

### Switch to another authentication profile

When you have multiple authentication profiles, you can easily switch using the `pac auth list` and `pac auth select` commands.

The `pac auth list` command can be used to list all authentication profiles on your machine. The `pac auth select` command selects a different command.

#### Example

To list all authentication profiles, use the following example:

```powershell
pac auth list
```

Running the `pac auth list` command returns all authentication profiles:

```text
Index Active Kind      Name Friendly Name                   Url                                 User                                     Cloud  Type
[1]   *      UNIVERSAL      Personal Productivity (Default) https://x.crm.dynamics.com/         user@contoso.onmicrosoft.com             Public User
```

Now, select a different authentication profile by using the following example:

```powershell
pac auth select --index 2
```

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
