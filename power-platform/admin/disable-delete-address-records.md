---
title: Set address record settings
description: Disable empty address records and Delete address records in Dataverse
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

This article explains how to prevent empty addresss records from being created and how to allow deletion of address records.

## Prevent empty addresss records from being created

The **Disable empty address record creation** setting helps you prevent address record creation in Dataverse when there is no data in the address segment of a payload. This feature only supports **Account** and **Contact** tables in Dataverse. Any other table that is associated with an address isn't impacted by this setting.

For example, suppose there is an incoming payload for the **Account** table and the address data is empty. If the **Disable empty address record creation** setting is set to **On**, it prevents an empty record from being created in Dataverse. However, if the same payload contains address data, then an address record is created in Dataverse.

> [!Note]
> Turning on the **Disable empty address record creation** setting doesn't remove existing empty address records. 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Environments** in the navigation pane.
1. Select the checkmark next to an environment, and then select **Settings** in the command bar.
1. Select **Product** > **Features**.
1. Find the **Disable Empty Address Record Creation** setting and turn it **On**.
1. Select **Save** on the bottom of the page to save the changes.

## Delete Address Data in Dataverse 

### Overview 

**Delete Address Data in Dataverse** is a feature that allows an user to delete address data in Dataverse when this feature is turned on in settings. The default setting for this features is Off, which by default will not allow users to delete address records in Dataverse. Address record deletion capability is applicable only for Account and Contact tables in Dataverse.

Enabling "Deletion of Address Records" feature in Dataverse allows address records to be deleted through the user experience in Power Platform or through bulk delete operation or through SDK. 

### Configuration required to Enable Deletion of address records

Navigate to Power Platform Admin Center (PPAC).
Click **Environments** option on the left side panel.

Select an environment from the list for which this feature needs to be enabled. Click on **Settings** on the menu bar on the top.

Expand **Product** and click on **Features** to navigate to features settings page.

Turn On or Off the settings for **Enable Deletion of Address Records** 

click Save on the bottom of the page to save the changes.

### How does this feature work

The Power Platform environment where this setting is enabled will allow deletion of address records in Dataverse. 
Enable this capability only if Dataverse is source of the address data.
