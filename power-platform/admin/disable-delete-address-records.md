---
title: "Delete or Disable Address records  | MicrosoftDocs"
description: Disable empty address records and Delete address records in Dataverse
author: sericks007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/05/2024
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
## Disable Empty Record Creation

### Overview

The disable empty record creation feature helps you to prevent address record creation in Dataverse when there is no data in the address segment of payload. This feature only supports Account and Contact tables in Dataverse.

For example if there is an incoming payload for Account table and the address data is empty, this feature if turned on will prevent an empty record creation in Dataverse. However if the same payload contains address data then it will allow address record creation in Dataverse.

### Configuration required to disable empty record creation

Navigate to Power Platform Admin Center (PPAC) and Click **Environments** option on the left side panel.
Select an environment from the list for which this feature needs to be enabled.  
Click on **Settings** on the top of the page and on the next page, navigate to **Product** and **Features** settings page.
Scroll down the **Features** setting page to enable **Disable Empty Address Record Creation** 
click Save on the bottom of the page to save the changes.

### How does this feature work

The Power Platform Environment where the **Disable Empty Address Record Creation** is enabled, an address record will not be created if incoming payload does not contain data in address info. This feature ensures that an address record will be created only if the incoming payload contains address data.
**Note**: Enabling this feature does not remove existing empty address records. 

The **Disable Empty Address Record Creation** setting is applicable only for Account and Contact tables in Dataverse. Any other table that is associated with an address will not be impacted by this setting. For example if a table named Warehouse or Location has address associated with it and the incoming payload has empty address data, an empty address data record will be created for Warehouse or Location tables.

The user can add or remove the **Disable Empty Address Record Creation** setting anytime. However the changes to setting will not have any impact on its previous setting. For example If **Disable Empty Address Record Creation** was enabled earlier and the user turned it off later, the system will NOT backfill any missing empty address table records. And Microsoft does not support to manually backfill those empty address records.

## Delete Address Data in Dataverse 

### Overview 

**Delete Address Data in Dataverse** is a feature that allows an user to delete address data in Dataverse when this feature is turned on in settings. The default setting for this features is Off, which by default will not allow users to delete address records in Dataverse. Address record deletion capability is applicable only for Account and Contact tables in Dataverse.

Enabling "Deletion of Address Records" feature in Dataverse allows address records to be deleted through the user experience in Power Platform or through bulk delete operation or through SDK. 

### Configuration required to Enable Deletion of address records

Navigate to Power Platform Admin Center (PPAC) and click on **Environments** option on the left side panel.
Choose the radio button corresponding to the environment that needs "Disable empty record creation" feature enabled. 
Click on **Settings** on the top of the page and on the next page, navigate to **Product** and **Features** settings page.
Scroll down the **Features** setting page to enable **Enable Deletion of Address Records** 
click Save on the bottom of the page to save the changes.

### How does this feature work

The Power Platform environment where this setting is enabled will allow deletion of address records in Dataverse. 
Enable this capability only if Dataverse is source of the address data.
