---
title: "Business applications availability in China - operated by 21Vianet in China  | MicrosoftDocs"
description: Business applications availability in China - operated by 21Vianet in China
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/01/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Business applications availability in China - operated by 21Vianet in China 

## Overview

Microsoft Power BI, Microsoft Power BI Premium,  Microsoft Power BI Embedded, Microsoft Dynamics 365 Customer Service, Microsoft Dynamics 365 Sales, Microsoft Dynamics 365 Field Service, Microsoft Dynamics 365 Finance, and Microsoft Dynamics 365 Supply Chain Management online services operated by 21Vianet are already available in China. Microsoft Power Apps and Microsoft Power Automate are now available to serve customers in regulated industries and commercial organizations that do business with entities in China and require local data residency.  

Microsoft Dynamics 365 (Dynamics 365 Customer Service, Dynamics 365 Sales, Dynamics 365 Field Service Dynamics 365 Finance, and Dynamics 365 Supply Chain Management) and Microsoft Power Platform (Microsoft Power BI, Power BI Premium, and Power BI Embedded, Power Apps, and Power Automate) online services collectively known as “Business Applications” operated by 21Vianet are a physically separated instance of cloud services operated and transacted by a local operator, Shanghai Blue Cloud Technology Co., Ltd (“21Vianet”). This is a wholly owned subsidiary of Beijing 21Vianet Broadband Data Center Co., Ltd. located in mainland China.

The deployment of Business applications family of online services operated by 21Vianet in China are built on the foundational principles of security, privacy, compliance, transparency, and reliability, offering organizations a complete cloud infrastructure and platform, as well as familiar productivity and business application tools. This means that customer data is stored at rest within China except as noted in the [Trust Center](https://www.trustcenter.cn). 

Microsoft strives to maintain functional parity between our commercially available service and online services operated by 21Vianet in China. However, there are notable exceptions to this, which are affected by dependent service or partner-solution availability, market priorities, or compliance regulations.
For more information about these exceptions or for questions about service availability in China, contact [support](https://en.21vbluecloud.com/contact).

## Feature availability information 

Due to certain technical dependencies, the following features listed will not be available for general availability of the Power Apps operated by 21Vianet and Power Automate operated by 21Vianet. For information about future feature availability, see [Business applications and platform release plans](https://go.microsoft.com/fwlink/p/?linkid=2010158).

### Power Apps operated by 21Vianet and Power Automate operated by 21Vianet plans

Access to Power Apps operated by 21Vianet and Power Automate operated by 21Vianet plans is restricted to the offerings described in the following section; each plan is offered as a monthly subscription and can be licensed to an unlimited number of users:

- PowerApps per app plan
- PowerApps plan
- PowerApps and Flow capacity
- Power Automate per business process plan
- Power Automate plan

In addition to the standalone plans, Power Automate and Power Apps capabilities are also included in certain Office 365 and Dynamics 365 plans allowing customers to extend and customize Office 365 and Dynamics 365 with Power Automate and Power Apps capabilities. This functionality will be enabled in a quarter following general availability of standalone plans.

Power Apps and Power Automate includes several features that allow users to connect to, and work with, other Microsoft enterprise service offerings such as Office 365, Dynamics 365, and Power Apps. Power Apps and Power Automate within datacenters in a manner consistent with a multi-tenant, public cloud deployment model. Power Automate operated by 21Vianet utilizes the Office 365 customer administrator User Interface  for customer administration and billing.

Power Apps and Power Automate maintains the actual resources, information flow, and data management, while relying on Office 365 to provide the visual styles that are presented to the customer administrator through their management console. 

Power Apps and Power Automate will not have the ability to integrate third-party applications into the service through [Connectors](https://docs.microsoft.com/connectors). 

### Power Apps operated by 21Vianet and Power Automate operated by 21Vianet

When a user of an organization employing Azure Directory Federation Services (ADFS) attempts to access Power Automate, the user is redirected to a login page hosted on the organization’s ADFS server. The user provides credentials to their organization's ADFS server. The organization's ADFS server attempts to authenticate the credentials using the organization’s Azure Active Directory infrastructure. If authentication is successful, the organization’s ADFS server issues a SAML (Security Assertion Markup Language) ticket that contains information about the user’s identity and group membership.

The customer’s ADFS server signs this ticket using one half of an asymmetric key pair and then it sends the ticket to Azure AD via encrypted Transport Layer Security (TLS). Azure AD validates the signature using the other half of the asymmetric key pair and then geo-redundant storage (grs) access based on the ticket. The user's identity and group membership information remain encrypted in Azure AD. In other words, only limited user-identifiable information is stored in Azure AD. You can find full details of the Azure AD security architecture and control implementation in the [Azure self service password (SSP)](https://docs.microsoft.com/azure/active-directory/authentication/concept-sspr-howitworks).

The Azure AD account management services are hosted on physical servers managed by the Microsoft Global Foundation Services (GFS). Network access to these servers is controlled by GFS-managed network devices using rules set by Azure. Users do not interact directly with Azure AD.

#### Power Automate Features not available:

- [UI Flows (Planned for end of calendar year)](https://docs.microsoft.com/power-automate/ui-flows/overview)
- [AI Builder](https://docs.microsoft.com/ai-builder/), a separate add-on offering for Power Platform.
- [Power Automate Mobile Application](https://docs.microsoft.com/flow/mobile-manage-flows)
- [Submitting Templates](https://docs.microsoft.com/flow/publish-a-template)
- [Connectors](https://docs.microsoft.com/connectors/connector-reference/): The most popular connectors in use in our commercial service (based on usage telemetry) have been published; if there is a connector available in the commercial offering that you do not see deployed, please contact [support](https://en.21vbluecloud.com/contact), and we will review your request.

#### Power Apps Feature not available:

- Embed in [Microsoft Teams](https://powerapps.microsoft.com/blog/powerapps-teams/) as Microsoft Teams is not yet available in China
- [Power Apps Solution Checker [Planned for end of calendar year 2020]](https://docs.microsoft.com/powerapps/maker/common-data-service/use-powerapps-checker)
- [Power Query (Planned for end of calendar year 2020)](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-cds-newentity-pq)
- [Dataflows in Power Apps [Planned for end in the calendar year 2020]](https://docs.microsoft.com/powerapps/maker/common-data-service/create-and-use-dataflows)
- [Integrate data into Common Data Service](https://docs.microsoft.com/power-platform/admin/data-integrator)
- [Export to Azure Data lake (aka Athena)](https://docs.microsoft.com/powerapps/maker/common-data-service/export-to-data-lake)
- [Dual-write from Common Data Service to Dynamics 365 Finance and Operations apps](https://powerapps.microsoft.com/blog/announcing-dual-write-preview/)
- [Common Data Service analytics (Planned for end in the calendar year 2020)](https://docs.microsoft.com/power-platform/admin/analytics-common-data-service)
- [AI Builder](https://docs.microsoft.com/ai-builder/), a separate add-on offering for Power Platform.
- [Connectors](https://docs.microsoft.com/connectors/connector-reference/): The most popular connectors in use in our commercial service (based on usage telemetry) have been published; if there is a connector available in the commercial offering that you do not see deployed, please contact support, and we will review your request. 

## Additional resources
- [Legal terms landing page](https://www.21vbluecloud.com/powerplatform/pp-legal/)
- [Online Services Terms (世纪互联在线服务的服务级别协议)](https://www.21vbluecloud.com/ostpt/)
- [Service Level Agreement](https://www.21vbluecloud.com/powerplatform/pp-sla/)
- [Privacy statement](https://www.21vbluecloud.com/powerplatform/pp-privacy/)

