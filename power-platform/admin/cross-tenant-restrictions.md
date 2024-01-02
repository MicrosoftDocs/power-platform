---
title: Restrict cross-tenant inbound and outbound access
description: "Use tenant restrictions to control access to SaaS cloud applications based on the Microsoft Entra tenant. You can also enforce tenant isolation for Power Platform connections."  
ms.date: 10/12/2023
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: conceptual
applies_to: 
  - "Dynamics 365 (online)"
ms.assetid: 
author: mihaelablendea
ms.subservice: admin
ms.author: mihaelab
ms.reviewer: sericks
ms.custom: "admin-security"
search.audienceType: 
  - admin
---

# Cross-tenant inbound and outbound restrictions

Microsoft Power Platform has a rich ecosystem of connectors based on Microsoft Entra that allow authorized Microsoft Entra users to build compelling apps and flows establishing connections to the business data available through these data stores. Tenant isolation makes it easy for administrators to ensure that these connectors can be harnessed in a safe and secure way within the tenant while minimizing the risk of data exfiltration outside the tenant. Tenant isolation allows Global administrators and Power Platform administrators to effectively govern the movement of tenant data from Microsoft Entra authorized data sources to and from their tenant. 

Note that Power Platform tenant isolation is different from Microsoft Entra ID-wide tenant restriction. It *doesn't* impact Microsoft Entra ID-based access outside of Power Platform. Power Platform tenant isolation only works for connectors using Microsoft Entra ID-based authentication such as Office 365 Outlook or SharePoint. 

> [!WARNING]
> There is a [known issue](#known-issues) with [Azure DevOps connector](/connectors/visualstudioteamservices/) that results in tenant isolation policy to not be enforced for connections established using this connector. If an insider attack vector is a concern, it is recommended to limit using the connector or its actions using data policies.

The default configuration in Power Platform with tenant isolation **Off** is to allow cross-tenant connections to be established seamlessly, if the user from tenant A establishing the connection to tenant B presents appropriate Microsoft Entra credentials. If admins want to allow only a select set of tenants to establish connections to or from their tenant, they can turn tenant isolation **On**. 

With tenant isolation **On**, **all** tenants are restricted. Inbound (connections to the tenant from external tenants) and outbound (connections from the tenant to external tenants) cross-tenant connections are blocked by Power Platform even if the user presents valid credentials to the Microsoft Entra-secured data source. You can use rules to add exceptions.  

Admins can specify an explicit allowlist of tenants that they want to enable **inbound**, **outbound**, or both, which will bypass tenant isolation controls when configured. Admins can use a special pattern “\*”  to allow *all* tenants in a specific direction when tenant isolation is turned on. All other cross-tenant connections except the ones in the allowlist are rejected by Power Platform. 

Tenant isolation can be configured in the Power Platform admin center. It affects Power Platform canvas apps and Power Automate flows. To set up tenant isolation, you need to be a tenant admin. 

Power Platform tenant isolation ability is available with two options: one-way or two-way restriction.  

## Understand tenant isolation scenarios and impact

Before you begin configuring the tenant isolation restrictions, review the following list to understand the scenarios and impact of tenant isolation.

- Admin wants to turn tenant isolation on.
- Admin is concerned that existing apps and flows using cross tenant connections will stop working.
- Admin decides to enable tenant isolation and add exception rules to eliminate the impact.
- Admin runs the cross-tenant isolation reports to determine the tenants that need to be exempt. More information: [Tutorial: Create cross tenant isolation reports (preview)](programmability-tutorial-cross-tenant-reporting.md)

## Two-way tenant isolation (inbound and outbound connection restriction) 

Two-way tenant isolation will block connection establishment attempts to your tenant from other tenants. Additionally, two-way tenant isolation will also block connection establishment attempts from your tenant to other tenants.

In this scenario, the tenant admin has enabled two-way tenant isolation on the Contoso tenant while the external Fabrikam tenant hasn't been added to the allowlist.  

Users signed in to Power Platform in the Contoso tenant can’t establish outbound Microsoft Entra ID-based connections to data sources in the Fabrikam tenant despite presenting appropriate Microsoft Entra credentials to establish the connection. This is outbound tenant isolation for the Contoso tenant.  

Similarly, users signed in to Power Platform in the Fabrikam tenant can’t establish inbound Microsoft Entra ID-based connections to data sources in the Contoso tenant despite presenting appropriate Microsoft Entra credentials to establish the connection. This is inbound tenant isolation for the Contoso tenant. 

|Connection creator tenant   |Connection sign-in tenant   | Access allowed?   |
|---------|---------|---------|
|Contoso     | Contoso        | Yes         |
|Contoso (tenant isolation **On**)    | Fabrikam        | No (outbound)         |
|Fabrikam     | Contoso (tenant isolation **On**)           | No (inbound)        |
|Fabrikam     | Fabrikam        | Yes        |

![Restrict outbound and inbound cross-tenant access.](media/restrict-outbound-inbound-cross-tenant.png "Restrict outbound and inbound cross-tenant access")

> [!NOTE]
> A connection attempt initiated by a guest user from their host tenant targeting data sources within the same host tenant is not evaluated by the tenant isolation rules.

## Tenant isolation with allowlists

One-way tenant isolation or inbound isolation will block connection establishment attempts to your tenant from other tenants. 

### Scenario: Outbound allowlist – Fabrikam is added to the outbound allowlist of the Contoso tenant

In this scenario, the admin adds the Fabrikam tenant in the outbound allowlist while tenant isolation is **On**.   

Users signed in to Power Platform in the Contoso tenant can establish outbound Microsoft Entra ID-based connections to data sources in the Fabrikam tenant if they present appropriate Microsoft Entra credentials to establish the connection. Outbound connection establishment to the Fabrikam tenant is permitted by virtue of the configured allowlist entry. 

However, users signed in to Power Platform in the Fabrikam tenant still can't establish inbound Microsoft Entra ID-based connections to data sources in the Contoso tenant despite presenting appropriate Microsoft Entra credentials to establish the connection. Inbound connection establishment from the Fabrikam tenant is still disallowed even as the allowlist entry is configured and permits outbound connections. 

|Connection creator tenant   |Connection sign-in tenant | Access allowed?   |
|---------|---------|---------|
|Contoso     | Contoso        | Yes         |
|Contoso (tenant isolation **On**) <br /> Fabrikam added to outbound allowlist    | Fabrikam        | Yes         |
|Fabrikam     | Contoso (tenant isolation **On**) <br /> Fabrikam added to outbound allowlist        | No (inbound)        |
|Fabrikam     | Fabrikam        | Yes        |

:::image type="content" source="media/restrict-inbound-cross-tenant.png" alt-text="Restrict inbound connection.":::

### Scenario: Bidirectional allowlist – Fabrikam is added to the inbound and outbound allowlists of the Contoso tenant 

In this scenario, the admin adds the Fabrikam tenant to both the inbound and outbound allowlists while tenant isolation is **On**.   

|Connection creator tenant   |Connection sign-in tenant   |Access allowed?   |
|---------|---------|---------|
|Contoso     | Contoso        | Yes         |
|Contoso (tenant isolation **On**) <br /> Fabrikam added to both allowlists    | Fabrikam        | Yes         |
|Fabrikam     | Contoso (tenant isolation **On**) <br /> Fabrikam added to both allowlists        | Yes       |
|Fabrikam     | Fabrikam        | Yes        |

:::image type="content" source="media/allow-list-both-tenants.png" alt-text="Bidirectional allow lists.":::


## Enable tenant isolation and configure allowlist

In the Power Platform admin center, tenant isolation is set with **Policies** > **Tenant isolation**.  

> [!NOTE]
> You must have a Global administrator role or a Power Platform administrator role to see and set the tenant isolation policy.

:::image type="content" source="media/enable-tenant-isolation.png" alt-text="Enable tenant isolation.":::

The tenant isolation allowlist can be configured by using **New tenant rule** on the **Tenant Isolation** page. If tenant isolation is **Off**, you can add or edit the rules in the list. However, these rules won't be enforced until you turn tenant isolation **On**. 

:::image type="content" source="media/new-tenant-rule.png" alt-text="New tenant rule to add rule to the allow list.":::

From the **New tenant rule Direction** dropdown list, choose the direction of the allowlist entry.   

:::image type="content" source="media/new-tenant-rule-select-direction.png" alt-text="Select the direction for the new tenant rule.":::

You can also enter the value of the allowed tenant as either tenant domain or tenant ID. Once saved, the entry gets added to the rule list along with other allowed tenants. If you use the tenant domain to add the allowlist entry, the Power Platform admin center automatically calculates the tenant ID. 

:::image type="content" source="media/new-tenant-rule-select-tenant-domain-id.png" alt-text="Select tenant domain or tenant ID for the new tenant rule.":::

Once the entry appears in the list, **Tenant ID** and **Microsoft Entra tenant name** fields are displayed. Note that in Microsoft Entra ID, tenant name is different from the tenant domain. The tenant name is unique for the tenant, but a tenant may have more than one domain name. 

:::image type="content" source="media/new-tenant-rule-in-allow-list.png" alt-text="New tenant rule appears in allowlist.":::

You can use "\*" as a special character to signify all tenants are allowed in the designated direction when tenant isolation is turned **On**. 

:::image type="content" source="media/new-tenant-rule-all-tenants.png" alt-text="All tenants are allowed in the designated direction when tenant isolation is turned on.":::

You can edit the direction of the tenant allowlist entry based on business requirements. Note that the **Tenant Domain or ID** field can't be edited in the **Edit tenant rule** page. 

:::image type="content" source="media/edit-tenant-rule.png" alt-text="Edit a tenant rule.":::

You can perform all the allowlist operations like add, edit, and delete while tenant isolation is turned **On** or **Off**. Allowlist entries do have an effect on the connection behavior when tenant isolation is turned **Off** since all cross-tenant connections are allowed. 

## Design time impact on apps and flows

Users who create or edit a resource affected by the tenant isolation policy will see a related error message. For example, Power Apps makers will see the following error when they use cross-tenant connections in an app that is blocked by tenant isolation policies. The app won't add the connection.

:::image type="content" source="media/cross-tenant-error-one.png" alt-text="Error: The data didn't load correctly. Please try again.":::

Similarly, Power Automate makers will see the following error when they try to save a flow that uses connections in a flow that is blocked by tenant isolation policies. The flow itself will be saved, but it will be marked as "Suspended" and won't be executed unless the maker resolves the data loss prevention policy (DLP) violation. 

:::image type="content" source="media/cross-tenant-error-two.png" alt-text="Error: Couldn't retrieve values. The dynamic invocation request failed with error - error text.":::

## Runtime impact on apps and flows

As an admin, you can decide to modify the tenant isolation policies for your tenant at any point. If apps and flows were created and executed in compliance with earlier tenant isolation policies, some of them might be negatively affected by any policy changes you make. Apps or flows that are in violation of the tenant isolation policy won't run successfully. For example, run history within Power Automate indicates that the flow run failed. Further, selecting the failed run will show details of the error.

For existing flows that don’t run successfully because of the latest tenant isolation policy, run history within Power Automate indicates that the flow run failed. 

:::image type="content" source="media/flow-run-history.png" alt-text="Flow run history list.":::

Selecting the failed run will show details of the failed flow run.

:::image type="content" source="media/flow-run-failure-details.png" alt-text="Flow run failure details.":::

> [!NOTE]
> It takes about an hour for the latest tenant isolation policy changes to be assessed against active apps and flows. This change isn't instantaneous. 

## Known issues

[Azure DevOps connector](/connectors/visualstudioteamservices) uses Microsoft Entra authentication as the identity provider, but uses its own OAuth flow and STS for authorizing and issuing a token. Since the token returned from the ADO flow based on that Connector’s configuration is not from Microsoft Entra ID, the tenant isolation policy is not enforced. As a mitigation, we recomend using other types of [data policies](wp-data-loss-prevention.md) to limit the use of the connector or its actions.


[!INCLUDE[footer-include](../includes/footer-banner.md)]