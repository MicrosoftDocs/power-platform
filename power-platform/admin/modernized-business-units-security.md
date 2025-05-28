---
title: Modernized business units security
description: Learn more about modernized business units security in Microsoft Dataverse.
ms.date: 03/13/2025
ms.topic: concept-article
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks
ms.custom: "admin-security"
search.audienceType: 
  - admin
---

# Modernized business units security
[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

In today's dynamic business environment, the ability to seamlessly manage and interact with multiple business units is crucial for operational efficiency and strategic growth. The [modernized business units](wp-security-cds.md#matrix-data-access-structure-modernized-business-units) feature in Dataverse offers a robust solution to this need, enabling users to navigate and collaborate across various business units securely and with ease.  

In a traditional business units security hierarchy, users are restricted to their respective business units and can't access other units. However, in a matrix organization, users work across multiple business units and projects, requiring access to data in those units. The modernized business units feature allows administrators to assign access to data for these cross-functional users across different business units securely and easily.

> [!VIDEO d2a0954d-ee76-483d-81d3-67cbb2c23762]

## How does it work?

To secure record access, the owning business unit column determines which business unit owns the record. To grant data access, a security role with privileges to the owning business unit provides user access to the records. In this model, the user’s business unit is no longer relevant in determining the user’s access to records. The owner of the record remains with the user who owns it regardless of their business unit.

> [!NOTE]
> You no longer need to use Teams ownership to grant users from different business units the ability to share your business unit record.  

The following diagram shows that user A is assigned a security role from business unit division A and B. User A has access to the contact records that belong to these two divisions.

:::image type="content" source="media/modernized-business-units-security/security-roles.png" alt-text="Diagram that shows two divisions of a business and the users and contact information for each division.":::

## How do I use it?

Modernized business units security can be used similarly to the following use case examples.

### Interacting with multiple business units

Users can seamlessly interchange between business units and access them regardless of their own business unit. This capability is essential for users that require oversight and interaction across different business units of the organization.

For example, you have three business units—sales, service, and marketing—and a line manager requires access to the business account information. The line manager should be assigned a security role that has access to account records from each of these business units.

### Record ownership across business units

Users can create or be assigned to records in different business units. When a record is created, users with privileges to multiple business units can select that record's owning business. Data access to records is granted based on the owning business unit.

For example, when a line manager creates an account record, they need to select which business unit (sales, service, or marketing) belongs to the account. Once the record is created, any user who has a security role with permission to the account table in that business unit can access the record.

### User level access in the matrix data access structure

The [matrix data access structure](wp-security-cds.md#matrix-data-access-structure-modernized-business-units) allows for granular control over user access levels. Users can have read/write access to records in one business unit while ensuring that records in another business unit remain private and inaccessible to unauthorized users. This setup is useful for maintaining data privacy and security across different business units. For example sales, service, or marketing users are only assigned security roles from their respective business units. These users don't have access to other business units’ records.  

### Securing access to business unit emails

The business units security feature addresses common issues around granting email record access. For example, a *service* line manager needs to read the emails in the *sales* business unit. Normally, line managers can see all emails from other departments.

With the business units security feature, the service line manager is granted only a *sales* business unit’s security role with basic read permissions for account and email. The service line manager isn't given access to *service* or *marketing* accounts, therefore they're able to read emails of the *sales* account only.

## How do I turn on the feature?

To turn on the business units security feature, see [Security concepts in Microsoft Dataverse](wp-security-cds.md#enable-the-matrix-data-access-structure).  

The feature takes a few minutes to turn on, as it needs time to set the *Owning business unit* column. Once the *Owning business unit* column is set, it can be pulled into a form or into a view. For existing environments with multiple business units (with the upgrade to modernized business units), we recommended you perform:

1. Impact analysis on all the business units.
1. Prepare a user RACI (responsible, accountable, consulted, and informed) chart at the business unit record level. This chart helps define the appropriate security roles.
1. Create migration plans to upgrade to the new business unit model, for example one business unit at a time. This plan should include removing record ownership through Teams.
1. Modify all input forms to include the *Owning business unit* column and add automation to set it to the correct owning business unit by default. The privileged user should be able to override the column.

With the modernized business units feature, organizations can achieve greater flexibility, security, and efficiency in managing their business units, ultimately driving better business outcomes.
