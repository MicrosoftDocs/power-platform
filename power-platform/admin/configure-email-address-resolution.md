---
title: Configure email address resolution behavior with the DoNotResolve flag   
description: By allowing the DoNotResolve flag for any email-formatted field, users ensure that only relevant fields contribute to resolution logic during server-side synchronization.
author: deeptibhalerao15
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/07/2025
ms.subservice: admin
ms.author: dbhalerao
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Configure email address resolution behavior with the DoNotResolve flag

In scenarios where multiple email-formatted fields exist within an entity, including a custom entity, it's essential to control which fields participate in email resolution to avoid unintended associations. The newly introduced **DoNotResolve** option provides administrators with fine-grained control over this behavior by allowing them to explicitly exclude specific email fields from the resolution process.
 
By allowing the **DoNotResolve** flag for any email-formatted field, users ensure that only relevant fields contribute to resolution logic during server-side synchronization. This reduces ambiguity and offers greater flexibility when designing data models that include email addresses not intended for resolution.

Here are some of the usage examples for the **DoNotResolve** option:

- **Standard entity example**: Consider a **Contact** entity that includes the built-in, primary email address field and the secondary email address field, which participates in email resolution by default. If you add another custom email field (such as for a spouse’s email address) that should not be used for resolution, you can allow the **DoNotResolve** flag on that field to prevent unintended associations.
- **Custom entity example**: In entities like **Sales Order**, customers may store email addresses for operational or reference purposes. These addresses are not meant to be resolved against incoming emails. By applying the **DoNotResolve** flag, you ensure that such fields remain excluded from the resolution logic.

## Metadata storage for DoNotResolve configuration
The metadata for the **DoNotResolve** setting is managed through the **emailaddressconfiguration** entity in Dynamics 365. Each record in this entity uniquely represents a combination of an entity ID (identifying the entity that contains the email-formatted field) and an attribute ID (corresponding to the specific email-formatted field). The configuration includes a boolean flag for DoNotResolve, which determines whether the field should be excluded from email resolution. Additionally, a state field indicates the active or inactive status of the configuration, and a name field provides a readable label for the setting. This structure ensures precise control and avoids duplication by enforcing uniqueness for each entity ID–attribute ID pair.

## Create DoNotResolve configuration in Dataverse
To configure the DoNotResolve setting for a specific email-formatted field, you can create a new record in the **emailaddressconfiguration** schema using the following steps.
Make a POST call using a REST client
```https://<ORG_URL>/api/data/v9.2/emailaddressconfigurations```
Be sure to replace the <ORG_URL> with the URL of the organization.

Sample Payload –
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
Key Fields -
1. The emailaddressconfigurationid must be a unique GUID.
2. The statecode should be set to "1" to mark the configuration as active.
3. The donotresolve flag must be set to true to exclude the field from email address resolution process.
4. The entityid and attributeid must reference valid attribute and entity guids in your environment. These ids can be retrieved from Entity and Attribute schemas respectively. 

## Transfer email address configuration settings between environments using solution import/export
1.	Create a custom solution
Navigate to Settings → Customizations → Solutions in your source environment.
Click New to create a custom solution. Provide a meaningful name and publisher.
2.	Add the “Email Address Configuration” component
Within the solution:
    - Click Add Existing.
    - Select Entity → Email Address Configuration.
3.	Select records to transfer
4.	Publish all customizations
Before exporting:
    - Click Publish All Customizations to ensure all changes are committed.
5.	Export the solution
    - In the solution list, select your custom solution.
    - Click Export.
    - Choose Unmanaged or Managed depending on your deployment strategy.
    - Save the resulting .zip file.
6.	Import into target environment
In the target environment:
    - Go to Settings → Customizations → Solutions → Import.
    - Upload the .zip file.
    - Follow the prompts to complete the import.
    - After import, verify that the Email Address Configuration records are present and active.
