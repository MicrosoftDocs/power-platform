---
title: Data classification recommendation for Power Platform workloads
description: Learn how to classify data based on its sensitivity and how to apply classification to your Power Platform workloads.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 05/16/2024
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for data classification

**Applies to Power Platform Well-Architected Security checklist recommendation:**

|[SE:03](checklist.md)| **Classify and consistently apply sensitivity labels on all workload data and systems involved in data processing. Use classification to influence workload design, implementation, and security prioritization.** |
|---|---|

This guide provides recommendations for classifying data based on its sensitivity. Different types of data have different levels of sensitivity, and most workloads store various types of data. Data classification helps you categorize data by how sensitive it is, what kind of information it contains, and what compliance rules it needs to follow. This way, you can apply the right level of protection, such as access controls, retention policies for different information types, and so on.

**Definitions**

| Term | Definition |
|---|---|
| Classification | A process to categorize workload assets by sensitivity levels, information type, compliance requirements, and other criteria provided by the organization. |
| Metadata | An implementation for applying taxonomy to assets. |
| Taxonomy | A system to organize classified data by using an agreed upon structure. Typically, a hierarchical depiction of data classification. It has named entities that indicate categorization criteria. |

## Key design strategies

Data classification helps you correctly size security assurances and helps the triage team expedite discovery during incident response. A prerequisite to the design process is to clearly understand whether data should be treated as confidential, restricted, public, or any other sensitivity classification. It's also essential to determine the locations where data is stored, because the data might be distributed across multiple environments. With knowledge of where the data is stored, you can design a strategy that serves the security requirements.

Classifying data can be a tedious task. You can use tools that can find data assets and recommend classifications. But don't just depend on tools. Make sure your team members do the exercises carefully. Then use tools to automate when it makes sense.

Along with these best practices, see [Create a well-designed data classification framework](/compliance/assurance/assurance-create-data-classification-framework).

### Understand organization-defined taxonomy

*Taxonomy* is a hierarchical depiction of data classification. It has named entities that indicate the categorization criteria.

Different organizations may have different data classification frameworks; however, they usually consist of three to five levels with names, descriptions, and examples. Here are some data classification taxonomy examples:

| Sensitivity | Information type | Description |
|---|---|---|
| Public | Public marketing material, information available on your website | Information that is freely accessible and not sensitive |
| Internal | Policies, procedures, or budgets that relate to your organization | Information that relates to a specific organization |
| Confidential | Trade secrets, customer data, or final records | Information that is sensitive and requires protection |
| Highly confidential | Sensitive Personally Identifiable Information (Sensitive PII), cardholder data, Protected Health Information (PHI), bank account data | Information that is highly sensitive and requires the highest level of security. May require legal notifications if breached or otherwise disclosed. |

> [!IMPORTANT]
> As a workload owner, you should follow the taxonomy that your organization has established. All workload roles should agree on the structure, names, and meanings of the sensitivity levels. Don't create your own classification system.

### Define the classification scope

Most organizations have a diverse set of labels.

Make sure you know which data assets and components belong to each sensitivity level, and which ones do not. The goal could be faster troubleshooting, quicker disaster recovery, or legal audits. When you know your goal well, it helps you do your classification work properly.

Start with these simple questions and expand as necessary based on your system complexity:

1. What's the origin of data and information type?
1. What's the expected restriction based on access? For example, is it public information data, regulatory, or other expected use cases?
1. What's the data footprint? Where is data stored? How long should the data be retained?
1. Which components of the architecture interact with the data?
1. How does the data move through the system?
1. What information is expected in the audit reports?
1. Do you need to classify preproduction data?

#### Take inventory of your data stores

Data classification applies to the system as a whole. Take inventory of all data stores and components that are in scope. If you're designing a new system, make sure to have an initial categorization per taxonomy definitions. Think about how data will flow through your system between components, and ensure data does not cross data classification boundaries.

Consider how you will connect to data:

- **New data**: If your workload generates new data that wasn't previously stored anywhere, like when transitioning from a paper-based process, we suggest storing this data in Microsoft Dataverse. You can then [connect and manage Microsoft Dataverse data through Microsoft Purview](/purview/register-scan-dataverse).

- **Read/write from an existing system**: If your workload needs to connect to data that already exists, you need to design how to read and write to the existing database or system. You can use virtual tables, connect to the data via connectors, dataflows, or use an on-premises gateway for on-premises data.

#### Define your scope

Be granular and explicit when defining the scope. Suppose your data store is a tabular system. You want to classify sensitivity at the table level or even the columns within the table. Also, be sure to extend classification to nondata store components that might be related or have a part in processing the data. For example, have you classified the backup of your highly sensitive data store? If you're caching user-sensitive data, is the caching data store in scope? If you use analytical data stores, how is the aggregated data classified?

### Design according to classification labels

Classification should influence your architectural decisions. The most obvious area is your segmentation strategy, which should consider the varied classification labels.

**Classification information should move with the data as it transitions through the system** and across components of the workload. Data labeled as confidential should be treated as confidential by all components that interact with it. For example, be sure to protect personal data by removing or obfuscating it from any kind of application logs.

**Classification impacts the design of your report** in the way data should be exposed. For example, based on your information type labels, do you need to apply a data masking algorithm for obfuscation as a result of the information type label? Which roles should have visibility into the raw data versus masked data? If there are any compliance requirements for reporting, how is data mapped to regulations and standards? When you have this understanding, it's easier to demonstrate compliance with specific requirements and generate reports for auditors.

It also impacts the data lifecycle management operations, such as data retention and decommissioning schedules.

### Apply taxonomy for querying

There are many ways to apply taxonomy labels to the identified data. Using a classification schema with metadata is the most common way to indicate the labels. The architecture design process should include design of the schema.

Keep in mind that not all data can be clearly classified. Make an explicit decision about how the data that can't be classified should be represented in reporting.

The actual implementation depends on the type of resources. Data consumed by your Power Platform workload might originate from data sources outside of Power Platform. Your schema should include details on how data from different data sources moves through the workload, or is potentially transferred from one data store to the other, whilst maintaining classification integrity.

Certain Azure resources have built-in classification systems. For example, Azure SQL Server has a classification engine, supports dynamic masking, and can generate reports based on metadata. Microsoft Teams, Microsoft 365 groups, and SharePoint sites can have sensitivity labels applied at the container level. Microsoft Dataverse integrates with Microsoft Purview to apply data labels.

When you design your implementation, evaluate the features supported by the platform and take advantage of them. Make sure metadata used for classification is isolated and stored separately from the data stores.

There are also specialized classification tools that can detect and apply labels automatically. These tools are connected to your data sources. Microsoft Purview has auto-discover capabilities. There are also third-party tools that offer similar capabilities. The discovery process should be validated through manual verification.

**Review data classification regularly**. Classification maintenance should be built into operations, otherwise stale metadata can lead to erroneous results for the identified objectives and compliance issues.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Be mindful of the cost tradeoff on tooling. Classification tools require training and can be complex.

Ultimately, classification must roll up to the organization through central teams. Get input from them about the expected report structure. Also, take advantage of centralized tools and processes to have organizational alignment and also alleviate operational costs.

## Power Platform facilitation

Classification should influence your architectural decisions.

Microsoft Purview provides visibility into data assets throughout your organization. For more information, see [Learn about Microsoft Purview](/purview/purview).

Microsoft Purview Data Map enables automated data discovery and sensitive data classification. The integration between Microsoft Purview and Microsoft Dataverse will help you better understand and govern your business applications data estate, safeguard that data, and improve their risk and compliance posture.

With this integration, you can:

- Create a holistic, up-to-date data map across Microsoft Dynamics 365, Power Platform, and other sources supported by Microsoft Purview.
- Automatically classify data assets based on built-in system classifications or user-defined custom classifications, to help identify and understand sensitive data.
- Empower data consumers to discover valuable, trustworthy data.
- Enable data curators and security administrators to manage and keep data estate secure, reduce data exposure, and better protect sensitive data.

For more information, see [Connect to and manage Microsoft Dataverse in Microsoft Purview](/purview/register-scan-dataverse).

## Organizational alignment

Cloud Adoption Framework provides guidance for central teams about how to classify data so that workload teams can follow the organizational taxonomy.

For more information, see [What is data classification?](/azure/cloud-adoption-framework/govern/policy-compliance/data-classification)

## Related information

- [Data classification and sensitivity label taxonomy](/compliance/assurance/assurance-data-classification-and-labels)
- [Create a well-designed data classification framework](/compliance/assurance/assurance-create-data-classification-framework)
- [Connect to and manage Microsoft Dataverse in Microsoft Purview](/purview/register-scan-dataverse?tabs=MI)

## Security checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Security checklist](checklist.md)
