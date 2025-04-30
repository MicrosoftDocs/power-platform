---
title: "Test Model Driven Applications with Test Engine (preview)"
description: "Describes testing a Power Apps Model Driven application"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Test Model Driven Applications with Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Testing your canvas app with [Test Engine](./overview.md) requires the following steps:

1. [Create a Test Plan](#create-a-test-plan)
1. [Set up your user](#set-up-your-user)
1. [Run the test](#run-the-test)
1. [View the results](#view-the-results)

## Create a Test Plan

Test plans are defined when you [author your own test plan](#author-your-own-test-plan).

### Author your own test plan

Create a yaml file using the test plan schema explained in [Power Apps Test Engine YAML format (preview)](yaml.md).

## Set up your user

Test Engine currently has these authentication methods:

| Method | Description |
|--------|-------------|
| Storage State | Store authenticated user state locally in the user profile using Microsoft Windows [Data Protection API](/dotnet/standard/security/how-to-use-data-protection)
| Dataverse | Store authenticated user state inside dataverse using your own customer managed key encrypted with an X.509 certificate using [ASP.NET Core Data Protection](/aspnet/core/security/data-protection/introduction)

You can't store test credentials in test plan files. You must select `storagestate` or `dataverse` as the secure location to store credentials. The test plan file contains references to which environment variables are used for user persona. For example, the following YAML snippet indicates that the `user1Email` environment variables are used:

```yaml
environmentVariables:
  users:
    - personaName: User1
      emailKey: user1Email
```

View [Users](yaml.md#users) for more information.

Use the following PowerShell script to store the username in your environment variables.

```powershell
$env:user1Email = "someone@example.com"
```

## Run the test

Use the PAC CLI [pac test run](../developer/cli/reference/test.md#pac-test-run) command to run your test plan.

- Path to your test plan file
- TenantId (For example `aaaabbbb-0000-cccc-1111-dddd2222eeee`)
- EnvironmentId (For example `00aa00aa-bb11-cc22-dd33-44ee44ee44ee`)
- Url of the page MDA page to test

Invoking this command looks something like the following example:

```powershell
pac test run `
   -p "mda" `
   -i "testplan.te.yaml" `
   -t aaaabbbb-0000-cccc-1111-dddd2222eeee `
   -e 00aa00aa-bb11-cc22-dd33-44ee44ee44ee `
   -d "https://contoso.crm.dynamicss.com/main.aspx?appid=00001111-aaaa-2222-bbbb-3333cccc4444&pagetype=custom&name=dev_home_c8017"
```

## View the results

When the tests complete, you can view the results of your test in the `.trx` file located in the output directory. This folder contains any screenshots or videos captured by your tests when `recordVideo` is set to `true` in the test plan yaml.

[!INCLUDE [footer-banner](../includes/footer-banner.md)]

