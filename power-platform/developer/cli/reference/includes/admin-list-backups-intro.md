### Examples

The following examples show the use of the `pac admin list-backups` command.

- [List backups from an environment by ID](#list-backups-from-an-environment-by-id)
- [List backups from an environment by URL](#list-backups-from-an-environment-by-url)

#### List backups from an environment by ID

This example lists the backups of an environment based on the environment ID.

```powershell
pac admin list-backups --environment 00000000-0000-0000-0000-000000000000
```

An example of the output is displayed below.

```powershell
 Index   Id                                      Label        Expiry                Point Date
 1       00000000-0000-0000-0000-000000000000    Backup       14/12/2022 12:50:38   07/12/2022 12:50:38
```

#### List backups from an environment by URL

This example lists the backups of an environment based on the environment URL.

```powershell
pac admin list-backups --environment https://contoso.crm.dynamics.com
```
