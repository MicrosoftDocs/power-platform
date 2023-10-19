> [!NOTE]
> Before you can use the `build` command you must first connect to Dataverse using the [pac auth create](../auth.md#pac-auth-create) command. If you have multiple connections, use the [pac auth select](../auth.md#pac-auth-select) to choose the Dataverse environment you want to generate code for.


### Example

The following example shows how to use the `build` command with a command prompt.

<!-- 
We should use the full parameter names for examples. The alias are too cryptic for beginners.
People are learning and they can replace them with the aliases as they become familar with them.
Showing the commands on multiple lines that end in '`', allows them to see the full names and
just copy and paste the command to try them.
-->


```dos
pac modelbuilder build ^
  --entitynamesfilter account;contact ^
  --generatesdkmessages ^
  --messagenamesfilter examp_* ^
  --emitfieldsclasses ^
  --emitVirtualAttributes ^
  --namespace MyApps.Model ^
  --outdirectory c:\src\MyApps\Model ^
  --writesettingsTemplateFile ^
  --serviceContextName OrgContext
```

And the same command using PowerShell:

```powershell
pac modelbuilder build `
  --entitynamesfilter 'account;contact' `
  --generatesdkmessages `
  --messagenamesfilter 'examp_*' `
  --emitfieldsclasses `
  --emitVirtualAttributes `
  --namespace 'MyApps.Model' `
  --outdirectory 'c:\src\MyApps\Model' `
  --writesettingsTemplateFile `
  --serviceContextName 'OrgContext'
```

> [!IMPORTANT]
> You need to surround any string parameters with single quotes when using PowerShell.

The result of this command is that the following files are written to the `c:\src\MyApps\Model` folder.

**C:\src\MyApps\Model\\**</br>
|---**Entities\\**</br>
|&nbsp;&nbsp;&nbsp;&nbsp;|--account.cs</br>
|&nbsp;&nbsp;&nbsp;&nbsp;|--contact.cs</br>
|---**OptionSets\\**</br>
|&nbsp;&nbsp;&nbsp;&nbsp;|--addresstypes.cs</br>
|---**Messages\\**</br>
|&nbsp;&nbsp;&nbsp;&nbsp;|--examp_myapi.cs</br>
|---**EntityOptionSetEnum.cs**</br>
|---**builderSettings.json**</br>
|---**OrgContext.cs**</br>

*builderSettings.json* contains the parameters you specified for the command. You can use it to quickly regenerate the files as things change. The following example shows using the generated `buildersettings.json` file from the first command using the [settingsTemplateFile](../modelbuilder.md#--settingstemplatefile--stf):

```powershell
pac modelbuilder build `
  --outdirectory c:\src\MyApps\Model `
  --settingsTemplateFile c:\src\MyApps\Model\builderSettings.json
```

You can also choose to create a `builderSettings.json` file and use that instead of passing all the parameters to the command. The following is an example that is equivalent to the first example above:

```json
{
  "suppressINotifyPattern": false,
  "suppressGeneratedCodeAttribute": false,
  "language": "CS",
  "namespace": "MyApps.Model",
  "serviceContextName": "OrgContext",
  "generateSdkMessages": true,
  "generateGlobalOptionSets": false,
  "emitFieldsClasses": true,
  "entityTypesFolder": "Entities",
  "messagesTypesFolder": "Messages",
  "optionSetsTypesFolder": "OptionSets",
  "entityNamesFilter": [
    "account",
    "contact"
  ],
  "messageNamesFilter": [
    "examp_*"
  ],
  "emitEntityETC": false,
  "emitVirtualAttributes": true
}
```

If you pass parameters to the command while using the [settingsTemplateFile](../modelbuilder.md#--settingstemplatefile--stf) parameter, the parameters passed to the command will override those set in the `builderSettings.json` file.

You can't use the [settingsTemplateFile](../modelbuilder.md#--settingstemplatefile--stf) parameter and the [writesettingsTemplateFile](../modelbuilder.md#--writesettingstemplatefile--wstf) parameter at the same time.