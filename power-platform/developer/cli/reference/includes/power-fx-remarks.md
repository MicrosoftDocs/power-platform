## Troubleshooting

The following are steps to troubleshoot errors you might encounter when using `pac power-fx` commands.

### Error when no Dataverse authentication profile exists

You can get an error like this when you don't have a universal authentication profile associated with a Dataverse environment.

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

To resolve errors like these, create a universal authentication profile associated with a Dataverse environment.

1. Run the command [pac auth list](../auth.md#pac-auth-list).

   You might see a result like the following that includes a `UNIVERSAL` authentication profile with no Url indicating it's associated with a Dataverse environment.
   
   ```powershell
   Index Active Kind      Name Friendly Name Url User                Cloud  Type
   [1]   *      UNIVERSAL                        you@yourcompany.com Public OperatingSystem
   ```
   
   This isn't sufficient because no Dataverse environment is specified.

1. Use [pac auth create](../auth.md#pac-auth-create) to create a `UNIVERSAL` authentication profile connected to a Dataverse environment. 

   > [!NOTE]
   > Use the `--environment` parameter using the environmentid value. [Find your environment ID](/power-apps/developer/data-platform/view-download-developer-resources#unique-identifiers). 
   >
   > Don't use the `--url` parameter because this will create a `DATAVERSE` profile rather than a `UNIVERSAL` profile.

   For example:

   ```powershell
   PS C:\test> pac auth create --environment f2cef599-b112-4803-bb5d-090077017685 --name ConnectionName
   'you@yourcompany.onmicrosoft.com' authenticated successfully.
   Validating connection...
   Default organization: YourOrganization
   Connected to... YourOrganization
   Connected as you@yourcompany.onmicrosoft.com
   Authentication profile created
      * UNIVERSAL ConnectionName                 https://yourcompany.crm.dynamics.com/          : you@yourcompany.onmicrosoft.com              Public

   PS C:\test>
   ```
   
1. Run [pac auth list](../auth.md#pac-auth-list) again. You should see a result with `UNIVERSAL` connection profile with a URL for your Dataverse environment.
   
   ```powershell
   PS C:\test> pac auth list
   Index Active Kind      Name           Friendly Name        Url                                   User                  Cloud  Type
   [1]   *      UNIVERSAL                                                                           you@yourcompany.com   Public OperatingSystem
   [2]   *      UNIVERSAL ConnectionName YourOrganization     https://yourcompany.crm.dynamics.com/ you@yourcompany.com   Public User
   
   PS C:\test>
   ```

1. Select the `UNIVERSAL` environment to make it the default profile using the [pac auth select](../auth.md#pac-auth-select) command.

   ```powershell
   PS C:\test> pac auth select --index 2
   New default profile:
      * UNIVERSAL ConnectionName                 https://yourcompany.crm.dynamics.com/          : you@yourcompany.com              Public

   PS C:\test>
   ```
