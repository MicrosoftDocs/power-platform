---
title: Data storage in Power Platform
description: Learn how data is stored in Power Platform.
ms.date: 02/15/2022
ms.service: power-platform
ms.topic: "get-started-article"
ms.custom: 
  - "admin-security"
author: lancedMicrosoft
ms.subservice: admin
ms.author: lanced
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

First, it’s important to distinguish between *personal data* and *customer data*.

- **Personal data** is information about people that can be used to identify them.

- **Customer data** includes personal data and other customer information, including URLs, metadata, and employee authentication information, such as DNS names.

## Data residency

An Azure Active Directory (Azure AD) tenant houses information that's relevant to an organization and its security. When an Azure AD tenant signs up for Power Platform services, the tenant's selected country or region is mapped to the most suitable Azure geography where a Power Platform deployment exists. Power Platform stores customer data in the tenant's assigned Azure geography, or *home geo*, except where organizations deploy services in multiple regions.

Some organizations have a global presence. For example, a business may be headquartered in the United States but do business in Australia. It may need certain Power Platform data to be stored in Australia to comply with local regulations. When Power Platform services are deployed in more than one Azure geography, it's referred to as a *multi-geo* deployment. In this case, only metadata related to the environment is stored in the home geo. All metadata and product data in that environment is stored in the remote geo.

Microsoft may replicate data to other regions for data resiliency. We don't replicate or move personal data outside the geo, however. Data replicated to other regions may include non-personal data such as employee authentication information.

Power Platform services are available in specific Azure geographies. For more information about where Power Platform services are available, where your data is stored, and how it's used, go to [Microsoft Trust Center](https://www.microsoft.com/trustcenter). Commitments concerning the location of customer data at rest are specified in the Data Processing Terms of the [Microsoft Online Services Terms](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=31). Microsoft also provides data centers for [sovereign entities](../regions-overview.md).

## Data handling

This section outlines how Power Platform stores, processes, and transfers customer data.

### Data at rest

Unless otherwise stated in documentation, customer data remains in its original source (for example, Dataverse or SharePoint). A Power Platform app is stored in Azure Storage as part of an environment. Data used in mobile apps is encrypted and stored in SQL Express. In most cases, apps use Azure Storage to persist Power Platform service data and Azure SQL Database to persist service metadata. Data that's entered by app users is stored in the respective data source for the service, such as Dataverse.

All data persisted by Power Platform is encrypted by default using Microsoft-managed keys. Customer data stored in Azure SQL Database is fully encrypted using Azure SQL's Transparent Data Encryption (TDE) technology. Customer data stored in Azure Blob storage is encrypted using Azure Storage Encryption.

### Data in processing

Data is in processing when it's being used as part of an interactive scenario, or when a background process, such as a refresh, touches it. Power Platform loads data in processing into the memory space of one or more service workloads. To facilitate the workload's functionality, data that's stored in memory isn't encrypted.

### Data in transit

Power Platform requires all incoming HTTP traffic to be encrypted using TLS 1.2 or higher. Requests that try to use TLS 1.1 or lower are rejected.

## Advanced security features

Some of Power Platform's advanced security features have specific licensing requirements.

### Service tags

A service tag represents a group of IP address prefixes from a specified Azure service. You can use service tags to define network access controls on Network Security Groups or Azure Firewall.

Service tags help to minimize the complexity of frequent updates to network security rules. You can use service tags in place of specific IP addresses when you create security rules that, for example, allow or deny traffic for the corresponding service.

Microsoft manages the address prefixes encompassed by the service tag, and automatically updates the service tag as addresses change. For more information, see [Azure IP Ranges and Service Tags - Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519).

### Data loss prevention

Power Platform has an extensive set of [Data Loss Prevention (DLP) features](../prevent-data-loss.md) to help you manage the security of your data.  

### Related articles

[Security in Microsoft Power Platform](./overview.md)  
[Authenticating to Power Platform services](./authenticate-services.md)  
[Connecting and authenticating to data sources](./connect-data-sources.md)  
[Security in Microsoft Dataverse](../wp-security.md)

### See also

- [Microsoft Trust Center](https://www.microsoft.com/trustcenter)
- [Choose the region when setting up an environment](../regions-overview.md)
- [Azure IP Ranges and Service Tags - Public Cloud](https://www.microsoft.com/download/details.aspx?id=56519)
- [Data Loss Prevention (DLP) features](../prevent-data-loss.md)
