---
title: Power Apps operated by 21Vianet and Power Automate operated by 21Vianet 
description: Power Apps operated by 21Vianet and Power Automate operated by 21Vianet
author: sericks007
ms.component: pa-admin
ms.topic: concept-article
ms.date: 12/02/2024
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
contributors:
  - JesseParsons
ms.contributors:
  - olegov
  - aleahy
  - iyanni
  - pvayner
---
# Power Apps operated by 21Vianet and Power Automate operated by 21Vianet

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

## Overview

Microsoft Dynamics 365 (Dynamics 365 Customer Service, Dynamics 365 Sales, Dynamics 365 Field Service, Dynamics 365 Finance, Dynamics 365 Supply Chain Management,and Dynamics 365 Project Operations) and Microsoft Power Platform (Microsoft Power BI, Power BI Premium, Power BI Embedded, Power Apps, and Power Automate) online services collectively known as “Business Applications” operated by 21Vianet are a physically separated instance of cloud services operated and transacted by a local operator, Shanghai Blue Cloud Technology Co., Ltd (“21Vianet”). This is a wholly owned subsidiary of Beijing 21Vianet Broadband Data Center Co., Ltd. located in China. These services are available to serve customers in regulated industries and commercial organizations that do business in China and require local data residency.

The deployment of the Business applications family of online services operated by 21Vianet in China is built on the foundational principles of security, privacy, compliance, transparency, and reliability, offering organizations a complete cloud infrastructure and platform, as well as familiar productivity and business application tools. This means that customer data is stored at rest within China except as noted in the [Trust Center](https://www.trustcenter.cn). 

Microsoft strives to maintain functional parity between our commercially available service and online services operated by 21Vianet in China. However, there are notable exceptions to this, which are affected by dependent service or partner-solution availability, market priorities, or compliance regulations.

For more information about these exceptions or for questions about service availability in China, contact [support](https://en.21vbluecloud.com/contact).

## Feature availability information 

Due to certain technical dependencies, the following features listed will not be available for general availability of Power Apps operated by 21Vianet and Power Automate operated by 21Vianet. For information about future feature availability, see [Business applications and platform release plans](/dynamics365/release-plans/).

### Dynamics 365 Project Operations operated by 21Vianet

The addition of a Lite deployment - deal to proforma invoicing of Dynamics 365 Project Operations operated by 21Vianet is generally available to new and existing customers in China. This service is designed to provide streamlined and efficient project management experience. 

The Lite deployment - deal to proforma invoicing of Project Operations is specifically designed for deal to proforma invoicing scenarios. It operates without project scheduling and utilizes Microsoft Project for the Web Sales process extending application experiences of Dynamics 365 Sales.
The features of this deployment include:

- Multi-dimensional pricing: This allows for flexible and comprehensive pricing strategies.
- Unified resource management: This ensures efficient allocation and utilization of resources.
- Time tracking: This feature allows for accurate recording and monitoring of time spent on tasks.
- Basic expense: This provides a simple and straightforward way to track and manage expenses.
- Proforma invoicing: This allows project managers to review and edit invoices before they are sent out.

### Power Apps operated by 21Vianet and Power Automate operated by 21Vianet

Access to Power Apps operated by 21Vianet and Power Automate operated by 21Vianet plans is restricted to the offerings described in the following section; each plan is offered as a monthly subscription and can be licensed to an unlimited number of users:

- Power Apps per app plan
- Power Apps plan
- Power Apps and Flow capacity
- Power Automate per business process plan
- Power Automate plan

In addition to the standalone plans, Power Automate and Power Apps capabilities are also included in certain Microsoft 365 and Dynamics 365 plans allowing customers to extend and customize Microsoft 365 and Dynamics 365 with Power Automate and Power Apps capabilities. This functionality will be enabled in a quarter following general availability of standalone plans.

Power Apps and Power Automate include several features that allow users to connect to and work with other Microsoft enterprise service offerings such as Microsoft 365, Dynamics 365, and Power Apps. Power Apps and Power Automate within datacenters exist in a manner consistent with a multitenant, public cloud deployment model. Power Automate operated by 21Vianet utilizes the Microsoft 365 customer administrator User Interface for customer administration and billing.

Power Apps and Power Automate maintain the actual resources, information flow, and data management, while relying on Microsoft 365 to provide the visual styles that are presented to the customer administrator through their management console. 

Power Apps and Power Automate will not have the ability to integrate third-party applications into the service through [Connectors](/connectors). 

### Power Apps operated by 21Vianet and Power Automate operated by 21Vianet

When a user of an organization employing Active Directory Federation Services (AD FS) attempts to access Power Automate, the user is redirected to a login page hosted on the organization’s AD FS server. The user provides credentials to their organization's AD FS server. The organization's AD FS server attempts to authenticate the credentials using the organization’s Microsoft Entra infrastructure. If authentication is successful, the organization’s AD FS server issues a SAML (Security Assertion Markup Language) ticket that contains information about the user’s identity and group membership.

The customer’s AD FS server signs this ticket using one half of an asymmetric key pair and then it sends the ticket to Microsoft Entra via encrypted Transport Layer Security (TLS). Microsoft Entra ID validates the signature using the other half of the asymmetric key pair and then geo-redundant storage (GRS) access based on the ticket. The user's identity and group membership information remain encrypted in Microsoft Entra ID. In other words, only limited user-identifiable information is stored in Microsoft Entra ID. You can find full details of the Microsoft Entra security architecture and control implementation in [Azure self-service password (SSP)](/azure/active-directory/authentication/concept-sspr-howitworks).

The Microsoft Entra account management services are hosted on physical servers managed by the Microsoft Global Foundation Services (GFS). Network access to these servers is controlled by GFS-managed network devices using rules set by Azure. Users do not interact directly with Microsoft Entra ID.

#### Power Automate features not available 

- [AI Builder](/ai-builder/), a separate add-on offering for Microsoft Power Platform.
- [Power Automate mobile application](/power-automate/mobile-manage-flows).
- [Connectors](/connectors/connector-reference/connector-reference-powerautomate-connectors): The most popular connectors in use in our commercial service (based on usage telemetry) have been published; if there is a connector available in the commercial offering that you do not see deployed, please contact [support](https://en.21vbluecloud.com/contact), and we will review your request.


#### Power Apps features not available

- Embed in [Microsoft Teams](https://powerapps.microsoft.com/blog/powerapps-teams/) as Microsoft Teams is not yet available in China.
- [Integrate data into Microsoft Dataverse](./data-integrator.md)
- [Export to Azure Data Lake (aka Athena)](/powerapps/maker/common-data-service/export-to-data-lake)
- [Dual-write from Dataverse to Dynamics 365 finance and operations apps](https://powerapps.microsoft.com/blog/announcing-dual-write-preview/)
- [Dataverse analytics](./analytics-common-data-service.md) 
- [AI Builder](/ai-builder/), a separate add-on offering for Microsoft Power Platform.
- [Connectors](/connectors/connector-reference/): The most popular connectors in use in our commercial service (based on usage telemetry) have been published; if there is a connector available in the commercial offering that you do not see deployed, please contact support, and we will review your request. 

## Additional resources

- [Legal terms landing page](https://www.21vbluecloud.com/powerplatform/pp-legal/)
- [Online Services Terms (世纪互联在线服务的服务级别协议)](https://www.21vbluecloud.com/ostpt/)
- [Service Level Agreement](https://www.21vbluecloud.com/powerplatform/pp-sla/)
- [Privacy statement](https://www.21vbluecloud.com/ostpt/)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
