---
title: "Dataverse and Connector Simulation with Test Engine (preview)"
description: "Discusses the ability to simulate interaction with Dataverse and Connectors using Power Fx functions"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: article
---

# Dataverse and connector simulation with Test Engine (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

The ability to simulate interaction with Dataverse and Power Platform connectors can play an important role in testing your low code apps by allowing you to define test scenarios without the need for actual data.

This approach helps in identifying potential issues and ensuring that the solution works as expected under various conditions without the risk of affecting real data.

## Benefits of simulating calls

By making use of functions like [Preview.SimulateDataverse](./powerfx-functions.md#previewsimulatedataverse) and [Preview.SimulateConnector](./powerfx-functions.md#previewsimulateconnector) you can:

- **Test different scenarios**: Address how the application responds with various scenarios, including edge cases and exceptions, without affecting real data.
- **Happy path tests**: Perform simulations allow for testing the "happy path" where everything works as expected.
- **Testing edge cases and exceptions**: Build tests that validate test edge cases and expected exceptions that ensure your applications handle them gracefully.

## Power Fx functions

The `Preview.SimulateDataverse` and `Preview.SimulateConnector` functions provide important functionality to test the behavior of a Power App independent of dependencies on the current data stored in Dataverse or actions performed using connectors. By applying these functions, you can test different test case scenarios and avoid hanging the state of the application you're testing.

### Simulating a Dataverse query

The most common simulation scenario is to allow the test to define what data should be used when the application wants to query data from Dataverse. In this case, you can make use of the [Preview.SimulateDataverse](powerfx-functions.md#previewsimulatedataverse) function. For example

```powerappsfl
Preview.SimulateDataverse({
    Action: "Query",
    Entity: "Account",
    When: Table({Status: "Active", CreatedOn: "> 2023-01-01"}),
    Then: Table({Name: "Test", Owner: "John Doe"}) // Return Value
});
```

This function will simulate a Dataverse that queries the [Account table](/power-apps/developer/data-platform/reference/entities/account) when the `Status` is **Active** and the `CreatedOn` value is after January 1, 2023. Using this kind of simulation can help in testing how the application responds when different results are returned.

### Simulating a connector call

Another common scenario is the ability to define the data that should be returned from a request to a Power Platform Connector. In this case, you can make use of the  [Preview.SimulateConnector](./powerfx-functions.md#previewsimulateconnector) function. For example

```powerappsfl
Preview.SimulateConnector({
    Name: "Office365Groups",
    When: {Action: "ListOwnedGroupsV2"},
    Then: Table({Name: "Test"})
});
```

This function simulates a connector call to the `Office365Groups` connector when the action is `ListOwnedGroupsV2`. It helps in testing how the application handles connector calls and ensures that the connector returns the expected test data.



[!INCLUDE [footer-banner](../includes/footer-banner.md)]
