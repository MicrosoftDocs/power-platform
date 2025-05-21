---
title: Workflow for complex data migration
description: Learn how to plan and execute complex data migrations from Salesforce to Dataverse, including technical steps, error handling, and best practices.
#customer intent: As a Power Platform user, I want to plan and execute a complex data migration from Salesforce to Dataverse so that I can ensure data integrity and minimize business disruption.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 05/20/2025
---

# Workflow for complex data migration

This article uses a data migration example from Salesforce. Salesforce is a robust cloud-based CRM, but migrating data from it needs careful planning because of its complex data structures, like custom objects, relationships, and unique record IDs. When you migrate from Salesforce, map these elements to Dataverse to keep data integrity and relationships. Separate different lines of business data, and let each business leader decide what to migrate or discard. You can also archive some data and use it from legacy systems if needed. This article covers both approaches because each approach is important for data migration.

Follow these steps to start your data migration:

## Technical approach for data migration

To ensure a successful migration, follow a structured technical approach that includes extracting, transforming, and loading data while maintaining data integrity and minimizing business disruption.


### Extract data from source to staging database

For complex data migrations, it’s always recommended to bring data into a staging database (for example, SQL Server), which we can call as source staging database. Also, the staging database represents a snapshot of data at a specific point in time, and business continuity can still happen on the source system without impacting it.

Here are some considerations for bringing data into a staging database.

- **Full vs. delta load**: Phasing data into full load vs. delta load becomes possible because you can easily segregate the data in the intermediate database. You can keep the data coming from the source system and auto-generate columns for date and time to keep track of when the data arrived in the staging database. At the time of migration, you can easily determine the delta based on these dates and load only the delta data.
- **Failover mechanism**: Continue after encountering failed records and minimize the loading of subsequent data records. When migrating data, some records may fail due to genuine reasons, such as field length exceeding limits, option set values not matching, or lookup values not existing in the target system. You can continue past these failures, and before the next run, try to resolve as many issues as possible and then rerun the migration.

- **Mapping of fields**: Easily create mapping for optionset text to integer value in Dataverse. In the source systems like Salesforce, the optionset values may come in the form of text, and you can match their text from our Dataverse optionset value text and do a transformation to appropriate value, so that all such transformations are preloaded in the database itself.

- **Data validations**: Run prevalidation queries on the retrieved data to check its integrity. In most cases, if the data is coming from a well-defined SaaS platform like Salesforce, it shouldn’t have integrity problems, such as a contact record referencing an account that doesn’t exist in the account table. However, these issues can occur in practice. When dealing with large datasets, data extraction can take anywhere from a few hours to a few days, and new data is continuously generated in the source system since it remains active. For example, if you extract the account table in one hour and then retrieve the contact table the next hour, new contact and account combinations may have been created in the meantime. As a result, you might retrieve a contact for which you didn’t retrieve the corresponding account record. A staging database can help in such scenarios by allowing you to easily eliminate such records beforehand. In the next extraction, based on the start date and time, you can retrieve all records that are fully integrated.

- **Data visualization**: Visualization of all data in the database is easier when it comes to taking record counts, summing opportunity values, or using other numeric or financial fields to cross-audit the records.

### Transform data into target staging database

After extracting data from source system like Salesforce, it’s crucial to transform data into a database which is equivalent to tables in Dataverse, and which has the values which can be directly inserted / updated into Dataverse. This form of tables we call as "target staging database". You can think of following transformations for this.

- **Create mappings from source table column names to target**
  (Dataverse) column names and write scripts to send data from source
  table to target table. In some cases, data from multiple tables may
  come to a single table. You need to write join queries to bring the
  combined data.

- **Option set mapping for transformation**: For optionset values, if
  source system has those text values, you can write the mapping from
  text to optionset value in Dataverse and write queries to resolve
  them. We recommend creating a table like this:

    OptionSetMapping

        - Source Table Name (string)
        - Target Table Name (string)
        - Source Text (string)
        - Source Value (string)
        - Target Text (string)
        - Target Value (string)



And now, you must update all the optionset values in a table named contact in target, where you have two columns for optionset text and value. 

You can write below query:

` Update C.\<OptionsetValue\> = M.\<TargetValue\> FROM Contact C JOIN OptionsetMapping M ON C.OptionsetText = M.TargetText AND M.TargetTableName = ‘Contact’ `


- **Do not generate GUIDs for Dataverse**: Dataverse uses GUID as
  primary key. You can either supply a GUID during insert or let
  Dataverse generate it. You must not generate the GUIDs, if the source
  system isn't Dataverse. The reason is whatever algorithms you use for
  generating GUIDs, it might not be same which Dataverse uses internally
  to generate the GUIDs, and random GUIDs cause a heavy page
  fragmentation in Dataverse table which will reduce the performance of
  those tables and that won't be a good scenario. So, you should
  always let Dataverse generate the GUIDs, as they're coming from
  another Dataverse instance.

- **String lengths**: Check all string column lengths carefully and match them with the Dataverse column lengths. If the data exceeds the allowed length, take appropriate corrective actions such as trimming the data or reducing its length to match the Dataverse column requirements.

- **Transformation**: Any other transformations, such as creating calculated columns, may also be required. For example, in Dataverse, Name fields are shown in lookup values. If this field wasn't part of the source system, you can calculate the Name column and add those transformations in your staging database.

- **Additional fields consideration**: When you create the tables
  equivalent to Dataverse schema, you should consider following
  additional tables and fields.

  - **DM_CreatedDateTime**: This field should be auto-populated with the current date and time. This helps in resolving conflicts or issues, especially when someone else is supplying the data from the source, as you can determine when each row was received. It also helps in deciding whether data should be part of a full load or an incremental delta load. You won’t add this field for import, but it would still help us to segregate data that came in different loads.

  - **Action flag**: You can keep this as a one-character field and define characters such as ‘I’, ‘U’, and ‘D’ to indicate whether a particular record should be inserted, updated, or deleted. Using queries, you can then process records easily based on these values.

  - **Processing flag**: This field can be set to ‘P’, ‘U’, ‘E’, or ‘S’, representing Processed, Unprocessed, Error, or Success, to indicate the state of the record. We should update this field after the complete data load run based on the Success Table, not during the per-page data load.

  - **Unique column**: You should keep one unique column depending on the source data. For example, Salesforce has a Salesforce ID in every table, which is a hexadecimal unique ID. You can create a similar schema in all migration-eligible Dataverse tables to help map rows from Salesforce to Dataverse. If there is no clearly defined unique column in the source tables, you can use the out-of-the-box importsequencenumber column.

  - **Success / error tables**: You should keep two separate tables for recording errors and successes for every migrated table. For example, you can create Contact_Error and Contact_Success tables for the contact table migration. In the Error table, you should include columns such as unique column, error column, error message, and Dataverse Record ID. In the Success table, you can include the unique column, Dataverse Record ID, operation, and message columns.

### Sequence tables and pre-load lookups

Now next important task after static transformations is to sequence the tables in such a way that you have minimum cyclic dependencies (when two or more tables have lookup to each other in such a way that we can't import a single table without having reference from other table). You can do this easily by this way.

- List down all the tables which are eligible for Data Migration

- Note the number of unique table lookups that are eligible for migration. For example, if the Contact table has two Account lookups, count it as one since both point to a single table. You can ignore out-of-the-box (OOB) lookups like Created By or Modified By if they aren't eligible for migration in your scenario. Also, ignore any table lookups that you aren't migrating.

- Put the tables in the ascending order of no. of unique lookups.

- You can also include N:N relationship tables in this sequence, considering two lookups in those tables for the two related tables.

- You can ignore multi table lookups like regarding objectid for this calculation.

This defines the sequence of data migration load, this may
not be the best in some complicated scenarios, but it would be the best
sequence in most of the cases.

- **Use a unique column, like import sequence number**: When loading data into Dataverse, store the inserted or updated records in a success table and include both the record GUIDs and a unique identifier. If a unique identifier does not exist, create an auto-generated integer column, such as importsequencenumber. Since GUIDs are generated by Dataverse, match rows between the success table and the main table using this column, and then transfer the record GUIDs to the main table.



- **Keep error and success tables separate**: It's important to use
  separate tables for recording errors and successes during the data
  migration process. This separation prevents locking issues that can
  occur when reading and writing data simultaneously in the same table.
  Using separate tables help maintain performance and efficiency during
  the migration.



- **Pre-load lookup GUIDs from the already migrated tables**: Once the
  migration process has commenced, you can begin populating the available
  lookup GUIDs from the previously migrated tables. This approach facilitates the resolution of these GUIDs during the record insertion
  phase.



- **Plan to update lookups for cyclic dependencies**: In cases where
  there are cyclic dependencies, such as when a contact has an account
  lookup and an account has a contact lookup, it's necessary to load
  one entity before the other. Initially, the record should be inserted
  without the dependent lookup. Subsequently, while loading the second
  table, the previously loaded record's GUID can be inserted.

### Load data into Dataverse

Now you can start the data loading into Dataverse. There are many tools
available in the market which can be utilized, like SDK configuration
migration tool, Azure Data Factory, Kingsway Soft, Scribe, Xrm Toolbox’s
Data Transporter etc. Depending on size you can choose our tool wisely.
But with almost every tool you should consider following things:

- **Plan to update lookups for cyclic dependencies**: In cases where
  there are cyclic dependencies, such as when a contact has an account
  lookup, and an account has a contact lookup, you can load fewer lookups
  object first and lookup of not loaded table can be updated later
  instead of during insertion. To reduce these updates to minimal, you
  should plan to load the objects in a sequence of no. of unique lookups
  in a table as explained previously.

- **Update main table with record IDs**: During the data load you should
  always bring the Dataverse record GUID in a separate success table and
  after the load for that table has been completed, you should bring the
  record GUIDs in the main table by using another unique column or
  importsequencenumber type columns.

- **Optimize batch size and number of threads**: To
  maximize the speed of Dataverse operations, you need to be able to use
  ExecuteMultiple requests which can have 1000 requests in a single
  batch and you can execute upto 52 parallel threads. These are some of
  the [Service Protection API
  limits](/power-apps/developer/data-platform/api-limits?tabs=sdk#how-service-protection-api-limits-are-enforced)

| **Measure**                   | **Description**                                               | **Limit per web server**                                      |
|-------------------------------|---------------------------------------------------------------|---------------------------------------------------------------|
| Number of requests            | The cumulative number of requests made by the user.           | 6000 within the 5-minute sliding window                       |
| Execution time                | The combined execution time of all requests made by the user. | 20 minutes (1,200 seconds) within the 5-minute sliding window |
| Number of concurrent requests | The number of concurrent requests made by the user            | 52 or higher                                                  |

Now the science lies in making the optimal combinations of these so that
you get best performance. Here are some of the considerations which are recommended:

1. For out of the box tables like contact, account, lead, etc. no matter
   what you do, speed of migration would be comparatively lower. The reason is there are many platform jobs and plugins which run for
   these records, but we have seen if we aren't using too many lookups
   during insertion like up to 10 lookup fields and total 50-70 columns
   then batch size of 200-300 and the max parallel threads 30 give optimal speed.

2. For simpler tables with no lookups or few lookups, small
   batch sizes like 10 or less and max parallel threads 50 also don’t
   create exception in no. of concurrent requests and exceptionally
   speed up the migration.

3. For any other custom table with decent number of lookups max batch
   size 100 and max parallel threads of 30 give optimal speed.

4. For large and complex tables with more than 100 columns and
   more than 20 lookups, you should keep batch size low like 10-20
   and max parallel threads should be 10-20 only. This ensures that
   data migration isn't failing in between, although speed of
   migration will be low.

5. Another important factor for migration speed is data centre
   location. You should run our data migration from a VM in the same
   region that speed up the whole operation exponentially. To find the
   data center for your Dataverse environment, you can follow these
   steps:

   1. **Power Platform Admin Center**:

      - Sign in to the Power Platform Admin Center.

      - Navigate to the environment you want to check.

      - Look for the "Region" or "Azure Region" information, which
        indicates the data center's location.

   1. **Ping the environment URL**:

      - Use the environment's URL (for example, xxx.crm4.dynamics.com) and run a
        ping command in your command prompt or terminal.

      - The response includes a region hint, such as crm4 for Europe
        or crm8 for India.

   1. **PowerShell script**:

      - If you manage multiple environments, you can use PowerShell to
        retrieve the Azure region for each environment. A script can loop
        through environments and output the azureRegionHint property

   1. **Do not ignore errors for the end**: If there are errors in a load, you shouldn't just ignore them and move on, because this creates a ripple effect. For example, one account insertion failure may cause ten contact record insertions to fail, and those contact records may, in turn, cause failures in many other table records. Depending on the error type—such as string length issues, option set mismatches, lookup values not available, or owners not available in the organization—you should always have a default strategy for each type of error. You can reduce string lengths to insert the records, use a default option set value, or leave a lookup blank. This way, you get the GUID of the record being inserted and the ripple effect won't occur. You can keep track of these additional steps somewhere, perhaps in a separate column in the main table itself.

   1. **Delay loading status to the end**: You can update only the active status during record insertion, but for inactive records or any other custom state code, the status code needs to be updated later. For custom tables, you can immediately update the status code and state code after insertion. However, for special tables where state and status code play a crucial role—for example, case closure, opportunity closure, or lead qualification—you should delay the status update until the very end, even after data validation. This is because once cases or opportunities are closed, it’s impossible to update them until you reopen them, which is a time-consuming process. If you miss any column updates, it also becomes a problem. Therefore, you should always delay such complex table status updates. Additionally, many tools might provide only CRUD operations and not these complex operations as part of their toolkit, so you might have to develop code-based tools for CaseClosure, OpportunityClose requests, or leadQualification requests.

   1. **Setting the right owner during insert**: When you move from Salesforce or any other CRM system to Dataverse, you should try to set the correct owner during the insertion itself because, in Dataverse, both business unit (BU) level and user level security are driven by the owner’s BU. Therefore, setting the correct business unit for every user is also important.

Dataverse allows you to create stub users, and by default, they receive the salesperson security role. This is a fixed role, and you must not update the name or spelling of this role, as doing so might prevent the creation of stub users. There are various reasons why you might need to create stub users instead of licensed users. For example, you may not want to pay for licensing during large migrations that could take months, or many owners from previous source systems may have left the organization or changed departments, making it impossible to license them.

To become an owner of any record, a user needs minimal read privileges on that table. After building all your tables, you can provide user-level read privileges for all those tables to the “salesperson” security role. This ensures that any disabled user can also be an owner of any record you are migrating.

Another important consideration is setting the correct business unit for these stub users during their creation. The moment you try to update the business unit of any stub or real user, they lose all security roles, including salesperson, and you cannot make these stub users the owner of any record until you license them and assign them some security roles. Therefore, you must plan user migration carefully, and their business units must be determined before migration begins. To summarize:

- All non-licensed users must be created using the data migration job with the appropriate business units set during insertion. Never update the business unit after record creation, as this will cause the user to lose their security roles.

- By default, they will receive the “salesperson” security role, which must have user-level read privileges on all tables eligible for migration.

- A user with the “salesperson” security role and minimal read privileges on all data migration-eligible tables can be the owner of any record, even if the user is disabled.

  1. **Setting the currency exchange rate during insertion**: When you move from Salesforce or any other CRM system to Dataverse, you should try to set the correct currency exchange rates for all money fields. In Dataverse, there are no historical currency exchange rates, so you can write a pre-validation plugin and override the exchange rate property in a record to apply the specific currency exchange rates. If you don’t do this, it becomes difficult to see the same financial state across geographies in both the source and target systems.

### Post data load into Dataverse

After the data load has been completed for any table, you should immediately check for any errors, try to rectify them, and rerun those records to minimize the ripple effect. You must also bring the GUIDs of successful records into the main table so they can be used for lookup resolution in subsequent data loads.

- **Update main table from success table**: You must update the record GUIDs and the processing flag in the main table. This ensures that during a rerun or delta run, you can easily avoid records marked as ‘P’ (Processed) in the main table and run the process only for ‘E’ (Errored) or ‘U’ (Unprocessed) records. Also, bringing the GUID into the main table can serve as a preload for subsequent table lookup resolutions.

- **Retrial of errored records**: To minimize the rework in data
  migration it’s recommended to get some alternative way to rectify the
  error and get at-least placeholder record to get the GUID, which can
  be referred as lookup resolution in the subsequent tables. Retrial
  failed records could be:

  - Trimming the length of fields if the error is string length.

  - Reset some default option set value if some option set value isn't
    available in Dataverse.

  - Reset some default owner if due to some reason, owner can't be
    there in the new environment even as a disabled stub user.

  - Reset to blank or some default lookup field value in case of some
    lookups aren't able to resolve.

By following the above steps, you can ensure a smooth and efficient data
migration process, minimizing the risk of errors and ensuring that all
records in the main table are correctly updated with their respective
Dataverse GUIDs. This methodical approach is important when
dealing with large volumes of data and complex migration scenarios.

## Functional data segmentation and archival framework

Technical planning for data migration involves tool selection, infrastructure selection, source and target count matching, auditing, and data reconciliation. Most data migrations become complex because you don't analyze what's required for migration or where each type of data belongs. This section covers the fundamentals of analyzing data.

### Data segmentation

Data segmentation is important for any CRM system to Dataverse data migration. Often, migration scenarios involve moving from CRM systems like Salesforce or Siebel to Dataverse. Segment data tables by line of business or business segments, such as sales, service, or marketing.

**<u>Tables segmentation</u>**

Start by listing eligible tables for migration in each area, such as tables related to sales, marketing, or service.

After segmenting tables, add their schema to Excel or a similar tool. Run basic queries in the source system to check how many records have values in each column. If less than 5 percent of records have values in a column, discuss with business stakeholders whether those columns are meaningful for the business or if you can discard them for data migration.

This exercise might not seem interesting, but for CRM systems running in production for more than 10 years, you often cut down almost 30 to 40 percent of columns and 20 percent of tables. This reduction is a significant gain for data migration.

**<u>Columns relevancy</u>**

Some columns in the source CRM system might be regular columns, while others might be calculated columns in the target Dataverse environment. Separate these columns and discuss with business stakeholders to decide if you need to write data migration jobs for them.

Some columns are only meaningful in the source system and aren't relevant for the target system. Ignore these columns for migration. Many out-of-the-box columns, like created by, modified by, or row version number, can also be ignored if they aren't meaningful for data migration.

**<u>File type data</u>**

In source systems, if you have file type data, mark them and consider a different approach for migrating these files. Here are some considerations for file migration:

- If you have 4,000 to 6,000 files, or up to 20,000 files, and these are Microsoft Office file types like Word, PowerPoint, or Excel, plan to migrate them to SharePoint. SharePoint lets multiple users collaborate on files.

- If you have multimedia files, like videos or images, consider the technology needed to play them online. Depending on your needs, choose SharePoint, YouTube, or another storage and player tool.

- If you have a large number of files or large file sizes, and storage cost is a concern, use Azure Storage Blob or the out-of-the-box file type column, which uses Azure Storage Blob for file and attachment storage.

- If you need malware detection for file movement, use Azure Advanced Threat Protection or another malware detection and removal tool before migrating files.

After analyzing data relevancy, data volume usually reduces significantly, especially for long-running CRM systems in production.

### Data archival strategies

Sometimes, data is relevant, important, and necessary to run the business, but it's rarely retrieved. For example, old emails (more than two or three years old), closed cases older than three years, lost opportunities, or disqualified leads. Create a strategy that brings minimal data with no disruptions to current business scenarios. Consider the following for data archival:

**<u>Marking objects for archival</u>**

Some straightforward objects are easy examples for archival, such as:

- Emails older than three years
- Opportunities closed as lost
- Closed cases
- Disqualified leads
- Marketing emails
- Posts
- Audit records

Besides these common objects, review your business system and carefully check which tables can be archived.

**<u>Archival strategy</u>**

The strategy for archiving records is important, especially where you store archived data. Consider the following options:

- Leave data in the original source system. Usually, CRM systems are software as a service and require a paid license. Most businesses keep a few admin licenses active and surrender other licenses to minimize costs. Other employees can access required data through admin users.

- If you can't keep the source system intact, store archival records in a local database, Azure Storage Blob, or Azure tables. This approach controls migration and storage costs, but you need a different data migration strategy for this type of migration.

- Archiving data in a separate Dataverse environment is another option, though it's less common because it requires the same effort to move data. However, you can discard the other Dataverse environment after a few years, which can save time and avoid blocking cutover planning.

## Recommended data migration infrastructure

You can use any tool for data migration, but this article recommends the following infrastructure for Dataverse data migration:

- Use a virtual machine in the same region as your Dataverse environment. This setup speeds up the data migration process.

- Choose a virtual machine with high memory and storage to handle large volumes of data. Use at least a D4 VM with 8 cores, 28 GB RAM, and 500 GB storage.

- Use a local database on the machine instead of connecting to an Azure database. If you use Azure Data Factory, deploy it in the same region as Dataverse.

## Next steps

- [Benefits of following Power Well Architected for data Migration](benefits-power-well-architected.md)