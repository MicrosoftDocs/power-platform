### Examples

The following examples show the use of the pac auth update command.

- [Update auth profile with environment URL](#update-auth-profile-with-environment-url)
- [Update auth profile with environment ID](#update-auth-profile-with-environment-id)

#### Update auth profile with environment URL

This example shows how to update the auth profile with index 1 with the name `Contoso Dev` and the environment URL `https://contosodev.crm.dynamics.com`.

```powershell
pac auth update --index 1 --name "Contoso Dev" --environment "https://contosodev.crm.dynamics.com"
```

#### Update auth profile with environment ID

This example shows how to update the auth profile with index 1 with the environment ID `00000000-0000-0000-0000-000000000000`.

```powershell
pac auth update --index 1 --environment 00000000-0000-0000-0000-000000000000
```
