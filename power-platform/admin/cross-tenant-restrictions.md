---
title: "Restrict cross-tenant inbound and outbound access"
description: "Use tenant restrictions to control access to SaaS cloud applications based on the Azure AD tenant. You can also enforce tenant isolation for Power Platform connections."  
ms.date: 05/04/2021
ms.service: power-platform
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
ms.assetid: 
caps.latest.revision: 63
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Cross-tenant inbound and outbound restrictions

Microsoft Power Platform has a rich ecosystem of Azure Active Directory (Azure AD) based connectors that allow authorized Azure AD users to build compelling apps and flows establishing connections to the business data available through these data stores. Tenant isolation makes it easy for administrators to ensure that these connectors can be harnessed in a safe and secure way within the tenant while minimizing the risk of data exfiltration outside the tenant. Tenant isolation allows admins to effectively govern the movement of tenant data from Azure AD authorized data sources to and from their tenant. Note that Power Platform tenant isolation is different from Azure AD-wide tenant restriction. It *does not* impact Azure AD-based access outside of Power Platform. Power Platform tenant isolation only works for connectors using Azure AD-based authentication such as Office 365 Outlook or Sharepoint. 

The default configuration in Power Platform with tenant isolation **Off** is to allow cross-tenant connections to be established seamlessly, if the user from tenant A establishing the connection to tenant B presents appropriate Azure AD credentials. If admins want to allow only a select set of tenants to establish connections to or from their tenant, they can turn tenant isolation **On**. 

Once tenant isolation is turned on, inbound (connections to the tenant from external tenants) as well as outbound (connections from the tenant to external tenants) cross-tenant connections are blocked by Power Platform even if the user presents valid credentials to the Azure AD-secured data source.  

Admins can specify an explicit allow list of tenants that they want to enable **inbound**, **outbound**, or both **inbound** and **outbound** which will bypass tenant isolation controls when configured. Admins can use a special pattern “\*”  to allow *all* tenants in a specific direction when tenant isolation is turned on. All other cross-tenant connections except the ones in the allow list are rejected by Power Platform. 

Tenant isolation can be configured in the Power Platform admin center. It affects Power Platform canvas apps and Power Automate flows. To set up Tenant Isolation, you need to be a tenant admin. 

Power Platform tenant isolation ability is available with two options: one-way or two-way restriction.  

## Two-way tenant isolation (inbound and outbound connection restriction) 

Two-way tenant isolation will block connection establishment attempts to your tenant from other tenants. Additionally, two-way tenant isolation will also block connection establishment attempts from your tenant to other tenants.

In this scenario, the tenant admin has enabled two-way tenant isolation on the Contoso tenant while the external Fabrikam tenant has not been added to the allow list.  

Users logged in to Power Platform in the Contoso tenant cannot establish outbound Azure-AD based connections to data sources in the Fabrikam tenant despite presenting appropriate Azure AD credentials to establish the connection. This is outbound tenant isolation for the Contoso tenant.  

Similarly, users logged in to Power Platform in the Fabrikam tenant cannot establish inbound Azure AD-based connections to data sources in the Contoso tenant despite presenting appropriate Azure AD credentials to establish the connection. This is inbound tenant isolation for Contoso tenant. 

|Connection creator tenant   |Connection sign-in tenant   | Access allowed?   |
|---------|---------|---------|
|Contoso     | Contoso        | Yes         |
|Contoso (tenant isolation **On**)    | Fabrikam        | No (outbound)         |
|Fabrikam     | Contoso (tenant isolation **On**)           | No (inbound)        |
|Fabrikam     | Fabrikam        | Yes        |

![Restrict outbound and inbound cross-tenant access.](media/restrict-outbound-inbound-cross-tenant.png "Restrict outbound and inbound cross-tenant access")

## Tenant isolation with allow lists

One-way tenant isolation or inbound isolation will block connection establishment attempts to your tenant from other tenants. 

### Scenario: Outbound allow list - Fabrikam is added to the outbound allow list of the Contoso tenant

In this scenario, the admin adds the Fabrikam tenant in the outbound allow list while tenant isolation is **On**.   

Users logged in to Power Platform in the Contoso tenant can establish outbound Azure AD-based connections to data sources in the Fabrikam tenant if they present appropriate Azure AD credentials to establish the connection. Outbound connection establishment to Fabrikam tenant is permitted by virtue of the configured allow list entry. 

However, users logged in to Power Platform in the Fabrikam tenant still can't establish inbound Azure AD-based connections to data sources in the Contoso tenant despite presenting appropriate Azure AD credentials to establish the connection. Inbound connection establishment from Fabrikam tenant is still disallowed even as the allow list entry is configured and permits outbound connections. 

|Connection creator tenant   |Connection sign-in tenant | Access allowed?   |
|---------|---------|---------|
|Contoso     | Contoso        | Yes         |
|Contoso (tenant isolation **On**) <br /> Fabrikam added to outbound allow list    | Fabrikam        | Yes         |
|Fabrikam     | Contoso (tenant isolation **On**) <br /> Fabrikam added to outbound allow list        | No (inbound)        |
|Fabrikam     | Fabrikam        | Yes        |

:::image type="content" source="media/restrict-inbound-cross-tenant.png" alt-text="Restrict inbound connection":::

### Scenario: Bi-directional allow list - Fabrikam is added to the inbound and outbound allow lists of the Contoso tenant 

In this scenario, the admin adds the Fabrikam tenant to both the inbound and outbound allow lists while tenant isolation is **On**.   

|Connection creator tenant   |Connection sign-in tenant   |Access allowed?   |
|---------|---------|---------|
|Contoso     | Contoso        | Yes         |
|Contoso (tenant isolation **On**) <br /> Fabrikam added to both allow lists    | Fabrikam        | Yes         |
|Fabrikam     | Contoso (tenant isolation **On**) <br /> Fabrikam added to both allow lists        | Yes       |
|Fabrikam     | Fabrikam        | Yes        |

:::image type="content" source="media/allow-list-both-tenants.png" alt-text="Bi-directional allow lists":::


## Enable tenant isolation and configure allow list

In the Power Platform admin center, tenant isolation is set with **Policies** -> **Tenant isolation**.  

:::image type="content" source="media/enable-tenant-isolation.png" alt-text="Enable tenant isolation":::

The tenant isolation Allow List can be configured by using **New tenant rule** on the **Tenant Isolation** page. If tenant isolation is **Off**, you can add or edit the rules in the list. However, these rules will not be enforced until you turn tenant isolation **On**. 

:::image type="content" source="media/new-tenant-rule.png" alt-text="New tenant rule to add rule to the allow list":::

From the **New tenant rule Direction** drop-down list, choose the direction of the allow list entry.   

:::image type="content" source="media/new-tenant-rule-select-direction.png" alt-text="Select the direction for the new tenant rule":::

You can also enter the value of the allowed tenant as either tenant domain or tenant ID. Once saved the entry gets added to the rule list along with other allowed tenants. If you use the tenant domain to add the allow list entry, the Power Platform admin center auto calculates the tenant ID. 

:::image type="content" source="media/new-tenant-rule-select-tenant-domain-id.png" alt-text="Select tenant domain or tenant ID for the new tenant rule":::

Once the entry appears in the list, **Tenant ID** and **Azure AD tenant name** fields are displayed. Note that in Azure AD tenant name is a different from the tenant domain. The tenant name is unique for the tenant, a tenant may have more than one domain name. 

:::image type="content" source="media/new-tenant-rule-in-allow-list.png" alt-text="New tenant rule appears in allow list":::

You can use "\*" as a special character to signify all tenants are allowed in the designated direction when tenant isolation is turned **On**. 

:::image type="content" source="media/new-tenant-rule-all-tenants.png" alt-text="All tenants are allowed in the designated direction when tenant isolation is turned on":::

You can edit the direction of the tenant allow list entry based on business requirements. Note that **Tenant Domain or ID** field can't be edited in the **Edit tenant rule** page. 

:::image type="content" source="media/edit-tenant-rule.png" alt-text="Edit a tenant rule":::

You can perform all the allow list operations like add, edit, and delete while tenant isolation is turned **On** or **Off**. Allow list entries do have an effect on the connection behavior when tenant isolation is turned **Off** since all cross-tenant connections are allowed. 

## Design time impact on apps and flows

Users who create or edit a resource affected by the tenant isolation policy will see a related error message. For example, Power Apps makers will see the following error when they use cross-tenant connections in an app that is blocked by tenant isolation policies. The app won't add the connection.

:::image type="content" source="media/cross-tenant-error-one.png" alt-text="Error: The data did not load correctly. Please try again.":::

Similarly, Power Automate makers will see the following error when they try to save a flow that uses connections in a flow that is blocked by tenant isolation policies. The flow itself will be saved, but it will be marked as "Suspended" and won't be executed unless the maker resolves the DLP violation. 

:::image type="content" source="media/cross-tenant-error-two.png" alt-text="Error: Could not retrieve values. The dynamic invocation request failed with error - error text":::

As an admin, you can decide to modify the tenant isolation policies for your tenant at any point. If apps and flows were created and executed in compliance with earlier tenant isolation policies policy, some of them might be negatively affected by any policy changes you make. Apps or flows that are in violation of [need text].

For existing flows that don’t run successfully because of the latest tenant isolation policy, Run history within Power Automate indicates that the Flow run failed. 

:::image type="content" source="media/flow-run-history.png" alt-text="Flow run history list":::

Selecting the failed run will show details of the failed flow run.

:::image type="content" source="media/flow-run-failure-details.png" alt-text="Flow run failure details":::

> [!NOTE]
> It takes about an hour for the latest tenant isolation policy changes to be assessed against active apps and flows. 

## Known issues

- This feature does not protect your tenant from inbound cross-cloud connections. If a tenant has tenant isolation turned on, all outgoing connections are restricted. However, incoming connections that are established from other tenants in other clouds are not restricted. This issue is currently being investigated. 

- The feature is currently not available in Microsoft Dataverse services operated by 21Vianet.

<!--
With tenant restrictions, organizations can control access to SaaS cloud applications, based on the Azure AD tenant the applications use for single sign-on. With tenant restrictions, organizations can specify the list of tenants that their users are permitted to access. Azure AD then only grants access to these permitted tenants using Azure AD-based tenant restriction. 

Additionally, if organizations want to enforce tenant isolation for Microsoft Power Platform connections, then they can use Power Platform’s tenant isolation capability. Note that the Power Platform tenant isolation feature does not impact Azure AD-based access outside of Power Apps and Power Automate. Power Platform tenant isolation only works for connectors using Azure AD-based authentication such as Office 365 Outlook or SharePoint. If you want to block connectors that use external identity providers such as Microsoft account, Google, etc., you can [create a data loss prevention policy](create-dlp-policy.md) and classify the connector under the **Blocked** group.  

Power Platform tenant isolation ability is available with two options: one-way or two-way restriction.  

> [!NOTE]
> For now, this capability can be enabled for your tenant by opening a [support case](get-help-support.md) and providing the details of your tenant ID.  

## One-way tenant isolation (inbound connection restriction) 

One-way tenant isolation or inbound isolation will block connection establishment attempts to your tenant from other tenants. For example, as an admin of Contoso.com (tenant A), if you have enabled one-way tenant isolation then Azure AD-based Power Platform connection creation attempts from any other tenants like Fabrikam.com (tenant B) will fail.  

One-way tenant isolation restricts incoming connection attempts into your tenant, hence the term inbound connection restriction.  

|Connection creator tenant   |Connection sign-in tenant   |Access allowed?   |
|---------|---------|---------|
|A     | A        | Yes         |
|A (one-way data loss prevention policy enforced)     | B        | Yes         |
|B     | A (one-way data loss prevention policy enforced)         | No (inbound)        |
|B     | B        | Yes        |

![Restrict inbound cross-tenant access.](media/restrict-inbound-cross-tenant.png "Restrict inbound cross-tenant access")

## Two-way tenant isolation (inbound and outbound connection restriction) 

Like one-way tenant isolation, two-way tenant isolation will block connection establishment attempts to your tenant from other tenants. Additionally, two-way tenant isolation will also block connection establishment attempts from your tenant to other tenants. For example, as an admin of Contoso.com (tenant A), if you have enabled two-way tenant isolation then connection creation attempts from any other tenants like Fabrikam.com (tenant B) will fail. Additionally, Azure AD-based Power Platform connection creation attempts from Contoso.com (tenant A) to any other tenants like Fabrikam.com (tenant B) will fail.  

Two-way tenant isolation restricts incoming connection attempts into your tenant, hence the term inbound connection restriction. Two-way tenant isolation also restricts outgoing connection attempts from your tenant, hence the term outbound connection restriction. 

|Connection creator tenant   |Connection sign-in tenant   |Access allowed?   |
|---------|---------|---------|
|A     | A        | Yes         |
|A (two-way data loss prevention policy enforced)     | B        | No (outbound)         |
|B     | A (two-way data loss prevention policy enforced)         | No (inbound)        |
|B     | B        | Yes        |

![Restrict outbound and inbound cross-tenant access.](media/restrict-outbound-inbound-cross-tenant.png "Restrict outbound and inbound cross-tenant access")

## Known issue
This feature does not protect your tenant from inbound cross-cloud connections. If a tenant has tenant isolation turned on, all outgoing connections are restricted. However, incoming connections that are established from other tenants in other clouds are not restricted. This issue is currently being investigated.
-->


[!INCLUDE[footer-include](../includes/footer-banner.md)]
