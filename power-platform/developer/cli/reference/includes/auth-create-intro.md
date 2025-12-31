### Examples

The following examples show the use of the `pac auth create` command.

- [Basic Create](#basic-create)
- [Environment Create](#environment-create)
- [Named Create](#named-create)
- [Named Create with Service Principal](#named-create-with-service-principal)
- [Azure Identity](#azure-identity)

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
> Open [Power Platform admin center](https://admin.powerplatform.microsoft.com) and select the **Environment** you want to connect to.
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

#### Azure Identity

When running in an environment that supports Azure Identity (like Azure Cloud Shell, Azure VM with Managed Identity, or Visual Studio Code with Azure Account extension), you can use the `--managedIdentity` flag to authenticate using the Azure Identity. PAC CLI will use the [Default Azure Credential](/dotnet/azure/sdk/authentication/credential-chains?tabs=dac#defaultazurecredential-overview) which is an opinionated, preconfigured chain of credentials. It's designed to support many environments, along with the most common authentication flows and developer tools. You can customize the behavior by setting environment variables as described in the [Default Azure Credential documentation](/dotnet/azure/sdk/authentication/credential-chains?tabs=dac#use-a-specific-credential). For example, to authenticate using a user-assigned managed identity, set the `AZURE_CLIENT_ID` environment variable to the client ID of the user-assigned managed identity. See more details in the [Set the app environment variables](/dotnet/azure/sdk/authentication/on-premises-apps?tabs=azure-portal%2Cwindows%2Ccommand-line#set-the-app-environment-variables).
