### Examples

The following examples show the use of the `pac admin list` command.

- [List all environments in the tenant](#list-all-environments-in-the-tenant)
- [List all sandbox environments in the tenant](#list-all-sandbox-environments-in-the-tenant)

#### List all environments in the tenant

This example will list all environments in the tenant.

```powershell
pac admin list
```

An example of the output is displayed below.

```powershell
Environment   Environment Id                        Environment Url                        Type        Organization Id
Contoso       00000000-0000-0000-0000-000000000000  https://contoso.crm.dynamics.com/      Production  00000000-0000-0000-0000-000000000000
Contoso Dev   00000000-0000-0000-0000-000000000000  https://contoso-dev.crm.dynamics.com/  Sandbox     00000000-0000-0000-0000-000000000000
Contoso Test  00000000-0000-0000-0000-000000000000  https://commdemos.crm.dynamics.com/    Sandbox     00000000-0000-0000-0000-000000000000
```

#### List all sandbox environments in the tenant

This example will list all environments in the tenant of the type `Sandbox`.

```powershell
pac admin list --type Sandbox
```

An example of the output is displayed below.

```powershell
Environment  Environment Id                        Environment Url                        Type        Organization Id
Contoso Dev  00000000-0000-0000-0000-000000000000  https://contoso-dev.crm.dynamics.com/  Sandbox     00000000-0000-0000-0000-000000000000
Contoso Test 00000000-0000-0000-0000-000000000000  https://commdemos.crm.dynamics.com/    Sandbox     00000000-0000-0000-0000-000000000000
```
