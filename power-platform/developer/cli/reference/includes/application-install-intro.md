### Examples

The following examples show the use of the `pac application install` command.

- [Install an application in a specified environment](#install-an-application-in-a-specified-environment)
- [Install a list of applications in a JSON file in a specified environment](#install-a-list-of-applications-in-a-json-file-in-a-specified-environment)

#### Install an application in a specified environment

This example installs the `MSFT_EmployeeIdeas` application in the specified environment.

```powershell
pac application install --environment-id 00000000-0000-0000-0000-000000000000 --application-name MSFT_EmployeeIdeas
```

#### Install a list of applications in a JSON file in a specified environment

This example installs the applications in the JSON file `c:\home\applicationslist.json` in the specified environment.

```powershell
pac application install --environment-id 00000000-0000-0000-0000-000000000000 --application-list c:\home\applicationslist.json
```
