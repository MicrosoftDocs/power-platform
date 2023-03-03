### Examples

The following examples show the use of the `pac auth create` command.

- [Basic Create](#basic-create)
- [Named Create](#named-create)
- [Named Create with Service Principal](#named-create-with-service-principal)

#### Basic Create

This example authenticates with the `https://myorg.crm.dynamics.com` org.

```powershell
pac auth create --url https://myorg.crm.dynamics.com
```

#### Named Create

This example authenticates with the `https://myorg.crm.dynamics.com` org and gives it the name `MyOrg`.

```powershell
pac auth create --url https://myorg.crm.dynamics.com --name MyOrg
```

#### Named Create with Service Principal

This example authenticates with the `https://myorg.crm.dynamics.com` org, gives it the name `MyOrg-SPN` and uses a service principal to do so. Don't forget to add the service principal to your environment.

```powershell
pac auth create --url https://myorg.crm.dynamics.com --name MyOrg-SPN --applicationId 00000000-0000-0000-0000-000000000000 --clientSecret $clientSecret --tenant 00000000-0000-0000-0000-000000000000
```
