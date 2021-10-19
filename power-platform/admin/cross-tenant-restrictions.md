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

The default configuration in Power Platform with Tenant Isolation **Off** is to allow cross-tenant connections to be established seamlessly, if the user from tenant A establishing the connection to tenant B presents appropriate Azure AD credentials. If admins want to allow only a select set of tenants to establish connections to or from their tenant, they can turn Tenant Isolation **On**. 

Once tenant isolation is turned on, inbound (connections to the tenant from external tenants) as well as outbound (connections from the tenant to external tenants) cross-tenant connections are blocked by Power Platform even if the user presents valid credentials to the Azure AD-secured data source.  

Admins can specify an explicit allow list of tenants that they want to enable inbound, outbound, or both inbound and outbound which will bypass tenant isolation controls when configured. Admins can use a special pattern “\*”  to allow *all* tenants in a specific direction when tenant isolation is turned on. All other cross-tenant connections except the ones in the allow list are rejected by Power Platform. 

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
