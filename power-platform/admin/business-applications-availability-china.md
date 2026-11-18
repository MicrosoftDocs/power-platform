---
title: Power Apps and Power Automate operated by 21Vianet 
description: Power Apps operated by 21Vianet and Power Automate operated by 21Vianet
author: EllenWehrle
ms.component: pa-admin
ms.topic: concept-article
ms.date: 11/10/2026
ms.subservice: admin
ms.author: ellenwehrle
ms.reviewer: ellenwehrle
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

# Power Apps and Power Automate operated by 21Vianet

## Overview

Microsoft Dynamics 365 (Dynamics 365 Customer Service, Dynamics 365 Sales, Dynamics 365 Field Service, Dynamics 365 Finance, Dynamics 365 Supply Chain Management, and Dynamics 365 Project Operations) and Microsoft Power Platform (Microsoft Power BI, Power BI Premium, Power BI Embedded, Power Apps, and Power Automate) online services, collectively known as "Business Applications," operated by 21Vianet are a physically separated instance of cloud services operated and transacted by a local operator, Shanghai Blue Cloud Technology Co., Ltd ("21Vianet"). This operator is a wholly owned subsidiary of Beijing 21Vianet Broadband Data Center Co., Ltd. located in China. These services are available to serve customers in regulated industries and commercial organizations that do business in China and require local data residency.

The deployment of the Business Applications family of online services operated by 21Vianet in China is built on the foundational principles of security, privacy, compliance, transparency, and reliability, offering organizations a complete cloud infrastructure and platform, as well as familiar productivity and business application tools. This means that customer data is stored at rest within China except as noted in the [Trust Center](https://www.trustcenter.cn). 

Microsoft strives to maintain functional parity between our commercially available service and online services operated by 21Vianet in China. However, notable exceptions exist. These exceptions are affected by dependent service or partner-solution availability, market priorities, or compliance regulations.

For more information about these exceptions or for questions about service availability in China, contact [support](https://en.21vbluecloud.com/contact).

## Feature availability information 

Due to certain technical dependencies, the following features aren't available for general availability in Power Apps operated by 21Vianet and Power Automate operated by 21Vianet. For information about future feature availability, see [Microsoft Copilot Roadmap](https://aka.ms/roadmap).

### Dynamics 365 Project Operations operated by 21Vianet

The addition of a Lite deployment - deal to proforma invoicing of Dynamics 365 Project Operations operated by 21Vianet is generally available to new and existing customers in China. This service is designed to provide streamlined and efficient project management experience. 

The Lite deployment - deal to proforma invoicing of Project Operations is specifically designed for deal to proforma invoicing scenarios. It operates without project scheduling and utilizes Microsoft Project for the Web Sales process extending application experiences of Dynamics 365 Sales.
The features of this deployment include:

- Multi-dimensional pricing: This feature allows for flexible and comprehensive pricing strategies.
- Unified resource management: This feature ensures efficient allocation and utilization of resources.
- Time tracking: This feature allows for accurate recording and monitoring of time spent on tasks.
- Basic expense: This feature provides a simple and straightforward way to track and manage expenses.
- Proforma invoicing: This feature allows project managers to review and edit invoices before they are sent out.

### Power Apps operated by 21Vianet and Power Automate operated by 21Vianet

You can access Power Apps operated by 21Vianet and Power Automate operated by 21Vianet plans through the offerings described in the following section. Each plan is offered as a monthly subscription and you can license it to an unlimited number of users:

- Power Apps per app plan
- Power Apps plan
- Power Apps and Flow capacity
- Power Automate per business process plan
- Power Automate plan

In addition to the standalone plans, certain Microsoft 365 and Dynamics 365 plans include Power Automate and Power Apps capabilities. By using these plans, you can extend and customize Microsoft 365 and Dynamics 365 with Power Automate and Power Apps capabilities. This functionality will be enabled in a quarter following general availability of standalone plans.

Power Apps and Power Automate include several features that allow users to connect to and work with other Microsoft enterprise service offerings such as Microsoft 365, Dynamics 365, and Power Apps. Power Apps and Power Automate within datacenters exist in a manner consistent with a multitenant, public cloud deployment model. Power Automate operated by 21Vianet utilizes the Microsoft 365 customer administrator user interface for customer administration and billing.

Power Apps and Power Automate maintain the actual resources, information flow, and data management, while relying on Microsoft 365 to provide the visual styles that are presented to the customer administrator through their management console. 

Power Apps and Power Automate don't have the ability to integrate third-party applications into the service through [Connectors](/connectors).

### Power Apps operated by 21Vianet and Power Automate operated by 21Vianet

When a user in an organization that uses Active Directory Federation Services (AD FS) tries to access Power Automate, the user is redirected to a sign-in page that the organization hosts on its AD FS server. The user provides credentials to the organization's AD FS server. The organization's AD FS server tries to authenticate the credentials by using the organization's Microsoft Entra infrastructure. If authentication succeeds, the organization's AD FS server issues a SAML (Security Assertion Markup Language) ticket that contains information about the user's identity and group membership.

The customer's AD FS server signs this ticket by using one half of an asymmetric key pair and then sends the ticket to Microsoft Entra through encrypted Transport Layer Security (TLS). Microsoft Entra ID validates the signature by using the other half of the asymmetric key pair and then grants geo-redundant storage (GRS) access based on the ticket. The user's identity and group membership information stay encrypted in Microsoft Entra ID. In other words, Microsoft Entra ID stores only limited user-identifiable information. For full details about the Microsoft Entra security architecture and control implementation, see [Azure self-service password (SSP)](/azure/active-directory/authentication/concept-sspr-howitworks).

The Microsoft Entra account management services run on physical servers that the Microsoft Global Foundation Services (GFS) manages. GFS-managed network devices control network access to these servers by using rules set by Azure. Users don't interact directly with Microsoft Entra ID.

#### Power Automate features that aren't available 

- [AI Builder](/ai-builder/), a separate add-on offering for Microsoft Power Platform.
- [Power Automate mobile application](/power-automate/mobile-manage-flows).
- [Connectors](/connectors/connector-reference/connector-reference-powerautomate-connectors): The service publishes the most popular connectors in use in the commercial service, based on usage telemetry. If there's a connector available in the commercial offering that you don't see deployed, contact [support](https://en.21vbluecloud.com/contact), and the support team reviews your request.


#### Power Apps features that aren't available

- Embed in [Microsoft Teams](https://powerapps.microsoft.com/blog/powerapps-teams/) as Microsoft Teams isn't yet available in China.
- [Integrate data into Microsoft Dataverse](./data-integrator.md)
- [Export to Azure Data Lake (aka Athena)](/powerapps/maker/common-data-service/export-to-data-lake)
- [Dual-write from Dataverse to Dynamics 365 finance and operations apps](https://powerapps.microsoft.com/blog/announcing-dual-write-preview/)
- [Dataverse analytics](./analytics-common-data-service.md) 
- [AI Builder](/ai-builder/), a separate add-on offering for Microsoft Power Platform.
- [Connectors](/connectors/connector-reference/): The service publishes the most popular connectors in use in the commercial service, based on usage telemetry. If there's a connector available in the commercial offering that you don't see deployed, contact support, and the support team reviews your request.

## Additional resources

- [Legal terms landing page](https://www.21vbluecloud.com/powerplatform/pp-legal/)
- [Online Services Terms (世纪互联在线服务的服务级别协议)](https://www.21vbluecloud.com/ostpt/)
- [Service Level Agreement](https://www.21vbluecloud.com/powerplatform/pp-sla/)
- [Privacy statement](https://www.21vbluecloud.com/ostpt/)
