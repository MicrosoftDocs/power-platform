---
title: "Test model-driven applications with Test Engine (preview)"
description: "Explains how to test a Power Apps Model Driven application using Test Engine."
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/16/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Test model-driven applications with Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Testing your model-driven application with [Test Engine](./overview.md) requires the following steps:

1. [Create a test plan](#create-a-test-plan)
1. [Set up your user](#set-up-your-user)
1. [Run the test](#run-the-test)
1. [View the results](#view-the-results)

## Create a test plan

Create a yaml file using the test plan schema explained in [Power Apps Test Engine YAML format (preview)](yaml.md).

> [!TIP]
> Review [available sample](samples.md#available-samples) plans in the GitHub repository.

## Set up your user

Test Engine currently has these authentication methods:

| Method | Description |
|--------|-------------|
| [Storage State](authentication.md#storagestate-authentication-quick-start) | Store authenticated user state locally in the user profile using Microsoft Windows [Data Protection API](/dotnet/standard/security/how-to-use-data-protection)
| [Dataverse](authentication.md#dataverse-authentication-team-ready) | Store authenticated user state inside Dataverse using your own customer managed key encrypted with an X.509 certificate using [ASP.NET Core Data Protection](/aspnet/core/security/data-protection/introduction)

You can't store test credentials in test plan files. You must select `Storagestate` or `Dataverse` as the secure location to store credentials. The test plan file contains references to which environment variables are used for user persona. For example, the following YAML snippet indicates that the `user1Email` environment variables are used:

```yaml
environmentVariables:
  users:
    - personaName: User1
      emailKey: user1Email
```

View [Users](yaml.md#users) for more information.

Use the following PowerShell script to store the username in your [environment variables](/powershell/module/microsoft.powershell.core/about/about_environment_variables#use-the-variable-syntax).


```powershell
$env:user1Email = "someone@example.com"
```

## Run the test

Use the PAC CLI [pac test run](../developer/cli/reference/test.md#pac-test-run) command to run your test plan.

### Required Parameters

You need to provide the following information:

- `--test-plan-file`: Path to your test plan file
- `--tenant`: Your tenant ID
- `--environment-id`: Your environment ID
- `--domain`: Domain URL of the model-driven app page to test

### URL Formats for Model-Driven Apps

For model-driven apps, the `--domain` parameter varies based on the type of page you're testing. The URL format should specify the correct `pagetype` based on your testing scenario:

```powershell
# For custom pages
pac test run `
   --provider mda `
   --test-plan-file your-testplan.te.yaml `
   --tenant your-tenantid-guid-value `
   --environment-id your-environmentid-guid-value `
   --domain "https://contoso.crm.dynamics.com/main.aspx?appid=00001111-aaaa-2222-bbbb-3333cccc4444&pagetype=custom&name=dev_home_c8017"

# For entity lists (views)
pac test run `
   --provider mda `
   --test-plan-file your-testplan.te.yaml `
   --tenant your-tenantid-guid-value `
   --environment-id your-environmentid-guid-value `
   --domain "https://contoso.crm.dynamics.com/main.aspx?appid=00001111-aaaa-2222-bbbb-3333cccc4444&pagetype=entitylist&etn=account&viewid=5a84c584-df1c-ed11-9db0-000d3a991110"

# For entity records (forms)
pac test run `
   --provider mda `
   --test-plan-file your-testplan.te.yaml `
   --tenant your-tenantid-guid-value `
   --environment-id your-environmentid-guid-value `
   --domain "https://contoso.crm.dynamics.com/main.aspx?appid=00001111-aaaa-2222-bbbb-3333cccc4444&pagetype=entityrecord&etn=account&id=72e0e163-df1c-ed11-9db0-000d3a991110"
```
<!-- The following section is duplicated in two other articles -->
### Dataverse Integration

To enable Dataverse integration with your model-driven app tests, add the `enableDataverseFunctions` parameter in your test settings:

```yaml
testSettings:
  extensionModules:
    enable: true
    parameters:
      enableDataverseFunctions: true
```

When you enable Dataverse integration, you're required to open Azure CLI with a user or service principal that has rights to the Dataverse environment. You can use the command: [az login](/cli/azure/reference-index#az-login)  More information: [Sign in with Azure CLI](/cli/azure/authenticate-azure-cli).

The Dataverse API URL used for integration is obtained either from the host domain name of the [pac test run](../developer/cli/reference/test.md#pac-test-run) `--domain` parameter or by defining an [PowerShell environment variable](/powershell/module/microsoft.powershell.core/about/about_environment_variables) named `DATAVERSE_URL`.

## View the results

When the tests complete, you can view the results of your test in the `.trx` file located in the output directory. This folder contains any screenshots or videos captured by your tests when `recordVideo` is set to `true` in the test plan yaml.

[!INCLUDE [footer-banner](../includes/footer-banner.md)]

