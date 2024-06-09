---
title: Set address record settings
description: Learn how to prevent empty address records from being created and how to allow users to delete address data.
author: mkannapiran 
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/17/2024
ms.subservice: admin
ms.author: kamanick
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Set address record settings

This article explains how to prevent empty address records from being created and how to allow users to delete address data.

## Prevent empty address records from being created

The **Disable empty address record creation** setting helps you prevent address record creation in Dataverse when there's no data in the address segment of a payload. This feature only supports **Account** and **Contact** tables in Dataverse. Any other table that is associated with an address isn't impacted by this setting.

For example, suppose there's an incoming payload for the **Account** table and the address data is empty. If the **Disable empty address record creation** setting is set to **On**, it prevents an empty record from being created in Dataverse. However, if the same payload contains address data, then an address record is created in Dataverse.

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
- Through the user experience in Power Platform.
- Through bulk delete operations
- Through SDK.

Complete the following steps to allow users to delete address data.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane.
1. Select the checkmark next to an environment, and then select **Settings** in the command bar.
1. Select **Product** > **Features**.
1. Find the **Enable deletion of address records** setting and turn it **On**.
1. Select **Save** on the bottom of the page to save the changes.

> [!IMPORTANT]
> When deleting an address record, the related parent record (**Account** or **Contact**) is automatically updated by the system to reflect empty address information within the relevant address field(s).
