### Examples

The following examples show the use of the `pac admin assign-user` command.

- [Assign a user by email to an environment with the basic user role](#assign-a-user-by-email-to-an-environment-with-the-basic-user-role)
- [Assign a user by guid to an environment with the system administrator role and add the user to a specified business unit](#assign-a-user-by-guid-to-an-environment-with-the-system-administrator-role-and-add-the-user-to-a-specified-business-unit)
- [Assign an application user to an environment with the system administrator role](#assign-an-application-user-to-an-environment-with-the-system-administrator-role)

#### Assign a user by email to an environment with the basic user role

```powershell
pac admin assign-user `
  --environment 00000000-0000-0000-0000-000000000000 `
  --user "user@company.com" `
  --role "Basic User"
```

#### Assign a user by guid to an environment with the system administrator role and add the user to a specified business unit

```powershell
pac admin assign-user `
  --environment 00000000-0000-0000-0000-000000000000 `
  --user 00000000-0000-0000-0000-000000000000 `
  --business-unit` 00000000-0000-0000-0000-000000000000 `
  --role "System Administrator"
```

#### Assign an application user to an environment with the system administrator role

```powershell
pac admin assign-user `
  --environment 00000000-0000-0000-0000-000000000000 `
  --user 00000000-0000-0000-0000-000000000000 `
  --role "System Administrator"
  --application-user
```
