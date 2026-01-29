---
title: Configure email resolution with the DoNotResolve Flag
description: Learn how the DoNotResolve flag on the email-formatted field ensures that only relevant fields contribute to resolution logic during server-side synchronization.
author: deeptibhalerao15
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/14/2025
ms.subservice: admin
ms.author: dbhalerao
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Configure email address resolution behavior with the DoNotResolve flag

When an entity contains multiple email-formatted fields, including a custom entity, you need to control which fields participate in email resolution. Without this control, incoming emails can resolve to unitended records. 

The newly introduced **DoNotResolve** option gives administrators precise control by allowing them to explicitly exclude specific email fields from the resolution process.
 
When you set the **DoNotResolve** flag on an email-formatted field, only the relevant fields contribute to email resolution logic during server-side synchronization. This reduces ambiguity and helps you design data models that store email addresses that aren't intended to resolve incoming messages.

Here are some of the usage examples for the **DoNotResolve** option:

- **Standard entity example**: Consider a **Contact** entity that includes the built-in, primary email address field and the secondary email address field, which participates in email resolution by default. If you add another custom email field (such as for a spouse’s email address) that shouldn't be used for resolution, you can add the **DoNotResolve** flag on that field to prevent unintended associations.
- **Custom entity example**: In entities such as **Sales Order**, customers may store email addresses for operational or reference purposes. These addresses aren't meant to resolve incoming emails. By applying the **DoNotResolve** flag, you ensure that such fields remain excluded from the resolution logic.

## Metadata storage for the DoNotResolve configuration

Dynamics 365 stores **DoNotResolve** metadata in the **emailaddressconfiguration** entity. Each record represents a unique combination of:

- An entity ID that identifies the entity that contains the email-formatted field.
- Attribute ID that identifies the specific email-formatted field.

The configuration includes: 

- A Boolean flag for **DoNotResolve** value that determines whether the field should be excluded from email resolution.
- A state field that indicates whether the configuration is active or inactive.
- A name field that provides a readable label for the setting.

This structure ensures precise control and avoids duplication by enforcing uniqueness for each entity ID and attribute ID pair.

## Create the DoNotResolve configuration

To configure the **DoNotResolve** setting for a specific email-formatted field, you can create a new record in the **emailaddressconfiguration** schema using the following steps.

1. Make a POST call using a REST client.

    ```https://<ORG_URL>/api/data/v9.2/emailaddressconfigurations```
   
1. Replace the **<ORG_URL>** with the URL of the organization.

Here's a sample payload:

```
{
        "emailaddressconfigurationid": <unique config GUID>,
        "statecode": "1",
        "name": "<Configuration Name>", 
        "donotresolve": true,
        "AttributeId_EmailAddressConfiguration@odata.bind": "/attributes(<GUID>)", 
        "EntityId_EmailAddressConfiguration@odata.bind": "/entities(<GUID>)" 
}
```

Key fields include:
- **emailaddressconfigurationid**: A unique GUID for the configuration.
- **statecode**: Set to **1** to mark the configuration as active.
- **donotresolve**: Set to **true** to exclude the field from email address resolution.
- **entityid** and **attributeid**: References to valid entity and attribute GUIDs in your environment. You can retrieve these values from the **Entity** and **Attribute** schemas, respectively.  

## Transfer email address configuration settings between environments

You can move Email Address Configuration records between environments by using solution export and import.

1.	Create a custom solution in your source environment:
    1. Go to **Settings** > **Customizations** > **Solutions**.
    1. Select **New** and then provide a name and publisher.
1.	Add the **Email Address Configuration** component within the solution:
    1. Select **Add Existing**.
    1. Select **Entity** > **Email Address Configuration**.
1.	Select the records to include.
1.	Publish all customizations before exporting. Select **Publish All Customizations** to ensure all changes are committed.
1.	Export the solution:
    1. In the solution list, select your custom solution.
    1. Select **Export**.
    1. Choose **Unmanaged** or **Managed** depending on your deployment strategy.
    1. Save the .zip file.
1.	Import the solution into the target environment.
    1. Go to **Settings** > **Customizations** > **Solutions** > **Import**.
    1. Upload the .zip file.
    1. Follow the prompts to complete the import.
    1. After import, verify that the **Email Address Configuration** records are present and active.
