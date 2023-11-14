### Examples

The following examples show the use of the `pac auth create` command.

- [Basic Create](#basic-create)
- [Environment Create](#environment-create)
- [Named Create](#named-create)
- [Named Create with Service Principal](#named-create-with-service-principal)

#### Basic Create

This example will prompt you for credentials and connects to the tenant the credentials belong to.

```powershell
pac auth create
```

> [!NOTE]
> When running Power Platform CLI in Codespaces this will trigger a device code login.

#### Environment Create

This example will prompt you for credentials and connects to the Power Platform environment with environment id you specify.

```powershell
pac auth create --environment < Your environment ID >
```

> [!TIP]
> To find an environment id:
> 1. Open [Power Platform admin center](https://admin.powerplatform.microsoft.com) and select an the **Environment** you want to connect to. 
> In the **Details** section, look for **Environment ID**

#### Named Create

This example authenticates with your tenant and gives it the name `MyOrg`.

```powershell
pac auth create --name MyOrg
```

#### Named Create with Service Principal

This example authenticates with your tenant, gives it the name `MyOrg-SPN` and uses a service principal to do so. Don't forget to add the service principal to your environment.

```powershell
pac auth create --name MyOrg-SPN --applicationId 00000000-0000-0000-0000-000000000000 --clientSecret $clientSecret --tenant 00000000-0000-0000-0000-000000000000
```
