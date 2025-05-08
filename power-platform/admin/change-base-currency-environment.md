---
title: Change the base currency of a Dataverse environment in Power Platform
description: Learn how to change the base currency of a Dataverse environment in Microsoft Power Platform.
author: sanjeevgoyal
ms.date: 06/18/2024
ms.reviewer: matp
ms.topic: how-to
ms.subservice: admin
ms.author: sanjeevgoyal
ms.custom: bap-template
search.audienceType: 
 - admin
---
# Change the base currency of a Dataverse environment in Power Platform

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

When you create an environment that includes a database in Microsoft Power Platform, you must specify the currency that is used as the base currency in Dataverse. The base currency is the default currency. It's used in currency conversion and reporting.

In some situations, you might have to change the base currency of an environment. This article explains how to change it.

1. Before you begin base currency conversion, make a backup of the environment's database. Learn more: [Back up and restore environments](backup-restore-environments.md)
1. Open [AppSource](https://appsource.microsoft.com/), enter *base currency* in the search field, and then select **Get it now** next to **Base Currency Conversion**. Follow the on-screen instructions to install the app in the Power Platform environment that you want.
1. After the Base Currency Conversion solution is installed, open [Power Apps](https://make.powerapps.com/), select **Apps** on the left navigation pane, and then select **Play** for the **Base Currency Conversion** app.

    > [!NOTE]
    > If the app doesn't appear in the list, refresh the browser tab.

1. Open the **BaseCurrencyConversion** table, and create a new record. Set the **New Base Currency** field to the currency that you want to use as the new base currency, and then save your changes. For example, in the following image, *Euro* is specified as the new base currency.

    > [!NOTE]
    > You can create only one record in this step.

    :::image type="content" source="media/new-base-currency.png" alt-text="Screenshot of a new BaseCurrencyConversion record where the New Base Currency field is set to Euro. ":::

1. Go to **Settings** > **Business Management** > **Currencies**, and follow these steps:

    1. Validate that the base currency was changed as you expected. In the **Currencies** view, there should be a record for your base currency, and it should indicate the currency code that you want. When you open the record, the following notification is shown: "This currency is the base currency." Close the record.
    1. Enter the correct exchange rate for all non-base currencies according to the new base currency. Learn more: [Manage transactions with multiple currencies](manage-transactions-with-multiple-currencies.md)

## Change the old base currency values to the new base currency

After the base currency is changed as you expected, and exchange rate values are corrected for all non-base currencies, follow these steps to convert old base currency values in all tables that have currency columns to the new base currency.

1. Open the **CurrencyExchangeRate** table, and import or create historical exchange rate data for all non-base currencies for the whole date range of data that is present in the database. This step is needed to convert old base currency values to the new base currency.

    To learn the date range of data that is present in the database, find the record in the **CurrencyExchangeRate** table. The dates are based on the **Modified On** column of each affected table.

    The default record contains exchange rate data for the new base currency for the whole date range of data. For example, in the following image, *Euro* is the new base currency. The table includes a record where the **From Currency Id** field is set to **Euro**, the **To Currency Id** field is set to **Euro**, and the **Valid From** and **Valid To** fields are set to dates in UTC format that indicate the whole date range of data that exists in the organization.

    :::image type="content" source="media/currencyexchangerate-table.png" alt-text="Screenshot that shows a currency exchange rate record where Euro is the new base currency." lightbox="media/currencyexchangerate-table.png":::

1. When you know the date range of data in the environment, create historical exchange rate records for all non-base currencies for the whole date range of data that is present in Dataverse.

    The following image shows an example of an exchange rate record that is created for a non-base currency for the whole date range of data that is present in Dataverse. In this example, *US Dollar* is the non-base currency.

    :::image type="content" source="media/sample-currency-date-range.png" alt-text="Screenshot that shows a currency exchange rate record for a non-base currency." lightbox="media/sample-currency-date-range.png":::

## Import currency data using a CSV file

You can import data into the **CurrencyExchangeRate** table by using a comma-separated values (CSV) file. The CSV file uses the following values: `fromcurrencyid`, `tocurrencyid`, `vaIidfrom`, `vaIidto`, and `exchangerate`.

In the CSV file, the `fromcurrencyid` and `tocurrencyid` values must be currency codes. To find these values, follow these steps.

1. Open the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), and open the environment that you want.
1. Select **Settings** > **Resources** > **All legacy settings** > **Settings** > **Business Management** > **Currencies**.

### Examples: Importing exchange rate data for a non-base currency through a CSV file

If the exchange rate is the same for the whole date range of historical data, create a single record for the whole date range, as shown here.

`fromcurrencyid,tocurrencyid,vaIidfrom,vaIidto,exchangerate USD,EUR,2022-01-01 08:00,2023-01-01 08:00,2.0`

If the exchange rate differs for different date ranges, create multiple records for the whole date range, as shown here.

```properties
fromcurrencyid,tocurrencyid,vaIidfrom,vaIidto,exchangerate INR,EUR,2022-01-01 08:00,2022-04-01 08:00,72.0
INR,EUR,2022-04-01 08:00,2022-07-01 08:00,75.0
INR,EUR,2022-07-01 08:00,2022-10-01 08:00,78.0
INR,EUR,2022-10-01 08:00,2023-01-01 08:00,80.0
```

These exchange rates are used to translate the value in the existing transaction currency to the new base currency. For example, if the transaction currency is *USD*, and the new base currency is *EUR*, the USD amount is translated to the EUR amount according to the exchange rate table. The result is then stored in the corresponding base currency column.

## Run the conversion job

After exchange rate data is created for all non-base currencies for the whole date range of data, start to convert the old base currency values to the new base currency by using exchange rate information that is provided in the **CurrencyExchangeRate** table.

1. Open the **BaseCurrencyConversion** table record, and select **Start Conversion** on the command bar.

    :::image type="content" source="media/start-conversion-command.png" alt-text="Screenshot that shows the Start Conversion command.":::

1. Select **Refresh** on the command bar, and monitor the **Conversion Status** field until the value is *completed* or *failed*.

The conversion job stops when it finishes converting old base currency values in all tables that are listed in the **BaseCurrencyConversionTableLog** table.

### If you encounter issues during conversion

If failures occur during the conversion, examine the **Conversion Status** value, and fix the errors.

If processing fails for any tables, examine the **BaseCurrencyConversionTableLog** table for error details, and fix the errors if they are data related. If the errors aren't data related, report the issue to [Microsoft Support](get-help-support.md).

If you notice performance issues during conversion, you can pause the conversion by opening the page for the **BaseCurrencyConversion** table and selecting **Stop Conversion** on the command bar. To resume the conversion, select **Start Conversion**.

> [!NOTE]
> Rollup column jobs (that is, calculate and mass calculate jobs) are automatically stopped and disabled during base currency conversion. This behavior prevents blocking and speeds up the conversion process. After base currency conversion is completed, rollup jobs are automatically enabled and triggered to recalculate rollup values and ensure that they are up to date.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
