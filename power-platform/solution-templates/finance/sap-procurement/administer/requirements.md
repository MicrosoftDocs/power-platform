---
title: Requirements to integrate SAP with Power Platform
description: Review requirements for setting up SAP integration with Microsoft Power Platform.
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
ms.topic: install-set-up-deploy
ms.date: 06/06/2023
ms.custom: bap-template
---

# Requirements to integrate SAP with Power Platform

Review all the requirements, identify opportunities, and develop a plan of action that best suits your organization's needs.

- [Power Platform licensing](/power-platform/admin/pricing-billing-skus). Determine if your organization has the necessary premium [licensing](https://www.microsoft.com/licensing/default) to proceed with the setup. It's important to consider:
  - Power Apps, Power Automate, and Power BI licensing that supports setting up and using an on-premises data gateway with premium applications, flows, and connectors (SAP ERP and Dataverse).
  - All admins, developers, and functional business users working with SAP solutions have the required licenses to do so.
    - A [Power BI license](/power-bi/fundamentals/service-features-license-type) is required for the admin who is setting up the on-premises data gateway.

- [SAP](<https://www.sap.com/>) subscription:
  
  - The SAP ERP connector can work with any SAP system that uses RFC and BAPI calls.
  - Setup requires an administrator who has valid S-User access to the SAP system(s). The S-User is an SAP super administrator and has all of the authorizations for the portal and can manage other necessary SAP roles as necessary.
  - SAP server and user accounts will need to be set up to allow actions.

- [Windows Virtual Machine (VM)](https://azure.microsoft.com/products/virtual-machines/#overview) or your own server. Create a Windows VM or provision a server specifically for hosting the on-premises data gateway for SAP integration with Power Platform.
  - Ensure it meets the [recommended requirements](/data-integration/gateway/service-gateway-install#recommended) for gateway installation and management.
  - Review other [related considerations](/data-integration/gateway/service-gateway-install#related-considerations).
  For instance, if you're planning to use Windows authentication, make certain that you install the gateway on a computer that's a member of the same active directory environment as the data source.
- [On-premises data gateway](/data-integration/gateway/). The gateway is to be installed on the newly created Windows VM or provisioned server by an Azure AD Global or Gateway (default user permission for anyone performing the install) admin working with an SAP Super admin (S-User).
  - Review [on-premises data gateway management](/power-platform/admin/onpremises-data-gateway-management) for Power Platform to learn more.
  - Go to the [Microsoft Download Center's on-premises data gateway page](https://www.microsoft.com/download/details.aspx?id=53127) and download the most recent version (December 16, 2022 or newer) of the gateway to connect to [Azure Logic Apps](/azure/logic-apps/logic-apps-gateway-install), [Power Apps](/power-apps/maker/canvas-apps/gateway-reference), and [Power Automate](/power-automate/gateway-reference).
    - In the _System Requirements_ section on the gateway download page, identify the operating systems and .NET Frameworks required to support the most recent version of the gateway.
- [Microsoft .NET Framework.](https://dotnet.microsoft.com/download/dotnet-framework) Download the .NET Framework that supports the most recent version of the gateway.
- [Microsoft C++ Runtime DLLs version 10.x (this version is contained in Microsoft Visual C++ 2010 Redistributables)](/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2010-vc-100-sp1-no-longer-supported&preserve-view=true). SAP's NCo 3.0 download requires this library to support the .NET Framework.
- [SAP Connector for Microsoft .NET 3.0 (NCo 3.0)](https://support.sap.com/en/product/connectors/msnet.html) SDK from SAP:
  - An SAP admin with valid S-User access is required to set up the connector.
  - Select **NCo 3.0 compiled with .NET Framework 4.0 - SAP Connector for Microsoft. NET 3.0.25.0 for Windows 64 bit (x64), July 20, 2022 (ZIP archive, 7,126 KB)**.

> [!IMPORTANT]
>
> - NCo 3.0 works with .NET Framework releases 4.0 or later. Download the most recent .NET Framework listed in the _Systems Requirements_ section of the gateway download page.
> - Don't download NCo 3.1. It's not supported yet.

- [Microsoft 365 admin center](<https://admin.microsoft.com/>). Work with a [Microsoft 365 Global admin](/microsoft-365/admin/add-users/about-admin-roles) if you need to:

  - Update licenses, subscriptions, and services.
  - Assign high-level admin roles to your team members, such as Azure AD Global admin.

- [Microsoft Entra admin center](<https://entra.microsoft.com/>). As an [Azure AD Global admin](/azure/active-directory/roles/permissions-reference#global-administrator), you need to:

  - Access [Azure Active Directory (AD)](/azure/active-directory/) from the Microsoft Entra admin center.
  - Set up a new [Azure AD tenant](/azure/active-directory/develop/quickstart-create-new-tenant) or reconfigure an existing tenant. The tenant will need to have at least 1 GB of database storage capacity available for the environments within it.
  - Set up additional [Azure AD admin roles](/azure/active-directory/roles/permissions-reference#global-administrator).
  - Set up [Azure AD single sign-on (SSO) for gateway](/power-bi/admin/service-admin-portal-integration#azure-ad-single-sign-on-sso-for-gateway) having constrained delegation to support SSO.
  - Create [Azure AD security groups](configure-security-groups.md#create-azure-active-directory-security-groups) within the Azure AD tenant created to support conditional access to solution components.

- [Power Platform admin center](https://admin.powerplatform.microsoft.com/). As a Global admin or Power Platform System admin, you need to:
  - Set up the admin center's [management and admin connectors](/power-platform/admin/wp-management-monitoring).
  - Configure the [admin center](/power-platform/admin/wp-work-with-admin-portals) so Power Platform admins can [manage](/power-platform/admin/governance-considerations#faq---what-permissions-exist-at-an-azure-ad-tenant-level) gateways, tenants, environments and user access.
  - Assign specified users Power Platform admin roles so they can monitor and manage in the admin center.

More information:

- [Overview of the Microsoft 365 admin center](/microsoft-365/admin/admin-overview/admin-center-overview)
- [Azure Active Directory documentation](/azure/active-directory/)
- [Administer Power Platform](/power-platform/admin/)
- [SAP Identity and Access Management (IAM) Help Portal](https://help.sap.com/docs/btp/sap-business-technology-platform/identity-and-access-management-iam)
  
## Next steps

- [Set up environments and data policies (preview)](set-up-environments-data-policies.md)
- [Set up on-premises date gateway for SAP](set-up-gateway.md)

### See also

- [Overview](../overview.md)
- [Microsoft Power Platform guidance documentation](/power-platform/guidance/)
- [Microsoft Power Platform Center of Excellence (COE) Starter Kit](/power-platform/guidance/coe/starter-kit)
