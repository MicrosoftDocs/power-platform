<!-- 
This content is re-used in ../../introduction.md 
This is why the heading is H3 (###) instead of H2(##)
-->

### Connect to your tenant

Use the [pac auth create command](../auth.md#pac-auth-create) to connect to your tenant. Running `pac auth create` creates an authentication profile on your machine. You can have multiple authentication profiles available. Having multiple authentication profiles is interesting when you work with multiple tenants. For instance, when your company uses multiple tenants (for development, production, and test) or when you're a consultant that works for multiple customers.

The `pac auth create` command has a couple of helpful parameters:

- The `--environment` parameter enables you to automatically connect to the right environment. If you omit the `--environment` parameter, you're connected to the default environment, but with the `--environment` parameter added to it, you can connect to a different one. You can use the environment ID, url, unique name, or partial name as the value.

- In environments where you don't have the ability to use an interactive experience, adding the `--deviceCode` parameter makes sure you can still connect. For example, in GitHub Codespaces, the `--deviceCode` parameter automatically gets added when you run `pac auth create`.

#### Example

To connect to the `HR-Dev` environment, you can use the following example:

```powershell
pac auth create --environment "HR-Dev"
```

### Switch to another authentication profile

When you have multiple authentication profiles, you can easily switch using the [pac auth list](../auth.md#pac-auth-list) and [pac auth select](../auth.md#pac-auth-select) commands.

The `pac auth list` command lists all authentication profiles on your machine. The `pac auth select` command selects a different command.

#### `pac auth list` Example

To list all authentication profiles, use the following example:

```powershell
pac auth list
```

Running the `pac auth list` command returns all authentication profiles:

```output
Index Active Kind      Name Friendly Name                   Url                                 User                                     Cloud  Type
[1]   *      UNIVERSAL      Personal Productivity (Default) https://x.crm.dynamics.com/         user@contoso.onmicrosoft.com             Public User
```

Select a different authentication profile using the index value.

```powershell
pac auth select --index 2
```