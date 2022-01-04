---
title: "Data storage in Power Platform | MicrosoftDocs"
description: Provides information about data storage concepts in Microsoft Dataverse.
ms.date: 12/08/2021
ms.service: power-platform
ms.topic: "get-started-article"
ms.custom: 
  - "admin-security"
  - "intro-internal"
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Data storage in Power Platform

## Data residency

To understand how Power Platform stores data, it’s important to make a distinction between personal data and more general customer data.

- Personal data is information about people which contains Personally Identifiable Information (PII) and is subject to the control of GDPR/Schrems II.  
- Customer data includes personal data but also includes other customer data like URLs, metadata, and employee authentication information such as DNS names.

Power Platform protects all customer data with care and, unless otherwise indicated in the documentation, stores customer data in an Azure geography that is assigned when an Azure AD tenant signs up for the Power Platform services for the first time. An Azure AD tenant houses the user and application identities, groups, and other relevant information that pertain to an organization and its security.

### Regions

An Azure geography for tenant data storage is assigned by mapping the country or region selected as part of the Azure AD tenant setup to the most suitable Azure geography where a Power Platform deployment exists. Once this determination is made, all the Power Platform customer data will be stored in this selected Azure geography (also known as the home geo), except in cases where organizations utilize multiple geographies deployments.


Some organizations have a global presence and may require the Power Platform services be in multiple Azure geographies. For example, a business may have their headquarters in the United States but may also do business in other geographical areas, such as Australia. In such cases, the business may require that certain Power Platform data remain stored at rest in the remote region to comply with local regulations. This feature of the Power Platform service is referred to as multi-geo.

Only the environment-related metadata is stored in the home tenant. All metadata/data for products within that environment will be stored in the selected target geo environment. Microsoft may replicate data to other regions for data resiliency but will not replicate or move personal data outside the geo. Data replicated to other regions may include non-personal data such as employee authentication information.

The Power Platform services are available in specific Azure geographies as described in the [Microsoft Trust Center](https://www.microsoft.com/trustcenter). For more information about where your data is stored and how it is used, refer to the Microsoft Trust Center. Commitments concerning the location of customer data at rest are specified in the Data Processing Terms of the Microsoft Online Services Terms. Microsoft also provides datacenters for sovereign entities. See [Regions Overview](../regions-overview.md). 

## Data handling

This section outlines the Power Platform data handling practices when it comes to storing, processing, and transferring customer data.

### Data at rest

- Azure SQL Databases
- Azure Storage (various types)

Unless otherwise stated in documentation, customer data remains in its original data source location (for example, Dataverse, SharePoint, SQL Server) while the Power Platform app is stored in Azure Storage as part of an environment. For mobile scenarios, data is encrypted and stored in SQL Express. In the majority of scenarios, Azure Storage is utilized to persist the data of the Power Platform artifacts, while Azure SQL Databases are used to persist artifact metadata.

All data persisted by Power Platform is encrypted by default using Microsoft-managed keys. Customer data stored in Azure SQL Databases is fully encrypted using Azure SQL's Transparent Data Encryption (TDE) technology. Customer data stored in Azure Blob storage is encrypted using Azure Storage Encryption. 

### Data in processing

Data is in processing when it is either actively being used by one or more users as part of an interactive scenario, or when a background process such as refresh touches this data. Power Platform loads actively processed data into the memory space of one or more service workloads. To facilitate the functionality required by the workload, the processed data in memory is not encrypted.

### Data in transit

Power Platform requires all incoming HTTP traffic to be encrypted using TLS 1.2 or above. Any requests attempting to use the service with TLS 1.1 or lower will be rejected.

## Network isolation

This section outlines advanced security features in Power Platform. Some of the features have specific licensing requirements. See the sections below for details.

### Service tags

A service tag represents a group of IP address prefixes from a given Azure service. It helps minimize the complexity of frequent updates to network security rules. Customers can use service tags to define network access controls on Network Security Groups or Azure Firewall. Customers can use service tags in place of specific IP addresses when creating security rules. By specifying the service tag name (for example, PowerBI) in the appropriate source or destination (for APIs) field of a rule, customers can allow or deny the traffic for the corresponding service. Microsoft manages the address prefixes encompassed by the service tag and automatically updates the service tag as addresses change.

### Data loss prevention

Finally, Power Platform has an extensive set of [Data Loss Prevention (DLP) features](../prevent-data-loss.md) to help you manage security.  


