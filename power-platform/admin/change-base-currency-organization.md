---
title: Change the base currency of an organization
description: Learn how to change the base currency of an organization.
author: sanjeevgoyal
ms.date: 03/27/2024
ms.reviewer: sericks
ms.topic: conceptual
ms.subservice: admin
ms.author: sanjeevgoyal
ms.custom: bap-template
search.audienceType: 
 - admin
---

# Change the base currency of an organization

Intro

## Steps to Perform Base Currency Conversion

1. Make a backup of the organization's database before starting base currency conversion. learn more: [Back up and restore environments](backup-restore-environments.md)

1. Connect to a UCI client.
  
1. Navigate to **Settings > Solutions** and install **Base Currency Conversion Solution**.

1. Navigate to the **Home** or **Apps** page and ppen the **Base Currency Conversion App** from the list of available apps.

   > [!Note]
   > If the app doesn't appear in the list, refresh or reload the page.

1. Open the **BaseCurrencyConversion** entity, create a new record, and set the **New Base Currency** to a required currency. In the example image, te required currecny is the Euro. Then save your changes.

   > [!Note]
   > Only one record can be created in this step.

   :::image type="content" source="media/new-base-currency.png" alt-text="Set the New Base Currency field. ":::
   
1. Navigate to **Settings > Business Management > Currencies** and complete the following actions:
   1.	Validate that the base currency is changed as expected.
   2.	Enter the correct exchange rate for all non-base currencies according to the new base currency.
   3.	After the base currency is changed as expected and exchange rate values are corrected for all non-base currencies, use the following steps (from step 7) to convert old base currency values on all tables with currency fields to the new base currency.

1. Open the **CurrencyExchangeRate** entity and import or create historical exchange rate data for all non-base currencies for the entire date range of data present in the database. This is needed to convert old base currency values to the new base currency.

   To know the date range of data that is present in the database, refer the record on the **CurrencyExchangeRate** entity. These dates are based on the **Modified On** column of each affected table.

   The default record contains exchange rate data for new base currency for the entire date range of data. For example, if the new base currency is the Euro, you see a record with **From Currency**: Euro, To Currency: Euro) where Valid From and Valid To are UTC values indicating the entire date range of data exists in the Organization.

![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/123401931/50829f76-2fd5-44ca-b98a-743424d5764d)

Once you know the date range of data in the Organization, create historical exchange rate records for all non-base currencies for entire date range of data present in the database.

Below is a sample record to create exchange rate record for non-base currency (ex: US Dollar) for entire date
range of data present in the database.

![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/123401931/bd4837b9-dd3a-4fe3-be3b-485b8abaa5e5)

Note: Data can be imported into **CurrencyExchangeRate** entity using a csv file. Refer below csv file format for sample input.

fromcurrencyid,tocurrencyid,vaIidfrom,vaIidto,exchangerate

In csv file format, **fromcurrencyid** and **tocurrencyid** values must be Currency Codes, which you can get from Settings > Business Management > Currencies page.

Samples to create exchange rate data for a non-base currency through csv file:

**Scenario1**: When exchange rate is same for entire historical data date range, create a single record for entire date range as shown below.

fromcurrencyid,tocurrencyid,vaIidfrom,vaIidto,exchangerate USD,EUR,2022-01-01 08:00,2023-01-01 08:00,2.0

**Scenario2**: **When exchange rate is different for different date ranges**, create multiple records for entire date range as shown below.

fromcurrencyid,tocurrencyid,vaIidfrom,vaIidto,exchangerate INR,EUR,2022-01-01 08:00,2022-04-01 08:00,72.0
INR,EUR,2022-04-01 08:00,2022-07-01 08:00,75.0
INR,EUR,2022-07-01 08:00,2022-10-01 08:00,78.0
INR,EUR,2022-10-01 08:00,2023-01-01 08:00,80.0

The value in the existing transaction currency is translated to the new base currency using these exchange rates. For example, if the transaction currency is ‘USD’ and the new base currency is ‘EUR’, the USD amount will be translated to the EUR amount according to the exchange rate table and the result will be stored in the corresponding base currency column.

7. After exchange rate data is created for all non-base currencies for entire date range of data, Open **BaseCurrencyConversion** entity record and Start Conversion Job(using option shown below) to start converting old base currency values to new base currency using exchange rate information provided in **CurrencyExchangeRate** entity.

   ![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/123401931/2ce1acee-bf9b-4625-a376-70b6838ce830)

8. Refresh the **BaseCurrencyConversion** entity record and monitor the Conversion Status until Conversion Status is completed/failed.
   1. In case of any failures, examine the Conversion Status and fix those errors.
   2.	In case of any tables failed processing, examine the **BaseCurrencyConversionTableLog** entity for error details and fix those errors if errors are data related. In case errors are not data related report the issue to Microsoft Support.

![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/123401931/b515896f-5422-4618-b3e8-d7868f7963f2)

9. (Optional) During conversion, if you notice any performance issues, you can pause the conversion by opening the **BaseCurrencyConversion** form and Stop Conversion Job (using option shown below). FYI... Conversion will be automatically stopped once it completes converting old base currency values in all tables listed in **BaseCurrencyConversionTableLog** entity.
Note: To restart the conversion, begin at step 6.

![image](https://github.com/MicrosoftDocs/power-platform-pr/assets/123401931/c09a1b56-66b1-4333-b8a7-9b6ff685a1bc)


       
> [!NOTE]
>  
> Rollup jobs
> Rollup Field jobs (Calculate and Mass Calculate Jobs) are automatically stopped and disabled during the base currency conversion to prevent blocking and speed up conversion process. After the base currency conversion is completed, rollup jobs are auto enabled and triggered to recalculate rollup values and ensure that rollup values are up to date.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
