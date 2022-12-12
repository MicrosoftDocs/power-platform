---
title: Manage your encryption key in the Power Platform
description: Learn how to manage your encryption key. 
author: Mattp123
ms.author: paulliew
ms.reviewer: matp
ms.service: powerapps
ms.topic: how-to
ms.date: 12/12/2022
ms.custom: template-how-to
---
# Manage your encryption key (preview)

Customers have data privacy and compliance requirements to secure their data by encrypting their data at-rest. This secures the data from being exposed in an event where a copy of the database is stolen. With data encryption at-rest, the stolen database data is protected from being restored to a different server without the encryption key.

By default, data is encrypted with Microsoft managed keys. For additional control over encryption keys, you can manage your own keys. Customer managed keys must be stored in Azure Key vault.

In our upgraded customer managed key (CMK) feature, customers can use their own Azure Key Vault encryption key to encrypt their data stored in Power Platform Dataverse storage. This provides an additional level of security by protecting Microsoft support staff from having access to the encryption key.

Another benefit in this feature is the ability to encrypt data in all the storage types used in Dataverse, eg SQL, Azure File, CosmosDB, Datalake, and Search. 

Environments with finance and operations apps where Power Platform integration is enabled can also be encrypted. Finance and operations environments without Power Platform integration will continue to use the default Microsoft managed key to encrypt data. More information: [Enable the Microsoft Power Platform integration](/dynamics365/fin-ops-core/dev-itpro/power-platform/enable-power-platform-integration)

:::image type="content" source="media/cmk-power-platform-diagram.png" alt-text="Customer managed encryption key in the Power Platform":::

## Prerequisites

## Next steps

[About Azure Key Vault](/azure/key-vault/general/overview)