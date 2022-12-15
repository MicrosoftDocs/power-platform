### Examples

The following examples show the use of the `pac admin create` command.

- [Simple creation of an environment](#simple-creation-of-an-environment)
- [Advanced creation of an environment](#advanced-creation-of-an-environment)

#### Simple creation of an environment

In this example, we'll create a sandbox environment with the default settings:

- Currency: USD
- Language: English
- Region: unitedstates

We don't have to add those properties, because those values are the default values.

```powershell
pac admin create `
  --name "Contoso Test" `
  --type Sandbox `
  --domain ContosoTest
```

#### Advanced creation of an environment

In this example, we'll create a production environment in the region europe, with the currency set to Euro and the language to English.

We don't have to add the language property, because it's the default value.

```powershell
pac admin create `
  --name "Contoso Marketing" `
  --currency EUR `
  --region europe `
  --type Production `
  --domain ContosoMarketing
```
