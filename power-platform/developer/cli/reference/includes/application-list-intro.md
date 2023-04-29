### Examples

The following examples show the use of the `pac application list` command.

- [Application List](#application-list)
- [Application List JSON Export](#application-list-json-export)

#### Application List

This example lists all available applications in the specified environment.

```powershell
pac application list --environment-id 00000000-0000-0000-0000-000000000000
```

#### Application List JSON Export

This example lists all available applications for the tenant you're connected to and saves it as a JSON file in the directory `c:\home`.

```powershell
pac application list --output c:\home\applicationslist.json
```
