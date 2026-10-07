---
title: Filter-based security in Microsoft Dataverse (preview)
description: Learn how filter-based security grants row-level access in Microsoft Dataverse.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/30/2026
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: ellenwehrle
ms.contributors:
  - jdaly
ms.custom: "admin-security"
ai-usage: ai-assisted
search.audienceType: 
  - admin
---

# Filter-based security in Microsoft Dataverse (preview)

[!INCLUDE [cc-preview-features-top-note](../includes/cc-preview-features-top-note.md)]

Ownership-based security grants access through record ownership, teams, business units, and organization-level privileges. Filter-based security grants access through record data that satisfies filter criteria. For example, you can grant access to records whose City column contains *Redmond*, *Seattle*, or *Bellevue*.

You can use filter-based security with:

- Filtered record ownership tables.
- User or team record ownership tables.
- Organization record ownership tables.

> [!IMPORTANT]
>
> - This feature is in preview.
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

## Understand how filter-based security works

Configure filter-based security with two primary components:

- **Record Filter:** Uses FetchXML to identify records that qualify for access.
- **Entity Record Filter:** Associates a Record Filter with a Dataverse table.

When you associate a filter with a table, Dataverse creates filter privileges. Assign these privileges through security roles. When a user accesses data, Dataverse evaluates the filters from the user's security roles and team memberships. A matching filter grants the corresponding data access operation.

For filtered record ownership tables, filter privileges determine record access. For user or team, and organization record ownership tables, filter privileges add to access granted through the existing security model.

### Filter-based security components

| Component | Description |
|---|---|
| **Record Filter** | Stores the FetchXML filter definition. |
| **Entity Record Filter** | Associates a Record Filter with a Dataverse table. |
| **Filter privilege** | Grants filtered access for a specific data access operation. |
| **Security role** | Assigns filter privileges to users and teams. |

Dataverse combines all authorized filters from the user's security roles and team memberships. A record that matches any authorized filter receives the corresponding access.

## Compare ownership models

Filter-based security supports all Dataverse ownership types.

| **Capability** | **User or team-owned** | **Organization-owned** | **Filtered ownership** |
|----|----|----|----|
| **Supports a record owner** | Yes | No | No |
| **Supports assignment** | Yes | No | No |
| **Supports sharing** | Yes | No | No |
| **Supports business unit hierarchy access** | Yes | No | No |
| **Uses ownership-based privileges** | Yes | No | No |
| **Supports organization-wide access** | Through role privileges | Yes | Through the All records filter privilege |
| **Supports filter-based security** | Yes | Yes | Yes |
| **Uses only filters to determine access** | No | No | Yes |
| **Supports record reassignment** | Yes | No | No |
| **Typical use cases** | Accounts, cases, opportunities, and operational business data | Shared reference and configuration data | Attribute-based access control, entitlement-based access, geographic segmentation, and data classification |

## Choose an ownership model

Use user or team record ownership tables when records have a natural owner and business processes require assigning, sharing, manager visibility, or business unit hierarchy access.

Use organization record ownership tables when users broadly share records across the organization and don't need ownership.

Use filtered record ownership tables when business attributes must determine access instead of ownership. This model works well for attribute-based access control (ABAC), entitlement-based security, regulatory boundaries, and sensitivity-based authorization.

> [!NOTE]
> You can apply filter-based security to user or team, and organization record ownership, and filtered record ownership tables. Only filtered record ownership tables rely exclusively on filter privileges for record access.

## Filter-based security with filtered ownership tables

Filtered record ownership is a Dataverse ownership model that determines access entirely through filter privileges.

Filtered ownership tables don't use record owners.

Filtered ownership tables have the following characteristics:

- Don't contain record owners.
- Can't be assigned to users or teams.
- Can't be shared with users or teams.
- Don't use ownership-based security privileges.
- Determine access using filter privileges only.

> [!NOTE]
> When you create a filtered record ownership table, Dataverse creates a global **All records** filter privilege and grants it to the System Administrator security role.

## Create a filtered record ownership table

When you create a Dataverse table, select **Filtered** as the ownership type. For instructions, see [Filtered record ownership](/power-apps/maker/data-platform/filtered-view-record-ownership).

After you create the table:

1. Create one or more [Record Filters](/power-apps/maker/data-platform/filtered-view-record-ownership#create-filters).
1. Create [Entity Record Filters](/power-apps/maker/data-platform/filtered-view-record-ownership#create-an-entity-record-filter) to associate the filters with the table.
1. Grant the generated [filter privileges through security roles](/power-apps/maker/data-platform/filtered-view-record-ownership#create-and-assign-a-security-role).
1. Assign the security roles to users or teams.

## Apply filter-based security to user or team record ownership tables

You can also apply filter-based security to existing user or team record ownership tables.

Filter privileges add access to the existing ownership-based security model:

- Users continue to own records.
- You can continue to assign and share records.
- Business unit hierarchy access remains unchanged.
- Filter privileges grant additional row-level access.

For example, a salesperson can access opportunities they own. A filter can grant the salesperson access to additional opportunities in a specific territory.

The following filter grants access to active accounts in a specific territory:

```xml
<fetch
  version="1.0"
  output-format="xml-platform"
  mapping="logical"
  distinct="false">
  <entity name="account">
    <attribute name="entityimage_url" />
    <attribute name="statecode" />
    <attribute name="name" />
    <attribute name="address1_city" />
    <attribute name="primarycontactid" />
    <attribute name="telephone1" />
    <attribute name="accountid" />
    <attribute name="new_owningbuname" />
    <order attribute="name" descending="false" />
    <filter type="and">
      <condition
        attribute="territoryid"
        operator="eq"
        value="a440958c-f6bc-f111-aaad-000d3a84e349" />
      <condition
        attribute="statecode"
        operator="eq"
        value="0" />
    </filter>
  </entity>
</fetch>
```

The following example uses a `link-entity` to grant a salesperson access to active accounts owned by a colleague they cover for:

```xml
<fetch
  version="1.0"
  output-format="xml-platform"
  mapping="logical"
  distinct="true">
  <entity name="account">
    <attribute name="entityimage" />
    <attribute name="statecode" />
    <attribute name="name" />
    <attribute name="parentaccountid" />
    <attribute name="ownerid" />
    <attribute name="telephone1" />
    <attribute name="emailaddress1" />
    <attribute name="accountid" />
    <order attribute="name" descending="false" />
    <filter type="and">
      <condition
        attribute="statecode"
        operator="eq"
        value="0" />
    </filter>
    <link-entity
      name="crcd8_buddyrm"
      alias="buddy"
      link-type="inner"
      from="crcd8_rm"
      to="ownerid">
      <filter type="and">
        <condition
          attribute="crcd8_buddyrmname"
          operator="eq-userid" />
        <condition
          attribute="statecode"
          operator="eq"
          value="0" />
      </filter>
    </link-entity>
  </entity>
</fetch>
```

## Effective access

For user or team record ownership tables, filter privileges add row-level access to ownership-based security. They don't replace or reduce access granted through ownership, sharing, or security role privileges.

For filtered ownership tables, filter privileges determine record access. For organization record ownership tables, filter privileges add to access granted by security role privileges.

This additive model lets you introduce attribute-based access while preserving existing access rules.

For more information about ownership security, see [Ownership and access to records](wp-security-cds.md#tablerecord-ownership).

## Apply filter-based security to organization record ownership tables

You can also apply filter-based security to organization record ownership tables.

Standard privileges for an organization record ownership table grant access to all records in the table. Filter privileges provide another way to grant access to matching records. They don't reduce broader access that a security role already grants.

Common scenarios include:

- Territory-based access.
- Department-based access.
- Data classification controls.
- Shared reference data with scoped visibility.

For example, grant users access to records whose Territory column matches a specific region. Ensure their other security role privileges don't grant broader access to the same table.

Filter privileges add fine-grained authorization while preserving the organization record ownership data model.

For more information about organization record ownership tables, see [Ownership and access to records](wp-security-cds.md#tablerecord-ownership).

## Filter privileges

When you associate a Record Filter with a table through an Entity Record Filter, Dataverse creates filter privileges. Assign these privileges through security roles.

Filter privileges support these data access operations:

- **Create**.
- **Read**.
- **Write**.
- **Delete**.
- **Append**.
- **Append To**.

Each privilege is associated with a specific filter and a specific table.

The following example shows privileges for several city filters:

| **Filter** | **Privilege** |
|---|---|
| City = Redmond | Read |
| City = Redmond | Write |
| City = Redmond | Delete |
| City = Seattle | Read |
| City = Bellevue | Read |

Create multiple filters and assign different privileges to each security role as needed.

## Grant filter privileges in security roles

Manage filter privileges through Dataverse security roles.

To grant filtered access:

1. Open a security role.
2. Select the target table.
3. Select the filter privilege.
4. Grant the privilege to the role.
5. Assign the role to users or teams.

Users receive all filter privileges from their assigned security roles and team memberships.

For more information, see [Security roles and privileges](security-roles-privileges.md).

### Example

Suppose a Customer table includes a City column.

Create three Record Filters:

- City = Redmond.
- City = Seattle.
- City = Bellevue.

Associate each Record Filter with the Customer table by using Entity Record Filters.

Create three security roles:

| **Role** | **Filter privilege** |
|---|---|
| Redmond Sales | Read Customer where City = Redmond |
| Seattle Sales | Read Customer where City = Seattle |
| Bellevue Sales | Read Customer where City = Bellevue |

Each role grants access to customer records that match its filter. Users might have broader access through other roles, team memberships, ownership, or sharing.

## Summary

Filter-based security grants row-level access based on data values. Use Record Filters, Entity Record Filters, filter privileges, and security roles to implement attribute-based access control in Dataverse.

Add filter-based security with user or team, and organization record ownership tables to provide more data access through filter conditions. Choose the ownership model that fits your business requirements. Remember that only filtered ownership tables use filters as the exclusive source of record access.

## Next steps

- Learn how to configure filtered ownership tables in [Filtered record ownership](/power-apps/maker/data-platform/filtered-view-record-ownership).
- Learn how to apply filters to existing record ownership models in [Add filtered view security to record ownership tables](/power-apps/maker/data-platform/add-filtered-view-security-ownership-tables).
- Learn more about the Dataverse security architecture in [Security concepts in Microsoft Dataverse](wp-security-cds.md).

## Related information

- [Ownership-based security](wp-security-cds.md)
- [Filtered record ownership](/power-apps/maker/data-platform/filtered-view-record-ownership)
- [Add filtered view security to record ownership tables](/power-apps/maker/data-platform/add-filtered-view-security-ownership-tables)
- [Security roles and privileges](security-roles-privileges.md)
- [Ownership and access to records](wp-security-cds.md#tablerecord-ownership)
