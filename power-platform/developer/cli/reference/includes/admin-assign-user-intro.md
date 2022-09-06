### Examples

#### Assign a user by email to an environment with the basic user role

```powershell
pac admin assign-user --environment 00000000-0000-0000-0000-000000000000 --user "user@company.com" --role "Basic User"
```

#### Assign a user by guid to an environment with the system administrator role

```powershell
pac admin assign-user --environment 00000000-0000-0000-0000-000000000000 --user 00000000-0000-0000-0000-000000000000 --role "System Administrator"
```
