---
title: Change the base currency of a Dataverse environment in Power Platform
description: Learn how to change the base currency of a Dataverse environment in Power Platform.
author: sanjeevgoyal
ms.date: 03/27/2024
ms.reviewer: matp
ms.topic: conceptual
ms.subservice: admin
ms.author: sanjeevgoyal
ms.custom: bap-template
search.audienceType: 
 - admin
---
# Change the base currency of a Dataverse environment in Power Platform

When you create an environment that includes a database in Power Platform, you must specify a currency that is used as the base currency in Dataverse. The base currency is the default currency and is used in currency conversion and reporting. There might be situations where you need to change the base currency for an environment. This article describes how to change it.

1. Make a backup of the environment's database before starting base currency conversion. Learn more: [Back up and restore environments](backup-restore-environments.md)

1. Sign in to the Power Platform admin center, go to **Resources** > **Dynamics 365 apps**. Select **...** next to **Base Currency Conversion**, and then select **Install**.

1. After the Base Currency Conversion solution installation completes, go to Power Apps (make.powerapps.com), select **Apps** on the left navigation pane, and then **Play** the **Base Currency Conversion** app.

   > [!NOTE]
   > If the app doesn't appear in the list, refresh the browser tab.

1. Open the **BaseCurrencyConversion** table, create a new record, and set the **New Base Currency** to the currency you want to use as the base currency. In the example image, the currency specified is Euro. **Save** your changes.

   > [!NOTE]
   > Only one record can be created in this step.

   :::image type="content" source="media/new-base-currency.png" alt-text="Set the New Base Currency column as Euro. ":::
   
1. Go to **Settings > Business Management > Currencies** and complete the following actions:
   1.	Validate that the base currency is changed as expected. There should be a record in the **Currencies** view for your base currency indicating the currency code you want. When you open the record, a notice is displayed: "This currency is the base currency." Close the record.
   2.	Enter the correct exchange rate for all nonbase currencies according to the new base currency. More information: [Manage transactions with multiple currencies](manage-transactions-with-multiple-currencies.md)

## Change the old base currency values to the new base currency

After the base currency is changed as expected and exchange rate values are corrected for all nonbase currencies, use these steps to convert old base currency values on all tables with currency columns to the new base currency.

1. Open the **CurrencyExchangeRate** table and import or create historical exchange rate data for all non-base currencies for the entire date range of data present in the database. This is needed to convert old base currency values to the new base currency.

   To know the date range of data that is present in the database, find the record in the **CurrencyExchangeRate** table. These dates are based on the **Modified On** column of each affected table.

   The default record contains exchange rate data for new base currency for the entire date range of data. For example, if the new base currency is the Euro, you see a record with **From Currency**: **Euro**, **To Currency**: **Euro** where **Valid From** and **Valid To** are UTC values indicating the entire date range of data exists in the Organization.

   :::image type="content" source="media/currencyexchangerate-table.png" alt-text="Currency exchange rate with Euro record" lightbox="media/currencyexchangerate-table.png":::

1. Once you know the date range of data in the environment, create historical exchange rate records for all nonbase currencies for  entire date range of data present in Dataverse.

   Here's a sample record to create exchange rate record for a nonbase currency, such as the US Dollar, for the entire date range of data present in Dataverse.

   :::image type="content" source="media/sample-currency-date-range.png" alt-text="Sample currency date range for data":::

## Import currency data using a CSV file

Data can be imported into **CurrencyExchangeRate** table using a CSV file. The CSV file uses these values: `fromcurrencyid`, `tocurrencyid`, `vaIidfrom`, `vaIidto`, and `exchangerate`

In CSV file format, the `fromcurrencyid` and `tocurrencyid` values must be currency codes. To find these values, in the Power Platform admin center open the environment you want. Select **Settings** > **Resources** >  **All legacy settings** >  **Settings** > **Business Management** > **Currencies**.

### Examples of importing exchange rate data for a nonbase currency through a CSV file

When the exchange rate is the same for the entire historical data date range, create a single record for the entire date range as shown here.

`fromcurrencyid,tocurrencyid,vaIidfrom,vaIidto,exchangerate USD,EUR,2022-01-01 08:00,2023-01-01 08:00,2.0`

When the exchange rate is different for different date ranges, create multiple records for the entire date range as shown here.

```properties
fromcurrencyid,tocurrencyid,vaIidfrom,vaIidto,exchangerate INR,EUR,2022-01-01 08:00,2022-04-01 08:00,72.0
INR,EUR,2022-04-01 08:00,2022-07-01 08:00,75.0
INR,EUR,2022-07-01 08:00,2022-10-01 08:00,78.0
INR,EUR,2022-10-01 08:00,2023-01-01 08:00,80.0
```

The value in the existing transaction currency is translated to the new base currency using these exchange rates. For example, if the transaction currency is *USD* and the new base currency is *EUR*, the USD amount is translated to the EUR amount according to the exchange rate table and the result is stored in the corresponding base currency column.

## Run the conversion job

After exchange rate data is created for all nonbase currencies for the entire date range of data, start converting the old base currency values to the new base currency using exchange rate information provided in the **CurrencyExchangeRate** table.

1. Open the **BaseCurrencyConversion** table record and select the **Start Conversion** command on the command bar.

   :::image type="content" source="media/start-conversion-command.png" alt-text="Start conversion command":::

2. Select **Refresh** on the command bar for the **BaseCurrencyConversion** table record and monitor the **Conversion Status** until **Conversion Status** is **completed** or **failed**.

The conversion job stops once it completes converting old base currency values in all tables listed in the **BaseCurrencyConversionTableLog** table.

### If you encounter issues during conversion

If there were failures during the conversion, examine the **Conversion Status** and fix those errors.

If any tables failed processing, examine the **BaseCurrencyConversionTableLog** table for error details and fix those errors if errors are data related. In case errors aren't data related, report the issue to [Microsoft Support](get-help-support.md).

If during conversion, you notice performance issues, you can pause the conversion by opening the **BaseCurrencyConversion** table form, and then select **Stop Conversion.** Select **Start Conversion** to resume.

> [!NOTE]
> Rollup column jobs (calculate and mass calculate jobs) are automatically stopped and disabled during the base currency conversion to prevent blocking and to speed up the conversion process. After the base currency conversion is completed, rollup jobs are auto enabled and triggered to recalculate rollup values and ensure that rollup values are up to date.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
