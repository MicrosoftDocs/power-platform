---
title: "Detect duplicate data  | MicrosoftDocs"
description: Detect duplicate data 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/16/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Detect duplicate data so you can fix or remove it

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

To determine whether a record is a potential duplicate, Power Apps uses duplicate detection rules. When publishing a duplicate detection rule, a matchcode is created for each existing record. A matchcode is also created when a record is created or updated. When a record is in the process of being created or updated, its matchcode can be checked automatically against the matchcodes of existing records. By default, customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), have simple duplicate detection rules for accounts, contacts, and leads. For example, you detect duplicates by matching the record fields, such as email address, first name, and last name.  
  
 Duplicate detection works by comparing generated match codes of existing records with each new record being created. These match codes are created as each new record is created. Therefore, there is potential for one or more duplicate records to be created if they are processed at the exact same moment. In addition to detecting duplicates as they are created, you should schedule duplicate detection jobs to check for other potential duplicate records.  
  
> [!NOTE]
>  Duplicate detection works with [!INCLUDE[pn_moca_full](../includes/pn-moca-full.md)], but isn't available for [!INCLUDE[pn_Mobile_Express_short](../includes/pn-mobile-express-short.md)].  
> 
> [!IMPORTANT]
>  You have to be a system administrator or a system customizer to create, enable, and publish duplicate detection rules for your organization.  
> 
>  After publishing a duplicate detection rule, increasing the length of fields that are included in the duplicate detection criteria goes undetected. The field length could exceed the matchcode length limit and not be verified. This may result in duplicates not being detected.  
> 
>  You can create multiple detection rules for the same entity type. However, you can publish a maximum of five duplicate detection rules per entity type at one time.  
  
 You can detect duplicates:  
  
- When you create or update records for entities that enabled for duplicate detection. This includes records created with [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] and tracked in the web application. The duplicate detection dialog is only displayed for the records created or updated in the user interface (UI). For example, for records created by a workflow, the duplicate detection dialog is not displayed.  
  
  > [!NOTE]
  > Customer engagement apps have the ability to detect duplicates for the updated UI entities when you create or update records using entity forms or grid views in the web application.  
  
- When [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] goes from offline to online.  
  
- During data import. You can specify whether or not to check for duplicates during the import.  
  
  > [!NOTE]
  >  Duplicates can’t be detected when a user merges two records, converts a lead, or saves an activity as completed. Duplicates also aren’t detected when a user changes the status of a record, such as activating or reactivating it.  
  
To check for duplicates in the web application, you can use **Detect Duplicates** capability provided in **More Commands** (![More commands button](../admin/media/not-available.png "More commands button")) on the nav bar in the grid. The duplicate records are also detected when you import data programmatically or through Import Data Wizard. In addition, you can check for duplicates by running scheduled duplicate detection jobs. For step-by-step instructions on how to set up the duplicate detection job, see [Run system jobs to detect duplicates](run-bulk-system-jobs-detect-duplicate-records.md).  
  
A duplicate detection job runs in the background while you do other things in the customer engagement apps. You can request email notification from customer engagement apps upon the completion of a duplicate detection job.  
  
### See also  
 [Detect duplicate records and merge](detect-duplicate-records.md) <br />
 [Import data (all record types)](../admin/import-data-all-record-types.md)   
 [Check for duplicates](set-up-duplicate-detection-rules-keep-data-clean.md)   
 [Set up duplicate detection rules](set-up-duplicate-detection-rules-keep-data-clean.md)   
 [Run system jobs to detect duplicates](run-bulk-system-jobs-detect-duplicate-records.md)   
 [Delete bulk records](../admin/delete-bulk-records.md)
