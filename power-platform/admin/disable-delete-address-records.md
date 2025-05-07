---
title: Set address record settings
description: Learn how to prevent the creation of empty address records and allow users to delete address data.
author: mkannapiran 
ms.component: pa-admin
ms.topic: how-to
ms.date: 05/17/2024
ms.subservice: admin
ms.author: kamanick
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Set address record settings

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

This article explains how to prevent empty address records from being created and how to allow users to delete address data.

## Prevent creation of empty address records

The **Disable empty address record creation** setting helps you prevent the creation of address records in Dataverse when the address segment of a payload contains no data. This feature only supports **Account** and **Contact** tables in Dataverse. This setting doesn't affect any other table that associates with an address.

For example, suppose there's an incoming payload for the **Account** table with empty address data, the **Disable empty address record creation** setting, when turned **On**, prevents the creation of an empty record in Dataverse. However, if the same payload contains address data, then an address record is created in Dataverse.

> [!Note]
> Turning on the **Disable empty address record creation** setting doesn't remove existing empty address records.

Complete the following steps to prevent empty address records from being created.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane.
1. Select the checkmark next to an environment, and then select **Settings** in the command bar.
1. Select **Product** > **Features**.
1. Find the **Disable Empty Address Record Creation** setting and turn it **On**.
1. Select **Save** on the bottom of the page to save the changes.

## Allow users to delete address data

The **Enable deletion of address records** setting allows a user to delete address data in Dataverse. The default setting for this setting is **Off**, which means that users can't delete address records in Dataverse. The address record deletion capability is applicable only for **Account** and **Contact** tables in Dataverse.

Turning on the **Enable deletion of address records** setting allows address records to be deleted in the following ways:

- In Power Platform through the user experience.
- Through bulk delete operations
- Through SDK.

Complete the following steps to allow users to delete address data.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane.
1. Select the checkmark next to an environment, and then select **Settings** in the command bar.
1. Select **Product** > **Features**.
1. Find the **Enable deletion of address records** setting and turn it **On**.
1. Select **Save** on the bottom of the page to save the changes.
