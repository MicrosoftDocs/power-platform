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

This article uses a data migration example from Salesforce. Salesforce is a robust cloud-based CRM, but migrating data from it requires careful planning because of its complex data structures, like custom objects, relationships, and unique record IDs. When you migrate from Salesforce, map these elements to Dataverse to keep data integrity and relationships. Separate different lines of business data, and let each business leader decide what to migrate or discard. You can also archive some data and use it from legacy systems if needed. This article covers both approaches because each is important for data migration.

Follow these steps to start data migration.

## Technical approach for data migration

To ensure a successful migration, follow a structured technical approach that includes extracting, transforming, and loading data while maintaining data integrity and minimizing business disruption.


### Extract data from source to staging database

For complex Data Migrations, it’s always recommended to bring Data into a staging Database (for example, SQL Server), which we can call as Source Staging Database. Also, the staging DB represents a snapshot of Data at a specific point in time, and business continuity can still happen on the source system without impacting it.

Here are some considerations for bringing data into a staging Database.

- **Full vs. delta load** - Phasing data into full load vs. delta load becomes possible, because we can easily segregate the data in that intermediate database. We can keep the data coming from source system and auto generate columns for date time can keep track of when the data came in staging database. And at the time of migration, we can easily determine the delta based on these dates and load only the delta data.

- **Failover mechanism** - Continue after failing records and minimize the subsequent data records loading. When we try to migrate the data, we may find records are failing because of genuine reasons, like field length exceeding, option set value not matching or lookup value doesn’t exist in the target system, we can continue on those failures and before running the next run, we can try to resolve as much as possible and then rerun the next run.

- **Mapping of fields** - Easily create mapping for option set text to integer value in Dataverse. In the source systems like Salesforce, the option set values may come in the form of text, and we can match their text from our Dataverse option set value text and do a transformation to appropriate value, so that all such transformations are preloaded in the database itself.

- **Data validations** - Run prevalidation queries on the retrieved data to check the integrity of data. In most cases, if data is coming from a well-defined SAAS like Salesforce, ideally it shouldn’t have integrity problems like lookup of account on contact table doesn’t exist in account table. But these things happen practically, as when we're dealing with large data, data extraction takes its own time, few hours to few days and continuous new data is being generated in the source system, as we haven’t shut down the system, so if we extracted account table in 1 hour, and then next hour retrieving contact table, and meanwhile some new contact and account combination was generated in the system, there are chances that we retrieve a contact for which we didn’t retrieve the account record. Staging DB can help in such scenarios as well where we can easily eliminate such records beforehand and in the next extraction based on start date time, we can retrieve all the records fully integrated.

- **Data visualization** - Visualization of whole data in database in easier in terms of taking record counts, summing the opportunity values or any other number or financial fields to cross audit the records.

### Transform data into target staging database

After extracting data from Source System like Salesforce, it’s crucial to transform data into a database which is equivalent to tables in Dataverse, and which has the values which can be directly inserted / updated into Dataverse. This form of tables we call as Target Staging Database. We can think of following transformations for this.

- **Create mappings from source table column names to target**
  (Dataverse) column names and write scripts to send data from source
  table to target table. In some cases, data from multiple tables may
  come to a single table. We need to write join queries to bring the
  combined data.

- **Option set mapping for transformation** - For option set values, if
  source system has those text values, we can write the mapping from
  text to option set value in Dataverse and write queries to resolve
  them. We recommend creating a table like this OptionSetMapping

- Source Table Name (string)

- Target Table Name (string)

- Source Text (string)

- Source Value (string)

- Target Text (string)

- Target Value (string)

And now, We must update all the option set values in a table named contact in Target, where we have two columns for optionset text and value. 

We can write below query:

` *Update C.\<OptionsetValue\> = M.\<TargetValue\> FROM Contact C JOIN OptionsetMapping M ON C.OptionsetText = M.TargetText AND M.TargetTableName = ‘Contact’* `


- **Do not generate GUIDs for Dataverse** – Dataverse uses GUID as
  primary key, we can either supply a GUID during insert or let
  Dataverse generate it. We must not generate the GUIDs, if the source
  system isn't Dataverse. The reason is whatever algorithms we use for
  generating GUIDs, it might not be same which Dataverse uses internally
  to generate the GUIDs, and random GUIDs cause a heavy page
  fragmentation in Dataverse table which will reduce the performance of
  those tables and that won't be a good scenario. So, we should
  always let Dataverse generate the GUIDs, as they're coming from
  another Dataverse instance.

- **String lengths** - Check carefully, for all the string column
  lengths and match it with Dataverse column length, if data is more
  than length then take appropriate corrective actions like trimming the
  data or reducing the length to match the Dataverse column length.

- **Transformation** – Any other transformations like sometimes it maybe
  required to do some calculated columns, for example in Dataverse Name
  fields show in lookup values, if it wasn't part of source system, we
  can calculate the name column and add those transformations in our
  staging database.

- **Additional fields consideration** – When we create the tables
  equivalent to Dataverse schema, we should consider following
  additional tables and fields.

  - **DM_CreatedDateTime** – This field should be auto populated with
    current date time, this helps in resolving conflicts or issues
    specially when someone else is supplying the data to you from
    source, and then you can determine which row has come to you when,
    and also it helps in deciding a data should be part of full load
    or incremental delta load. We won’t add this field for import, but
    still it would help us to segregate data came in different loads.

  - **Action flag** – We can keep this one-character field, and define
    the characters like ‘I’, ‘U’, ‘D’, which will determine whether a
    particular record should be insert / update / delete, and via
    queries we can process records easily.

  - **Processing flag** – This can be used as ‘P’, ‘U’, ‘E’ or ‘S’,
    which are processes, unprocessed, Error, or Success, which will show
    the state of record. We should update this field after the complete
    run of data load based on Success Table, and not during data load of
    per page.

  - **Unique column** – We should keep one unique column depending on
    Source data, for example, Salesforce has Salesforce ID in every table, which
    is hexadecimal Unique ID, we can create such schema in all of
    migration eligible Dataverse table, it helps us mapping row by
    row from Salesforce to Dataverse. We can use out of the box
    importsequencenumber column if there's no clearly defined unique
    column in source tables.

  - **Success / error tables** – we should keep two separate tables for
    recording errors and success for every migrated table. for example, we can
    create Contact_Error and Contact_Success tables for contact table
    migration. In Error table, we should keep unique column, error
    column, error message, Dataverse Record ID columns, while for
    Success Table, we can keep unique column, Dataverse record ID,
    Operation, and message columns.

### Sequence tables and pre-load lookups

Now next important task after static transformations is to sequence the tables in such a way that we have minimum cyclic dependencies (when two or more tables have lookup to each other in such a way that we can't import a single table without having reference from other table). We can do this easily by this way.

- List down all the tables which are eligible for Data Migration

- Note down the number of unique table lookups which are eligible for
  migration, for example, if Contact has two Account lookups, we consider it
  as one as it's pointing to a single table. We can ignore OOB lookups
  like Created By, modified by, etc. if they aren't eligible for
  migration in our scenario. Also, we can ignore the table lookups which
  we aren't migrating.

- Now put the tables in the ascending order of no. of unique lookups.

- We can include N: N relationship tables also in this sequence
  considering two lookups in those tables for those two related tables.

- We can ignore multi table lookups like regardingobjectid for this
  calculation.

This much defines the sequence of Data Migration load, this may
not be the best in some complicated scenarios, but it would be the best
sequence in most of the cases.

- **Use a unique column, like import sequence number** - When loading
  data in Dataverse, receive the inserted/updated records in a Success
  Table and keep record GUIDs and a unique identifier. If none exists,
  create an Autogenerate integer column like importsequencenumber. As
  GUIDs are generated by Dataverse, match rows between the Success Table
  and main table using this column, then transfer the record GUIDs to
  the main table.



- **Keep error and success tables separate** It's important to use
  separate tables for recording errors and successes during the data
  migration process. This separation prevents locking issues that can
  occur when reading and writing data simultaneously in the same table.
  Using separate tables helps maintain performance and efficiency during
  the migration.



- **Pre-load lookup GUIDs from the already migrated tables** – Once the
  migration process has commenced, we can begin populating the available
  Lookup GUIDs from the previously migrated tables. This approach facilitates the resolution of these GUIDs during the record insertion
  phase.



- **Plan to update lookups for cyclic dependencies** – In cases where
  there are cyclic dependencies, such as when a contact has an account
  lookup and an account has a contact lookup, it's necessary to load
  one entity before the other. Initially, the record should be inserted
  without the dependent lookup. Subsequently, while loading the second
  table, the previously loaded record's GUID can be inserted.

### Load data into Dataverse

Now we can start the data loading into Dataverse. There are many tools
available in the market which can be utilized, like SDK Configuration
Migration tool, Azure Data Factory, Kingsway Soft, Scribe, Xrm Toolbox’s
Data Transporter etc. Depending on size we can choose our tool wisely.
But with almost every tool we should consider following things:

- **Plan to update lookups for cyclic dependencies** – In cases where
  there are cyclic dependencies, such as when a contact has an account
  lookup, and an account has a contact lookup, we can load fewer lookups
  object first and lookup of not loaded table can be updated later
  instead of during insertion. To reduce these updates to minimal, we
  should plan to load the objects in a sequence of no. of unique lookups
  in a table as explained previously.

- **Update main table with record IDs** – During the data load we should
  always bring the Dataverse record GUID in a separate success table and
  after the load for that table has been completed, we should bring the
  record GUIDs in the main table by using another unique column or
  importsequencenumber type columns.

- **Optimize batch size and number of threads** – We all know that to
  maximize the speed of Dataverse operations, we need to be able to use
  ExecuteMultiple requests which can have 1000 requests in a single
  batch and we can execute upto 52 parallel threads. These are some of
  the [Service Protection API
  limits](/power-apps/developer/data-platform/api-limits?tabs=sdk#how-service-protection-api-limits-are-enforced)

| **Measure**                   | **Description**                                               | **Limit per web server**                                      |
|-------------------------------|---------------------------------------------------------------|---------------------------------------------------------------|
| Number of requests            | The cumulative number of requests made by the user.           | 6000 within the 5-minute sliding window                       |
| Execution time                | The combined execution time of all requests made by the user. | 20 minutes (1,200 seconds) within the 5-minute sliding window |
| Number of concurrent requests | The number of concurrent requests made by the user            | 52 or higher                                                  |

Now the science lies in making the optimal combinations of these so that
we get best performance. Here are some of the considerations which we're recommending:

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
   size 100 and max parallel threads of 30 gives optimal speed.

4. For large and complex tables with more than 100 columns and
   more than 20 lookups, we should keep batch size low like 10-20
   and max parallel threads should be 10-20 only, this ensures that
   data migration isn't failing in between, although speed of
   migration will be low.

5. Another important factor for migration speed is Data Centre
   location. We should run our Data Migration from a VM in the same
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

   1. **Do not ignore errors for the end** – If there are errors in a
      load, we shouldn't just ignore them and move, because it
      creates a ripple effect, as one account insertion failure may
      cause 10 contact records insertion, and those contact records
      may fail many table records, So depending on the error type,
      like string length, option set mismatch, lookup value not
      available, owner not available in the organization etc., we
      should always have some default strategy for every type of
      error. We can always reduce the string lengths to insert the
      records or have some default option set value or blank lookup.
      This way we get the GUID of the record being inserted and
      ripple effect won't occur. We can keep noting down those
      additional steps somewhere, maybe in a separate column in the
      main table itself.

   1. **Delay loading status to the end** – We can update only active
      status with the record insertion, but for inactive records or
      any other custom state code, status code needs to be updated
      later. For the custom table we can immediately update the status
      code and state code after the insertion. But for the special
      tables where state and status code play a crucial role, for example,
      case closure, opportunity closure, lead qualification. We should
      delay the status update until the very end even after the data
      validation, the reason is that once the cases are closed or
      opportunities are closed, it’s impossible to update them until
      we reopen them and it’s a time-consuming process. And if we're
      missing any column updates then also it becomes a problem. So,
      we should always delay such complex table status updates. And
      also, many tools might be providing only CRUD operations and not
      these complex operations as part of their toolkit, so we might
      have to develop code based tools for CaseClosure,
      OpportunityClose request or leadQualification request.

   1. **Setting the right owner during insert** – When we move from
      Salesforce, any other CRM system to Dataverse, we should try to
      set the right owner during insert itself because in Dataverse,
      BU level and User level securities are driven by owner’s BU. So,
      setting of the right Business Unit for every user is also important.

Dataverse allows to create stub users, and by default they get a Salesperson security role, this is fixed role, and we must not update the name or spelling of this role as well, as this might fail creation of stub users. There could be various reasons why we need to create the stub users instead of licensed users, we might not want to spend for licensing when large migrations are in progress which might take
months, or many owners from the previous source systems have left the organization or changed their department, so we can't license them.

To become an owner of any record, a user needs minimal read privileges on that table. After getting all our tables built, we can provide user level read privileges for all those tables to “Salesperson” security
role. This ensures that any disabled user also can be an owner of any record which we're migrating.

Another important consideration is setting the right Business unit for these stub users during creation itself. The moment we try to update the business unit of any stub or real user, it loses all the security roles including Salesperson and then we can't make these stub users owner of any record until we license them and assign them some security roles. So, planning of user migration must do carefully,
and their business units must be thought carefully before migration itself. So, to summarize this:

- All nonlicensed users must be created using data migration job with
  appropriate business units during insertion itself, never update
  business unit after record creation, it will lose their security
  roles.

- They'll by default get the “Salesperson” security role which must
  have user level read privileges on all the tables eligible for
  migration.

- A user with “Salesperson” security role with minimal read privileges
  on all Data migration eligible tables can be the owner of any record,
  even if the user is disabled.

  1. **Setting the currency exchange rate during insertion** – When we
     move from Salesforce, or any other CRM system to Dataverse, we
     should try to set the right currency exchange rates for all the
     money fields. In Dataverse we don’t have historical currency
     exchange rates, so we can write a pre-validation plugin and
     override exchange-rate property in a record to apply that specific
     currency exchange rates. If we don’t do that then it becomes difficult to see the same financial state across geographies
     across source and target systems.

### Post data load into Dataverse

After the data load has been completed for any table, we should
immediately check any errors and try to rectify and try to rerun those
records to minimize the ripple effect, and we must bring the GUIDs of
success records in the main table so that they can work as lookup
resolution for subsequent data loads.

- **Update main table from success table** – We must update the record
  GUIDs and the Processing Flag into the main table, this ensures
  that during the rerun or delta run we can easily avoid the records
  which are marked as ‘P’ processed in the main table, and we should run
  the process only for ‘E’ or ‘U’, Errored or Unprocessed records only.
  Also bringing the GUID into the main table can work as preload for
  subsequent table lookup resolutions.

- **Retrial of errored records** – To minimize the rework in data
  migration it’s recommended to get some alternative way to rectify the
  error and get at-least placeholder record to get the GUID, which can
  be referred as Lookup resolution in the subsequent tables. Retrial
  failed records could be:

  - Trimming the length of fields if the error is string length.

  - Reset some default option set value if some option set value isn't
    available in Dataverse.

  - Reset some default owner if due to some reason, owner can't be
    there in the new environment even as a disabled stub user.

  - Reset to blank or some default lookup field value in case of some
    lookups aren't able to resolve.

By following the above steps, we can ensure a smooth and efficient data
migration process, minimizing the risk of errors and ensuring that all
records in the main table are correctly updated with their respective
Dataverse GUIDs. This methodical approach is important when
dealing with large volumes of data and complex migration scenarios.

## Functional data segmentation and archival framework

Technical planning of Data Migration involves, tool selection,
infrastructure selection, and source and target count matching, auditing, and data reconciliation etc. But most of the data migrations become
complex in the world because we don’t analyse what is required
for migration and what’s the right place of every type of data. In this section, we talk about all those fundamentals of analysing data.

### Data segmentation

Data Segmentation is an important aspect when we talk about any CRM
system to Dataverse data migration. Many a times we have migration
scenarios from some well-known CRM systems to Dataverse migration. Like
Salesforce, Sibel etc. We can segment data tables based on the line of
business or business segments like Sales, Service, Marketing, etc.

**<u>Tables segmentation</u>**

We can start making a list of eligible tables for migration in each
area. Like all the tables related to Sales, or tables related to
marketing or Services.

After segmentation of tables, we need to start putting their schema into
some Excel or like that, we can start making some basic queries in the
source system to see how many records contain values in those columns,
if less than 5% or 0% records contains values in any column, we need to
do a bit of brainstorming with business stakeholders whether those
columns are meaningful for running business or not and can we
discard those columns for data migrations.

Trust me, this exercise looks not that interesting but in practical for
CRM systems running for more than 10 years in production, we cut down
almost 30-40% columns and 20% tables itself, which itself is a huge gain
for data migration exercise.

**<u>Columns relevancy</u>**

Many time columns are called columns in source CRM system or can be
calculated column in target Dataverse environment. We can start
separating out those columns and after a discussion with business folks
we can come on to a decision whether we need to write Data Migration
Jobs for those columns or not.

There could be columns which are meaningful in the context of that
respective source system only and may not be relevant for target system. We can ignore those columns as well for migration. Many out of the box
columns like created by, modified by, row version number, if they aren't meaningful for data migration, we should ignore them as well.

**<u>File type data</u>**

In Source systems if we have any file type data, we need to mark them
and think differently for those files migration, we can have following
considerations for file migration.

- If the number of files is decent like 4K-6K or up to 20K max, and
  these files are well known Microsoft Office file types like word,
  PowerPoint, Excel, etc. We can plan to migrate these files to
  SharePoint, as it provides a better collaboration capability for the
  files across multiple users.

- If multimedia files are there, like playable videos, images, we need
  to think about the technology which should be used for playing them
  online. And according to that we can either choose SharePoint or
  YouTube or any other available storage and player capabilities tools.

- If the files are huge in number, or large in size, and cost of
  storage is a concern, then we should use Azure Storage Blob separately
  or use out of the box file type column which internally uses an Azure
  Storage Blob only for all the file and attachment storage.

- If the file movement needs malware detection, then we can probably use
  Azure Advanced Threat Protection or any other malware detection and
  removal software before the actual files’ migration.

After doing careful analysis of relevancy of data, we have seen that data
usually reduces a lot specially for long running CRM systems in
production.

### Data archival strategies

Many time, data is relevant, important, and necessary to run
business but still it might be rarely retrieved. For example, old
emails, like more than 2 or 3 year old emails, they're hardly being
referred or closed cases which are older than three years. Or lost
opportunities or disqualified leads. We need to create a strategy which
can bring minimal data with no disruptions in the current business
scenarios. We can consider following things for data archival.

**<u>Marking objects for archival</u>**

Some of the straightforward objects can be easy example of archival,
like following.

- Emails older than three years

- Opportunities closed as lost

- Closed cases

- Disqualified leads

- Marketing emails

- Posts

- Audit records

Apart from these common objects, we need to think about business system
and carefully observe the tables which can be archived.

**<u>Archival strategy</u>**

The strategy for archival of records is also important. Specially
the place for archival of data is also important. We can think of
following places for archival.

- Leave data into the original source system. But usually, CRM systems
  are Software as a Service, and they have paid license, but still most
  of the businesses decide to take this, they usually keep a few admin
  licenses activated and surrender all other licenses for the
  organization, that way the minimal cost of holding the data is being
  paid. And still other employees can get access on required data with
  the help of those admin users.

- Sometimes, keeping the source system intact isn't an option, in those
  cases, we can plan to keep archival records into some local database
  or Azure Storage Blob or some Azure tables, this way, the cost of
  migration and keeping them in storage both can be controlled. But we
  still must develop a different data migration strategy for this type
  of migration.

- Archive data into a separate Dataverse environment can also be an
  option but few people use it, as it requires the same effort for
  moving, but in this case the other Dataverse environment can be
  discarded completely after a few years, and it can save some time by
  not being a blocker for the cut over planning.

## Recommended data migration infrastructure

Use any tool for data migration, but this article recommends this infrastructure for Dataverse data migration:

- Use a virtual machine in the same region as your Dataverse environment. This setup speeds up the data migration process.

- Choose a virtual machine with high memory and storage to handle large volumes of data. Use at least a D4 VM with 8 cores, 28 GB RAM, and 500 GB storage.

- Use a local database on the machine instead of connecting to an Azure database. If you use Azure Data Factory, deploy it in the same region as Dataverse.

## Next steps

- [Benefits of following Power Well Architected for data Migration](benefits-power-well-architected.md)