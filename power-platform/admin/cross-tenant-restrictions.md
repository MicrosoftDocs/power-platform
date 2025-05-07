---
title: Restrict cross-tenant inbound and outbound access
description: Use tenant restrictions to control access to SaaS cloud applications based on the Microsoft Entra tenant. You can also enforce tenant isolation for Power Platform connections. 
ms.date: 04/23/2025
ms.topic: how-to
ms.assetid: 
author: mihaelablendea
ms.subservice: admin
ms.author: mihaelab
ms.reviewer: sericks
ms.custom: NewPPAC
search.audienceType: 
  - admin
contributors:
  - cmerino01 
  - jahnavisunil
  - akadrno
---

# Cross-tenant inbound and outbound restrictions

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Microsoft Power Platform has a rich ecosystem of connectors based on Microsoft Entra that allow authorized Microsoft Entra users to build compelling apps and flows establishing connections to the business data available through these data stores. Tenant isolation makes it easy for administrators to ensure that these connectors can be harnessed in a safe and secure way within the tenant while minimizing the risk of data exfiltration outside the tenant. Tenant isolation allows Power Platform administrators to effectively govern the movement of tenant data from Microsoft Entra authorized data sources to and from their tenant. 

Power Platform tenant isolation is different from Microsoft Entra ID-wide tenant restriction. It *doesn't* impact Microsoft Entra ID-based access outside of Power Platform. Power Platform tenant isolation only works for connectors using Microsoft Entra ID-based authentication such as Office 365 Outlook or SharePoint. 

> [!WARNING]
> There's a [known issue](#known-issues) with [Azure DevOps connector](/connectors/visualstudioteamservices/) that results in tenant isolation policy to not be enforced for connections established using this connector. If an insider attack vector is a concern, we recommend you limit using the connector or its actions using data policies.

The default configuration in Power Platform with tenant isolation **Off** is to allow cross-tenant connections to be established seamlessly, if the user from tenant A establishing the connection to tenant B presents appropriate Microsoft Entra credentials. If admins want to allow only a select set of tenants to establish connections to or from their tenant, they can turn tenant isolation **On**. 

With tenant isolation **On**, **all** tenants are restricted. Inbound (connections to the tenant from external tenants) and outbound (connections from the tenant to external tenants) cross-tenant connections are blocked by Power Platform even if the user presents valid credentials to the Microsoft Entra-secured data source. You can use rules to add exceptions.  

Admins can specify an explicit allow list of tenants that they want to allow **inbound**, **outbound**, or both, which bypasses tenant isolation controls when configured. Admins can use a special pattern “\*”  to allow *all* tenants in a specific direction when tenant isolation is turned on. All other cross-tenant connections except the ones in the allow list are rejected by Power Platform. 

Tenant isolation can be configured in the Power Platform admin center. It affects Power Platform canvas apps and Power Automate flows. To set up tenant isolation, you need to be a tenant admin. 

Power Platform tenant isolation ability is available with two options: one-way or two-way restriction.  

## Understand tenant isolation scenarios and impact

Before you begin configuring the tenant isolation restrictions, review the following list to understand the scenarios and impact of tenant isolation.

- Admin wants to turn on tenant isolation.
- Admin is concerned that existing apps and flows using cross tenant connections stop working.
- Admin decides to enable tenant isolation and add exception rules to eliminate the impact.
- Admin runs the cross-tenant isolation reports to determine the tenants that need to be exempt. More information: [Tutorial: Create cross tenant isolation reports (preview)](programmability-tutorial-cross-tenant-reporting.md)

## Two-way tenant isolation (inbound and outbound connection restriction) 

Two-way tenant isolation blocks connection establishment attempts to your tenant from other tenants. Additionally, two-way tenant isolation also blocks connection establishment attempts from your tenant to other tenants.

In this scenario, the tenant admin allows two-way tenant isolation on the Contoso tenant while the external Fabrikam tenant hasn't been added to the allow list.  

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
> A connection attempt initiated by a guest user, from their host tenant that targets data sources within the same host tenant, isn't evaluated by the tenant isolation rules.

## Tenant isolation with allow lists

One-way tenant isolation or inbound isolation blocks connection establishment attempts to your tenant from other tenants. 

### Scenario: Outbound allow list – Fabrikam is added to the outbound allow list of the Contoso tenant

In this scenario, the admin adds the Fabrikam tenant in the outbound allow list while tenant isolation is **On**.   

Users signed in to Power Platform in the Contoso tenant can establish outbound Microsoft Entra ID-based connections to data sources in the Fabrikam tenant if they present appropriate Microsoft Entra credentials to establish the connection. Outbound connection establishment to the Fabrikam tenant is permitted by virtue of the configured allowl ist entry. 

However, users signed in to Power Platform in the Fabrikam tenant still can't establish inbound Microsoft Entra ID-based connections to data sources in the Contoso tenant despite presenting appropriate Microsoft Entra credentials to establish the connection. Inbound connection establishment from the Fabrikam tenant is still disallowed even as the allow list entry is configured and permits outbound connections. 

|Connection creator tenant   |Connection sign-in tenant | Access allowed?   |
|---------|---------|---------|
|Contoso     | Contoso        | Yes         |
|Contoso (tenant isolation **On**) <br /> Fabrikam added to outbound allow list    | Fabrikam        | Yes         |
|Fabrikam     | Contoso (tenant isolation **On**) <br /> Fabrikam added to outbound allow list        | No (inbound)        |
|Fabrikam     | Fabrikam        | Yes        |

:::image type="content" source="media/restrict-inbound-cross-tenant.png" alt-text="Restrict inbound connection.":::

### Scenario: Bidirectional allow list – Fabrikam is added to the inbound and outbound allow lists of the Contoso tenant 

In this scenario, the admin adds the Fabrikam tenant to both the inbound and outbound allow lists while tenant isolation is **On**.   

|Connection creator tenant   |Connection sign-in tenant   |Access allowed?   |
|---------|---------|---------|
|Contoso     | Contoso        | Yes         |
|Contoso (tenant isolation **On**) <br /> Fabrikam added to both allow lists    | Fabrikam        | Yes         |
|Fabrikam     | Contoso (tenant isolation **On**) <br /> Fabrikam added to both allow lists        | Yes       |
|Fabrikam     | Fabrikam        | Yes        |

:::image type="content" source="media/allow-list-both-tenants.png" alt-text="Bidirectional allow lists.":::

## Allow tenant isolation and configure the allow list

# [New admin center](#tab/new)

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Security**. 
1. In the **Security** pane, select **Identity and access**.
1. In the **Identity and access management** page, select **Tenant isolation**.
1. To allow tenant isolation, turn on the **Restrict cross-tenant connections** option.
1. To allow cross tenant communication, select **Add exceptions** in the **Tenant isolation** pane.
   
    If tenant isolation is **Off**, you can still add or edit the exception list. However, the exception lists aren't enforced until you turn on tenant isolation.
   
1. From the **Allowed direction** dropdown list, select the direction of the allow list entry.
1. Enter the value of the allowed tenant as either the tenant domain or tenant ID in the **Tenant ID** field. Once saved, the entry gets added to the allow list along with other allowed tenants. If you use the tenant domain to add the allow list entry, the Power Platform admin center automatically calculates the tenant ID.
   
    You can use "*" as a special character to signify all tenants are allowed in the designated direction when tenant isolation is turned on.
   
1. Select **Save**.
 
# [Classic admin center](#tab/classic)
1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Policies > Tenant isolation**. The **Tenant Isolation** page appears.
1. To allow tenant isolation, turn the toggle **On**.

    If tenant isolation is **Off**, you can add or edit the rules in the allow list. However, these rules aren't enforced until you turn tenant isolation **On**.
   
1. To allow cross-tenant communications, select **New tenant rule** to configure the tenant isolation allow list.
1. From the **New tenant rule** pane, select the **Direction** dropdown list. Select the direction of the allow list entry.
1. Enter the value of the allowed tenant as either the tenant domain or tenant ID in the **Tenant Domain or ID** field. Once saved, the entry gets added to the rule list along with other allowed tenants.

    If you use the tenant domain to add the allow list entry, the Power Platform admin center automatically calculates the tenant ID.

    Once the entry appears in the list, the tenant ID and Microsoft Entra tenant name are displayed. In Microsoft Entra ID, tenant name is different from the tenant domain. The tenant name is unique for the tenant, but a tenant may have more than one domain name. 

    You can use "*" as a special character to signify all tenants are allowed in the designated direction when tenant isolation is turned on.
   
1. You can edit the direction of the tenant allow list entry based on business requirements. The **Tenant Domain or ID** field can't be edited in the **Edit tenant rule** page.
1. You can perform all the allow list operations like add, edit, and delete while tenant isolation is turned **On** or **Off**. Allow list entries do have an effect on the connection behavior when tenant isolation is turned **Off** since all cross-tenant connections are allowed.
1. Select **Save**.
---

> [!NOTE]
> - You must have a Power Platform administrator role to see and set the tenant isolation policy.
> - To ensure that tenant isolation doesn't block any calls when used, turn tenant isolation **On**, add a new tenant rule, set **Tenant ID** as "\*", and set allowed direction to **inbound** and **outbound**.
> - Due to technical limitations, the threshold limit for rules is 500.

You can perform all the allow list operations like add, edit, and delete while tenant isolation is turned **On** or **Off**. Allow list entries do have an effect on the connection behavior when tenant isolation is turned **Off** since all cross-tenant connections are allowed. 

## Design time impact on apps and flows

Users who create or edit a resource, affected by the tenant isolation policy, see a related error message. For example, Power Apps makers see the following error when they use cross-tenant connections in an app that's blocked by tenant isolation policies. The app doesn't add the connection.

:::image type="content" source="media/cross-tenant-error-one.png" alt-text="Error: The data didn't load correctly. Please try again.":::

Similarly, Power Automate makers see the following error when they try to save a flow that uses connections in a flow that's blocked by tenant isolation policies. The flow itself is saved, but it's marked as "Suspended" and isn't executed unless the maker resolves the data loss prevention policy (DLP) violation. 

:::image type="content" source="media/cross-tenant-error-two.png" alt-text="Error: Couldn't retrieve values. The dynamic invocation request failed with error - error text.":::

## Runtime impact on apps and flows

As an admin, you can decide to modify the tenant isolation policies for your tenant at any point. If apps and flows were created and executed in compliance with earlier tenant isolation policies, some of them might be negatively affected by any policy changes you make. Apps or flows that are in violation of the tenant isolation policy don't run successfully. For example, run history within Power Automate indicates that the flow run failed. Further, selecting the failed run shows details of the error.

For existing flows that don’t run successfully because of the latest tenant isolation policy, run history within Power Automate indicates that the flow run failed. 

:::image type="content" source="media/flow-run-history.png" alt-text="Flow run history list.":::

Selecting the failed run shows details of the failed flow run.

:::image type="content" source="media/flow-run-failure-details.png" alt-text="Flow run failure details.":::

> [!NOTE]
> It takes about an hour for the latest tenant isolation policy changes to be assessed against active apps and flows. This change isn't instantaneous. 

## Known issues

[Azure DevOps connector](/connectors/visualstudioteamservices) uses Microsoft Entra authentication as the identity provider, but uses its own OAuth flow and STS for authorizing and issuing a token. Since the token returned from the ADO flow based on that Connector’s configuration isn't from Microsoft Entra ID, the tenant isolation policy isn't enforced. As a mitigation, we recommend using other types of [data policies](wp-data-loss-prevention.md) to limit the use of the connector or its actions.


[!INCLUDE[footer-include](../includes/footer-banner.md)]
