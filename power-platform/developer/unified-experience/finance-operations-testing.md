---
title: "Unit testing (preview)" 
description: Shows you how to create and run test cases.
author: pvillads
ms.date: 08/28/2023
ms.topic: how-to
ms.subservice: developer
ms.reviewer: pehecke
ms.author: pvillads
---

# Unit testing (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This how-to article shows you how to create and run reliable test cases.

## Prerequisites

You need to have a Power Platform unified developer experience installed and configured on your local machine and a Power Platform developer-focused sandbox environment linked to it. It's important to keep the cloud and local representation of the code the same (synchronized).

More information: [Install and configure development tools (preview)](finance-operations-install-config-tools.md)

## Key concepts

- Use SysTest Framework to author unit/component test code
- Test isolation

## Use SysTest Framework to author unit/component test code

You can create new test cases to test the functionality in an application.

1. Open Visual Studio.
1. On the **File** menu, select **Open** > **Project/Solution**, and then select **FleetManagement** **solution** from the desktop folder. If the solution file isn't on your computer, the steps to create it are listed in [End-to-end scenario for the Fleet Management sample application](/dynamics365/fin-ops-core/dev-itpro/dev-tools/fleet-management-sample).
1. In **Solution Explorer**, right-click the **Fleet Management** solution, select **Add**, and then select **New Project**.
1. Choose **finance and operations** as the project type to create.
1. Name this new project *FleetManagementUnitTestSample*, specify the FleetManagement folder on the desktop (C:\Users\Public\Desktop\FleetManagement) as the location, and then select **OK**. 
1. In **Solution Explorer**, right-click the new project, and then select **Properties**.
1. Set the **Model** property to **FleetManagementUnitTests**, and then select **OK**.
1. Now add a test class containing the tests against the fleet management code. Right-click the FleetManagementUnitTestSample project, select **Add**, and then select **New Item**.
1. In the **Add New Item** window, select **Test Class** as the type of element to add. Name the new class FMUnitTestSample, and then select **Add**.

The template class contains information that should get you started with writing your test. In this example, the test class only consist of two tests, each marked with the SysTestMethod attribute. Since the methods aren't subject to extensibility, they have been adorned with a `Hookable(false)` attribute. In addition, the test class contains a method called `setup()` that is called prior to any tests being run. This method is often useful for setting up state shared across all tests.

```xpp
class FMUnitTestSample extends SysTestCase
{
    public void setup()
    {
        // Reset the test data to be sure things are clean
        FMDataHelper::main(null);
    }

    [SysTestMethod, Hookable(false)]
    public void testFMTotalsEngine()
    {
        FMRental rental;
        FMTotalsEngine fmTotals;
        FMRentalTotal fmRentalTotal;
        FMRentalCharge rentalCharge;
        FMRentalTotal expectedtotal;
        str rentalID = '000022';

        // Find a known rental
        rental = FMRental::find(rentalID);

        // Get the rental charges associated with the rental
        // Data is seeded randomly, so this will change for each run
        select sum(ExtendedAmount) from rentalCharge
                where rentalCharge.RentalId == rental.RentalId;

        fmTotals = FMTotalsEngine::construct();
        fmTotals.calculateRentalVehicleRate(rental);

        // Get the totals from the engine
        fmRentalTotal = fmTotals.totals(rental);

        // Set the expected amount
        expectedTotal = rental.VehicleRateTotal + rentalCharge.ExtendedAmount;

        this.assertEquals(expectedTotal,fmRentalTotal);
    }

    [SysTestMethod, Hookable(false)]
    public void testFMCarValidateField()
    {
        FMCarClass fmCar;

        fmCar.NumberOfDoors = -1;
        this.assertFalse(fmCar.validateField(Fieldnum("FMCarClass", "NumberOfDoors")));

        fmCar.NumberOfDoors = 4;
        this.assertTrue(fmCar.validateField(Fieldnum("FMCarClass", "NumberOfDoors")));
    }
}

```

Continue by following these remaining instructions.

1. Save the test class.
1. Build the project by right-clicking on the FleetManagementUnitTestSample project in **Solution Explorer**, and then select **Build.**

After you have fixed any problems diagnosed by the X++ compiler, you're ready to run your unit tests using the Visual Studio test explorer. In the unified developer experience, the execution takes place in the cloud against the data that resides in the running SQL Server. So you need to deploy the results of your compilation to the cloud by following these steps.

1. Select the **Deploy model for project FleetManagementUnitTests** menu item from the context menu on the project in Solution Explorer. You're prompted to connect to Power Platform if you aren't already connected.
1. The deployment dialog is displayed. Since we haven't added any new tables that need to be synced to the database, we now perform the deployment step. Fill out the dialog and choose **Deploy**.

    :::image type="content" source="../media/unified-experience/devexp-test-deploy.png" alt-text="Deployment dialog.":::

1. On the **Test** menu of Visual Studio, open **Test Explorer**.
1. Select **Run selected test** to execute in the cloud the two test methods of the test case. Note that we do not currently support the debug menu in Test Explorer.

Test Explorer shows the results of each test after it completes. Hopefully, all your tests succeed. If not, you can use Test Explorer to navigate to the offending test code.

## Test isolation

For a test to be of high value it must be reliable. A test must pass or fail consistently independent of other factors such as other tests. One typical cause of unreliable tests is leaking state, such as data left behind in the database that influences downstream tests. Another cause of unreliable tests is relying on tests to be called in a particular order. To prevent this type of issue, you can use the `SysTestTransaction` attribute.

|  TestTransactionMode | Description  |
|---|---|
| AutoRollback | Default. Provides the best isolation.<br><br> All transactions are rolled back using SQL save points, and all database statements are routed to the main connection including user connections. No data is persisted. |
| LegacyRollback | All insert statements are tracked and deleted during clean-up.<br><br> All insert statements are downgraded to row-by-row. One typical use case is when testing user connections or concurrency scenarios. This isolation level cleans up setup data, and the recommendation is to wrap each test method in a ttsBegin and ttsAbort. |
| LegacyRollbackWithUpdateTracking | All update, delete, and insert statements are tracked and reverted during cleanup.<br><br> All insert, update, and delete statements are tracked and downgraded to row-by-row. This mode is the slowest isolation level. |
| None | Only use this mode for debugging. Provides no isolation.<br><br> This setting can be useful to temporarily debug a test as it allows you to use the regular user interface to navigate the data that the test created. |

Example:

```xpp
    [SysTestTransaction(TestTransactionMode::LegacyRollback)]
    class MyTestSample extends SysTestCase
```

## Test module creation to manage test code and FormAdaptors

Creating a test specific module helps to keep test code together and manageable.

1. Open **Visual Studio** and go to **Dynamics 365** > **Model Management** > **Create model**.
1. Enter the model name, select the layer, and then enter any more details. It's a good idea to include the word **Test** in the name of the test module. The default build definition is configured to discover all test modules that contain the word **Test**.
1. Because this model holds forms from the Application Platform/Foundation, add references to models selected (checked) in the following figure.

    :::image type="content" source="../media/unified-experience/devexp-test-create_model.png" alt-text="Create model dialog.":::

### See also

[Write, deploy, and debug X++ code (preview)](finance-operations-debug.md)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
