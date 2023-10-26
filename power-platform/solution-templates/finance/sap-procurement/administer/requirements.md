---
title: Requirements to integrate SAP with Power Platform
description: Learn about and access what's required to successfully integrate SAP with Microsoft Power Platform. 
author: jongilman88
ms.author: jongilman
contributors:
  - EllenWehrle
  - tverhasselt
  - galitskyd
  - microsoft-dustin
  - ryanb58
  - scottwoodallmsft
  - Wrighttyler
ms.reviewer: ellenwehrle
ms.topic: conceptual
ms.date: 10/26/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Requirements to integrate SAP with Power Platform

Review the requirements, identify opportunities, and develop a plan of action that best suits your organization's needs.

## Power Platform licensing

Review [Power Platform licensing](/power-platform/admin/pricing-billing-skus) and ensure your organization has what it needs to proceed with an SAP + Power Platform project. Keep the following in mind:

- Power Apps, Power Automate, and Power BI premium [licensing](https://www.microsoft.com/licensing/default) supports setting up and using an on-premises data gateway with premium applications, flows, and connectors (SAP ERP and Dataverse).
- The admins, developers, and functional business users who work with SAP solutions all need standalone licenses.
- The admin who's setting up the on-premises data gateway needs a [Power BI license](/power-bi/fundamentals/service-features-license-type).
- [Managed Environments](/power-platform/admin/managed-environment-licensing) is included in premium standalone licensing but is not included in the [Developer Plan](/power-platform/developer/plan).
- Admins can now [view Power Apps and Power Automate consumption](/power-platform/admin/view-license-consumption-issues) in the Power Platform admin center (Note: this is a preview feature gradually being rolled out to different regions).

## SAP subscription

Work with an SAP administrator to review your existing [SAP](<https://www.sap.com/>) subscription. Keep the following in mind:
  
- The SAP ERP connector can work with any SAP system that uses RFC and BAPI calls.
- An administrator who has valid S-User access to the SAP system(s) is required to assist through the integration process. The S-User is an SAP super administrator and has all the authorizations for the portal and can manage other necessary SAP roles as necessary.
- SAP server and user accounts need to be set up to allow actions.

## Windows Virtual Machine

Create a [Windows Virtual Machine (VM)](https://azure.microsoft.com/products/virtual-machines/#overview) or provision a server specifically for hosting the on-premises data gateway for SAP integration with Power Platform and ensure that:

- It meets the [recommended requirements](/data-integration/gateway/service-gateway-install#recommended) for gateway installation and management.
- You review [related considerations](/data-integration/gateway/service-gateway-install#related-considerations). For instance, if you're planning to use Windows authentication, make certain that you install the gateway on a computer that's a member of the same Microsoft Entra ID (Azure AD) environment as the data source.

## On-premises data gateway

Set up an [on-premises data gateway](/data-integration/gateway/) installed on the Windows VM or provisioned server by an Entra ID (Azure AD) Global or Gateway (default user permission for anyone performing the install) admin working with an SAP super admin (S-User). Be sure to:

- Review [on-premises data gateway management](/power-platform/admin/onpremises-data-gateway-management) for Power Platform to learn more.
- Go to the [Microsoft Download Center's on-premises data gateway page](https://www.microsoft.com/download/details.aspx?id=53127) and download the most recent version (December 16, 2022 or newer) of the gateway to connect to [Azure Logic Apps](/azure/logic-apps/logic-apps-gateway-install), [Power Apps](/power-apps/maker/canvas-apps/gateway-reference), and [Power Automate](/power-automate/gateway-reference).
- Identify the operating systems and .NET Frameworks required to support the most recent version of the gateway in the _Systems Requirements_ section on the gateway download page.
- Download the [Microsoft .NET Framework.](https://dotnet.microsoft.com/download/dotnet-framework) that supports the most recent version of the gateway.
- Download the [Microsoft C++ Runtime DLLs version 14.x](/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2015-2017-2019-and-2022) library (or later). The SAP's NCo 3.1 download requires this library to support the .NET Framework.
- Go to [SAP Connector for Microsoft .NET](https://support.sap.com/en/product/connectors/msnet.html) where you'll find SAP links to documentation, support, and downloads. Download the .NET 3.1 (NCo 3.1) SDK from SAP:
  - Ensure an SAP admin with valid S-User access is available to download and set up the connector.
  - Select the **SAP Connector for Microsoft .NET 3.1.3.0 for Windows 64 bit (x64), July 19, 2023 (ZIP archive, 35,121 KB)** link located in the _NCo 3.1 - compiled with .NET Framework 4.6.2_ section.

> [!IMPORTANT]
>
> - NCo 3.1 works with .NET Framework releases 4.6.2 to 4.8.1. Download the most recent .NET Framework listed in the _Systems Requirements_ section of the gateway download page.
> - NCo 3.0 will no longer be supported by SAP after October 31, 2023.

## Admin centers

You or someone on your team need to have Global or system admin privileges to several different admin centers so you can configure and manage various components and users.

- [Microsoft 365 admin center](<https://admin.microsoft.com/>). Work with a [Microsoft 365 Global admin](/microsoft-365/admin/add-users/about-admin-roles) if you need to:

  - Update licenses, subscriptions, and services.
  - Assign high-level admin roles to your team members, such as Entra Global admin.

- [Microsoft Entra admin center](<https://entra.microsoft.com/>). As an [Entra Global admin](/entra/identity/role-based-access-control/permissions-reference#global-administrator), you need to:

  - Access [Microsoft Entra ID (Azure AD)](https://entra.microsoft.com/#view/Microsoft_AAD_IAM/TenantOverview.ReactView) from the Microsoft Entra admin center.
  - Set up a new [tenant](/entra/identity-platform/quickstart-create-new-tenant) or reconfigure an existing tenant. The tenant will need to have at least 1 GB of database storage capacity available for the environments within it.
  - Set up additional [Entra ID (Azure AD) admin roles](/entra/identity/role-based-access-control/permissions-reference#global-administrator).
  - Set up [Entra ID (Azure AD) single sign-on (SSO) for gateway](/fabric/admin/service-admin-portal-integration#azure-ad-single-sign-on-sso-for-gateway) having constrained delegation to support SSO.
  - Create [security groups](/configure-security-groups.md) within the Entra ID (Azure AD) tenant created to support conditional access to solution components.

- [Power Platform admin center](https://admin.powerplatform.microsoft.com/). As a Global admin or Power Platform System admin, you need to:
  - Set up the admin center's [management and admin connectors](/power-platform/admin/wp-management-monitoring).
  - Configure the [admin center](/power-platform/admin/wp-work-with-admin-portals) so Power Platform admins can [manage](/power-platform/admin/governance-considerations#faq---what-permissions-exist-at-an-azure-ad-tenant-level) gateways, tenants, environments and user access.
  - Assign specified users Power Platform admin roles so they can monitor and manage in the admin center.

## Related content

[Overview of the Microsoft 365 admin center](/microsoft-365/admin/admin-overview/admin-center-overview)

[Microsoft Entra ID documentation](/entra/identity/)

[Administer Power Platform](/power-platform/admin/)

[SAP Identity and Access Management (IAM) Help Portal](https://help.sap.com/docs/btp/sap-business-technology-platform/identity-and-access-management-iam)

[Updated SAP connector for .NET support in on-premises data gateway](https://powerautomate.microsoft.com/blog/updated-sap-connector-for-net-support-in-on-premises-data-gateway/)
  
### Next steps

[Set up environments and data policies](set-up-environments-data-policies.md)

### See also

[Frequently asked questions about integrating SAP with Power Platform](/faqs.md)
