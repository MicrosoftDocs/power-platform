---
title: "Test Dataverse with test engine"
description: "Describes how Test Engine can be used to perform integration testing of Dataverse"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Testing Dataverse

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

In this article, we discuss the ability to create integration tests with Dataverse. This functionality applies the Power Fx capability to connect with Dataverse Entities. We cover the following points:

- Connecting to Dataverse
- **onTestCaseStart**: Resetting the current state.
- **ForAll** and **Remove** functions.
- Connecting to a Model Driven Application or specifying `$env:DATAVERSE_URL`.
- Using Azure CLI to sign in.
- Functions of interest: `ForAll()`, `Remove()`, `CountRows()`, `Collect()`, `First()`.

## Connecting to Dataverse

To you require a connection to Dataverse as part of your test, review provider [Dataverse integration](./providers.md#provider-dataverse-integration) for the required configuration and authentication.

## Resetting the Current State

The `onTestCaseStart` can be defined in your authored test yaml to perform common actions before each test case. For example:

```yaml
testSuite:
  testSuiteName: Dataverse tests
  testSuiteDescription: Validate Power Fx can be used to run Dataverse integration tests
  persona: User1
  appLogicalName: N/A
  onTestCaseStart: |
    = ForAll(Accounts, Remove(Accounts, ThisRecord))
```

In this example, the `ForAll()` is used to iterate over a table and perform an action on each record. The `Remove()` function is then used to delete each record from a table to ensure an empty table before each test is executed.

## Functions of Interest

Here are some functions that are useful when working with Dataverse:

- [Collect()](../power-fx/reference/function-clear-collect-clearcollect.md#collect): Adds records to a table.
- [CountRows()](../power-fx/reference/function-table-counts.md): Returns the number of records in a table.
- [First()](../power-fx/reference/function-first-last.md): Returns the first record in a table.
- [ForAll()](../power-fx/reference/function-forall.md): Iterates over a table and performs an action on each record.
- [Patch()](../power-fx/reference/function-patch.md): Update an existing record.
- [Remove()](../power-fx/reference/function-remove-removeif.md): Deletes a specific record from a table.

## Considerations

As you create, you test steps with Power Fx Dataverse take into account: 

1. `Defaults()` isn't supported. As a result Power Fx examples like `Patch(Accounts, Defaults(Accounts), {name:"test"})` aren't supported. 
1. You can use `Collect()` to an alternative to Patch() with the Defaults() function

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
