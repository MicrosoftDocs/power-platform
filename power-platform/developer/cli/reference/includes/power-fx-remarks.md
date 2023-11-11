## Known issues

The following are known issues when using `pac power-fx` commands.

### All data operations use default environment

Currently, all Dataverse operations are performed using the default Dataverse environment. The Dataverse environment specified by the active authentication profile is not used.

## Troubleshooting

The following are steps to troubleshoot errors you may encounter when using `pac power-fx` commands.

### Error when no Dataverse authentication profile exists

You can get an error like this when you don't have an authentication profile associated with a Dataverse environment.

```powershell
PS C:\test> pac power-fx run --file test-pfx.txt
Error 8-16: Name isn't valid. 'Contacts' isn't recognized.
Error 18-59: The specified column 'firstname' does not exist.
Error 0-60: The function 'Collect' has some invalid arguments.
Error 8-16: Name isn't valid. 'Contacts' isn't recognized.
Error 18-59: The specified column 'firstname' does not exist.
Error 0-60: The function 'Collect' has some invalid arguments.
Error 8-16: Name isn't valid. 'Contacts' isn't recognized.
Error 18-59: The specified column 'firstname' does not exist.
Error 0-60: The function 'Collect' has some invalid arguments.
Error 8-16: Name isn't valid. 'Contacts' isn't recognized.
Error 18-63: The specified column 'firstname' does not exist.
Error 0-64: The function 'Collect' has some invalid arguments.
```

To resolve this, create an authentication profile associated with a Dataverse environment .

1. Run the command [pac auth list](../auth.md#pac-auth-list).

   You may see a result like the following that includes only a `UNIVERSAL` authentication profile
   
   ```
   Index Active Kind      Name Friendly Name Url User                Cloud  Type
   [1]   *      UNIVERSAL                        you@yourcompany.com Public OperatingSystem
   ```
   
   This isn't sufficient because no Dataverse environment is specified.

1. Use [pac auth create](../auth.md#pac-auth-create) to create an authentication profile connected to a Dataverse environment. For example:

   ```powershell
   PS C:\test> pac auth create --url https://yourcompany.crm.dynamics.com --name ConnectionName
   'you@yourcompany.onmicrosoft.com' authenticated successfully.
   Validating connection...
   Default organization: YourOrganization
   Connected to... YourOrganization
   Connected as you@yourcompany.onmicrosoft.com
   Authentication profile created
      * DATAVERSE ConnectionName                 https://yourcompany.crm.dynamics.com/          : you@yourcompany.onmicrosoft.com              Public

   PS C:\test>
   ```
   
1. Run [pac auth list](../auth.md#pac-auth-list) again. You should see a result with `DATAVERSE` connection profile.
   
   ```powershell
   PS C:\test> pac auth list
   Index Active Kind      Name           Friendly Name        Url                                   User                  Cloud  Type
   [1]   *      UNIVERSAL                                                                           you@yourcompany.com   Public OperatingSystem
   [2]   *      DATAVERSE ConnectionName YourOrganization     https://yourcompany.crm.dynamics.com/ you@yourcompany.com Public User
   
   PS C:\test>
   ```

1. Select the DATAVERSE environment to make it the default profile using the [pac auth select](../auth.md#pac-auth-select) command.

```powershell
PS C:\test> pac auth select --index 2
New default profile:
    * DATAVERSE ConnectionName                 https://yourcompany.crm.dynamics.com/          : you@yourcompany.com              Public

PS C:\test>
```
